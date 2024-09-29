# RESTful API

Elasticsearch cung cấp một API RESTful mạnh mẽ, cho phép tương tác với cụm Elasticsearch để quản lý dữ liệu, thực hiện tìm kiếm, tổng hợp (aggregation), và nhiều thao tác khác. API này chủ yếu sử dụng giao thức HTTP với các phương thức phổ biến như `GET`, `POST`, `PUT`, `DELETE`, và `HEAD`. Dữ liệu thường được trao đổi qua định dạng JSON.

## Tổng quan về API

**HTTP Methods**:
  - `GET`: Truy vấn dữ liệu từ Elasticsearch.
  - `POST`: Tạo tài liệu mới hoặc thực hiện các thao tác phức tạp (vd: tìm kiếm).
  - `PUT`: Cập nhật hoặc thay thế dữ liệu trong Elasticsearch.
  - `DELETE`: Xóa dữ liệu hoặc chỉ mục.
  - `HEAD`: Kiểm tra sự tồn tại của chỉ mục hoặc tài liệu.

**Base URL**: Mặc định, Elasticsearch sẽ chạy trên localhost với cổng `9200`. Do đó, đường dẫn API thường có dạng:

```sh
http://localhost:9200
```

## Index APIs

### 1. Tạo một chỉ mục (Create an Index)

Request
  - Method: `PUT`
  - Endpoint: /index_name
  - Description: Tạo một chỉ mục mới trong Elasticsearch.

```bash
`PUT` /my-index
```

Response
```json
{
  "acknowledged": true,
  "shards_acknowledged": true,
  "index": "my-index"
}
```

### 2. Xóa chỉ mục (`DELETE` an Index)

Request

- Method: `DELETE`
- Endpoint: /index_name
- Description: Xóa chỉ mục đã tồn tại trong Elasticsearch.

```bash
`DELETE` /my-index
```

Response

```json
{
  "acknowledged": true
}
```

### 3. Kiểm tra sự tồn tại của một chỉ mục (Check if an Index Exists)

Request

- Method: `HEAD`
- Endpoint: /index_name
- Description: Kiểm tra xem chỉ mục có tồn tại hay không.

```bash
`HEAD` /my-index
```

Response
- 200 nếu chỉ mục tồn tại.
- 404 nếu chỉ mục không tồn tại.

## Document APIs

### 1. Thêm tài liệu vào chỉ mục (Index a Document)

Request

- Method: `POST`
- Endpoint: /index_name/_doc/
- Description: Thêm một tài liệu vào chỉ mục.

```bash
`POST` /my-index/_doc/
{
  "first_name": "John",
  "last_name": "Doe",
  "age": 30,
  "email": "john.doe@example.com"
}
```

Response

```json
{
  "_index": "my-index",
  "_id": "1",
  "_version": 1,
  "result": "created",
  "_shards": {
    "total": 2,
    "successful": 1,
    "failed": 0
  }
}
```

### 2. Lấy tài liệu (`GET` a Document)

Request

- Method: `GET`
- Endpoint: /index_name/_doc/document_id
- Description: Truy vấn một tài liệu từ chỉ mục bằng ID của tài liệu.

```bash
`GET` /my-index/_doc/1
```

Response

```json
{
  "_index": "my-index",
  "_id": "1",
  "_version": 1,
  "_source": {
    "first_name": "John",
    "last_name": "Doe",
    "age": 30,
    "email": "john.doe@example.com"
  }
}
```

### 3. Cập nhật tài liệu (Update a Document)

Request

- Method: `POST` hoặc `PUT`
- Endpoint: /index_name/_update/document_id
- Description: Cập nhật một tài liệu đã tồn tại.

```bash
`POST` /my-index/_update/1
{
  "doc": {
    "age": 31
  }
}
```

Response

```json
{
  "_index": "my-index",
  "_id": "1",
  "_version": 2,
  "result": "updated",
  "_shards": {
    "total": 2,
    "successful": 1,
    "failed": 0
  }
}
```

### 4. Xóa tài liệu (`DELETE` a Document)

Request

- Method: `DELETE`
- Endpoint: /index_name/_doc/document_id
- Description: Xóa tài liệu theo ID.

```bash
`DELETE` /my-index/_doc/1
```

Response

```json
{
  "_index": "my-index",
  "_id": "1",
  "_version": 2,
  "result": "`delete`d",
  "_shards": {
    "total": 2,
    "successful": 1,
    "failed": 0
  }
}
```

## Search APIs

### 1. Tìm kiếm tài liệu cơ bản (Basic Search)

Request

- Method: `GET` hoặc `POST`
- Endpoint: /index_name/_search
- Description: Tìm kiếm tài liệu dựa trên truy vấn.

```bash
`GET` /my-index/_search
{
  "query": {
    "match": {
      "first_name": "John"
    }
  }
}
```

Response

```json
{
  "took": 30,
  "timed_out": false,
  "_shards": {
    "total": 5,
    "successful": 5,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": {
      "value": 1,
      "relation": "eq"
    },
    "hits": [
      {
        "_index": "my-index",
        "_id": "1",
        "_source": {
          "first_name": "John",
          "last_name": "Doe",
          "age": 30,
          "email": "john.doe@example.com"
        }
      }
    ]
  }
}
```

### 2. Tìm kiếm bằng nhiều điều kiện (Search with Multiple Criteria)

Request

- Method: `GET` hoặc `POST`
- Endpoint: /index_name/_search
- Description: Tìm kiếm tài liệu với nhiều điều kiện, sử dụng bool query để kết hợp các điều kiện.

```bash
`GET` /my-index/_search
{
  "query": {
    "bool": {
      "must": [
        { "match": { "first_name": "John" } },
        { "match": { "age": 30 } }
      ]
    }
  }
}
```

Response

```json
{
  "took": 10,
  "timed_out": false,
  "_shards": {
    "total": 5,
    "successful": 5,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": {
      "value": 1,
      "relation": "eq"
    },
    "hits": [
      {
        "_index": "my-index",
        "_id": "1",
        "_source": {
          "first_name": "John",
          "last_name": "Doe",
          "age": 30,
          "email": "john.doe@example.com"
        }
      }
    ]
  }
}
```

## Aggregation APIs

### 1. Tổng hợp dữ liệu (Aggregation)

Request

- Method: `GET` hoặc `POST`
- Endpoint: /index_name/_search
- Description: Tổng hợp dữ liệu, ví dụ tính trung bình của một trường.

```bash
`GET` /my-index/_search
{
  "size": 0,
  "aggs": {
    "avg_age": {
      "avg": {
        "field": "age"
      }
    }
  }
}
```

Response

```json
{
  "took": 10,
  "timed_out": false,
  "_shards": {
    "total": 5,
    "successful": 5,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": {
      "value": 2,
      "relation": "eq"
    },
    "hits": []
  },
  "aggregations": {
    "avg_age": {
      "value": 30.5
    }
  }
}
```

## Bulk API

### 1. Nạp và cập nhật nhiều tài liệu (Bulk Indexing/Update)

Request

- Method: `POST`
- Endpoint: /index_name/_bulk
- Description: Thực hiện nhiều thao tác trên nhiều tài liệu chỉ trong một lần gọi API.

```bash
`POST` /my-index/_bulk
{ "index": { "_id": "1" } }
{ "first_name": "John", "last_name": "Doe", "age": 30 }
{ "index": { "_id": "2" } }
{ "first_name": "Jane", "last_name": "Smith", "age": 25 }
```

Response

```json
{
  "took": 20,
  "errors": false,
  "items": [
    {
      "index": {
        "_index": "my-index",
        "_id": "1",
        "result": "created"
      }
    },
    {
      "index": {
        "_index": "my-index",
        "_id": "2",
        "result": "created"
      }
    }
  ]
}
```

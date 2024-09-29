# Cài đặt và sử dụng Elasticsearch
Elasticsearch là một dịch vụ tìm kiếm và phân tích dữ liệu. Để bắt đầu sử dụng Elasticsearch, bạn cần một phiên bản Elasticsearch đang chạy. Có nhiều cách để triển khai Elasticsearch:

1. Tùy chọn khởi động nhanh:

    **Phát triển cục bộ**: Bạn có thể sử dụng Docker để thiết lập Elasticsearch trên máy tính cá nhân cho việc phát triển và thử nghiệm nhanh chóng.

2. Tùy chọn lưu trữ:

  - **Elastic Cloud Hosted**: Elasticsearch có thể được triển khai dưới dạng dịch vụ lưu trữ trên đám mây, có sẵn thông qua Elastic Cloud với thời gian dùng thử miễn phí 14 ngày.

  - **Elastic Cloud Serverless**: Tạo các dự án không có máy chủ cho việc triển khai Elasticsearch tự động mở rộng và được quản lý hoàn toàn.

3. Tùy chọn nâng cao:

  - **Self-managed**: Cài đặt và chạy Elasticsearch trên máy chủ của riêng bạn.
  - **Elastic Cloud Enterprise**: Triển khai Elastic Cloud trên đám mây công cộng, máy ảo hoặc tại cơ sở của bạn.
  - **Elastic Cloud on Kubernetes**: Triển khai Elastic Cloud trên Kubernetes.

# Indices, Documents, and Fields

Elasticsearch lưu trữ dữ liệu dưới dạng chỉ mục (index), tài liệu (document) và trường (field). Các khái niệm này là cốt lõi trong cấu trúc dữ liệu của Elasticsearch:

- **Index**: Đây là đơn vị lưu trữ cơ bản, nơi lưu trữ dữ liệu có chung đặc tính. Một chỉ mục là tập hợp các tài liệu, được xác định bằng tên hoặc bí danh duy nhất.

- **Document**: Một tài liệu là một tập hợp các trường (key-value pairs), mỗi tài liệu có ID duy nhất và có thể được lưu trữ dưới dạng JSON. Ví dụ:

```json
{
  "_index": "my-first-elasticsearch-index",
  "_id": "DyFpo5EBxE8fzbb95DOa",
  "_source": {
    "email": "john@smith.com",
    "first_name": "John",
    "last_name": "Smith",
    "info": {
      "bio": "Eco-warrior and defender of the weak",
      "age": 25,
      "interests": ["dolphins", "whales"]
    },
    "join_date": "2024/05/01"
  }
}
```

- **Metadata fields**: Elasticsearch lưu trữ các trường metadata, ví dụ như:
  - `_index`: Tên của chỉ mục nơi tài liệu được lưu trữ.
  - `_id`: ID duy nhất của tài liệu.

# Mappings and Data Types
Mapping (lược đồ) xác định cấu trúc dữ liệu trong chỉ mục. Bạn có thể chọn một trong hai cách:

1. **Dynamic mapping**: Elasticsearch tự động phát hiện kiểu dữ liệu và tạo mappings. Điều này giúp bắt đầu nhanh chóng nhưng có thể không tối ưu trong trường hợp phức tạp.
2. **Explicit mapping**: Bạn có thể định nghĩa lược đồ trước bằng cách chỉ định kiểu dữ liệu cho từng trường. Cách này phù hợp cho các trường hợp sản xuất.

## Ingest Data (Nạp dữ liệu vào Elasticsearch)

Bạn có nhiều cách để nạp dữ liệu vào Elasticsearch, tùy vào dữ liệu có dấu thời gian hay không.

1. **General content** (Dữ liệu không có dấu thời gian):
  - **API**: Sử dụng Document API của Elasticsearch để nạp dữ liệu thông qua Dev Tools hoặc cURL.
  - **File upload**: Dùng Kibana để tải file và lập chỉ mục dữ liệu.
  - **Web crawler**: Crawler thu thập nội dung trang web và nạp vào Elasticsearch.
  - **Connectors**: Đồng bộ dữ liệu từ các nguồn dữ liệu bên thứ ba.
2. **Timestamped data** (Dữ liệu có dấu thời gian):
  - **Elastic Agent and Fleet**: Tích hợp với Elastic Agent để nạp dữ liệu có dấu thời gian như log, metrics.
  - **Beats**: Thu thập dữ liệu từ các nguồn không được hỗ trợ bởi Elastic Agent.
  - **Logstash**: Một công cụ thu thập dữ liệu với khả năng xử lý real-time cho các nguồn dữ liệu phức tạp.

## Search and Analyze Data (Tìm kiếm và Phân tích Dữ liệu)

Elasticsearch hỗ trợ tìm kiếm và phân tích dữ liệu mạnh mẽ thông qua API và ngôn ngữ truy vấn (query languages).

1. **REST API**: Bạn có thể sử dụng REST API để quản lý cụm Elasticsearch và thực hiện tìm kiếm, phân tích dữ liệu.
2. **Query Languages**:
  - **Query DSL**: Ngôn ngữ truy vấn chính trong Elasticsearch. Nó hỗ trợ tìm kiếm phức tạp và tổng hợp (aggregations).
  - **ES|QL**: Một ngôn ngữ truy vấn mới cho phép lọc và phân tích dữ liệu, hỗ trợ mạnh cho dữ liệu theo chuỗi thời gian.
  - **EQL**: Ngôn ngữ truy vấn dành cho dữ liệu chuỗi sự kiện (event-based time series).
  - **Elasticsearch SQL**: Cung cấp cách truy vấn dữ liệu trong Elasticsearch bằng cú pháp SQL quen thuộc.
  - **KQL**: Ngôn ngữ truy vấn đơn giản dùng trong giao diện Kibana để lọc dữ liệu.

## Aggregations (Tổng hợp dữ liệu)
Elasticsearch hỗ trợ nhiều loại tổng hợp để phân tích dữ liệu:

  - **Metric aggregation**: Tính toán các số liệu như tổng (sum), trung bình (average).
  - **Bucket aggregation**: Gom nhóm dữ liệu thành các "bucket" dựa trên giá trị trường hoặc phạm vi.
  - **Pipeline aggregation**: Thực hiện tổng hợp trên kết quả của các tổng hợp khác.

# Plan for Production (Kế hoạch sản xuất)
Elasticsearch được thiết kế để luôn sẵn sàng và có khả năng mở rộng. Bạn có thể thêm nhiều máy chủ (node) vào một cụm (cluster) để tăng dung lượng và Elasticsearch sẽ tự động phân phối dữ liệu và truy vấn.

- **Shards**: Chỉ mục trong Elasticsearch được chia thành các shard (mảnh) nhỏ hơn. Mỗi tài liệu trong một chỉ mục thuộc về một primary shard và có thể có các replica shard để đảm bảo tính dự phòng và khả năng chịu lỗi.

## Disaster Recovery (Khôi phục thảm họa)

Elasticsearch hỗ trợ **Cross-cluster replication (CCR)**, cho phép tự động đồng bộ các chỉ mục từ cụm chính đến một cụm dự phòng. Điều này giúp duy trì hoạt động trong trường hợp lỗi phần cứng hoặc mất kết nối.

## Security, Management, and Monitoring

Elasticsearch tích hợp các công cụ để bảo mật, quản lý và giám sát cụm của bạn, giúp bạn quản lý toàn bộ hệ thống từ Kibana.

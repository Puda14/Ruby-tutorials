# Elasticsearch Rails

Elasticsearch Rails là một bộ thư viện giúp tích hợp Elasticsearch vào các ứng dụng Ruby và Ruby on Rails. Thư viện này bao gồm ba gem chính:

- **elasticsearch-model**: Tích hợp tìm kiếm cho các mô hình Ruby/Rails, chẳng hạn như ActiveRecord::Base và Mongoid.
- **elasticsearch-persistence**: Cung cấp một tầng lưu trữ dữ liệu (persistence layer) độc lập cho các đối tượng Ruby và mô hình.
- **elasticsearch-rails**: Cung cấp các tính năng tích hợp dành riêng cho các ứng dụng Ruby on Rails.

## Cài Đặt (Installation)

Để bắt đầu, bạn cần cài đặt các thư viện từ **Rubygems**:

```bash
gem install elasticsearch-model
gem install elasticsearch-rails
```

## Yêu Cầu Tương Thích (Compatibility)

- Thư viện tương thích với **Ruby 3.0 trở lên**.
- Phiên bản của các thư viện elasticsearch-rails tuân theo phiên bản Elasticsearch mà nó hỗ trợ, ví dụ:
  - 0.1 → 1.x của Elasticsearch
  - 8.x của Elasticsearch hiện tại

## Tích Hợp Cơ Bản với Rails và ActiveRecord

Dưới đây là ví dụ tích hợp Elasticsearch với một mô hình ActiveRecord trong Rails:

### 1. Tạo lớp Article tích hợp với Elasticsearch

```ruby
require "elasticsearch/model"

class Article < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
```

### 2. Tạo chỉ mục và nhập dữ liệu

```ruby
Article.__elasticsearch__.create_index!
Article.import
```

Lệnh này tạo ra chỉ mục trong Elasticsearch và nhập tất cả các bản ghi **Article** hiện có vào Elasticsearch.

### 3. Tìm kiếm tài liệu

```ruby
@articles = Article.search("foobar").records
```

Kết quả trả về sẽ là một tập hợp các bài viết có chứa từ khóa "foobar" trong cơ sở dữ liệu Elasticsearch.

## Thiết Lập Elasticsearch với Docker
Trước khi tích hợp với ứng dụng Rails, bạn cần có một cụm Elasticsearch đang chạy. Cách đơn giản nhất là sử dụng Docker:

```bash
docker run \
  --name elasticsearch-rails-searchapp \
  --publish 9200:9200 \
  --env "discovery.type=single-node" \
  --env "cluster.name=elasticsearch-rails" \
  --env "cluster.routing.allocation.disk.threshold_enabled=false" \
  --rm \
  docker.elastic.co/elasticsearch/elasticsearch:7.6.0
```

Lệnh này khởi chạy một container Elasticsearch trên cổng `9200`. Đây là cụm Elasticsearch mà ứng dụng của bạn sẽ sử dụng.

## Tạo Ứng Dụng Rails với Elasticsearch

Bạn có thể tạo một ứng dụng Ruby on Rails cơ bản đã được tích hợp với Elasticsearch bằng lệnh sau:

```bash
rails new searchapp --skip --skip-bundle --template https://raw.github.com/elasticsearch/elasticsearch-rails/main/elasticsearch-rails/lib/rails/templates/01-basic.rb
```

Lệnh này sẽ tạo ra một ứng dụng Rails đã có tích hợp sẵn với Elasticsearch.

## Sử Dụng Elasticsearch làm Repository cho Object Ruby

Ví dụ dưới đây cho thấy cách sử dụng Elasticsearch làm một lớp lưu trữ (repository) cho một đối tượng Ruby:

```ruby
class Article
  attr_accessor :title
end

require "elasticsearch/persistence"
repository = Elasticsearch::Persistence::Repository.new

repository.save Article.new(title: "Test")
```

Khi lưu một đối tượng `Article`, Elasticsearch sẽ gửi yêu cầu HTTP để lưu trữ dữ liệu như sau:

```bash
POST http://localhost:9200/repository/article
```

Kết quả trả về là thông tin về tài liệu vừa được lưu, bao gồm ID và chỉ mục.

## Các Công Cụ Hỗ Trợ

Elasticsearch Rails hỗ trợ một số tính năng tiện ích dành cho các ứng dụng Rails, bao gồm:

- **Repository pattern**: Lớp lưu trữ dữ liệu dựa trên các đối tượng Ruby.
- **Kaminari và WillPaginate**: Tích hợp sẵn phân trang cho kết quả tìm kiếm.
- **ActiveModel Integration**: Tích hợp với các framework mô hình dữ liệu như ActiveRecord và Mongoid.
- **Rake Tasks**: Hỗ trợ Rake tasks để nhập và xử lý dữ liệu.

## Phát Triển và Kiểm Tra (Development & Testing)

Nếu bạn muốn làm việc trên mã nguồn của thư viện `elasticsearch-rails`, bạn có thể clone repository và cài đặt các phụ thuộc:

```bash
git clone https://github.com/elastic/elasticsearch-rails.git
cd elasticsearch-rails/
bundle install
rake bundle:install
```

Bạn có thể chạy bộ kiểm thử (test suite) cho từng sub-project bằng cách sử dụng các lệnh Rake tương ứng trong thư mục con. Để kiểm tra toàn bộ dự án, bạn có thể sử dụng:

```bash
rake test:all
```

Lưu ý rằng bộ kiểm thử yêu cầu một cụm Elasticsearch đang chạy trên cổng `9250` và nó sẽ xóa toàn bộ dữ liệu trên cụm này.

## Giấy Phép

Dự án này được cấp phép theo giấy phép Apache 2.0, cho phép bạn sử dụng phần mềm này theo các điều khoản cụ thể. Bạn có thể tìm hiểu thêm về giấy phép này tại:

```bash
http://www.apache.org/licenses/LICENSE-2.0
```

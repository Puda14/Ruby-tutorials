# How Elasticsearch work

Elasticsearch là một công cụ tìm kiếm phân tán dựa trên Apache Lucene. Nó hoạt động bằng cách chia dữ liệu thành các khối (gọi là **shards**), lập chỉ mục và lưu trữ chúng dưới dạng các tài liệu có cấu trúc. Các tài liệu này có thể được tìm kiếm và phân tích một cách nhanh chóng và hiệu quả. Dưới đây là các thành phần và cơ chế chính của Elasticsearch:

1. **Lập chỉ mục (Indexing)**:
- Index trong Elasticsearch tương tự như một bảng trong cơ sở dữ liệu quan hệ. Nó là nơi chứa các tài liệu có cấu trúc.
- Khi dữ liệu được gửi đến Elasticsearch, nó sẽ được lập chỉ mục và lưu trữ dưới dạng các tài liệu JSON. Mỗi tài liệu chứa các trường (**fields**) đại diện cho các thuộc tính của dữ liệu.
- Elasticsearch sử dụng chỉ mục đảo ngược (inverted index) để tối ưu hóa cho việc tìm kiếm văn bản nhanh. Chỉ mục này giúp xác định vị trí của từ hoặc cụm từ cụ thể trong tập hợp dữ liệu lớn.

2. **Tìm kiếm (Search)**:
- Elasticsearch hỗ trợ các truy vấn tìm kiếm nhanh chóng và có khả năng mở rộng, bao gồm full-text search (tìm kiếm toàn văn), fuzzy search (tìm kiếm theo khái niệm gần đúng), và các truy vấn có điều kiện khác.
- Các tài liệu được tìm kiếm bằng cách sử dụng nhiều cơ chế như tokenization (phân tách từ), stemming (gốc từ), và synonyms (từ đồng nghĩa) để đảm bảo kết quả tìm kiếm có độ chính xác cao.
3. **Shards và Replicas**:
- **hards**: Elasticsearch tự động chia chỉ mục lớn thành nhiều shard để phân phối dữ liệu qua nhiều node trong cụm (cluster). Điều này giúp mở rộng quy mô và tăng khả năng chịu lỗi.
- **Replicas**: Mỗi shard có thể có nhiều bản sao (replica) để đảm bảo tính sẵn sàng và khả năng khôi phục dữ liệu nếu một node bị lỗi.
4. **Cluster và Nodes**:
- Cluster: Elasticsearch triển khai theo mô hình cụm (cluster), nơi mà nhiều máy chủ (nodes) có thể làm việc cùng nhau. Cụm Elasticsearch bao gồm một hoặc nhiều node để xử lý dữ liệu.
- Master Node: Điều phối hoạt động của toàn cụm, bao gồm phân phối shards và theo dõi trạng thái của cụm.
- Data Node: Chứa dữ liệu thực tế và thực hiện các hoạt động tìm kiếm và lập chỉ mục.
- Ingest Node: Thực hiện xử lý trước dữ liệu, như làm sạch hoặc định dạng lại dữ liệu trước khi lưu trữ vào chỉ mục.
- Coordinator Node: Nhận các truy vấn tìm kiếm và lập chỉ mục, sau đó phân phối công việc đến các node thích hợp.


### Kibana là gì?

**Kibana** là một công cụ trực quan hóa và phân tích dữ liệu đi kèm với Elasticsearch trong Elastic Stack. Kibana cho phép người dùng tương tác với dữ liệu lưu trữ trong Elasticsearch một cách trực quan, qua các công cụ như biểu đồ, đồ thị và dashboard.

- **Trực quan hóa**: Bạn có thể tạo các biểu đồ, đồ thị dạng thanh, bản đồ địa lý, và các hình thức biểu diễn dữ liệu khác dựa trên dữ liệu tìm thấy trong Elasticsearch.
- **Dashboard**: Kibana cung cấp các dashboard có thể tùy chỉnh, cho phép bạn theo dõi và hiển thị các chỉ số, logs, và các số liệu liên quan khác từ ứng dụng hoặc hệ thống của bạn.
- **Phân tích log và sự kiện**: Kibana giúp phân tích dữ liệu log và giám sát sự kiện trong thời gian thực.
- **KQL (Kibana Query Language)**: Kibana cung cấp một ngôn ngữ truy vấn dễ sử dụng để tìm kiếm và lọc dữ liệu trên nền tảng Elasticsearch.

Các thành phần khác trong hoạt động của Elasticsearch
Ngoài **Elasticsearch** và **Kibana**, **Elastic Stack** (còn gọi là ELK Stack) còn có các thành phần quan trọng khác:

### Logstash

Là một công cụ pipeline để thu thập, xử lý, và chuyển tiếp dữ liệu. Logstash nhận dữ liệu từ nhiều nguồn khác nhau, thực hiện các bước xử lý như lọc, biến đổi, và sau đó gửi dữ liệu đã xử lý đến Elasticsearch để lập chỉ mục.

**Data ingestion**: Nhận và xử lý dữ liệu log, sự kiện từ nhiều nguồn, sau đó chuyển đến Elasticsearch hoặc các điểm đích khác.

### Beats

Là một tập hợp các công cụ nhẹ (agents) dùng để thu thập dữ liệu từ nhiều nguồn khác nhau và gửi đến Logstash hoặc Elasticsearch. Ví dụ:

**Filebeat**: Thu thập log từ file.

**Metricbeat**: Thu thập số liệu từ các hệ thống và dịch vụ.

**Packetbeat**: Thu thập dữ liệu mạng.

**Dữ liệu nhẹ**: Beats cung cấp cách dễ dàng và nhẹ nhàng để thu thập và gửi dữ liệu đến Elastic Stack.


## Quy trình hoạt động của Elastic Stack
- **Thu thập dữ liệu**: **Beats** hoặc **Logstash** thu thập dữ liệu từ nhiều nguồn (hệ thống, dịch vụ, ứng dụng).

- **Xử lý dữ liệu**: **Logstash** thực hiện các bước xử lý dữ liệu, bao gồm lọc, biến đổi và làm sạch dữ liệu.

- **Lập chỉ mục**: **Elasticsearch** nhận dữ liệu đã xử lý và lưu trữ dưới dạng tài liệu JSON trong chỉ mục.

- **Tìm kiếm và phân tích**: Người dùng có thể truy vấn, tìm kiếm dữ liệu trong Elasticsearch và sử dụng **Kibana** để tạo biểu đồ, dashboard, và báo cáo trực quan.

- **Hiển thị dữ liệu**: **Kibana** cung cấp khả năng trực quan hóa dữ liệu với các công cụ đồ họa mạnh mẽ.

![image](https://i.imgur.com/t11iw1X.png)

Tóm lại, Elasticsearch là một nền tảng mạnh mẽ để tìm kiếm và phân tích dữ liệu, với khả năng mở rộng và tốc độ cao. Kibana là công cụ hỗ trợ hiển thị và phân tích dữ liệu từ Elasticsearch, trong khi Logstash và Beats đóng vai trò quan trọng trong việc thu thập và xử lý dữ liệu trước khi gửi vào Elasticsearch.

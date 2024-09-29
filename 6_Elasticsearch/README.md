# Elasticsearch

**Elasticsearch** là một công cụ tìm kiếm và phân tích phân tán, một kho dữ liệu có khả năng mở rộng và cơ sở dữ liệu vector, được xây dựng trên nền tảng Apache Lucene. Nó được tối ưu hóa cho tốc độ và tính liên quan trên các khối lượng công việc quy mô lớn. Elasticsearch cho phép bạn tìm kiếm, lập chỉ mục, lưu trữ và phân tích dữ liệu với nhiều hình thức và kích thước khác nhau trong thời gian gần thực.

Elasticsearch là trái tim của Elastic Stack. Khi kết hợp với Kibana, nó cung cấp sức mạnh cho các giải pháp Elastic như:

- Giám sát (Observability)
- Tìm kiếm (Search)
- Bảo mật (Security)

Elasticsearch có rất nhiều tính năng. Bạn có thể khám phá toàn bộ danh sách này trên trang web sản phẩm.

> **Elastic Stack là gì?**
>
> Elastic Stack là một bộ sản phẩm cho phép thu thập, lưu trữ, tìm kiếm và trực quan hóa dữ liệu, với Elasticsearch là thành phần cốt lõi. Tìm hiểu thêm về Elastic Stack để hiểu rõ hơn về cách thức hoạt động của bộ công cụ này.

## Các trường hợp sử dụng
Elasticsearch được sử dụng trong nhiều trường hợp khác nhau. Dưới đây là một vài ví dụ:

### Giám sát (Observability)
- Nhật ký, số liệu và truy vết: Thu thập, lưu trữ và phân tích nhật ký, số liệu và các truy vết từ ứng dụng, hệ thống và dịch vụ.
- Giám sát hiệu năng ứng dụng (APM): Giám sát và phân tích hiệu suất của các ứng dụng phần mềm quan trọng.
- Giám sát người dùng thực tế (RUM): Theo dõi và phân tích tương tác của người dùng với các ứng dụng web.
- OpenTelemetry: Tận dụng các công cụ đã có để gửi dữ liệu telemetry đến Elastic Stack thông qua tiêu chuẩn OpenTelemetry.

### Tìm kiếm (Search)
- Tìm kiếm toàn văn bản: Xây dựng giải pháp tìm kiếm toàn văn bản nhanh và chính xác bằng các chỉ mục đảo ngược, phân tích văn bản và quá trình token hóa.
- Cơ sở dữ liệu vector: Lưu trữ và tìm kiếm dữ liệu đã vector hóa, tạo vector embeddings với các mô hình xử lý ngôn ngữ tự nhiên -(NLP) tích hợp hoặc từ bên thứ ba.
- Tìm kiếm ngữ nghĩa: Hiểu ý định và ngữ cảnh phía sau các truy vấn tìm kiếm bằng cách sử dụng công cụ như từ đồng nghĩa, embeddings vector dày đặc, và mở rộng truy vấn-tài liệu.
- Tìm kiếm kết hợp: Kết hợp tìm kiếm toàn văn bản với tìm kiếm vector bằng các thuật toán xếp hạng tiên tiến.
- Xây dựng trải nghiệm tìm kiếm: Thêm các khả năng tìm kiếm kết hợp vào ứng dụng hoặc trang web, hoặc xây dựng các công cụ tìm kiếm cho doanh nghiệp từ các nguồn dữ liệu nội bộ.
- Truy xuất tăng cường (RAG): Sử dụng Elasticsearch làm công cụ truy xuất để hỗ trợ các mô hình AI tạo sinh (Generative AI) với dữ liệu có liên quan, cập nhật và thuộc về doanh nghiệp cho nhiều mục đích khác nhau.
- Tìm kiếm địa lý: Tìm kiếm địa điểm và tính toán mối quan hệ không gian bằng cách sử dụng các truy vấn địa lý.

### Bảo mật (Security)
- Quản lý thông tin và sự kiện bảo mật (SIEM): Thu thập, lưu trữ và phân tích dữ liệu bảo mật từ các ứng dụng, hệ thống và dịch vụ.
- Bảo mật điểm cuối: Giám sát và phân tích dữ liệu bảo mật từ các thiết bị đầu cuối.
- Săn tìm mối đe dọa: Tìm kiếm và phân tích dữ liệu để phát hiện và phản ứng với các mối đe dọa bảo mật.

Đây chỉ là một số ví dụ về các trường hợp sử dụng tìm kiếm, giám sát và bảo mật do Elasticsearch cung cấp. Bạn có thể tham khảo các câu chuyện thành công của khách hàng Elastic để có cái nhìn cụ thể hơn trong nhiều ngành công nghiệp khác nhau.

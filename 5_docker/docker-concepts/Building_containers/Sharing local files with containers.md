# Sharing local files with containers
Mỗi container có mọi thứ cần thiết để hoạt động mà không phụ thuộc vào các phụ thuộc đã cài đặt sẵn trên máy chủ. Vì container chạy trong môi trường cô lập, chúng có ảnh hưởng tối thiểu đến máy chủ và các container khác. Tuy nhiên, sự cô lập này cũng có nhược điểm: container không thể truy cập trực tiếp dữ liệu trên máy chủ mặc định.

Giả sử bạn có một container ứng dụng web cần truy cập vào các cài đặt cấu hình được lưu trữ trong tệp trên máy chủ. Tệp này có thể chứa dữ liệu nhạy cảm như thông tin đăng nhập cơ sở dữ liệu hoặc khóa API. Lưu trữ thông tin nhạy cảm này trực tiếp trong image của container gây rủi ro bảo mật, đặc biệt khi chia sẻ image. Để giải quyết vấn đề này, Docker cung cấp các tùy chọn lưu trữ để kết nối giữa dữ liệu của máy chủ và container.

Docker cung cấp hai tùy chọn lưu trữ chính để lưu trữ dữ liệu và chia sẻ tệp giữa máy chủ và container: volumes và bind mounts.

## Volume versus bind mounts

- `Volumes`: Nếu bạn muốn đảm bảo rằng dữ liệu được tạo hoặc chỉnh sửa trong container vẫn tồn tại sau khi container dừng chạy, bạn nên chọn volume. Xem thêm về Persisting container data để hiểu rõ hơn về volumes và các trường hợp sử dụng của chúng.

- `Bind mounts`: Nếu bạn có các tệp hoặc thư mục cụ thể trên hệ thống máy chủ mà bạn muốn chia sẻ trực tiếp với container, như tệp cấu hình hoặc mã nguồn phát triển, thì bind mount là lựa chọn phù hợp. Nó giống như việc mở một kênh kết nối trực tiếp giữa máy chủ và container để chia sẻ tệp. Bind mounts lý tưởng cho môi trường phát triển nơi cần truy cập và chia sẻ tệp theo thời gian thực giữa máy chủ và container.

## Sharing files between a host and container
Cả flag `-v` (hoặc `--volume`) và `--mount` khi sử dụng với lệnh `docker run` đều cho phép bạn chia sẻ tệp hoặc thư mục giữa máy chủ và container. Tuy nhiên, có một số khác biệt quan trọng trong cách sử dụng của chúng:

- `-v` flag: Đơn giản và tiện lợi hơn cho các hoạt động cơ bản liên quan đến volume hoặc bind mount. Nếu thư mục trên máy chủ không tồn tại khi sử dụng -v, Docker sẽ tự động tạo thư mục đó.
  ```sh
  docker run -v /HOST/PATH:/CONTAINER/PATH -it nginx
  ```
- `--mount` flag: Cung cấp các tính năng nâng cao và kiểm soát chi tiết hơn, phù hợp cho các trường hợp mount phức tạp hoặc môi trường triển khai sản xuất. Khi bạn sử dụng --mount để bind mount tệp hoặc thư mục không tồn tại trên máy chủ Docker, lệnh docker run sẽ báo lỗi thay vì tự động tạo thư mục.
  ```sh
  docker run --mount type=bind,source=/HOST/PATH,target=/CONTAINER/PATH,readonly nginx
  ```
> Docker khuyến nghị sử dụng cú pháp `--mount` thay vì `-v`, vì nó cung cấp khả năng kiểm soát tốt hơn và tránh các vấn đề tiềm ẩn với thư mục không tồn tại.

## File permissions for Docker access to host files
Khi sử dụng bind mounts, điều quan trọng là phải đảm bảo rằng Docker có quyền truy cập cần thiết vào thư mục trên máy chủ. Bạn có thể sử dụng các flag `:ro` (chỉ đọc) hoặc `:rw` (đọc-ghi) với flag `-v` hoặc `--mount` khi tạo container. Ví dụ, lệnh sau đây cấp quyền đọc-ghi cho container:
```sh
docker run -v HOST-DIRECTORY:/CONTAINER-DIRECTORY:rw nginx
```
- `Bind mounts` chỉ đọc (read-only): Cho phép container truy cập tệp trên máy chủ để đọc, nhưng không thể thay đổi hoặc xóa tệp.
- `Bind mounts` đọc-ghi (read-write): Container có thể thay đổi hoặc xóa các tệp được gắn mount, và những thay đổi này cũng sẽ xuất hiện trên máy chủ.

Bind mounts chỉ đọc đảm bảo rằng các tệp trên máy chủ không bị container vô tình thay đổi hoặc xóa.

### Synchronised File Share
Khi mã nguồn của bạn ngày càng lớn, các phương pháp chia sẻ tệp truyền thống như bind mounts có thể trở nên không hiệu quả hoặc chậm, đặc biệt trong các môi trường phát triển nơi cần truy cập tệp thường xuyên. **Chia sẻ tệp đồng bộ hóa** cải thiện hiệu suất bind mount bằng cách tận dụng các bộ nhớ đệm của hệ thống tệp đã được đồng bộ hóa. Điều này đảm bảo rằng việc truy cập tệp giữa máy chủ và container diễn ra nhanh chóng và hiệu quả.

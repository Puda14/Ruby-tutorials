# Docker Compose?

Bạn đã làm việc với các ứng dụng chạy trên một container. Nhưng bây giờ bạn muốn thực hiện một điều gì đó phức tạp hơn - như chạy cơ sở dữ liệu, hàng đợi tin nhắn, bộ nhớ đệm, hoặc nhiều dịch vụ khác nhau. Liệu bạn có nên cài đặt tất cả trong một container? Hay chạy nhiều container? Nếu bạn chạy nhiều container, làm thế nào để kết nối chúng lại với nhau?

Một nguyên tắc tốt khi làm việc với container là mỗi container chỉ nên đảm nhận một nhiệm vụ và làm tốt nhiệm vụ đó. Mặc dù có một số ngoại lệ, nhưng bạn nên tránh xu hướng để một container thực hiện nhiều tác vụ cùng lúc.

Bạn có thể sử dụng nhiều lệnh `docker run` để khởi động nhiều container. Tuy nhiên, bạn sẽ sớm nhận ra rằng bạn cần quản lý mạng, tất cả các flag cần thiết để kết nối các container với mạng đó, và nhiều thứ khác nữa. Sau khi hoàn tất, việc dọn dẹp cũng sẽ phức tạp hơn.

Với `Docker Compose`, bạn có thể định nghĩa tất cả các container và cấu hình của chúng trong một `file YAML` duy nhất. Nếu bạn thêm file này vào kho mã nguồn của mình, bất kỳ ai clone kho đó đều có thể khởi động ứng dụng với chỉ một lệnh duy nhất.

Điều quan trọng cần hiểu là **Compose** là một công cụ mang tính khai báo - bạn chỉ cần định nghĩa và thực hiện. Bạn không cần phải tạo lại mọi thứ từ đầu. Nếu bạn thay đổi, chỉ cần chạy lệnh `docker compose up` lần nữa và **Compose** sẽ điều chỉnh các thay đổi trong file và áp dụng một cách thông minh.

>Dockerfile và Compose file
>
>  `Dockerfile` cung cấp hướng dẫn để xây dựng một image container, trong khi Compose file **định nghĩa các container đang chạy của bạn**. Thông thường, file Compose sẽ tham chiếu đến Dockerfile để xây dựng image cho một dịch vụ cụ thể.

## Try it out

Trong phần thực hành này, bạn sẽ học cách sử dụng Docker Compose để chạy một ứng dụng nhiều container. Bạn sẽ sử dụng một ứng dụng quản lý danh sách công việc đơn giản (to-do list) được xây dựng với Node.js và MySQL làm máy chủ cơ sở dữ liệu.

### Start the application

Hãy làm theo các hướng dẫn sau để chạy ứng dụng to-do list trên hệ thống của bạn.

1. Tải xuống và cài đặt Docker Desktop.
2. Mở terminal và clone ứng dụng mẫu:
```sh
git clone https://github.com/dockersamples/todo-list-app
```
3. Di chuyển vào thư mục todo-list-app:
```sh
cd todo-list-app
```
Trong thư mục này, bạn sẽ tìm thấy file `compose.yaml`. Đây là nơi chứa tất cả các cấu hình cần thiết! File này định nghĩa tất cả các dịch vụ của ứng dụng của bạn, cùng với các cấu hình của chúng. Mỗi dịch vụ chỉ rõ image, cổng (ports), volumes, mạng (networks), và các cài đặt khác cần thiết để ứng dụng hoạt động.

4. Sử dụng lệnh sau để khởi động ứng dụng:
```sh
docker compose up -d --build
```
Khi bạn chạy lệnh này, bạn sẽ thấy đầu ra như sau:
```sh
[+] Running 4/4
✔ app 3 layers [⣿⣿⣿]      0B/0B            Pulled           7.1s
✔ e6f4e57cc59e Download complete                          0.9s
✔ df998480d81d Download complete                          1.0s
✔ 31e174fedd23 Download complete                          2.5s
```
Một số điều đáng chú ý:
- Hai image container (node và MySQL) đã được tải xuống từ Docker Hub.
- Một mạng đã được tạo cho ứng dụng của bạn.
- Một volume đã được tạo để lưu trữ dữ liệu cơ sở dữ liệu giữa các lần khởi động lại container.
- Hai container đã được khởi động với tất cả các cấu hình cần thiết.

Bây giờ mọi thứ đã sẵn sàng, bạn có thể mở trình duyệt và truy cập http://localhost:3000 để xem ứng dụng.

### Tear it down

Khi bạn đã hoàn tất, bạn có thể dọn dẹp tất cả dễ dàng bằng lệnh sau:
```sh
docker compose down
```

Điều này sẽ gỡ bỏ các container, nhưng không tự động xóa các volumes. Nếu bạn muốn xóa cả volumes, sử dụng:
```sh
docker compose down --volumes
```

Hoặc, bạn có thể sử dụng GUI của Docker Desktop để xóa các container bằng cách chọn ứng dụng và nhấn nút Delete.

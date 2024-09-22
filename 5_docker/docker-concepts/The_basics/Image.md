# Image
Vì container là một quy trình cô lập, vậy nó lấy các tệp và cấu hình từ đâu? Làm thế nào để bạn chia sẻ những môi trường đó?

Đây là lúc các image container xuất hiện!

Một image là một gói chuẩn hóa bao gồm tất cả các tệp, binary, thư viện, và cấu hình cần thiết để chạy một container.

Ví dụ, với một image của PostgreSQL, image này sẽ đóng gói các binary của cơ sở dữ liệu, các tệp cấu hình và các phụ thuộc khác. Đối với một ứng dụng web Python, nó sẽ bao gồm runtime Python, mã của ứng dụng và tất cả các phụ thuộc của ứng dụng đó.

Có hai nguyên tắc quan trọng của images:

- images là bất biến: Một khi image được tạo ra, nó không thể bị thay đổi. Bạn chỉ có thể tạo ra một image mới hay thêm các thay đổi lên trên image mới đó.

- images bao gồm nhiều lớp (layers): Mỗi lớp đại diện cho một tập hợp các thay đổi của hệ thống tệp, thêm, xóa hoặc chỉnh sửa tệp.

Hai nguyên tắc này cho phép bạn mở rộng hoặc thêm vào các image hiện có. Ví dụ, nếu bạn đang xây dựng một ứng dụng Python, bạn có thể bắt đầu từ một image Python và thêm các lớp bổ sung để cài đặt các phụ thuộc và mã của ứng dụng bạn. Điều này giúp bạn tập trung vào ứng dụng của mình thay vì Python.

## Finding images

**Docker Hub** là thị trường mặc định toàn cầu để lưu trữ và phân phối image. Nó có hơn 100.000 image do các nhà phát triển tạo ra mà bạn có thể chạy cục bộ. Bạn có thể tìm kiếm image trên Docker Hub và chạy chúng trực tiếp từ Docker Desktop.

Docker Hub cung cấp nhiều image được Docker hỗ trợ và công nhận, được gọi là Docker Trusted Content. Chúng bao gồm:

- Docker Official Images: Một tập hợp các kho Docker được quản lý, là điểm khởi đầu cho phần lớn người dùng và được xem là một trong những image bảo mật nhất trên Docker Hub.-

- Docker Verified Publishers: Các image chất lượng cao từ các nhà xuất bản thương mại đã được Docker xác minh.

- Docker-Sponsored Open Source: Các image được phát hành và duy trì bởi các dự án mã nguồn mở do Docker tài trợ thông qua chương trình mã nguồn mở của Docker.

Ví dụ, Redis và Memcached là hai image Docker Official phổ biến. Bạn có thể tải xuống các image này và có các dịch vụ chạy trong vài giây. Cũng có những image cơ bản như image Docker của Node.js, mà bạn có thể sử dụng làm điểm khởi đầu và thêm các tệp và cấu hình của riêng bạn.

## Try it out

Hãy làm theo hướng dẫn để tìm kiếm và tải về một image Docker bằng CLI để xem các lớp (layers) của nó.


### Search for and download an image

1. Mở một terminal và tìm kiếm các image bằng lệnh `docker search`:

```sh
docker search docker/welcome-to-docker
```
Bạn sẽ thấy kết quả như sau:
```sh
NAME                       DESCRIPTION                                     STARS     OFFICIAL
docker/welcome-to-docker   Docker image for new users getting started w…   20
```
Kết quả này hiển thị thông tin về các image có sẵn trên Docker Hub.

2. Tải image về bằng lệnh `docker pull`:
```sh
docker pull docker/welcome-to-docker
```
Bạn sẽ thấy kết quả như sau:
```sh
Using default tag: latest
latest: Pulling from docker/welcome-to-docker
579b34f0a95b: Download complete
d11a451e6399: Download complete
1c2214f9937c: Download complete
...
```
Mỗi dòng đại diện cho một lớp (layer) đã được tải xuống của image. Mỗi lớp là một tập hợp các thay đổi của hệ thống tệp và cung cấp chức năng cho image.

### Learn about the image

1. Liệt kê các image đã tải xuống bằng lệnh `docker image ls`:
```sh
docker image ls
```

```sh
docker images
```
Bạn sẽ thấy kết quả như sau:
```sh
REPOSITORY                 TAG       IMAGE ID       CREATED        SIZE
docker/welcome-to-docker   latest    eedaff45e3c7   4 months ago   29.7MB
```
Lệnh này hiển thị danh sách các image Docker hiện có trên hệ thống của bạn. image `docker/welcome-to-docker` có kích thước khoảng 29.7MB.

2. Liệt kê các lớp của image bằng lệnh `docker image history`:
```sh
docker image history docker/welcome-to-docker
```
Kết quả sẽ giống như sau:
```sh
IMAGE          CREATED        CREATED BY                                      SIZE      COMMENT
648f93a1ba7d   4 months ago   COPY /app/build /usr/share/nginx/html # buil…   1.6MB     buildkit.dockerfile.v0
<missing>      5 months ago   /bin/sh -c #(nop)  CMD ["nginx" "-g" "daemon…   0B
...
```
Kết quả này hiển thị tất cả các lớp, kích thước của chúng, và lệnh được sử dụng để tạo ra lớp đó.

> Bạn có thể thêm flag `--no-trunc` để xem toàn bộ các lệnh đầy đủ nếu muốn.

test

# Introduction

## What is Docker ?
Docker là một nền tảng mở để phát triển, vận chuyển và chạy các ứng dụng. Docker cho phép bạn tách ứng dụng khỏi cơ sở hạ tầng để bạn có thể phân phối phần mềm một cách nhanh chóng. Với Docker, bạn có thể quản lý cơ sở hạ tầng của mình giống như cách bạn quản lý ứng dụng của mình. Bằng cách tận dụng các phương pháp của Docker để vận chuyển, thử nghiệm và triển khai mã, bạn có thể giảm đáng kể độ trễ giữa việc viết mã và chạy mã trong sản xuất.

## What can I use Docker for?

Docker có thể được sử dụng cho nhiều mục đích, bao gồm việc phân phối nhanh và nhất quán các ứng dụng của bạn.

Docker giúp đơn giản hóa quá trình phát triển phần mềm bằng cách cho phép các nhà phát triển làm việc trong các môi trường chuẩn hóa, sử dụng các container cục bộ để cung cấp các ứng dụng và dịch vụ của bạn. Các container rất phù hợp cho các quy trình làm việc theo phương pháp tích hợp liên tục và phân phối liên tục (CI/CD).

Hãy xem xét ví dụ sau:

- Các nhà phát triển của bạn viết mã trên máy cục bộ và chia sẻ công việc của họ với các đồng nghiệp thông qua các container Docker.
- Họ sử dụng Docker để đẩy các ứng dụng vào môi trường thử nghiệm và chạy các bài kiểm tra tự động và thủ công.
- Khi các nhà phát triển tìm thấy lỗi, họ có thể sửa chúng trong môi trường phát triển và triển khai lại vào môi trường thử nghiệm để kiểm tra và xác nhận.
- Sau khi quá trình kiểm thử hoàn tất, việc đưa các bản sửa lỗi lên môi trường sản xuất sẽ nhanh chóng và dễ dàng.

Docker tạo điều kiện cho việc phát triển ứng dụng mượt mà, từ việc viết mã đến kiểm tra và phân phối sản phẩm cuối cùng.

## Docker architecture

![alt text](https://docs.docker.com/get-started/images/docker-architecture.webp)

Docker sử dụng kiến trúc client-server, trong đó:

- Client Docker giao tiếp với Daemon Docker, daemon đảm nhận việc xây dựng, chạy và phân phối các container Docker. Client và daemon có thể chạy trên cùng một hệ thống, hoặc bạn có thể kết nối client với daemon từ xa. Client và daemon giao tiếp qua API REST, sử dụng các socket UNIX hoặc giao diện mạng.
- Docker Compose là một client khác của Docker, cho phép bạn làm việc với các ứng dụng bao gồm nhiều container.

Các thành phần chính trong kiến trúc Docker:

- Docker Daemon (dockerd)
  Daemon lắng nghe các yêu cầu API của Docker và quản lý các đối tượng Docker như hình ảnh (images), container, mạng (networks), và volumes.
  Daemon cũng có thể giao tiếp với các daemon khác để quản lý các dịch vụ Docker phân tán.

    Docker Client
        Docker client (thường được gọi là docker) là cách chính mà người dùng tương tác với Docker. Khi bạn sử dụng các lệnh như docker run, client sẽ gửi các yêu cầu này đến daemon (dockerd), và dockerd sẽ thực thi các lệnh này.
        Client có thể giao tiếp với nhiều daemon khác nhau.

    Docker Desktop
        Docker Desktop là ứng dụng dễ cài đặt cho các hệ điều hành như Mac, Windows, hoặc Linux, cho phép bạn xây dựng và chia sẻ các ứng dụng dạng container và microservices. Docker Desktop bao gồm:
            Daemon Docker (dockerd)
            Docker client (docker)
            Docker Compose
            Docker Content Trust
            Kubernetes
            Credential Helper

    Docker Registries
        Docker registry là nơi lưu trữ các hình ảnh Docker. Docker Hub là registry công cộng phổ biến nhất, và Docker mặc định tìm kiếm hình ảnh trên Docker Hub. Bạn cũng có thể thiết lập registry riêng.
        Các lệnh như docker pull hoặc docker run sẽ lấy hình ảnh từ registry đã được cấu hình, và docker push sẽ đẩy hình ảnh lên registry.

    Docker Objects
        Các đối tượng Docker gồm hình ảnh (images), container, mạng (networks), volumes, plugins và nhiều thứ khác.

Các đối tượng chính:

  - Images
        Hình ảnh là các mẫu chỉ đọc chứa hướng dẫn để tạo ra container Docker. Một hình ảnh thường dựa trên một hình ảnh khác và có các tùy chỉnh bổ sung. Ví dụ, một hình ảnh có thể dựa trên Ubuntu và có thêm Apache hoặc ứng dụng của bạn cùng với các cấu hình cần thiết để chạy ứng dụng.
        Bạn có thể tạo hình ảnh riêng bằng cách viết Dockerfile, với cú pháp đơn giản để định nghĩa các bước cần thiết tạo ra hình ảnh. Mỗi lệnh trong Dockerfile tạo ra một lớp (layer) trong hình ảnh, chỉ những lớp thay đổi mới được xây dựng lại, giúp hình ảnh Docker nhẹ và nhanh hơn so với công nghệ ảo hóa truyền thống.

  - Containers (container)
        Container là một phiên bản chạy được của hình ảnh. Bạn có thể tạo, khởi chạy, dừng, di chuyển, hoặc xóa container thông qua API hoặc CLI của Docker. Bạn cũng có thể kết nối container vào các mạng khác nhau, gắn thêm ổ đĩa, hoặc tạo hình ảnh mới dựa trên trạng thái hiện tại của container.
        Mặc định, container tương đối cách ly với các container khác và hệ điều hành chủ. Bạn có thể điều chỉnh mức độ cách ly này về mạng, lưu trữ hoặc các hệ thống cơ bản khác.
        Khi container bị xóa, mọi thay đổi không được lưu trữ sẽ bị mất.

Docker là công cụ mạnh mẽ trong việc triển khai, phát triển và duy trì các ứng dụng container hóa, giúp đơn giản hóa quy trình quản lý và phát triển phần mềm.


## Download

Làm theo [link](https://docs.docker.com/engine/install/ubuntu/)

## Getting Started

Làm theo [link](https://docs.docker.com/get-started/introduction/build-and-push-first-image/)

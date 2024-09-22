# Overriding container defaults

Khi một container Docker khởi động, nó thực thi một ứng dụng hoặc lệnh. Container lấy ứng dụng hoặc tập lệnh này từ cấu hình của image. Mặc dù container đi kèm với các thiết lập mặc định thường hoạt động tốt, nhưng bạn có thể thay đổi chúng nếu cần. Việc điều chỉnh này giúp chương trình trong container hoạt động chính xác theo cách bạn mong muốn.

Ví dụ, nếu bạn có một container cơ sở dữ liệu đang nghe trên cổng mặc định và bạn muốn chạy một instance mới của cùng container đó, bạn có thể muốn thay đổi cấu hình cổng để tránh xung đột với container hiện có. Đôi khi, bạn cũng có thể muốn tăng bộ nhớ có sẵn cho container nếu chương trình cần nhiều tài nguyên hơn để xử lý khối lượng công việc lớn hoặc thiết lập các biến môi trường để cung cấp các chi tiết cấu hình cụ thể mà chương trình cần để hoạt động đúng.

Lệnh `docker run` cung cấp một cách mạnh mẽ để ghi đè các cấu hình mặc định này và tùy chỉnh hành vi của container theo nhu cầu của bạn. Lệnh này có nhiều flag cho phép bạn điều chỉnh container theo ý muốn.

Dưới đây là một số cách bạn có thể thực hiện điều này.

## Overriding the network ports

Đôi khi, bạn có thể muốn sử dụng các instance cơ sở dữ liệu riêng biệt cho mục đích phát triển và kiểm thử. Chạy các instance cơ sở dữ liệu này trên cùng một cổng có thể gây xung đột. Bạn có thể sử dụng tùy chọn `-p` trong lệnh `docker run` để ánh xạ cổng của container với cổng trên máy chủ, cho phép bạn chạy nhiều instance của container mà không gặp xung đột.

```sh
docker run -d -p HOST_PORT:CONTAINER_PORT postgres
```

## Setting environment variables

Tùy chọn này thiết lập một biến môi trường `foo` trong container với giá trị `bar`.

```sh
docker run -e foo=bar postgres env
```

Bạn sẽ thấy đầu ra tương tự như sau:

```sh
HOSTNAME=2042f2e6ebe4
foo=bar
```

> Tip:
>
> Tệp `.env` cung cấp một cách tiện lợi để thiết lập các biến môi trường cho container Docker mà không làm rối lệnh với nhiều flag `-e`. Để sử dụng tệp `.env`, bạn có thể truyền tùy chọn `--env-file` cùng với lệnh `docker run`.

```sh
docker run --env-file .env postgres env
```

## Restricting the container to consume the resources
Bạn có thể sử dụng các flag `--memory` và `--cpus` với lệnh docker run để giới hạn mức sử dụng CPU và bộ nhớ của container. Ví dụ, bạn có thể đặt giới hạn bộ nhớ cho container Python API, ngăn không cho nó tiêu tốn quá nhiều tài nguyên trên máy chủ.

Lệnh như sau:

```sh
docker run -e POSTGRES_PASSWORD=secret --memory="512m" --cpus="0.5" postgres
```
Lệnh này giới hạn mức sử dụng bộ nhớ của container ở mức 512 MB và định nghĩa hạn mức CPU là 0.5 (tương đương với một nửa lõi CPU).

## Monitor the real-time resource usage

Bạn có thể sử dụng lệnh `docker stats` để giám sát mức sử dụng tài nguyên của các container đang chạy theo thời gian thực. Điều này giúp bạn hiểu liệu các tài nguyên đã phân bổ có đủ hay cần điều chỉnh thêm.

# Publishing and exposing ports

Nếu bạn đã theo dõi các hướng dẫn trước đây, bạn sẽ hiểu rằng containers cung cấp các quy trình cô lập cho từng thành phần của ứng dụng. Mỗi thành phần - frontend React, API Python, và cơ sở dữ liệu Postgres - chạy trong một môi trường độc lập, hoàn toàn tách biệt với mọi thứ khác trên máy chủ của bạn. Sự cô lập này tuyệt vời cho bảo mật và quản lý phụ thuộc, nhưng nó cũng đồng nghĩa với việc bạn không thể truy cập trực tiếp vào các container đó, ví dụ như không thể truy cập ứng dụng web từ trình duyệt.

Đó là lúc publish cổng (**port publishing**) trở nên hữu ích.

## Publishing ports

Publish một cổng cung cấp khả năng vượt qua sự cô lập mạng bằng cách thiết lập một quy tắc chuyển tiếp. Ví dụ, bạn có thể yêu cầu rằng mọi yêu cầu đến cổng `8080` của máy chủ sẽ được chuyển tiếp tới cổng `80` trong container. Quá trình publish cổng được thực hiện trong quá trình tạo container bằng cách sử dụng flag `-p` (hoặc `--publish`) với lệnh docker run. Cú pháp là:

```bash
docker run -d -p HOST_PORT:CONTAINER_PORT nginx
```
- **HOST_PORT**: Số cổng trên máy chủ của bạn, nơi bạn muốn nhận lưu lượng truy cập.
- **CONTAINER_PORT**: Số cổng bên trong container đang lắng nghe các kết nối.

Ví dụ, để publish cổng `80` của container tới cổng `8080` trên máy chủ:

```bash
docker run -d -p 8080:80 nginx
```

Bây giờ, bất kỳ lưu lượng nào gửi đến cổng 8080 trên máy chủ sẽ được chuyển tiếp đến cổng 80 trong container.

> Lưu ý quan trọng:
>
> Khi một cổng được publish, nó sẽ được publish cho tất cả các giao diện mạng mặc định. Điều này có nghĩa là bất kỳ lưu lượng nào đến máy của bạn đều có thể truy cập ứng dụng được publish. Cần cẩn thận khi publish cơ sở dữ liệu hoặc bất kỳ thông tin nhạy cảm nào.
Publish đến cổng ngẫu nhiên (ephemeral ports)

## Publishing to ephemeral ports

Đôi khi, bạn chỉ muốn publish cổng mà không cần quan tâm đến cổng nào trên máy chủ được sử dụng. Trong những trường hợp này, bạn có thể để Docker chọn cổng giúp bạn. Để thực hiện điều này, chỉ cần bỏ qua phần cấu hình `HOST_PORT`.

Ví dụ, lệnh sau sẽ publish cổng 80 của container tới một cổng ngẫu nhiên trên máy chủ:

```bash
docker run -p 80 nginx
```

Sau khi container đang chạy, sử dụng lệnh docker ps sẽ cho bạn biết cổng được chọn:

```bash
docker ps
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS          PORTS                    NAMES
a527355c9c53   nginx         "/docker-entrypoint.…"   4 seconds ago    Up 3 seconds    0.0.0.0:54772->80/tcp    romantic_williamson
```

Trong ví dụ này, ứng dụng được publish tại cổng `54772` trên máy chủ.

## Publishing all ports

Khi tạo một container image, lệnh `EXPOSE` trong Dockerfile được sử dụng để chỉ ra rằng ứng dụng được đóng gói sẽ sử dụng cổng được chỉ định. Tuy nhiên, các cổng này không được publish mặc định.

Sử dụng flag `-P` hoặc `--publish-all`, bạn có thể tự động publish tất cả các cổng được chỉ định bởi lệnh **EXPOSE** đến các cổng ngẫu nhiên. Điều này rất hữu ích khi bạn đang cố gắng tránh xung đột cổng trong môi trường phát triển hoặc kiểm thử.

Ví dụ, lệnh sau sẽ publish tất cả các cổng đã được chỉ định bởi image:

```bash
docker run -P nginx
```

Tóm lại:

- `-p HOST_PORT` : Publish một cổng cụ thể từ máy chủ tới container.
- `-P`: Tự động publish tất cả các cổng đã được chỉ định bởi lệnh EXPOSE trong Dockerfile.

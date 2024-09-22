# Persisting container data

Khi một container khởi động, nó sử dụng các tệp và cấu hình được cung cấp bởi image. Mỗi container có khả năng tạo, chỉnh sửa, và xóa tệp mà không ảnh hưởng đến các container khác. Tuy nhiên, khi container bị xóa, các thay đổi tệp cũng bị mất theo.

Mặc dù tính chất tạm thời của container là ưu điểm, nhưng điều này gây ra thách thức khi bạn cần lưu trữ dữ liệu lâu dài. Ví dụ, nếu bạn khởi động lại một container cơ sở dữ liệu, có thể bạn không muốn bắt đầu với một cơ sở dữ liệu trống. Vậy làm thế nào để lưu trữ dữ liệu?

## Container volumes

**Volumes** là một cơ chế lưu trữ cung cấp khả năng lưu trữ dữ liệu lâu dài ngoài vòng đời của một container. Hãy nghĩ đến việc sử dụng volume giống như việc tạo ra một symlink (liên kết tượng trưng) từ bên trong container ra ngoài container.

Ví dụ, hãy tưởng tượng bạn tạo một volume có tên là `log-data`:

```sh
docker volume create log-data
```

Khi bạn khởi động container với lệnh sau, volume sẽ được gắn kết (mounted) vào container tại thư mục `/logs`:

```sh
docker run -d -p 80:80 -v log-data:/logs docker/welcome-to-docker
```

Nếu volume `log-data` chưa tồn tại, Docker sẽ tự động tạo nó cho bạn.

Khi container chạy, tất cả các tệp mà nó ghi vào thư mục /logs sẽ được lưu trữ trong volume này, bên ngoài container. Nếu bạn xóa container và khởi động một container mới sử dụng cùng volume, các tệp vẫn sẽ còn đó.

### Chia sẻ tệp bằng volumes
Bạn có thể gắn cùng một volume vào nhiều container để chia sẻ tệp giữa chúng. Điều này rất hữu ích trong các trường hợp như **tổng hợp log, pipeline dữ liệu**, hoặc các ứng dụng hướng sự kiện.

## Managing volumes

Volumes có vòng đời riêng biệt ngoài các container và có thể phát triển khá lớn tùy thuộc vào loại dữ liệu và ứng dụng bạn đang sử dụng. Dưới đây là một số lệnh hữu ích để quản lý volumes:

- `docker volume ls`: Liệt kê tất cả các volumes.
- `docker volume rm <volume-name-or-id>`: Xóa một volume (chỉ hoạt động khi volume không được gắn vào container nào).
- `docker volume prune`: Xóa tất cả các volumes không sử dụng (không gắn vào bất kỳ container nào).

Sử dụng volume giúp bạn duy trì dữ liệu lâu dài và chia sẻ tệp giữa các container dễ dàng hơn, đáp ứng nhu cầu lưu trữ và quản lý dữ liệu khi làm việc với Docker.

### Để hủy liên kết giữa volume và container trong Docker, bạn có thể làm theo các cách sau:

1. Xóa container mà không xóa volume

Khi bạn xóa một container, liên kết giữa container và volume sẽ bị hủy, nhưng volume vẫn tồn tại và dữ liệu của nó không bị mất. Bạn có thể sử dụng lệnh `docker rm` để xóa container mà không ảnh hưởng đến volume.

```bash
docker rm <container-id-or-name>
```

Lệnh này xóa container nhưng giữ lại volume.

2. Dừng container và gắn lại volume (tạm thời)

Nếu bạn chỉ muốn tạm thời ngắt kết nối volume mà không xóa container, bạn cần dừng container trước:

```bash
docker stop <container-id-or-name>
```

Sau đó, bạn có thể khởi động lại container mà không gắn volume bằng cách không sử dụng tùy chọn `-v` hoặc `--mount` trong lệnh docker run khi khởi động lại container.

3. Xóa container và volume kèm theo

Nếu bạn muốn xóa cả container và volume gắn kết với nó, bạn có thể sử dụng tùy chọn `--volumes` khi xóa container:

```bash
docker rm -v <container-id-or-name>
```

Lệnh này sẽ xóa cả container và volume đã gắn kết với container.

4. Thay đổi volume được gắn kết

Nếu bạn muốn ngắt kết nối volume hiện tại và gắn một volume khác, bạn cần xóa container hiện tại và khởi động một container mới với volume khác được chỉ định trong lệnh docker run.

Ví dụ, để thay thế volume hiện tại bằng một volume khác khi khởi động container mới:

```bash
docker run -d -p 80:80 -v new-volume:/logs <image-name>
```

5. Thao tác trực tiếp với volume mà không xóa container

Nếu bạn muốn hủy liên kết volume mà không xóa container, bạn cần xóa container và tạo lại với các cấu hình khác. Docker không hỗ trợ việc hủy gắn (detach) volume khỏi container khi container đang chạy mà không xóa container.

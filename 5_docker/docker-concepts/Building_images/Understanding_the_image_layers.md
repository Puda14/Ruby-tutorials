# Understanding the image layers

Như bạn đã học trong phần Image là gì?, các container image được tạo thành từ nhiều lớp (layer). Mỗi lớp trong số này, sau khi được tạo ra, là bất biến (immutable). Nhưng điều đó thực sự có nghĩa là gì? Và các lớp đó được sử dụng như thế nào để tạo ra hệ thống tệp mà một container có thể sử dụng?

## Image layers
Mỗi lớp trong một image chứa các thay đổi của hệ thống tệp — bao gồm thêm, xóa, hoặc chỉnh sửa tệp. Hãy xem xét một image lý thuyết:

- Lớp đầu tiên thêm các lệnh cơ bản và một trình quản lý gói, chẳng hạn như apt.
- Lớp thứ hai cài đặt môi trường Python và pip để quản lý phụ thuộc.
- Lớp thứ ba sao chép tệp requirements.txt của ứng dụng vào.
- Lớp thứ tư cài đặt các phụ thuộc cụ thể của ứng dụng.
- Lớp thứ năm sao chép mã nguồn thực tế của ứng dụng vào.

![alt text](https://docs.docker.com/get-started/docker-concepts/building-images/images/container_image_layers.webp)

Điều này có lợi vì nó cho phép các lớp được tái sử dụng giữa các image khác nhau. Ví dụ, nếu bạn muốn tạo thêm một ứng dụng Python khác, bạn có thể tận dụng lớp Python đã có. Điều này giúp xây dựng image nhanh hơn và giảm dung lượng lưu trữ cũng như băng thông cần thiết để phân phối các image.

![alt text](https://docs.docker.com/get-started/docker-concepts/building-images/images/container_image_layer_reuse.webp)

## Stacking the layers

Việc tạo các lớp là nhờ vào cơ chế lưu trữ có thể định địa chỉ theo nội dung (content-addressable storage) và hệ thống tệp liên kết (union filesystem). Dưới đây là cách nó hoạt động:

- Sau khi mỗi lớp được tải xuống, nó được giải nén vào một thư mục riêng trên hệ thống tệp của máy chủ.
- Khi bạn chạy một container từ một image, một hệ thống tệp liên kết được tạo ra, nơi các lớp được xếp chồng lên nhau, tạo ra một hệ thống tệp hợp nhất.
- Khi container khởi động, thư mục gốc của nó được thiết lập thành vị trí của thư mục hợp nhất này, sử dụng lệnh chroot.

Khi hệ thống tệp liên kết được tạo ra, một thư mục được tạo riêng cho container đang chạy. Điều này cho phép container tạo ra các thay đổi trên hệ thống tệp mà không làm ảnh hưởng đến các lớp image gốc, cho phép bạn chạy nhiều container từ cùng một image.

### Try it out

Trong phần thực hành này, bạn sẽ tạo các lớp image mới theo cách thủ công bằng lệnh docker container commit. Lưu ý rằng bạn hiếm khi tạo image theo cách này, vì thông thường bạn sẽ sử dụng `Dockerfile`, nhưng cách này giúp bạn hiểu rõ hơn về cách thức hoạt động.

#### Create a base image

Trong bước đầu tiên này, bạn sẽ tạo một base image mà sau đó bạn sẽ sử dụng cho các bước tiếp theo.
1. Tải xuống và cài đặt Docker Desktop.
2. Trong terminal, chạy lệnh sau để bắt đầu một container mới:

```bash
docker run --name=base-container -ti ubuntu
```

Sau khi image được tải xuống và container được khởi động, bạn sẽ thấy một shell mới. Nó sẽ giống như sau (ID của container sẽ khác nhau):

```ruby
root@d8c5ca119fcd:/#
```

Bên trong container, chạy lệnh sau để cài đặt Node.js:

```bash
apt update && apt install -y nodejs
```

Sau khi lệnh này chạy xong, Node.js sẽ được cài đặt bên trong container. Các thay đổi này xảy ra trong thư mục riêng của container trong bối cảnh hệ thống tệp liên kết.

Xác minh Node.js đã được cài đặt bằng cách chạy lệnh sau:

```bash
node -e 'console.log("Hello world!")'
```

Nếu Node.js được cài đặt thành công, bạn sẽ thấy chuỗi "Hello world!" xuất hiện trên màn hình console.

Bây giờ Node.js đã được cài đặt, bạn đã sẵn sàng lưu các thay đổi này thành một lớp image mới, từ đó bạn có thể khởi động các container mới hoặc xây dựng các image mới. Để làm điều đó, bạn sẽ sử dụng lệnh docker container commit. Chạy lệnh sau trong một terminal mới:

```bash
docker container commit -m "Add node" base-container node-base
```

Xem các lớp của image mới tạo bằng lệnh docker image history:

```bash
docker image history node-base
```

Bạn sẽ thấy đầu ra tương tự như sau:

```bash
IMAGE          CREATED          CREATED BY                                      SIZE      COMMENT
d5c1fca2cdc4   10 seconds ago   /bin/bash                                       126MB     Add node
```

Lưu ý dòng "Add node" ở trên cùng. Lớp này chứa cài đặt Node.js mà bạn vừa thực hiện.

Để kiểm tra image của bạn đã có Node.js, bạn có thể khởi động một container mới từ image này:

```bash
docker run node-base node -e "console.log('Hello again')"
```

Nếu mọi thứ hoạt động đúng, bạn sẽ thấy chuỗi "Hello again" xuất hiện trên terminal, cho thấy Node.js đã được cài đặt và đang hoạt động.

#### Build an app image
Bây giờ bạn đã có một base image, bạn có thể mở rộng image này để xây dựng các image bổ sung.

1. Khởi động một container mới từ image node-base vừa tạo:

```bash
docker run --name=app-container -ti node-base
```
2. Bên trong container, tạo một chương trình Node.js:

```bash
echo 'console.log("Hello from an app")' > app.js
```

Chạy chương trình Node này và xem thông báo xuất hiện trên màn hình:

```bash
node app.js
```

3. Trong một terminal khác, chạy lệnh sau để lưu các thay đổi trong container thành một image mới:

```bash
docker container commit -c "CMD node app.js" -m "Add app" app-container sample-app
```

Lệnh này không chỉ tạo ra một image mới có tên sample-app, mà còn thêm cấu hình để chạy chương trình Node.js mặc định khi khởi động container.

4. Khởi động một container từ image sample-app:

```bash
docker run sample-app
```

Bạn sẽ thấy thông báo "Hello from an app" xuất hiện trên terminal, được in ra từ chương trình Node.js của bạn.

Cuối cùng, bạn có thể xóa các container khi đã hoàn tất:

```bash
docker rm -f app-container
```

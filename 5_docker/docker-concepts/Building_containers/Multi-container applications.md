# Multi-container applications
Khởi chạy một ứng dụng đơn container rất đơn giản. Ví dụ, một script Python thực hiện một tác vụ xử lý dữ liệu cụ thể có thể chạy trong một container với tất cả các phụ thuộc của nó. Tương tự, một ứng dụng Node.js phục vụ một trang web tĩnh với một điểm API nhỏ có thể được container hóa hiệu quả cùng với tất cả các thư viện và phụ thuộc cần thiết. Tuy nhiên, khi ứng dụng phát triển, việc quản lý chúng dưới dạng các container riêng lẻ trở nên khó khăn hơn.

Giả sử script Python xử lý dữ liệu cần kết nối với cơ sở dữ liệu. Bây giờ bạn không chỉ quản lý script mà còn cả máy chủ cơ sở dữ liệu trong cùng một container. Nếu script yêu cầu đăng nhập người dùng, bạn sẽ cần cơ chế xác thực, làm cho container phình to hơn.

Một thực hành tốt nhất khi làm việc với containers là mỗi container chỉ nên làm một việc và làm tốt việc đó. Mặc dù có một số ngoại lệ, nhưng bạn nên tránh xu hướng để một container thực hiện nhiều tác vụ.

## Vấn đề với việc quản lý nhiều container bằng docker run

Nếu bạn nghĩ đến việc chạy các container riêng biệt, câu hỏi tiếp theo là: "Làm thế nào để kết nối tất cả chúng lại với nhau?"

Trong khi lệnh docker run là một công cụ tiện lợi để khởi chạy container, khi số lượng container và cấu hình ứng dụng tăng lên, việc quản lý trở nên khó khăn hơn:

- Quản lý nhiều lệnh docker run: Chạy nhiều lệnh docker run cho frontend, backend, và cơ sở dữ liệu với các cấu hình khác nhau cho các môi trường phát triển, kiểm thử và sản xuất rất dễ dẫn đến lỗi và tốn thời gian.
- Ứng dụng phụ thuộc lẫn nhau: Thường các ứng dụng phụ thuộc vào nhau. Việc khởi chạy container theo thứ tự và quản lý kết nối mạng sẽ khó khăn khi số lượng container tăng lên.
- Khó khăn khi scale: Mỗi ứng dụng cần một lệnh docker run, khiến việc scale từng dịch vụ riêng lẻ trở nên phức tạp. Scale toàn bộ ứng dụng có thể lãng phí tài nguyên ở các thành phần không cần thiết.
- Quản lý dữ liệu phân tán: Lưu trữ dữ liệu cho mỗi ứng dụng yêu cầu mount volume hoặc cấu hình riêng trong từng lệnh docker run, tạo ra cách tiếp cận phân tán trong việc quản lý dữ liệu.
- Cấu hình biến môi trường phức tạp: Việc thiết lập các biến môi trường cho từng ứng dụng qua các lệnh docker run riêng lẻ rất tẻ nhạt và dễ gây lỗi.

## Giải pháp với Docker Compose

**Docker Compose** định nghĩa toàn bộ ứng dụng đa container của bạn trong một tệp YAML duy nhất, thường được gọi là `compose.yml`. Tệp này chỉ định cấu hình cho tất cả các container, các phụ thuộc, biến môi trường, và thậm chí là các volumes và mạng.

Với Docker Compose:

- Bạn không cần chạy nhiều lệnh docker run. Tất cả những gì bạn cần làm là định nghĩa ứng dụng đa container trong một tệp YAML duy nhất, điều này tập trung hóa cấu hình và đơn giản hóa quản lý.
- Bạn có thể chạy các container theo một thứ tự cụ thể và dễ dàng quản lý kết nối mạng.
- Bạn có thể dễ dàng scale các dịch vụ riêng lẻ lên hoặc xuống trong thiết lập đa container, cho phép phân bổ tài nguyên hiệu quả dựa trên nhu cầu thực tế.
- Việc triển khai volumes lưu trữ dữ liệu trở nên đơn giản.
- Bạn có thể thiết lập biến môi trường một lần trong tệp Docker Compose.

## Tóm lại

Bằng cách sử dụng Docker Compose để chạy các thiết lập ứng dụng đa container, bạn có thể xây dựng các ứng dụng phức tạp với tính modular (phân chia thành các module), khả năng scale tốt và quản lý dễ dàng hơn. Docker Compose giúp đơn giản hóa việc quản lý cấu hình, kết nối mạng và tài nguyên, đồng thời đảm bảo sự nhất quán và hiệu quả trong quá trình phát triển và triển khai.

# Multi container apps
Nguyên tắc chung là **mỗi container nên làm một việc và làm tốt việc đó**. Dưới đây là một số lý do bạn nên chạy MySQL trong một container riêng:

- Khả năng cao bạn sẽ cần scale API và frontend khác nhau với database.
- Việc chia các container riêng biệt giúp bạn quản lý phiên bản và cập nhật một cách độc lập.
- Trong môi trường production, bạn có thể muốn sử dụng dịch vụ cơ sở dữ liệu được quản lý thay vì cài MySQL trong container.
- Chạy nhiều tiến trình trong một container sẽ yêu cầu quản lý tiến trình, làm tăng độ phức tạp.

Do đó, tốt nhất là chạy ứng dụng của bạn trong nhiều container riêng biệt.

![alt text](https://docs.docker.com/get-started/workshop/images/multi-container.webp)

## Container networking

Container mặc định chạy trong môi trường cô lập và không biết gì về các container khác. Để cho phép các container giao tiếp với nhau, bạn cần sử dụng mạng. Đặt hai container trong cùng một mạng, chúng sẽ có thể giao tiếp.

### Start MySQL

Có hai cách để gắn một container vào mạng:

  1. Gắn mạng khi khởi động container.
  2. Kết nối một container đang chạy vào mạng.

Dưới đây là các bước để tạo mạng trước và sau đó gắn container MySQL khi khởi động.

1. Tạo mạng:

```bash
docker network create todo-app
```

Khởi động container MySQL và gắn nó vào mạng. Đồng thời, bạn cần định nghĩa một vài biến môi trường để MySQL khởi tạo cơ sở dữ liệu.

2. **Khởi động container MySQL và gắn nó vào mạng**. Đồng thời, bạn cần định nghĩa một vài biến môi trường để MySQL khởi tạo cơ sở dữ liệu.

```bash
docker run -d \
  --network todo-app --network-alias mysql \
  -v todo-mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  -e MYSQL_DATABASE=todos \
  mysql:8.0
```

Trong lệnh trên:

- Flag `--network-alias` gán bí danh mạng cho MySQL để các container khác có thể tìm thấy nó qua tên mysql.
- Volume `todo-mysql-data` được tự động tạo để lưu trữ dữ liệu MySQL.

3. Kiểm tra kết nối MySQL:

```bash
docker exec -it <mysql-container-id> mysql -u root -p
```

Nhập mật khẩu secret, sau đó kiểm tra cơ sở dữ liệu:
```sql
mysql> SHOW DATABASES;
```
Bạn sẽ thấy cơ sở dữ liệu `todos` đã được tạo.
```bash
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| todos              |
+--------------------+
5 rows in set (0.00 sec)
```
4. Exit the MySQL shell to return to the shell on your machine.

```bash
mysql> exit
```

You now have a todos database and it's ready for you to use.

### Connect to MySQL

Bây giờ MySQL đã chạy, bạn cần kết nối nó với ứng dụng. Để làm điều này, bạn có thể sử dụng container `nicolaka/netshoot` để kiểm tra kết nối mạng.

1. Khởi động container netshoot
```bash
docker run -it --network todo-app nicolaka/netshoot
```
2. Kiểm tra IP của MySQL bằng lệnh `dig`:
```bash
dig mysql
```
Kết quả sẽ trả về IP của container MySQL. Điều này xác nhận rằng container ứng dụng có thể kết nối với MySQL bằng hostname `mysql`.

Chạy ứng dụng với MySQL

Ứng dụng todo hỗ trợ một vài biến môi trường để thiết lập kết nối MySQL:

- MYSQL_HOST: Hostname của MySQL.
- MYSQL_USER: Username.
- MYSQL_PASSWORD: Password.
- MYSQL_DB: Tên cơ sở dữ liệu.

Bạn có thể khởi động ứng dụng bằng các biến môi trường này như sau:
```bash
docker run -dp 127.0.0.1:3000:3000 \
  -w /app -v "$(pwd):/app" \
  --network todo-app \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  node:18-alpine \
  sh -c "yarn install && yarn run dev"
```

#### Kiểm tra kết nối ứng dụng và MySQL
1. Mở ứng dụng trong trình duyệt và thêm một vài mục vào danh sách todo.
2. Kết nối vào MySQL và kiểm tra xem dữ liệu có được lưu trữ không:

```bash
docker exec -it <mysql-container-id> mysql -p todos
```

Trong MySQL shell, chạy lệnh sau để kiểm tra bảng todo_items:

```sql
mysql> select * from todo_items;
```

Kết quả sẽ hiển thị các mục bạn vừa thêm vào ứng dụng.

Bây giờ bạn đã có ứng dụng todo kết nối với MySQL, chạy trong các container riêng biệt.

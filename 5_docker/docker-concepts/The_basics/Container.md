# Container
Hãy tưởng tượng bạn đang phát triển một ứng dụng web tuyệt vời gồm ba thành phần chính - frontend React, API Python và cơ sở dữ liệu PostgreSQL. Nếu muốn làm việc với dự án này, bạn sẽ phải cài đặt Node, Python và PostgreSQL.

Làm thế nào để bạn đảm bảo rằng mình có cùng phiên bản với các nhà phát triển khác trong nhóm? Hoặc với hệ thống CI/CD của bạn? Hay với những gì được sử dụng trong môi trường sản xuất?

Làm thế nào để đảm bảo phiên bản của Python (hoặc Node hoặc cơ sở dữ liệu) mà ứng dụng của bạn cần không bị ảnh hưởng bởi những gì đã có sẵn trên máy của bạn? Làm thế nào để bạn quản lý các xung đột tiềm ẩn?

## Containers!

Container là gì? Đơn giản mà nói, containers là các quá trình cô lập cho từng thành phần của ứng dụng của bạn. Mỗi thành phần - ứng dụng React frontend, hệ thống API Python, và cơ sở dữ liệu - chạy trong môi trường riêng biệt của nó, hoàn toàn cách ly với những thứ khác trên máy của bạn.

Đây là những điểm khiến chúng trở nên tuyệt vời. Containers có đặc điểm:

- Tự chứa: Mỗi container có mọi thứ nó cần để hoạt động mà không phụ thuộc vào các gói cài đặt trước đó trên máy chủ.
- Cô lập: Vì containers chạy trong sự cô lập, chúng có ảnh hưởng tối thiểu đến máy chủ và các container khác, tăng cường bảo mật cho ứng dụng của bạn.
- Độc lập: Mỗi container được quản lý độc lập. Xóa một container sẽ không ảnh hưởng đến các container khác.
- Di động: Containers có thể chạy ở bất cứ đâu! Container chạy trên máy phát triển của bạn sẽ hoạt động tương tự trong một trung tâm dữ liệu hoặc ở bất cứ nơi nào trên đám mây!

## Containers versus virtual machines (VMs)

Không cần đi quá sâu, một VM là một hệ điều hành hoàn chỉnh với nhân (kernel), trình điều khiển phần cứng, chương trình và ứng dụng riêng. Khởi động một VM chỉ để cô lập một ứng dụng là một điều tốn nhiều tài nguyên.

Một container chỉ đơn giản là một quá trình được cô lập với tất cả các tệp nó cần để chạy. Nếu bạn chạy nhiều containers, tất cả chúng đều dùng chung một nhân, cho phép bạn chạy nhiều ứng dụng trên ít tài nguyên hơn.
Sử dụng VMs và containers cùng nhau

Rất thường xuyên, bạn sẽ thấy containers và VMs được sử dụng cùng nhau. Ví dụ, trong một môi trường đám mây, các máy được cung cấp thường là VMs. Tuy nhiên, thay vì chỉ cung cấp một máy để chạy một ứng dụng, một VM với runtime container có thể chạy nhiều ứng dụng dạng container, tăng cường sử dụng tài nguyên và giảm chi phí.

## Try it out

Trong phần thực hành này, bạn sẽ thấy cách chạy một container Docker bằng cách sử dụng GUI của Docker Desktop.

Mở terminal CLI của bạn và khởi động một container bằng cách sử dụng lệnh `docker run`:

```sh
docker run -d -p 8080:80 docker/welcome-to-docker
```

docker run:

    Đây là lệnh để chạy một container mới dựa trên một hình ảnh Docker cụ thể.

-d (detached mode):

    Flag -d chỉ định rằng container sẽ chạy trong chế độ nền (detached mode). Điều này có nghĩa là container sẽ được chạy trong nền và bạn sẽ không thấy đầu ra trực tiếp từ container trong terminal.

-p 8080:80 (port mapping):

    -p được sử dụng để ánh xạ cổng giữa máy chủ (host) và container.
    Cụ thể, 8080:80 nghĩa là:
        Cổng 8080 trên máy cục bộ (host) sẽ được ánh xạ tới cổng 80 trong container.
        Khi bạn truy cập vào http://localhost:8080 trên trình duyệt của mình, bạn sẽ truy cập vào cổng 80 của container (thường được sử dụng để chạy các ứng dụng web).

docker/welcome-to-docker:

    Đây là tên của hình ảnh Docker mà container sẽ được khởi chạy từ. Trong trường hợp này, nó là hình ảnh docker/welcome-to-docker, chứa một ứng dụng web đơn giản mà Docker cung cấp để người dùng thử nghiệm.

--name my-web-app:

    --name my-web-app: Gán tên cho container là my-web-app.

Khởi động lại container theo tên

```sh
docker start my-web-app
```

Đầu ra của lệnh này là ID đầy đủ của container.

Chúc mừng bạn! Bạn vừa khởi động container đầu tiên của mình! 🎉


## View your running containers
Bạn có thể kiểm tra xem container có đang chạy không bằng cách sử dụng lệnh `docker ps`:

```sh
docker ps
```

Kết quả như sau:

```sh
CONTAINER ID   IMAGE                      COMMAND                  CREATED          STATUS          PORTS                      NAMES
a1f7a4bb3a27   docker/welcome-to-docker   "/docker-entrypoint.…"   11 seconds ago   Up 11 seconds   0.0.0.0:8080->80/tcp       gracious_keldysh
```

Container này chạy một máy chủ web hiển thị một trang web đơn giản. Khi làm việc với các dự án phức tạp hơn, bạn sẽ chạy các phần khác nhau trong các container khác nhau. Ví dụ, một container cho frontend, một container cho backend, và một container cho cơ sở dữ liệu.

> Lệnh `docker ps` chỉ hiển thị các container đang chạy. Để xem các container đã dừng, thêm flag `-a` để liệt kê tất cả container: `docker ps -a`

## Access the frontend

Khi bạn khởi động container, bạn đã mở một trong các cổng của container ra bên ngoài máy của mình. Hãy nghĩ rằng điều này giống như việc cấu hình để cho phép bạn kết nối qua môi trường cô lập của container.

Với container này, frontend có thể truy cập tại cổng 8080. Để mở trang web, bạn có thể chọn liên kết trong cột Port(s) của container hoặc truy cập http://localhost:8080 trong trình duyệt của bạn.

## Stop your container
Container docker/welcome-to-docker tiếp tục chạy cho đến khi bạn dừng nó. Bạn có thể dừng container bằng cách sử dụng lệnh docker stop.
- Chạy lệnh docker ps để lấy ID của container.
- Cung cấp ID hoặc tên container cho lệnh docker stop:

```sh
docker stop <the-container-id>
```

> Khi tham chiếu các container bằng ID, bạn không cần cung cấp toàn bộ ID. Bạn chỉ cần cung cấp đủ ID để nó là duy nhất. Ví dụ, container trước đó có thể bị dừng bằng cách chạy lệnh sau:

```sh
docker stop a1f
```

## Docker exec

Lệnh này cho phép bạn thực thi một lệnh trong một container đang chạy. Thông thường, bạn sẽ sử dụng nó để mở một phiên lệnh (bash hoặc sh) trong container để tương tác với nó như thể bạn đang làm việc trên máy chủ của container.

Ví dụ: Giả sử bạn có container đang chạy với ID là `a1f7a4bb3a27` (bạn có thể kiểm tra ID của container bằng lệnh `docker ps`).

```sh
docker exec -it a1f7a4bb3a27 /bin/bash
```
- `-it`: Đây là hai flag (-i và -t) kết hợp để mở phiên giao tiếp với container:

- `-i`: Cho phép tương tác với container.

- `-t`: Gán một terminal ảo cho bạn (giống như môi trường shell).

- `a1f7a4bb3a27`: ID hoặc tên của container bạn muốn truy cập.

- `/bin/bash`: Lệnh bạn muốn thực thi trong container. Ở đây, bạn đang mở shell bash. Nếu container không có bash, bạn có thể thay thế bằng sh (lệnh shell mặc định).

Sau khi chạy lệnh trên, bạn sẽ vào bên trong container và có thể tương tác như làm việc trên một máy ảo Linux.

## Docker attach
Lệnh này kết nối bạn với quá trình chính (main process) của container, giống như việc bạn ngồi trực tiếp vào máy chủ của container. Lệnh này thường được dùng khi bạn muốn xem đầu ra của ứng dụng đang chạy trong container.

```sh
docker attach a1f7a4bb3a27
```

> Lưu ý: Lệnh docker attach không mở shell như docker exec. Nó chỉ kết nối với tiến trình chính của container, vì vậy bạn sẽ thấy đầu ra trực tiếp từ tiến trình chính (như server web hoặc ứng dụng) và không thể điều khiển toàn bộ container như docker exec.

- `docker exec`: Dùng để mở shell trong container và tương tác với container như trên máy ảo, phù hợp để chạy các lệnh hoặc khám phá hệ thống tệp của container.
- `docker attach`: Dùng để kết nối với tiến trình chính của container và xem đầu ra của nó, nhưng không thích hợp để tương tác trực tiếp với hệ điều hành bên trong container.

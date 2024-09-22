# Build, tag, and publish an image
Trong hướng dẫn này, bạn sẽ học các khái niệm sau:

- Xây dựng image: Quá trình xây dựng một image dựa trên Dockerfile.
- Gắn thẻ image: Quá trình gán tên cho một image, từ đó quyết định nơi image có thể được phân phối.
- Xuất bản image: Quá trình phân phối hoặc chia sẻ image vừa được tạo bằng cách sử dụng một container registry.

## Building images

Thông thường, image được xây dựng bằng Dockerfile. Lệnh xây dựng image cơ bản nhất có thể như sau:
```bash
docker build .
```

Dấu `.` cuối cùng trong lệnh chỉ định đường dẫn hoặc URL tới build context. Tại vị trí này, trình xây dựng sẽ tìm thấy Dockerfile và các tệp khác được tham chiếu.

Khi bạn chạy quá trình build, trình xây dựng sẽ tải image cơ sở nếu cần và sau đó thực thi các lệnh được chỉ định trong Dockerfile.

Với lệnh trên, image sẽ không có tên, nhưng đầu ra sẽ cung cấp ID của image. Ví dụ:

```bash
docker build .
[+] Building 3.5s (11/11) FINISHED                                              docker:desktop-linux
 => [internal] load build definition from Dockerfile                                            0.0s
 => => transferring dockerfile: 308B                                                            0.0s
 => [internal] load metadata for docker.io/library/python:3.12                                  0.0s
 => [internal] load .dockerignore                                                               0.0s
 => => transferring context: 2B                                                                 0.0s
 => [1/6] FROM docker.io/library/python:3.12                                                    0.0s
 => [internal] load build context                                                               0.0s
 => => transferring context: 123B                                                               0.0s
 => [2/6] WORKDIR /usr/local/app                                                                0.0s
 => [3/6] RUN useradd app                                                                       0.1s
 => [4/6] COPY ./requirements.txt ./requirements.txt                                            0.0s
 => [5/6] RUN pip install --no-cache-dir --upgrade -r requirements.txt                          3.2s
 => [6/6] COPY ./app ./app                                                                      0.0s
 => exporting to image                                                                          0.1s
 => => exporting layers                                                                         0.1s
 => => writing image sha256:9924dfd9350407b3df01d1a0e1033b1e543523ce7d5d5e2c83a724480ebe8f00    0.0s

```

Với đầu ra này, bạn có thể khởi động một container bằng cách sử dụng image được tham chiếu:

```bash
docker run sha256:9924dfd9350407b3df01d1a0e1033b1e543523ce7d5d5e2c83a724480ebe8f00
```

Tất nhiên, tên này không dễ nhớ, do đó việc gắn thẻ (tagging) trở nên hữu ích.

## Tagging images

Gắn thẻ image là phương pháp để gán một cái tên dễ nhớ cho image. Cấu trúc đầy đủ của tên image có dạng sau:

```bash
[HOST[:PORT_NUMBER]/]PATH[:TAG]
```
- `HOST`: Tùy chọn tên miền của registry nơi image được lưu trữ. Nếu không có host, Docker mặc định sử dụng registry công khai tại docker.io.
- `PORT_NUMBER`: Số cổng của registry nếu có tên miền.
- `PATH`: Đường dẫn của image, bao gồm các thành phần phân tách bằng dấu gạch chéo. Đối với Docker Hub, định dạng là [NAMESPACE/]REPOSITORY, trong đó namespace là tên người dùng hoặc tổ chức. Nếu không có namespace, library sẽ được sử dụng, đây là namespace dành cho các image chính thức của Docker.
- `TAG`: Một mã định danh tùy chỉnh, thường dùng để xác định các phiên bản hoặc biến thể khác nhau của image. Nếu không có tag, latest sẽ được sử dụng mặc định.

### Ví dụ về tên image:

- `nginx`, tương đương với `docker.io/library/nginx:latest`: lấy image từ registry docker.io, namespace library, repository nginx, và tag latest.
- `docker/welcome-to-docker`, tương đương với `docker.io/docker/welcome-to-docker:latest`.
- `ghcr.io/dockersamples/example-voting-app-vote:pr-311`: lấy image từ GitHub Container Registry.

Để gắn thẻ cho image khi xây dựng, thêm flag `-t` hoặc `--tag`:
```sh
docker build -t my-username/my-image .
```
Nếu bạn đã xây dựng một image, bạn có thể thêm tag mới bằng lệnh:
```sh
docker image tag my-username/my-image another-username/another-image:v1
```

### Publishing images
Sau khi bạn đã xây dựng và gắn thẻ image, bạn có thể đẩy nó lên registry bằng lệnh:
```sh
docker push my-username/my-image
```
Trong vài giây, tất cả các lớp của image sẽ được đẩy lên registry.

Trước khi đẩy image lên một repository, bạn cần phải xác thực. Để làm điều đó, chỉ cần sử dụng lệnh `docker login`

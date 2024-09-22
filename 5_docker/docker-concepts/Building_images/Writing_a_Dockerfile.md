# Writing a Dockerfile

Một **Dockerfile** là một tài liệu dạng văn bản được sử dụng để tạo một container image. Nó cung cấp hướng dẫn cho trình tạo image về các lệnh cần chạy, các tệp cần sao chép, lệnh khởi động, và nhiều thứ khác.

Ví dụ, Dockerfile sau sẽ tạo ra một ứng dụng Python sẵn sàng để chạy:
```bash
FROM python:3.12
WORKDIR /usr/local/app

# Cài đặt các phụ thuộc của ứng dụng
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Sao chép mã nguồn vào
COPY src ./src
EXPOSE 5000

# Tạo người dùng ứng dụng để container không chạy dưới quyền root
RUN useradd app
USER app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
```

Các hướng dẫn phổ biến trong Dockerfile:

- `FROM <image>`: Chỉ định image cơ sở mà quá trình build sẽ mở rộng.
- `WORKDIR <path>`: Chỉ định thư mục làm việc trong container nơi các tệp sẽ được sao chép và các lệnh sẽ được thực thi.
- `COPY <host-path> <image-path>`: Sao chép các tệp từ máy chủ vào container image.
- `RUN <command>`: Thực thi một lệnh trong quá trình build image.
- `ENV <name> <value>`: Thiết lập biến môi trường mà container sẽ sử dụng khi chạy.
- `EXPOSE <port-number>`: Cấu hình cổng mà container sẽ mở ra.
- `USER <user-or-uid>`: Thiết lập người dùng mặc định cho các lệnh sau đó.
- `CMD ["<command>", "<arg1>"]`: Chỉ định lệnh mặc định mà container sẽ chạy khi khởi động.

> Thêm: [Dockerfile](https://docs.docker.com/reference/dockerfile/)

## Try it out
Như ví dụ trước, một Dockerfile thường theo các bước sau:

1. Xác định image cơ sở của bạn.
2. Cài đặt các phụ thuộc của ứng dụng.
3. Sao chép mã nguồn hoặc các tệp nhị phân liên quan.
4. Cấu hình image cuối cùng.

Trong hướng dẫn thực hành nhanh này, bạn sẽ viết một Dockerfile để xây dựng một ứng dụng Node.js đơn giản.

#### Thiết lập

- Tải về và giải nén tệp ZIP chứa dự án vào một thư mục trên máy của bạn.
- Cài đặt Docker Desktop nếu chưa có.

#### Tạo Dockerfile

1. Tạo một tệp có tên là Dockerfile trong cùng thư mục với tệp package.json.

> Lưu ý: Dockerfile không có phần mở rộng tệp (file extension). Một số trình soạn thảo có thể tự động thêm phần mở rộng, hãy đảm bảo rằng Dockerfile của bạn không có phần mở rộng.

2. Trong Dockerfile, xác định image cơ sở của bạn:

```dockerfile
FROM node:20-alpine
```

3. Xác định thư mục làm việc bằng lệnh WORKDIR:

```dockerfile
WORKDIR /app
```

4. Sao chép tất cả các tệp từ dự án của bạn vào image container bằng lệnh COPY:

```dockerfile
COPY . .
```

5. Cài đặt các phụ thuộc của ứng dụng bằng lệnh RUN:

```dockerfile
RUN yarn install --production
```

6. Cuối cùng, chỉ định lệnh mặc định để chạy bằng lệnh CMD:

```dockerfile
CMD ["node", "./src/index.js"]
```

7. Dockerfile hoàn chỉnh:

```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "./src/index.js"]
```

> Lưu ý:
>
>Dockerfile này chưa hoàn toàn sẵn sàng cho sản xuất. Mặc dù nó có thể xây dựng ứng dụng, nhưng quá trình build sẽ không nhanh hoặc an toàn như nó có thể. Để làm cho image tối ưu hơn, bạn cần áp dụng các thực hành tốt nhất như:
>- Tối ưu hóa bộ nhớ đệm (build cache).
>- Chạy dưới quyền người dùng không phải root.
>- Sử dụng multi-stage builds.

#### Container hóa các dự án nhanh chóng với `docker init`:

Lệnh docker init sẽ phân tích dự án của bạn và nhanh chóng tạo ra Dockerfile, compose.yaml, và .dockerignore, giúp bạn khởi động nhanh hơn. Tuy nhiên, trong hướng dẫn này bạn đang học về Dockerfile, vì vậy bạn sẽ không sử dụng lệnh này ngay bây giờ.

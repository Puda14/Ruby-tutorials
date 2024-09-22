# Multi-stage builds
Trong quá trình build truyền thống, tất cả các lệnh build được thực thi theo thứ tự trong một container duy nhất: tải xuống các phụ thuộc, biên dịch mã, và đóng gói ứng dụng. Tất cả các lớp này sẽ kết thúc trong image cuối cùng của bạn. Cách tiếp cận này có thể hoạt động, nhưng dẫn đến các image cồng kềnh chứa nhiều thành phần không cần thiết, làm tăng kích thước và rủi ro bảo mật. Đây chính là lúc multi-stage builds trở nên hữu ích.

Multi-stage builds giới thiệu nhiều giai đoạn khác nhau trong Dockerfile, mỗi giai đoạn có một mục đích cụ thể. Bạn có thể hiểu rằng đây giống như khả năng chạy các phần khác nhau của quá trình build trong các môi trường khác nhau, cùng lúc. Bằng cách tách biệt môi trường build khỏi môi trường runtime cuối cùng, bạn có thể giảm đáng kể kích thước image và bề mặt tấn công. Điều này đặc biệt có lợi cho các ứng dụng có nhiều phụ thuộc trong quá trình build.

**Multi-stage builds** được khuyến khích cho tất cả các loại ứng dụng.

- Đối với các ngôn ngữ thông dịch, như JavaScript, Ruby, hoặc Python, bạn có thể build và minify mã trong một giai đoạn, sau đó sao chép các tệp đã sẵn sàng cho môi trường production vào một image runtime nhỏ hơn. Điều này tối ưu hóa image của bạn cho quá trình triển khai.
- Đối với các ngôn ngữ biên dịch, như C, Go, hoặc Rust, multi-stage builds cho phép bạn biên dịch trong một giai đoạn và sao chép các tệp nhị phân đã được biên dịch vào image runtime cuối cùng. Bạn không cần phải đóng gói toàn bộ trình biên dịch vào trong image cuối cùng của mình.

## Ví dụ về cấu trúc multi-stage build

Dưới đây là một ví dụ đơn giản về cấu trúc multi-stage build bằng mã giả. Chú ý rằng có nhiều lệnh FROM và một lệnh mới AS <stage-name>. Ngoài ra, lệnh COPY trong giai đoạn thứ hai sao chép từ giai đoạn trước bằng cách sử dụng --from.

```dockerfile

# Stage 1: Build Environment
FROM builder-image AS build-stage
# Cài đặt công cụ build (ví dụ: Maven, Gradle)
# Sao chép mã nguồn
# Lệnh build (ví dụ: biên dịch, đóng gói)

# Stage 2: Runtime environment
FROM runtime-image AS final-stage
# Sao chép các sản phẩm từ giai đoạn build (ví dụ: file JAR)
COPY --from=build-stage /path/in/build/stage /path/to/place/in/final/stage
# Định nghĩa cấu hình runtime (ví dụ: CMD, ENTRYPOINT)
```

Dockerfile này sử dụng hai giai đoạn:

- **Giai đoạn build**:
        Sử dụng một image cơ sở chứa các công cụ build cần thiết để biên dịch ứng dụng của bạn. Nó bao gồm các lệnh để cài đặt công cụ build, sao chép mã nguồn, và thực thi các lệnh build.
- **Giai đoạn runtime**:
        Sử dụng một image cơ sở nhỏ hơn, phù hợp để chạy ứng dụng của bạn. Nó sao chép các sản phẩm đã được biên dịch (ví dụ, file JAR) từ giai đoạn build. Cuối cùng, nó định nghĩa cấu hình runtime (sử dụng CMD hoặc ENTRYPOINT) để khởi động ứng dụng.

## Lợi ích của multi-stage builds:

- Giảm kích thước image: Bằng cách tách biệt các công cụ build ra khỏi môi trường runtime, bạn chỉ cần giữ lại những thành phần cần thiết để chạy ứng dụng.
- Tăng cường bảo mật: Image cuối cùng chỉ chứa những gì cần thiết để chạy ứng dụng, giảm thiểu rủi ro bảo mật từ các công cụ build không cần thiết.
- Tối ưu hóa hiệu suất: Sử dụng các image nhỏ hơn giúp giảm tải tài nguyên khi triển khai và truyền tải, từ đó tăng tốc quá trình phát triển và triển khai.

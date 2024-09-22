# Using the build cache
Xem xét Dockerfile dưới đây mà bạn đã tạo cho ứng dụng getting-started:

```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "./src/index.js"]
```

Khi bạn chạy lệnh docker build để tạo một image mới, Docker thực thi từng lệnh trong Dockerfile, tạo ra một lớp cho mỗi lệnh theo thứ tự được chỉ định. Đối với mỗi lệnh, Docker sẽ kiểm tra xem liệu nó có thể tái sử dụng kết quả từ một lần build trước đó không. Nếu Docker phát hiện rằng bạn đã thực thi lệnh tương tự trước đây, Docker không cần phải làm lại, thay vào đó, nó sẽ sử dụng kết quả đã được lưu trữ trong bộ nhớ đệm (cache). Điều này giúp quá trình build trở nên nhanh hơn và hiệu quả hơn, tiết kiệm thời gian và tài nguyên quý giá.

Sử dụng bộ nhớ đệm khi build cho phép bạn thực hiện các build nhanh hơn bằng cách tái sử dụng kết quả từ các build trước và bỏ qua những công việc không cần thiết. Để tối ưu hóa việc sử dụng bộ nhớ đệm và tránh việc build lại tốn kém thời gian, điều quan trọng là phải hiểu cách bộ nhớ đệm bị vô hiệu hóa (cache invalidation) hoạt động. Dưới đây là một số ví dụ về các tình huống có thể khiến bộ nhớ đệm **bị vô hiệu hóa**:

- Bất kỳ thay đổi nào đối với lệnh RUN: Docker phát hiện bất kỳ thay đổi nào và sẽ vô hiệu hóa bộ nhớ đệm nếu có bất kỳ sửa đổi nào đối với lệnh RUN trong Dockerfile của bạn. Khi đó, lớp tương ứng với lệnh RUN sẽ được xây dựng lại.

- Bất kỳ thay đổi nào đối với các tệp được sao chép vào image với COPY hoặc ADD: Docker theo dõi các thay đổi đối với các tệp trong thư mục dự án của bạn. Dù đó là sự thay đổi về nội dung hoặc thuộc tính như quyền hạn của tệp, Docker đều xem đây là dấu hiệu để vô hiệu hóa bộ nhớ đệm.

- Khi một lớp bị vô hiệu hóa, các lớp tiếp theo cũng sẽ bị vô hiệu hóa: Nếu bất kỳ lớp nào trước đó, bao gồm cả image cơ sở hoặc các lớp trung gian, bị vô hiệu hóa do thay đổi, Docker sẽ đảm bảo rằng các lớp sau đó dựa trên nó cũng sẽ bị vô hiệu hóa. Điều này giữ cho quá trình build được đồng bộ và ngăn ngừa sự không nhất quán.

Khi bạn viết hoặc chỉnh sửa Dockerfile, hãy chú ý đến các nguyên nhân vô hiệu hóa bộ nhớ đệm không cần thiết để đảm bảo rằng các build chạy nhanh và hiệu quả nhất có thể.

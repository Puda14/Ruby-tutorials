# Introduction

## Version Control Systems

Types of Version Control Systems: 
- Local Version Control Systems
- Centralized Version Control Systems
- Distributed Version Control Systems

**Local Version Control Systems**: Đây là một trong những mẫu đơn giản nhất và có cơ sở dữ liệu lưu giữ tất cả các thay đổi đối với tệp dưới sự kiểm soát sửa đổi (revision control). RCS là một trong những công cụ VCS phổ biến nhất. Nó giữ các bộ bản vá (sự khác biệt giữa các tệp) ở định dạng đặc biệt trên đĩa. Bằng cách thêm tất cả các bản vá (patches), nó có thể tạo lại giao diện của bất kỳ tệp nào tại bất kỳ thời điểm nào.

**Centralized Version Control Systems**: Các hệ thống kiểm soát phiên bản tập trung chỉ chứa một kho lưu trữ trên toàn cầu và mọi người dùng cần phải cam kết phản ánh những thay đổi của mình trong kho lưu trữ. Người khác có thể thấy những thay đổi của bạn bằng cách cập nhật.

Cần có hai điều để người khác có thể nhìn thấy những thay đổi của bạn, đó là:
- You commit
- They update 

**Lợi ích** của CVCS (Hệ thống kiểm soát phiên bản tập trung) tạo ra sự hợp tác giữa các nhà phát triển cùng với việc cung cấp cái nhìn sâu sắc ở một mức độ nhất định về những gì mọi người khác đang làm trong dự án. Nó cho phép quản trị viên kiểm soát chi tiết ai có thể làm gì.

Nó cũng có một số **nhược điểm** dẫn đến sự phát triển của DVS. Rõ ràng nhất là điểm lỗi duy nhất mà kho lưu trữ tập trung thể hiện nếu nó ngừng hoạt động trong khoảng thời gian đó và không thể cộng tác và lưu các thay đổi được phiên bản. Điều gì sẽ xảy ra nếu đĩa cứng của cơ sở dữ liệu trung tâm bị hỏng và các bản sao lưu thích hợp không được lưu giữ? Bạn hoàn toàn mất tất cả mọi thứ.

**Distributed Version Control Systems**: Hệ thống kiểm soát phiên bản phân tán chứa nhiều kho lưu trữ. Mỗi người dùng có kho lưu trữ và bản sao làm việc riêng. Chỉ thực hiện các thay đổi của bạn sẽ không cấp cho người khác quyền truy cập vào các thay đổi của bạn. Điều này là do cam kết sẽ phản ánh những thay đổi đó trong kho lưu trữ cục bộ của bạn và bạn cần đẩy chúng để hiển thị chúng trên kho lưu trữ trung tâm. Tương tự, khi cập nhật, bạn sẽ không nhận được những thay đổi của người khác trừ khi bạn đã đưa những thay đổi đó vào kho lưu trữ của mình trước tiên.

Để hiển thị những thay đổi của bạn cho người khác, cần có 4 điều sau:
- You commit
- You push
- They pull
- They update
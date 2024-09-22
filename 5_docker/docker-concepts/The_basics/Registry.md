# Registry

Bây giờ bạn đã biết container image là gì và cách nó hoạt động, có thể bạn tự hỏi: “Lưu trữ các image này ở đâu?”

Bạn có thể lưu trữ các container image trên hệ thống máy tính của mình, nhưng nếu bạn muốn chia sẻ chúng với bạn bè hoặc sử dụng trên một máy khác thì sao? Đó là lúc image registry xuất hiện.

Một image registry là một vị trí tập trung để lưu trữ và chia sẻ các container image của bạn. Nó có thể là công khai hoặc riêng tư. Docker Hub là một registry công khai mà ai cũng có thể sử dụng và là registry mặc định.

Mặc dù Docker Hub là một lựa chọn phổ biến, nhưng hiện nay có nhiều registry container khác, bao gồm Amazon Elastic Container Registry (ECR), Azure Container Registry (ACR) và Google Container Registry (GCR). Bạn thậm chí có thể chạy một registry riêng trên hệ thống cục bộ hoặc trong tổ chức của mình, ví dụ như Harbor, JFrog Artifactory, GitLab Container Registry, v.v.

## Registry vs. repository
Khi làm việc với registries, bạn có thể nghe thấy các thuật ngữ **registry** và **repository** được sử dụng như thể chúng có thể thay thế cho nhau. Mặc dù chúng có liên quan, nhưng không hoàn toàn giống nhau.

- **Registry** là một vị trí tập trung lưu trữ và quản lý các container image.

- **Repository** là một tập hợp các container image liên quan trong một registry. Hãy nghĩ nó như một thư mục nơi bạn tổ chức các image theo từng dự án. Mỗi repository có thể chứa một hoặc nhiều container image.

Sơ đồ dưới đây cho thấy mối quan hệ giữa registry, repositories và các image (ở đây có thể hình dung là các cấp độ tổ chức từ registry xuống repository và image).

<table>
  <tr>
    <th colspan="2">Registry</th>
  </tr>
  <tr>
    <td><b>Repository A</b></td>
    <td>
      <ul>
        <li>Image: project-a:v1.0</li>
        <li>Image: project-a:v2.0</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><b>Repository B</b></td>
    <td>
      <ul>
        <li>Image: project-b:v1.0</li>
        <li>Image: project-b:v1.1</li>
        <li>Image: project-b:v2.0</li>
      </ul>
    </td>
  </tr>
</table>


> Bạn có thể tạo một repository riêng tư và repository công khai không giới hạn khi sử dụng phiên bản miễn phí của Docker Hub. Để biết thêm thông tin, hãy truy cập trang đăng ký của Docker Hub.

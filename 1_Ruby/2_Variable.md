# Types of Variables
- Local variables
- Instance variables
- Class variables
- Global variables

| Symbol | Type of Variable |
|-------|-------|
| [a-z] or _ | Local Variable |
| @ | Instance Variable |
| @@ | 	Class Variable |
| $| Global Variable |

**Local Variable:**

Tên biến cục bộ luôn bắt đầu bằng chữ cái viết thường (a-z) hoặc dấu gạch dưới (_). Các biến này là cục bộ của cấu trúc mã mà chúng được khai báo. Một biến cục bộ chỉ có thể truy cập được trong khối khởi tạo của nó. Các biến cục bộ không có sẵn bên ngoài phương thức. *Không cần phải khởi tạo các biến cục bộ*.

```ruby
age = 10
_Age = 20```ruby
```

**Instance Variable:**

Tên biến đối tượng luôn bắt đầu bằng dấu @. Chúng tương tự như các biến Lớp nhưng giá trị của chúng là cục bộ đối với các phiên bản cụ thể của một đối tượng. Các biến thể hiện có sẵn trên các phương thức cho bất kỳ thể hiện hoặc đối tượng được chỉ định nào, tức là các biến thể hiện có thể thay đổi từ đối tượng này sang đối tượng khác. *Không cần phải khởi tạo các biến thể hiện và biến thể hiện chưa được khởi tạo luôn chứa giá trị nil*.

```ruby
#!/usr/bin/ruby 
# Ruby program to illustrate  
# the Instance Variables 
  
class Customer 
      
 def initialize(id, name, addr) 
       
# Instance Variables      
 @cust_id = id 
 @cust_name = name 
 @cust_addr = addr 
 end
   
 # displaying result 
 def display_details() 
 puts "Customer id #@cust_id"
 puts "Customer name #@cust_name"
 puts "Customer address #@cust_addr"
 end
end
  
# Create Objects 
cust1 = Customer.new("1", "John", "Wisdom Apartments, Ludhiya") 
cust2 = Customer.new("2", "Poul", "New Empire road, Khandala") 
  
# Call Methods 
cust1.display_details() 
cust2.display_details() 
```

**Class Variable:**

Tên biến lớp luôn bắt đầu bằng ký hiệu @@. Nó có sẵn trên các đối tượng khác nhau. Một biến lớp thuộc về lớp và nó là một đặc tính của một lớp. Chúng cần được khởi tạo trước khi sử dụng. Một cách suy nghĩ khác về các biến lớp là các biến toàn cục trong ngữ cảnh của một lớp duy nhất. Một biến lớp được chia sẻ bởi tất cả các lớp con của lớp đó. *Một biến lớp chưa được khởi tạo sẽ dẫn đến lỗi*.

```ruby
#!/usr/bin/ruby 
# Ruby program to illustrate  
# the Class  Variables 
  
class Customer 
      
# class variable 
 @@no_of_customers = 0
   
 def initialize(id, name, addr) 
       
# An instance Variable 
 @cust_id = id 
 @cust_name = name 
 @cust_addr = addr 
 end
  
# displaying result  
 def display_details() 
 puts "Customer id #@cust_id"
 puts "Customer name #@cust_name"
 puts "Customer address #@cust_addr"
 end
   
 def total_no_of_customers() 
       
# class variable 
 @@no_of_customers += 1
 puts "Total number of customers: #@@no_of_customers"
    end
end
  
# Create Objects 
cust1 = Customer.new("1", "John", "Wisdom Apartments, Ludhiya") 
cust2 = Customer.new("2", "Poul", "New Empire road, Khandala") 
  
# Call Methods 
cust1.display_details() 
cust1.total_no_of_customers() 
cust2.display_details() 
cust2.total_no_of_customers() 
```

**Global Variable :**

Tên biến toàn cục luôn bắt đầu bằng $. Biến lớp không có sẵn trên các lớp. Nếu bạn muốn có một biến duy nhất có sẵn trên các lớp, bạn cần xác định một biến toàn cục. Phạm vi của nó là toàn cầu, có nghĩa là nó có thể được truy cập từ bất kỳ đâu trong một chương trình. Theo mặc định, *một biến toàn cục chưa được khởi tạo có giá trị nil* và việc sử dụng nó có thể khiến các chương trình trở nên khó hiểu và phức tạp.

```ruby
#!/usr/bin/ruby 
# Ruby program to illustrate  
# the Global  Variables 
  
#!/usr/bin/ruby 
  
# global variable 
$global_variable = 10
class Class1 
 def print_global 
 puts "Global variable in Class1 is #$global_variable"
 end
end
class Class2 
 def print_global 
 puts "Global variable in Class2 is #$global_variable"
 end
end
class1obj = Class1.new
class1obj.print_global 
class2obj = Class2.new
class2obj.print_global 
```
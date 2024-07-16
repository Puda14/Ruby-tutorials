# Ruby
## How ruby work ? 
Ruby là ngôn ngữ "pure Object-Oriented language".
## Data Types
Các kiểu dữ liệu dựa trên các class

- Numbers

Ruby có thể xử lý cả số nguyên và số dấu phẩy động. Theo kích thước của chúng, có hai loại số nguyên, một là Bignum và thứ hai là Fixnum.

```ruby
# Ruby program to illustrate the
# Numbers Data Type
 
# float type
distance = 0.1
 
# both integer and float type
time = 9.87 / 3600
speed = distance / time
puts "The average speed of a sprinter is #{speed} km/h"
```
- Boolean
```ruby
# Ruby program to illustrate the
# Boolean Data Type
 
if true
  puts "It is True!"
else
  puts "It is False!"
end
 
if nil
  puts "nil is True!"
else
  puts "nil is False!"
end
 
if 0
  puts "0 is True!"
else
  puts "0 is False!"
end
```

- Strings

Chuỗi là một nhóm các chữ cái đại diện cho một câu hoặc một từ. Chuỗi được xác định bằng cách đặt văn bản trong dấu ngoặc đơn (' ') hoặc dấu ngoặc kép (“ ”). Bạn có thể sử dụng cả dấu ngoặc kép và dấu ngoặc đơn để tạo chuỗi. Chuỗi là đối tượng của lớp String. Chuỗi trích dẫn kép cho phép ký hiệu thay thế và dấu gạch chéo ngược nhưng chuỗi trích dẫn đơn không cho phép thay thế và chỉ cho phép ký hiệu dấu gạch chéo ngược cho \\ và \\\'.

```ruby
# Ruby program to illustrate the
# Strings Data Type
 
#!/usr/bin/ruby -w
puts "String Data Type";
puts 'escape using "\\"';
puts 'That\'s right';
```

- Hashes

Một hàm băm gán giá trị của nó cho khóa của nó. Giá trị của khóa được gán bởi dấu =>. Một cặp khóa được phân tách bằng dấu phẩy giữa chúng và tất cả các cặp được đặt trong dấu ngoặc nhọn. Hàm băm trong Ruby giống như một đối tượng bằng chữ trong JavaScript hoặc một mảng kết hợp trong PHP. Chúng được tạo ra tương tự như mảng. Dấu phẩy ở cuối bị bỏ qua.

```ruby
# Ruby program to illustrate the
# Hashes Data Type
 
#!/usr/bin/ruby
hsh = colors = { "red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f }
hsh.each do |key, value|
 print key, " is ", value, "\n"
end
```
- Arrays

Một mảng lưu trữ dữ liệu hoặc danh sách dữ liệu. Nó có thể chứa tất cả các loại dữ liệu. Dữ liệu trong một mảng được phân tách bằng dấu phẩy ở giữa chúng và được đặt trong dấu ngoặc vuông. Vị trí của các phần tử trong mảng bắt đầu bằng 0. Dấu phẩy ở cuối bị bỏ qua.

```ruby
# Ruby program to illustrate the
# Arrays Data Type
 
#!/usr/bin/ruby
ary = [ "fred", 10, 3.14, "This is a string", "last element", ]
ary.each do |i|
 puts i
end
```
- Symbols

Biểu tượng là những chuỗi có trọng lượng nhẹ. Trước ký hiệu là dấu hai chấm (:). Chúng được sử dụng thay cho chuỗi vì chúng có thể chiếm ít bộ nhớ hơn. Biểu tượng có hiệu suất tốt hơn.
```ruby

# Ruby program to illustrate the
# Symbols Data Type
 
#!/usr/bin/ruby
domains = {:sk => "GeeksforGeeks", :no => "GFG", :hu => "Geeks"}
 
puts domains[:sk]
puts domains[:no]
puts domains[:hu]
```
## Types of Variables
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

## Ranges

Phạm vi Ruby mô tả một tập hợp các giá trị có phần đầu và phần cuối. Giá trị của một phạm vi có thể là số, ký tự, chuỗi hoặc đối tượng. Nó được xây dựng bằng cách sử dụng **start_point..end_point**, **start_point…endpoint literals**, or with **::new**. Nó cung cấp sự linh hoạt cho mã và giảm kích thước của code.

```ruby
# Ruby program to demonstrate  
# the Range in Ruby 
   
# Array value separator 
$, =", " 
   
# using start_point..end_point 
# to_a is used to convert it  
# into array 
range_op = (7 .. 10).to_a 
   
# displaying result 
puts "#{range_op}"
   
# using start_point...end_point 
# to_a is used to convert it  
# into array 
range_op1 = (7 ... 10).to_a 
   
# displaying result 
puts "#{range_op1}"
```

Output:
```ruby
[7, 8, 9, 10]
[7, 8, 9]
```

Ruby cung cấp 3 loại phạm vi như sau:

**Ranges as Sequences**

```ruby
# Ruby program to illustrate the ranges as sequences 
  
#!/usr/bin/ruby    
  
# input the value which lies between  
# the range 6 and 8     
ranges = 6..8   
  
# print true if the value is lies 
# between the range otherwise  
# print false  
puts ranges.include?(3) 
  
# print the maximum value which lies 
# between the range  
ans = ranges.max    
puts "Maximum value = #{ans}"   
  
# print the minimum value which lies 
# between the range  
ans = ranges.min    
puts "Minimum value = #{ans}"   
    
  
# Iterate 3 times from 6 to 8 
# and print the value 
ranges.each do |digit|    
   puts "In Loop #{digit}"   
end  
```

Output

```ruby
false
Maximum value = 8
Minimum value = 6
In Loop 6
In Loop 7
In Loop 8
```

**Ranges as Conditions**

```ruby
# Ruby program to illustrate the ranges as condition 
  
#!/usr/bin/ruby 
  
# given number 
num = 4152  
    
result = case num    
   when 1000..2000 then "Lies Between 1000 and 2000"   
   when 2000..3000 then "Lies Between 2000 and 3000"
   when 4000..5000 then "Lies Between 4000 and 5000" 
   when 6000..7000 then "Lies Between 6000 and 7000" 
         
   else "Above 7000"   
end   
    
puts result   
```

Output
```ruby
Lies Between 4000 and 5000
```

**Ranges as Intervals**

```ruby
# Ruby program to illustrate the ranges as intervals 
  
#!/usr/bin/ruby 
  
# using if statement  
if (('A'..'Z') === 'D') 
  
   # display the value 
   puts "D lies in the range of A to Z"
  
# end of if 
end
  
# using if statement  
if ((1..100) === 77) 
  
  # display the value 
  puts "77 lies in the range of 1 to 100"
  
# end of if 
end
```
Output
```ruby
D lies in the range of A to Z
77 lies in the range of 1 to 100
```

**Reverse**

```ruby
# Ruby program to print the reverse 
# order using the range operator 
  
#!/usr/bin/ruby 
  
# using ranges 
# but it will not give any output 
puts ('Z'..'W').to_a  
   
# using reverse() method which will  
# print given range in the reverse order 
puts ('W'..'Z').to_a.reverse 
```

## Operators

### Arithmetic Operators
```ruby
# Ruby program to demonstrate 
# the Arithmetic Operators

# Addition
puts ("Addition:")
puts (10 + 20)

# Subtraction
puts ("Subtraction:")
puts (40 - 20)

# Division
puts ("Division:")
puts (100 / 20)

# Multiplication
puts ("Multiplication:")
puts (10 * 20)

# Modulus
puts ("Modulus:")
puts (20 % 7)

# Exponent
puts ("Exponent:")
puts (2 ** 4)
``` 

Output

```ruby
Addition:
30
Subtraction:
20
Division:
5
Multiplication:
200
Modulus:
6
Exponent:
16
```

### Comparison Operators

```ruby
# Ruby program to demonstrate 
# the Comparison Operators
 
puts "Equal To Operator:"
puts (10 == 20)
 
puts "Not Equal To Operator:"
puts (40 != 20)
 
puts "Greater than Operator"
puts (100 > 20)
 
puts "Less than Operator"
puts (10  < 20)
 
puts "Less than Equal To Operator"
puts (2  <=  5)

puts "Greater than Equal To Operator"
puts (2  >=  5)
 
puts "Combined combination operator"
puts(20 <=> 20)
puts(10 <=> 20)
puts(20 <=> 10)
```

Output
```ruby
Equal To Operator:
false
Not Equal To Operator:
true
Greater than Operator
true
Less than Operator
true
Less than Equal To Operator
true
Greater than Equal To Operator
false
Combined combination operator
0
-1
1
```

Combined combination (`<=>`) operator return 0 when first operand equal to second, return 1 when first operand is greater than second operand, and return -1 when first operator is less than second operand.

Case Equality Operator(`===`) It will test equality in case statement.
‘.eql?’ This operator returns true if the receiver and argument have both the same type and equal values.

Equal To(`==`) operator checks whether the two given operands are equal or not. If so, it returns true. Otherwise it returns false. For example, 5==5 will return true.

Not Equal To(`!=`) operator checks whether the two given operands are equal or not. If not, it returns true. Otherwise it returns false. It is the exact boolean complement of the ‘==’ operator. For example, 5!=5 will return false.

### Logical Operators

```ruby
# Ruby program to demonstrate 
# the Logical Operators
 
# Variables
a = 10
b = 20
c = 30

# using && operator
if a == 10 && b == 20 && c == 30
    puts "Logical AND Operator"
    puts result = a * b * c
end

# using || operator
puts "Logical OR operator"
if a == 10 || b == 20
    puts result = a + b + c
end

# using ! operator
puts "Logical Not Operator"
puts !(true)
```

Output

```ruby
Logical AND Operator
6000
Logical OR operator
60
Logical Not Operator
false
```

### Assignment Operators

```ruby
# Ruby program to demonstrate 
# the Assignments Operators
 
puts "Simple assignment operator"
puts a = 20

puts "Add AND assignment operator"
puts a += 10

puts "Subtract AND assignment operator"
puts a -= 5

puts "Multiply AND assignment operator"
puts a *= 10

puts "Divide AND assignment operator"
puts a /= 4

puts "Modulus AND assignment operator"
puts a %= 3

puts "Exponent AND assignment operator"
puts a **= 3
```

Output

```ruby
Simple assignment operator
20
Add AND assignment operator
30
Subtract AND assignment operator
25
Multiply AND assignment operator
250
Divide AND assignment operator
62
Modulus AND assignment operator
2
Exponent AND assignment operator
8
```

### Bitwise Operators

```ruby
# Ruby program to demonstrate 
# the Bitwise Operators

# variables
a = 10
b = 20

puts "Bitwise AND operator"
puts (a & b)

puts "Bitwise OR operator"
puts (a |b)

puts "Bitwise XOR operator"
puts (a ^ b)

puts "Bitwise Complement operator"
puts (~a)

puts "Binary right shift operator"
puts (a >> 2)

puts "Binary left shift operator"
puts (a << 2)
```

Output

```ruby
Bitwise AND operator
0
Bitwise OR operator
30
Bitwise XOR operator
30
Bitwise Complement operator
-11
Binary right shift operator
2
Binary left shift operator
40
```

### Ternary Operator

```ruby
# Ruby program to demonstrate 
# the Ternary Operator

# variable
marks_obtained = 100

# using ternary operator
result = marks_obtained > 40 ? 'Pass' : 'Fail'

# displaying output
puts result
```

Output

```ruby
Pass
```

### Range Operators

Double Dot (`..`) operator is used to create a specified sequence range in which both the starting and ending element will be inclusive. For example, 7 .. 10 will create a sequence like 7, 8, 9, 10.

Triple Dot (`...`) operator is used to create a specified sequence range in which only starting element will be inclusive and ending element will be exclusive. For example, 7 .. 10 will create a sequence like 7, 8, 9.



```ruby
# Ruby program to demonstrate 
# the Range Operator

# Array value separator
$, =", "  

# using .. Operator
range_op = (7 .. 10).to_a

# displaying result
puts "#{range_op}"

# using ... Operator
range_op1 = (7 ... 10).to_a

# displaying result
puts "#{range_op1}"
```

Output

```ruby
[7, 8, 9, 10]
[7, 8, 9]
```

### defined? Operator

`defined? expression_to_be_checked `

```ruby
# Ruby program to demonstrate 
# the defined? Operator

# variables
GFG =  1
Geeks = 70


puts ("define? Operator Results")

# using defined? Operator
# it returns constant
puts defined? GFG        

# it returns constant
puts defined? Geeks 

# it returns nil
puts defined? a  
       
# it returns expression
puts defined? 50   
```

Output

```ruby
define? Operator Results
constant
constant

expression
```

### Dot “.” and Double Colon “::” Operators

Dot (`.`) operator is used to access the methods of a class.

Double Colon (`::`) operator is used to access the constants, class methods, and instance methods defined within a class or module to anywhere outside the class or module. The important point to remember is that classes and methods may be considered constants in Ruby and also prefix the :: Const_name with the expression which returns the appropriate class object. If no prefix expression is used then by default the main Object class is used.

```ruby
# Ruby program to demonstrate 
# Dot “.” and Double Colon 
# “::” Operators

# defined constant on main Object class
CONS = 5   

# define module
module Geeks
    
   CONS = 5
   
   # set global CONS to 7
   ::CONS = 7   
   
    # set local CONS to 10
   CONS = 10    
end

# displaying global CONS value
puts CONS     

# displaying local "Geeks" CONS value
# using :: operator
puts Geeks::CONS   

class Gfg
    def Geeks2
        puts "Dot Operator"
    end
end

# calling Geeks2 module using 
# Dot(.) operator
puts Gfg.new.Geeks2
```

Output

```ruby
7
10
Dot Operator
main.rb:14: warning: already initialized constant CONS
main.rb:6: warning: previous definition of CONS was here
main.rb:17: warning: already initialized constant Geeks::CONS
main.rb:11: warning: previous definition of CONS was here
```
## Operator Overloading

```ruby
```

```ruby
```

## unless Statement and unless Modifier

Ruby cung cấp một câu lệnh đặc biệt được gọi là câu lệnh unless. Câu lệnh này được thực thi khi điều kiện đã cho là sai. Nó ngược lại với câu lệnh if. Trong câu lệnh if, khối mã sẽ thực thi khi điều kiện đã cho là đúng, tuy nhiên trong câu lệnh unless, khối mã sẽ thực thi khi điều kiện đã cho là sai.

Unless câu lệnh được sử dụng khi chúng ta yêu cầu in điều kiện sai, chúng ta không thể sử dụng câu lệnh và toán tử if để in câu lệnh sai vì câu lệnh và toán tử if luôn hoạt động với điều kiện đúng.


```ruby
unless condition

   # code

else

  # code

end
```

```ruby
statement unless condition

# Ruby program to illustrate  
# unless modifier  
  
# variable b 
b = 0
  
# unless is behave as a modifier 
# here 'b += 2 ' is the statement 
# b.zero? is the condition 
b += 2 unless b.zero? 
    puts(b) # 0
```

## Decision Making

```ruby
if condition 
   # statements to be executed 
end  
```

```ruby
if condition 
   # code if the condition is true  
else  
   # code if the condition is false  
end  
```

```ruby
if condition1

# code to be executed if condition1is true
  
elsif condition2
  
# code to be executed if condition2 is true  

else condition3

# code to be executed if condition3 is true  
end  
```

```ruby
test-expression ? if-true-expression : if-false-expression 
```

## Loops

```ruby
while conditional [do]
 # code to be executed
end
```

```ruby
for variable_name[, variable...] in expression [do]

   # code to be executed

end
```

```ruby
loop do

 # code to be executed

break if Boolean_Expression

end
```

```ruby
until conditional [do]

 # code to be executed

end
```

```ruby
case expression

when expression 1
  # your code

when expression 2
  # your code
.
.

else
  # your code
end
```

## Control Flow Alteration

Thoát vòng lặp
```ruby
break
```

Giống `continue` trong C/C++

```ruby
next
```

Thực hiện lại ở vòng lặp hiện tại

```ruby
redo
```

Retry được sử dụng để khởi động lại một trình vòng lặp dựa trên một điều kiện nhất định hoặc bất kỳ lệnh gọi phương thức nào từ đầu. Nói một cách đơn giản, câu lệnh retry sẽ chuyển quyền điều khiển ngay từ đầu.

```ruby
retry
```

Thoát khỏi phương thức / hàm. Nếu trả ra nhiều giá trị thì các giá trị cách nhau bởi dấu `,`

```ruby
return
```

Ném và bắt được sử dụng để xác định cấu trúc điều khiển có thể được coi là ngắt đa cấp. Throw được sử dụng để ngắt vòng lặp hiện tại và chuyển điều khiển ra bên ngoài khối bắt. Điều tốt nhất về ném là nó có thể thoát ra khỏi vòng lặp hoặc các phương thức hiện tại hoặc chúng ta có thể nói nó có thể vượt qua bất kỳ cấp độ nào. Ở đây, Catch định nghĩa một "khối được gắn nhãn" của mã khiến khối lệnh thoát ra bằng khối ném. Thông tin chi tiết sẽ được thảo luận trong phần Xử lý ngoại lệ Ruby.

```ruby

# Ruby program to illustrate the throw/catch statement 
# for altering the control flow 
  
# defining a method 
def lessNumber(num) 
      
    # using throw statement 
    # here 'numberError' is its label 
    throw :numberError if num < 10
      
    # displaying result  
    puts "Number is Greater than 10!"
end
  
  
# catch block 
catch :numberError do
      
    # calling method 
    lessNumber(11) 
    lessNumber(78)  
      
    # exits catch block here 
    lessNumber(7) 
    lessNumber(4) 
end
  
puts "Outside Catch Block"
```

Output

```ruby
Number is Greater than 10!
Number is Greater than 10!
Outside Catch Block
```

```ruby
#Example
my_array = [1, 2, 3, 4, 5, 6, 7, 8, 100]
my_hash = {"Joe" => "male", "Jim" => "male", "Patty" => "female"}
#select method with array
my_array.select{|item| item%2==0 }
#select method with hash
my_hash.select{|name, gender| gender == "male" }
#map method with array
my_array.map{|item| item*2}
#inject method with array
my_array.inject(0){|running_total, item| running_total + item} # => 136
```

## BEGIN and END Blocks

Mọi tệp nguồn Ruby có thể chạy dưới dạng khối BEGIN khi tệp đang được tải và chạy khối END sau khi chương trình thực thi xong. Các câu lệnh BEGIN và END khác nhau. Một chương trình có thể chứa nhiều khối BEGIN và END. Nếu có nhiều hơn một câu lệnh BEGIN trong một chương trình, chúng sẽ được thực hiện theo thứ tự. Nếu có nhiều hơn một câu lệnh END, chúng sẽ được thực hiện theo thứ tự ngược lại. cái END đầu tiên được thực thi cuối cùng. Dấu ngoặc nhọn mở luôn đứng sau từ khóa BEGIN và END.


```ruby
BEGIN{
Code
.
.
.}
END{
.
.
.}
```

## File Handling

Common `modes` for File Handling
- `r` : Read-only mode for a file.
- `r+` : Read-Write mode for a file.
- `w` : Write-only mode for a file.
- `w+` : Read-Write mode for a file.
- `a` : Write-only mode, if file exists it will append the data otherwise a new file will be created.
- `a+` : Read and Write mode, if file exists it will append the data otherwise a new file will be created.


```ruby
fileobject = File.new("filename.txt", "mode")
fileobject.syswrite("Text to write into the file")
fileobject.close()
```

```ruby
# File Handling Program 
  
# Opening a file 
fileobject = File.open("sample.txt", "r");  
  
# Reading the first n characters from a file 
puts(fileobject.sysread(21)); 
  
# Closing a file 
fileobject.close();                          
  
# Opening a file 
fileobject = File.open("sample.txt", "r");      
  
# Read the values as an array of lines 
print(fileobject.readlines);              
puts 
  
# Closing a file 
fileobject.close();                         
  
# Opening a file 
fileobject = File.open("sample.txt", "r");  
  
# Read the entire content from a file 
print(fileobject.read());     
  
# Closing a file 
fileobject.close();         
```

```ruby
# Rename the file name 
puts File.rename("sample.txt", "newSample.txt")  
  
# Delete the existing file 
puts File.delete("sample1.txt")     
  
# Checking the old filename is existing or not  
puts File.file?("sample.txt") 
  
# Checking the renamed file is exiting or not 
puts File.file?("newSample.txt") 
  
# Checking the file have read permission 
puts File.readable?("newSample.txt") 
  
 # Checking the file have write permission 
puts File.writable?("newSample.txt")   
```
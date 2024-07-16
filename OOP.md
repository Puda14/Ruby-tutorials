# Methods

## Methods

```ruby
def method_name
# Statement 1
# Statement 2
.
.
end
```

```ruby
def method_name(var1, var2, var3)
# Statement 1
# Statement 2
.
.
end
```

Variable Number of Parameters: Ruby cho phép lập trình viên xác định một phương thức có thể lấy số lượng đối số thay đổi. Nó rất hữu ích khi người dùng không biết số lượng tham số được truyền trong khi xác định phương thức.

```ruby
def method_name(*variable_name)
# Statement 1
# Statement 2
.
.
end
```

- Methods return the value of the last **statement executed**.
- An explicit return statement can also be used to return from function with a
value, prior to the end of the function declaration.

## Class method and instance method

```ruby
#Example
class Invoice
 # class method
 def self.print_out
  "Printed out invoice"
 end
 # instance method
 def convert_to_pdf
  "Converted to PD"
 end
end
puts "1.Execute class method"
puts Invoice.print_out
puts "2.Execute instance method"
puts Invoice.new.convert_to_pdf
```
```ruby
#Result
1.Execute class method
Printed out invoice
2.Execute instance method
Converted to PD
```

## Block, Proc, Lambda

### Block
- Blocks are enclosed in a do /end statement or between brackets `{}`, and they can have multiple arguments.
- The argument names are defined between two pipe `|` characters.
- The use of blocks is fundamental to the use of iterators.

```ruby
#Example
1.upto(10){|x| puts x}
1.upto(10) do |x|
 puts x
end
1.upto(10) # No block specified
{|x| puts x} # Syntax error: block not after an invocation
```

**Implicit block**: Ruby methods can implicitly take a block, without needing to specify this in the parameter list.

```ruby
#Example
def hello(&block)
 yield
end

hello do
 puts " Implicit block"
end
```

```ruby
#Result
Implicit block
```

**Explicit block**:
- Ruby allows to pass any object to a method and have the method attempt to use this object as its block. If we put an ampersand in front of the last parameter to a method, Ruby will try to treat this parameter as the block method.
- When we write our method definition, we can explicitly state that we expect this method to possibly take a block. Ruby uses the ampersand for this as well.
- If the parameter is already a Proc object, Ruby will simply associate it with the method as its block. If the parameter is not a Proc, Ruby will try to convert it into one (by calling to_proc on it) before associating it with the method as its block.
- block is a Proc object, instead of yielding to it, we can call it.

```ruby
def greet(name, &block)
  puts "Hello, #{name}!"
  block.call if block_given?
end
```

```ruby
greet("Alice") do
  puts "Welcome to our community!"
end

# Output:
# Hello, Alice!
# Welcome to our community!
```

```ruby
my_proc = Proc.new { puts "This is an explicit block" }
greet("Bob", &my_proc)

# Output:
# Hello, Bob!
# This is an explicit block
```

### Proc

A `proc` is an instance of the Proc class, which holds a code block to be executed, and can be stored in a variable. To create a proc, you call Proc.new and pass it a block.

```ruby
#Example
# A block is just a Proc!
def what_am_i(&block)
 block.class
end
puts what_am_i {}
# => Proc
#--------------------------------------
square = Proc.new do |n|
 n ** 2
end
square.call (2)
#Result
#4
```

### Lambda

Lambda is an anonymous function:
- It has no name (hence anonymous)
- Used when you don't want the overhead/formality of a normal function
- Is not explicitly referenced more than once, unless passed as an argument to another function

```ruby
#Example
puts "1. Execute square"
square = lambda {|n| n ** 2}
puts " 2**2 = #{square.call (2)}"
```

```ruby
#Result
1. Execute square
2**2 = 4
```

**Lambda**:

- Tạo bằng `lambda` hoặc `->`.
- Kiểm tra số lượng tham số.
- return chỉ trả về từ lambda và tiếp tục thực thi phương thức bao quanh.

**Proc**:

- Tạo bằng `Proc.new`.
- Không kiểm tra số lượng tham số.
- return trả về từ phương thức bao quanh, có thể gây ra lỗi nếu không có phương thức bao quanh.

Cả lambda và proc đều là đối tượng của lớp Proc, nhưng chúng có hành vi khác nhau khi kiểm tra số lượng tham số và xử lý từ khóa return. 

#### Summary differences
- Procs are objects, blocks are not.
- At most one block can appear in an argument list.
- Lambdas check the number of arguments, while procs do not.
- Lambdas and procs treat the `return` keyword differently.

## Method Visibility

Method visibility depends on the three types of access modifiers of a class in Ruby:
- Public Access Modifier
- Protected Access Modifier
- Private Access Modifier

```ruby
# program to illustrate public access modifier 
  
# defining class  
class Geeks 
  
    # methods are public by default      
    def publicMethod1  
        puts "publicMethod1 called!"
    end
  
    # using public keyword  
    public  
      
    def publicMethod2  
        puts "publicMethod2 called!"
    end
      
end
  
# creating the object  
obj = Geeks.new() 
  
# calling methods   
obj.publicMethod1()  #publicMethod1 called!
obj.publicMethod2()  #publicMethod2 called!
```

```ruby
 protected  
 def publicMethod1  
        puts "publicMethod1 called!"
 end
```

```ruby
 private  
 def publicMethod1  
        puts "publicMethod1 called!"
 end
```

```ruby
 public  
 def publicMethod1  
        puts "publicMethod1 called!"
 end
```

## Hook Methods

There are several Ruby Hook Methods, but majorly, the followings have major roles to play: 

1. Included
2. Prepended
3. Extended
4. Inherited
5. method_missing


**Included**

Phương thức này được sử dụng để bao gồm một phương thức hoặc thuộc tính hoặc mô-đun vào một mô-đun khác. Phương thức này làm cho mô-đun được gạch chân có sẵn cho các phiên bản của lớp. Ví dụ sau giải thích cách sử dụng và hoạt động của phương thức include.

Ví dụ này là một mã đơn giản để tạo nhận xét khi mô-đun được thực thi trong lớp chứa nó.

```ruby

# Declaring a module to greet a person
module Greetings
 
  def self.included(person_to_be_greeted) 
 
    puts "The #{person_to_be_greeted} is welcomed with an open heart !"
  end
end
 
 
# Class where the module is included
class Person
 
  include Greetings # implementation of the include statement
  # => The Person is welcomed with an open heart !
end
```

**Prepended**

Phương pháp này được đưa ra bởi Ruby 2.0. Điều này hơi khác so với những gì chúng tôi quan sát được ở trên. Phương pháp chuẩn bị trước cung cấp một cách khác để mở rộng chức năng của các mô-đun ở những nơi khác nhau. Điều này sử dụng khái niệm ghi đè. Các mô-đun có thể được ghi đè bằng các phương thức được xác định trong lớp mục tiêu.

Khái niệm về phương pháp Chuẩn bị trước có thể được hiểu bằng ví dụ tự giải thích sau:


```ruby

# Code as an example for prepend method
module Ruby
 
  def self.prepended(target)# Implementation of prepend method
    puts "#{self} has been prepended to #{target}"
  end
 
  def Type
    "The Type belongs to Ruby"
  end
end
 
class Coding
 
  prepend Ruby # the module Ruby is prepended
end
 
# Method call
puts Coding.new.Type 

#Ruby has been prepended to Coding
#The Type belongs to Ruby
```

**Extended**

Phương thức này hơi khác một chút so với cả phương thức include và prepend. Trong khi include áp dụng các phương thức trong một mô-đun nhất định cho thể hiện của một lớp, thì phần mở rộng áp dụng các phương thức đó cho cùng một lớp.

Việc thực thi đoạn mã được đề cập ở trên bằng phương thức mở rộng có thể được thực hiện như sau:

```ruby
# Code as  an example for extend method
module Ruby
 
  def self.extended(target)
    puts "#{self} was extended by #{target}"
  end
 
  def Type
    "The Type is Ruby"
  end
end
 
class Coding
 
  extend Ruby # Extending the module Ruby
end
 
# Method calling
puts Coding.Type
#Ruby was extended by Coding
#The Type is Ruby
```

**Inherited**

Kế thừa như một khái niệm là một trong những khái niệm quan trọng nhất của Lập trình hướng đối tượng và phổ biến trong hầu hết mọi ngôn ngữ lập trình. Trong ruby, chúng tôi xử lý các đồ vật được lấy cảm hứng từ đời thực và do đó, các thao tác Oops đóng một vai trò rất quan trọng ở đó. Phương thức kế thừa được gọi bất cứ khi nào một lớp con của một lớp được triển khai. Đó là một phương pháp tạo một lớp con từ lớp cha.

Ví dụ sau đây cho thấy điều tương tự:

```ruby

# Making the parent Vehicle class
class Vehicle
 
  def self.inherited(car_type)
    puts "#{car_type} is a kind of Vehicle"
  end
 
end
 
# Target class
class Hyundai < Vehicle #Inhereting the Vehicle class
end
#Hyundai is a kind of Vehicle
```

**method_missing**

Method_missing là một trong những phương thức được sử dụng rộng rãi nhất trong Ruby. Điều này xảy ra khi người ta cố gắng gọi một phương thức trên một đối tượng không tồn tại.

Ví dụ sau giải thích hoạt động của nó:

```ruby
# The main class
class Ruby
 
  def method_missing(input, *args) # method_missing function in action
     "#{input} not defined on #{self}"
  end
 
  def Type
    "The Type is Ruby"
  end
end
 
var = Ruby.new
 
# Calling a method that exists
puts var.Type    
 
# Calling a method that does not exist
puts var.Name  
#The Type is Ruby
#Name not defined on #<Ruby:0x0000000002363290> (object var)
```

## Method overriding

```ruby
# Ruby program of method overriding
 
# define a class
class Box
   # constructor method
   def initialize(width, height)
      @w, @h = width, height
   end
   # instance method
   def getArea
      @w * @h
   end
end
 
# define a subclass
class BigBox < Box
 
   # change existing getArea method as follows
   def getArea
      @area = @w * @h
      puts "Big box area is : #@area"
   end
end
 
# create an object
box = BigBox.new(15, 20)
 
# print the area using overridden method.
box.getArea()
```
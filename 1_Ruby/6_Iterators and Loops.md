# Iterators and Loops

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

## Loops

```ruby
while conditional [do]
 # code to be executed
end
```

```ruby
begin
# write something here...
end while conditional
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
begin
# write something here...
end until conditional
```

```ruby
collection.each{|item| #something
}

#or

collection.each do |item|
# something
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

## Select, map, inject

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
# Ruby

# Operators
## Comparison Operators

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

## Logical Operators

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

## Assignment Operators

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

## Bitwise Operators

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

## Ternary Operator

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

## Arithmetic Operators
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

## Range Operators

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

## Dot “.” and Double Colon “::” Operators

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
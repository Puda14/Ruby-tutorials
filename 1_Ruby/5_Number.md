# Number

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

## Operations precedence

Parenthesis -> Exponentiation -> Multiplication, Division -> Addition, Subtraction

```ruby
result = 5 + 15 * 20 - 2 / 6 ** 3 - (3 + 1)
puts "result = #{result}" # => 301
```

## Difference between integers and floats in Ruby

```ruby
2.7.1 :001 > 1.class
=> Integer
2.7.1 :002 > 1.0.class
=> Float
```

```ruby
puts 9 / 2
puts 9.0 / 2.0
puts 5 / 2.0
puts 2 ** 4
puts 0.4 - 0.3 == 0.1 # => false
```
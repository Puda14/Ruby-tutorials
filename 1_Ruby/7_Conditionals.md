# Conditionals

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

### If statement
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


### Case when

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

#Example
$age = 5
case $age
when 0 .. 2
puts "baby"
when 3 .. 6
puts "little child"
when 7 .. 12
puts "child"
when 13 .. 18
puts "youth"
else
puts "adult"
end
```

### Case in

```ruby
#Syntax
case <expression>
in <pattern1>
...
in <pattern2>
...
in <pattern3>
...
else
...
end

#Example
case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
in [*pre, String => x, String => y, *post]
p pre #=> ["a", 1]
p x #=> "b"
p y #=> "c"
p post #=> [2, "d", "e", "f", 3]
end
case {a: 1, b: "string test", c: 3}
in {a: Integer => m, b: String => str, c: Integer => n}
p "matched: #{m}"
p "matched #{str}"
p "matched #{n}"
else
p "not matched"
end
#"matched: 1"
#"matched string test"
#"matched 3"
```

### Ternary

```ruby
test-expression ? if-true-expression : if-false-expression 
```

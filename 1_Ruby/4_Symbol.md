# Symbol

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

- Symbol objects represent names and some strings inside the Ruby interpreter.

- They are generated using the `:name` and `:"string"` literals syntax, and by the `to_sym` methods.


```ruby
sym1 = :hello
sym2 = :"hello"
sym3 = "hello".to_sym
p sym1 #:hello
p sym2 #:hello
p sym3 #:hello
```

## Differences between Symbol and String

String is **mutable**, but Symbol isn’t.

```ruby
str = "hello"
sym = :hello
p "1.We can also use brackets with index number to change the letter"
str[0] = "k"
p "str = #{str}"
sym[0] = "k"
```

Symbol has better performance.

```ruby
5.times do
puts "hello".object_id
end
#=> difference object_id
```

```ruby
5.times do
puts :hello.object_id
end
#=> same object_id
```

Comparison to prove that symbols is faster than strings.

```ruby
require 'benchmark'
str = Benchmark.measure do
5000000.times do
"hello" == "hello"
end
end.total
sym = Benchmark.measure do
5000000.times do
:hello == :hello
end
end.total
puts "Benchmark"
puts "String: #{str}"
puts "Symbol: #{sym}"
```

```ruby
# => Benchmark
# => String: 0.52000000000000 (approximate, mildly differ for each runtime)
# => Symbol: 0.22999999999999 (approximate, mildly differ for each runtime)
```

## When should we use Symbol?

Symbol is used as the key of Hash

```ruby
profile = {name: "eddie", age: 18}
=> {:name=>"eddie", :age=>18}
```

Using String or Symbol as parameters

```ruby
class Cat
 attr_accessor :name
end
kitty = Cat.new
kitty.name = "Nancy"
```

Ruby sử dụng một kỹ thuật gọi là "interning" để quản lý Symbols. Khi một Symbol được tạo ra, Ruby lưu trữ nó trong một bảng nội bộ. Nếu Symbol đó đã tồn tại, Ruby sẽ tái sử dụng tham chiếu của Symbol đó thay vì tạo ra một đối tượng mới. Điều này đảm bảo rằng mỗi Symbol chỉ tồn tại một lần trong bộ nhớ.

```ruby
str1 = "hello"
str2 = "hello"

puts str1.object_id == str2.object_id  # False, mỗi String có object_id riêng
puts str1 == str2                      # True, giá trị giống nhau nhưng object khác nhau
```

```ruby
sym1 = :hello
sym2 = :hello

puts sym1.object_id == sym2.object_id  # True, cả hai Symbol đều dùng cùng một object_id
puts sym1 == sym2                      # True, giá trị và object đều giống nhau
```
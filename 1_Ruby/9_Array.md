# Array

- Arrays are ordered collections of objects, integer-indexed.
- Array class inherits from Object class and includes Enumerable module.
- Array Index starts at 0.
- A negative index is assumed to be relative to the end of the array.

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

## Creating array

Using the literal constructor `[]`

```ruby
arr = [1, "two", 3.0] # => [1, "two", 3.0]
```

Using class method

```ruby
arr = Array.new # => []
Array.new [8, 9] #=> [8, 9]
Array.new 3 # => [nil, nil, nil]
Array.new 3, true # => [true, true, true]
Array.new 3, "hello" # => ["hello", "hello", "hello"]
```

Other
Cú pháp `%w` được sử dụng để tạo ra một mảng các chuỗi mà không cần phải sử dụng dấu ngoặc kép và dấu phẩy để tách các phần tử. 

```ruby
animals = %w(monkey dog cat) # => ["monkey", "dog", "cat"]
```

## Accessing array

Using the :`[]` method:
```ruby
> arr = [1, 2, 3, 4, 5, 6]
> arr[2] # => 3
> arr[100] # => nil
> arr[-3] # => 4
> arr[2, 3] # => [3, 4, 5]
> arr[0, 0] # => []
> arr[1..4] # => [2, 3, 4, 5]
> arr[1..-3] # => [2, 3, 4]
```

Using other methods

```ruby
> arr = [1, 2, 3, 4, 5, 6]
> arr.at 0 # => 1
> arr.first # => 1
> arr.last # => 6
> arr.take 3 # => [1, 2, 3]
```

## Get information about an array

```ruby
> numbers = ["one", "two", "three", "four"]
> numbers.length # => 4
> numbers.empty? # => false
> numbers.include? "ten" # => false
```

## Array manipulation

Items can be added to the end of an array by using either `push` or `<<`

```ruby
> arr = [1, 2, 3, 4]
> arr.push 5 # => [1, 2, 3, 4, 5]
> arr << 6 << 7 << 8 # => [1, 2, 3, 4, 5, 6, 7, 8]
> a1 = [1]; a2 = [2, 3]; a3 = [4, 5, [6, 7]]
> a = a1 << a2 << a3 # => [1, [2, 3], [4, 5, [6, 7]]]
> a[1] # => [2, 3]
> a[1][0] # => 2
> a[2][2][0] # => 6
> a.flatten # => [1, 2, 3, 4, 5, 6, 7]
```

`unshift` will add new items to the beginning of an array.
```ruby
arr.unshift -1 # => [-1, 0, 1, 2, 3, 4, 5, 6]
```

With `insert` you can add a new element to an array at any position.

```ruby
arr.insert 3, "apple" # => [0, 1, 2, 'apple', 3, 4, 5, 6]
```

The method `pop` removes the last element in an array and returns it.

```ruby
arr = [1, 2, 3, 4, 5, 6]
arr.pop # => 6
arr # => [1, 2, 3, 4, 5]
```

To retrieve and at the same time remove the first item, use `shift`.

```ruby
arr.shift # => 1
arr # => [2, 3, 4, 5]
```

To `delete` an element at a particular index.

```ruby
arr.delete_at(2) # => 4
arr # => [2, 3, 5]
```

## Iterating over array

Array has `each` method, which includes from Enumerable module.

```ruby
arr = [1, 2, 3, 4, 5]
arr.each {|e| puts e} # => print: 1 2 3 4 5
```

Sometimes useful iterator is `reverse_each` which will iterate over the elements in the array in reverse order.

```ruby
arr = [1, 2, 3, 4, 5]
arr.reverse_each {|e| puts e} # => print: 5 4 3 2 1
```

The `map` method can be used to create a new array based on the original array.

```ruby
arr = [1, 2, 3, 4, 5]
arr.map {|a| 2 * a} # => [2, 4, 6, 8, 10]
arr # => [1, 2, 3, 4, 5]
arr.map! {|a| a ** 2} # => [1, 4, 9, 16, 25]
arr
```
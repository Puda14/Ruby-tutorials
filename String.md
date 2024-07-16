# String

## Introduction
- String are one of the most important data types in computer languages.

- A string is a sequence of characters.

- String objects may be created using `String.new`. When a string appears iterally in source code, it is known as a string literal.

- In Ruby, string literals are enclosed by single or double quotes.

```ruby
p "the quick brown fox jumps over the lazy dog"
p 'the quick brown fox jumps over the lazy dog'
p 'the quick brown fox jumps over the lazy dog'.class
```

```ruby
#Result
"the quick brown fox jumps over the lazy dog"
"the quick brown fox jumps over the lazy dog"
String
```

## String interpolation

```ruby
p "the quick brown " + "fox" + "jumps over the lazy " + "dog"
# string interpolation
puts "Enter name of an animal"
animal = gets.chomp
puts "Enter a noun"
noun = gets.chomp
p "the quick brown #{animal} jumps over the lazy #{noun}"
# try again with single quote
p 'the quick brown #{animal} jumps over the lazy #{noun}'
# Other example
p "the quick brown #{2 + 2}"
```

## Ruby accessing string elements

- It is possible to access string elements in Ruby.
- For this we use the square brackets `[]`. Inside the brackets, we can put strings, indexes, or ranges..

```ruby
2.7.1 :001 > msg = "Ruby language"
=> "Ruby language"
2.7.1 :002 > puts msg["Ruby"]
=> Ruby
2.7.1 :003 > puts msg[0]
=> "R"
2.7.1 :004 > puts msg[0..3]
=> "Ruby"
2.7.1 :005 > puts msg[-1]
=> "e"
2.7.1 :006 > puts msg[5] = "L"
=> "L"
```

## Ruby concatenating strings

Concatenating strings is creating one string from multiple strings.

```ruby
2.7.1 :001 > "Ruby" + " programming" + " language"
=> "Ruby programming language"
2.7.1 :002 > "Ruby" " programming" " language"
=> "Ruby programming language"
2.7.1 :003 > "Ruby" << " programming" << " language"
=> "Ruby programming language"
2.7.1 :004 > "Ruby".concat(" programming").concat(" language")
=> "Ruby programming language"
```

## Ruby comparing strings

We can compare two strings with a `==` operator or with a `eql?` method. They return true if the strings are equal and false if not

```ruby
2.7.1 :001 > "12" == "12"
=> true
2.7.1 :002 > "aa" == "ab"
=> false
2.7.1 :003 > "Jane".eql? "Jan"
=> false
2.7.1 :004 > "Jane".eql? "Jane"
=> true
```

## String methods

```ruby
p "###Upcase"
p "The quick brown fox jumps over the lazy dog".upcase
p "###Downcase"
p "The quick brown fox jumps over the lazy dog".downcase
p "###Swapcase"
p "The quick brown fox jumps over the lazy dog".swapcase
p "###Reverse"
p "The quick brown fox jumps over the lazy dog".reverse
p "###Reverse-Upcase"
p "The quick brown fox jumps over the lazy dog".reverse.upcase
```

```ruby
#Result
"###Upcase"
"THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG"
"###Downcase"
"the quick brown fox jumps over the lazy dog"
"###Swapcase"
"tHE QUICK BROWN FOX JUMPS OVER THE LAZY DOG"
"###Reverse"
"god yzal eht revo spmuj xof nworb kciuq ehT"
"###Reverse-Upcase"
"GOD YZAL EHT REVO SPMUJ XOF NWORB KCIUQ EHT"
```

### gsub

`gsub` method: `gsub(pattern, replacement)` or `gsub(pattern){match| block}`: return a copy of string with the *all occurrence* of pattern replaced by the second argument.

```ruby
2.7.1 :032 > s = "the quick brown fox jumps over the lazy dog"
=> "the quick brown fox jumps over the lazy dog"
2.7.1 :033 > s.gsub(/[aeiou]/, '*')
=> "th* q**ck br*wn f*x j*mps *v*r th* l*zy d*g"
2.7.1 :034 > s.gsub('e', '*')
=> "th* quick brown fox jumps ov*r th* lazy dog"
2.7.1 :035 > s.gsub('e') {|c| c.ord.to_s}
=> "th101 quick brown fox jumps ov101r th101 lazy dog"
2.7.1 :038 > s.gsub(/[eo]/, 'e' => 8, 'o' => 9)
=> "th8 quick br9wn f9x jumps 9vr th8 lazy d9g"
```

`gsub!` method: return string if a substitution was performed or *nil* if no.

```ruby
2.7.1 :047 > s = "the quick brown fox jumps over the lazy dog"
=> "the quick brown fox jumps over the lazy dog"
2.7.1 :048 > s.gsub!(/[aeiou]/, '*')
=> "th* q**ck br*wn f*x j*mps *v*r th* l*zy d*g"
2.7.1 :049 > s.gsub!('e', '*')
=> nil
2.7.1 :050 > s
=> "th* q**ck br*wn f*x j*mps *v*r th* l*zy d*g"
```

### split

`split` method: divides str into substrings based on a delimiter, returning an array of these substrings.

```ruby
2.7.1 :091 > s = "the quick brown fox jumps over the lazy dog"
=> "the quick brown fox jumps over the lazy dog"
2.7.1 :092 > s.split
=> ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
2.7.1 :093 > s.split(' ')
=> ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
2.7.1 :094 > s.split(/ /)
=> ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
2.7.1 :095 > s1 = " the quick brown fox jumps over the lazy dog "
=> " the quick brown fox jumps over the lazy dog "
2.7.1 :096 > s1.split(/ /)
=> ["", "the", "", "", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
2.7.1 :097 > s1.split(' ', 1)
=> [" the quick brown fox jumps over the lazy dog "]
2.7.1 :098 > s1.split(' ', 4)
=> ["the", "quick", "brown", "fox jumps over the lazy dog "]
2.7.1 :099 > s1.split(' ', 5)
=> ["the", "quick", "brown", "fox", "jumps over the lazy dog "]
2.7.1 :100 > s1.split(' ', -5)
=> ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog", ""]
2.7.1 :101 > s1.split(' ', -1)
=> ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog", ""]
2.7.1 :102 > "".split
=> []
2.7.1 :103 > "".split(',', 3)
=> []
```

Biểu thức chính quy `/ /` sẽ tìm tất cả các khoảng trắng, bao gồm cả những khoảng trắng liền kề và khoảng trắng ở đầu hoặc cuối chuỗi. Kết quả của split sử dụng biểu thức chính quy sẽ là các phần tử rỗng trong mảng nếu có khoảng trắng liền kề hoặc ở đầu/cuối chuỗi

Sử dụng chuỗi `' '` chỉ tách chuỗi tại mỗi khoảng trắng đơn và bỏ qua các khoảng trắng liền kề. Điều này có nghĩa là bạn sẽ không có các phần tử rỗng trong mảng

Tham số thứ hai của split là một giới hạn (limit), xác định số lượng phần tử tối đa trong mảng kết quả. Khi limit là số **âm hoặc 0**, Ruby sẽ bỏ qua giới hạn này và chia chuỗi thành tất cả các phần tử có thể.

### strip

`strip` method: returns a copy of str with leading and trailing whitespace removed.

```ruby
2.7.1 :127 > s = "\t \r the quick brown fox jumps over the lazy dog "
=> "\t \r the quick brown fox jumps over the lazy dog "
2.7.1 :128 > s.strip
=> "the quick brown fox jumps over the lazy dog"
2.7.1 :129 > s1 = "\t \r the quick brown fox jumps over the lazy dog \n "
=> "\t \r the quick brown fox jumps over the lazy dog "
2.7.1 :130 > s1.strip
=> "the quick brown fox jumps over the lazy dog"
```
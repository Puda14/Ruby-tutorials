# Object Oriented Programming

## Objects

Throughout the Ruby community you'll often hear the phrase, "In Ruby, everything is an object!". We've avoided this reality so far because objects are a more advanced topic and it's necessary to get a handle on basic Ruby syntax before you start thinking about objects.

```ruby
irb :001 > "hello".class
=> String
irb :002 > "world".class
=> String
```

## Classes

### Class Definition
- Ruby defines the attributes and behaviors of its objects in classes. You can think of classes as basic outlines of what an object should be made of and what it should be able to do.
- We replace the def with class and use the CamelCase naming convention to create the name. We then use the reserved word end to finish the definition. Ruby file names should be in snake_case, and reflect the class name. So in the below example, the file name is good_dog rb and the class name is GoodDog.

```ruby
class GoodDog
end
sparky = GoodDog.new
```

### Initialize Method

The initialize method is a standard Ruby class method and works almost same way as constructor works in other object oriented programming languages. The initialize method is useful when you want to initialize some class variables at the time of object creation. This method may take a list of parameters and like any other ruby method it would be preceded by def keyword as shown below.

```ruby
class Box
 def initialize w,h
  @width, @height = w, h
 end
end
```

### Instance Variable

The instance variables are kind of class attributes and they become properties of objects once objects are created using the class. Every object's attributes are assigned individually and share no value with other objects. They are accessed using the @ operator within the class but to access them outside oft he class we use public methods, which are called accessor methods. If we take the above defined class Box then @width and @height are instance variables for the class Box.

```ruby
class Box
 def initialize w, h
  # assign instance variables
  @width, @height = w, h
 end
end
```

### Accessor & Setter

- To make the variables available from outside the class they must be defined within accessor methods, these accessor methods are also known as a getter methods.
- Similar to accessor methods, which are used to access the value of the variables, Ruby provides a way to set the values of those variables from outside of the class using setter methods, which are defined as below.

```ruby
class Box
 # constructor method
 def initialize w,h
  @width, @height = w, h
 end
 # accessor methods
 def getWidth
  @width
 end
 def getHeight
  @height
 end
 # setter methods
 def setWidth value
  @width = value
 end
```

```ruby
def setHeight value
 @height = value
 end
end
# create an object
box = Box.new 10, 20
# use setter methods
box.setWidth 30
box.setHeight 50
# use accessor methods
x = box.getWidth
y = box.getHeight
puts "Width of the box is : #{x}"
puts "Height of the box is : #{y}"
```

```ruby
#Result
Width of the box is : 30
Height of the box is : 50
```

### Instance Method

The instance methods are also defined in the same way as we define any other method using def keyword and they can be used using a class instance only as shown below. Their functionality is not limited to access the instance variables, but also they can do a lot more as per your requirement.

```ruby
# define a class
class Box
 # constructor method
 def initialize w, h
  @width, @height = w, h
 end
 # instance method
 def getArea
  @width * @height
 end
end
```

```ruby
# create an object
box = Box.new 10, 20
# call instance methods
a = box.getArea
puts "Area of the box is : #{a}"
```

### Class Method

A class method is defined using def self.methodname(), which ends with end delimiter and would be called using the class name as `classname.methodname` as shown in the following example

```ruby
class Box
 @@count = 0
 def initialize w, h
  @width, @height = w, h
  @@count += 1
 end
 def self.printCount
  puts "Box count is : #@@count"
 end
end
```

3 cách tạo **Class Method**

```ruby
class Invoice
 # class method
 def self.print_out
  "Printed out invoice"
 end

 # class method
 def Invoice.print_ok
  "OK"
 end

 # class method
 class << self
  def class_method1
   "hello"
  end

  def class_method2
   "hi"
  end
 end

end
```

## Abstraction

In object design we need to define the characteristics of each object and design how they interact with each other.
➔ Objects finish work internally, report or change its state and communicate with other objects without knowing how the object proceeds.

```ruby
```

```ruby
```
## Encapsulation

- A public method is a method that is available to anyone who knows either the class name or the object's name These methods are readily available for the rest of the program to use and comprise the class's interface (that's how other classes and objects will interact with this class and its objects).

- Sometimes you'll have methods that are doing work in the class but don't need to be available to the rest of the program. These methods can be defined as private. How do we define private methods? We use the reserved word private in our program and anything below it is private (unless another reserved word is placed after it to negate it).

- Public and private methods are most common, but in some less common situations, we'll want an in-between approach. We can use the protected keyword to create protected methods.

- The easiest way to understand protected methods is to follow these two
rules:
    - from outside the class, protected methods act just like private methods.
    - from inside the class, protected methods are accessible just like public methods.

### Encapsulation instance method: From outside the class

```ruby
class Box

 def public_instance
  puts "public_instance is public method!!!!"
 end

 protected
 def protected_instance
  puts "protected_instance is protected method!!!!"
 end

 private
 def private_instance
  puts "private_instance is private method!!!!"
 end

end
```

```ruby
box = Box.new

box.public_instance #=> public_instance is public method!!!!

box.protected_instance #=> protected method `protected_instance' called for #<Box:0x0000000000f0a9b0> (NoMethodError)

box.private_instance #=> private method `private_instance' called for #<Box:0x0000000000f0a9b0> (NoMethodError)
```

### Encapsulation instance method: From inside the class

```ruby
#2 Encapsulation instance method: From inside the class
class Box
 def public_instance
  puts "public_instance is public method!!!!"
  protected_instance
  private_instance
  self.protected_instance
  self.private_instance
 end

 protected
 def protected_instance
  puts "protected_instance is protected method!!!!"
 end

 private
 def private_instance
  puts "private_instance is private method!!!!"
 end
end
```

```ruby
box = Box.new
box.public_instance
#Result
public_instance is public method!!!!
protected_instance is protected method!!!!
private_instance is private method!!!!
protected_instance is protected method!!!!
private_instance is private method!!!!
```

### Encapsulation class method: From outside the class

```ruby
class Staff
 class << self
  def public_class
   puts "public_class is public method!!!!"
  end
  
  protected
  def protected_class
   puts "protected_class is protected method!!!!"
  end
  
  private
  def private_class
   puts "private_class is private method!!!!"
  end
 end
end
```

```ruby
Staff.public_class #=> "public_class is public method!!!!" 

Staff.protected_class #=> protected method `protected_class' called for Staff:Class (NoMethodError) 

Staff.private_class #=> private method `private_class' called for Staff:Class (NoMethodError)
```

### Encapsulation class method: From inside the class

```ruby
class Staff
 class << self

  def public_class
   puts "public_class is public method!!!!"
   self.protected_class
   self.private_class
   Staff.protected_class
   # Staff.private_class #Error private method `private_class' called for Staff:Class (NoMethodError)
  end
 
  protected
  def protected_class
   puts "protected_class is protected method!!!!"
  end

  private
  def private_class
   puts "private_class is private method!!!!"
  end

 end

end
```

```ruby
Staff.public_class
#Result
public_class is public method!!!!
protected_class is protected method!!!!
private_class is private method!!!!
protected_class is protected method!!!!
```

## Inheritance
```ruby
# 1. Inheritance with instance method
class Animal
 def speak
  "Hello!"
 end
end

class GoodDog < Animal
 attr_accessor :name
 
 def initialize n
  self.name = n
 end
 
 def speak
  "#{self.name} says arf!"
 end
end

class Cat < Animal
end
```

```ruby
sparky = GoodDog.new "Sparky"
paws = Cat.new
puts sparky.speak # => Sparky says arf!
puts paws.speak # => Hello!
```

```ruby
# 2. Inheritance instance method with access modifier
class Box
 def public_instance
  puts " public_instance is public method!!!!"
 end
 
 protected
 def protected_instance
  puts " protected_instance is protected method!!!!"
 end
 
 private
 def private_instance
  puts " private_instance is private method!!!!"
 end
end
```

```ruby
class BigBox < Box
 def big_box_public_instance
  public_instance
  protected_instance
  private_instance
 end
 
 def big_box_public_instance_1
  self.protected_instance
  self.private_instance
 end
end

big_box = BigBox.new
big_box.public_instance
# big_box.protected_instance #=> protected method `protected_instance' called for #<BigBox:0x0000000000f0a9b0> (NoMethodError)
# big_box.private_instance #=> private method `private_instance' called for #<BigBox:0x0000000000f0a9b0> (NoMethodError)
big_box.big_box_public_instance
big_box.big_box_public_instance_1
```

```ruby
#3. Inheritance class method with access modifier
class Staff
 class << self
  def public_class
   puts " public_class is public method!!!!"
  end

  protected
  def protected_class
   puts " protected_class is protected method!!!!"
  end
  
  private
  def private_class
   puts " private_class is private method!!!!"
  end
 end
end
```

```ruby
class Manager < Staff
 def self.manager_public_class
  protected_class
  private_class
  self.protected_class
  self.private_class
 end
end

Manager.public_class
# Manager.protected_class #=> protected method `protected_class' called for Manager:Class (NoMethodError) 
# Manager.private_class #=> private method `private_class' called for Manager:Class (NoMethodError)
Manager.manager_public_class
```
## Polymorphism

Though you can add new functionality in a derived class, but sometimes you would like to change the behavior of already defined method in a parent class.You can do so simply by keeping the method name same and overriding the functionality of the method as shown below in the example

```ruby
class Box
 # constructor method
 def initialize w,h
  @width, @height = w, h
 end
 # instance method
 def getArea
  @width * @height
 end
end
```

```ruby
class BigBox < Box
 # change existing getArea method as follows
 def getArea
  @area = @width * @height
  puts "Big box area is : #@area"
 end
end

box = BigBox.new 10, 20
box.getArea

#Result
#Big box area is : 200
```

>*Trong Ruby có thể Override nhưng không thể Overload !*
>
> Nếu thực hiện Overload thì nó sẽ nhận phương thức cuối cùng

## Truy cập
| Type | Location | Public | Private | Protected | self.Public  | self.Private | self.Protected |
|:--------|:--------|:------:|:------:|:------:|:------:|:------:|:------:|
| Instance Method  | Outside | Yes | No  | No  |  -  |  -  |  -  |
|                  | Inside  | Yes | Yes | Yes | Yes | Yes | Yes |
| Class Method     | Outside | Yes | No  | No  |  -  |  -  |  -  |
|                  | Inside  | Yes | No  | Yes | Yes | Yes | Yes |

> *Ở các Class Method các truy cập đang xét theo cách gọi ClassName.Method*

### Truy cập trong Inheritance

> *Tính vị trí theo lớp con*

| Type | Location | Public | Private | Protected | self.Public  | self.Private | self.Protected |
|:--------|:--------|:------:|:------:|:------:|:------:|:------:|:------:|
| Instance Method  | Outside | Yes | No  | No  |  -  |  -  |  -  |
|                  | Inside  | Yes | Yes | Yes | Yes | Yes | Yes |
| Class Method     | Outside | Yes | No  | No  |  -  |  -  |  -  |
|                  | Inside  | Yes | Yes  | Yes | Yes | Yes | Yes |  

> *Ở các Class Method các truy cập đang xét theo cách gọi ClassName.Method*

>*Thể hiện của lớp con chỉ có thể gọi được trực tiếp method public ở lớp cha*

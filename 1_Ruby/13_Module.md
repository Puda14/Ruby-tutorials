# Module
## Getting modular

- A `module` is a named group of methods, constants, and class variables
    - Modules only hold *behaviour*
    - A class object is an instance of the `Class` class, a module object is an instance of the `Module` class
    ➔ *"All classes are modules, but not all modules are classes"*
- Using `module` keyword to define a modules
- A `module` can’t be instantiated, can't be subclassed, no *"module hierarchy"* of inheritance
 ➔ Ruby modules allow create groups of methods that can then `include` or `mix` into any number of classes

```ruby
module WarmUp
 def push_ups
  "Phew, I need a break!"
 end
end

class Gym
 include WarmUp
 def preacher_curls
  "I'm building my biceps."
 end
end
```

```ruby
class Dojo
 include WarmUp
  def tai_kyo_kyu
  "Look at my stance!"
 end
end
puts Gym.new.push_ups #=> Phew, I need a break!
puts Dojo.new.push_ups #=> Phew, I need a break!
WarmUp.new # undefined method `new' for WarmUp:Module
```

Some hierarchy:
- All classes are instances of Ruby’s Class, all modules in Ruby are instances of Module
- Module is the superclass of Class

```ruby
module WarmUp
end
puts WarmUp.class # Module
puts Class.superclass # Module
puts Module.superclass # Object
```

## Mixins in Ruby

- Class can inherit features from multiple parent class, the class is supposed to show multiple inheritance
- Ruby does not support multiple inheritance directly but Ruby Modules have another wonderful use

```ruby
module A
 def a1; end
 def a2; end
end

module B
 def b1; end
 def b2; end
end
```

```ruby
class Sample
 include A
 include B
 def some_thing
 end
end

sample = Sample.new
sample.a1
sample.b1
sample.some_thing
```

## Module as Namespace

### Define module with namespace
- Namespacing is a way of building logically related objects together
- This is allow classes or modules with conflicting name to co-exist while avoiding collision
- Modules are a good way to group related methods when object-oriented programming is not necessary
- Modules can also hold classes

```ruby
module Perimeter
 class Array
  def initialize
   @size = 400
  end
 end
end

our_array = Perimeter::Array.new
ruby_array = Array.new

p our_array.class
p ruby_array.class
```

### Modules without namespace

```ruby
class Push
 def up
  40
 end
end

require "gym" #=> up returns 40
gym_push = Push.new
p gym_push.up
```

```ruby
class Push
 def up
  30
 end
end

require "dojo" #=> up returns 30
dojo_push = Push.new
p dojo_push.up
```

### Using namespace

```ruby
module Gym
 class Push
  def up
   puts 40
  end
 end
end
```

```ruby
module Dojo
 class Push
  def up
   puts 30
  end
 end
end
```

```ruby
dojo_push = Dojo::Push.new
p dojo_push.up #=> 30
gym_push = Gym::Push.new
p gym_push.up #=> 40
```

```ruby
module Dojo
 A = 4
 module Kata
  B = 8
  module Roulette
   class ScopeIn
    def push
     15
    end
   end
  end
 end
end
A = 16
B = 23
C = 42
```

```ruby
puts "A - #{A}"
puts "Dojo::A - #{Dojo::A}"
puts "B - #{B}"
puts "Dojo::Kata::B - #{Dojo::Kata::B}"
puts "C - #{C}"
puts "Dojo::Kata::Roulette::ScopeIn.new.push - #{Dojo::Kata::Roulette::ScopeIn.new.push}"
```

```ruby
#Result
A - 16
Dojo::A - 4
B - 23
Dojo::Kata::B - 8
C - 42
Dojo::Kata::Roulette::ScopeIn.new.push - 15
```

## "include" and "extend" Modules

`"include" Modules`: include is only add instance level methods - not class level
methods

```ruby
module Foo1
 def self.class_method_1
  puts "this is class method"
 end
 def foo_name
  puts "My name is Boo!!!"
 end
end
```

```ruby
class Bar1
 include Foo1
end
Bar1.new.foo_name # oke
Bar1.new.class_method_1 # error
Foo1.class_method_1 # oke
```

`"included" callback`: “included” method callback that Ruby invokes whenever
the module is included into another module/class

```ruby
module Foo2
 def self.included klass
  puts "Foo2 has been included in class #{klass}"
 end
end

class Bar2
 include Foo2
end
```

```ruby
#Result
Foo2 has been included in class Bar2
```

`"extend" Modules`: extend method works similar to include, can use it to extend
any object by including methods and constants from a module

```ruby
#Example 1
module Foo1
 def module_method
  puts "Module Method invoked"
 end
 def self.demo1; end
end

class Bar1
 extend Foo1
end
 
Bar1.module_method #=> Module Method invoked
Bar1.demo1 # undefined method `demo1' for Bar1:Class (NoMethodError)
```

```ruby
#Example 2
module Foo1
 def module_method
  puts "Module Method invoked"
 end
end

class Bar1_1
end

bar1_1 = Bar1_1.new
bar1_1.extend Foo1
bar1_1.module_method #=> Module Method invoked
```

`"extended" callbacks`: “extended” method callback that Ruby invokes whenever
the module is extended into another module/class

```ruby
module Foo2
 def self.extended base
  puts "Class #{base} has been extended with module #{self} !"
 end
end

class Bar2
 extend Foo2
end

#Result
Class Bar2 has been extended with module Foo2 !
```


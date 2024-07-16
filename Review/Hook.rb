# Declaring a module to greet a person
module Greetings
 
  def self.included(person_to_be_greeted) 
 
    puts "The #{person_to_be_greeted} is welcomed with an open heart !"
  end
end
 
 
# Class where the module is included
class Person
 
  include Greetings # implementation of the include statement
end
# #Example
# my_array = [1, 2, 3, 4, 5, 6, 7, 8, 100]
# my_hash = {"Joe" => "male", "Jim" => "male", "Patty" => "female"}
# #select method with array
# my_array.select{|item| item%2==0 }
# #select method with hash
# my_hash.select{|name, gender| gender == "male" }
# #map method with array
# my_array.map{|item| item*2}
# #inject method with array
# my_array.inject(0){|running_total, item| running_total + item} # => 136

# epsilon = 1e-10
# puts (0.4 - 0.3 - 0.1).abs < epsilon

# h = Hash["a": 100, "b": 200]
# puts h

h1 = {a:1, b:2}
h2 = {b:2, a:1, c:3}
puts h1 > h2   
puts h2 > h1   
puts h1 > h1    
puts h1 != h2
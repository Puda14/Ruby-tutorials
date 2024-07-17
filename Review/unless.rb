#Example 1
x = 2
unless x > 2
 puts "x is less than 2"
elsif x==2
 puts "x"
else
 puts "c"
end
#Example 2
$var = 1
puts "1 -- Value is set\n" if $var
puts "2 -- Value is set\n" unless $var
#Example 3
$var = false
puts "3 -- Value is set\n" unless $var
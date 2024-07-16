# File Handling

What is file?

- A file is a collection of data that is stored together
- Files can be stored on a hard drive, a floppy disk, or a CD.
- Everything that a computer does is based on data stored in files.
- You can do lots of things with files: create them, edit them, rename them, save them, or delete them. Certain files can even be looked at, listened to, and run.


Common `modes` for File Handling
- `r` : Read-only mode for a file.
- `r+` : Read-Write mode for a file.
- `w` : Write-only mode for a file.
- `w+` : Read-Write mode for a file.
- `a` : Write-only mode, if file exists it will append the data otherwise a new file will be created.
- `a+` : Read and Write mode, if file exists it will append the data otherwise a new file will be created.

## Creating file

Create a new file with name simpile_file.txt and mode w+ for read and write access to the file.

```ruby
fileobject = File.new("filename.txt", "mode")
fileobject.syswrite("Text to write into the file")
fileobject.close()
```

```ruby
#Example
my_file = File.new("File/simple_file.txt", "w+")
my_file.close
```

## Opening file

```ruby
# File Handling Program 
  
# Opening a file 
fileobject = File.open("sample.txt", "r");  
  
# Reading the first n characters from a file 
puts(fileobject.sysread(21)); 
  
# Closing a file 
fileobject.close();                          
  
# Opening a file 
fileobject = File.open("sample.txt", "r");      
  
# Read the values as an array of lines 
print(fileobject.readlines);              
puts 
  
# Closing a file 
fileobject.close();                         
  
# Opening a file 
fileobject = File.open("sample.txt", "r");  
  
# Read the entire content from a file 
print(fileobject.read());     
  
# Closing a file 
fileobject.close();         
```

And open file to writing

```ruby
irb :001 > sample = File.open("simple_file.txt", "w+")
=> #<File:simple_file.txt>
irb :002 > sample.puts("another example of writing to a file.")
=> nil
irb :003 > sample.close
=> nil
irb :004 > File.read("simple_file.txt")
=> "another example of writing to a file.\n"
```

## Appending

```ruby
10.times do
sleep 1
puts "Record saved ..."
File.open("server.log", "a") {|f| f.puts "Server started ar: #{Time.new}"}
end

#------------------------
# Result =>
# ➜ ~ cat server.log
# Server started ar: 2017-11-09 16:42:34 +0700
# Server started ar: 2017-11-09 16:42:35 +0700
# Server started ar: 2017-11-09 16:42:36 +0700
# ...
# Server started ar: 2017-11-09 16:42:43 +0700
```

## Others

```ruby
# Rename the file name 
puts File.rename("sample.txt", "newSample.txt")  
  
# Delete the existing file 
puts File.delete("sample1.txt")     
  
# Checking the old filename is existing or not  
puts File.file?("sample.txt") 
  
# Checking the renamed file is exiting or not 
puts File.file?("newSample.txt") 
  
# Checking the file have read permission 
puts File.readable?("newSample.txt") 
  
 # Checking the file have write permission 
puts File.writable?("newSample.txt")   
```
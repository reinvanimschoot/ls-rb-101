=begin

What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

=end

=begin

When a local variable is initialized in an if/else block, even one that is always going to be false, 
the local variable is set to nil.

So greeting in this case will be nil.

=end
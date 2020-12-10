=begin

Let's call a method, and pass both a string and an array as arguments and see how even though they are treated in the same way by Ruby, the results can be different.

Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

=end

=begin

First, we want to check out what happens inside tricky_method.
Both the string and array arguments are altered but not in the same way.

The string undergoes the following expression
a_string_param += "rutabaga"

This might look like we are mutating said string but this actually reassigment and a shorthand for

a_string_param = a_string_param + "rutabaga"

So the string argument is not changed.

That being said, the array argument undergoes the following expression:

an_array_param << "rutabaga"

Here, we are not talking about reassignment anymore but concatenation, which we know to be mutating.
So this means that the array itself is mutated and gets added "rutabaga" as a second element.

The result after calling tricky_method is
my_string will still be "pumpkins"
but my_array will be ["pumpkins", "rutabaga"]

=end

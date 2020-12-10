=begin

Depending on a method to modify its arguments can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

Whether the above "coincidentally" does what we think we wanted "depends" upon what is going on inside the method.

How can we refactor this practice problem to make the result easier to predict and easier for the next programmer to maintain?

=end

=begin

There are a number of ways you can fix this.

- You could perform concatenation on both the arguments

def tricky_method(a_string_param, an_array_param)
  a_string_param << "rutabaga"
  an_array_param << "rutabaga"
end

But this would mean you would have to give it a very descriptive name, making sure that other developers know it is a mutating method.

A better solution would be to not perform any mutation and simply return the new values

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += "rutabaga"

  return a_string_param, an_array_param
end

=end

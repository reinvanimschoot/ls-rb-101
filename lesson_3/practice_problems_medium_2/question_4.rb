=begin

To drive that last one home...let's turn the tables and have the string show a modified output, 
while the array thwarts the method's efforts to modify the caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

=end

=begin

This is the exact opposite situation of the previous exercise.

Here the tricky_method_two method performs concatenation on the string, which mutates it
and performs reassigment on the array, which does not mutate it.

The output will be that the string will be "pumpkinsrutabaga"
and the array will be ["pumpkins"]

=end

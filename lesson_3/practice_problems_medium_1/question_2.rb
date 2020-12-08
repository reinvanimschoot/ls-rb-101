=begin

The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)

Why is this and what are two possible ways to fix this?

=end

# The error you will get back is shown because you are trying to add a string and an integer without
# explicitly converting one or the other.

# You can solve this by explicitly telling Ruby you want to convert the integer to a string  explicitly before adding them.

# puts "the value of 40 + 2 is " + (40 + 2).to_s

# OR

# puts "the value of 40 + 2 is #{(40 + 2)"}

=begin

Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. 
A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it, he got an error. 
Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  
  sum
end

result = fib(0, 1)
puts "result is #{result}"

How would you fix this so that it works?

=end

# As we saw previously, a method definition creates its own impenetrable, watertight scope.
# Which means that the only way to make a method aware of outside variables, declared in the global scope for example,
# is to provide them to the method as arguments. In this case, however, Ben is assuming the method fib can access the
# variable limit since it is initialized above it, but that is not the case. So when the variable limit is used in the
# method, Ruby complains that it doesn't know any variable by that name.

# We can solve this (and make the method a whole lot more interesting) by allowing the method to take in a third parameter called limit.

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end

  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

=begin

Alan wrote the following method, which was intended to show all of the factors of the input number:

def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. 
How can you make this work without using begin/end/until? Note that we're not looking to find the factors for 0 or negative numbers, 
but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.
Bonus 1

What is the purpose of the number % divisor == 0 ?
Bonus 2

What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?

=end

def factors(number)
  factors = []

  number.downto(1) do |count|
    factors << number / count if number % count == 0
  end

  factors
end

# The purpose of the number % divisor is to make sure that we only put numbers into the factor list
# that leave no remainder when the number divided by them. Otherwise, they wouldn't be factors anyway.

# If we would not put factors as the last line, Ruby would automatically return the value of the last evaluated expression,
# it being the return value of the downto method call in this case. So we explicitly tell Ruby to return the array of factors.

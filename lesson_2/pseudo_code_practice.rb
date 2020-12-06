=begin

==================================================================

A method that returns the sum of two integers

-- Informal Pseudo Code --

# Given two integers

- Add the two integers together
- Return the result of the addition

-- Formal Pseudo Code --

START

# Given two integers

SET result = sum of the two integers

RETURN result

END

==================================================================

A method that takes an array of strings, and returns a string that is all those strings concatenated together

-- Informal Pseudo Code --

# Given an array of strings

- Save string to return as an empty string to start with
- Iterate over the array of strings:
  - For each iteration, concatenate the string to the string we want to return
- Return the concatenated string

-- Formal Pseudo Code --

START

# Given an array of strings called 'strings'

SET concatenated_string = empty string

WHILE iterator <= length of strings
  SET concatenated_string = concatenated_string + value within strings collection at space "iterator"

RETURN concatenated_string

END

==================================================================

A method that takes an array of integers, and returns a new array with every other element

-- Informal Pseudo Code --

# Given an array of integers

- Set an empty array to return

- Iterate over the array
  - For each iteration, add the iterated integer to the array to return IF the index is even

- Return the new array

-- Formal Pseudo Code --

START

# Given an array of numbers called 'numbers'

SET every_other_number_array = empty array

WHILE iterator <= length of numbers
  SET current_index = index of current iteration cycle

  IF current_index == even number
    add current iteration value to every_other_number_array
  ELSE
    proceed to next iteration

RETURN every_other_number_array

END

=end

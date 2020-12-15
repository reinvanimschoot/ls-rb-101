=begin

===============================================================================================

Practice Problem 1

Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

Turn this array into a hash where the names are the keys and the values are the positions in the array.

Answer:

flintstones.each_with_index.to_h

===============================================================================================

Practice Problem 2

Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

Answer:

ages.values.sum

===============================================================================================

Practice Problem 3

In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

remove people with age 100 and greater.

Answer:

ages.reject! do |_, age|
  age >= 100
end

===============================================================================================

Practice Problem 4

Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

Answer:

ages.values.min

===============================================================================================

Practice Problem 5

In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

Find the index of the first name that starts with "Be"

Answer:

flintstones.find_index { |name| name.start_with?('Be') }

===============================================================================================

Practice Problem 6

Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

Answer:

flintstones.map! { |name| name[0, 3] }

===============================================================================================

Practice Problem 7

Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

ex:

{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

Answer:

letter_count_hash = Hash.new(0)

statement.chars.each do |letter|
  letter_count_hash[letter] += 1
end

===============================================================================================

Practice Problem 8

What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

Answer:

In the first case,

1, 3

In the second case,

1, 2

===============================================================================================

Practice Problem 9

As we have seen previously we can use some built-in string methods to change the case of a string.
A notably missing method is something provided in Rails, but not in Ruby itself...titleize.
This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title.
For example, the string:

words = "the flintstones rock"

would be:

words = "The Flintstones Rock"

Write your own version of the rails titleize implementation.

Answer:

def titleize(string)
  word_array = string.split(" ")

  word_array.map!(&:capitalize)

  word_array.join(" ")
end

===============================================================================================

Practice Problem 10

Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values
describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

munsters.each_pair do |_, info|
  info["age_group"] = case info["age"]
  when 0..17 then "kid"
  when 18..64 then "adult"
  when 65.. then "senior"
end

=end

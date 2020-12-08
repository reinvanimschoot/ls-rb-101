=begin

Question 1

What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

Answer:

1
2
2
3

===============================================================================================

Question 2

Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

1. what is != and where should you use it?

You want to use != if you want to compare two objects and make sure they are not equal. It is the opposite of ==.

2. put ! before something, like !user_name

This will return the opposite boolean value of the object. E.g. if you do !"foo", this will return false since "foo" is truthy.

3. put ! after something, like words.uniq!

If the method on which you append the ! has a destructive version, meaning a version that mutates the object it is called on, 
it will use that version of the method and thus any changes the method makes will mutate the object directly.

4. put ? before something

This will result in an error.

5. put ? after something

Ruby will assume you want to start a ternary evaluation and will wait for further completion of said evaluation.

6. put !! before something, like !!user_name

This will return the boolean value of the object it is called on. 
E.g. if you do !!"foo" it will return true since "foo" is truthy.
When you do !!nil it will return false since nil is falsey.

===============================================================================================

Question 3

Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!("important", "urgent")

===============================================================================================

Question 4

The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)

#delete_at takes an array index as argument and will delete the value at found at that index in the array.

In this case, it would delete the value 2.
The resulting array would be [1, 3, 4, 5].

numbers.delete(1)

#delete takes in a value and deletes the first occurrence of that value in the array it is called on.
In this case, there is only one element in the array with a value of 1 and it is the first element of the array.
So the resulting array would be [2, 3, 4, 5].

===============================================================================================

Question 5

Programmatically determine if 42 lies between 10 and 100.
hint: Use Ruby's range object in your solution.

(10..100).include?(42)

===============================================================================================

Question 6

Starting with the string:

famous_words = "seven years ago..."

show two different ways to put the expected "Four score and " in front of it.

famous_words.prepend("Four score and ")

famous_words.insert(0, "Four score and ")

===============================================================================================

Question 7

If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

Make this into an un-nested array.

flintstones.flatten!

===============================================================================================

Question 8

Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

Turn this into an array containing only two elements: Barney's name and Barney's number

flintstones.assoc("Barney")

=end

=begin

===============================================================================================

Practice Problem 1

What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end


Answer:

[1, 2, 3]

As we know, the select method checks the truthiness of the return value of the block it gets passed.
In this case, the return value is explicitly the string 'hi', which as we know, has a truthiness of true.
Since this value is returned every cycle, the block always returns true so it will allow all elements to 
remain in the array.

===============================================================================================

Practice Problem 2

How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

Answer:

If you pass a block to the count method, it will count all the elements in the array
for which the return value of the block returns true or is truthy.
We can find out by checking the Ruby documentation on the count method.

===============================================================================================

Practice Problem 3

What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

Answer:

[1, 2, 3]

It's more or less the opposite of our first practice problem, where did a select but made the block
return true in all cycles.

In this case, however, we do the exact opposite. We use a reject method, 
which rejects elements based on the return value of the block it gets passed.

But this time we just perform a puts in the block, which as we know, has a return value of nil.

nil has a truthiness of false, so for each cycle, for each decision on whether or not we should reject the element, 
the block returns false. So ultimately, no values are rejected.

===============================================================================================

Practice Problem 4

What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

Answer:

{
  a: 'ant',
  b: 'bear',
  c: 'cat'
}

#each_with_object is a special method that is not closely tied to Arrays but rather Enumerables.
It allows us to pass in an object (which could be anything) and iterate over the enumerable, while having access to said object.
As stated in the docs, the return value here is not the original Enumerable but rather the object we passed in.

===============================================================================================

Practice Problem 5

What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

Answer:

Shift in this case would return the following array:

[:a, 'ant']

As you can see, it is the key/value pair but split into a tuple array.

Since shift is destructive, the hash would be left like this:

{ b: 'bear' }

We can find these nuances by checking the docs.

===============================================================================================

Practice Problem 6

What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

Answer:

11

When we chain methods, the chained methods always get the return value of the previous method in the chain.
In this case, the return value of #pop is the last value that was taken from the end of the array.
So when we then chain #size to #pop, we are not checking the size of the array but rather of the returned element,
which in this case is 'caterpillar'.

===============================================================================================

Practice Problem 7

What is the block's return value in the following code? How is it determined?
Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

Answer:

The return value of the block is now very much dependent on what it gets passed as num.
That is to say, whether or not the integer that is passed is odd? or not.

If the number is odd, the block returns true, if not, it returns false.

Since #any? just checks if the block returns true for ANY value in the array,
we can safely say that in this case, the return value of the #any? method will be true,
since the #odd? method will return true for at least 1 integer in the array.

In fact, since the first number in the array already would make sure the block returns true,
#any? is smart enough to stop iterating at that moment, since there is not need to evaluate the restof the array.
So puts num would only be invoked once.

===============================================================================================

Practice Problem 8

How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

Answer:

Take returns the n first values of an array.
It is not destructive.

We can find out by checking the documentation and by trying the method out in irb.

===============================================================================================

Practice Problem 9

What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

Answer:

[nil, 'bear']

#map is part of the Enumerable module and returns an array with the result
of running the block once for every element in the Enumerable.

When the size of value is larger than 3, we return the value itself, that's clear.

But if the value is smaller or equal than 3, there is no explicitly returned value, 
which means that nil will be returned.

===============================================================================================

Practice Problem 10

What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

Answer:

[1, nil, nil]

Much like the previous problem, we perform a map over an Enumerable.
As we know, a map NEEDS a return value from the block since it creates a new array from those returned values.
So if no explicit return value is provided, it will just take nil and put that in the new array.

=end

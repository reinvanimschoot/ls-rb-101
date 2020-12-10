=begin

What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

=end

=begin

When we assign informal_greeting to greetings[:a],
it points to the same object in memory (with the same object_id) as greetings[:a],
it being "hi".

So when we then perform concatenation on said object (which is mutating), 
we are working directly on the same object as greetings[:a] is pointing to and mutating it.

So this means that when we do 
puts greetings, the changes in the object [:a] is pointing to will be reflected.

The result will be:

{ a: "hi there" }

=end

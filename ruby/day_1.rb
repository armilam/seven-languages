
puts 'Hello, world.'

string = 'Hello, Ruby'
puts "The index of the word 'Ruby' in the string \"#{string}\" is #{string.index('Ruby')}"

10.times { puts 'Aaron Milam' }

10.times { |i| puts "This is sentence number #{i+1}" }





MIN = 1
MAX = 100

number = rand(MAX)+MIN

puts "Guess a number between #{MIN} and #{MAX}"

guess = MIN-1
guess_count = 0

until guess == number

	print '>'
	guess = gets.to_i
	guess_count += 1

	puts "Silly you - that's below the minimum!" if guess < MIN
	puts "What's wrong with you? That's above the maximum!" if guess > MAX
	puts "Nope, too low" if guess > MIN and guess < number
	puts "You're too high..." if guess < MAX and guess > number

end

puts "Finally, after #{guess_count} tries, you got it!"

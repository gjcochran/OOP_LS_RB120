puts " -- 1 -- Even or Odd? -----"

count = 1

loop do
  if count.odd?
    puts "#{count} is odd"
  elsif count.even?
    puts "#{count} is even"
  end
  count += 1
  break if count > 5
end

puts " -- 2 -- Catch the Number -----"

loop do
  number = rand(100)
  puts number
  break if number <= 10
  # another option
  # break if number.between?(0, 10)
end

puts " -- 3 -- Conditional Loop -----"

p process_the_loop = [true, false].sample

if process_the_loop == true
  loop do
    puts "The loop was processed"
    break
  end
else
  puts "The loop wasnt processed"
end

puts " -- 4 -- Get the Sum -----"

# loop do
#   puts "What does 2 + 2 equal"
#   answer = gets.chomp.to_i
#   if answer == 4
#     puts "That is correct"
#     break
#   else # dont even need else statement, could write puts "try again" after the if statement
#     puts "try again"
#   end
# end

puts " -- 5 -- Insert Numbers -----"

# numbers = []

# loop do
#   puts "Enter any number"
#   input = gets.chomp.to_i
#   numbers << input # could also write numbers.push(input)
#   break if numbers.size == 5
# end
# p numbers

puts " -- 6 -- Empty the Array -----"

names = %w[Sally Joe Lisa Henry]

loop do
  #puts names.pop #last to first
  puts names.shift # first to last
  break if names.size == 0 # could also write names.empty?
end

puts " -- 7 -- Stop Counting -----"

5.times do |index|
  puts index
  break if index == 2
end

puts " -- 8 -- Only Even -----"

number = 0

# until number == 10
#   number += 1
#   puts number if number.even?
# end

until number == 10
  number += 1
  next if number.odd?
  puts number
end

puts " -- 9 -- First to Five -----"

number_a = 0
number_b = 0

# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#   if number_a == 5 || number_b == 5
#     break
#     puts "5 was reached"
#   end
#   p "number_a: #{number_a}"
#   p "number_b: #{number_b}"
# end
loop do
  number_a += rand(2)
  number_b += rand(2)
  next unless number_a == 5 || number_b == 5
  puts "5 was reached"
  break
end

puts " -- 10 -- Greeting -----"

def greeting
  puts "hello"
end

number_of_greetings = 2
# i = 0

# while i < number_of_greetings
#   greeting
#   i += 1
# end

# another option, incrementing number_of_greetings rather than i

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end

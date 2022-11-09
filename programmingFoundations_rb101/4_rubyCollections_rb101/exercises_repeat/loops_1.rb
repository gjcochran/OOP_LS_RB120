puts " -- 1 -- Runaway Loop -----"

loop do
  puts "Just keep printing..."
  break
end

puts " -- 2 -- Loopception -----"

loop do
  # counter = 0 # unnecessary
  puts "this is the outer loop"

  loop do
    puts "this is the inner loop"
    break
  end

  #counter += 1 # unnecessary
  break #if counter == 1 # unnecessary
end

puts "this is outside all loops"

puts " -- 3 -- Control the Loop -----"

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

puts " -- 4 -- Loop on Command -----"

# loop do
#   puts "Should I stop looping?"
#   answer = gets.chomp
#   break if answer.downcase == "yes"
# end

puts " -- 5 -- Say Hello -----"

say_hello = true
counter = 0

while say_hello
  puts "Hello"
  counter += 1
  say_hello = false if counter == 5
end

puts " -- 6 -- Print While -----"

numbers = []
i = 0

while i < 5
  numbers << rand(0..99)
  i += 1
end

p numbers

# p rand(100)

# another option!

numbers2 = []

numbers << rand(100) while numbers.size < 5

puts numbers2

puts " -- 7 -- Count Up -----"

# count down
count = 10

until count == 0
  puts count
  count -= 1
end

# count up

count2 = 1

until count > 10
  puts count
  count += 1
end

puts " -- 8 -- Print Until -----"

numbers = [7, 9, 13, 25, 18]
index = 0

until index == 5 # make less specific --> until index == numbers.size
  puts numbers[index]
  index += 1
end

puts " -- 9 -- That's Odd -----"

for i in 1..100
  puts i if i.odd?
end

puts " -- 10 -- Greet Your Friends -----"

friends = %w[Sara John Hanna Dave]

for friend in friends
  puts "Hello #{friend}"
end

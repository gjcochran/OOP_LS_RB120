# Question 1 

if false
  greeting = "hello world"
end

p greeting

# greeting variable will be initialized to nil 

# Question 2 
# greetings = { a: 'hi' }
# informal_greeting = greetings[:a]
# informal_greeting << ' there'

# puts informal_greeting  #  => "hi there"
# puts greetings #==> ( a: "hi there" }

a = 'something'
b = a 
b << 'else'
puts b 
puts a 

# Question 3 
#3A
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
# wouldn't change variables #==> correct 

#3B
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
# same #==> correct 

#3C 
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
#==> one is: two; two is: three; three is: one #==> correct 

# Question 4 
puts " ------------- 4 --------------------"

def is_an_ip_number?(number)
  (0..255).cover?(number.to_i)
end

# puts is_an_ip_number?(270)
# puts is_an_ip_number?(2)
# puts is_an_ip_number?('10')

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  
  if dot_separated_words.size != 4 
    puts "Not an IP address"
  elsif dot_separated_words.each do |word|
    return false unless is_an_ip_number?(word)
    end
    return true 
  end
end
puts dot_separated_ip_address?("10.4.5.11")
puts dot_separated_ip_address?("10.4.5.270")
puts dot_separated_ip_address?("10.4.5")

#p "10.4.5.11".split(".") #==> ["10", "4", "5", "11"]

# struggled with this one, but my answer did work. LS answer (simpler) below

# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")
#   return false unless dot_separated_words.size == 4 

#   while dot_separated_words.size > 0 do 
#     word = dot_separated_words.pop
#     return false unless is_an_ip_number?(word)
#   end

#   true 
# end
# puts dot_separated_ip_address?("10.4.5.11")
# puts dot_separated_ip_address?("10.4.5.270")
# puts dot_separated_ip_address?("10.4.5")

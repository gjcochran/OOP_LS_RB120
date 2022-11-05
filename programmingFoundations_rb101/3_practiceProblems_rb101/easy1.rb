# Question 1 

numbers = [1, 2, 2, 3]
numbers.uniq 

puts numbers 

# expecting .., [1, 2, 2, 3] (.uniq will not mutate!)
# answer 
# 1
# 2
# 2
# 3
# puts writes each element on a new line if passed an array. if was p numbers then would have outputted [1, 2, 2, 3]

# Question 2 

# != ... not equal to 
# !user_name ... unknown ... turns any object into the opposite of their boolean equivalent
# words.uniq! ... mutates words xx wrong -- if you see ! or ? at the end of the method, it's actually part of the method name, and not Ruby syntax. Therefore, you really don't know what the method is doing, even if it ends in those characters -- it depends on the method implementation.
# ?something ... xx meant ? something ie ternary operator for if/else
# something? -- if you see ! or ? at the end of the method, it's actually part of the method name, and not Ruby syntax. Therefore, you really don't know what the method is doing, even if it ends in those characters -- it depends on the method implementation.
# !!user_name ... turns any object into their boolean equivalent 

# Question 3 
advice = "Few things in life are as important as house training your pet dinosaur"

# 3 ways
#1
# advice[26...35]= "urgent"
# puts advice

#2 
# advice["important"] = "urgent"
# puts advice 

#3
advice.gsub!("important", "urgent")
puts advice

# Question 4 

numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1) #==> should delete position 1 ie 2
numbers.delete(1) #==> will delete 1 (ie position 0)

# Question 5 

def in_between(number, rangelow, rangehigh)
  if (rangelow..rangehigh).include?(number)
    puts "#{number} is between #{rangelow} and #{rangehigh}"
  else 
    puts "not between"
  end
end

in_between(42, 10, 100)

# note that .include? works well for this solution. LS used .cover? which operate slightly different on ranges... .cover? will check -- 10 <= 42 && 42 <= 100 and then return a boolean value 
p (10..100).cover?(42)

# Question 6 

famous_words = "seven years ago..."

# attempts
# famous_words << ("Four score and ") #==> wrong, puts at end
# famous_words.shift("Four score and ") #==> wrong, push and shift method dont appear to work on strings..
#famous_words[0] = "Four score and s" #==> this works but requires writing the lost s..

# option 1 
p "Four score and " + famous_words #correct!

# option 2 
# didn't think to use .prepend ..
# p famous_words.prepend("Four score and ") # note that mutates 

# option 3 
p "Four score and " << famous_words # does not mutate
# puts famous_words

# Question 7 

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
p flintstones #==> ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

flintstones.flatten!
p flintstones

# Question 8 

flintstones_hash = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# puts flintstones_hash.keys[2]
array_barney = flintstones_hash.to_a[2]
p array_barney

# my answer worked, although there is a simpler way to do this!
p flintstones_hash.assoc("Barney")
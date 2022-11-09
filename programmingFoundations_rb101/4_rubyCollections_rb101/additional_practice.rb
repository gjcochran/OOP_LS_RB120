puts " --------- 1 ---------- "
flintstones = %w[Fred Barney Wilma Betty Pebbles BamBam]
# Turn this array into a hash where the names are the keys and the values are the positions in the array.

# attempt 1
hash = Hash.new
flintstones.each_with_index { |name, index| hash[name] = index }
p hash #==> {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}
# this works, but does not "turn the array into a hash"

# attempt 2
p flintstones.each_with_index.to_h #==> {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}
p flintstones #==>["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# works. note: each_with_index and to_h are both not destructive

# CORRECT

puts " --------- 2 ---------- "
ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237,
}
# Add up all of the ages from the Munster family hash

total = 0
counter = 0
loop do
  total += ages.values[counter]
  counter += 1
  break if counter == ages.size
  total
end
p total #==> 6174

# p ages.values[0] #==> 32

# CORRECT answer, although loop was a more difficult method than necessary, other options given by LS below..

#
total_ages = 0
ages.each { |_, age| total_ages += age }
p total_ages #==> 6174

#
p ages.values.inject(:+) #==> 6174

puts " --------- 3 ---------- "
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# remove people with age 100 and greater

ages.delete_if { |k, v| v >= 100 }
p ages #==> {"Herman"=>32, "Lily"=>30, "Eddie"=>10}

# CORRECT, although LS used a different Hash method Hash#keep_if with opposite conditional

# ages.keep_if {|_, age| age < 100 }

puts " --------- 4 ---------- "
ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237,
}
# Pick out the minimum age from our current Munster family hash

p ages.min #==> ["Eddie", 10] # CORRECT
# if picking out just the age...
p ages.values.min #==> 10

puts " --------- 5 ---------- "
flintstones = %w[Fred Barney Wilma Betty BamBam Pebbles]
# Find the index of the first name that starts with "Be"
p flintstones.find_index { |name| name.start_with?("Be") } #==> 3

# CORRECT
# another option
# p flintstones.index { |name| name } #==> 0
p flintstones.index { |name| name[0, 2] == "Be" } #==> 3 #note that the [0, 2] specifies that starting at the first character only compare to 2 characters

puts " --------- 6 ---------- "
flintstones = %w[Fred Barney Wilma Betty BamBam Pebbles]
# Amend this array so that the names are all shortened to just the first three characters

p flintstones.map { |name| name[0, 3] }
# CORRECT
# map is not destructive so use .map! if want to change permanently

puts " --------- 7 ---------- "
statement = "The Flintstones Rock"
# Create a hash that expresses the frequency with which each letter occurs in this string

# use String#count
# https://ruby-doc.org/core-3.1.2/String.html#method-i-count
# test..
# p statement.count "e" #==> 2
# test 2
# hash = {}
# hash[statement["e"]] = statement.count "e"
# p hash #==> {"e"=>2}

# p statement_array = statement.split("", 1) #==> ["The Flintstones Rock"]

# p statement_array.each_with_object({}) { |(key, value), hsh|
#     value = hsh[value] = key
#   }
# can't use count in same way on an array... hmm

# gave up

# LS answer
result = {}
letters = ("A".."Z").to_a + ("a".."z").to_a
p letters

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end
p result #==> {"F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, "h"=>1, "i"=>1, "k"=>1, "l"=>1, "n"=>2, "o"=>2, "s"=>2, "t"=>2}

puts " --------- 8 ---------- "
# What happens when we modify an array while we are iterating over it? What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  p numbers.shift(1)
end

#==> 1 3
# explanation
# "What's happening here is that we're mutating the numbers array as we are iterating over it. This, in general, can create the kind of bugs and strange behavior you're seeing here. To walk through the execution step by step:

# On the first iteration of the block passed to each we pass the element at index 0 in the calling array (numbers) to the block and assign it to number. So number references 1. We output 1 and then call shift on the numbers array with 1 passed as an argument. This removes the first single element (because we passed 1 as an argument) from numbers destructively and returns it in a new array. numbers now references the array [2, 3, 4].

# Now we are on the second iteration of each. In its implementation, each relies on index numbers in order to iterate over the calling array. Therefore, it will use the index number 1 to select the next element that needs to be passed to the block. In this case, that will be the number 3, because we've mutated the numbers array. We skip right over the element 2 because this is now at index position 0, which as far as each is concerned, we've already moved on from.

# So, on the second iteration, we pass 3 to the block and this gets assigned to number. 3 is output and we again call shift on numbers. This destructively removes the first element from the array, so numbers now reference the array [3,4].

# On the third iteration of each, we should be on the index number 2. However, numbers now only has two elements. Therefore, it has no element at index 2. each therefore, completes execution and we get the results you see. This is why it's not a good idea to mutate a collection at the same time as we are trying to iterate through it."

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

#==>
# number[0]
# 1
# [1, 2, 3]
# number[1]
# 2
# [1, 2]
# number[2] #==> no element at index 2 in current mutated array
#==> 1 2

puts " --------- 9 ---------- "
words = "the flintstones rock"
p words.split

def titleize(string)
  array = string.split
  array.each { |word| word.capitalize! }
  array.join(" ")
end
p titleize(words)

# CORRECT,  the method LS wrote is very similar, but all together, pasted below

# words.split.map { |word| word.capitalize }.join(' ')

puts " --------- 10 ---------- "

munsters = {
  "Herman" => {
    "age" => 32,
    "gender" => "male",
  },
  "Lily" => {
    "age" => 30,
    "gender" => "female",
  },
  "Grandpa" => {
    "age" => 402,
    "gender" => "male",
  },
  "Eddie" => {
    "age" => 10,
    "gender" => "male",
  },
  "Marilyn" => {
    "age" => 23,
    "gender" => "female",
  },
}

# Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
# { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#   "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#   "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#   "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
#   "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# test
herman = { "age" => 32, "gender" => "male" }

# if herman.values[0] < 18
#   herman["age_group"] = "kid"
# elsif herman.values[0] >= 18 && herman.values[0] < 65
#   herman["age_group"] = "adult"
# else
#   herman["age_group"] = "senior"
# end
# p herman #==> {"age"=>32, "gender"=>"male", "age_group"=>"adult"}

# munsters.each do |name, attributes|
#   if name[0].values[0] < 18
#     name["age_group"] = "kid"
#   elsif name[0].values[0] >= 18 && name[0].values[0] < 65
#     name["age_group"] = "adult"
#   else
#     name["age_group"] = "senior"
#   end
# end

# looked at hint... Try using a case statement along with Ruby Range objects in your solution

case herman.values[0]
when 0..17
  herman["age_group"] = "kid"
when 18..64
  herman["age_group"] = "adult"
when 65..120
  herman["age_group"] = "senior"
end
p herman #==> {"age"=>32, "gender"=>"male", "age_group"=>"adult"}

p munsters.keys #==> ["Herman", "Lily", "Grandpa", "Eddie", "Marilyn"]

p herman["age"] #==> 32
p munsters["Herman"] #==> {"age"=>32, "gender"=>"male"}
p munsters["Herman"]["age"] #==> 32

p munsters.each { |name, value| name["age"] }

munsters.each do |name, value|
  case value["age"]
  when 0..17
    value["age_group"] = "kid"
  when 18..64
    value["age_group"] = "adult"
  when 65..120
    value["age_group"] = "senior"
  end
end
p munsters

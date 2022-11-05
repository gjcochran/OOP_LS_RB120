# Question 1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.fetch("Spot", "Doesn't exist") #==> "Doesn't exist"

# fetch works great but wasn't listed as one of of the 3 solutions!

# other potential solutions

p ages.key?("Spot") #==> false
p ages.include?("Spot") #==> false
p ages.member?("Spot") #==> false

# Question 2 

munsters_description = "The Munsters are creepy in a good way."

p munsters_description.swapcase
p munsters_description.capitalize 
p munsters_description.downcase 
p munsters_description.upcase

# Question 3 

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)
p ages 

# Question 4 

advice = "Few things in life are as important as house training your pet dinosaur."

# my own attempt with non-capitalized version
p advice.index("dino") #==> 63, therefore know that exists
p advice.index("lay") #==> nil

# an answer for "Dino"
p advice.match?("Dino") #==> false

# Question 5 
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
# instead ...
flintstones_rewrite = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones_rewrite

# Question 6 
flintstones_6 = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones_6 << "Dino"
p flintstones_6

# could also use .concat or .push rather than <<

flintstones_6a = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones_6a.concat(["Dino"])
p flintstones_6a

flintstones_6b = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones_6b.push("Dino")
p flintstones_6b

# Question 7 
flintstones_7 = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones_7.push("Dino", "Hoppy")
p flintstones_7

# Question 8 
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0..38) # could also put ... advice.slice!(0, advice.index('house'))
p advice

# Question 9 
statement = "The Flintstones Rock!"
p statement.count('t')

# Question 10 

title = "Flintstone Family Members"
p title.center(40)
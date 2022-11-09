str = "the grass is green"
p str[4, 5] #==> grass
p str[4..8] #==> grass

arr = %w[a b c d e f g]

p arr[2, 3] #==> ['c', 'd', 'e']
p arr[2, 3][0] #==> 'c'
p arr[0] #==> 'a'

# Array#slice method returns element inside an array if is a range, if is a single index, then just returns the element itself

country_capitals = { uk: "London", france: "Paris", germany: "Berlin" }
p country_capitals.keys # => [:uk, :france, :germany]
p country_capitals.values # => ["London", "Paris", "Berlin"]
p country_capitals.values[0] # => "London"
p country_capitals.keys[1] #==> :france
p country_capitals[:uk] #==> "London"
p country_capitals["Berlin"] #==> nil

str = "Practice"

arr = str.chars # => ["P", "r", "a", "c", "t", "i", "c", "e"]
p arr
p arr.join
p arr

str = "How do you get to Carnegie Hall?"
p arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
p arr.join # => "HowdoyougettoCarnegieHall?"

arr = [[:name, "Joe"], [:age, 10], [:favorite_color, "blue"]]
p arr.to_h

str = "joe's favorite color is blue"
str[0] = "J"
p str # => "Joe's favorite color is blue"
str[6] = "F"
str[15] = "C"
str[21] = "I"
str[24] = "B"
p str #==> "Joe's Favorite Color Is Blue"

arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr # => [2, 2, 3, 4, 5]

arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
p arr

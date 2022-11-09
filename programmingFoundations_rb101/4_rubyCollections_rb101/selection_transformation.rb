# example of extracting a selection algo to a method
def select_vowels(str)
  selected_chars = ""
  counter = 0

  loop do
    current_char = str[counter]

    selected_chars << current_char if "aeiouAEIOU".include?(current_char)

    counter += 1
    break if counter == str.size
  end

  selected_chars
end
# note: when our method is done iterating over the collection it returns a new collection containing the selected values. In this case, our select_vowels method returns a new string.

p select_vowels("this is a made up sentence") #==> "iiaaeueee"

sentence = "I wonder which vowels will be selected"
p select_vowels(sentence) #==> "Ioeioeieeee"

number_of_vowels = select_vowels("hello world").size
p number_of_vowels #==> 3

# example 2 with hash

produce = {
  "apple" => "Fruit",
  "carrot" => "Vegetable",
  "pear" => "Fruit",
  "broccoli" => "Vegetable",
}

p produce
p produce.key("Fruit") #==> "apple"
p Hash[*produce.to_a.at(1)] # returns a specific key/value ({"carrot"=>"Vegetable"}), but not sure how to isolate the key...
p produce.to_a[0] #==> ["apple", "Fruit"]
p produce.keys[0] #==> "apple" # winner, winner!
p produce.size #==> 4
p produce.values[0] #==> "Fruit"
p produce.values
p produce.keys

def select_fruit(hash, value)
  selected_pair = {}
  counter = 0

  loop do
    current_key = hash.keys[counter]
    current_value = hash.values[counter]
    selected_pair[:"#{current_key}"] = current_value if current_value == value
    counter += 1
    break if counter == hash.size
  end
  selected_pair
end

p select_fruit(produce, "Fruit") #==> {:apple=>"Fruit", :pear=>"Fruit"}

# works, although LS completed in slightly, different manner, was generally the same, pasted below

# def select_fruit(produce_list)
#   produce_keys = produce_list.keys
#   counter = 0
#   selected_fruits = {}

#   loop do
#     # this has to be at the top in case produce_list is empty hash
#     break if counter == produce_keys.size

#     current_key = produce_keys[counter]
#     current_value = produce_list[current_key]

#     if current_value == 'Fruit'
#       selected_fruits[current_key] = current_value
#     end

#     counter += 1
#   end

#   selected_fruits
# end

# example of extracting a transformation algo to a method

# does not mutate argument
def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers(my_numbers) #==> [2, 8, 6, 14, 4, 12]

# does mutate argument
def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] *= 2

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers) #==> [2, 8, 6, 14, 4, 12]

##
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if current_number.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6] #==> [2, 4, 6, 14, 2, 6]
p double_odd_numbers(my_numbers)

def double_odd_indices(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_numbers(my_numbers) #==> [2, 4, 6, 14, 2, 6]
p double_odd_indices(my_numbers) #==> [1, 8, 3, 14, 2, 12]

##
def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_produce = {}

  loop do
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == selection_criteria
      selected_produce[current_key] = current_value
    end

    counter += 1
  end

  selected_produce
end

produce = {
  apple: "Fruit",
  carrot: "Vegetable",
  pear: "Fruit",
  broccoli: "Vegetable",
}

p general_select(produce, "Fruit") #==> {:apple=>"Fruit", :pear=>"Fruit"}
p general_select(produce, "Vegetable") #==> {:carrot=>"Vegetable", :broccoli=>"Vegetable"}

##
def multiply(numbers, multiply_by)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    multiplied_numbers << current_number * multiply_by

    counter += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 4) #==> [4, 16, 12, 28, 8, 24]

##
question = "How many times does a particular character appear in this sentence?"

def select_letter(sentence, character)
  selected_chars = ""
  counter = 0

  loop do
    break if counter == sentence.size
    current_char = sentence[counter]

    selected_chars << current_char if current_char == character

    counter += 1
  end

  selected_chars
end

p select_letter(question, "a").size # => 8
p select_letter(question, "t").size # => 5
p select_letter(question, "z").size # => 0

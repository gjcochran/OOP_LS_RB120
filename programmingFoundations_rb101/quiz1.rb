def string_lengths(sentence)
  strings = sentence.split

  strings.map { |chars| chars.length }
end
#this should return an array with the length of each word in the sentence
p string_lengths("this is a random sentence")

def string_lengths2(sentence)
  strings = sentence.split
  lengths = []

  strings.each do |string|
    lengths << string.size
  end
end
# i dont think the .size method will work, needed to use .length


p string_lengths2("this is a random sentence")


def string_lengths3(sentence)
  words = sentence.split
  word_lengths = []
  counter = 0

  while counter < words.size do
    word_lengths << words[counter].length
    counter += 1
  end

  word_lengths
end

# this will work

p string_lengths3("this is a random sentence")

def string_lengths4(sentence)
  strings = sentence.split
  lengths = []
  counter = 1

  until counter > strings.size do
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end

p string_lengths4("this is a random sentence")

# this seems like will work, but wont finish last word of the sentence, if change to until >, will work
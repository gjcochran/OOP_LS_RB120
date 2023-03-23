## 1

# we create an object in Ruby by instantiation using the class method #new
# ex

#class Human
#end

#garrett = Human.new

## 2

# a Module's purpose is to store reusable methods that one plans to apply
# to many classes by mixing in (ie can be thought of copy/pasting) the method
# to a class, using the include method

module Output
  def output_word(word)
    puts word
  end
end

class Human
  include Output
end

garrett = Human.new

garrett.output_word('hi')

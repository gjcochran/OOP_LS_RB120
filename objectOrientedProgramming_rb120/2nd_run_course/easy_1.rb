# 1 - all examples are objects in ruby (boolean, string, array, integer)... can find their class using the `.class` instance method

# 2
module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

Car.new.go_fast

# 3
# "{self.class}" within an instance method, self refers to the current object. the class of that object in this is Car
#   additional note that didnt mention... string interpolation includes a to_s method call

# 4
# spark = AngryCat.new 

# 5
# only Pizza class would create an instance variable b/c need the @ designation within an initialize method

# 6 
# default return value of to_s is <Class:object_id*2>. Can find this in the Object class docs

#7
# when used in an instance method, self refers to the current object

# 8
# when a class method is defined with syntax `def self.etc`, the self refers to the current class

# 9
# Bag.new(p1, p2)

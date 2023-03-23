class GoodDog
  @@num_dogs = 0 # class variable

  DOG_YEARS = 7 # constant

  attr_accessor :name, :age

  def initialize(name, age)
    @@num_dogs += 1
    self.name = name
    self.age = age * DOG_YEARS
  end

  def self.total_number_of_dogs # class method
    @@num_dogs
  end

  def to_s # overriding to instance method to_s (impacts puts method output)
    "dogs name is #{name} and its age is #{age}" 
  end
end

puts GoodDog.total_number_of_dogs

stella, nala = GoodDog.new('Stella', 2), GoodDog.new('Gabby', 5)

puts GoodDog.total_number_of_dogs

puts stella.age

p stella # calls inspect
puts stella


### 
=begin
To be clear, from within a class...

self, inside of an instance method, references the instance (object) that called
the method - the calling object. Therefore, self.weight= is the same as sparky.weight=, in our example.

self, outside of an instance method, references the class and can be used
to define class methods. Therefore if we were to define a name class method,
def self.name=(n) is the same as def GoodDog.name=(n).
=end

##
# exercises

class MyCar
  attr_accessor :color, :year, :model, :speed

  def initialize(color, year, model)
    @color = color
    @year = year
    @model = model
    @speed = 0
  end

  def speed_up(num)
    @speed += num
  end

  def slow_down(num)
    @speed -= num
  end

  def stop
    @speed = 0
  end

  def current_speed
    puts "The current speed is #{@speed} mph"
  end

  def spray_paint(color)
    self.color = color
  end

  def self.gas_mileage(type = 'mid-range', tank_size)
    case
    when type.downcase.start_with?('e') then puts "#{500 / tank_size} miles/gallon"
    when type.downcase.start_with?('m') then puts "#{400 / tank_size} miles/gallon"
    when type.downcase.start_with?('s') then puts "#{300 / tank_size} miles/gallon"
    else
      "not a valid car type"
    end
  end

  def to_s
    "The #{@color} #{@year} #{@model} is going #{@speed} mph"
  end
end

honda = MyCar.new('black', '2015', 'Honda CR-V')

puts honda
MyCar.gas_mileage(14)

##
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

end

garrett = Person.new("Garrett")
garrett.name = "Chandler"
p garrett.name

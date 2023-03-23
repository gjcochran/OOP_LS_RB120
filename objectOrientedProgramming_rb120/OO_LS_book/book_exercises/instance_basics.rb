# class GoodDog
#   def initialize(name)
#     @name = name
#   end
# 
#   def name # getter method
#     @name
#   end
# 
#   def name=(name) # setter method
#     @name = name
#   end
# 
#   def speak
#     "#{@name} barks woof"
#   end
# end
# 
# ginger = GoodDog.new("Ginger")
# p ginger.speak
# 
# nala = GoodDog.new('Nala')
# p nala.speak
# p nala.name
# p nala.name = 'Izzy'
# p nala.name

# shorthand for creating both getter and setter methods is `attr_accessor`
#             .. creating just getter method is `attr_reader`
#             .. creating just setter method is `attr_writer`
# ie code above can be changed to:

class NewDog
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{name} says woof"
  end
end

stella = NewDog.new('Stella')
p stella.speak

#
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} barks woof"
  end

  def change_info(n, h, w)
    self.name = n 
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} lbs and is #{self.height} inches tall."
  end
end

goobs = GoodDog.new("Gabby", "25", "34")
p goobs.info
goobs.change_info("Mack", "70", "130")
p goobs.info

# exercises 


class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(num)
    @speed += num
  end

  def slow_down(num)
    @speed -= num
  end

  def shut_off
    @speed = 0
  end

  def current_speed
    puts "current speed is #{@speed} mph"
  end
  
  def spray_paint(color)
    self.color = color
  end
end

honda = MyCar.new(2015, 'black', 'CRV')
honda.speed_up(50)
honda.current_speed
honda.slow_down(20)
honda.current_speed
honda.shut_off
honda.current_speed

p honda.color
honda.color = 'blue'
p honda.color, honda.year
honda.spray_paint('purple')
p honda.color

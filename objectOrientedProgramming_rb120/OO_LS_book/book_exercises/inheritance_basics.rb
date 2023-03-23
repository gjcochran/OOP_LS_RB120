# class Animal
#   attr_accessor :name
# 
#   def initialize(name)
#     @name = name
#   end
# end
# 
# class GoodDog < Animal # GoodDog is now a subclass of Animal
#   def initialize(color, name)
#     super(name)
#     @color = color
#   end
# end
# 
# stella = GoodDog.new("white", "Stella")
# p stella

module Swimmable # 'able' suffix is a Ruby convention for modules...
  def swim
    "can swim"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable
end

goldie = Fish.new
puts goldie.swim

###

# exercises

module Towable
  def tow_capacity
    puts "5000 lbs"
  end
end

class Vehicle
  attr_accessor :color, :year, :model

  @@vehicles_number = 0

  def self.how_many_vehichles?
    puts "#{@@vehicles_number} vehicles created"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} mpg"
  end

  def initialize(color, year, model)
    @color = color
    @year = year
    @model = model
    @speed = 0
    @@vehicles_number += 1
  end

  def speed_up(num)
    @speed_up += num
  end

  def slow_down(num)
    @speed -= num
  end

  def stop
    @speed = 0
  end

  def spray_paint(color)
    self.color = color
  end

  def age
    "#{years_old} years old"
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  NUM_DOORS = 4
  def to_s
    "My car is a #{self.year} #{self.color} #{self.model}"
  end
end

class MyTruck < Vehicle
  include Towable
  NUM_DOORS = 2
  def to_s
    "My truck is a #{self.year} #{self.color} #{self.model}"
  end
end

crv = MyCar.new('black', 2015, 'Honda CR-V')
f150 = MyTruck.new('silver', 2019, 'Ford F-150')

puts Vehicle.how_many_vehichles?
puts f150.tow_capacity

puts MyTruck.ancestors

puts f150
puts f150.age

##

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(student)
    self.grade > student.grade
  end

  protected

  def grade
    @grade
  end
end

jim = Student.new('Jim', 90)
phil = Student.new('Phil', 92)

puts phil.better_grade_than?(jim)

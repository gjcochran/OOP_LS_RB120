module Towable
  def tow
    'i can tow'
  end
end

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  include Towable
end

class Car < Vehicle ; end

ram = Truck.new(2020)
puts ram.tow, ram.year
outback = Car.new(2022)
puts outback.year



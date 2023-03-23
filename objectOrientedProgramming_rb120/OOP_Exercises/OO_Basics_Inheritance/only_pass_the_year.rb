class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :bed_type
  
  def initialize(year, bed_type)
    @year = year # this works, but instead write `super(year)`
    @bed_type = bed_type
  end
end

class Car < Vehicle
end

mazda = Car.new(2000)
puts mazda.year

ram = Truck.new(1998, 'short')
puts ram.year
puts ram.bed_type


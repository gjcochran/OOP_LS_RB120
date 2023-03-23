class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle ; end
class Car < Vehicle ; end

f150 = Truck.new(1994)
accord = Car.new(2006)
puts f150.year, accord.year

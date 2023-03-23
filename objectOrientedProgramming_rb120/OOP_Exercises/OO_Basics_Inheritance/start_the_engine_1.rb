class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
    start_engine if self.class == Truck
  end
end

class Truck < Vehicle
  def start_engine
    puts 'ready to go'
  end
end

class Car < Vehicle
end

ram = Truck.new(1994)
puts ram.year
crv = Car.new(2000)
puts crv.year

# works, but LS was testing if knew super keyword...

=begin
    ie
...
class Truck < Vehicle
  def initialize(year)
    super
    start_engine
  end
  ...
end

...
=end

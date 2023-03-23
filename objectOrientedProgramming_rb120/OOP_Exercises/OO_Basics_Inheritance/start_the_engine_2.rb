class Vehicle
  def start_engine
    'ready to go'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    # key is passing () ie no arguments to super method call
    super() + " drive #{speed}, please"
  end
end

tundra = Truck.new
puts tundra.start_engine('slow')

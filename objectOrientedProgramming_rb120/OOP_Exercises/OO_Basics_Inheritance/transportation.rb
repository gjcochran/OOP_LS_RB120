module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end

# instantiate a class...
# ex. `Transportation::Truck.new`

ram = Transportation::Truck.new
p ram

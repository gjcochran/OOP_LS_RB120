module Towable
  def tow
    puts 'i can tow a trailer'
  end
end

class Truck
  include Towable
end

ram = Truck.new
ram.tow

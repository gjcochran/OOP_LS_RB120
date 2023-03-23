# doesnt work... dont need to use inheritance in order to references methods from another class,
#   which dont understand! come back to later
class Owner
  def initialize(name)
    @name = name
    @number_of_pets = 0
  end
end

class Pet < Owner
  def initialize(pet_type, pet_name)
    @pet_type = pet_type
    @pet_name = pet_name
  end
end

class Shelter < Pet
  def adopt(name, pet_name)
    adoptions = {}
    adoptions[name.name] = [pet_name.pet_type, pet_name.pet_name] 
    puts adoptions
  end

end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
=begin
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
p adoptions
=end
#shelter.print_adoptions
#puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
#puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  attr_reader :name, :age, :coloring

  def initialize(name, age, coloring)
    super(name, age)
    @coloring = coloring
  end

  def to_s
    "My cat #{name} is #{age} years old and has #{coloring} fur"
    # LS solution was to not add attr_reader and instead within to_s
    #  method to string interpolate instance variable rather than value, ie
    #   #{@name}
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

class Cat
  attr_reader :name

  COLOR = 'purple'

  def initialize(name)
    @name = name
  end

  def greet
    puts "hi my name is #{name} and im a #{COLOR} cat"
  end

end

kitty = Cat.new('Gus')
kitty.greet

# note that LS put constant at very top even before attr_reader

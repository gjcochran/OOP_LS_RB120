class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "hi my name is #{name}"
  end

end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name

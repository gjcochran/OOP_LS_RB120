class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "Im #{name}"
  end
end

kitty = Cat.new('Gus')
puts kitty

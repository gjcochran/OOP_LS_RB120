class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal ; end

class Bird < Animal ; end

sparkplug = Cat.new('orange')
p sparkplug.color

p sparkplug.class.ancestors

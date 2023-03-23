module Flyable
  def fly
    'flying'
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal ; end

class Bird < Animal
  include Flyable
end

parrot = Bird.new('green')
p parrot.color
p parrot.class.ancestors
# bird, flyable, animal

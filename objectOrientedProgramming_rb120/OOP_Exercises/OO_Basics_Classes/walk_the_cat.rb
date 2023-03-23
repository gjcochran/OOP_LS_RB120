module Walkable
  def walk
    puts 'lets go for a walk'
  end
end

class Cat
  include Walkable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet 
    puts "hi im #{name}"
  end
end

kitty = Cat.new('Gus')
kitty.walk

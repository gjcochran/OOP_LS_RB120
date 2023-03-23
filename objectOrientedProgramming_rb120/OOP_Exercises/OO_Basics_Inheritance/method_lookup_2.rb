class Animal ; end

class Cat < Animal ; end

class Bird < Animal ; end

gus = Cat.new
p gus.class.ancestors
p gus.color

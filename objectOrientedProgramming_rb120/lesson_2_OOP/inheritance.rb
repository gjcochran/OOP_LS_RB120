class Dog
  def speak
    'bark'
  end

  def swim
    'swimming'
  end
end

teddy = Dog.new
puts teddy.speak
puts teddy.swim

class Bulldog < Dog
  def swim
    'cant swim'
  end
end

bull = Bulldog.new
p bull.swim

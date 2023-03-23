class Greeting
  def greet(string)
    puts string
  end
end

class Hello < Greeting
  def hi
    self.greet('hello')
  end
end

class Goodbye < Greeting
  def bye
    self.greet('goodbye')
  end
end

p Goodbye.new.bye

## this works, but didnt need the self... just greet with argument works fine

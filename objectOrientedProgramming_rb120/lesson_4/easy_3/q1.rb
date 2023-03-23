class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
p hello.hi # Hello #=> nil
#p hello.bye # No Method Error
#p hello.greet # Error, wrong num of arguments
p hello.greet('Goodbye') # Goodbye #=> nil
p Hello.hi # error NoMethod

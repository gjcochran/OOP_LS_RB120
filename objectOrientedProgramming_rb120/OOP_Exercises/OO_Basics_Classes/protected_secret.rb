class Person
  attr_writer :secret

  def compare_secret(compare_to)
    self.secret == compare_to.secret # works but could have written just secret == compare_to.secret 
  end

  protected

  attr_reader :secret
end

p1 = Person.new
p1.secret = 'a secret'

p2 = Person.new
p2.secret = 'another secret'

puts p1.compare_secret(p2)

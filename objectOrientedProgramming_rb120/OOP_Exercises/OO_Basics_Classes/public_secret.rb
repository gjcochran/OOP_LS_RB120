class Person
  attr_accessor :secret

  def initialize
    @secret = secret
  end
  # note didnt even need an initialize method at all, just attr_accessor...
end

person1 = Person.new
person1.secret = 'is a secret'
puts person1.secret

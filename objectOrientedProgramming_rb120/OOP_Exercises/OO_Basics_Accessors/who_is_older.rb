class Person
  attr_writer :age

  def older_than?(other)
    age > other.age
  end

  protected

  attr_reader :age
end

kid = Person.new
kid.age = 17
adult = Person.new
adult.age = 26

puts kid.older_than?(adult)

class Person
  def age=(age)
    @age = age * 2
    # note that was getting errors when tried `@age *= 2`
  end

  def age
    @age * 2
  end
end

yadult = Person.new
yadult.age = 20
puts yadult.age

class Person
  def initialize(name)
    @name = name
  end

  def name
    @name.dup
    # works, not that LS chose `@name.clone`
  end
end

james = Person.new('James')
james.name.reverse!
puts james.name

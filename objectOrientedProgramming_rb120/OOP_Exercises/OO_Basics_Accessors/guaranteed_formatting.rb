class Person
  attr_reader :name

  def name=(name)
    @name = name.capitalize
  end

end

lizzy = Person.new
lizzy.name = 'elizaBeth'
puts lizzy.name

class Person
  attr_writer :name

  def name
    "Mr. #{@name}"
  end
end

james = Person.new
james.name = 'James'
puts james.name

class Person
  def name=(full_name)
    @first_name = full_name.split.first
    @last_name = full_name.split.last
    # could be one line... `@first_name, @last_name = name.split`
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name

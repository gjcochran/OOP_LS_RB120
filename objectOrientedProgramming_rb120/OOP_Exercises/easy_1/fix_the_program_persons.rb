class Person
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def to_s
    "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person

## another option, per LS
=begin
def first_name= (value)
  @first_name = value.capitalize
end

def last_name= (value)
  @last_name = value.capitalize
end
=end

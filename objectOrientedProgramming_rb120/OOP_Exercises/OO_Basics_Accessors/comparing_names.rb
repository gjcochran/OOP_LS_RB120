class Person
  attr_accessor :first
  attr_writer :last

  def first_eq_last?
    first == last
  end

  private

  attr_reader :last
end

dave = Person.new
dave.first = 'Dave'
dave.last = 'Smith'
puts dave.first_eq_last?

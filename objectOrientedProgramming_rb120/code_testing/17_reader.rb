class Person
  def initialize(n)
    @name = n
  end

  def name
    @name.capitalize
  end
end

dave = Person.new('dave')
bill = Person.new('BIll')
chuck = Person.new('cHucK')

p dave.name, bill.name, chuck.name

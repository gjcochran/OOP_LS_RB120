class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    determine_name(name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    determine_name(name)
  end

  def ==(other)
    self.name == other.name
  end

  private

  def determine_name(name)
    halves = name.split
    self.first_name = halves.first
    self.last_name = halves[1] || ''
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'
bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'

bobby = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob == rob
p bobby == rob

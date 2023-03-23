class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    full_name_check(full_name)
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end

  def name=(full_name)
    full_name_check(full_name)
  end

  def full_name_check(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end

  def to_s
    name
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob.object_id
p rob.object_id
p bob.name == rob.name

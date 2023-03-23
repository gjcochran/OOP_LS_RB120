class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end


# self refers to the current object (which is an instance of Cat)
# LS answer for comparison... the use of self is referencing the instance (object) that
#   called the method - the calling object

class Person
  attr_reader :phone_num

  def initialize(num)
    @phone_num = num
  end
end

p1 = Person.new(12345)
puts p1.phone_num
p1.phone_num = 98765
puts p1.phone_num

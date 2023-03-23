class Person
  attr_accessor :name
  attr_writer :phone_num
end

jess = Person.new
jess.name = 'Jessica'
jess.phone_num = '012345'
puts jess.name

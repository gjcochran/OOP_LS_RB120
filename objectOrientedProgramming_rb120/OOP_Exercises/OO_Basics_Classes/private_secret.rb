class Person
  attr_writer :secret

  def share_secret
    puts @secret # puts secret also works...
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'a secret'
person1.share_secret
# key to this is that person1.secret would not work

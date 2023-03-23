module Walkable
  def walk
    if self.title
      "#{title} #{name} #{gait} forward"
    else
    "#{name} #{gait} forward"
    end
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

class Noble
  include Walkable

  attr_reader :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  private

  def gait
    'struts'
  end
end

byron = Noble.new('Byron', 'Lord')
p byron.walk
p byron.name
p byron.title


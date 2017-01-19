class Person
  attr_accessor :name, :greeting
  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hi, my name is #{name}"
  end
end

class Student < Person

  def learn
    puts "I get it!"
  end
end

class Instructor < Person

  def teach
    puts "Everything in Ruby is an Object"
  end
end

chris = Instructor.new("Chris")
puts chris.greeting

christina = Student.new("Christina")
puts christina.greeting

#The teach method has only been defined within the Instructor class
#and does not exist in the Student class. Hence it cannot be called on any
#instance of a Student class.

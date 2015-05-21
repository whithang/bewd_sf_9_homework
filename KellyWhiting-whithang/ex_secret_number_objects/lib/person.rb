require 'pry'
require 'pry-byebug'

class Person
# this class will likely be simple, and just remember its name
	attr_accessor :name

	def initialize (name)
		@name = name
	end
end

# person = Person.new(gets.chomp)
# puts person.name
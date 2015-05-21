require 'pry'
require 'pry-byebug'

class SecretNumber
# this class will generate our secret number for us
	attr_accessor :number

	def initialize		
		@number = SecretNumber.select_random
	end

	def self.select_random
		[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample
	end 

end

# secret = SecretNumber.new
# puts secret.number
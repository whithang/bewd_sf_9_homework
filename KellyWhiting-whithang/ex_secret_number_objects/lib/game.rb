require 'pry'
require 'pry-byebug'
require_relative 'person'
require_relative 'secret_number'

class Game
# this class will be complex
# we need to write logic to initialize a new game, and run the game loop
# we'll want to write a few separate methods for unique tasks so that our
# code is structured properly
	attr_accessor :secret_number, :player, :guess, :guess_count

	def initialize(player)
		@secret_number = SecretNumber.new.number
		@player = Person.new(player)
		@guess_count = 0
	end

	# def up_or_down (guess, secret_number)
	# 	if guess < secret_number
	# 		"too low"
	# 	else
	# 		"too high"
	# 	end
	# end

	def continue(guess, secret)
		puts "You guessed wrong!  Try again...your guess was " + (if guess.to_i < secret.to_i then "too low" else "too high" end)
	end 

	def get_guess
		puts "Guess the Secret Number:"
		guess = gets.chomp
	end

	def update_count(guess_count)
		guess_count +=1
	end

	def correct(secret_number, guess_count)
		puts "You are correct!  The Secret Number was #{secret_number}.  It only took you #{guess_count} guesses"
	end

	def start(person)
		puts "Welcome #{person} to the Secret Number game.  Here are the rules of the game:\nYou need to guess a number between 0 and 10.\nI will let you know if your guess is too high or too low and you can guess again.\nNow we will begin..."

	end

end



###############################################################################
#
# Object Oriented Secret Number
#
# Read the hints below and complete this file. This Lab
# is to practice your knowledge of object oriented programming.
#
###############################################################################
# Lets create an Object Oriented version of our Secret Number Game.
#
# Your updated game should have 4 classes (Main, SecretNumber, Game and Player)
#
# Below is a description of each class and some guidelines for each.
#
# Main
#	The main class is where the game begins. This class should tell the player who made it.
#	Ask the player for their name and instantiate the Game class.
#
# SecretNumber
#   This class should initiate an array of numbers that range between 1 - 10.
#   Use a method from the array class to select a random element from that array. This random number will be the secret number.
#   This way the secret number is also a secret to you.
#
# Player
#  Should initialize the player's name.
#
# Game
#	This class holds most of the game logic and should:
#		Welcome players and inform them of the game rules.
#		Initialize the Player class.
# 		Initialize the Secret Number class.
# 		Prompt the user to choose a number, verify if the user guessed correctly.
# 		If the user guesses incorrectly let them know if they were too high or too low.
#		Monitor how many guesses the player has before the game is over.
#
# In creating your game, make sure it has arrays, hashes and all functionality is wrapped in methods.
# Add helpful comments to your code to document what each section does.
#
# Tips: Copy paste your code from homework 1 where necessary.
require 'pry'
require 'pry-byebug'
require_relative 'lib/game'
require_relative 'lib/person'
require_relative 'lib/secret_number'

# put code here print a welcome message for your user
puts "Welcome to the Game! \nThis game was made by Kelly Whiting. \nWhat is your name?"

# put code here ask the user for their name, and save it
player_name = Person.new(gets.chomp).name

# put code here to create a new game, and start it
new_game = Game.new(player_name)
new_game.start(player_name)

until new_game.guess == new_game.secret_number #why didn't this break once it was equal?
	new_game.guess = new_game.get_guess
	new_game.guess_count = new_game.update_count(new_game.guess_count)
	if new_game.guess.to_i != new_game.secret_number
		new_game.continue(new_game.guess, new_game.secret_number)
	else
		break
	end 
	# binding.pry
end

new_game.correct(new_game.secret_number, new_game.guess_count)



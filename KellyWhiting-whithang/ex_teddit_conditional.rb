#TIME: ~ 30 min
# Teddit Condtionals - Starter Code.

# Let's add a new Teddit feature. Upvotes!
# Complete the application below.
# Where you see comments (lines that begin with #) replace it with code so that the program works.

def get_input
  #Get input from the user.
  input_value = gets.chomp

end

def calculate_upvotes(story, category)
	# Write code so that:
		# If the Story is about cats multiply the upvotes by 5
		# If the Story is about bacon multiply the upvotes by 8
		# If the Story is about Food it gets 3 times the upvotes.
		cat_upvotes = 0
		cat_multiple = 5
		bacon_upvotes = 0
		bacon_multiple = 8
		food_upvotes = 0
		food_multiple = 3

		if story.include? 'cat'
			cat_upvotes += 1
			cat_multiple *= cat_upvotes
			upvotes = cat_multiple
		elsif story.include? 'bacon' 
			bacon_upvotes += 1
			bacon_multiple *= bacon_upvotes
			upvotes = bacon_multiple
		elsif story.include? 'food' 
			food_upvotes += 1
			food_multiple *= food_upvotes
			upvotes = food_multiple
		end		
					
	#For example:
	# "Cats frolic despite tuna shortage" should give you 5 times the upvotes!
end

puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"
puts "Please enter a News story:"
story = get_input
puts "Please give it a category:"
category = get_input
upvotes = calculate_upvotes(story, category)
puts "New story added! #{story}, Category: #{category.capitalize}, Current Upvotes: #{upvotes}"

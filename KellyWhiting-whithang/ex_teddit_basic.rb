#TEDDIT:  Strings - Student's File
# Teddit is a Ruby text based news aggregator. Think Reddit in your terminal.
# This exercise will be used throughout the ruby portion of this course.
# We will incrementally build a news aggregator (next week using API's)
# We will create a more dynamic Teddit, and pull the latest news stories from Mashable, Digg and Reddit.
# But until then we will hard code stories.
#

#Goals
#1 -  Get the story title, category from user from the command line
#2 -  Write a conditional that determines upvotes' based on the category
#3 -  Save every story to a collection (each story should be a hash)
#4 -  Print each stories title, category and upvotes to the screen

def get_story ()
	story = {}
	puts "hey what's the story?" 
	title = gets.chomp
	puts "what category should that go in?"
	category = gets.chomp
	story = create_story(title, category)
end

def create_story(title, category)
	stories = {story_title: title, story_category: category, 
		upvotes: calculate_votes(category)}
end

def calculate_votes (category)
	 default_votes = 1
	 if category.downcase == "cats"
		 upvotes = default_votes *3
	else
		default_votes
	 end
end

def show_stories (catalog)
	catalog.each do |story|
		puts "Title: " + story[:story_title].to_s + " Category: " + 
		story[:story_category].to_s + " Upvotes: " + 
		story[:upvotes].to_s
	end
end 

full_catalog = []
continue = 'y'

while continue.downcase == 'y'
	full_catalog.push(get_story())
	puts 'Do you want to enter another story? Enter Y or N'
	continue = gets.chomp
end

show_stories (full_catalog)

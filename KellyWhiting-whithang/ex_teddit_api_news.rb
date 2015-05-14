#Add remote data source and pull in stories from Reddit, Mashable and Digg.
  # http://mashable.com/stories.json
  # http://digg.com/api/news/popular.json
  #http://www.reddit.com/r/aww/.json
# These stories will also be upvoted based on our rules. No more user input!

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"

require 'pry'
require 'pry-byebug'
require 'rest-client'
require 'json'

# digg_data = RestClient.get("http://digg..com/api/news/popular.json")
# results_digg = JSON.parse(digg_data)

mashable_data = RestClient.get("http://mashable.com/stories.json")
results_mashable = JSON.parse(mashable_data.body)

reddit_data = RestClient.get("http://www.reddit.com/r/aww/.json")
results_reddit = JSON.parse(reddit_data.body)

#reddit code
def make_story(title, category, upvotes)
	story = Hash.new
	story = {title: title, category: category, votes: upvotes}
end

# same as below with an extra test method
# def print_page(page)
# 	page.each do |story|
# 		puts "Title: " + story[:title]
# 		puts "Category: " + story[:category]
# 		if story[:votes] == nil 
# 			puts 0 
# 		else 
# 			puts story[:votes].to_s
# 		end
# 	end
# end

front_page = []

reddit_posts = results_reddit["data"]["children"]
reddit_posts.each do |post|
	front_page.push(make_story(post["data"]["title"], post["data"]["subreddit"], post["data"]["likes"]))
end

#mashable code 
#new, rising, hot are the categories

# same as used above
# def make_story(title, category, upvotes)
# 	story = Hash.new
# 	story = {title: title, category: category, votes: upvotes}
# end

def print_page(page)
	page.each do |story|
		puts "Title: " + story[:title]
		puts "Category: " + story[:category]
		puts "Likes/Shares:" + test_value(story[:votes]).to_s		
	end
end

def test_value (votes)
	if votes == nil 
			return 0 
		else 
			return votes
	end
end

mashable_page = []
num_category_keys = results_mashable.keys.count-1
count = 0

while count < num_category_keys
	if results_mashable.keys[count] != "channel"
		category = results_mashable.keys[count]
		inner_count = results_mashable[category].count
		ticker = 0
		while ticker < inner_count
			mashable_info = results_mashable[category][ticker]
			mashable_page.push(make_story(mashable_info["title"], category, 
				mashable_info["shares"]["total"]))
			ticker +=1
		end
	end
	count += 1
end

puts "Reddit Front Page"
print_page(front_page)
puts "Mashable Front Page"
print_page(mashable_page)


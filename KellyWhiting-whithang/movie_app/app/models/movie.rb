class Movie < ActiveRecord::Base
	has_many :reviews
	validates_presence_of :title, :description, :year_released
end

# HW to-do
# - add a review
# - add a validation to review
# - review should be associated with Movie

# movie class
# has_many :review (after validations)

# review class
# belongs_to :movie

# build review db with movie_id as foreign key and run migration



# t.integer :movie_id
# t.text :comment
# t.string :user_name
# t.integer :rating


class Review < ActiveRecord::Base
	belongs_to :movie
	validates_presence_of :comment, :rating

end

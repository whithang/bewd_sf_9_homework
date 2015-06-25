class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :winery

	validates_presence_of :comment, :user_id, :winery_id
end

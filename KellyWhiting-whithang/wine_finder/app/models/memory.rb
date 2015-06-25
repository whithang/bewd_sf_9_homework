class Memory < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :wineries

	validates_presence_of :name, :user_id
end

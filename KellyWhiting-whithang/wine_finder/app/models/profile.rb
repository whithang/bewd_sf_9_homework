class Profile < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :first_name, :user_id
end

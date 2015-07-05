class Profile < ActiveRecord::Base
	belongs_to :user
	belongs_to :fb_user

	validates_presence_of :first_name, (:user_id || :fb_user_id)
end

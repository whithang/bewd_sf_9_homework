class Memory < ActiveRecord::Base
	belongs_to :user
	has_many :memory_details, dependent: :destroy
	

	validates_presence_of :name, :user_id
end

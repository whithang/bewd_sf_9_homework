class Winery < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	belongs_to :memory_details

	validates_presence_of :name
end

class Winery < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	has_and_belongs_to_many :memories

	validates_presence_of :name
end

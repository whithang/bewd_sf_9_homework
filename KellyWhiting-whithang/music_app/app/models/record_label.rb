class RecordLabel < ActiveRecord::Base
	has_many :artists, dependent: :destroy 
	validates_presence_of :name
end

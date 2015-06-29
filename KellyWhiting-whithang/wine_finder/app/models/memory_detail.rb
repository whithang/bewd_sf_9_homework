class MemoryDetail < ActiveRecord::Base
	has_one :winery
	belongs_to :memory

	validates_presence_of :memory_id, :winery_id
end

# == Schema Information
#
# Table name: memory_details
#
#  id           :integer          not null, primary key
#  notes        :string
#  visited      :boolean
#  visited_date :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  winery_id    :integer
#  memory_id    :integer
#

class MemoryDetail < ActiveRecord::Base
	has_one :winery
	belongs_to :memory

	validates_presence_of :memory_id, :winery_id
end

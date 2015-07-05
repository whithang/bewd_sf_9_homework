# == Schema Information
#
# Table name: memories
#
#  id            :integer          not null, primary key
#  name          :string
#  trip_date     :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#  trip_date_end :date
#

class Memory < ActiveRecord::Base
	belongs_to :user
	has_many :memory_details, dependent: :destroy
	

	validates_presence_of :name, :user_id
end

# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  comment    :text
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  winery_id  :integer
#  photo      :string
#

class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :winery

	validates_presence_of :comment, :user_id, :winery_id
end

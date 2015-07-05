# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  bio        :text
#  birth_date :date
#  street     :string
#  city       :string
#  state      :string
#  zip        :integer
#  photo      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  fb_user_id :integer
#

class Profile < ActiveRecord::Base
	belongs_to :user
	# belongs_to :fb_user

	validates_presence_of :first_name, :user_id
end

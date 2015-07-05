# == Schema Information
#
# Table name: wineries
#
#  id          :integer          not null, primary key
#  name        :string
#  bio         :text
#  street      :string
#  city        :string
#  state       :string
#  zip         :integer
#  photo       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  phone       :string
#  email       :string
#  appointment :boolean
#  pets        :boolean
#  picnic      :boolean
#  fee         :float
#  open        :time
#  close       :time
#  website     :string
#

class Winery < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	belongs_to :memory_details

	validates_presence_of :name

	# before_create for search entry
	# scope :sonoma, -> {where(city: "Sonoma")}
	# downcase all db entries
	scope :city, -> (city){where(city: city)}
end

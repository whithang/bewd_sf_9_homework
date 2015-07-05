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

require 'test_helper'

class WineryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

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

require 'test_helper'

class MemoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

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

require 'test_helper'

class MemoryDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

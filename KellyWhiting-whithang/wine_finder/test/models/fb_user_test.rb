# == Schema Information
#
# Table name: fb_users
#
#  id               :integer          not null, primary key
#  provider         :string
#  uid              :string
#  name             :string
#  oauth_token      :string
#  oauth_expires_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  email            :string
#

require 'test_helper'

class FbUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

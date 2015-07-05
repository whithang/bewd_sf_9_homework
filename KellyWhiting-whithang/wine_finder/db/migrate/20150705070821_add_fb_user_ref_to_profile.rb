class AddFbUserRefToProfile < ActiveRecord::Migration
  def change
    add_reference :profiles, :fb_user, index: true, foreign_key: true
  end
end

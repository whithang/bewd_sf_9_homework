class AddEmailToFbUsers < ActiveRecord::Migration
  def change
    add_column :fb_users, :email, :string
  end
end

class AddWineryRefToReview < ActiveRecord::Migration
  def change
    add_reference :reviews, :winery, index: true, foreign_key: true
  end
end

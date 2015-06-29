class AddWineryRefToMemoryDetails < ActiveRecord::Migration
  def change
    add_reference :memory_details, :winery, index: true, foreign_key: true
  end
end

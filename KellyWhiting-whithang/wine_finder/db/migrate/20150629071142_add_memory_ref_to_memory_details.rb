class AddMemoryRefToMemoryDetails < ActiveRecord::Migration
  def change
    add_reference :memory_details, :memory, index: true, foreign_key: true
  end
end

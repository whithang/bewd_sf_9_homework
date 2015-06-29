class AddEndDateToMemories < ActiveRecord::Migration
  def change
    add_column :memories, :trip_date_end, :date
  end
end

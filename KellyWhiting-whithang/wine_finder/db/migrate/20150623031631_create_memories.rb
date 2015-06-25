class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :name
      t.date :trip_date

      t.timestamps null: false
    end
  end
end

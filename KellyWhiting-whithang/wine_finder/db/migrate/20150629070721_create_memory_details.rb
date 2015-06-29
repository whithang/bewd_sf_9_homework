class CreateMemoryDetails < ActiveRecord::Migration
  def change
    create_table :memory_details do |t|
      t.string :notes
      t.boolean :visited
      t.date :visited_date

      t.timestamps null: false
    end
  end
end

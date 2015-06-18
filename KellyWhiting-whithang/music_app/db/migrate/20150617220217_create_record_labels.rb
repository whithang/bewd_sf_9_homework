class CreateRecordLabels < ActiveRecord::Migration
  def change
    create_table :record_labels do |t|
      t.string :name
      t.integer :year_founded
      t.string :city
      t.string :genre

      t.timestamps null: false
    end
  end
end

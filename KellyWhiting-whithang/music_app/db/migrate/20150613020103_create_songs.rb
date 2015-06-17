class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :album
      t.integer :year

      t.timestamps null: false
    end
  end
end

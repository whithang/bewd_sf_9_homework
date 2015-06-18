class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.text :bio
      t.integer :formed_date
      t.string :formed_city
      

      t.timestamps null: false
    end
  end
end

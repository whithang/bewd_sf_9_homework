class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.date :birth_date
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.string :photo

      t.timestamps null: false
    end
  end
end

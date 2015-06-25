class CreateWineries < ActiveRecord::Migration
  def change
    create_table :wineries do |t|
      t.string :name
      t.text :bio
      t.date :founded_date
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.string :photo

      t.timestamps null: false
    end
  end
end

class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :movie_id
      t.text :comment
      t.string :user_name
      t.integer :rating

      t.timestamps null: false
    end
  end
end

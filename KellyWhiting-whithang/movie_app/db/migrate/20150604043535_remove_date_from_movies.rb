class RemoveDateFromMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :date_released, :integer
  end
end

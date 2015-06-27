class RemoveFoundedDateFromWineries < ActiveRecord::Migration
  def change
    remove_column :wineries, :founded_date, :integer
  end
end

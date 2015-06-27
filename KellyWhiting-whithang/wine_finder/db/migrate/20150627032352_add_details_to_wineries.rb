class AddDetailsToWineries < ActiveRecord::Migration
  def change
    add_column :wineries, :phone, :string
    add_column :wineries, :email, :string
    add_column :wineries, :appointment, :boolean
    add_column :wineries, :pets, :boolean
    add_column :wineries, :picnic, :boolean
    add_column :wineries, :fee, :float
    add_column :wineries, :open, :time
    add_column :wineries, :close, :time
  end
end

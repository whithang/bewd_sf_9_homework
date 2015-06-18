class AddRecordLabelRefToArtist < ActiveRecord::Migration
  def change
    add_reference :artists, :record_label, index: true, foreign_key: true
  end
end

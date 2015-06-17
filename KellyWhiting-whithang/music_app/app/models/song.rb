class Song < ActiveRecord::Base
	belongs_to :artist
	validates_presence_of :title
end

# create_table "songs", force: :cascade do |t|
#     t.string   "title"
#     t.string   "album"
#     t.integer  "year"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end
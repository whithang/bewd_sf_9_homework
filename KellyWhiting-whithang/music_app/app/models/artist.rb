class Artist < ActiveRecord::Base
	has_many :songs, dependent: :destroy
	belongs_to :record_label
	validates_presence_of :name, :record_label_id
end

# create_table "artists", force: :cascade do |t|
#     t.string   "name"
#     t.text     "bio"
#     t.integer  "formed_date"
#     t.string   "formed_city"
#     t.datetime "created_at",  null: false
#     t.datetime "updated_at",  null: false
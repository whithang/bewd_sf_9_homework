# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150705070821) do

  create_table "fb_users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "email"
  end

  create_table "memories", force: :cascade do |t|
    t.string   "name"
    t.date     "trip_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.date     "trip_date_end"
  end

  add_index "memories", ["user_id"], name: "index_memories_on_user_id"

  create_table "memory_details", force: :cascade do |t|
    t.string   "notes"
    t.boolean  "visited"
    t.date     "visited_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "winery_id"
    t.integer  "memory_id"
  end

  add_index "memory_details", ["memory_id"], name: "index_memory_details_on_memory_id"
  add_index "memory_details", ["winery_id"], name: "index_memory_details_on_winery_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.date     "birth_date"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "fb_user_id"
  end

  add_index "profiles", ["fb_user_id"], name: "index_profiles_on_fb_user_id"
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "winery_id"
    t.string   "photo"
  end

  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"
  add_index "reviews", ["winery_id"], name: "index_reviews_on_winery_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "wineries", force: :cascade do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "phone"
    t.string   "email"
    t.boolean  "appointment"
    t.boolean  "pets"
    t.boolean  "picnic"
    t.float    "fee"
    t.time     "open"
    t.time     "close"
    t.string   "website"
  end

end

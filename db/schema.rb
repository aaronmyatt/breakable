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

ActiveRecord::Schema.define(version: 20160331084632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "points", force: :cascade do |t|
    t.string  "lat"
    t.string  "lng"
    t.integer "profile_id"
    t.string  "note"
  end

  add_index "points", ["profile_id"], name: "index_points_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "username"
    t.float    "latest_point_lat"
    t.float    "latest_point_lng"
    t.boolean  "mapper"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_hash"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "password_salt"
  end

  add_foreign_key "points", "profiles"
end

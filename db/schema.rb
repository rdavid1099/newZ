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

ActiveRecord::Schema.define(version: 20161030152803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "logo_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "stations_users", id: false, force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "station_id", null: false
    t.index ["station_id", "user_id"], name: "index_stations_users_on_station_id_and_user_id", using: :btree
    t.index ["user_id", "station_id"], name: "index_stations_users_on_user_id_and_station_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "screen_name"
    t.string   "location"
    t.string   "profile_image"
    t.string   "uid"
    t.string   "twitter_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.integer  "role"
  end

end

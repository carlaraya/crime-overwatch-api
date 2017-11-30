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

ActiveRecord::Schema.define(version: 20171130040753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crime_records", force: :cascade do |t|
    t.bigint "crime_type_id"
    t.bigint "police_station_id"
    t.integer "new"
    t.integer "solved"
    t.boolean "is_hidden"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crime_type_id"], name: "index_crime_records_on_crime_type_id"
    t.index ["police_station_id"], name: "index_crime_records_on_police_station_id"
  end

  create_table "crime_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "featured_crimes", force: :cascade do |t|
    t.string "title"
    t.bigint "police_station_id"
    t.bigint "crime_type_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crime_type_id"], name: "index_featured_crimes_on_crime_type_id"
    t.index ["police_station_id"], name: "index_featured_crimes_on_police_station_id"
  end

  create_table "most_wanteds", force: :cascade do |t|
    t.string "name"
    t.bigint "crime_type_id"
    t.string "exact_crime"
    t.integer "reward"
    t.text "additional_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crime_type_id"], name: "index_most_wanteds_on_crime_type_id"
  end

  create_table "most_wanteds_police_stations", id: false, force: :cascade do |t|
    t.bigint "most_wanted_id", null: false
    t.bigint "police_station_id", null: false
  end

  create_table "police_stations", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.string "address"
    t.decimal "lat"
    t.decimal "lng"
    t.string "email"
    t.string "contact_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "crime_records", "crime_types"
  add_foreign_key "crime_records", "police_stations"
  add_foreign_key "featured_crimes", "crime_types"
  add_foreign_key "featured_crimes", "police_stations"
  add_foreign_key "most_wanteds", "crime_types"
end

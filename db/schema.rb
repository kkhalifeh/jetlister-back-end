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

ActiveRecord::Schema.define(version: 2019_05_24_135038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "list_places", force: :cascade do |t|
    t.bigint "list_id"
    t.bigint "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_list_places_on_list_id"
    t.index ["place_id"], name: "index_list_places_on_place_id"
  end

  create_table "lists", force: :cascade do |t|
    t.integer "author_id"
    t.bigint "location_id"
    t.integer "pinned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_lists_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pins", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_pins_on_list_id"
    t.index ["user_id"], name: "index_pins_on_user_id"
  end

  create_table "place_categories", force: :cascade do |t|
    t.bigint "place_id"
    t.bigint "category_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "list_id"
    t.index ["category_id"], name: "index_place_categories_on_category_id"
    t.index ["list_id"], name: "index_place_categories_on_list_id"
    t.index ["place_id"], name: "index_place_categories_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "google_id"
    t.string "name"
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "likes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
  end

  add_foreign_key "list_places", "lists"
  add_foreign_key "list_places", "places"
  add_foreign_key "lists", "locations"
  add_foreign_key "pins", "lists"
  add_foreign_key "pins", "users"
  add_foreign_key "place_categories", "categories"
  add_foreign_key "place_categories", "lists"
  add_foreign_key "place_categories", "places"
end

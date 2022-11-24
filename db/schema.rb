# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_21_015233) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories_users", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.boolean "privateCourt"
    t.string "limit"
    t.boolean "halfCourt"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.datetime "starts_at"
    t.boolean "privateMatch"
    t.string "privateMatchPassword"
  end

  create_table "matches_users", id: false, force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.date "birth_date"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

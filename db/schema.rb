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

ActiveRecord::Schema.define(version: 2024_10_04_031510) do

  create_table "blocks", force: :cascade do |t|
    t.string "user_id"
    t.string "blocked_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "followed_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "password_digest"
    t.string "name"
    t.integer "grade"
    t.integer "klass"
    t.binary "icon"
    t.text "profile"
    t.string "color"
    t.string "hobby_1"
    t.string "hobby_2"
    t.string "hobby_3"
    t.string "hobby_4"
    t.string "hobby_5"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end

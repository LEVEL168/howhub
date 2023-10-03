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

ActiveRecord::Schema.define(version: 2023_10_03_130513) do

  create_table "crafts", force: :cascade do |t|
    t.string "title"
    t.text "caption"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "thanks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "craft_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["craft_id"], name: "index_thanks_on_craft_id"
    t.index ["user_id", "craft_id"], name: "index_thanks_on_user_id_and_craft_id", unique: true
    t.index ["user_id"], name: "index_thanks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "mail"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["mail"], name: "index_users_on_mail", unique: true
  end

end

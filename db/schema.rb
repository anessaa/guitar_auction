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

ActiveRecord::Schema.define(version: 20171031175131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.integer "amount"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "guitar_id"
    t.index ["guitar_id"], name: "index_bids_on_guitar_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "remark"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "guitar_id"
    t.index ["guitar_id"], name: "index_comments_on_guitar_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "guitars", force: :cascade do |t|
    t.string "brand"
    t.string "style"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "auction_end"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "start_bid"
    t.index ["user_id"], name: "index_guitars_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bids", "guitars"
  add_foreign_key "bids", "users"
  add_foreign_key "comments", "guitars"
  add_foreign_key "comments", "users"
  add_foreign_key "guitars", "users"
end

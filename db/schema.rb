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

ActiveRecord::Schema.define(version: 20160323113152) do

  create_table "favorites", force: :cascade do |t|
    t.integer  "video_id"
    t.integer  "series_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["series_id"], name: "index_favorites_on_series_id"
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"
  add_index "favorites", ["video_id"], name: "index_favorites_on_video_id"

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer  "number"
    t.integer  "series_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "seasons", ["series_id"], name: "index_seasons_on_series_id"

  create_table "series", force: :cascade do |t|
    t.string   "title"
    t.text     "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "genre_id"
    t.integer  "tagable_id"
    t.string   "tagable_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "tags", ["genre_id"], name: "index_tags_on_genre_id"
  add_index "tags", ["tagable_type", "tagable_id"], name: "index_tags_on_tagable_type_and_tagable_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "username"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.integer  "language"
    t.integer  "year"
    t.text     "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "season_id"
  end

  add_index "videos", ["season_id"], name: "index_videos_on_season_id"

end

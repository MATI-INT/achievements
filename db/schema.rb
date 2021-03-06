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

ActiveRecord::Schema.define(version: 2018_05_21_140036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "community", default: false
  end

  create_table "callouts", force: :cascade do |t|
    t.text "description"
    t.string "url"
    t.string "image_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_callouts", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "callout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["callout_id"], name: "index_category_callouts_on_callout_id"
    t.index ["category_id"], name: "index_category_callouts_on_category_id"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id", "post_id"], name: "index_comments_on_user_id_and_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "post_achievements", id: :serial, force: :cascade do |t|
    t.integer "achievement_id"
    t.integer "post_id"
    t.index ["achievement_id"], name: "index_post_achievements_on_achievement_id"
    t.index ["post_id"], name: "index_post_achievements_on_post_id"
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_visits_on_category_id"
    t.index ["post_id"], name: "index_visits_on_post_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.integer "post_achievement_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_achievement_id", "user_id"], name: "index_votes_on_post_achievement_id_and_user_id", unique: true
    t.index ["post_achievement_id"], name: "index_votes_on_post_achievement_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "category_callouts", "callouts"
  add_foreign_key "category_callouts", "categories"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "posts", "categories"
  add_foreign_key "posts", "users"
  add_foreign_key "visits", "categories"
  add_foreign_key "visits", "posts"
  add_foreign_key "visits", "users"
  add_foreign_key "votes", "post_achievements"
  add_foreign_key "votes", "users"
end

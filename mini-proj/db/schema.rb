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

ActiveRecord::Schema.define(version: 20220512044839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cat_posts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "cat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id", "created_at"], name: "index_cat_posts_on_cat_id_and_created_at", using: :btree
    t.index ["cat_id"], name: "index_cat_posts_on_cat_id", using: :btree
    t.index ["user_id"], name: "index_cat_posts_on_user_id", using: :btree
  end

  create_table "cats", force: :cascade do |t|
    t.string   "name"
    t.string   "gender"
    t.decimal  "age"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "cat_id"
    t.index ["cat_id"], name: "index_cats_on_cat_id", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "cat_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id", "user_id"], name: "index_subscriptions_on_cat_id_and_user_id", unique: true, using: :btree
    t.index ["cat_id"], name: "index_subscriptions_on_cat_id", using: :btree
    t.index ["user_id"], name: "index_subscriptions_on_user_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "cat_id"
    t.integer  "trait_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "index_tags_on_cat_id", using: :btree
    t.index ["trait_id"], name: "index_tags_on_trait_id", using: :btree
  end

  create_table "traits", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "type"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "cat_posts", "cats"
  add_foreign_key "cat_posts", "users"
  add_foreign_key "cats", "cats"
  add_foreign_key "subscriptions", "cats"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "tags", "cats"
  add_foreign_key "tags", "traits"
end

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

ActiveRecord::Schema.define(version: 2022_05_13_091639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cat_posts", id: :serial, force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "cat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id", "created_at"], name: "index_cat_posts_on_cat_id_and_created_at"
    t.index ["cat_id"], name: "index_cat_posts_on_cat_id"
    t.index ["user_id"], name: "index_cat_posts_on_user_id"
  end

  create_table "cats", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cat_id"
    t.date "birthday"
    t.index ["cat_id"], name: "index_cats_on_cat_id"
  end

  create_table "subscriptions", id: :serial, force: :cascade do |t|
    t.integer "cat_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id", "user_id"], name: "index_subscriptions_on_cat_id_and_user_id", unique: true
    t.index ["cat_id"], name: "index_subscriptions_on_cat_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.integer "cat_id"
    t.integer "trait_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "index_tags_on_cat_id"
    t.index ["trait_id"], name: "index_tags_on_trait_id"
  end

  create_table "traits", id: :serial, force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cat_posts", "cats"
  add_foreign_key "cat_posts", "users"
  add_foreign_key "cats", "cats"
  add_foreign_key "subscriptions", "cats"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "tags", "cats"
  add_foreign_key "tags", "traits"
end

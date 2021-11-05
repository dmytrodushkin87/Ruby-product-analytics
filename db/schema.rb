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

ActiveRecord::Schema.define(version: 20180717110420) do

  create_table "categories", force: :cascade do |t|
    t.string   "category",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "mappings", id: false, force: :cascade do |t|
    t.integer  "user_id",    limit: 4, default: 0, null: false
    t.integer  "schemecode", limit: 4, default: 0, null: false
    t.integer  "clicks",     limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "category_id", limit: 4
    t.integer  "schemecode",  limit: 4
    t.string   "s_name",      limit: 255
    t.integer  "rating",      limit: 4
    t.text     "objective",   limit: 65535
    t.integer  "clicks",      limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "products_users", id: false, force: :cascade do |t|
    t.integer "user_id",    limit: 4, null: false
    t.integer "product_id", limit: 4, null: false
  end

  add_index "products_users", ["product_id", "user_id"], name: "index_products_users_on_product_id_and_user_id", using: :btree
  add_index "products_users", ["user_id", "product_id"], name: "index_products_users_on_user_id_and_product_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end

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

ActiveRecord::Schema.define(version: 20150409171706) do

  create_table "customers", force: :cascade do |t|
    t.string   "customer_id"
    t.string   "company"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "email"
    t.string   "business_phone"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.string   "fax"
    t.string   "address"
    t.string   "city"
    t.string   "state_province"
    t.string   "zip_postal_code"
    t.string   "country_region"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.string   "discount_code"
    t.float    "discount_amount"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "histories", force: :cascade do |t|
    t.string   "customer_id"
    t.string   "product_id"
    t.string   "product_name"
    t.string   "image_url"
    t.decimal  "price"
    t.datetime "date_visited"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

# Could not dump table "products" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "sellers", force: :cascade do |t|
    t.string   "seller_id"
    t.string   "company"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "email"
    t.string   "business_phone"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.string   "fax"
    t.string   "address"
    t.string   "city"
    t.string   "state_province"
    t.string   "zip_postal_code"
    t.string   "country_region"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "shipping_books", force: :cascade do |t|
    t.string   "shipping_book_id"
    t.string   "customer_id"
    t.string   "shipping_name"
    t.string   "shipping_address"
    t.string   "shipping_city"
    t.string   "shipping_state_province"
    t.string   "shipping_zip_postal"
    t.string   "shipping_country_region"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "state_taxes", force: :cascade do |t|
    t.string   "state_code"
    t.float    "tax_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

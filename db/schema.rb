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

ActiveRecord::Schema.define(version: 20141020231539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "street_address"
    t.string   "sub_premise"
    t.string   "street_number"
    t.string   "street_name"
    t.string   "city"
    t.string   "state"
    t.string   "state_code"
    t.string   "state_name"
    t.string   "zip"
    t.string   "country_code"
    t.string   "province"
    t.string   "precision"
    t.string   "full_address"
    t.decimal  "lat"
    t.decimal  "lng"
    t.string   "provider"
    t.string   "district"
    t.string   "country"
    t.integer  "accuracy"
    t.integer  "locatable_id"
    t.string   "locatable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["lat", "lng"], name: "index_locations_on_lat_and_lng", using: :btree

  create_table "ne_suggested_bounds", force: true do |t|
    t.decimal  "lat"
    t.decimal  "lng"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ne_suggested_bounds", ["lat", "lng"], name: "index_ne_suggested_bounds_on_lat_and_lng", using: :btree

  create_table "sw_suggested_bounds", force: true do |t|
    t.decimal  "lat"
    t.decimal  "lng"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sw_suggested_bounds", ["lat", "lng"], name: "index_sw_suggested_bounds_on_lat_and_lng", using: :btree

  create_table "users", force: true do |t|
    t.boolean  "admin",                  default: false
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end

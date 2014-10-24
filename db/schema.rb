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

ActiveRecord::Schema.define(version: 20141023134449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "categories_providers", id: false, force: true do |t|
    t.integer "provider_id", null: false
    t.integer "category_id", null: false
  end

  add_index "categories_providers", ["category_id", "provider_id"], name: "index_categories_providers_on_category_id_and_provider_id", unique: true, using: :btree
  add_index "categories_providers", ["provider_id", "category_id"], name: "index_categories_providers_on_provider_id_and_category_id", unique: true, using: :btree

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "items", force: true do |t|
    t.string   "name",         null: false
    t.text     "link"
    t.text     "tooltip"
    t.text     "cooking_link"
    t.integer  "category_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", unique: true, using: :btree

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
    t.float    "lat"
    t.float    "lng"
    t.float    "swlat"
    t.float    "swlng"
    t.float    "nelat"
    t.float    "nelng"
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
  add_index "locations", ["nelat", "nelng"], name: "index_locations_on_nelat_and_nelng", using: :btree
  add_index "locations", ["swlat", "swlng"], name: "index_locations_on_swlat_and_swlng", using: :btree

  create_table "providers", force: true do |t|
    t.string   "name",       null: false
    t.text     "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "providers", ["name"], name: "index_providers_on_name", unique: true, using: :btree
  add_index "providers", ["website"], name: "index_providers_on_website", unique: true, using: :btree

  create_table "providers_sources", id: false, force: true do |t|
    t.integer "provider_id", null: false
    t.integer "source_id",   null: false
  end

  add_index "providers_sources", ["provider_id", "source_id"], name: "index_providers_sources_on_provider_id_and_source_id", unique: true, using: :btree
  add_index "providers_sources", ["source_id", "provider_id"], name: "index_providers_sources_on_source_id_and_provider_id", unique: true, using: :btree

  create_table "sources", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sources", ["name"], name: "index_sources_on_name", unique: true, using: :btree

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

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

ActiveRecord::Schema.define(version: 20150209001343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beer_styles", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "beer_styles", ["name"], name: "index_beer_styles_on_name", unique: true, using: :btree

  create_table "beers", force: :cascade do |t|
    t.string   "name",          null: false
    t.decimal  "abv"
    t.integer  "brewery_id",    null: false
    t.integer  "beer_style_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "beers", ["beer_style_id"], name: "index_beers_on_beer_style_id", using: :btree
  add_index "beers", ["brewery_id"], name: "index_beers_on_brewery_id", using: :btree
  add_index "beers", ["name"], name: "index_beers_on_name", using: :btree

  create_table "breweries", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keg_volumes", force: :cascade do |t|
    t.string   "name",             null: false
    t.decimal  "us_gallons"
    t.decimal  "litres"
    t.decimal  "imperial_gallons"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "kegs", force: :cascade do |t|
    t.datetime "tapped_at"
    t.datetime "kicked_at"
    t.integer  "keg_volume_id", null: false
    t.integer  "beer_id",       null: false
    t.integer  "venue_id",      null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "kegs", ["beer_id"], name: "index_kegs_on_beer_id", using: :btree
  add_index "kegs", ["keg_volume_id"], name: "index_kegs_on_keg_volume_id", using: :btree
  add_index "kegs", ["venue_id"], name: "index_kegs_on_venue_id", using: :btree

  create_table "organization_roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organization_users", force: :cascade do |t|
    t.integer  "user_id",              null: false
    t.integer  "organization_id",      null: false
    t.integer  "organization_role_id", null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "organization_users", ["organization_id"], name: "index_organization_users_on_organization_id", using: :btree
  add_index "organization_users", ["organization_role_id"], name: "index_organization_users_on_organization_role_id", using: :btree
  add_index "organization_users", ["user_id"], name: "index_organization_users_on_user_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "venue_taps", force: :cascade do |t|
    t.integer  "number",     null: false
    t.integer  "venue_id",   null: false
    t.integer  "keg_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "venue_taps", ["keg_id"], name: "index_venue_taps_on_keg_id", using: :btree
  add_index "venue_taps", ["venue_id"], name: "index_venue_taps_on_venue_id", using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "address",         null: false
    t.integer  "organization_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "venues", ["organization_id"], name: "index_venues_on_organization_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "kegs", "beers"
  add_foreign_key "kegs", "keg_volumes"
  add_foreign_key "kegs", "venues"
  add_foreign_key "organization_users", "organization_roles"
  add_foreign_key "organization_users", "organizations"
  add_foreign_key "organization_users", "users"
  add_foreign_key "venue_taps", "kegs"
  add_foreign_key "venue_taps", "venues"
  add_foreign_key "venues", "organizations"
end

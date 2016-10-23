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

ActiveRecord::Schema.define(version: 20161023105422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deals", force: :cascade do |t|
    t.integer  "vendor_id",  null: false
    t.string   "title",      null: false
    t.datetime "valid_till", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "valid_from"
    t.index ["vendor_id"], name: "index_deals_on_vendor_id", using: :btree
  end

  create_table "stamps", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "vendor_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_stamps_on_user_id", using: :btree
    t.index ["vendor_id"], name: "index_stamps_on_vendor_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "type",                   default: "User"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vendors", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "name",       null: false
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vendors_on_user_id", using: :btree
  end

  add_foreign_key "deals", "vendors"
  add_foreign_key "stamps", "users"
  add_foreign_key "stamps", "vendors"
  add_foreign_key "vendors", "users"
end

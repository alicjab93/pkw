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

ActiveRecord::Schema.define(version: 20150212221413) do

  create_table "committees", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "committees_provinces", id: false, force: :cascade do |t|
    t.integer "province_id",  null: false
    t.integer "committee_id", null: false
  end

  add_index "committees_provinces", ["province_id", "committee_id"], name: "index_committees_provinces_on_province_id_and_committee_id", unique: true

  create_table "constituencies", force: :cascade do |t|
    t.integer  "number"
    t.integer  "mandates"
    t.integer  "ballots"
    t.integer  "voters"
    t.integer  "province_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "constituencies", ["province_id"], name: "index_constituencies_on_province_id"
  add_index "constituencies", ["user_id"], name: "index_constituencies_on_user_id", unique: true

  create_table "invalid_votes", force: :cascade do |t|
    t.integer  "constituency_id"
    t.integer  "reason_id"
    t.integer  "quantity"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "invalid_votes", ["constituency_id", "reason_id"], name: "index_invalid_votes_on_constituency_id_and_reason_id", unique: true

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reasons", force: :cascade do |t|
    t.string   "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.integer  "constituency_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "valid_votes", force: :cascade do |t|
    t.integer  "constituency_id"
    t.integer  "committee_id"
    t.integer  "quantity"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "valid_votes", ["constituency_id", "committee_id"], name: "index_valid_votes_on_constituency_id_and_committee_id", unique: true

end

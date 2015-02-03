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

ActiveRecord::Schema.define(version: 20150127232525) do

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
  end

  add_index "constituencies", ["province_id"], name: "index_constituencies_on_province_id"

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

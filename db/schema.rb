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

ActiveRecord::Schema.define(version: 20150902230437) do

  create_table "brothers", force: :cascade do |t|
    t.integer  "congregation_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "privilege"
    t.string   "slug"
  end

  add_index "brothers", ["congregation_id"], name: "index_brothers_on_congregation_id"
  add_index "brothers", ["slug"], name: "index_brothers_on_slug", unique: true

  create_table "brothers_outlines", force: :cascade do |t|
    t.integer "brother_id"
    t.integer "outline_id"
  end

  add_index "brothers_outlines", ["brother_id"], name: "index_brothers_outlines_on_brother_id"
  add_index "brothers_outlines", ["outline_id"], name: "index_brothers_outlines_on_outline_id"

  create_table "congregations", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.string   "meeting_time"
    t.string   "meeting_day"
    t.string   "address"
    t.string   "kh_phone"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "talk_coordinator"
    t.string   "talk_coordinator_phone"
    t.string   "slug"
    t.boolean  "my_congregation"
  end

  add_index "congregations", ["slug"], name: "index_congregations_on_slug", unique: true

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "outlines", force: :cascade do |t|
    t.string   "title"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

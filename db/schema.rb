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

ActiveRecord::Schema.define(version: 20140624152154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dhatus", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "padam_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lakaras", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lakaras", ["name"], name: "index_lakaras_on_name", unique: true, using: :btree

  create_table "padams", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "padams", ["name"], name: "index_padams_on_name", unique: true, using: :btree

  create_table "purushas", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purushas", ["name"], name: "index_purushas_on_name", unique: true, using: :btree

  create_table "roopas", force: true do |t|
    t.string   "name"
    t.integer  "dhatu_id"
    t.integer  "purusha_id"
    t.integer  "vachanam_id"
    t.integer  "lakaras_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "name",            null: false
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "vachanams", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vachanams", ["name"], name: "index_vachanams_on_name", unique: true, using: :btree

end

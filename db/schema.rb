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

ActiveRecord::Schema.define(version: 20140930142850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "permits", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.date     "expiration_date"
    t.text     "manager"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_permits", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.date     "expiration_date"
    t.text     "manager"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: true do |t|
    t.text     "name"
    t.text     "street_address"
    t.integer  "fein_number"
    t.date     "create_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

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

ActiveRecord::Schema.define(version: 20161203061433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string   "ID"
    t.string   "Name"
    t.string   "Phone"
    t.string   "Email"
    t.string   "Sloagn"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_licenses", force: true do |t|
    t.integer  "site_employee_id"
    t.integer  "license_id"
    t.datetime "expiration_date"
    t.boolean  "obtained?"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employee_licenses", ["license_id"], name: "index_employee_licenses_on_license_id", using: :btree
  add_index "employee_licenses", ["site_employee_id"], name: "index_employee_licenses_on_site_employee_id", using: :btree

  create_table "employee_trainings", force: true do |t|
    t.integer  "site_employee_id"
    t.integer  "training_id"
    t.datetime "expiration_date"
    t.boolean  "obtained?"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employee_trainings", ["site_employee_id"], name: "index_employee_trainings_on_site_employee_id", using: :btree
  add_index "employee_trainings", ["training_id"], name: "index_employee_trainings_on_training_id", using: :btree

  create_table "issues", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "submitted_by"
    t.string   "status"
    t.datetime "resolution_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licenses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_employees", force: true do |t|
    t.text     "first_name"
    t.text     "last_name"
    t.text     "employee_ID"
    t.text     "phone_number"
    t.text     "email_address"
    t.boolean  "salaried"
    t.boolean  "manager"
    t.boolean  "boolean"
    t.date     "date_hired"
    t.date     "date_fired"
    t.boolean  "employed"
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
    t.boolean  "submitted",       default: false
  end

  add_index "site_permits", ["expiration_date"], name: "index_site_permits_on_expiration_date", using: :btree
  add_index "site_permits", ["site_id"], name: "index_site_permits_on_site_id", using: :btree

  create_table "sites", force: true do |t|
    t.text     "name"
    t.text     "street_address"
    t.text     "fein_number"
    t.date     "create_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tenants", force: true do |t|
    t.string   "name"
    t.string   "domain"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainings", force: true do |t|
    t.string   "course_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin",                  default: false
    t.string   "username"
  end

end

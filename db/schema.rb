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

ActiveRecord::Schema.define(version: 2019_02_27_102132) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.text "email"
    t.string "role"
    t.integer "experience"
    t.boolean "status"
    t.integer "technology_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["technology_id"], name: "index_employees_on_technology_id"
  end

  create_table "logins", force: :cascade do |t|
    t.string "logintype"
    t.string "username"
    t.text "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.string "pm"
    t.integer "budget"
    t.integer "client_id"
    t.integer "technology_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "employee"
    t.index ["client_id"], name: "index_projects_on_client_id"
    t.index ["technology_id"], name: "index_projects_on_technology_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

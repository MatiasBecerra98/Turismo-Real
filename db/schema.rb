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

ActiveRecord::Schema.define(version: 20191125004507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "appartment_qualities", force: :cascade do |t|
    t.bigint "appartment_id"
    t.boolean "cable"
    t.boolean "conditioned_air"
    t.boolean "internet"
    t.boolean "calefaction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appartment_id"], name: "index_appartment_qualities_on_appartment_id"
  end

  create_table "appartments", force: :cascade do |t|
    t.integer "nightly_fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "address"
    t.string "name"
  end

  create_table "cleaning_events", force: :cascade do |t|
    t.bigint "appartment_id"
    t.datetime "time_of_event"
    t.bigint "janitor_id"
    t.boolean "reminder_sent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appartment_id"], name: "index_cleaning_events_on_appartment_id"
    t.index ["janitor_id"], name: "index_cleaning_events_on_janitor_id"
  end

  create_table "extra_services", force: :cascade do |t|
    t.bigint "reservation_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_extra_services_on_reservation_id"
  end

  create_table "janitors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "appartment_id"
    t.date "starting_date"
    t.date "ending_date"
    t.integer "total_cost"
    t.boolean "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appartment_id"], name: "index_reservations_on_appartment_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "supplies", force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supply_movements", force: :cascade do |t|
    t.bigint "supply_id"
    t.bigint "appartment_id"
    t.integer "movement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appartment_id"], name: "index_supply_movements_on_appartment_id"
    t.index ["supply_id"], name: "index_supply_movements_on_supply_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["profile_id"], name: "index_users_on_profile_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appartment_qualities", "appartments"
  add_foreign_key "cleaning_events", "appartments"
  add_foreign_key "cleaning_events", "janitors"
  add_foreign_key "extra_services", "reservations"
  add_foreign_key "reservations", "appartments"
  add_foreign_key "reservations", "users"
  add_foreign_key "supply_movements", "appartments"
  add_foreign_key "supply_movements", "supplies"
end

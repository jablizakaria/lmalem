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

ActiveRecord::Schema.define(version: 2018_12_07_100132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interventions", force: :cascade do |t|
    t.string "status"
    t.date "date_intervention"
    t.bigint "user_id"
    t.bigint "users_speciality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_interventions_on_user_id"
    t.index ["users_speciality_id"], name: "index_interventions_on_users_speciality_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.decimal "puntctuation"
    t.decimal "efficacy"
    t.decimal "behaviour"
    t.text "commentary"
    t.bigint "user_id"
    t.bigint "users_speciality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "isvalid"
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["users_speciality_id"], name: "index_reviews_on_users_speciality_id"
  end

  create_table "specialities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "city"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "photo"
    t.boolean "admin"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_specialities", force: :cascade do |t|
    t.text "description"
    t.decimal "avg_punctuation"
    t.decimal "avg_efficacy"
    t.decimal "avg_behaviour"
    t.bigint "user_id"
    t.bigint "speciality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "isvalid"
    t.index ["speciality_id"], name: "index_users_specialities_on_speciality_id"
    t.index ["user_id"], name: "index_users_specialities_on_user_id"
  end

  add_foreign_key "interventions", "users"
  add_foreign_key "interventions", "users_specialities"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "users_specialities"
  add_foreign_key "users_specialities", "specialities"
  add_foreign_key "users_specialities", "users"
end

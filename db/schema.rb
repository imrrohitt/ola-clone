# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_27_095144) do
  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "license_number"
    t.string "vehicle_type"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rides", force: :cascade do |t|
    t.integer "rider_id"
    t.integer "driver_id"
    t.integer "vehicle_id"
    t.string "status"
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
    t.string "jti", null: false
    t.integer "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicle_data", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "img_url"
    t.string "category"
    t.string "details"
    t.string "pax_info"
    t.string "category_key"
    t.boolean "is_ryde"
    t.string "review_rating"
    t.string "review_bc"
    t.string "review_brc"
    t.string "pay_type"
    t.integer "so_price"
    t.integer "price"
    t.string "price_msg"
    t.string "cta_text"
    t.integer "per_off"
    t.integer "sod"
    t.float "e_f_r"
    t.integer "base_fare"
    t.boolean "is_zero_booking"
    t.json "cab_facilities"
    t.string "d_s"
    t.json "t_g_i"
    t.json "offers"
    t.string "dbg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "vehicle_type"
    t.string "license_plate"
    t.string "color"
    t.string "status"
    t.boolean "active"
    t.text "insurance_info"
    t.text "registration_info"
    t.integer "capacity"
    t.integer "year"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

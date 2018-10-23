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

ActiveRecord::Schema.define(version: 2018_10_23_132804) do

  create_table "passenger_rides", force: :cascade do |t|
    t.integer "passenger_id"
    t.integer "ride_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.integer "rating"
    t.string "content"
    t.integer "ride_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rides", force: :cascade do |t|
    t.string "departure"
    t.string "destination"
    t.datetime "time"
    t.time "duration"
    t.integer "cost"
    t.integer "available_seats"
    t.integer "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "car_type"
    t.string "about_me"
    t.boolean "smoking"
    t.boolean "pets"
    t.integer "engagement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

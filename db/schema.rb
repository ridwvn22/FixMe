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

ActiveRecord::Schema[7.1].define(version: 2023_12_07_194606) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "habits", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "duration", precision: nil
    t.bigint "user_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "calendar_type"
    t.bigint "calendar_id"
    t.datetime "date"
    t.index ["calendar_type", "calendar_id"], name: "index_habits_on_calendar"
    t.index ["user_id"], name: "index_habits_on_user_id"
  end

  create_table "logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "habit_id", null: false
    t.date "entry_date"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.index ["habit_id"], name: "index_logs_on_habit_id"
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "reminders", force: :cascade do |t|
    t.string "frequency"
    t.string "name"
    t.string "description"
    t.string "calendar_date"
    t.bigint "habit_id", null: false
    t.string "calendar_type"
    t.bigint "calendar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calendar_type", "calendar_id"], name: "index_reminders_on_calendar"
    t.index ["habit_id"], name: "index_reminders_on_habit_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "username", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "habits", "users"
  add_foreign_key "logs", "habits"
  add_foreign_key "logs", "users"
  add_foreign_key "reminders", "habits"
end

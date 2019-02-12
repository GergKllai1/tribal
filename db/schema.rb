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

ActiveRecord::Schema.define(version: 2019_02_12_094947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "price_tables", force: :cascade do |t|
    t.integer "trainee_1"
    t.integer "trainee_2"
    t.integer "trainee_3"
    t.integer "trainee_4"
    t.integer "trainee_5"
    t.integer "trainee_6"
    t.integer "trainee_7"
    t.integer "trainee_8"
    t.integer "price_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "price_table_id"
    t.string "channel_name"
    t.integer "price"
    t.string "coach_name"
    t.index ["price_table_id"], name: "index_sessions_on_price_table_id"
  end

  create_table "sessions_users", id: false, force: :cascade do |t|
    t.bigint "session_id", null: false
    t.bigint "user_id", null: false
    t.index ["session_id", "user_id"], name: "index_sessions_users_on_session_id_and_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "payment_status"
    t.string "stripe_id"
    t.bigint "session_id"
    t.index ["session_id"], name: "index_transactions_on_session_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "role"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "sessions", "price_tables"
  add_foreign_key "transactions", "sessions"
  add_foreign_key "transactions", "users"
end

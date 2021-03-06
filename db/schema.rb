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

ActiveRecord::Schema.define(version: 20180528193059) do

  create_table "messages", force: :cascade do |t|
    t.string "subject"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "messages_records", id: false, force: :cascade do |t|
    t.integer "record_id", null: false
    t.integer "message_id", null: false
    t.index ["record_id", "message_id"], name: "index_messages_records_on_record_id_and_message_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_records_on_owner_id"
  end

  create_table "records_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "record_id", null: false
    t.index ["user_id", "record_id"], name: "index_records_users_on_user_id_and_record_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end

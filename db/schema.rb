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

ActiveRecord::Schema.define(version: 20160807214923) do

  create_table "lessons", force: :cascade do |t|
    t.datetime "date_time"
    t.integer  "duration"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
    t.index ["student_id"], name: "index_lessons_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "parent_phone"
    t.text     "notes"
    t.decimal  "balance"
    t.decimal  "rate"
    t.string   "email"
    t.string   "parents_email"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal  "ammount"
    t.datetime "date_time"
    t.text     "notes"
    t.boolean  "credit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
    t.index ["student_id"], name: "index_transactions_on_student_id"
  end

end

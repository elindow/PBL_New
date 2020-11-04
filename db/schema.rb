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

ActiveRecord::Schema.define(version: 20160902200221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "perf_types", force: :cascade do |t|
    t.integer  "ps"
    t.integer  "pt"
    t.integer  "as"
    t.integer  "cq"
    t.integer  "po"
    t.integer  "io"
    t.integer  "db"
    t.integer  "question_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "perf_types", ["question_id"], name: "index_perf_types_on_question_id", using: :btree
  add_index "perf_types", ["student_id"], name: "index_perf_types_on_student_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "num"
    t.integer  "page"
    t.text     "qtext"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "answer"
    t.string   "qimage"
    t.string   "aimage"
    t.string   "shortAnswer"
    t.string   "presenter1"
    t.string   "presenter2"
    t.integer  "level"
  end

  create_table "questions_topics", id: false, force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "topic_id",    null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "lname"
    t.string   "fname"
    t.string   "clsname"
    t.integer  "grade"
    t.boolean  "genderf"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "inits"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "topicName"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "lev1"
    t.boolean  "lev2"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.boolean  "teacher",                default: false
    t.boolean  "viewer",                 default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

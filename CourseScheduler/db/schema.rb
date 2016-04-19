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

ActiveRecord::Schema.define(version: 20160405211821) do

  create_table "courses", force: :cascade do |t|
    t.text     "courseName"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "courseNumber"
    t.string   "department"
  end

  create_table "users", force: :cascade do |t|
    t.text    "email",                  default: "", null: false
    t.text    "encrypted_password",     default: "", null: false
    t.text    "reset_password_token"
    t.text    "reset_password_sent_at"
    t.text    "remember_created_at"
    t.integer "sign_in_count",          default: 0,  null: false
    t.text    "current_sign_in_at"
    t.text    "last_sign_in_at"
    t.text    "current_sign_in_ip"
    t.text    "last_sign_in_ip"
    t.text    "created_at",                          null: false
    t.text    "updated_at",                          null: false
    t.text    "provider"
    t.text    "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

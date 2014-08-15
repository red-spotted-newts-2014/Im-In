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

ActiveRecord::Schema.define(version: 20140814195751) do

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "venue"
    t.string   "location"
    t.boolean  "notify_user?"
    t.integer  "notify_hours_until_event"
    t.integer  "user_id"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "follows", force: true do |t|
    t.integer  "followable_id",                   null: false
    t.string   "followable_type",                 null: false
    t.integer  "follower_id",                     null: false
    t.string   "follower_type",                   null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows"

  create_table "invitations", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["event_id"], name: "index_invitations_on_event_id"
  add_index "invitations", ["user_id"], name: "index_invitations_on_user_id"

  create_table "users", force: true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "phone_number"
    t.string "email"
    t.string "password_digest"
  end

end

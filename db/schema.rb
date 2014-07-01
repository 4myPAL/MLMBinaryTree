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

ActiveRecord::Schema.define(version: 20140624022844) do

  create_table "networks", force: true do |t|
    t.integer  "user_id"
    t.integer  "parent_id"
    t.integer  "left_id"
    t.integer  "right_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "added_by_id"
  end

  add_index "networks", ["added_by_id"], name: "index_networks_on_added_by_id"
  add_index "networks", ["left_id"], name: "index_networks_on_left_id"
  add_index "networks", ["parent_id"], name: "index_networks_on_parent_id"
  add_index "networks", ["right_id"], name: "index_networks_on_right_id"
  add_index "networks", ["user_id"], name: "index_networks_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "referral_by_id"
  end

  add_index "users", ["referral_by_id"], name: "index_users_on_referral_by_id"

end

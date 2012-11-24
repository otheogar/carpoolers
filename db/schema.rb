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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121122020117) do

  create_table "messages", :force => true do |t|
    t.string   "sub"
    t.text     "body"
    t.integer  "read_msg"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "owner_id"
  end

  add_index "messages", ["owner_id"], :name => "index_messages_on_owner_id"

  create_table "trips", :force => true do |t|
    t.string   "from_string"
    t.string   "to_string"
    t.float    "from_longitude"
    t.float    "from_latitude"
    t.float    "to_longitude"
    t.float    "to_latitude"
    t.date     "date"
    t.time     "time"
    t.integer  "flag"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "availabilty",    :default => 1
    t.string   "owner_id"
    t.integer  "rating",         :default => 0
  end

  add_index "trips", ["from_latitude"], :name => "index_trips_on_from_latitude"
  add_index "trips", ["from_longitude"], :name => "index_trips_on_from_longitude"
  add_index "trips", ["owner_id"], :name => "index_trips_on_owner_id"
  add_index "trips", ["to_latitude"], :name => "index_trips_on_to_latitude"
  add_index "trips", ["to_longitude"], :name => "index_trips_on_to_longitude"

  create_table "trips_connects", :force => true do |t|
    t.integer  "trip_id"
    t.string   "other_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_logins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "uid"
  end

  add_index "user_logins", ["email"], :name => "index_user_logins_on_email", :unique => true
  add_index "user_logins", ["reset_password_token"], :name => "index_user_logins_on_reset_password_token", :unique => true
  add_index "user_logins", ["uid"], :name => "index_user_logins_on_uid", :unique => true

  create_table "user_profiles", :force => true do |t|
    t.string   "user_uid"
    t.string   "name"
    t.string   "email"
    t.string   "gender"
    t.integer  "age"
    t.string   "home_string"
    t.float    "home_longitude"
    t.float    "home_latitude"
    t.string   "picture_url"
    t.text     "description"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "no_rating",      :default => 0
    t.integer  "rating",         :default => 0
  end

  add_index "user_profiles", ["user_uid"], :name => "index_user_profiles_on_user_uid", :unique => true

  create_table "users", :id => false, :force => true do |t|
    t.string   "uid"
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "users", ["uid"], :name => "index_users_on_uid", :unique => true

end

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

ActiveRecord::Schema.define(:version => 20121026193722) do

  create_table "food_trucks", :force => true do |t|
    t.string   "truck_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "cuisine_type"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "address"
    t.integer  "number_of_trucks"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.decimal  "price"
    t.text     "details"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "menu_id"
  end

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "food_truck_id"
  end

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.decimal  "price"
    t.integer  "quantity"
    t.text     "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "food_truck_id"
    t.decimal  "total"
    t.string   "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "encrypted_password"
    t.string   "salt"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end

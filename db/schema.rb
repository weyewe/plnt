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

ActiveRecord::Schema.define(:version => 20110519163034) do

  create_table "availabilities", :force => true do |t|
    t.float    "value"
    t.integer  "company_id"
    t.integer  "category_id"
    t.integer  "month"
    t.integer  "year"
    t.integer  "day"
    t.boolean  "target"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "breakdown_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "breakdowns", :force => true do |t|
    t.integer  "hmkm"
    t.text     "progress_job"
    t.text     "rfu_estimation"
    t.integer  "percentage_fixed"
    t.date     "breakdown_date"
    t.date     "fixed_date"
    t.boolean  "is_fixed"
    t.integer  "company_id"
    t.integer  "category_id"
    t.integer  "breakdown_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classifications", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "engine_brands", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "engine_models", :force => true do |t|
    t.string   "name"
    t.integer  "engine_brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unit_models", :force => true do |t|
    t.string   "name"
    t.integer  "manufacturer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.integer  "role_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vehicle_units", :force => true do |t|
    t.string   "name"
    t.string   "local_number"
    t.string   "chasis_number"
    t.string   "engine_number"
    t.text     "remarks"
    t.date     "production_date"
    t.date     "purchase_date"
    t.integer  "unit_model_id"
    t.integer  "engine_model_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

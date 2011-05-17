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

ActiveRecord::Schema.define(:version => 20110517053808) do

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

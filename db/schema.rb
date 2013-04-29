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

ActiveRecord::Schema.define(:version => 20130118114322) do

  create_table "categories", :force => true do |t|
    t.string   "name",       :limit => 70, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "products", :force => true do |t|
    t.string   "code",        :limit => 15, :null => false
    t.text     "description",               :null => false
    t.float    "price",                     :null => false
    t.string   "image"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "category_id",               :null => false
  end

  add_index "products", ["category_id"], :name => "products_category_id_fk"
  add_index "products", ["code"], :name => "index_products_on_code", :unique => true

  create_table "sale_items", :force => true do |t|
    t.float    "product_price", :default => 0.0, :null => false
    t.integer  "quantity",      :default => 0,   :null => false
    t.integer  "sale_id",                        :null => false
    t.integer  "product_id",                     :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "sale_items", ["product_id"], :name => "sale_items_product_id_fk"
  add_index "sale_items", ["sale_id"], :name => "sale_items_sale_id_fk"

  create_table "sales", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.float    "total_price", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sales", ["user_id"], :name => "index_sales_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name",               :limit => 50, :default => "",    :null => false
    t.string   "email",              :limit => 50, :default => "",    :null => false
    t.string   "encrypted_password",               :default => "",    :null => false
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.boolean  "admin",                            :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  add_foreign_key "products", "categories", :name => "products_category_id_fk"

  add_foreign_key "sale_items", "products", :name => "sale_items_product_id_fk"
  add_foreign_key "sale_items", "sales", :name => "sale_items_sale_id_fk"

  add_foreign_key "sales", "users", :name => "sales_user_id_fk"

end

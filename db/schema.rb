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

ActiveRecord::Schema.define(:version => 20130515132849) do

  create_table "articles", :force => true do |t|
    t.string   "title",         :limit => 150, :default => "",    :null => false
    t.text     "body",                                            :null => false
    t.boolean  "home_headline",                :default => false, :null => false
    t.string   "image",                                           :null => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "articles", ["title"], :name => "index_articles_on_title", :unique => true

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
    t.string   "image",                     :null => false
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

  create_table "tagged_resources", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "tag_id",        :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name",       :limit => 50, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name",                   :limit => 50, :default => "",    :null => false
    t.string   "email",                  :limit => 50, :default => "",    :null => false
    t.string   "encrypted_password",                   :default => "",    :null => false
    t.boolean  "admin",                                :default => false, :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  add_foreign_key "products", "categories", :name => "products_category_id_fk"

  add_foreign_key "sale_items", "products", :name => "sale_items_product_id_fk"
  add_foreign_key "sale_items", "sales", :name => "sale_items_sale_id_fk"

  add_foreign_key "sales", "users", :name => "sales_user_id_fk"

end

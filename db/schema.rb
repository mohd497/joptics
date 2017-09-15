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

ActiveRecord::Schema.define(version: 20170913054405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree

  create_table "order_lines", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "qty"
    t.float    "unit_price"
    t.string   "total_price"
    t.string   "float"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "presciption_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "order_no"
    t.integer  "customer_id"
    t.float    "total"
    t.date     "order_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "status"
  end

  create_table "presciptions", force: :cascade do |t|
    t.float    "sphere"
    t.float    "cylinder"
    t.integer  "axis"
    t.float    "add"
    t.float    "pd"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "customer_id"
    t.string   "pre_token"
    t.float    "sphere_right"
    t.float    "cylinder_right"
    t.float    "axis_right"
    t.integer  "add_right"
    t.float    "pd_right"
    t.string   "pre_type"
    t.string   "lense_type"
    t.boolean  "protective_coating",        default: false
    t.boolean  "scratch_resistant_coating", default: false
    t.boolean  "anti_reflective_coating",   default: false
    t.integer  "product_id"
    t.integer  "order_id"
    t.float    "total_cost"
    t.integer  "qty"
    t.float    "cost"
  end

  create_table "products", force: :cascade do |t|
    t.string   "description"
    t.string   "name"
    t.float    "price"
    t.boolean  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "category"
    t.string   "subcategory"
    t.string   "avatar"
    t.boolean  "newarrivals"
    t.boolean  "bestselling"
    t.boolean  "popularbrand"
    t.string   "brand"
    t.string   "frames"
    t.string   "shapes"
    t.string   "material"
    t.string   "size"
    t.string   "color"
    t.string   "rx_type"
    t.string   "secavatar"
    t.string   "thirdavatar"
    t.string   "fourthavatar"
    t.string   "fifthavatar"
    t.string   "sixthavatar"
    t.string   "seventhavatar"
    t.string   "eighthavatar"
    t.string   "tenthavatar"
    t.string   "itemspec"
    t.string   "ninthavatar"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.integer  "customer_id"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["customer_id", "product_id"], name: "index_reviews_on_customer_id_and_product_id", unique: true, using: :btree

  create_table "shipping_addresses", force: :cascade do |t|
    t.string   "address"
    t.string   "phone_number"
    t.integer  "customer_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "country"
    t.string   "province"
    t.string   "city"
    t.string   "postal_code"
    t.string   "shipping_country"
    t.string   "shipping_address"
    t.string   "shipping_province"
    t.string   "shipping_city"
    t.string   "shipping_postal_code"
    t.integer  "order_id"
  end

end

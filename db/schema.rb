# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_24_054501) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.text "address"
    t.string "addressable_type"
    t.integer "addressable_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
    t.index ["user_id"], name: "index_addresses_on_user_id", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.date "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles_comments", force: :cascade do |t|
    t.string "comment"
    t.date "date_of_comment"
    t.integer "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_articles_comments_on_article_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.date "dob"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "book_id", null: false
    t.index ["author_id"], name: "index_authors_books_on_author_id"
    t.index ["book_id"], name: "index_authors_books_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "author_id", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.integer "like"
    t.string "commentable_type"
    t.integer "commentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
  end

  create_table "customers", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emp_addresses", force: :cascade do |t|
    t.string "house_name"
    t.string "street_name"
    t.string "road"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "my_employee_id", null: false
    t.index ["my_employee_id"], name: "index_emp_addresses_on_my_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "age"
    t.integer "no_of_order"
    t.boolean "full_time_available"
    t.decimal "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "event_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.date "dob"
    t.string "designation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.string "imageable_type"
    t.integer "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable"
  end

  create_table "mail_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_employees", force: :cascade do |t|
    t.string "employee_name"
    t.string "email"
    t.string "password"
    t.string "gender"
    t.string "hobbies"
    t.text "address"
    t.string "mobile_number"
    t.date "birth_date"
    t.string "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_orders", force: :cascade do |t|
    t.integer "quantity"
    t.integer "my_product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "total_price"
    t.index ["my_product_id"], name: "index_my_orders_on_my_product_id"
  end

  create_table "my_products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "my_user_id"
    t.index ["my_user_id"], name: "index_my_products_on_my_user_id"
  end

  create_table "my_users", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_my_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_my_users_on_reset_password_token", unique: true
  end

  create_table "myusers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.boolean "subscription"
    t.string "subscription_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "total_price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id", null: false
    t.integer "customer_id", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price"
    t.string "capacity"
    t.boolean "is_active"
    t.integer "status"
  end

  create_table "registers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_registers_on_event_id"
    t.index ["user_id"], name: "index_registers_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.string "department"
    t.boolean "terms_of_usage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "users"
  add_foreign_key "articles_comments", "articles"
  add_foreign_key "books", "authors"
  add_foreign_key "emp_addresses", "my_employees"
  add_foreign_key "events", "categories"
  add_foreign_key "events", "users"
  add_foreign_key "my_orders", "my_products"
  add_foreign_key "my_products", "my_users"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "products"
  add_foreign_key "registers", "events"
  add_foreign_key "registers", "users"
end

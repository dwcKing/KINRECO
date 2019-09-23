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


ActiveRecord::Schema.define(version: 2019_09_23_004736) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["email"], name: "index_admins_on_email"
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token"
  end

  create_table "arrivals", force: :cascade do |t|
    t.integer "arrivals_quantity"
    t.integer "item_id"
    t.date "arrivals_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_contents", force: :cascade do |t|
    t.integer "item_id"
    t.integer "end_user_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_user_id"], name: "index_cart_contents_on_end_user_id"
    t.index ["item_id"], name: "index_cart_contents_on_item_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "post_code"
    t.string "last_name"
    t.string "first_name"
    t.string "last_kana"
    t.string "first_kana"
    t.text "address"
    t.string "phone_number"
    t.integer "end_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_user_id"], name: "index_destinations_on_end_user_id"
  end

  create_table "discs", force: :cascade do |t|
    t.integer "disc"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_discs_on_item_id"
  end

  create_table "end_users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "last_name"
    t.string "first_name"
    t.string "last_kana"
    t.string "first_kana"
    t.string "post_code"
    t.text "address"
    t.string "phone_number"
    t.string "password"
    t.datetime "deleted_at"
    t.integer "quit_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_end_users_on_deleted_at"
    t.index ["email"], name: "index_end_users_on_email"
    t.index ["reset_password_token"], name: "index_end_users_on_reset_password_token"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.string "artist"
    t.integer "disc_type"
    t.integer "selling_status"
    t.text "comment"
    t.integer "label_id"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_items_on_genre_id"
    t.index ["label_id"], name: "index_items_on_label_id"
  end

  create_table "items_images", force: :cascade do |t|
    t.string "image_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items_orders", force: :cascade do |t|
    t.integer "tax_add_price"
    t.integer "price"
    t.integer "quantity"
    t.integer "item_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_items_orders_on_item_id"
    t.index ["order_id"], name: "index_items_orders_on_order_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "label_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "end_user_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "order_status"
    t.integer "delivery_charge"
    t.string "post_code"
    t.string "last_name"
    t.string "first_name"
    t.string "last_kana"
    t.string "first_kana"
    t.text "address"
    t.string "phone_number"
    t.integer "payment"
    t.integer "end_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_user_id"], name: "index_orders_on_end_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.float "rate"
    t.text "content"
    t.integer "item_id"
    t.integer "end_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_user_id"], name: "index_reviews_on_end_user_id"
    t.index ["item_id"], name: "index_reviews_on_item_id"
  end

  create_table "songs", force: :cascade do |t|
    t.integer "disc_id"
    t.string "song_title"
    t.integer "song_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disc_id"], name: "index_songs_on_disc_id"
  end

end

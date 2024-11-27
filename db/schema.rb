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

<<<<<<< HEAD
ActiveRecord::Schema[7.2].define(version: 2024_11_23_081258) do
  create_table "buyitems", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_buyitems_on_list_id"
    t.index ["product_id"], name: "index_buyitems_on_product_id"
  end

  create_table "buys", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "user_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_buys_on_product_id"
    t.index ["user_id"], name: "index_buys_on_user_id"
  end

  create_table "listitems", force: :cascade do |t|
    t.integer "list_id"
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_listitems_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

=======
ActiveRecord::Schema[7.2].define(version: 2024_11_20_064255) do
>>>>>>> watchhistory
  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.binary "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.integer "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

<<<<<<< HEAD
  add_foreign_key "buyitems", "lists"
  add_foreign_key "buyitems", "products"
  add_foreign_key "buys", "products"
  add_foreign_key "buys", "users"
  add_foreign_key "listitems", "products"
=======
  create_table "watch_histories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.datetime "watched_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_watch_histories_on_product_id"
    t.index ["user_id", "product_id"], name: "index_watch_histories_on_user_id_and_product_id"
    t.index ["user_id"], name: "index_watch_histories_on_user_id"
  end

  add_foreign_key "watch_histories", "products"
  add_foreign_key "watch_histories", "users"
>>>>>>> watchhistory
end

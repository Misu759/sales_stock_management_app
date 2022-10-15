# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_10_15_055028) do

  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false
    t.float "purchase_cost", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "stock", default: 0, null: false
    t.integer "threshold"
    t.integer "unit_amount", null: false
    t.integer "supplier_id", null: false
    t.index ["name"], name: "index_ingredients_on_name", unique: true
    t.index ["supplier_id"], name: "index_ingredients_on_supplier_id"
  end

  create_table "menu_ingredients", force: :cascade do |t|
    t.integer "menu_id", null: false
    t.integer "ingredient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "amount"
    t.index ["ingredient_id"], name: "index_menu_ingredients_on_ingredient_id"
    t.index ["menu_id", "ingredient_id"], name: "index_menu_ingredients_on_menu_id_and_ingredient_id", unique: true
    t.index ["menu_id"], name: "index_menu_ingredients_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name", null: false
    t.integer "regular_cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category", default: 0, null: false
    t.index ["name"], name: "index_menus_on_name", unique: true
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "amount", null: false
    t.date "purchase_date", null: false
    t.date "waste_date"
    t.integer "delivery_cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_purchases_on_ingredient_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "menu_id"
    t.date "date", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name", null: false
    t.integer "delivery_cost", default: 0, null: false
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "wastes", force: :cascade do |t|
    t.integer "ingredient_id", null: false
    t.integer "amount", null: false
    t.date "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_wastes_on_ingredient_id"
  end

  add_foreign_key "ingredients", "suppliers"
  add_foreign_key "menu_ingredients", "ingredients"
  add_foreign_key "menu_ingredients", "menus"
  add_foreign_key "wastes", "ingredients"
end

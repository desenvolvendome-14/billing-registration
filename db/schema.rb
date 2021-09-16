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

ActiveRecord::Schema.define(version: 2021_09_16_093410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "zip_code"
    t.string "state"
    t.string "city"
    t.string "district"
    t.string "street"
    t.string "house_number"
    t.bigint "client_id", null: false
    t.bigint "carrier_id", null: false
    t.bigint "seller_id", null: false
    t.bigint "supplier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["carrier_id"], name: "index_addresses_on_carrier_id"
    t.index ["client_id"], name: "index_addresses_on_client_id"
    t.index ["seller_id"], name: "index_addresses_on_seller_id"
    t.index ["supplier_id"], name: "index_addresses_on_supplier_id"
  end

  create_table "carriers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "foreigns", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "cell_phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "passport"
  end

  create_table "legal_people", force: :cascade do |t|
    t.string "corporate_name"
    t.string "fantasy_name"
    t.string "state_registration"
    t.string "municipal_registration"
    t.string "cell_phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cnpj"
  end

  create_table "physical_people", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "cell_phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cpf"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "addresses", "carriers"
  add_foreign_key "addresses", "clients"
  add_foreign_key "addresses", "sellers"
  add_foreign_key "addresses", "suppliers"
end

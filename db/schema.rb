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

ActiveRecord::Schema.define(version: 2021_10_28_093335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_wallets", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string "zip_code"
    t.string "state"
    t.string "city"
    t.string "district"
    t.string "street"
    t.string "house_number"
    t.bigint "bank_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id", null: false
    t.index ["bank_id"], name: "index_addresses_on_bank_id"
    t.index ["company_id"], name: "index_addresses_on_company_id"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string "description"
    t.string "city"
    t.string "agency"
    t.string "agency_digit"
    t.string "account"
    t.string "account_digit"
    t.string "assignor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "banks", force: :cascade do |t|
    t.integer "code"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "bank_account_id", null: false
    t.index ["bank_account_id"], name: "index_banks_on_bank_account_id"
  end

  create_table "charge_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "charts_accounts", force: :cascade do |t|
    t.string "description"
    t.string "internal_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "cnpj"
    t.string "state_registration"
    t.string "company_name"
    t.string "fantasy_name"
    t.string "business_phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "cellphone"
    t.string "email"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cost_centers", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "document_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.string "cpf_cnpj"
    t.string "fantasy_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "person_type"
    t.integer "client_type"
  end

  add_foreign_key "addresses", "banks"
  add_foreign_key "addresses", "companies"
  add_foreign_key "banks", "bank_accounts"
end

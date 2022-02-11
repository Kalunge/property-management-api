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

ActiveRecord::Schema.define(version: 2022_02_11_154257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.boolean "vacant"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "block_id", null: false
    t.integer "rent"
    t.bigint "tenant_id"
    t.index ["block_id"], name: "index_apartments_on_block_id"
    t.index ["tenant_id"], name: "index_apartments_on_tenant_id"
  end

  create_table "blocks", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_blocks_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "visit_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "block_id", null: false
    t.bigint "apartment_id", null: false
    t.index ["apartment_id"], name: "index_reservations_on_apartment_id"
    t.index ["block_id"], name: "index_reservations_on_block_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "deposit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "apartments", "blocks"
  add_foreign_key "apartments", "tenants"
  add_foreign_key "blocks", "users"
  add_foreign_key "reservations", "apartments"
  add_foreign_key "reservations", "blocks"
  add_foreign_key "reservations", "users"
end

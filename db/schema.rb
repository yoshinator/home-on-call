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

ActiveRecord::Schema.define(version: 2020_08_05_030815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "password_digest"
    t.boolean "super"
    t.boolean "client_access"
    t.boolean "edit_access"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "business_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "faq1"
    t.text "faa1"
    t.string "faq2"
    t.text "faa2"
    t.string "faq3"
    t.text "faa3"
    t.string "faq4"
    t.text "faa4"
  end

  create_table "clients", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "phone"
    t.string "company_name"
    t.boolean "active"
    t.bigint "market_id", null: false
    t.bigint "business_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_type_id"], name: "index_clients_on_business_type_id"
    t.index ["market_id"], name: "index_clients_on_market_id"
  end

  create_table "leads", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.string "f_name"
    t.string "l_name"
    t.string "phone"
    t.string "email"
    t.string "street1"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.boolean "business"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_leads_on_client_id"
  end

  create_table "markets", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "state"
  end

  create_table "pages", force: :cascade do |t|
    t.bigint "town_id", null: false
    t.bigint "service_id", null: false
    t.json "google_town_info"
    t.json "google_business_info"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_pages_on_service_id"
    t.index ["town_id"], name: "index_pages_on_town_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "slug"
    t.bigint "business_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "meta_description"
    t.text "main_content"
    t.text "main_meta"
    t.string "image_url"
    t.index ["business_type_id"], name: "index_services_on_business_type_id"
  end

  create_table "towns", force: :cascade do |t|
    t.string "name"
    t.string "county"
    t.string "state"
    t.string "slug"
    t.bigint "market_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["market_id"], name: "index_towns_on_market_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "clients", "business_types"
  add_foreign_key "clients", "markets"
  add_foreign_key "leads", "clients"
  add_foreign_key "pages", "services"
  add_foreign_key "pages", "towns"
  add_foreign_key "services", "business_types"
  add_foreign_key "towns", "markets"
end

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

ActiveRecord::Schema[7.0].define(version: 2024_01_23_172656) do
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

  create_table "active_storage_data", force: :cascade do |t|
    t.string "key", null: false
    t.binary "io", limit: 10485760, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_data_on_key"
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.integer "feed_id"
    t.string "title"
    t.text "message"
    t.string "guid"
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_id"], name: "index_articles_on_feed_id"
    t.index ["guid"], name: "index_articles_on_guid"
    t.index ["symbol"], name: "index_articles_on_symbol"
    t.index ["title"], name: "index_articles_on_title"
  end

  create_table "candles", force: :cascade do |t|
    t.string "ticker"
    t.string "size"
    t.datetime "candle_time"
    t.float "open"
    t.float "high"
    t.float "low"
    t.float "close"
    t.float "volume"
    t.float "wvap"
    t.float "avg_vol_50"
    t.float "avg_vol_100"
    t.float "avg_vol_300"
    t.float "rsi"
    t.float "macd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["size"], name: "index_candles_on_size"
    t.index ["ticker"], name: "index_candles_on_ticker"
  end

  create_table "companies", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "symbol"
    t.string "sector"
    t.string "insdustry"
    t.string "country"
    t.float "pnl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insdustry"], name: "index_companies_on_insdustry"
    t.index ["name"], name: "index_companies_on_name"
    t.index ["sector"], name: "index_companies_on_sector"
    t.index ["symbol"], name: "index_companies_on_symbol"
    t.index ["uid"], name: "index_companies_on_uid"
  end

  create_table "feeds", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_feeds_on_url"
  end

  create_table "filters", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.text "price_conditions"
    t.text "volume_conditions"
    t.text "fundamental_conditions"
    t.text "pattern_conditions"
    t.text "indicator_conditions"
    t.string "email_notification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_filters_on_name"
    t.index ["user_id"], name: "index_filters_on_user_id"
  end

  create_table "tickers", force: :cascade do |t|
    t.string "symbol"
    t.string "exchange"
    t.string "name"
    t.text "description"
    t.string "market"
    t.float "last_price"
    t.datetime "last_price_at"
    t.float "last_change_percent"
    t.float "ask_size"
    t.float "bid_size"
    t.float "ask_price"
    t.float "bid_price"
    t.string "sector"
    t.string "industry"
    t.float "market_cap"
    t.integer "employees"
    t.string "kind"
    t.date "next_report_date"
    t.text "ticker_info"
    t.text "info"
    t.text "news"
    t.text "eod_fundamentals"
    t.text "daily_candles"
    t.text "m1_candles"
    t.text "m5_candles"
    t.text "d1_candles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exchange"], name: "index_tickers_on_exchange"
    t.index ["industry"], name: "index_tickers_on_industry"
    t.index ["kind"], name: "index_tickers_on_kind"
    t.index ["last_price_at"], name: "index_tickers_on_last_price_at"
    t.index ["market"], name: "index_tickers_on_market"
    t.index ["name"], name: "index_tickers_on_name"
    t.index ["sector"], name: "index_tickers_on_sector"
    t.index ["symbol"], name: "index_tickers_on_symbol"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone_no"
    t.string "kind"
    t.string "role"
    t.string "uid"
    t.string "keepass"
    t.boolean "manager"
    t.boolean "employee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["employee"], name: "index_users_on_employee"
    t.index ["kind"], name: "index_users_on_kind"
    t.index ["phone_no"], name: "index_users_on_phone_no"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
    t.index ["uid"], name: "index_users_on_uid"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end

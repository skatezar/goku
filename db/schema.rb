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

ActiveRecord::Schema[7.0].define(version: 2023_08_29_100724) do
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

  create_table "blogs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "para1"
    t.string "para2"
    t.string "para3"
    t.string "para4"
    t.string "para5"
    t.string "desc"
  end

  create_table "coachingrequests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "description"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "ukfinancejob_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ukfinancejob_id"], name: "index_comments_on_ukfinancejob_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "ukfinancejob_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ukfinancejob_id"], name: "index_favorites_on_ukfinancejob_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "mailforms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "meetingcomments", force: :cascade do |t|
    t.bigint "meeting_id", null: false
    t.string "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_meetingcomments_on_meeting_id"
    t.index ["user_id"], name: "index_meetingcomments_on_user_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.string "virtual_or_inperson"
    t.string "link_to_url"
    t.string "description"
    t.string "company"
    t.string "industry"
    t.string "eligibility"
    t.datetime "deadline_date"
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "bio"
    t.string "linkedin"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "ukfinancejobs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "url"
    t.string "type_of_job"
    t.string "location"
    t.datetime "deadline_date"
    t.boolean "rolling_admission"
    t.string "description"
    t.datetime "application_opening_date"
    t.string "eligibility"
    t.string "industry"
    t.string "hr_email"
    t.string "app_process"
    t.string "company"
    t.boolean "guesstimate", default: false
    t.boolean "guesstimate_deadline", default: false
    t.boolean "diversity", default: false
    t.string "field_in_finance"
    t.tsvector "searchable"
    t.string "interviewdata"
    t.boolean "interviewdatabool", default: false
    t.string "interviewdatayear"
    t.boolean "approved_by_admin", default: false
    t.string "numberassessment"
    t.index ["searchable"], name: "index_ukfinancejobs_on_searchable", using: :gin
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "ukfinancejobs"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "ukfinancejobs"
  add_foreign_key "favorites", "users"
  add_foreign_key "meetingcomments", "meetings"
  add_foreign_key "meetingcomments", "users"
  add_foreign_key "profiles", "users"
end

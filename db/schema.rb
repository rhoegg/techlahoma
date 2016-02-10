# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160210044006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_entries", force: :cascade do |t|
    t.integer "blog_roll_id", null: false
    t.text    "title",        null: false
    t.text    "entry_uri",    null: false
    t.date    "posted_date",  null: false
  end

  add_index "blog_entries", ["entry_uri"], name: "unique_entry_uri", unique: true, using: :btree

  create_table "blog_rolls", force: :cascade do |t|
    t.text    "title",                      null: false
    t.text    "author",                     null: false
    t.text    "blog_uri",                   null: false
    t.text    "feed_uri",                   null: false
    t.text    "feed_type",                  null: false
    t.boolean "active_flag", default: true, null: false
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id",             null: false
    t.integer  "application_id",                null: false
    t.string   "token",             limit: 255, null: false
    t.integer  "expires_in",                    null: false
    t.text     "redirect_uri",                  null: false
    t.datetime "created_at",                    null: false
    t.datetime "revoked_at"
    t.string   "scopes",            limit: 255
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             limit: 255, null: false
    t.string   "refresh_token",     limit: 255
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",                    null: false
    t.string   "scopes",            limit: 255
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",         limit: 255,              null: false
    t.string   "uid",          limit: 255,              null: false
    t.string   "secret",       limit: 255,              null: false
    t.text     "redirect_uri",                          null: false
    t.string   "scopes",       limit: 255, default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "usergroups", force: :cascade do |t|
    t.string   "name",       limit: 75,  null: false
    t.string   "blurb",      limit: 140, null: false
    t.string   "logo_url",   limit: 255
    t.string   "location",   limit: 255
    t.string   "twitter",    limit: 255
    t.string   "email",      limit: 75,  null: false
    t.string   "website",    limit: 75,  null: false
    t.string   "facebook",   limit: 255
    t.string   "linkedin",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meetupdate", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_foreign_key "blog_entries", "blog_rolls", name: "blog_entries_blog_roll_id_fkey"
end

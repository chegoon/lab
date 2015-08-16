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

ActiveRecord::Schema.define(version: 20150816125833) do

  create_table "channel_statistics", force: true do |t|
    t.integer  "channel_id"
    t.integer  "video_count"
    t.integer  "view_count"
    t.integer  "comment_count"
    t.integer  "subscriber_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "channel_statistics", ["channel_id"], name: "index_channel_statistics_on_channel_id", using: :btree

  create_table "channels", force: true do |t|
    t.string   "ch_id"
    t.string   "title"
    t.text     "description"
    t.datetime "published_at"
    t.string   "thumbnail_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "view_count"
    t.integer  "video_count"
    t.integer  "dislike_count"
    t.integer  "subscriber_count"
    t.integer  "comment_count"
    t.boolean  "joined"
    t.string   "username"
  end

  create_table "joins", force: true do |t|
    t.integer  "team_id"
    t.integer  "channel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "playlist_items", force: true do |t|
    t.integer  "playlist_id"
    t.integer  "video_id"
    t.string   "it_id"
    t.string   "title"
    t.text     "description"
    t.datetime "published_at"
    t.string   "thumbnail_url"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "playlist_items", ["playlist_id"], name: "index_playlist_items_on_playlist_id", using: :btree
  add_index "playlist_items", ["video_id"], name: "index_playlist_items_on_video_id", using: :btree

  create_table "playlists", force: true do |t|
    t.integer  "pl_id"
    t.string   "title"
    t.text     "description"
    t.string   "thumbnail_url"
    t.datetime "published_at"
    t.text     "tags"
    t.integer  "channel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "playlists", ["channel_id"], name: "index_playlists_on_channel_id", using: :btree

  create_table "popularities", force: true do |t|
    t.integer  "region_id"
    t.integer  "channel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "popularities", ["channel_id"], name: "index_popularities_on_channel_id", using: :btree
  add_index "popularities", ["region_id"], name: "index_popularities_on_region_id", using: :btree

  create_table "region_statistics", force: true do |t|
    t.integer  "region_id"
    t.integer  "channel_count"
    t.integer  "view_count"
    t.integer  "video_count"
    t.integer  "subscriber_count"
    t.integer  "comment_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "channel_count"
    t.integer  "view_count"
    t.integer  "video_count"
    t.integer  "subscriber_count"
    t.integer  "comment_count"
  end

  create_table "team_statistics", force: true do |t|
    t.integer  "team_id"
    t.integer  "channel_count"
    t.integer  "view_count"
    t.integer  "video_count"
    t.integer  "subscriber_count"
    t.integer  "comment_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_statistics", ["team_id"], name: "index_team_statistics_on_team_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "channel_count"
    t.integer  "view_count"
    t.integer  "video_count"
    t.integer  "subscriber_count"
    t.integer  "comment_count"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  limit: 191, default: "", null: false
    t.string   "encrypted_password",     limit: 191, default: "", null: false
    t.string   "reset_password_token",   limit: 191
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 191
    t.string   "last_sign_in_ip",        limit: 191
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "video_content_details", force: true do |t|
    t.integer  "video_id"
    t.integer  "duration"
    t.boolean  "stereoscopic"
    t.boolean  "hd"
    t.boolean  "captioned"
    t.boolean  "licensed"
    t.boolean  "age_restricted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "video_content_details", ["video_id"], name: "index_video_content_details_on_video_id", using: :btree

  create_table "video_statistics", force: true do |t|
    t.integer  "video_id"
    t.integer  "view_count"
    t.integer  "like_count"
    t.integer  "dislike_count"
    t.integer  "favorite_count"
    t.integer  "comment_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "video_statistics", ["video_id"], name: "index_video_statistics_on_video_id", using: :btree

  create_table "videos", force: true do |t|
    t.string   "v_id"
    t.string   "title"
    t.text     "description"
    t.datetime "published_at"
    t.string   "thumbnail_url"
    t.integer  "channel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "view_count"
    t.integer  "like_count"
    t.integer  "dislike_count"
    t.integer  "favorite_count"
    t.integer  "comment_count"
  end

  add_index "videos", ["channel_id"], name: "index_videos_on_channel_id", using: :btree

end

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

ActiveRecord::Schema.define(version: 20150714055501) do

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
  end

  create_table "playlist_items", force: true do |t|
    t.integer  "playlist_id"
    t.integer  "video_id"
    t.string   "it_id"
    t.string   "title",         limit: 250
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
    t.string   "title",         limit: 250
    t.text     "description"
    t.string   "thumbnail_url"
    t.datetime "published_at"
    t.text     "tags",          limit: 16777215
    t.integer  "channel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "playlists", ["channel_id"], name: "index_playlists_on_channel_id", using: :btree

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
    t.string   "title",          limit: 250
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

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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120111195912) do

  create_table "discussions", :force => true do |t|
    t.text     "text",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", :force => true do |t|
    t.string   "url",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", :force => true do |t|
    t.string   "title",        :null => false
    t.integer  "content_id"
    t.string   "content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "submissions", ["content_id", "content_type"], :name => "index_submissions_on_content_id_and_content_type"
  add_index "submissions", ["user_id"], :name => "index_submissions_on_user_id"

  create_table "taggings", :id => false, :force => true do |t|
    t.integer  "tag_id",        :null => false
    t.integer  "submission_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["tag_id", "submission_id"], :name => "index_taggings_on_tag_id_and_submission_id"

  create_table "tags", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "tagging_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "username"
    t.string   "email"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",      :default => false
  end

  add_index "users", ["provider", "uid"], :name => "index_users_on_provider_and_uid"

end

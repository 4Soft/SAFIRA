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

ActiveRecord::Schema.define(:version => 20130802175637) do

  create_table "admins", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "candidates", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "curriculum_file_name"
    t.string   "curriculum_content_type"
    t.integer  "curriculum_file_size"
    t.datetime "curriculum_updated_at"
    t.string   "email"
    t.string   "course"
    t.integer  "selection_process_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "candidates_process_steps", :id => false, :force => true do |t|
    t.integer "candidate_id"
    t.integer "process_step_id"
  end

  add_index "candidates_process_steps", ["candidate_id", "process_step_id"], :name => "candidate_id_on_process"
  add_index "candidates_process_steps", ["process_step_id"], :name => "index_candidates_process_steps_on_process_step_id"

  create_table "employees", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "enterprises", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "feedbacks", :force => true do |t|
    t.text     "public"
    t.text     "private"
    t.integer  "candidate_id"
    t.integer  "process_step_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "feedbacks", ["candidate_id"], :name => "index_feedbacks_on_candidate_id"
  add_index "feedbacks", ["process_step_id"], :name => "index_feedbacks_on_process_step_id"

  create_table "phones", :force => true do |t|
    t.string   "number"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "process_steps", :force => true do |t|
    t.text     "description"
    t.string   "name"
    t.datetime "open_date"
    t.datetime "close_date"
    t.integer  "selection_process_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "selection_processes", :force => true do |t|
    t.text     "description"
    t.integer  "year"
    t.integer  "semester"
    t.string   "edict_file_name"
    t.string   "edict_content_type"
    t.integer  "edict_file_size"
    t.datetime "edict_updated_at"
    t.datetime "open_date"
    t.datetime "close_date"
    t.integer  "enterprise_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "social_networks", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

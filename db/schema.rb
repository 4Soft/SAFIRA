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

ActiveRecord::Schema.define(:version => 20130910180525) do

  create_table "admins", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "candidates", :force => true do |t|
    t.string   "email",                         :null => false
    t.string   "name"
    t.text     "description"
    t.string   "curriculum_file_name"
    t.string   "curriculum_content_type"
    t.integer  "curriculum_file_size"
    t.datetime "curriculum_updated_at"
    t.string   "course"
    t.string   "confirmation_register_token"
    t.datetime "register_confirmed_at"
    t.datetime "register_confirmation_sent_at"
    t.integer  "selection_process_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "candidates", ["confirmation_register_token"], :name => "index_candidates_on_confirmation_register_token", :unique => true
  add_index "candidates", ["email"], :name => "index_candidates_on_email"

  create_table "candidates_process_steps", :id => false, :force => true do |t|
    t.integer "candidate_id"
    t.integer "process_step_id"
  end

  add_index "candidates_process_steps", ["candidate_id", "process_step_id"], :name => "candidate_id_on_process"
  add_index "candidates_process_steps", ["process_step_id"], :name => "index_candidates_process_steps_on_process_step_id"

  create_table "custom_infos", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "custom_infoable_id"
    t.string   "custom_infoable_type"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "enterprises", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "entrepreneurs", :force => true do |t|
    t.string   "name"
    t.string   "personal_email"
    t.string   "professional_email"
    t.integer  "enterprise_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "feedbacks", :force => true do |t|
    t.text     "public"
    t.text     "private"
    t.boolean  "approved"
    t.boolean  "send_email"
    t.integer  "candidate_id"
    t.integer  "process_step_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "feedbacks", ["candidate_id"], :name => "index_feedbacks_on_candidate_id"
  add_index "feedbacks", ["process_step_id"], :name => "index_feedbacks_on_process_step_id"

  create_table "process_steps", :force => true do |t|
    t.text     "description"
    t.string   "name"
    t.date     "open_date"
    t.date     "consolidated_at"
    t.boolean  "consolidated"
    t.integer  "order_number"
    t.integer  "selection_process_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "selection_processes", :force => true do |t|
    t.text     "call"
    t.string   "name"
    t.string   "edict_file_name"
    t.string   "edict_content_type"
    t.integer  "edict_file_size"
    t.datetime "edict_updated_at"
    t.datetime "consolidated_at"
    t.boolean  "consolidated"
    t.integer  "enterprise_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.datetime "last_step_consolidated"
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
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "name"
    t.text     "about"
    t.text     "address"
    t.string   "cnpj"
    t.string   "corporate_name"
    t.string   "cpf"
    t.string   "type"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token", :unique => true
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

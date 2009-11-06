# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091031143046) do

  create_table "bodies", :force => true do |t|
    t.text "body"
  end

  create_table "categorys", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorys", ["parent_id"], :name => "index_categorys_on_parent_id"

  create_table "comments", :force => true do |t|
    t.integer  "parent_id"
    t.string   "parent_type"
    t.integer  "body_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["parent_id"], :name => "index_comments_on_parent_id"
  add_index "comments", ["parent_type"], :name => "index_comments_on_parent_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "over_at"
    t.integer  "body_id"
    t.integer  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["body_id"], :name => "index_projects_on_body_id"
  add_index "projects", ["state"], :name => "index_projects_on_state"
  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "relations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "to_id"
    t.integer  "rtype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relations", ["to_id"], :name => "index_relations_on_to_id"
  add_index "relations", ["user_id"], :name => "index_relations_on_user_id"

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "over_at"
    t.integer  "body_id"
    t.integer  "rank"
    t.integer  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["body_id"], :name => "index_tasks_on_body_id"
  add_index "tasks", ["project_id"], :name => "index_tasks_on_project_id"
  add_index "tasks", ["state"], :name => "index_tasks_on_state"
  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "body_id"
    t.integer  "category_id"
    t.integer  "shared_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["body_id"], :name => "index_topics_on_body_id"
  add_index "topics", ["category_id"], :name => "index_topics_on_category_id"
  add_index "topics", ["user_id"], :name => "index_topics_on_user_id"

  create_table "user_tasks", :force => true do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_tasks", ["task_id"], :name => "index_user_tasks_on_task_id"
  add_index "user_tasks", ["user_id"], :name => "index_user_tasks_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end

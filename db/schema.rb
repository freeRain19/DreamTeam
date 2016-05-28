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

ActiveRecord::Schema.define(version: 20160528105833) do

  create_table "comments", force: :cascade do |t|
    t.string   "message",    limit: 255
    t.integer  "post_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string  "content", limit: 255
    t.integer "task_id", limit: 4
  end

  add_index "posts", ["task_id"], name: "index_posts_on_task_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string "name",       limit: 255
    t.string "summary",    limit: 255
    t.date   "start_date"
    t.date   "end_date"
  end

  create_table "projects_teams", id: false, force: :cascade do |t|
    t.integer "team_id",    limit: 4, null: false
    t.integer "project_id", limit: 4, null: false
  end

  add_index "projects_teams", ["project_id", "team_id"], name: "index_projects_teams_on_project_id_and_team_id", using: :btree
  add_index "projects_teams", ["team_id", "project_id"], name: "index_projects_teams_on_team_id_and_project_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string  "title",      limit: 255
    t.string  "status",     limit: 255
    t.date    "start_date"
    t.date    "due_date"
    t.string  "estimation", limit: 255
    t.integer "project_id", limit: 4
    t.integer "user_id",    limit: 4
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string  "email",      limit: 255
    t.string  "password",   limit: 255
    t.string  "first_name", limit: 255
    t.string  "last_name",  limit: 255
    t.string  "role",       limit: 255
    t.integer "team_id",    limit: 4
  end

  add_index "users", ["team_id"], name: "index_users_on_team_id", using: :btree

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "posts", "tasks"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "users"
  add_foreign_key "users", "teams"
end

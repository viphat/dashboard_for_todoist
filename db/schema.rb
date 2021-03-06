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

ActiveRecord::Schema.define(version: 2019_06_06_024327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string "todoist_id", null: false
    t.string "name", null: false
    t.integer "color", null: false
    t.boolean "is_deleted", default: false, null: false
    t.integer "user_id", null: false
    t.string "todoist_parent_id"
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todoist_id"], name: "index_projects_on_todoist_id"
    t.index ["todoist_parent_id"], name: "index_projects_on_todoist_parent_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "todoist_id", null: false
    t.string "todoist_access_token", null: false
    t.string "email", null: false
    t.string "full_name", null: false
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sync_token"
    t.index ["email"], name: "index_users_on_email"
    t.index ["todoist_id"], name: "index_users_on_todoist_id"
  end

end

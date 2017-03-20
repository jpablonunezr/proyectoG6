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

ActiveRecord::Schema.define(version: 20170319202812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alternatives", force: :cascade do |t|
    t.text     "content"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_alternatives_on_question_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_material_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_material_id"], name: "index_comments_on_user_material_id", using: :btree
  end

  create_table "levels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "updated_by"
    t.integer  "public_level"
    t.integer  "subject_id"
    t.integer  "level_id"
    t.index ["level_id"], name: "index_materials_on_level_id", using: :btree
    t.index ["subject_id"], name: "index_materials_on_subject_id", using: :btree
  end

  create_table "networks", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "type"
    t.text     "content"
    t.integer  "material_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["material_id"], name: "index_questions_on_material_id", using: :btree
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_levels", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_user_levels_on_level_id", using: :btree
    t.index ["user_id"], name: "index_user_levels_on_user_id", using: :btree
  end

  create_table "user_materials", force: :cascade do |t|
    t.integer  "material_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "role"
    t.index ["material_id"], name: "index_user_materials_on_material_id", using: :btree
    t.index ["user_id"], name: "index_user_materials_on_user_id", using: :btree
  end

  create_table "user_networks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "network_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["network_id"], name: "index_user_networks_on_network_id", using: :btree
    t.index ["user_id"], name: "index_user_networks_on_user_id", using: :btree
  end

  create_table "user_subjects", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_user_subjects_on_subject_id", using: :btree
    t.index ["user_id"], name: "index_user_subjects_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "alternatives", "questions"
  add_foreign_key "comments", "user_materials"
  add_foreign_key "materials", "levels"
  add_foreign_key "materials", "subjects"
  add_foreign_key "questions", "materials"
  add_foreign_key "user_levels", "levels"
  add_foreign_key "user_levels", "users"
  add_foreign_key "user_materials", "materials"
  add_foreign_key "user_materials", "users"
  add_foreign_key "user_networks", "networks"
  add_foreign_key "user_networks", "users"
  add_foreign_key "user_subjects", "subjects"
  add_foreign_key "user_subjects", "users"
end

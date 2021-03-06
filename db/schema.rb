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

ActiveRecord::Schema.define(version: 20161022214733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string   "name"
    t.integer  "score"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "challenges_contests", id: false, force: :cascade do |t|
    t.integer "challenge_id", null: false
    t.integer "contest_id",   null: false
    t.index ["challenge_id", "contest_id"], name: "index_challenges_contests_on_challenge_id_and_contest_id", using: :btree
    t.index ["contest_id", "challenge_id"], name: "index_challenges_contests_on_contest_id_and_challenge_id", using: :btree
  end

  create_table "contests", force: :cascade do |t|
    t.string   "name"
    t.datetime "begins_at"
    t.datetime "ends_at"
    t.string   "status"
    t.text     "rules"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hints", force: :cascade do |t|
    t.string   "name"
    t.integer  "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["challenge_id"], name: "index_hints_on_challenge_id", using: :btree
  end

  create_table "solutions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "contest_id"
    t.integer  "challenge_id"
    t.string   "answer"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["challenge_id"], name: "index_solutions_on_challenge_id", using: :btree
    t.index ["contest_id"], name: "index_solutions_on_contest_id", using: :btree
    t.index ["user_id"], name: "index_solutions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.integer  "score"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "hints", "challenges"
  add_foreign_key "solutions", "challenges"
  add_foreign_key "solutions", "contests"
  add_foreign_key "solutions", "users"
end

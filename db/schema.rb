# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_07_10_001217) do
  create_table "lookup_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "type", null: false
    t.string "name", null: false
    t.text "description"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type", "name"], name: "index_lookup_items_on_type_and_name", unique: true
    t.index ["type"], name: "index_lookup_items_on_type"
  end

  create_table "mr_character_mushrooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "mr_character_id", null: false
    t.bigint "mushroom_id", null: false
    t.string "character_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mr_character_id"], name: "index_mr_character_mushrooms_on_mr_character_id"
    t.index ["mushroom_id"], name: "index_mr_character_mushrooms_on_mushroom_id"
  end

  create_table "mr_characters", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "display_option_id", null: false
    t.bigint "part_id", null: false
    t.bigint "source_data_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["display_option_id"], name: "index_mr_characters_on_display_option_id"
    t.index ["part_id"], name: "index_mr_characters_on_part_id"
    t.index ["source_data_id"], name: "index_mr_characters_on_source_data_id"
  end

  create_table "mushrooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.text "comment"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mushrooms_on_user_id"
  end

  create_table "source_data", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.string "author"
    t.string "ref"
    t.string "item_code"
    t.integer "source_data_type"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "display_name"
    t.string "otp_secret"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "mr_character_mushrooms", "mr_characters"
  add_foreign_key "mr_character_mushrooms", "mushrooms"
  add_foreign_key "mr_characters", "lookup_items", column: "display_option_id"
  add_foreign_key "mr_characters", "lookup_items", column: "part_id"
  add_foreign_key "mr_characters", "source_data", column: "source_data_id"
  add_foreign_key "mushrooms", "users"
end

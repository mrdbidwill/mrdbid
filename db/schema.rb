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

ActiveRecord::Schema[8.0].define(version: 2025_07_13_200016) do
  create_table "all_group_mushrooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "all_group_id", null: false
    t.bigint "mushroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["all_group_id"], name: "index_all_group_mushrooms_on_all_group_id"
    t.index ["mushroom_id"], name: "index_all_group_mushrooms_on_mushroom_id"
  end

  create_table "cameras", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "camera_make_id", null: false
    t.bigint "camera_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camera_make_id"], name: "index_cameras_on_camera_make_id"
    t.index ["camera_model_id"], name: "index_cameras_on_camera_model_id"
  end

  create_table "cluster_mushrooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "cluster_id", null: false
    t.bigint "mushroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cluster_id"], name: "index_cluster_mushrooms_on_cluster_id"
    t.index ["mushroom_id"], name: "index_cluster_mushrooms_on_mushroom_id"
  end

  create_table "colors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "latin_name"
    t.string "common_name"
    t.integer "color_group"
    t.string "hex"
    t.integer "sequence"
    t.integer "r_val"
    t.integer "g_val"
    t.integer "b_val"
    t.string "closest_websafe_color"
    t.json "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dna_sequences", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "mushroom_id", null: false
    t.text "notes"
    t.text "dna_barcode_its"
    t.string "genbank_number_url"
    t.string "genbank_accession_number"
    t.string "herbarium_catalog_number"
    t.string "mycomap_blast_results"
    t.string "provisional_species_name"
    t.string "sequencing_technology"
    t.string "trace_files_raw_dna_data"
    t.string "voucher_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mushroom_id"], name: "index_dna_sequences_on_mushroom_id"
  end

  create_table "image_mushroom_thumbnails", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "image_mushroom_id", null: false
    t.string "thumbnail_file_address"
    t.integer "image_width"
    t.integer "image_height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_mushroom_id"], name: "index_image_mushroom_thumbnails_on_image_mushroom_id"
  end

  create_table "image_mushrooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "mushroom_id", null: false
    t.bigint "part_id", null: false
    t.string "image_name"
    t.string "image_file_address"
    t.integer "image_width"
    t.integer "image_height"
    t.bigint "camera_make_id"
    t.bigint "camera_model_id"
    t.string "lens"
    t.string "exposure"
    t.string "aperture"
    t.string "iso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camera_make_id"], name: "index_image_mushrooms_on_camera_make_id"
    t.index ["camera_model_id"], name: "index_image_mushrooms_on_camera_model_id"
    t.index ["mushroom_id"], name: "index_image_mushrooms_on_mushroom_id"
    t.index ["part_id"], name: "index_image_mushrooms_on_part_id"
  end

  create_table "lens", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.text "description"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lookup_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "lookup_type_id", null: false
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lookup_type_id"], name: "index_lookup_items_on_lookup_type_id"
    t.index ["parent_id"], name: "index_lookup_items_on_parent_id"
  end

  create_table "lookup_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "name"
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
    t.string "name"
    t.text "description"
    t.text "comment"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mushrooms_on_user_id"
  end

  create_table "permissions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plant_associations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "mushroom_id", null: false
    t.bigint "plant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mushroom_id"], name: "index_plant_associations_on_mushroom_id"
    t.index ["plant_id"], name: "index_plant_associations_on_plant_id"
  end

  create_table "role_permissions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "permission_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "source_data", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "ref"
    t.string "item_code"
    t.bigint "source_data_type_id", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_data_type_id"], name: "index_source_data_on_source_data_type_id"
  end

  create_table "tree_associations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "mushroom_id", null: false
    t.bigint "tree_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mushroom_id"], name: "index_tree_associations_on_mushroom_id"
    t.index ["tree_id"], name: "index_tree_associations_on_tree_id"
  end

  create_table "user_roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "display_name", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "otp_secret"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["otp_required_for_login"], name: "index_users_on_otp_required_for_login"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "all_group_mushrooms", "lookup_items", column: "all_group_id"
  add_foreign_key "all_group_mushrooms", "mushrooms"
  add_foreign_key "cameras", "lookup_items", column: "camera_make_id"
  add_foreign_key "cameras", "lookup_items", column: "camera_model_id"
  add_foreign_key "cluster_mushrooms", "lookup_items", column: "cluster_id"
  add_foreign_key "cluster_mushrooms", "mushrooms"
  add_foreign_key "dna_sequences", "mushrooms"
  add_foreign_key "image_mushroom_thumbnails", "image_mushrooms"
  add_foreign_key "image_mushrooms", "lookup_items", column: "camera_make_id"
  add_foreign_key "image_mushrooms", "lookup_items", column: "camera_model_id"
  add_foreign_key "image_mushrooms", "lookup_items", column: "part_id"
  add_foreign_key "image_mushrooms", "mushrooms"
  add_foreign_key "lookup_items", "lookup_items", column: "parent_id"
  add_foreign_key "lookup_items", "lookup_types"
  add_foreign_key "mr_character_mushrooms", "mr_characters"
  add_foreign_key "mr_character_mushrooms", "mushrooms"
  add_foreign_key "mr_characters", "lookup_items", column: "display_option_id"
  add_foreign_key "mr_characters", "lookup_items", column: "part_id"
  add_foreign_key "mr_characters", "source_data", column: "source_data_id"
  add_foreign_key "mushrooms", "users"
  add_foreign_key "plant_associations", "lookup_items", column: "plant_id"
  add_foreign_key "plant_associations", "mushrooms"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "source_data", "lookup_items", column: "source_data_type_id"
  add_foreign_key "tree_associations", "lookup_items", column: "tree_id"
  add_foreign_key "tree_associations", "mushrooms"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end

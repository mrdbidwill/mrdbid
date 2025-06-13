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

ActiveRecord::Schema[8.0].define(version: 2025_06_12_235537) do
  create_table "abundances", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_abundances_on_entered_by_id"
    t.index ["source_id"], name: "index_abundances_on_source_id"
  end

  create_table "all_group_mushrooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "all_group_id", null: false
    t.bigint "mushroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["all_group_id"], name: "index_all_group_mushrooms_on_all_group_id"
    t.index ["mushroom_id"], name: "index_all_group_mushrooms_on_mushroom_id"
  end

  create_table "all_groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_all_groups_on_entered_by_id"
    t.index ["source_id"], name: "index_all_groups_on_source_id"
  end

  create_table "annulus_positions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_annulus_positions_on_entered_by_id"
    t.index ["source_id"], name: "index_annulus_positions_on_source_id"
  end

  create_table "articles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "entered_by_id", null: false
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_articles_on_entered_by_id"
  end

  create_table "bulb_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_bulb_types_on_entered_by_id"
    t.index ["source_id"], name: "index_bulb_types_on_source_id"
  end

  create_table "camera_makes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.index ["entered_by_id"], name: "index_camera_makes_on_entered_by_id"
    t.index ["source_id"], name: "index_camera_makes_on_source_id"
  end

  create_table "cameras", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "camera_model"
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "camera_make_id", null: false
    t.index ["camera_make_id"], name: "index_cameras_on_camera_make_id"
    t.index ["entered_by_id"], name: "index_cameras_on_entered_by_id"
  end

  create_table "cap_context_flesh_textures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_cap_context_flesh_textures_on_entered_by_id"
    t.index ["source_id"], name: "index_cap_context_flesh_textures_on_source_id"
  end

  create_table "cap_margin_shapes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_cap_margin_shapes_on_entered_by_id"
    t.index ["source_id"], name: "index_cap_margin_shapes_on_source_id"
  end

  create_table "cap_margin_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_cap_margin_types_on_entered_by_id"
    t.index ["source_id"], name: "index_cap_margin_types_on_source_id"
  end

  create_table "cap_shape_top_views", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_cap_shape_top_views_on_entered_by_id"
    t.index ["source_id"], name: "index_cap_shape_top_views_on_source_id"
  end

  create_table "cap_shapes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_cap_shapes_on_entered_by_id"
    t.index ["source_id"], name: "index_cap_shapes_on_source_id"
  end

  create_table "cap_surface_drynesses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_cap_surface_drynesses_on_entered_by_id"
    t.index ["source_id"], name: "index_cap_surface_drynesses_on_source_id"
  end

  create_table "cap_surface_textures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_cap_surface_textures_on_entered_by_id"
    t.index ["source_id"], name: "index_cap_surface_textures_on_source_id"
  end

  create_table "chem_reactions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_chem_reactions_on_entered_by_id"
    t.index ["source_id"], name: "index_chem_reactions_on_source_id"
  end

  create_table "cluster_mushrooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "cluster_id", null: false
    t.bigint "mushroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cluster_id"], name: "index_cluster_mushrooms_on_cluster_id"
    t.index ["mushroom_id"], name: "index_cluster_mushrooms_on_mushroom_id"
  end

  create_table "clusters", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_clusters_on_entered_by_id"
    t.index ["source_id"], name: "index_clusters_on_source_id"
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
    t.integer "cwc_r"
    t.integer "cwc_g"
    t.integer "cwc_b"
    t.string "image_file"
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_colors_on_entered_by_id"
  end

  create_table "countries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_countries_on_entered_by_id"
    t.index ["source_id"], name: "index_countries_on_source_id"
  end

  create_table "display_options", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_display_options_on_entered_by_id"
    t.index ["source_id"], name: "index_display_options_on_source_id"
  end

  create_table "dna_sequences", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "mushroom_id", null: false
    t.string "notes"
    t.text "dna_barcode_its"
    t.string "genbank_number_url"
    t.integer "genbank_accession_number"
    t.string "herbarium_catalog_number"
    t.string "mycomap_blast_results"
    t.string "provisional_species_name"
    t.integer "reads_in_consensus_ric"
    t.string "sequencing_technology"
    t.string "trace_files_raw_dna_data"
    t.string "voucher_number"
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_dna_sequences_on_entered_by_id"
    t.index ["mushroom_id"], name: "index_dna_sequences_on_mushroom_id"
  end

  create_table "epithets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_epithets_on_entered_by_id"
    t.index ["source_id"], name: "index_epithets_on_source_id"
  end

  create_table "fungus_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_fungus_types_on_entered_by_id"
    t.index ["source_id"], name: "index_fungus_types_on_source_id"
  end

  create_table "gill_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_gill_attachments_on_entered_by_id"
    t.index ["source_id"], name: "index_gill_attachments_on_source_id"
  end

  create_table "gill_breadths", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_gill_breadths_on_entered_by_id"
    t.index ["source_id"], name: "index_gill_breadths_on_source_id"
  end

  create_table "gill_context_flesh_latex_abundances", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_gill_context_flesh_latex_abundances_on_entered_by_id"
    t.index ["source_id"], name: "index_gill_context_flesh_latex_abundances_on_source_id"
  end

  create_table "gill_edges", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gill_spacings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_gill_spacings_on_entered_by_id"
    t.index ["source_id"], name: "index_gill_spacings_on_source_id"
  end

  create_table "gill_thicknesses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_gill_thicknesses_on_entered_by_id"
    t.index ["source_id"], name: "index_gill_thicknesses_on_source_id"
  end

  create_table "habits", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_habits_on_entered_by_id"
    t.index ["source_id"], name: "index_habits_on_source_id"
  end

  create_table "image_mushroom_thumbnails", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "image_mushroom_id", null: false
    t.string "thumbnail_file_address"
    t.integer "image_width"
    t.integer "image_height"
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_image_mushroom_thumbnails_on_entered_by_id"
    t.index ["image_mushroom_id"], name: "index_image_mushroom_thumbnails_on_image_mushroom_id"
  end

  create_table "image_mushrooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "mushroom_id", null: false
    t.bigint "parts_id", null: false
    t.text "description"
    t.string "image_name"
    t.string "file_address"
    t.integer "image_width"
    t.integer "image_height"
    t.bigint "camera_id", null: false
    t.string "camera_model"
    t.string "lens"
    t.string "exposure"
    t.string "aperture"
    t.string "iso"
    t.date "date_taken"
    t.string "focal_length"
    t.string "GPSLatitudeRef"
    t.string "GPSLatitude_0"
    t.string "GPSLatitude_1"
    t.string "GPSLatitude_2"
    t.string "GPSLongitudeRef"
    t.string "GPSLongitude_0"
    t.string "GPSLongitude_1"
    t.string "GPSLongitude_2"
    t.string "GPSAltitudeRef"
    t.string "GPSAltitude"
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camera_id"], name: "index_image_mushrooms_on_camera_id"
    t.index ["entered_by_id"], name: "index_image_mushrooms_on_entered_by_id"
    t.index ["mushroom_id"], name: "index_image_mushrooms_on_mushroom_id"
    t.index ["parts_id"], name: "index_image_mushrooms_on_parts_id"
  end

  create_table "lens", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "lens_make", null: false
    t.string "lens_model"
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_lens_on_entered_by_id"
  end

  create_table "mr_character_mushrooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "mr_character_id", null: false
    t.bigint "mushroom_id", null: false
    t.string "character_value"
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_mr_character_mushrooms_on_entered_by_id"
    t.index ["mr_character_id"], name: "index_mr_character_mushrooms_on_mr_character_id"
    t.index ["mushroom_id"], name: "index_mr_character_mushrooms_on_mushroom_id"
  end

  create_table "mr_characters", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "display_options_id", null: false
    t.boolean "lookup"
    t.bigint "parts_id", null: false
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["display_options_id"], name: "index_mr_characters_on_display_options_id"
    t.index ["entered_by_id"], name: "index_mr_characters_on_entered_by_id"
    t.index ["parts_id"], name: "index_mr_characters_on_parts_id"
    t.index ["source_id"], name: "index_mr_characters_on_source_id"
  end

  create_table "mushroom_locations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_mushroom_locations_on_entered_by_id"
    t.index ["source_id"], name: "index_mushroom_locations_on_source_id"
  end

  create_table "mushrooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "mushroom_name"
    t.string "common_name"
    t.text "description"
    t.text "comment"
    t.bigint "mushroom_location_id", null: false
    t.string "location_found_city"
    t.string "location_found_county"
    t.bigint "state_id", null: false
    t.bigint "country_id", null: false
    t.boolean "location_public"
    t.boolean "share_data"
    t.date "date_found"
    t.bigint "fungus_type_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_mushrooms_on_country_id"
    t.index ["entered_by_id"], name: "index_mushrooms_on_entered_by_id"
    t.index ["fungus_type_id"], name: "index_mushrooms_on_fungus_type_id"
    t.index ["mushroom_location_id"], name: "index_mushrooms_on_mushroom_location_id"
    t.index ["state_id"], name: "index_mushrooms_on_state_id"
  end

  create_table "mycelium_textures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_mycelium_textures_on_entered_by_id"
    t.index ["source_id"], name: "index_mycelium_textures_on_source_id"
  end

  create_table "odors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_odors_on_entered_by_id"
    t.index ["source_id"], name: "index_odors_on_source_id"
  end

  create_table "partial_inner_veil_annular_ring_positions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "idx_on_entered_by_id_1df14a8e17"
    t.index ["source_id"], name: "index_partial_inner_veil_annular_ring_positions_on_source_id"
  end

  create_table "partial_inner_veil_appearances", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_partial_inner_veil_appearances_on_entered_by_id"
    t.index ["source_id"], name: "index_partial_inner_veil_appearances_on_source_id"
  end

  create_table "partial_inner_veil_fates", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_partial_inner_veil_fates_on_entered_by_id"
    t.index ["source_id"], name: "index_partial_inner_veil_fates_on_source_id"
  end

  create_table "partial_inner_veil_textures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_partial_inner_veil_textures_on_entered_by_id"
    t.index ["source_id"], name: "index_partial_inner_veil_textures_on_source_id"
  end

  create_table "parts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_parts_on_entered_by_id"
    t.index ["source_id"], name: "index_parts_on_source_id"
  end

  create_table "plant_associations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_plant_associations_on_entered_by_id"
    t.index ["source_id"], name: "index_plant_associations_on_source_id"
  end

  create_table "plants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_plants_on_entered_by_id"
    t.index ["source_id"], name: "index_plants_on_source_id"
  end

  create_table "possible_matches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_possible_matches_on_entered_by_id"
    t.index ["source_id"], name: "index_possible_matches_on_source_id"
  end

  create_table "preservation_methods", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_preservation_methods_on_entered_by_id"
    t.index ["source_id"], name: "index_preservation_methods_on_source_id"
  end

  create_table "project_belongs_tos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_project_belongs_tos_on_entered_by_id"
    t.index ["source_id"], name: "index_project_belongs_tos_on_source_id"
  end

  create_table "rhizomorph_textures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_rhizomorph_textures_on_entered_by_id"
    t.index ["source_id"], name: "index_rhizomorph_textures_on_source_id"
  end

  create_table "soil_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_soil_types_on_entered_by_id"
    t.index ["source_id"], name: "index_soil_types_on_source_id"
  end

  create_table "source_data_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_source_data_types_on_entered_by_id"
    t.index ["source_id"], name: "index_source_data_types_on_source_id"
  end

  create_table "sources", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "ref"
    t.string "item_code"
    t.text "comment"
    t.integer "my_rating"
    t.text "my_comment"
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_sources_on_entered_by_id"
  end

  create_table "specimen_ages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_specimen_ages_on_entered_by_id"
    t.index ["source_id"], name: "index_specimen_ages_on_source_id"
  end

  create_table "states", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "country_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
    t.index ["entered_by_id"], name: "index_states_on_entered_by_id"
    t.index ["source_id"], name: "index_states_on_source_id"
  end

  create_table "stem_interiors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_stem_interiors_on_entered_by_id"
    t.index ["source_id"], name: "index_stem_interiors_on_source_id"
  end

  create_table "stem_locations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_stem_locations_on_entered_by_id"
    t.index ["source_id"], name: "index_stem_locations_on_source_id"
  end

  create_table "stem_shapes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_stem_shapes_on_entered_by_id"
    t.index ["source_id"], name: "index_stem_shapes_on_source_id"
  end

  create_table "stem_surfaces", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_stem_surfaces_on_entered_by_id"
    t.index ["source_id"], name: "index_stem_surfaces_on_source_id"
  end

  create_table "stem_textures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_stem_textures_on_entered_by_id"
    t.index ["source_id"], name: "index_stem_textures_on_source_id"
  end

  create_table "synonyms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_synonyms_on_entered_by_id"
    t.index ["source_id"], name: "index_synonyms_on_source_id"
  end

  create_table "tastes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_tastes_on_entered_by_id"
    t.index ["source_id"], name: "index_tastes_on_source_id"
  end

  create_table "toxics", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_toxics_on_entered_by_id"
    t.index ["source_id"], name: "index_toxics_on_source_id"
  end

  create_table "universal_outer_veil_appearances", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_universal_outer_veil_appearances_on_entered_by_id"
    t.index ["source_id"], name: "index_universal_outer_veil_appearances_on_source_id"
  end

  create_table "universal_outer_veil_fates", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_universal_outer_veil_fates_on_entered_by_id"
    t.index ["source_id"], name: "index_universal_outer_veil_fates_on_source_id"
  end

  create_table "universal_outer_veil_textures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_universal_outer_veil_textures_on_entered_by_id"
    t.index ["source_id"], name: "index_universal_outer_veil_textures_on_source_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "otp_secret"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "veils", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.bigint "source_id", null: false
    t.bigint "entered_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entered_by_id"], name: "index_veils_on_entered_by_id"
    t.index ["source_id"], name: "index_veils_on_source_id"
  end

  add_foreign_key "abundances", "sources"
  add_foreign_key "abundances", "users", column: "entered_by_id"
  add_foreign_key "all_group_mushrooms", "all_groups"
  add_foreign_key "all_group_mushrooms", "mushrooms"
  add_foreign_key "all_groups", "sources"
  add_foreign_key "all_groups", "users", column: "entered_by_id"
  add_foreign_key "annulus_positions", "sources"
  add_foreign_key "annulus_positions", "users", column: "entered_by_id"
  add_foreign_key "articles", "users", column: "entered_by_id"
  add_foreign_key "bulb_types", "sources"
  add_foreign_key "bulb_types", "users", column: "entered_by_id"
  add_foreign_key "camera_makes", "sources"
  add_foreign_key "camera_makes", "users", column: "entered_by_id"
  add_foreign_key "cameras", "camera_makes"
  add_foreign_key "cameras", "users", column: "entered_by_id"
  add_foreign_key "cap_context_flesh_textures", "sources"
  add_foreign_key "cap_context_flesh_textures", "users", column: "entered_by_id"
  add_foreign_key "cap_margin_shapes", "sources"
  add_foreign_key "cap_margin_shapes", "users", column: "entered_by_id"
  add_foreign_key "cap_margin_types", "sources"
  add_foreign_key "cap_margin_types", "users", column: "entered_by_id"
  add_foreign_key "cap_shape_top_views", "sources"
  add_foreign_key "cap_shape_top_views", "users", column: "entered_by_id"
  add_foreign_key "cap_shapes", "sources"
  add_foreign_key "cap_shapes", "users", column: "entered_by_id"
  add_foreign_key "cap_surface_drynesses", "sources"
  add_foreign_key "cap_surface_drynesses", "users", column: "entered_by_id"
  add_foreign_key "cap_surface_textures", "sources"
  add_foreign_key "cap_surface_textures", "users", column: "entered_by_id"
  add_foreign_key "chem_reactions", "sources"
  add_foreign_key "chem_reactions", "users", column: "entered_by_id"
  add_foreign_key "cluster_mushrooms", "clusters"
  add_foreign_key "cluster_mushrooms", "mushrooms"
  add_foreign_key "clusters", "sources"
  add_foreign_key "clusters", "users", column: "entered_by_id"
  add_foreign_key "colors", "users", column: "entered_by_id"
  add_foreign_key "countries", "sources"
  add_foreign_key "countries", "users", column: "entered_by_id"
  add_foreign_key "display_options", "sources"
  add_foreign_key "display_options", "users", column: "entered_by_id"
  add_foreign_key "dna_sequences", "mushrooms"
  add_foreign_key "dna_sequences", "users", column: "entered_by_id"
  add_foreign_key "epithets", "sources"
  add_foreign_key "epithets", "users", column: "entered_by_id"
  add_foreign_key "fungus_types", "sources"
  add_foreign_key "fungus_types", "users", column: "entered_by_id"
  add_foreign_key "gill_attachments", "sources"
  add_foreign_key "gill_attachments", "users", column: "entered_by_id"
  add_foreign_key "gill_breadths", "sources"
  add_foreign_key "gill_breadths", "users", column: "entered_by_id"
  add_foreign_key "gill_context_flesh_latex_abundances", "sources"
  add_foreign_key "gill_context_flesh_latex_abundances", "users", column: "entered_by_id"
  add_foreign_key "gill_spacings", "sources"
  add_foreign_key "gill_spacings", "users", column: "entered_by_id"
  add_foreign_key "gill_thicknesses", "sources"
  add_foreign_key "gill_thicknesses", "users", column: "entered_by_id"
  add_foreign_key "habits", "sources"
  add_foreign_key "habits", "users", column: "entered_by_id"
  add_foreign_key "image_mushroom_thumbnails", "image_mushrooms"
  add_foreign_key "image_mushroom_thumbnails", "users", column: "entered_by_id"
  add_foreign_key "image_mushrooms", "cameras"
  add_foreign_key "image_mushrooms", "mushrooms"
  add_foreign_key "image_mushrooms", "parts", column: "parts_id"
  add_foreign_key "image_mushrooms", "users", column: "entered_by_id"
  add_foreign_key "lens", "users", column: "entered_by_id"
  add_foreign_key "mr_character_mushrooms", "mr_characters"
  add_foreign_key "mr_character_mushrooms", "mushrooms"
  add_foreign_key "mr_character_mushrooms", "users", column: "entered_by_id"
  add_foreign_key "mr_characters", "display_options", column: "display_options_id"
  add_foreign_key "mr_characters", "parts", column: "parts_id"
  add_foreign_key "mr_characters", "sources"
  add_foreign_key "mr_characters", "users", column: "entered_by_id"
  add_foreign_key "mushroom_locations", "sources"
  add_foreign_key "mushroom_locations", "users", column: "entered_by_id"
  add_foreign_key "mushrooms", "countries"
  add_foreign_key "mushrooms", "fungus_types"
  add_foreign_key "mushrooms", "mushroom_locations"
  add_foreign_key "mushrooms", "states"
  add_foreign_key "mushrooms", "users", column: "entered_by_id"
  add_foreign_key "mycelium_textures", "sources"
  add_foreign_key "mycelium_textures", "users", column: "entered_by_id"
  add_foreign_key "odors", "sources"
  add_foreign_key "odors", "users", column: "entered_by_id"
  add_foreign_key "partial_inner_veil_annular_ring_positions", "sources"
  add_foreign_key "partial_inner_veil_annular_ring_positions", "users", column: "entered_by_id"
  add_foreign_key "partial_inner_veil_appearances", "sources"
  add_foreign_key "partial_inner_veil_appearances", "users", column: "entered_by_id"
  add_foreign_key "partial_inner_veil_fates", "sources"
  add_foreign_key "partial_inner_veil_fates", "users", column: "entered_by_id"
  add_foreign_key "partial_inner_veil_textures", "sources"
  add_foreign_key "partial_inner_veil_textures", "users", column: "entered_by_id"
  add_foreign_key "parts", "sources"
  add_foreign_key "parts", "users", column: "entered_by_id"
  add_foreign_key "plant_associations", "sources"
  add_foreign_key "plant_associations", "users", column: "entered_by_id"
  add_foreign_key "plants", "sources"
  add_foreign_key "plants", "users", column: "entered_by_id"
  add_foreign_key "possible_matches", "sources"
  add_foreign_key "possible_matches", "users", column: "entered_by_id"
  add_foreign_key "preservation_methods", "sources"
  add_foreign_key "preservation_methods", "users", column: "entered_by_id"
  add_foreign_key "project_belongs_tos", "sources"
  add_foreign_key "project_belongs_tos", "users", column: "entered_by_id"
  add_foreign_key "rhizomorph_textures", "sources"
  add_foreign_key "rhizomorph_textures", "users", column: "entered_by_id"
  add_foreign_key "soil_types", "sources"
  add_foreign_key "soil_types", "users", column: "entered_by_id"
  add_foreign_key "source_data_types", "sources"
  add_foreign_key "source_data_types", "users", column: "entered_by_id"
  add_foreign_key "sources", "users", column: "entered_by_id"
  add_foreign_key "specimen_ages", "sources"
  add_foreign_key "specimen_ages", "users", column: "entered_by_id"
  add_foreign_key "states", "countries"
  add_foreign_key "states", "sources"
  add_foreign_key "states", "users", column: "entered_by_id"
  add_foreign_key "stem_interiors", "sources"
  add_foreign_key "stem_interiors", "users", column: "entered_by_id"
  add_foreign_key "stem_locations", "sources"
  add_foreign_key "stem_locations", "users", column: "entered_by_id"
  add_foreign_key "stem_shapes", "sources"
  add_foreign_key "stem_shapes", "users", column: "entered_by_id"
  add_foreign_key "stem_surfaces", "sources"
  add_foreign_key "stem_surfaces", "users", column: "entered_by_id"
  add_foreign_key "stem_textures", "sources"
  add_foreign_key "stem_textures", "users", column: "entered_by_id"
  add_foreign_key "synonyms", "sources"
  add_foreign_key "synonyms", "users", column: "entered_by_id"
  add_foreign_key "tastes", "sources"
  add_foreign_key "tastes", "users", column: "entered_by_id"
  add_foreign_key "toxics", "sources"
  add_foreign_key "toxics", "users", column: "entered_by_id"
  add_foreign_key "universal_outer_veil_appearances", "sources"
  add_foreign_key "universal_outer_veil_appearances", "users", column: "entered_by_id"
  add_foreign_key "universal_outer_veil_fates", "sources"
  add_foreign_key "universal_outer_veil_fates", "users", column: "entered_by_id"
  add_foreign_key "universal_outer_veil_textures", "sources"
  add_foreign_key "universal_outer_veil_textures", "users", column: "entered_by_id"
  add_foreign_key "veils", "sources"
  add_foreign_key "veils", "users", column: "entered_by_id"
end

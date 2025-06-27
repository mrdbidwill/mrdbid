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

ActiveRecord::Schema[8.0].define(version: 2025_06_18_122685) do
  create_table "abundances", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "all_group_mushrooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "all_group"
    t.integer "mushroom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "all_groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "annulus_positions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "ref"
    t.string "item_code"
    t.text "comment"
    t.integer "my_rating"
    t.text "my_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bulb_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "camera_makes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "camera_models", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cameras", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "camera_makes"
    t.integer "camera_models"
    t.integer "lens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cap_context_flesh_textures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cap_margin_shapes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cap_margin_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cap_shape_top_views", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cap_shapes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cap_surface_drynesses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cap_surface_textures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chem_reactions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cluster_mushrooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "cluster"
    t.integer "mushroom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clusters", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "latin_name"
    t.string "common_name"
    t.integer "color_group"
    t.string "hex"
    t.integer "sequence_number"
    t.integer "r_val"
    t.integer "g_val"
    t.integer "b_val"
    t.string "closest_websafe_color"
    t.integer "cwc_r"
    t.integer "cwc_g"
    t.integer "cwc_b"
    t.string "image_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "display_options", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dna_sequences", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "mushroom"
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
  end

  create_table "epithets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fungus_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gill_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gill_breadths", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gill_context_flesh_latex_abundances", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gill_edges", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gill_spacings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gill_thicknesses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "habitats", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "habits", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "image_mushroom_thumbnails", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "image_mushroom"
    t.string "thumbnail_file_address"
    t.integer "image_width"
    t.integer "image_height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "image_mushrooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "mushroom"
    t.integer "part"
    t.string "image_name"
    t.string "image_file_address"
    t.integer "image_width"
    t.integer "image_height"
    t.integer "camera_make"
    t.string "camera_model"
    t.string "lens"
    t.string "exposure"
    t.string "aperture"
    t.string "iso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lens", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.text "description"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mb_lists", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "taxon_name"
    t.string "authors"
    t.string "rank_name"
    t.integer "year_of_effective_publication"
    t.string "name_status"
    t.bigint "mycobank_number"
    t.string "hyperlink"
    t.text "classification"
    t.string "current_name"
    t.text "synonymy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mr_character_mushrooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "mr_character"
    t.integer "mushroom"
    t.string "character_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mr_characters", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "display_option"
    t.integer "part"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mushroom_ages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mushroom_storage_locations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mushrooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "mushroom_name"
    t.text "description"
    t.integer "state"
    t.integer "country"
    t.integer "fungus_type"
    t.integer "mushroom_storage_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mycelium_textures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "odors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partial_inner_veil_annular_ring_positions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partial_inner_veil_appearances", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partial_inner_veil_fates", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partial_inner_veil_textures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
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

  create_table "plants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "possible_matches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preservation_methods", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_belongs_tos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rhizomorph_textures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "soil_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "source_data_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "ref"
    t.string "item_code"
    t.integer "source_data_type"
    t.text "comment"
    t.integer "my_rating"
    t.text "my_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stem_interiors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stem_locations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stem_shapes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stem_surfaces", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stem_textures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "synonyms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tastes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "toxics", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tree_associations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "mushroom_id", null: false
    t.bigint "tree_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mushroom_id"], name: "index_tree_associations_on_mushroom_id"
    t.index ["tree_id"], name: "index_tree_associations_on_tree_id"
  end

  create_table "trees", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universal_outer_veil_appearances", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universal_outer_veil_fates", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universal_outer_veil_textures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "otp_secret"
    t.datetime "tfa_enabled_at"
    t.integer "otp_attempts", default: 0
    t.datetime "last_otp_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["otp_secret"], name: "index_users_on_otp_secret", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "veils", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "comments"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "plant_associations", "mushrooms"
  add_foreign_key "plant_associations", "plants"
  add_foreign_key "tree_associations", "mushrooms"
  add_foreign_key "tree_associations", "trees"
end

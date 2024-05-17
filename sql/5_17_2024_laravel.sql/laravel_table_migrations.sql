
-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2024_05_01_000001_create_cache_table', 1),
(2, '2024_05_01_000002_create_users_table', 1),
(3, '2024_05_01_000003_create_jobs_table', 1),
(4, '2024_05_01_000004_add_two_factor_columns_to_users_table', 1),
(5, '2024_05_01_000005_create_personal_access_tokens_table', 1),
(6, '2024_05_12_000007_create_abundances_table', 1),
(7, '2024_05_12_000008_create_annulus_positions_table', 1),
(8, '2024_05_12_000009_create_bulb_types_table', 1),
(9, '2024_05_12_000010_create_cap_context_flesh_textures_table', 1),
(10, '2024_05_12_000011_create_cap_margin_shapes_table', 1),
(11, '2024_05_12_000012_create_cap_margin_types_table', 1),
(12, '2024_05_12_000013_create_cap_shapes_table', 1),
(13, '2024_05_12_000014_create_cap_shape_top_views_table', 1),
(14, '2024_05_12_000015_create_cap_surface_dryness_table', 1),
(15, '2024_05_12_000016_create_cap_surface_textures_table', 1),
(16, '2024_05_12_000017_create_chem_reactions_table', 1),
(17, '2024_05_12_000018_create_countries_table', 1),
(18, '2024_05_12_000019_create_data_source_data_types_table', 1),
(19, '2024_05_12_000020_create_display_options_table', 1),
(20, '2024_05_12_000021_create_epithets_table', 1),
(21, '2024_05_12_000022_create_fungus_types_table', 1),
(22, '2024_05_12_000023_create_genus_table', 1),
(23, '2024_05_12_000024_create_gill_attachments_table', 1),
(24, '2024_05_12_000025_create_gill_breadths_table', 1),
(25, '2024_05_12_000026_create_gill_context_flesh_latex_abundances_table', 1),
(26, '2024_05_12_000027_create_gill_edges_table', 1),
(27, '2024_05_12_000028_create_gill_other_table', 1),
(28, '2024_05_12_000029_create_gill_spacings_table', 1),
(29, '2024_05_12_000030_create_gill_thickness_table', 1),
(30, '2024_05_12_000031_create_habits_table', 1),
(31, '2024_05_12_000032_create_habitats_table', 1),
(32, '2024_05_12_000033_create_odors_table', 1),
(33, '2024_05_12_000034_create_partial_inner_veil_appearances_table', 1),
(34, '2024_05_12_000035_create_partial_inner_veil_fates_table', 1),
(35, '2024_05_12_000036_create_partial_inner_veil_textures_table', 1),
(36, '2024_05_12_000037_create_partial_inter_veil_annulus_ring_positions_table', 1),
(37, '2024_05_12_000038_create_parts_table', 1),
(38, '2024_05_12_000039_create_plant_associations_table', 1),
(39, '2024_05_12_000040_create_possible_matches_table', 1),
(40, '2024_05_12_000041_create_preservation_methods_table', 1),
(41, '2024_05_12_000042_create_soil_types_table', 1),
(42, '2024_05_12_000043_create_species_table', 1),
(43, '2024_05_12_000044_create_specimen_ages_table', 1),
(44, '2024_05_12_000045_create_specimen_locations_now_table', 1),
(45, '2024_05_12_000046_create_specimens_table', 1),
(46, '2024_05_12_000047_create_states_table', 1),
(47, '2024_05_12_000048_create_stem_interiors_table', 1),
(48, '2024_05_12_000049_create_stem_locations_table', 1),
(49, '2024_05_12_000050_create_stem_shapes_table', 1),
(50, '2024_05_12_000051_create_stem_surfaces_table', 1),
(51, '2024_05_12_000052_create_stem_textures_table', 1),
(52, '2024_05_12_000053_create_tastes_table', 1),
(53, '2024_05_12_000054_create_toxics_table', 1),
(54, '2024_05_12_000055_create_universal_outer_veil_appearances_table', 1),
(55, '2024_05_12_000056_create_universal_outer_veil_fates_table', 1),
(56, '2024_05_12_000057_create_universal_outer_veil_textures_table', 1),
(57, '2024_05_12_000058_create_characters_table', 1),
(58, '2024_05_12_000058_create_colors_table', 1),
(59, '2024_05_12_000058_create_data_sources_table', 1),
(60, '2024_05_12_000058_create_images_table', 1),
(61, '2024_05_12_000058_create_images_thumbnails_table', 1),
(62, '2024_05_12_000058_create_lens_table', 1),
(63, '2024_05_12_000058_create_member_list_clusters_table', 1),
(64, '2024_05_12_000058_create_member_list_groups_table', 1),
(65, '2024_05_12_000058_create_member_types_table', 1),
(66, '2024_05_12_000058_create_plants_table', 1),
(67, '2024_05_12_000058_create_specimen_characters_table', 1),
(68, '2024_05_12_000058_create_specimen_clusters_table', 1),
(69, '2024_05_12_000058_create_specimen_groups_table', 1),
(70, '2024_05_12_000058_create_synonyms_table', 1),
(71, '2024_05_12_000058_create_veils_table', 1);


-- --------------------------------------------------------

--
-- Table structure for table `specimen_characters`
--

CREATE TABLE `specimen_characters` (
  `id` bigint UNSIGNED NOT NULL,
  `specimen_id` int NOT NULL,
  `character_id` int NOT NULL,
  `character_value` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_options` int NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

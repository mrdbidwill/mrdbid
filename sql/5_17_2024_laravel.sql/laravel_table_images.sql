
-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint UNSIGNED NOT NULL,
  `specimen_id` int NOT NULL,
  `parts` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_remote` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_local` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_width` int NOT NULL,
  `image_height` int NOT NULL,
  `camera_make` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camera_model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lens` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exposure` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aperture` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_taken` datetime NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

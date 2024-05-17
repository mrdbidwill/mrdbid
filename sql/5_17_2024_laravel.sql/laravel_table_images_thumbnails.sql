
-- --------------------------------------------------------

--
-- Table structure for table `images_thumbnails`
--

CREATE TABLE `images_thumbnails` (
  `id` bigint UNSIGNED NOT NULL,
  `source_remote` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_width` int NOT NULL,
  `image_height` int NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

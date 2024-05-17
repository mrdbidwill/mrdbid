
-- --------------------------------------------------------

--
-- Table structure for table `soil_types`
--

CREATE TABLE `soil_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `source` int NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `soil_types`
--

INSERT INTO `soil_types` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-02-21 00:33:00', '2023-02-21 00:33:00'),
(2, 'Unknown', '', '', 23, 1, '2023-02-21 14:10:26', '2023-02-21 00:33:00'),
(3, 'Loam', '', '', 23, 1, '2023-02-21 14:10:26', '2023-02-21 00:33:00');

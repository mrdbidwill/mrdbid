
-- --------------------------------------------------------

--
-- Table structure for table `gill_spacings`
--

CREATE TABLE `gill_spacings` (
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
-- Dumping data for table `gill_spacings`
--

INSERT INTO `gill_spacings` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-02-21 00:33:00', '2023-02-21 00:33:00'),
(2, 'Crowded', 'The Gills are tightly close together.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Close', 'The Gills are close together.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Subdistant', 'The gills are spaced apart.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Distant', 'The gills are widely spaced apart.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

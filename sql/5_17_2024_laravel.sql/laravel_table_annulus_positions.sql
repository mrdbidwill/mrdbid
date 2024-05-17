
-- --------------------------------------------------------

--
-- Table structure for table `annulus_positions`
--

CREATE TABLE `annulus_positions` (
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
-- Dumping data for table `annulus_positions`
--

INSERT INTO `annulus_positions` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Superior', 'Near the cap', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Apical', 'upper half', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Median', 'in the middle', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Inferior', 'Lower half', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Basal', 'Near the base', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

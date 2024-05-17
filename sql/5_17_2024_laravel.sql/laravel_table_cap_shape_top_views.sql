
-- --------------------------------------------------------

--
-- Table structure for table `cap_shape_top_views`
--

CREATE TABLE `cap_shape_top_views` (
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
-- Dumping data for table `cap_shape_top_views`
--

INSERT INTO `cap_shape_top_views` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Petaloid', 'petal', '', 5, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Spathulate', 'spatula', '', 5, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Dimidiate', '1/2 circle', '', 5, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Flabelliform', 'fan-shaped', '', 5, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

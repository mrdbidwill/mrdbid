
-- --------------------------------------------------------

--
-- Table structure for table `cap_shapes`
--

CREATE TABLE `cap_shapes` (
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
-- Dumping data for table `cap_shapes`
--

INSERT INTO `cap_shapes` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-02-21 15:37:26', '2023-02-21 15:37:26'),
(2, 'Convex', 'evenly rounded', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Convex', 'evenly rounded', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'ovoid', 'egg', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'conic', 'cone', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'campanulate', 'bell-shaped.', 'vv', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'parabolic', 'half-egg', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'pulvinate', 'cushion', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'cylindric', 'bullet', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'plane', 'flat', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'conchate', 'sea-shell', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(12, 'umbonate', 'w/bump', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(13, 'cuspidate', 'Umbonate with a pointy conical apex; Witch-hat shaped. also known as eye-tooth.', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(14, 'papillate', 'w/nipple', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(15, 'depressed', 'Saucer-shaped; The center is lower than the cap margin.', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(16, 'umbilicate', 'a navel-like depression in the center.', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(17, 'infundibuliform', 'funnel-shaped', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

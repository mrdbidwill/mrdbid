
-- --------------------------------------------------------

--
-- Table structure for table `partial_inter_veil_annulus_ring_positions`
--

CREATE TABLE `partial_inter_veil_annulus_ring_positions` (
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
-- Dumping data for table `partial_inter_veil_annulus_ring_positions`
--

INSERT INTO `partial_inter_veil_annulus_ring_positions` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'None', 'Does not have annulus ring', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Superior', 'Near the cap', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Apical', 'upper half', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Median', 'in the middle', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Inferior', 'Lower half', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Basal', 'Near the base', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

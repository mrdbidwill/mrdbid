
-- --------------------------------------------------------

--
-- Table structure for table `partial_inner_veil_fates`
--

CREATE TABLE `partial_inner_veil_fates` (
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
-- Dumping data for table `partial_inner_veil_fates`
--

INSERT INTO `partial_inner_veil_fates` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Disappearing - Evanescent', 'can only be detected in button stage', '', 4, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Persistent', 'leaving remnants on cap', '', 4, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

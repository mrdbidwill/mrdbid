
-- --------------------------------------------------------

--
-- Table structure for table `chem_reactions`
--

CREATE TABLE `chem_reactions` (
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
-- Dumping data for table `chem_reactions`
--

INSERT INTO `chem_reactions` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Ammonia (NH4OH, Ammonium Hydroxide)', '', '', 8, 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'KOH (Potassium Hydroxide) - 3%', '', '', 8, 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

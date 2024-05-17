
-- --------------------------------------------------------

--
-- Table structure for table `abundances`
--

CREATE TABLE `abundances` (
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
-- Dumping data for table `abundances`
--

INSERT INTO `abundances` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'None', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Low', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Moderate', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'High', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

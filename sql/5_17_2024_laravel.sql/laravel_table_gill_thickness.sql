
-- --------------------------------------------------------

--
-- Table structure for table `gill_thickness`
--

CREATE TABLE `gill_thickness` (
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
-- Dumping data for table `gill_thickness`
--

INSERT INTO `gill_thickness` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Average', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Thick', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Tapering', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

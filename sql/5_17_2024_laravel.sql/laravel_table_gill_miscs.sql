
-- --------------------------------------------------------

--
-- Table structure for table `gill_miscs`
--

CREATE TABLE `gill_miscs` (
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
-- Dumping data for table `gill_miscs`
--

INSERT INTO `gill_miscs` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Veined (with ridges)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Intervenose (with \"veins\" between gills', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Equal', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Unequal (w/short gills)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Forking', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Anastomosing (joining crossways)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

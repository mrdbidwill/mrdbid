
-- --------------------------------------------------------

--
-- Table structure for table `bulb_types`
--

CREATE TABLE `bulb_types` (
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
-- Dumping data for table `bulb_types`
--

INSERT INTO `bulb_types` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Napiform (turnip)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Saccate', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Sheathing', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Collar', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Granular', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Concentric rings or scales', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Friable, disappearing', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Fusiform', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'Marginate-depressed', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'Cleft', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

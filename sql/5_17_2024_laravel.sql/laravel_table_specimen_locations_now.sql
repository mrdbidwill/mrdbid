
-- --------------------------------------------------------

--
-- Table structure for table `specimen_locations_now`
--

CREATE TABLE `specimen_locations_now` (
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
-- Dumping data for table `specimen_locations_now`
--

INSERT INTO `specimen_locations_now` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', 'Not Entered', 'None', 23, 1, '2023-02-21 00:33:00', '2023-04-18 21:29:02'),
(2, 'Observation Only - No specimen collected', '', 'None', 23, 1, '2023-04-18 21:26:54', '2023-04-18 21:29:02'),
(3, 'Speciment Collector', 'This is you, if you collected this specimen', '', 23, 1, '2023-04-18 21:28:33', '2023-04-18 21:29:02'),
(4, 'Herbarium', '', '', 23, 1, '2023-04-18 21:29:02', '2023-04-18 21:29:02');


-- --------------------------------------------------------

--
-- Table structure for table `preservation_methods`
--

CREATE TABLE `preservation_methods` (
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
-- Dumping data for table `preservation_methods`
--

INSERT INTO `preservation_methods` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-30 19:43:51', '2024-03-30 19:43:51'),
(2, 'None', '', '', 23, 1, '2024-03-15 11:26:21', '2024-03-30 19:43:51'),
(3, 'Unknown', '', '', 23, 1, '2024-03-15 11:28:22', '2024-03-30 19:43:51'),
(4, 'Dehumidifier', '', '', 23, 1, '2024-03-15 11:28:38', '2024-03-30 19:43:51'),
(5, 'silica gel', '', '', 23, 1, '2024-04-02 15:48:43', '2024-03-30 19:43:51');

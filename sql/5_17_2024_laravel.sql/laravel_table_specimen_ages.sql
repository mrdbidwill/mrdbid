
-- --------------------------------------------------------

--
-- Table structure for table `specimen_ages`
--

CREATE TABLE `specimen_ages` (
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
-- Dumping data for table `specimen_ages`
--

INSERT INTO `specimen_ages` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-03-20 20:01:06', '2023-03-20 20:01:06'),
(2, 'Button', 'very young', '', 23, 1, '2023-03-20 20:01:06', '2023-03-20 20:01:06'),
(3, 'Young', '', '', 23, 1, '2023-03-20 20:01:25', '2023-03-20 20:01:06'),
(4, 'Mature', '', '', 23, 1, '2023-03-20 20:01:41', '2023-03-20 20:01:06'),
(5, 'Past Prime', '', '', 23, 1, '2023-03-20 20:02:10', '2023-03-20 20:01:06');

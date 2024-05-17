
-- --------------------------------------------------------

--
-- Table structure for table `member_types`
--

CREATE TABLE `member_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_types`
--

INSERT INTO `member_types` (`id`, `name`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'admin', 1, '2022-03-31 20:16:40', '2022-03-31 20:16:40'),
(2, 'member', 1, '2022-03-31 20:19:59', '2022-03-31 20:16:40'),
(3, 'scholar', 1, '2022-03-31 20:20:18', '2022-03-31 20:16:40'),
(4, 'expert', 1, '2022-03-31 20:20:25', '2022-03-31 20:16:40'),
(5, 'student', 1, '2022-03-31 20:20:30', '2022-03-31 20:16:40'),
(6, 'researcher', 1, '2022-03-31 20:20:34', '2022-03-31 20:16:40');

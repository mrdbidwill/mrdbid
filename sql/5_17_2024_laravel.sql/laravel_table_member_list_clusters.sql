
-- --------------------------------------------------------

--
-- Table structure for table `member_list_clusters`
--

CREATE TABLE `member_list_clusters` (
  `id` bigint UNSIGNED NOT NULL,
  `specimen_id` int NOT NULL,
  `cluster_id` int NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_list_clusters`
--

INSERT INTO `member_list_clusters` (`id`, `specimen_id`, `cluster_id`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 5, 3, 1, '2023-08-25 00:33:33', '2023-08-25 00:33:33');

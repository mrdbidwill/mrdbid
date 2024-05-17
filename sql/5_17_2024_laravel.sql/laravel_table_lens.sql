
-- --------------------------------------------------------

--
-- Table structure for table `lens`
--

CREATE TABLE `lens` (
  `id` bigint UNSIGNED NOT NULL,
  `make` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lens`
--

INSERT INTO `lens` (`id`, `make`, `model`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', 1, '2024-03-30 19:52:23', '2024-03-30 19:52:23'),
(2, 'Nikon', 'Nikon ED AF Micro Nikkor 70-180mm 1:4.5-5.6 D', 2, '2023-03-20 16:34:51', '2024-03-30 19:52:23');

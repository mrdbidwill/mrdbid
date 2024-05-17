
-- --------------------------------------------------------

--
-- Table structure for table `universal_outer_veil_textures`
--

CREATE TABLE `universal_outer_veil_textures` (
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
-- Dumping data for table `universal_outer_veil_textures`
--

INSERT INTO `universal_outer_veil_textures` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Membranous (skin-like)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Cortinate (cobwebby)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Fibillose (thready)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Gelatinous (slimy)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');


-- --------------------------------------------------------

--
-- Table structure for table `cap_surface_dryness`
--

CREATE TABLE `cap_surface_dryness` (
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
-- Dumping data for table `cap_surface_dryness`
--

INSERT INTO `cap_surface_dryness` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'dry: Dull', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'dry:  Silky', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Moist:  lubricous/greasy', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Moist: Viscid/sticky/tacky', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Moist: Glutinous (slimy)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'dry: Shiny', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

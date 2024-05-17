
-- --------------------------------------------------------

--
-- Table structure for table `display_options`
--

CREATE TABLE `display_options` (
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
-- Dumping data for table `display_options`
--

INSERT INTO `display_options` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'text_box_number_mm', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'text_box_number_um', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'text_box_number', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'text_box_string', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'color', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'taste', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'odor', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'radio', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'drop-down', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'state', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(12, 'country', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(13, 'texture', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

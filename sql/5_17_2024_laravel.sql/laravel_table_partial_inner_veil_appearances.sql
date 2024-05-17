
-- --------------------------------------------------------

--
-- Table structure for table `partial_inner_veil_appearances`
--

CREATE TABLE `partial_inner_veil_appearances` (
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
-- Dumping data for table `partial_inner_veil_appearances`
--

INSERT INTO `partial_inner_veil_appearances` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Two Rings (from 2 veils)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Doubly-flared Ring', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, '\"Cogwheel\" Stellate', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Floccose (downy tuffs)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Cortinate PV & Fibrillose Annular Zone', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Single Ring thick on edge', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Pendant (hanging)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Subperonate', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'Peronate (w/\"boot\")', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

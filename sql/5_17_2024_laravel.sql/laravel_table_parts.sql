
-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
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
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(2, 'Basic', 'default data that every specimen will have', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(3, 'Cap - Pileus', '', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(4, 'Gills - Lamellae', '', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(5, 'Stem - Stipe', '', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(6, 'Veil', '', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(7, 'Mycelium', '', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(8, 'Spores', 'micro for spores is here - not in micro', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(9, 'Micro', '', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(10, 'DNA', '', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(11, 'Habitat', 'Habitat, Plant Assoc ', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(12, 'Rhizomorph', '', '', 5, 1, '2023-05-14 00:36:00', '2023-05-24 00:33:26'),
(13, 'Chemical Reaction', '', '', 23, 1, '2023-05-14 10:51:00', '2023-05-24 00:33:26'),
(14, 'Color', 'this will allow color selection for ALL color characters to be in one place', '', 23, 1, '2023-05-18 19:14:52', '2023-05-24 00:33:26'),
(15, 'Location', 'lat lon city county state country', '', 23, 1, '2024-03-12 00:26:57', '2023-05-24 00:33:26'),
(16, 'Identification', 'species genus inaturalist etc', '', 23, 1, '2024-03-12 00:29:40', '2023-05-24 00:33:26'),
(17, 'Storage', '', '', 23, 1, '2024-03-16 10:56:22', '2023-05-24 00:33:26');

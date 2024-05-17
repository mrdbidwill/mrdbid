
-- --------------------------------------------------------

--
-- Table structure for table `habitats`
--

CREATE TABLE `habitats` (
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
-- Dumping data for table `habitats`
--

INSERT INTO `habitats` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-02-21 00:33:00', '2023-02-21 00:33:00'),
(2, 'Terrestrial (on soil - bare )', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(3, 'Terrestrial (on soil - burned )', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(4, 'Terrestrial (on soil - disturbed )', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(5, 'Lignicolous (on wood) - what kind of tree?', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(6, 'Humicolous (on humus, duff) - conifer, other?', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(7, 'Coprophious (on dung) what kind?', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(8, 'In grassy area - lawn, pasture, etc?', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(9, 'In forest - conifer, hardwood, mixed?', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(16, 'fungicolous', 'mushroom mycelia grow in other mushrooms', 'p 7, How to Identify Mushrooms to Genus I: Macroscopic Features - David L. Largent', 13, 2, '2023-03-16 16:46:17', '2023-02-21 00:33:00');

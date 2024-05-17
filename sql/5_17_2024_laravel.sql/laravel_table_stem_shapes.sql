
-- --------------------------------------------------------

--
-- Table structure for table `stem_shapes`
--

CREATE TABLE `stem_shapes` (
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
-- Dumping data for table `stem_shapes`
--

INSERT INTO `stem_shapes` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Terete (round)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Compressed (flattened)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Equal', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Clavate (club)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Radicating (w/\"root\")', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Flexous', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Ventricose Fusiform', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Tapering', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'Abruptly bulbous', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'Rounded', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(12, 'Oblique (angle)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(13, 'Marginate', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

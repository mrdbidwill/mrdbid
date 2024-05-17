
-- --------------------------------------------------------

--
-- Table structure for table `stem_textures`
--

CREATE TABLE `stem_textures` (
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
-- Dumping data for table `stem_textures`
--

INSERT INTO `stem_textures` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Fragile', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Pliable', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Chalky', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Rigid', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Fibrous (Fleshy-Fibrous)', 'usually rather thick, and when broken in two, leaves a ragged edge.', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Cartilaginous', 'Common stipe, usually thin and breaks with a firm split when bent in two, similar to cartilage.', '', 13, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Firm', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Woody', '', '', 13, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'Corky', '', '', 13, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'Leathery (coriaceous)', '', '', 13, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(12, 'Chalky', 'feels and breaks like chalk in hand. When crushed, it breaks up into powder or chunks.', '', 13, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(13, 'Breaking with a snap', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

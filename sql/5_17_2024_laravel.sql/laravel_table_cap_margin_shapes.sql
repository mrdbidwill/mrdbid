
-- --------------------------------------------------------

--
-- Table structure for table `cap_margin_shapes`
--

CREATE TABLE `cap_margin_shapes` (
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
-- Dumping data for table `cap_margin_shapes`
--

INSERT INTO `cap_margin_shapes` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-02-21 15:37:26', '2024-03-01 21:00:00'),
(2, 'Straight', 'The margins remain uniform and do not curve.', 'edited 3-8-2023', 7, 2, '2023-03-08 13:02:40', '2024-03-01 21:00:00'),
(3, 'Decurved', 'The margins curve slightly downwards.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Incurved', 'The margins curve down and inwards.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Involute', 'The margins curve downwards and roll inwards. Also known as inrolled.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Arched', 'The margins curve upwards between the edge and stipe (stem).', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Uplifted', 'The margins curve upwards. Also known as elevated.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Revolute', 'The margins curve inwards and also rolled back..', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Exceeding', 'The margins extend past the gills.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

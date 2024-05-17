
-- --------------------------------------------------------

--
-- Table structure for table `veils`
--

CREATE TABLE `veils` (
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
-- Dumping data for table `veils`
--

INSERT INTO `veils` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-02-21 00:33:00', '2023-02-21 00:33:00'),
(2, 'Flaring', 'The annulus is flaring upwards.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Pendant', 'The veil is hanging downward from the stipe.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Double Rings', 'Two visible veils..', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Ring Zone', 'The stipe is marked with the reminance of the ananulus', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Cortinate', 'The partial veil is cobweb-like or tread-like (Fibrillose)..', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Stellate', 'The partial veil resembles a cogwheel.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Floccose', 'The partial veil is fluffy and down-like.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Peronate', 'The stipe resembles a shealth-like boot or stocking', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

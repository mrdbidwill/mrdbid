
-- --------------------------------------------------------

--
-- Table structure for table `odors`
--

CREATE TABLE `odors` (
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
-- Dumping data for table `odors`
--

INSERT INTO `odors` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-02-21 00:33:00', '2023-02-21 00:33:00'),
(2, 'None', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(3, 'Fruity', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(4, 'Lemony', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(5, 'Anise (licorice)', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(6, 'Farinaceous (like fresh meal)', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(7, 'Pungent', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(8, 'Nauseous', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(9, 'Nitrous', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(10, 'Earthy', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(11, 'Spermatic', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(12, 'Garlic', '', '', 4, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(13, 'Marasschino cherries', '', '', 4, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(14, 'Sewer gas', '', '', 4, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(15, 'spicy - red hots - dirty socks', '', '', 4, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00');

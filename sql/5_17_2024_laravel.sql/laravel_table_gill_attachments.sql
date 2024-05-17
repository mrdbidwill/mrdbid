
-- --------------------------------------------------------

--
-- Table structure for table `gill_attachments`
--

CREATE TABLE `gill_attachments` (
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
-- Dumping data for table `gill_attachments`
--

INSERT INTO `gill_attachments` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Free - remote', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Free - close', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Adnate - horizontal', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Adnate - ascending', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Adnexed (almost free)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Sinuate', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Emarginate (notched)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Decurrent - long', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'Decurrent - short', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'Seceding (breaking away)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(12, 'Uncinate (w/decurrent tooth)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(13, 'Collared', 'Gills are attached to a collar or ring that encircles the stipe.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

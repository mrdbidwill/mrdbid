
-- --------------------------------------------------------

--
-- Table structure for table `habits`
--

CREATE TABLE `habits` (
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
-- Dumping data for table `habits`
--

INSERT INTO `habits` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-02-21 00:33:00', '2023-02-21 00:33:00'),
(2, 'Single, solitary', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(3, 'Scattered (1-2 feet apart)', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(4, 'Gregarious (growing in a group)', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(5, 'Caespitose (clustered, not joined)', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(6, 'Connate (fused at base)', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(7, 'Imbricate (overlapping)', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(8, 'In troops or rings', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00');

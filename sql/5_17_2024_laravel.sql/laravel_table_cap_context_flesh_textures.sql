
-- --------------------------------------------------------

--
-- Table structure for table `cap_context_flesh_textures`
--

CREATE TABLE `cap_context_flesh_textures` (
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
-- Dumping data for table `cap_context_flesh_textures`
--

INSERT INTO `cap_context_flesh_textures` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Soft', '', '', 5, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Spongy', '', '', 5, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Firm', '', '', 5, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Compact', '', '', 5, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Rigid', '', '', 5, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Brittle', '', '', 5, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Corky', '', '', 5, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Other', '', '', 5, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

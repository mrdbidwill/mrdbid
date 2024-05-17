
-- --------------------------------------------------------

--
-- Table structure for table `specimen_groups`
--

CREATE TABLE `specimen_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `member_id` int NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specimen_groups`
--

INSERT INTO `specimen_groups` (`id`, `member_id`, `name`, `description`, `comments`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'January', '', '', 1, '2023-04-18 19:31:36', '2023-04-18 19:31:36'),
(2, 1, 'February', '', '', 1, '2023-04-18 19:42:21', '2023-04-18 19:31:36'),
(3, 1, 'March', '', '', 1, '2023-04-18 19:44:49', '2023-04-18 19:31:36'),
(4, 1, 'April', '', '', 1, '2023-04-18 20:07:45', '2023-04-18 19:31:36'),
(5, 1, 'May', '', '', 1, '2023-04-18 20:21:02', '2023-04-18 19:31:36'),
(6, 1, 'June', '', '', 1, '2023-04-18 20:27:19', '2023-04-18 19:31:36'),
(7, 1, 'July', '', '', 1, '2023-04-18 20:28:20', '2023-04-18 19:31:36'),
(8, 1, 'August', '', '', 1, '2023-04-18 20:28:42', '2023-04-18 19:31:36'),
(9, 1, 'September', '', '', 1, '2023-04-18 20:29:12', '2023-04-18 19:31:36'),
(10, 1, 'October', '', '', 1, '2023-04-18 20:29:54', '2023-04-18 19:31:36'),
(11, 1, 'November', '', '', 1, '2023-04-18 20:30:17', '2023-04-18 19:31:36'),
(12, 1, 'December', '', '', 1, '2023-04-18 21:08:46', '2023-04-18 19:31:36'),
(13, 1, 'Blakeley', '', '', 1, '2024-01-18 21:30:19', '2023-04-18 19:31:36'),
(14, 1, 'Daphne', '', '', 1, '2024-01-25 21:55:13', '2023-04-18 19:31:36'),
(15, 1, 'Disc Golf Park', '', '', 1, '2024-01-25 21:57:32', '2023-04-18 19:31:36'),
(16, 1, 'Elberta', '', '', 1, '2024-01-25 21:57:59', '2023-04-18 19:31:36'),
(17, 1, 'Fairhope', '', '', 1, '2024-01-25 21:58:22', '2023-04-18 19:31:36'),
(18, 1, 'Foley', '', '', 1, '2024-01-25 21:58:43', '2023-04-18 19:31:36'),
(19, 1, 'Fort Pickens', '', '', 1, '2024-01-25 21:59:08', '2023-04-18 19:31:36'),
(20, 1, 'Pine Beach Trail', '', '', 1, '2024-01-25 22:00:52', '2023-04-18 19:31:36'),
(21, 1, 'Weeks Bay', '', '', 1, '2024-01-25 22:01:15', '2023-04-18 19:31:36'),
(22, 1, 'Yard - Back\r\n', '', '', 1, '2024-01-25 22:01:46', '2023-04-18 19:31:36'),
(23, 1, 'Yard - Front', '', '', 1, '2024-01-25 22:02:05', '2023-04-18 19:31:36'),
(24, 1, 'Ostrich Wing', 'The wing of an ostrich.', 'Wing belonging to ostrich.', 1, '2024-03-23 15:29:57', '2023-04-18 19:31:36');

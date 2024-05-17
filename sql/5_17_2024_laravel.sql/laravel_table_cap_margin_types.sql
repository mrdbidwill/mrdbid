
-- --------------------------------------------------------

--
-- Table structure for table `cap_margin_types`
--

CREATE TABLE `cap_margin_types` (
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
-- Dumping data for table `cap_margin_types`
--

INSERT INTO `cap_margin_types` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-02-21 15:37:26', '2023-02-21 15:37:26'),
(2, 'Entire', 'There is a smooth transition from the top of the cap to its underside. No irregular attributes should be present on the edges. Also referred to as Smooth, Even, Seamless, Flush, or Regular.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Appendiculate', 'Remnants of a partial veil hang from the edge of the cap.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Striate', 'Fine and narrow stripes run parallel on the cap margins. The lines will often coincide with the gills underneath the cap. In some cases, the lines are only visible when the cap is wet. Also referred to as striped, furrowed, streaked, ribbed, lined,', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Sulcate', 'Narrow parallel grooves that line the margins of the cap. Sulcate margins are more defined than striate but less ridged than plicated. Also referred to as plicate-striate.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Plicate', 'Parallel pleated margins. They are best described as fan-like or umbrella-like as if the surface of the cap were folded. Plicate margins are more defined and ridged than Striate or Sulcate. Also referred to as pleated or ridged.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Eroded', 'Deteriorated, gnawed, or eaten away. The disfigured margins are usually found in older specimens and are the result of insects or deliquescence (common with Ink Caps). Also referred to as gnawed or ragged.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Split', 'The edges of the cap are split apart or full of large crevices. Also referred to as cracked or rimose.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Lacerate', 'Many tears mark the edge of the cap. Similar to split margins, however, the cuts are smaller and more frequent. Also referred to as torn.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'Undulating - Hairy', 'Hairy - The edges of the cap form a wave-like pattern as they rise and fall. Also referred to as wavy irregular or festoony.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'Crenate - Hairy', 'Hairy - Semi-circle notches or round-toothed edges that are more blunted than serrate margins. Also referred to as scalloped.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(12, 'Serrate - Hairy', 'Hairy - The edges of the cap appear jagged and saw-toothed. More pronounced than crenate margins.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

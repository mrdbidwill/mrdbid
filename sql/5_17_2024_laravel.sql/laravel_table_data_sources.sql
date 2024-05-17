
-- --------------------------------------------------------

--
-- Table structure for table `data_sources`
--

CREATE TABLE `data_sources` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_sources`
--

INSERT INTO `data_sources` (`id`, `title`, `author`, `type`, `comment`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Introductory Mycology', 'C. J. Alexopoulos, C. W. Mims,  M. Blackwell', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Ainsworth & Bisbys Dictionary of the Fungi 10th Edition', 'P. M. Kirk, P. F. Cannon, D. W. Minter and J. A. Stalpers', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Illustrated Dictionary of Mycology Second Edition', 'Miguel Ulloa and Richard T. Hanlin', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Mushrooms Demystified Second Edition', 'David Arora', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Easy Guide to Mushrooms Descriptions', 'Kit Scates', '5', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Easy Key to Common Gilled Mushrooms', 'Kit Scates', '5', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'https://mycologyst.art/mushroom-identification/mushroom-morphology', 'Unknown', '3', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'www.mushroomexpert.com/index.html', 'Michael Kuo', '3', 'Kuo, Michael (2022). Mushroomexpert.com homepage. Retrieved April 5, 2022 from the Mushroomexpert.Com website: www.mushroomexpert.com/index.html', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Fungal Families of the World', 'P. F. Cannon and P. M. Kirk', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'How to Know the Non-Gilled Fleshy Fungi', 'Helen V. Smith Alexander H. Smith', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'How to Know the gilled mushrooms', 'Alexander H. Smith Helen V. Smith Nancy S. Weber', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(12, 'National Audubon Society Field Guide to North American Mushrooms', 'Gary H. Lincoff', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(13, 'How to Identify Mushrooms to Genus I:  Macroscopic Features', 'David L. Largent', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(14, 'How to Identify Mushrooms to Genus III:  Microscopic Features', 'David Largent David Johnson Roy Watling (Consultant)', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(15, 'Identification of the Larger Fungi Kindle Edition', 'Roy Watling', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(16, 'North American Mushrooms A Field Guide to Edible and Inedible Fungi', 'Dr. Orson K. Miller Jr. and Hope H. Miller', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(17, 'Mushrooms of the Southeast', 'Todd F. Elliott and Steven L. Stephenson', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(18, 'Mushrooms of the Gulf Coast States A Field Guide to Texas, Louisiana, Mississippi, Alabama, and Florida', 'Alan E. Bessette Arleen R. Bessette David P. Lewis', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(19, 'Mushrooms How to Identify and Gather Wild Mushrooms and Other Fungi', 'DK? Thomas Lessoe?', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(20, 'Mushrooms of the Midwest', 'Michael Kuo and Andrew S. Methven', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(21, 'North American Boletes A Color Guide to the Fleshy Pored Mushrooms', 'Alan E. Bessette, William C. Roody, and Arleen R. Bessette', '2', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(22, 'MBList', '', '', '', 1, '2023-07-09 14:00:00', '2024-03-01 21:00:00'),
(23, 'Will Johnston', 'Will Johnston', '1', '', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(24, 'Comparison of Different Drying Methods for Recovery of Mushroom DNA', 'Shouxian Wang,corresponding author1,2 Yu Liu,2 and Jianping Xu corresponding author1', '', 'Wang S, Liu Y, Xu J. Comparison of Different Drying Methods for Recovery of Mushroom DNA. Sci Rep. 2017 Jun 7;7(1):3008. doi: 10.1038/s41598-017-03570-7. PMID: 28592865; PMCID: PMC5462775.', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

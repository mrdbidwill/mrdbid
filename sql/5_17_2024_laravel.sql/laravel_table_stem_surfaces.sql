
-- --------------------------------------------------------

--
-- Table structure for table `stem_surfaces`
--

CREATE TABLE `stem_surfaces` (
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
-- Dumping data for table `stem_surfaces`
--

INSERT INTO `stem_surfaces` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-02-21 15:37:26', '2023-02-21 15:37:26'),
(2, 'Smooth', 'No defining features found on the surface.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Uneven', 'A bumpy surface.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Rugose', 'A wrinkled or rough surface.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Rugulose', 'A slightly wrinkled surface.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Rivulose', 'A thinly wrinkled surface of branching wavy or crooked lines.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Scrobiculate', 'A pitted or furrowed surface.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Warty', 'Remnants of the universal veil remain on the surface in small patches.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Virgate', 'A streaked surface.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'Hygrophanous', 'A surface that is transparent when wet and opaque when dry.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'Sericeous', 'A silky surface.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(12, 'Fibrillose', 'A surface covered in thread-like filaments.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(13, 'Squamose', 'A surface covered with scales.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(14, 'Squarrose', 'A ragged surface covered with small scales.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(15, 'Pruinose', 'A surface covered with a white powdery frostlike substance.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(16, 'Pulverulent', 'A surface covered with fine dust or powder.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(17, 'Granulose', 'A surface covered in salt-like granulates.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(18, 'Furfuraceous', 'A surface covered in flaky bran-like particles; dandruff-like.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(19, 'Zonate', 'A surface containing zones or bands that are distinguished by texture or color.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(20, 'Areolate', 'A cracked surface resembling dried-mud or paint.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(21, 'Rimose', 'A surface covered in cracks and crevices.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(22, 'Laccate', 'A waxy or lacquered surface texture.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(23, 'Viscid -', 'A sticky glue-like surface texture.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(24, 'Glutinous', 'A slimy surface.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(25, 'Glabrous - Hairy', 'Hairy - a bald surface.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(26, 'Velvety - Hairy', 'Hairy - A surface covered with very fine and soft hairs.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(27, 'Pubescent - Hairy', 'Hairy - A surface cover with fuzz or fine hairs.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(28, 'Canescent - Hairy', 'Hairy - A surface covered in dense white or gray down-like hairs. Giving a frosted appearance.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(29, 'Floccose - Hairy', 'Hairy - A surface covered in Wooly or cotton-like hairs.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(30, 'Tomentose - Hairy', 'Hairy - A surface covered densely with matted hairs.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(31, 'Hispid - Hairy', 'Hairy - A surface covered with straight bristle-like hairs.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(32, 'Hirsute - Hairy', 'Hairy - A surface covered with slightly stiff and shaggy hairs.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(33, 'Villose - Hairy', 'Hairy - A surface covered with long soft hairs.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(34, 'Strigose - Hairy', 'Hairy - A surface covered with long bristle-like hairs.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(35, 'Banded', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(36, 'Peronate', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(37, 'Fibrous', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(38, 'Lacunose (w/dp.grooves)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(39, 'Longitudionally striate', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(40, 'Ribbed/Costate', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(41, 'Scabrous (scabby)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(42, 'Punctuate (w/small dots)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(43, 'Glanular-dotted (w/dark sticky dots)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(44, 'Reticulate (fishnet)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

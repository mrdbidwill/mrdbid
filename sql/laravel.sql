-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 27, 2024 at 06:43 AM
-- Server version: 8.0.36-0ubuntu0.22.04.1
-- PHP Version: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `abundances`
--

CREATE TABLE `abundances` (
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
-- Dumping data for table `abundances`
--

INSERT INTO `abundances` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'None', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Low', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Moderate', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'High', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `annulus_positions`
--

CREATE TABLE `annulus_positions` (
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
-- Dumping data for table `annulus_positions`
--

INSERT INTO `annulus_positions` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Superior', 'Near the cap', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Apical', 'upper half', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Median', 'in the middle', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Inferior', 'Lower half', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Basal', 'Near the base', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `bulb_types`
--

CREATE TABLE `bulb_types` (
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
-- Dumping data for table `bulb_types`
--

INSERT INTO `bulb_types` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Napiform (turnip)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Saccate', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Sheathing', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Collar', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Granular', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Concentric rings or scales', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Friable, disappearing', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Fusiform', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'Marginate-depressed', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'Cleft', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('010077a169348fea025fb249cface334', 'i:1;', 1716656898),
('010077a169348fea025fb249cface334:timer', 'i:1716656898;', 1716656898);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `cap_shapes`
--

CREATE TABLE `cap_shapes` (
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
-- Dumping data for table `cap_shapes`
--

INSERT INTO `cap_shapes` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-02-21 15:37:26', '2023-02-21 15:37:26'),
(2, 'Convex', 'evenly rounded', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Convex', 'evenly rounded', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'ovoid', 'egg', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'conic', 'cone', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'campanulate', 'bell-shaped.', 'vv', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'parabolic', 'half-egg', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'pulvinate', 'cushion', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'cylindric', 'bullet', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'plane', 'flat', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'conchate', 'sea-shell', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(12, 'umbonate', 'w/bump', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(13, 'cuspidate', 'Umbonate with a pointy conical apex; Witch-hat shaped. also known as eye-tooth.', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(14, 'papillate', 'w/nipple', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(15, 'depressed', 'Saucer-shaped; The center is lower than the cap margin.', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(16, 'umbilicate', 'a navel-like depression in the center.', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(17, 'infundibuliform', 'funnel-shaped', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cap_shape_top_views`
--

CREATE TABLE `cap_shape_top_views` (
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
-- Dumping data for table `cap_shape_top_views`
--

INSERT INTO `cap_shape_top_views` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Petaloid', 'petal', '', 5, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Spathulate', 'spatula', '', 5, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Dimidiate', '1/2 circle', '', 5, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Flabelliform', 'fan-shaped', '', 5, 2, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cap_surface_dryness`
--

CREATE TABLE `cap_surface_dryness` (
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
-- Dumping data for table `cap_surface_dryness`
--

INSERT INTO `cap_surface_dryness` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'dry: Dull', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'dry:  Silky', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Moist:  lubricous/greasy', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Moist: Viscid/sticky/tacky', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Moist: Glutinous (slimy)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'dry: Shiny', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cap_surface_textures`
--

CREATE TABLE `cap_surface_textures` (
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
-- Dumping data for table `cap_surface_textures`
--

INSERT INTO `cap_surface_textures` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
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
(34, 'Strigose - Hairy', 'Hairy - A surface covered with long bristle-like hairs.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_options` int NOT NULL,
  `look_up_y_n` tinyint(1) NOT NULL,
  `part` int NOT NULL,
  `source` int NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`id`, `name`, `display_options`, `look_up_y_n`, `part`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'id', 4, 0, 2, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'specimen_age', 9, 1, 16, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'odor', 9, 1, 16, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'taste', 9, 1, 16, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'toxic', 9, 1, 16, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'habit', 9, 1, 11, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'cap_width', 2, 0, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'cap_height', 2, 0, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'cap_shape', 9, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'cap_shape_top_view', 9, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(12, 'cap_color', 6, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(13, 'cap_color_disc', 6, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(14, 'cap_color_margin', 6, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(15, 'cap_color_background', 6, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(16, 'cap_color_fibrils', 6, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(17, 'cap_color_bruised', 6, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(18, 'cap_color_wet', 6, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(19, 'cap_color_dry', 6, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(20, 'cap_surface_dryness', 9, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(21, 'cap_surface_texture', 9, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(22, 'cap_margin_shape', 9, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(23, 'cap_margin_type', 9, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(24, 'cap_hairy_y_n', 9, 0, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(25, 'cap_context_flesh_color_moist', 6, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(26, 'cap_context_flesh_color_dry', 6, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(27, 'cap_context_flesh_color_cuticle', 6, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(28, 'cap_context_flesh_thickness_disc', 2, 0, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(29, 'cap_context_flesh_thickness_margin', 2, 0, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(30, 'cap_context_flesh_texture', 9, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(31, 'cap_context_flesh_latex_color', 6, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(32, 'cap_context_flesh_latex_color_exposed', 6, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(33, 'cap_context_flesh_latex_taste', 7, 1, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(34, 'cap_context_flesh_latex_abundance', 9, 0, 3, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(35, 'gill_attachment', 9, 1, 4, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(36, 'gill_breadth', 2, 1, 4, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(37, 'gill_thickness', 2, 1, 4, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(38, 'gill_spacing', 9, 1, 4, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(39, 'gill_color_young', 6, 1, 4, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(40, 'gill_color_mature', 6, 1, 4, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(41, 'gill_edges', 9, 1, 4, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(42, 'gill_misc_waxy_y_n', 9, 0, 4, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(43, 'gill_misc_arid_dry_y_n', 9, 0, 4, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(44, 'gill_misc_deliquescent_y_n', 9, 0, 4, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(45, 'stem_location', 9, 1, 5, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(46, 'stem_height', 2, 0, 5, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(47, 'stem_diameter_top', 2, 0, 5, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(48, 'stem_diameter_mid', 2, 0, 5, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(49, 'stem_diameter_low', 2, 0, 5, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(50, 'stem_shape', 9, 1, 5, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(51, 'stem_color', 6, 1, 5, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(52, 'stem_color_change', 6, 1, 5, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(53, 'stem_color_base', 6, 1, 5, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(54, 'stem_color_apex', 6, 1, 5, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(55, 'stem_color_interior', 6, 1, 5, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(56, 'stem_color_exterior', 6, 1, 5, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(57, 'stem_color_bruise', 6, 1, 5, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(58, 'stem_surface', 9, 1, 5, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(59, 'stem_texture', 9, 1, 5, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(60, 'stem_interior', 9, 1, 5, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(61, 'partial_inner_veil_annulus_ring_position', 9, 0, 6, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(62, 'veil_annulus', 9, 0, 6, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(63, 'partial_inner_veil_color', 6, 1, 6, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(64, 'partial_inner_veil_texture', 9, 1, 6, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(65, 'partial_inner_veil_fate', 9, 1, 6, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(66, 'partial_inner_veil_annular_ring', 9, 0, 6, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(67, 'partial_inner_veil_appearance', 9, 1, 6, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(68, 'universal_outer_veil_description', 9, 0, 6, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(69, 'universal_outer_veil_volva', 9, 0, 6, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(70, 'bulb_type', 9, 1, 6, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(71, 'mycelium_color', 6, 1, 7, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(72, 'mycelium_texture', 9, 0, 7, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(73, 'spore_color', 6, 1, 8, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(74, 'spore_range_low', 8, 0, 8, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(75, 'spore_range_high', 8, 0, 8, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(76, 'habitat', 9, 1, 11, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(77, 'soil_type', 9, 1, 11, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(78, 'soil_temp', 4, 0, 11, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(79, 'air_temp', 4, 0, 11, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(80, 'plant_association', 9, 1, 11, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(81, 'rhizomorph_color', 6, 1, 12, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(82, 'rhizomorph_texture', 9, 0, 12, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(83, 'chem_reaction', 9, 1, 13, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(84, 'weight_before_dry', 4, 0, 17, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(85, 'weight_after_dry', 4, 0, 17, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(86, 'elevation', 4, 0, 11, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(87, 'soil_ph', 4, 0, 11, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(88, 'stipe_latex_color_exposed', 6, 1, 5, 23, 1, '2024-03-15 11:20:16', '2024-03-15 11:20:16'),
(89, 'stipe_latex_taste', 7, 1, 5, 23, 1, '2024-03-15 11:21:20', '2024-03-15 11:20:16'),
(90, 'stipe_latex_abundance', 17, 1, 5, 23, 1, '2024-03-15 11:22:17', '2024-03-15 11:20:16'),
(91, 'Mycobank_name', 5, 0, 16, 23, 1, '2024-03-16 12:00:06', '2024-03-15 11:20:16'),
(92, 'inaturalist_num', 5, 0, 16, 23, 1, '2024-03-16 12:00:06', '2024-03-15 11:20:16'),
(93, 'mushroom_observer_num', 5, 0, 16, 23, 1, '2024-03-16 12:00:06', '2024-03-15 11:20:16'),
(94, 'location_found_latitude', 5, 0, 15, 23, 1, '2024-03-16 12:00:06', '2024-03-15 11:20:16'),
(95, 'location_found_longitude', 5, 0, 15, 23, 1, '2024-03-17 00:15:00', '2024-03-15 11:20:16'),
(96, 'project', 9, 0, 16, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(97, 'microscoped_slides_included', 9, 0, 17, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(98, 'preservation_method', 9, 1, 17, 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(99, 'genus', 9, 1, 16, 23, 1, '2024-03-17 11:07:42', '2024-03-15 11:20:16'),
(100, 'species', 9, 1, 16, 23, 1, '2024-03-17 11:08:12', '2024-03-15 11:20:16'),
(101, 'annulus_position', 9, 9, 6, 23, 1, '2024-03-22 13:02:52', '2024-03-15 11:20:16');

-- --------------------------------------------------------

--
-- Table structure for table `chem_reactions`
--

CREATE TABLE `chem_reactions` (
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
-- Dumping data for table `chem_reactions`
--

INSERT INTO `chem_reactions` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Ammonia (NH4OH, Ammonium Hydroxide)', '', '', 8, 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'KOH (Potassium Hydroxide) - 3%', '', '', 8, 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint UNSIGNED NOT NULL,
  `latin_name` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `common_name` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_group` int NOT NULL,
  `hex` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` int NOT NULL,
  `r_val` int NOT NULL,
  `g_val` int NOT NULL,
  `b_val` int NOT NULL,
  `closest_websafe_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cwc_r` int NOT NULL,
  `cwc_g` int NOT NULL,
  `cwc_b` int NOT NULL,
  `image_file` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `latin_name`, `common_name`, `color_group`, `hex`, `sequence`, `r_val`, `g_val`, `b_val`, `closest_websafe_color`, `cwc_r`, `cwc_g`, `cwc_b`, `image_file`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Albus', 'White', 1, 'FFFFFF', 1, 255, 255, 255, 'White', 255, 255, 255, '../images/AMS_colors/colors/color_1.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Griseus', 'Grullo', 50, 'A9A292', 53, 169, 162, 146, 'Manatee', 0, 0, 0, '../images/AMS_colors/colors/color_2.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Murinus', 'Shadow', 50, '857C6B', 55, 133, 124, 107, 'Copper Rose', 0, 0, 0, '../images/AMS_colors/colors/color_3.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Ater', 'Dark Lava', 50, '4B4435', 57, 75, 68, 53, 'Olive Drab', 0, 0, 0, '../images/AMS_colors/colors/color_4.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Niger', 'Black', 99, '000000', 99, 0, 0, 0, 'Black', 0, 0, 0, '../images/AMS_colors/colors/color_5.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Fumosus', 'Pastel Brown', 50, '7E6455', 56, 126, 100, 85, 'Dim Gray', 0, 0, 0, '../images/AMS_colors/colors/color_6.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Avellaneus', 'Cafe au lait', 70, 'A97848', 72, 169, 120, 72, 'Raw Umber', 0, 0, 0, '../images/AMS_colors/colors/color_7.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Isabellinus', 'Ruddy Brown', 70, 'BF7029', 74, 194, 112, 41, 'Ruddy Brown', 0, 0, 0, '../images/AMS_colors/colors/color_8.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Umbrinus', 'Sepia', 70, '6E4116', 77, 110, 65, 22, 'Chocolate', 0, 0, 0, '../images/AMS_colors/colors/color_9.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'Castaneus', 'Caput Mortuum', 70, '5E2914', 80, 94, 41, 20, 'Chocolate', 0, 0, 0, '../images/AMS_colors/colors/color_10.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'Fuligineus', 'Zinnwaldite Brown', 70, '391401', 82, 57, 20, 1, 'Bulgarian Rose', 0, 0, 0, '../images/AMS_colors/colors/color_11.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(12, 'Atropurpureus', 'Bulgarian Rose', 70, '4E0F0F', 84, 78, 15, 15, 'Rosewood', 0, 0, 0, '../images/AMS_colors/colors/color_12.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(13, 'Purpureus', 'OU Crimson Red', 10, '940101', 10, 148, 1, 1, 'OU Crimson Red', 0, 0, 0, '../images/AMS_colors/colors/color_13.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(14, 'Ruber', 'Rosso Corsa', 10, 'D30102', 30, 211, 1, 2, 'Boston University Red', 0, 0, 0, '../images/AMS_colors/colors/color_14.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(15, 'Miniatus', 'Coquelicot', 10, 'F73601', 40, 247, 54, 1, 'Coquelicot', 0, 0, 0, '../images/AMS_colors/colors/color_15.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(16, 'Incarnatus', 'Deep Carrot Orange', 10, 'ED7236', 70, 237, 114, 54, 'Portland Orange', 0, 0, 0, '../images/AMS_colors/colors/color_16.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(17, 'Roseus', 'Light Salmon', 10, 'F39F7C', 90, 243, 159, 124, 'Atomic Tangerine', 0, 0, 0, '../images/AMS_colors/colors/color_17.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(18, 'Testaceus', 'Flame', 10, 'DA5110', 50, 218, 81, 16, 'Tenne (Tawny)', 0, 0, 0, '../images/AMS_colors/colors/color_18.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(19, 'Latericius', 'Sienna', 10, '97280A', 20, 151, 40, 10, 'Brown', 0, 0, 0, '../images/AMS_colors/colors/color_19.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(20, 'Badius', 'Caput Mortuum (also)', 70, '561A10', 81, 86, 26, 16, 'Chocolate', 0, 0, 0, '../images/AMS_colors/colors/color_20.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(21, 'Aurantiacus', 'Safety Orange (Blaze Orange)', 10, 'EE6005', 80, 238, 96, 5, 'Safety Orange', 0, 0, 0, '../images/AMS_colors/colors/color_21.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(22, 'Luteus', 'Tangerine', 40, 'EE8801', 49, 238, 136, 1, 'Orange', 0, 0, 0, '../images/AMS_colors/colors/color_22.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(23, 'Flavus', 'UCLA Gold', 40, 'E7B001', 48, 231, 176, 1, 'Orange', 0, 0, 0, '../images/AMS_colors/colors/color_23.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(24, 'Citrinus', 'Meat brown', 40, 'DCC747', 47, 220, 199, 71, 'Pear', 0, 0, 0, '../images/AMS_colors/colors/color_24.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(25, 'Sulphureus', 'Straw', 40, 'DCCB71', 43, 220, 203, 113, 'June Bud', 0, 0, 0, '../images/AMS_colors/colors/color_25.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(26, 'Stramineus', 'Pale Gold', 40, 'E3CB95', 41, 227, 203, 149, 'Medium Bud Spring', 0, 0, 0, '../images/AMS_colors/colors/color_26.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(27, 'Cremeus', 'Pale Gold (also)', 40, 'E8C583', 42, 232, 197, 131, 'Peach-Orange', 0, 0, 0, '../images/AMS_colors/colors/color_27.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(28, 'Ochroleucus', 'Topaz', 40, 'F0C378', 44, 240, 195, 120, 'Jonquil', 0, 0, 0, '../images/AMS_colors/colors/color_28.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(29, 'Ochraceus', 'Pastel Orange', 40, 'F3B556', 45, 243, 181, 86, 'Jonquil', 0, 0, 0, '../images/AMS_colors/colors/color_29.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(30, 'Melleus', 'Indian Yellow', 40, 'DFB54F', 46, 223, 181, 79, 'June Bud', 0, 0, 0, '../images/AMS_colors/colors/color_30.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(31, 'Ferrunineus', 'Burnt Orange', 10, 'CB5607', 60, 203, 86, 7, 'Tenne (Tawny)', 0, 0, 0, '../images/AMS_colors/colors/color_31.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(32, 'Fulvus', 'Brown (Traditional)', 70, '9E4410', 78, 158, 68, 16, 'Brown', 0, 0, 0, '../images/AMS_colors/colors/color_32.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(33, 'Flavo-virens', 'Brass', 60, 'B5AB3E', 61, 181, 171, 62, 'Satin  Sheen Gold', 0, 0, 0, '../images/AMS_colors/colors/color_33.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(34, 'Atro-virens', 'Myrtle', 60, '213C25', 65, 33, 60, 37, 'Olive Drab', 0, 0, 0, '../images/AMS_colors/colors/color_34.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(35, 'Viridis', 'Fern Green', 60, '4A7A3E', 64, 74, 122, 62, 'Hunter Green', 0, 0, 0, '../images/AMS_colors/colors/color_35.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(36, 'Prasinus', 'Fern Green', 60, '6B8046', 62, 107, 128, 70, 'Olive Drab', 0, 0, 0, '../images/AMS_colors/colors/color_36.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(37, 'Aerugineus', 'Slate Gray', 60, '6B938A', 63, 107, 147, 138, 'Cadet Blue', 0, 0, 0, '../images/AMS_colors/colors/color_37.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(38, 'Glaucus', 'Pastel Gray', 50, 'D6D5B7', 51, 214, 213, 183, 'Pastel Gray', 0, 0, 0, '../images/AMS_colors/colors/color_38.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(39, 'Olivaceus', 'Dark Brown', 70, '5C4C1D', 76, 92, 76, 29, 'Wine', 0, 0, 0, '../images/AMS_colors/colors/color_39.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(40, 'Atro-cyaneus', 'Oxford Blue', 20, '020F41', 32, 2, 15, 65, 'Oxford Blue', 0, 0, 0, '../images/AMS_colors/colors/color_40.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(41, 'Cyaneus', 'Royal Blue (Traditional)', 20, '012866', 22, 1, 40, 102, 'Dark Midnight Blue', 0, 0, 0, '../images/AMS_colors/colors/color_41.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(42, 'Caeruleus', 'Moonstone Blue', 20, '76A1BC', 12, 118, 161, 188, 'Blue Gray', 0, 0, 0, '../images/AMS_colors/colors/color_42.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(43, 'Caesius', 'Pale Silver', 50, 'C5C3AB', 52, 197, 195, 171, 'Medium Spring Bud', 0, 0, 0, '../images/AMS_colors/colors/color_43.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(44, 'Plumbeus', 'Battleship Gray', 50, '858786', 54, 133, 135, 134, 'Manatee', 0, 0, 0, '../images/AMS_colors/colors/color_44.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(45, 'Ardesiacus', 'Rifle Green', 60, '303C35', 66, 48, 60, 53, 'Olive Drab', 0, 0, 0, '../images/AMS_colors/colors/color_45.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(46, 'Atro-violaceus', 'Caput Mortuum (Also)', 70, '491D31', 79, 73, 29, 49, 'Olive Drab', 0, 0, 0, '../images/AMS_colors/colors/color_46.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(47, 'Violaceus', 'French Lilac', 70, '86728E', 73, 134, 114, 142, 'French Lilac', 0, 0, 0, '../images/AMS_colors/colors/color_47.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(48, 'Lilacinus', 'Puce', 70, 'C39AA1', 71, 195, 154, 161, 'Puce', 0, 0, 0, '../images/AMS_colors/colors/color_48.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(49, 'Lividus', 'Old Mauve', 70, '6E3534', 75, 110, 53, 69, 'Wine', 0, 0, 0, '../images/AMS_colors/colors/color_49.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(50, 'Vinosus', 'Bulgarian Rose (Also)', 70, '460910', 83, 70, 9, 16, 'Bulgarian Rose', 0, 0, 0, '../images/AMS_colors/colors/color_50.jpg', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(52, 'Not Entered', 'Not Entered', 1, '1', 0, 1, 1, 1, 'None', 0, 0, 0, '', 23, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
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
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'USA', 'United States', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'MEX', 'Mexico', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'CAN', 'Canada', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

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
(24, 'Comparison of Different Drying Methods for Recovery of Mushroom DNA', 'Shouxian Wang,corresponding author1,2 Yu Liu,2 and Jianping Xu corresponding author1', '', 'Wang S, Liu Y, Xu J. Comparison of Different Drying Methods for Recovery of Mushroom DNA. Sci Rep. 2017 Jun 7;7(1):3008. doi: 10.1038/s41598-017-03570-7. PMID: 28592865; PMCID: PMC5462775.', 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(25, 'https://en.wikipedia.org/wiki/Basidiocarp', 'https://en.wikipedia.org/wiki/Basidiocarp', '3', '', 1, '2024-05-18 19:03:25', '2024-05-18 19:03:25');

-- --------------------------------------------------------

--
-- Table structure for table `data_source_data_types`
--

CREATE TABLE `data_source_data_types` (
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
-- Dumping data for table `data_source_data_types`
--

INSERT INTO `data_source_data_types` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Book', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Website', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Magazine', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Chart', 'like Scates', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Database', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `display_options`
--

CREATE TABLE `display_options` (
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
-- Dumping data for table `display_options`
--

INSERT INTO `display_options` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'text_box_number_mm', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'text_box_number_um', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'text_box_number', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'text_box_string', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'color', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'taste', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'odor', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'radio', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'drop-down', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'state', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(12, 'country', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(13, 'texture', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `epithets`
--

CREATE TABLE `epithets` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `source` int NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fungus_types`
--

CREATE TABLE `fungus_types` (
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
-- Dumping data for table `fungus_types`
--

INSERT INTO `fungus_types` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Gills', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Pores', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Teeth', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Cups', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Stinkhorn', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `genus`
--

CREATE TABLE `genus` (
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
-- Dumping data for table `genus`
--

INSERT INTO `genus` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Albatrellus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Aureoboletus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Austroboletus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Boletellus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Boletinellus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Boletinus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Boletopsis', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Boletus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Chalciporus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'Coltricia', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'Fuscoboletinus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(12, 'Gastroboletus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(13, 'Gastroleccinum', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(14, 'Gastrosuillus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(15, 'Gomphidius', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(16, 'Gyrodon', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(17, 'Gyroporus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(18, 'Hypomyces', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(19, 'Jabnoporus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(20, 'Leccinum', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(21, 'Meiorganum', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(22, 'Mucilopilus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(23, 'Paragyrodon', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(24, 'Paxillus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(25, 'Phaeolus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(26, 'Phlebopus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(27, 'Phylloporus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(28, 'Polyporus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(29, 'Porphyrellus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(30, 'Pseudomerulius', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(31, 'Pulveroboletus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(32, 'Strobilomyces', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(33, 'Suillellus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(34, 'Suillus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(35, 'Truncocolumella', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(36, 'Tylopilus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(37, 'Xanthoconium', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(38, 'Xerocomus', '', '', 21, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

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

-- --------------------------------------------------------

--
-- Table structure for table `gill_breadths`
--

CREATE TABLE `gill_breadths` (
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
-- Dumping data for table `gill_breadths`
--

INSERT INTO `gill_breadths` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Broad', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Free - close', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Ventricose', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gill_context_flesh_latex_abundances`
--

CREATE TABLE `gill_context_flesh_latex_abundances` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `source` int NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gill_edges`
--

CREATE TABLE `gill_edges` (
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
-- Dumping data for table `gill_edges`
--

INSERT INTO `gill_edges` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Even - entire', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Serrate', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Serrulate', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Eroded (\"gnawed\")', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Fimbriate (fringed)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Marginate (diff. color)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Crenate (scalloped)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Acute', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'Obtuse (blunt)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'Crisped (crinkled)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gill_miscs`
--

CREATE TABLE `gill_miscs` (
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
-- Dumping data for table `gill_miscs`
--

INSERT INTO `gill_miscs` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Veined (with ridges)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Intervenose (with \"veins\" between gills', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Equal', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Unequal (w/short gills)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Forking', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Anastomosing (joining crossways)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gill_spacings`
--

CREATE TABLE `gill_spacings` (
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
-- Dumping data for table `gill_spacings`
--

INSERT INTO `gill_spacings` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-02-21 00:33:00', '2023-02-21 00:33:00'),
(2, 'Crowded', 'The Gills are tightly close together.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Close', 'The Gills are close together.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Subdistant', 'The gills are spaced apart.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Distant', 'The gills are widely spaced apart.', '', 7, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gill_thickness`
--

CREATE TABLE `gill_thickness` (
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
-- Dumping data for table `gill_thickness`
--

INSERT INTO `gill_thickness` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Average', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Thick', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Tapering', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `habitats`
--

CREATE TABLE `habitats` (
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
-- Dumping data for table `habitats`
--

INSERT INTO `habitats` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-02-21 00:33:00', '2023-02-21 00:33:00'),
(2, 'Terrestrial (on soil - bare )', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(3, 'Terrestrial (on soil - burned )', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(4, 'Terrestrial (on soil - disturbed )', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(5, 'Lignicolous (on wood) - what kind of tree?', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(6, 'Humicolous (on humus, duff) - conifer, other?', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(7, 'Coprophious (on dung) what kind?', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(8, 'In grassy area - lawn, pasture, etc?', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(9, 'In forest - conifer, hardwood, mixed?', '', '', 5, 1, '2023-02-19 14:10:26', '2023-02-21 00:33:00'),
(16, 'fungicolous', 'mushroom mycelia grow in other mushrooms', 'p 7, How to Identify Mushrooms to Genus I: Macroscopic Features - David L. Largent', 13, 2, '2023-03-16 16:46:17', '2023-02-21 00:33:00');

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

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint UNSIGNED NOT NULL,
  `specimen_id` int NOT NULL,
  `parts` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_remote` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_local` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_width` int NOT NULL,
  `image_height` int NOT NULL,
  `camera_make` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camera_model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lens` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exposure` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aperture` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_taken` datetime NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images_thumbnails`
--

CREATE TABLE `images_thumbnails` (
  `id` bigint UNSIGNED NOT NULL,
  `source_remote` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_width` int NOT NULL,
  `image_height` int NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lens`
--

CREATE TABLE `lens` (
  `id` bigint UNSIGNED NOT NULL,
  `make` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lens`
--

INSERT INTO `lens` (`id`, `make`, `model`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', 1, '2024-03-30 19:52:23', '2024-03-30 19:52:23'),
(2, 'Nikon', 'Nikon ED AF Micro Nikkor 70-180mm 1:4.5-5.6 D', 2, '2023-03-20 16:34:51', '2024-03-30 19:52:23');

-- --------------------------------------------------------

--
-- Table structure for table `member_list_clusters`
--

CREATE TABLE `member_list_clusters` (
  `id` bigint UNSIGNED NOT NULL,
  `specimen_id` int NOT NULL,
  `cluster_id` int NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_list_clusters`
--

INSERT INTO `member_list_clusters` (`id`, `specimen_id`, `cluster_id`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 5, 3, 1, '2023-08-25 00:33:33', '2023-08-25 00:33:33');

-- --------------------------------------------------------

--
-- Table structure for table `member_list_groups`
--

CREATE TABLE `member_list_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `specimen_id` int NOT NULL,
  `group_id` int NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_list_groups`
--

INSERT INTO `member_list_groups` (`id`, `specimen_id`, `group_id`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2024-01-25 22:33:56', '2024-01-25 22:33:56'),
(2, 2, 1, 1, '2024-01-26 21:24:09', '2024-01-25 22:33:56'),
(3, 3, 9, 1, '2024-01-26 21:28:42', '2024-01-25 22:33:56'),
(4, 4, 10, 1, '2024-01-26 21:42:24', '2024-01-25 22:33:56'),
(5, 5, 10, 1, '2024-01-26 21:48:29', '2024-01-25 22:33:56'),
(6, 6, 10, 1, '2024-01-26 21:55:31', '2024-01-25 22:33:56'),
(7, 7, 10, 1, '2024-01-26 22:43:45', '2024-01-25 22:33:56'),
(8, 8, 10, 1, '2024-01-26 22:45:59', '2024-01-25 22:33:56'),
(9, 5, 10, 1, '2024-03-20 00:15:45', '2024-01-25 22:33:56'),
(10, 6, 3, 1, '2024-03-21 21:19:25', '2024-01-25 22:33:56'),
(11, 7, 10, 1, '2024-03-26 23:53:15', '2024-01-25 22:33:56'),
(12, 8, 4, 1, '2024-03-27 11:14:29', '2024-01-25 22:33:56'),
(13, 9, 12, 1, '2024-04-03 00:31:34', '2024-01-25 22:33:56'),
(14, 10, 12, 1, '2024-04-03 00:35:39', '2024-01-25 22:33:56'),
(15, 1, 4, 1, '2024-04-03 19:28:24', '2024-01-25 22:33:56'),
(16, 2, 4, 1, '2024-04-03 19:44:33', '2024-01-25 22:33:56'),
(17, 1, 13, 1, '2024-04-03 19:45:30', '2024-01-25 22:33:56'),
(18, 2, 13, 1, '2024-04-03 19:45:57', '2024-01-25 22:33:56'),
(19, 3, 12, 1, '2024-04-03 22:58:39', '2024-01-25 22:33:56');

-- --------------------------------------------------------

--
-- Table structure for table `member_types`
--

CREATE TABLE `member_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_types`
--

INSERT INTO `member_types` (`id`, `name`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'admin', 1, '2022-03-31 20:16:40', '2022-03-31 20:16:40'),
(2, 'member', 1, '2022-03-31 20:19:59', '2022-03-31 20:16:40'),
(3, 'scholar', 1, '2022-03-31 20:20:18', '2022-03-31 20:16:40'),
(4, 'expert', 1, '2022-03-31 20:20:25', '2022-03-31 20:16:40'),
(5, 'student', 1, '2022-03-31 20:20:30', '2022-03-31 20:16:40'),
(6, 'researcher', 1, '2022-03-31 20:20:34', '2022-03-31 20:16:40');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2024_05_01_000001_create_cache_table', 1),
(2, '2024_05_01_000002_create_users_table', 1),
(3, '2024_05_01_000003_create_jobs_table', 1),
(4, '2024_05_01_000004_add_two_factor_columns_to_users_table', 1),
(5, '2024_05_01_000005_create_personal_access_tokens_table', 1),
(6, '2024_05_12_000007_create_abundances_table', 1),
(7, '2024_05_12_000008_create_annulus_positions_table', 1),
(8, '2024_05_12_000009_create_bulb_types_table', 1),
(9, '2024_05_12_000010_create_cap_context_flesh_textures_table', 1),
(10, '2024_05_12_000011_create_cap_margin_shapes_table', 1),
(11, '2024_05_12_000012_create_cap_margin_types_table', 1),
(12, '2024_05_12_000013_create_cap_shapes_table', 1),
(13, '2024_05_12_000014_create_cap_shape_top_views_table', 1),
(14, '2024_05_12_000015_create_cap_surface_dryness_table', 1),
(15, '2024_05_12_000016_create_cap_surface_textures_table', 1),
(16, '2024_05_12_000017_create_chem_reactions_table', 1),
(17, '2024_05_12_000018_create_countries_table', 1),
(18, '2024_05_12_000019_create_data_source_data_types_table', 1),
(19, '2024_05_12_000020_create_display_options_table', 1),
(20, '2024_05_12_000021_create_epithets_table', 1),
(21, '2024_05_12_000022_create_fungus_types_table', 1),
(22, '2024_05_12_000023_create_genus_table', 1),
(23, '2024_05_12_000024_create_gill_attachments_table', 1),
(24, '2024_05_12_000025_create_gill_breadths_table', 1),
(25, '2024_05_12_000026_create_gill_context_flesh_latex_abundances_table', 1),
(26, '2024_05_12_000027_create_gill_edges_table', 1),
(27, '2024_05_12_000028_create_gill_other_table', 1),
(28, '2024_05_12_000029_create_gill_spacings_table', 1),
(29, '2024_05_12_000030_create_gill_thickness_table', 1),
(30, '2024_05_12_000031_create_habits_table', 1),
(31, '2024_05_12_000032_create_habitats_table', 1),
(32, '2024_05_12_000033_create_odors_table', 1),
(33, '2024_05_12_000034_create_partial_inner_veil_appearances_table', 1),
(34, '2024_05_12_000035_create_partial_inner_veil_fates_table', 1),
(35, '2024_05_12_000036_create_partial_inner_veil_textures_table', 1),
(36, '2024_05_12_000037_create_partial_inter_veil_annulus_ring_positions_table', 1),
(37, '2024_05_12_000038_create_parts_table', 1),
(38, '2024_05_12_000039_create_plant_associations_table', 1),
(39, '2024_05_12_000040_create_possible_matches_table', 1),
(40, '2024_05_12_000041_create_preservation_methods_table', 1),
(41, '2024_05_12_000042_create_soil_types_table', 1),
(42, '2024_05_12_000043_create_species_table', 1),
(43, '2024_05_12_000044_create_specimen_ages_table', 1),
(44, '2024_05_12_000045_create_specimen_locations_now_table', 1),
(45, '2024_05_12_000046_create_specimens_table', 1),
(46, '2024_05_12_000047_create_states_table', 1),
(47, '2024_05_12_000048_create_stem_interiors_table', 1),
(48, '2024_05_12_000049_create_stem_locations_table', 1),
(49, '2024_05_12_000050_create_stem_shapes_table', 1),
(50, '2024_05_12_000051_create_stem_surfaces_table', 1),
(51, '2024_05_12_000052_create_stem_textures_table', 1),
(52, '2024_05_12_000053_create_tastes_table', 1),
(53, '2024_05_12_000054_create_toxics_table', 1),
(54, '2024_05_12_000055_create_universal_outer_veil_appearances_table', 1),
(55, '2024_05_12_000056_create_universal_outer_veil_fates_table', 1),
(56, '2024_05_12_000057_create_universal_outer_veil_textures_table', 1),
(57, '2024_05_12_000058_create_characters_table', 1),
(58, '2024_05_12_000058_create_colors_table', 1),
(59, '2024_05_12_000058_create_data_sources_table', 1),
(60, '2024_05_12_000058_create_images_table', 1),
(61, '2024_05_12_000058_create_images_thumbnails_table', 1),
(62, '2024_05_12_000058_create_lens_table', 1),
(63, '2024_05_12_000058_create_member_list_clusters_table', 1),
(64, '2024_05_12_000058_create_member_list_groups_table', 1),
(65, '2024_05_12_000058_create_member_types_table', 1),
(66, '2024_05_12_000058_create_plants_table', 1),
(67, '2024_05_12_000058_create_specimen_characters_table', 1),
(68, '2024_05_12_000058_create_specimen_clusters_table', 1),
(69, '2024_05_12_000058_create_specimen_groups_table', 1),
(70, '2024_05_12_000058_create_synonyms_table', 1),
(71, '2024_05_12_000058_create_veils_table', 1);

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

-- --------------------------------------------------------

--
-- Table structure for table `partial_inner_veil_appearances`
--

CREATE TABLE `partial_inner_veil_appearances` (
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
-- Dumping data for table `partial_inner_veil_appearances`
--

INSERT INTO `partial_inner_veil_appearances` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Two Rings (from 2 veils)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Doubly-flared Ring', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, '\"Cogwheel\" Stellate', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Floccose (downy tuffs)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Cortinate PV & Fibrillose Annular Zone', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Single Ring thick on edge', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Pendant (hanging)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Subperonate', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'Peronate (w/\"boot\")', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `partial_inner_veil_fates`
--

CREATE TABLE `partial_inner_veil_fates` (
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
-- Dumping data for table `partial_inner_veil_fates`
--

INSERT INTO `partial_inner_veil_fates` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Disappearing - Evanescent', 'can only be detected in button stage', '', 4, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Persistent', 'leaving remnants on cap', '', 4, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `partial_inner_veil_textures`
--

CREATE TABLE `partial_inner_veil_textures` (
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
-- Dumping data for table `partial_inner_veil_textures`
--

INSERT INTO `partial_inner_veil_textures` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Membranous (skin-like)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Cortinate (cobwebby)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Fibillose (thready)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Gelatinous (slimy)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `partial_inter_veil_annulus_ring_positions`
--

CREATE TABLE `partial_inter_veil_annulus_ring_positions` (
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
-- Dumping data for table `partial_inter_veil_annulus_ring_positions`
--

INSERT INTO `partial_inter_veil_annulus_ring_positions` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'None', 'Does not have annulus ring', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Superior', 'Near the cap', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Apical', 'upper half', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Median', 'in the middle', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Inferior', 'Lower half', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Basal', 'Near the base', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
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
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(2, 'Basic', 'default data that every specimen will have', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(3, 'Cap - Pileus', '', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(4, 'Gills - Lamellae', '', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(5, 'Stem - Stipe', '', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(6, 'Veil', '', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(7, 'Mycelium', '', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(8, 'Spores', 'micro for spores is here - not in micro', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(9, 'Micro', '', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(10, 'DNA', '', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(11, 'Habitat', 'Habitat, Plant Assoc ', '', 5, 1, '2023-05-24 00:33:26', '2023-05-24 00:33:26'),
(12, 'Rhizomorph', '', '', 5, 1, '2023-05-14 00:36:00', '2023-05-24 00:33:26'),
(13, 'Chemical Reaction', '', '', 23, 1, '2023-05-14 10:51:00', '2023-05-24 00:33:26'),
(14, 'Color', 'this will allow color selection for ALL color characters to be in one place', '', 23, 1, '2023-05-18 19:14:52', '2023-05-24 00:33:26'),
(15, 'Location', 'lat lon city county state country', '', 23, 1, '2024-03-12 00:26:57', '2023-05-24 00:33:26'),
(16, 'Identification', 'species genus inaturalist etc', '', 23, 1, '2024-03-12 00:29:40', '2023-05-24 00:33:26'),
(17, 'Storage', '', '', 23, 1, '2024-03-16 10:56:22', '2023-05-24 00:33:26');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plants`
--

CREATE TABLE `plants` (
  `id` bigint UNSIGNED NOT NULL,
  `specimen_id` int NOT NULL,
  `plant_id` int NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` int NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plant_associations`
--

CREATE TABLE `plant_associations` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `source` int NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `possible_matches`
--

CREATE TABLE `possible_matches` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `source` int NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preservation_methods`
--

CREATE TABLE `preservation_methods` (
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
-- Dumping data for table `preservation_methods`
--

INSERT INTO `preservation_methods` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-30 19:43:51', '2024-03-30 19:43:51'),
(2, 'None', '', '', 23, 1, '2024-03-15 11:26:21', '2024-03-30 19:43:51'),
(3, 'Unknown', '', '', 23, 1, '2024-03-15 11:28:22', '2024-03-30 19:43:51'),
(4, 'Dehumidifier', '', '', 23, 1, '2024-03-15 11:28:38', '2024-03-30 19:43:51'),
(5, 'silica gel', '', '', 23, 1, '2024-04-02 15:48:43', '2024-03-30 19:43:51');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('l40nwSc4f9sFNoRytXDlAK7T6GtG5SWNxNAuQ90A', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoidnVKMEMzQTFVZU13Q0QyZ3BBdVZxN0NZZ29vTTF4NUFkQldDY3hPVyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiRaRW5JNUllbFNhekgyajFYZ0MuelMuNjVORUtFSGRvREw3QS5iR21aOUNVVm8zazFPaUliVyI7fQ==', 1716656839),
('ys3OnkG6MTwirA60bbrcjmIsA52GX29IeZdO3JOd', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUWJGUnhyQWFrMW5iZnl0b2FZZW5IYzFlYjlCWVBIeGw4OElhVHpBZCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiRaRW5JNUllbFNhekgyajFYZ0MuelMuNjVORUtFSGRvREw3QS5iR21aOUNVVm8zazFPaUliVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1716658742);

-- --------------------------------------------------------

--
-- Table structure for table `soil_types`
--

CREATE TABLE `soil_types` (
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
-- Dumping data for table `soil_types`
--

INSERT INTO `soil_types` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-02-21 00:33:00', '2023-02-21 00:33:00'),
(2, 'Unknown', '', '', 23, 1, '2023-02-21 14:10:26', '2023-02-21 00:33:00'),
(3, 'Loam', '', '', 23, 1, '2023-02-21 14:10:26', '2023-02-21 00:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `species`
--

CREATE TABLE `species` (
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
-- Dumping data for table `species`
--

INSERT INTO `species` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '23', 1, 1, '2024-02-14 01:27:57', '2024-02-14 01:27:57'),
(2, 'Some Species', 'Made Up', 'Fake', 23, 1, '2024-02-15 11:44:46', '2024-02-14 01:27:57'),
(3, 'Another', 'Fake', 'Made Up', 23, 1, '2024-02-15 11:46:23', '2024-02-14 01:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `specimens`
--

CREATE TABLE `specimens` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `source` int NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `specimen_ages`
--

CREATE TABLE `specimen_ages` (
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
-- Dumping data for table `specimen_ages`
--

INSERT INTO `specimen_ages` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2023-03-20 20:01:06', '2023-03-20 20:01:06'),
(2, 'Button', 'very young', '', 23, 1, '2023-03-20 20:01:06', '2023-03-20 20:01:06'),
(3, 'Young', '', '', 23, 1, '2023-03-20 20:01:25', '2023-03-20 20:01:06'),
(4, 'Mature', '', '', 23, 1, '2023-03-20 20:01:41', '2023-03-20 20:01:06'),
(5, 'Past Prime', '', '', 23, 1, '2023-03-20 20:02:10', '2023-03-20 20:01:06');

-- --------------------------------------------------------

--
-- Table structure for table `specimen_characters`
--

CREATE TABLE `specimen_characters` (
  `id` bigint UNSIGNED NOT NULL,
  `specimen_id` int NOT NULL,
  `character_id` int NOT NULL,
  `character_value` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_options` int NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `specimen_clusters`
--

CREATE TABLE `specimen_clusters` (
  `id` bigint UNSIGNED NOT NULL,
  `member_id` int NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `specimen_locations_now`
--

CREATE TABLE `specimen_locations_now` (
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
-- Dumping data for table `specimen_locations_now`
--

INSERT INTO `specimen_locations_now` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', 'Not Entered', 'None', 23, 1, '2023-02-21 00:33:00', '2023-04-18 21:29:02'),
(2, 'Observation Only - No specimen collected', '', 'None', 23, 1, '2023-04-18 21:26:54', '2023-04-18 21:29:02'),
(3, 'Speciment Collector', 'This is you, if you collected this specimen', '', 23, 1, '2023-04-18 21:28:33', '2023-04-18 21:29:02'),
(4, 'Herbarium', '', '', 23, 1, '2023-04-18 21:29:02', '2023-04-18 21:29:02');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
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
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Selected', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(2, 'Alabama', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(3, 'Alaska', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(4, 'Arizona', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(5, 'Arkansas', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(6, 'California', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(7, 'Colorado', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(8, 'Connecticut', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(9, 'Delaware', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(10, 'District of Columbia', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(11, 'Florida', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(12, 'Georgia', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(13, 'Hawaii', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(14, 'Idaho', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(15, 'Illinois', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(16, 'Indiana', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(17, 'Iowa', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(18, 'Kansas', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(19, 'Kentucky', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(20, 'Louisiana', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(21, 'Maine', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(22, 'Maryland', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(23, 'Massachusetts', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(24, 'Michigan', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(25, 'Minnesota', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(26, 'Mississippi', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(27, 'Missouri', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(28, 'Montana', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(29, 'Nebraska', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(30, 'Nevada', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(31, 'New Hampshire', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(32, 'New Jersey', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(33, 'New Mexico', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(34, 'New York', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(35, 'North Carolina', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(36, 'North Dakota', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(37, 'Ohio', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(38, 'Oklahoma', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(39, 'Oregon', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(40, 'Pennsylvania', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(41, 'Rhode Island', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(42, 'South Carolina', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(43, 'South Dakota', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(44, 'Tennessee', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(45, 'Texas', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(46, 'Utah', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(47, 'Vermont', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(48, 'Virginia', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(49, 'Washington', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(50, 'West Virginia', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(51, 'Wisconsin', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(52, 'Wyoming', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(53, 'Alberta', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(54, 'British Columbia', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(55, 'Manitoba', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(56, 'New Brunswick', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(57, 'Newfoundland', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(58, 'Nova Scotia', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(59, 'Northwest Territories', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(60, 'Nunavut', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(61, 'Ontario', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(62, 'Prince Edward Island', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(63, 'Quebec', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(64, 'Saskatchewan', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(65, 'Yukon', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(66, 'Aguascalientes', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(67, 'Baja California', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(68, 'Baja California Sur', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(69, 'Campeche', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(70, 'Chiapas', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(71, 'Chihuahua', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(72, 'Coahuila', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(73, 'Colima', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(74, 'Distrito Federal', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(75, 'Durango', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(76, 'Guanajuato', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(77, 'Guerrero', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(78, 'Hidalgo', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(79, 'Jalisco', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(80, 'Mexico', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(81, 'Michoacan', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(82, 'Morelos', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(83, 'Nayarit', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(84, 'Nuevo Leon', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(85, 'Oaxaca', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(86, 'Puebla', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(87, 'Queretaro', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(88, 'Quintana Roo', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(89, 'San Luis Potosi', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(90, 'Sinaloa', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(91, 'Sonora', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(92, 'Tabasco', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(93, 'Tamaulipas', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(94, 'Tlaxcala', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(95, 'Veracruz', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(96, 'Yucatan', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00'),
(97, 'Zacatecas', '', '', 23, 1, '2023-06-23 21:35:00', '2023-06-23 21:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `stem_interiors`
--

CREATE TABLE `stem_interiors` (
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
-- Dumping data for table `stem_interiors`
--

INSERT INTO `stem_interiors` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Solid', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Hollow (fistulose)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Tubular', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Cavernous', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Stuffed with pith', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `stem_locations`
--

CREATE TABLE `stem_locations` (
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
-- Dumping data for table `stem_locations`
--

INSERT INTO `stem_locations` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Central', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Eccentric (off-center)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Lateral (attached at margin)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Sessile (missing)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `stem_shapes`
--

CREATE TABLE `stem_shapes` (
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
-- Dumping data for table `stem_shapes`
--

INSERT INTO `stem_shapes` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Terete (round)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Compressed (flattened)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Equal', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Clavate (club)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Radicating (w/\"root\")', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Flexous', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Ventricose Fusiform', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Tapering', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'Abruptly bulbous', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'Rounded', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(12, 'Oblique (angle)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(13, 'Marginate', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

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

-- --------------------------------------------------------

--
-- Table structure for table `stem_textures`
--

CREATE TABLE `stem_textures` (
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
-- Dumping data for table `stem_textures`
--

INSERT INTO `stem_textures` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Fragile', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Pliable', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Chalky', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Rigid', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Fibrous (Fleshy-Fibrous)', 'usually rather thick, and when broken in two, leaves a ragged edge.', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Cartilaginous', 'Common stipe, usually thin and breaks with a firm split when bent in two, similar to cartilage.', '', 13, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Firm', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Woody', '', '', 13, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'Corky', '', '', 13, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(11, 'Leathery (coriaceous)', '', '', 13, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(12, 'Chalky', 'feels and breaks like chalk in hand. When crushed, it breaks up into powder or chunks.', '', 13, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(13, 'Breaking with a snap', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `synonyms`
--

CREATE TABLE `synonyms` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `synonym_with` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` int NOT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `synonyms`
--

INSERT INTO `synonyms` (`id`, `name`, `synonym_with`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'epigeous', 'above-ground', '', 25, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(2, 'hypogeous', 'underground', '', 25, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(3, 'mushroom', 'fruiting body of a fungus', 'Page 7 of source', 13, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(4, 'basidiocarp', 'fruiting body', '', 25, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(5, 'thallus', 'soma', 'entire body of fungus - page 27 of source', 1, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(6, 'sporocarp', 'fruiting body', 'page 1 of source', 10, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(7, 'pileus', 'cap', 'page 7 of source', 10, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(8, 'Stipe', 'Stalk', 'page 7 of source', 10, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(9, 'Gills', 'Lamellae', 'page 3 of source', 10, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(10, 'Volva', 'cup', 'page 3 of source', 10, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(11, 'Annulus', 'ring', 'page 3 of source', 10, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(12, 'cone', 'conical', '', 5, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(13, 'conic', 'conical', '', 5, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(14, 'disc', 'center', '', 5, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(15, 'margin', 'edge', '', 5, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(16, 'ring', 'annulus', '', 5, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(17, 'stem', 'stipe', '', 5, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(18, 'volva', 'cup', '', 5, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(19, 'convex', 'evenly rounded', '', 5, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(20, 'ovoid', 'egg', '', 5, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(21, 'campanulate', 'bell-shaped', '', 5, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(22, 'parabolic', 'half-egg', '', 5, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(23, 'pulvinate', 'cushion', '', 5, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(24, 'cylindric', 'bullet', '', 5, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00'),
(25, 'plane', 'flat', '', 5, 1, '2024-05-18 11:00:00', '2024-05-18 11:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tastes`
--

CREATE TABLE `tastes` (
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
-- Dumping data for table `tastes`
--

INSERT INTO `tastes` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'None', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Mild', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Bitter', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Acrid (=puckery? astringent)/Peppery', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Agreeable', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Farinaceous (like fresh meal)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `toxics`
--

CREATE TABLE `toxics` (
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
-- Dumping data for table `toxics`
--

INSERT INTO `toxics` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Not Toxic', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Toxic', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `universal_outer_veil_appearances`
--

CREATE TABLE `universal_outer_veil_appearances` (
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
-- Dumping data for table `universal_outer_veil_appearances`
--

INSERT INTO `universal_outer_veil_appearances` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Two Rings (from 2 veils)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Doubly-flared Ring', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, '\"Cogwheel\" Stellate', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Floccose (downy tuffs)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(6, 'Cortinate PV & Fibrillose Annular Zone', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(7, 'Single Ring thick on edge', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(8, 'Pendant (hanging)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(9, 'Subperonate', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(10, 'Peronate (w/\"boot\")', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `universal_outer_veil_fates`
--

CREATE TABLE `universal_outer_veil_fates` (
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
-- Dumping data for table `universal_outer_veil_fates`
--

INSERT INTO `universal_outer_veil_fates` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Disappearing', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Leaving fragments on cap', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `universal_outer_veil_textures`
--

CREATE TABLE `universal_outer_veil_textures` (
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
-- Dumping data for table `universal_outer_veil_textures`
--

INSERT INTO `universal_outer_veil_textures` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 23, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(2, 'Membranous (skin-like)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(3, 'Cortinate (cobwebby)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(4, 'Fibillose (thready)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00'),
(5, 'Gelatinous (slimy)', '', '', 5, 1, '2024-03-01 21:00:00', '2024-03-01 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Will Johnston', 'willgb54@yahoo.com', NULL, '$2y$12$ZEnI5IelSazH2j1XgC.zS.65NEKEHdoDL7A.bGmZ9CUVo3k1OiIbW', NULL, NULL, NULL, '9PSzFpODVLhq3hrBMtB0AdZ3sw5wlEhrRlfkl8Rwm6ICwTgtPy5GCV8YyEfT', NULL, NULL, '2024-05-17 23:58:59', '2024-05-17 23:58:59');

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abundances`
--
ALTER TABLE `abundances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `annulus_positions`
--
ALTER TABLE `annulus_positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulb_types`
--
ALTER TABLE `bulb_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cap_context_flesh_textures`
--
ALTER TABLE `cap_context_flesh_textures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cap_margin_shapes`
--
ALTER TABLE `cap_margin_shapes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cap_margin_types`
--
ALTER TABLE `cap_margin_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cap_shapes`
--
ALTER TABLE `cap_shapes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cap_shape_top_views`
--
ALTER TABLE `cap_shape_top_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cap_surface_dryness`
--
ALTER TABLE `cap_surface_dryness`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cap_surface_textures`
--
ALTER TABLE `cap_surface_textures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chem_reactions`
--
ALTER TABLE `chem_reactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_sources`
--
ALTER TABLE `data_sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_source_data_types`
--
ALTER TABLE `data_source_data_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `display_options`
--
ALTER TABLE `display_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `epithets`
--
ALTER TABLE `epithets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fungus_types`
--
ALTER TABLE `fungus_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genus`
--
ALTER TABLE `genus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gill_attachments`
--
ALTER TABLE `gill_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gill_breadths`
--
ALTER TABLE `gill_breadths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gill_context_flesh_latex_abundances`
--
ALTER TABLE `gill_context_flesh_latex_abundances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gill_edges`
--
ALTER TABLE `gill_edges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gill_miscs`
--
ALTER TABLE `gill_miscs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gill_spacings`
--
ALTER TABLE `gill_spacings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gill_thickness`
--
ALTER TABLE `gill_thickness`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `habitats`
--
ALTER TABLE `habitats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `habits`
--
ALTER TABLE `habits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images_thumbnails`
--
ALTER TABLE `images_thumbnails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lens`
--
ALTER TABLE `lens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_list_clusters`
--
ALTER TABLE `member_list_clusters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_list_groups`
--
ALTER TABLE `member_list_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_types`
--
ALTER TABLE `member_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `odors`
--
ALTER TABLE `odors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partial_inner_veil_appearances`
--
ALTER TABLE `partial_inner_veil_appearances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partial_inner_veil_fates`
--
ALTER TABLE `partial_inner_veil_fates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partial_inner_veil_textures`
--
ALTER TABLE `partial_inner_veil_textures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partial_inter_veil_annulus_ring_positions`
--
ALTER TABLE `partial_inter_veil_annulus_ring_positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plants`
--
ALTER TABLE `plants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plant_associations`
--
ALTER TABLE `plant_associations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `possible_matches`
--
ALTER TABLE `possible_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preservation_methods`
--
ALTER TABLE `preservation_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `soil_types`
--
ALTER TABLE `soil_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specimens`
--
ALTER TABLE `specimens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specimen_ages`
--
ALTER TABLE `specimen_ages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specimen_characters`
--
ALTER TABLE `specimen_characters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specimen_clusters`
--
ALTER TABLE `specimen_clusters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specimen_groups`
--
ALTER TABLE `specimen_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specimen_locations_now`
--
ALTER TABLE `specimen_locations_now`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stem_interiors`
--
ALTER TABLE `stem_interiors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stem_locations`
--
ALTER TABLE `stem_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stem_shapes`
--
ALTER TABLE `stem_shapes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stem_surfaces`
--
ALTER TABLE `stem_surfaces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stem_textures`
--
ALTER TABLE `stem_textures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `synonyms`
--
ALTER TABLE `synonyms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tastes`
--
ALTER TABLE `tastes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `toxics`
--
ALTER TABLE `toxics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `universal_outer_veil_appearances`
--
ALTER TABLE `universal_outer_veil_appearances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `universal_outer_veil_fates`
--
ALTER TABLE `universal_outer_veil_fates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `universal_outer_veil_textures`
--
ALTER TABLE `universal_outer_veil_textures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `veils`
--
ALTER TABLE `veils`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abundances`
--
ALTER TABLE `abundances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `annulus_positions`
--
ALTER TABLE `annulus_positions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bulb_types`
--
ALTER TABLE `bulb_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cap_context_flesh_textures`
--
ALTER TABLE `cap_context_flesh_textures`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cap_margin_shapes`
--
ALTER TABLE `cap_margin_shapes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cap_margin_types`
--
ALTER TABLE `cap_margin_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cap_shapes`
--
ALTER TABLE `cap_shapes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `cap_shape_top_views`
--
ALTER TABLE `cap_shape_top_views`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cap_surface_dryness`
--
ALTER TABLE `cap_surface_dryness`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cap_surface_textures`
--
ALTER TABLE `cap_surface_textures`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `chem_reactions`
--
ALTER TABLE `chem_reactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `data_sources`
--
ALTER TABLE `data_sources`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `data_source_data_types`
--
ALTER TABLE `data_source_data_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `display_options`
--
ALTER TABLE `display_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `epithets`
--
ALTER TABLE `epithets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fungus_types`
--
ALTER TABLE `fungus_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `genus`
--
ALTER TABLE `genus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `gill_attachments`
--
ALTER TABLE `gill_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `gill_breadths`
--
ALTER TABLE `gill_breadths`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gill_context_flesh_latex_abundances`
--
ALTER TABLE `gill_context_flesh_latex_abundances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gill_edges`
--
ALTER TABLE `gill_edges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `gill_miscs`
--
ALTER TABLE `gill_miscs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gill_spacings`
--
ALTER TABLE `gill_spacings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gill_thickness`
--
ALTER TABLE `gill_thickness`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `habitats`
--
ALTER TABLE `habitats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `habits`
--
ALTER TABLE `habits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images_thumbnails`
--
ALTER TABLE `images_thumbnails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lens`
--
ALTER TABLE `lens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `member_list_clusters`
--
ALTER TABLE `member_list_clusters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `member_list_groups`
--
ALTER TABLE `member_list_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `member_types`
--
ALTER TABLE `member_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `odors`
--
ALTER TABLE `odors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `partial_inner_veil_appearances`
--
ALTER TABLE `partial_inner_veil_appearances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `partial_inner_veil_fates`
--
ALTER TABLE `partial_inner_veil_fates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `partial_inner_veil_textures`
--
ALTER TABLE `partial_inner_veil_textures`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `partial_inter_veil_annulus_ring_positions`
--
ALTER TABLE `partial_inter_veil_annulus_ring_positions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `parts`
--
ALTER TABLE `parts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plants`
--
ALTER TABLE `plants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plant_associations`
--
ALTER TABLE `plant_associations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `possible_matches`
--
ALTER TABLE `possible_matches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `preservation_methods`
--
ALTER TABLE `preservation_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `soil_types`
--
ALTER TABLE `soil_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `species`
--
ALTER TABLE `species`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `specimens`
--
ALTER TABLE `specimens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specimen_ages`
--
ALTER TABLE `specimen_ages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `specimen_characters`
--
ALTER TABLE `specimen_characters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specimen_clusters`
--
ALTER TABLE `specimen_clusters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specimen_groups`
--
ALTER TABLE `specimen_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `specimen_locations_now`
--
ALTER TABLE `specimen_locations_now`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `stem_interiors`
--
ALTER TABLE `stem_interiors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stem_locations`
--
ALTER TABLE `stem_locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stem_shapes`
--
ALTER TABLE `stem_shapes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `stem_surfaces`
--
ALTER TABLE `stem_surfaces`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `stem_textures`
--
ALTER TABLE `stem_textures`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `synonyms`
--
ALTER TABLE `synonyms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tastes`
--
ALTER TABLE `tastes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `toxics`
--
ALTER TABLE `toxics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `universal_outer_veil_appearances`
--
ALTER TABLE `universal_outer_veil_appearances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `universal_outer_veil_fates`
--
ALTER TABLE `universal_outer_veil_fates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `universal_outer_veil_textures`
--
ALTER TABLE `universal_outer_veil_textures`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `veils`
--
ALTER TABLE `veils`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

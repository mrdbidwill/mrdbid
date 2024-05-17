-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 08, 2024 at 04:16 PM
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
-- Database: `u193265667_mrdbid_php`
--

-- --------------------------------------------------------


INSERT INTO `abundances` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '23', 1, '2024-05-08 06:00:00'),
(2, 'None', '', '', '23', 1, '2024-05-08 06:00:00'),
(3, 'Low', '', '', '23', 1, '2024-05-08 06:00:00'),
(4, 'Moderate', '', '', '23', 1, '2024-05-08 06:00:00'),
(5, 'High', '', '', '23', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `annulus_positions` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Superior', 'Near the cap', '', '7', 1, '2024-05-08 06:00:00'),
(3, 'Apical', 'upper half', '', '7', 1, '2024-05-08 06:00:00'),
(4, 'Median', 'in the middle', '', '7', 1, '2024-05-08 06:00:00'),
(5, 'Inferior', 'Lower half', '', '7', 1, '2024-05-08 06:00:00'),
(6, 'Basal', 'Near the base', '', '7', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `bulb_types` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Napiform (turnip)', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Saccate', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Sheathing', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Collar', '', '', '5', 1, '2024-05-08 06:00:00'),
(6, 'Granular', '', '', '5', 1, '2024-05-08 06:00:00'),
(7, 'Concentric rings or scales', '', '', '5', 1, '2024-05-08 06:00:00'),
(8, 'Friable, disappearing', '', '', '5', 1, '2024-05-08 06:00:00'),
(9, 'Fusiform', '', '', '5', 1, '2024-05-08 06:00:00'),
(10, 'Marginate-depressed', '', '', '5', 1, '2024-05-08 06:00:00'),
(11, 'Cleft', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `cap_context_flesh_textures` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', 5, 2, '2024-05-08 06:00:00'),
(2, 'Soft', '', '', 5, 2, '2024-05-08 06:00:00'),
(3, 'Spongy', '', '', 5, 2, '2024-05-08 06:00:00'),
(4, 'Firm', '', '', 5, 2, '2024-05-08 06:00:00'),
(5, 'Compact', '', '', 5, 2, '2024-05-08 06:00:00'),
(6, 'Rigid', '', '', 5, 2, '2024-05-08 06:00:00'),
(7, 'Brittle', '', '', 5, 2, '2024-05-08 06:00:00'),
(8, 'Corky', '', '', 5, 2, '2024-05-08 06:00:00'),
(9, 'Other', '', '', 5, 2, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `cap_margin_shapes` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Straight', 'The margins remain uniform and do not curve.', 'edited 3-8-2023', '7', 2, '2024-05-08 06:00:00'),
(3, 'Decurved', 'The margins curve slightly downwards.', '', '7', 1, '2024-05-08 06:00:00'),
(4, 'Incurved', 'The margins curve down and inwards.', '', '7', 1, '2024-05-08 06:00:00'),
(5, 'Involute', 'The margins curve downwards and roll inwards. Also known as inrolled.', '', '7', 1, '2024-05-08 06:00:00'),
(6, 'Arched', 'The margins curve upwards between the edge and stipe (stem).', '', '7', 1, '2024-05-08 06:00:00'),
(7, 'Uplifted', 'The margins curve upwards. Also known as elevated.', '', '7', 1, '2024-05-08 06:00:00'),
(8, 'Revolute', 'The margins curve inwards and also rolled back..', '', '7', 1, '2024-05-08 06:00:00'),
(9, 'Exceeding', 'The margins extend past the gills.', '', '7', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `cap_margin_types` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Entire', 'There is a smooth transition from the top of the cap to its underside. No irregular attributes should be present on the edges. Also referred to as Smooth, Even, Seamless, Flush, or Regular.', '', '7', 1, '2024-05-08 06:00:00'),
(3, 'Appendiculate', 'Remnants of a partial veil hang from the edge of the cap.', '', '7', 1, '2024-05-08 06:00:00'),
(4, 'Striate', 'Fine and narrow stripes run parallel on the cap margins. The lines will often coincide with the gills underneath the cap. In some cases, the lines are only visible when the cap is wet. Also referred to as striped, furrowed, streaked, ribbed, lined,', '', '7', 1, '2024-05-08 06:00:00'),
(5, 'Sulcate', 'Narrow parallel grooves that line the margins of the cap. Sulcate margins are more defined than striate but less ridged than plicated. Also referred to as plicate-striate.', '', '7', 1, '2024-05-08 06:00:00'),
(6, 'Plicate', 'Parallel pleated margins. They are best described as fan-like or umbrella-like as if the surface of the cap were folded. Plicate margins are more defined and ridged than Striate or Sulcate. Also referred to as pleated or ridged.', '', '7', 1, '2024-05-08 06:00:00'),
(7, 'Eroded', 'Deteriorated, gnawed, or eaten away. The disfigured margins are usually found in older specimens and are the result of insects or deliquescence (common with Ink Caps). Also referred to as gnawed or ragged.', '', '7', 1, '2024-05-08 06:00:00'),
(8, 'Split', 'The edges of the cap are split apart or full of large crevices. Also referred to as cracked or rimose.', '', '7', 1, '2024-05-08 06:00:00'),
(9, 'Lacerate', 'Many tears mark the edge of the cap. Similar to split margins, however, the cuts are smaller and more frequent. Also referred to as torn.', '', '7', 1, '2024-05-08 06:00:00'),
(10, 'Undulating - Hairy', 'Hairy - The edges of the cap form a wave-like pattern as they rise and fall. Also referred to as wavy irregular or festoony.', '', '7', 1, '2024-05-08 06:00:00'),
(11, 'Crenate - Hairy', 'Hairy - Semi-circle notches or round-toothed edges that are more blunted than serrate margins. Also referred to as scalloped.', '', '7', 1, '2024-05-08 06:00:00'),
(12, 'Serrate - Hairy', 'Hairy - The edges of the cap appear jagged and saw-toothed. More pronounced than crenate margins.', '', '7', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `cap_shapes` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', 7, 1, '2024-05-08 06:00:00'),
(2, 'Convex', 'evenly rounded', '', 5, 1, '2024-05-08 06:00:00'),
(3, 'Convex', 'evenly rounded', '', 5, 1, '2024-05-08 06:00:00'),
(4, 'ovoid', 'egg', '', 5, 1, '2024-05-08 06:00:00'),
(5, 'conic', 'cone', '', 5, 1, '2024-05-08 06:00:00'),
(6, 'campanulate', 'bell-shaped.', 'vv', 5, 1, '2024-05-08 06:00:00'),
(7, 'parabolic', 'half-egg', '', 5, 1, '2024-05-08 06:00:00'),
(8, 'pulvinate', 'cushion', '', 5, 1, '2024-05-08 06:00:00'),
(9, 'cylindric', 'bullet', '', 5, 1, '2024-05-08 06:00:00'),
(10, 'plane', 'flat', '', 5, 1, '2024-05-08 06:00:00'),
(11, 'conchate', 'sea-shell', '', 5, 1, '2024-05-08 06:00:00'),
(12, 'umbonate', 'w/bump', '', 5, 1, '2024-05-08 06:00:00'),
(13, 'cuspidate', 'Umbonate with a pointy conical apex; Witch-hat shaped. also known as eye-tooth.', '', 5, 1, '2024-05-08 06:00:00'),
(14, 'papillate', 'w/nipple', '', 5, 1, '2024-05-08 06:00:00'),
(15, 'depressed', 'Saucer-shaped; The center is lower than the cap margin.', '', 5, 1, '2024-05-08 06:00:00'),
(16, 'umbilicate', 'a navel-like depression in the center.', '', 5, 1, '2024-05-08 06:00:00'),
(17, 'infundibuliform', 'funnel-shaped', '', 5, 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `cap_shape_top_views` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '5', 2, '2024-05-08 06:00:00'),
(2, 'Petaloid', 'petal', '', '5', 2, '2024-05-08 06:00:00'),
(3, 'Spathulate', 'spatula', '', '5', 2, '2024-05-08 06:00:00'),
(4, 'Dimidiate', '1/2 circle', '', '5', 2, '2024-05-08 06:00:00'),
(5, 'Flabelliform', 'fan-shaped', '', '5', 2, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `cap_surface_dryness` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '5', 2, '2024-05-08 06:00:00'),
(2, 'dry: Dull', '', '', '5', 2, '2024-05-08 06:00:00'),
(3, 'dry:  Silky', '', '', '5', 2, '2024-05-08 06:00:00'),
(4, 'Moist:  lubricous/greasy', '', '', '5', 2, '2024-05-08 06:00:00'),
(5, 'Moist: Viscid/sticky/tacky', '', '', '5', 2, '2024-05-08 06:00:00'),
(6, 'Moist: Glutinous (slimy)', '', '', '5', 2, '2024-05-08 06:00:00'),
(7, 'dry: Shiny', '', '', '5', 2, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `cap_surface_textures` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Smooth', 'No defining features found on the surface.', '', '7', 1, '2024-05-08 06:00:00'),
(3, 'Uneven', 'A bumpy surface.', '', '7', 1, '2024-05-08 06:00:00'),
(4, 'Rugose', 'A wrinkled or rough surface.', '', '7', 1, '2024-05-08 06:00:00'),
(5, 'Rugulose', 'A slightly wrinkled surface.', '', '7', 1, '2024-05-08 06:00:00'),
(6, 'Rivulose', 'A thinly wrinkled surface of branching wavy or crooked lines.', '', '7', 1, '2024-05-08 06:00:00'),
(7, 'Scrobiculate', 'A pitted or furrowed surface.', '', '7', 1, '2024-05-08 06:00:00'),
(8, 'Warty', 'Remnants of the universal veil remain on the surface in small patches.', '', '7', 1, '2024-05-08 06:00:00'),
(9, 'Virgate', 'A streaked surface.', '', '7', 1, '2024-05-08 06:00:00'),
(10, 'Hygrophanous', 'A surface that is transparent when wet and opaque when dry.', '', '7', 1, '2024-05-08 06:00:00'),
(11, 'Sericeous', 'A silky surface.', '', '7', 1, '2024-05-08 06:00:00'),
(12, 'Fibrillose', 'A surface covered in thread-like filaments.', '', '7', 1, '2024-05-08 06:00:00'),
(13, 'Squamose', 'A surface covered with scales.', '', '7', 1, '2024-05-08 06:00:00'),
(14, 'Squarrose', 'A ragged surface covered with small scales.', '', '7', 1, '2024-05-08 06:00:00'),
(15, 'Pruinose', 'A surface covered with a white powdery frostlike substance.', '', '7', 1, '2024-05-08 06:00:00'),
(16, 'Pulverulent', 'A surface covered with fine dust or powder.', '', '7', 1, '2024-05-08 06:00:00'),
(17, 'Granulose', 'A surface covered in salt-like granulates.', '', '7', 1, '2024-05-08 06:00:00'),
(18, 'Furfuraceous', 'A surface covered in flaky bran-like particles; dandruff-like.', '', '7', 1, '2024-05-08 06:00:00'),
(19, 'Zonate', 'A surface containing zones or bands that are distinguished by texture or color.', '', '7', 1, '2024-05-08 06:00:00'),
(20, 'Areolate', 'A cracked surface resembling dried-mud or paint.', '', '7', 1, '2024-05-08 06:00:00'),
(21, 'Rimose', 'A surface covered in cracks and crevices.', '', '7', 1, '2024-05-08 06:00:00'),
(22, 'Laccate', 'A waxy or lacquered surface texture.', '', '7', 1, '2024-05-08 06:00:00'),
(23, 'Viscid -', 'A sticky glue-like surface texture.', '', '7', 1, '2024-05-08 06:00:00'),
(24, 'Glutinous', 'A slimy surface.', '', '7', 1, '2024-05-08 06:00:00'),
(25, 'Glabrous - Hairy', 'Hairy - a bald surface.', '', '7', 1, '2024-05-08 06:00:00'),
(26, 'Velvety - Hairy', 'Hairy - A surface covered with very fine and soft hairs.', '', '7', 1, '2024-05-08 06:00:00'),
(27, 'Pubescent - Hairy', 'Hairy - A surface cover with fuzz or fine hairs.', '', '7', 1, '2024-05-08 06:00:00'),
(28, 'Canescent - Hairy', 'Hairy - A surface covered in dense white or gray down-like hairs. Giving a frosted appearance.', '', '7', 1, '2024-05-08 06:00:00'),
(29, 'Floccose - Hairy', 'Hairy - A surface covered in Wooly or cotton-like hairs.', '', '7', 1, '2024-05-08 06:00:00'),
(30, 'Tomentose - Hairy', 'Hairy - A surface covered densely with matted hairs.', '', '7', 1, '2024-05-08 06:00:00'),
(31, 'Hispid - Hairy', 'Hairy - A surface covered with straight bristle-like hairs.', '', '7', 1, '2024-05-08 06:00:00'),
(32, 'Hirsute - Hairy', 'Hairy - A surface covered with slightly stiff and shaggy hairs.', '', '7', 1, '2024-05-08 06:00:00'),
(33, 'Villose - Hairy', 'Hairy - A surface covered with long soft hairs.', '', '7', 1, '2024-05-08 06:00:00'),
(34, 'Strigose - Hairy', 'Hairy - A surface covered with long bristle-like hairs.', '', '7', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `characters` (`id`, `name`, `display_options`, `look_up_y_n`, `part`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'id', 4, 0, 2, 23, 1, '2024-05-08 06:00:00'),
(3, 'specimen_age', 9, 1, 16, 23, 1, '2024-05-08 06:00:00'),
(4, 'odor', 9, 1, 16, 23, 1, '2024-05-08 06:00:00'),
(5, 'taste', 9, 1, 16, 23, 1, '2024-05-08 06:00:00'),
(6, 'toxic', 9, 1, 16, 23, 1, '2024-05-08 06:00:00'),
(7, 'habit', 9, 1, 11, 23, 1, '2024-05-08 06:00:00'),
(8, 'cap_width', 2, 0, 3, 23, 1, '2024-05-08 06:00:00'),
(9, 'cap_height', 2, 0, 3, 23, 1, '2024-05-08 06:00:00'),
(10, 'cap_shape', 9, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(11, 'cap_shape_top_view', 9, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(12, 'cap_color', 6, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(13, 'cap_color_disc', 6, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(14, 'cap_color_margin', 6, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(15, 'cap_color_background', 6, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(16, 'cap_color_fibrils', 6, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(17, 'cap_color_bruised', 6, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(18, 'cap_color_wet', 6, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(19, 'cap_color_dry', 6, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(20, 'cap_surface_dryness', 9, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(21, 'cap_surface_texture', 9, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(22, 'cap_margin_shape', 9, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(23, 'cap_margin_type', 9, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(24, 'cap_hairy_y_n', 9, 0, 3, 23, 1, '2024-05-08 06:00:00'),
(25, 'cap_context_flesh_color_moist', 6, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(26, 'cap_context_flesh_color_dry', 6, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(27, 'cap_context_flesh_color_cuticle', 6, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(28, 'cap_context_flesh_thickness_disc', 2, 0, 3, 23, 1, '2024-05-08 06:00:00'),
(29, 'cap_context_flesh_thickness_margin', 2, 0, 3, 23, 1, '2024-05-08 06:00:00'),
(30, 'cap_context_flesh_texture', 9, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(31, 'cap_context_flesh_latex_color', 6, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(32, 'cap_context_flesh_latex_color_exposed', 6, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(33, 'cap_context_flesh_latex_taste', 7, 1, 3, 23, 1, '2024-05-08 06:00:00'),
(34, 'cap_context_flesh_latex_abundance', 9, 0, 3, 23, 1, '2024-05-08 06:00:00'),
(35, 'gill_attachment', 9, 1, 4, 23, 1, '2024-05-08 06:00:00'),
(36, 'gill_breadth', 2, 1, 4, 23, 1, '2024-05-08 06:00:00'),
(37, 'gill_thickness', 2, 1, 4, 23, 1, '2024-05-08 06:00:00'),
(38, 'gill_spacing', 9, 1, 4, 23, 1, '2024-05-08 06:00:00'),
(39, 'gill_color_young', 6, 1, 4, 23, 1, '2024-05-08 06:00:00'),
(40, 'gill_color_mature', 6, 1, 4, 23, 1, '2024-05-08 06:00:00'),
(41, 'gill_edges', 9, 1, 4, 23, 1, '2024-05-08 06:00:00'),
(42, 'gill_misc_waxy_y_n', 9, 0, 4, 23, 1, '2024-05-08 06:00:00'),
(43, 'gill_misc_arid_dry_y_n', 9, 0, 4, 23, 1, '2024-05-08 06:00:00'),
(44, 'gill_misc_deliquescent_y_n', 9, 0, 4, 23, 1, '2024-05-08 06:00:00'),
(45, 'stem_location', 9, 1, 5, 23, 1, '2024-05-08 06:00:00'),
(46, 'stem_height', 2, 0, 5, 23, 1, '2024-05-08 06:00:00'),
(47, 'stem_diameter_top', 2, 0, 5, 23, 1, '2024-05-08 06:00:00'),
(48, 'stem_diameter_mid', 2, 0, 5, 23, 1, '2024-05-08 06:00:00'),
(49, 'stem_diameter_low', 2, 0, 5, 23, 1, '2024-05-08 06:00:00'),
(50, 'stem_shape', 9, 1, 5, 23, 1, '2024-05-08 06:00:00'),
(51, 'stem_color', 6, 1, 5, 23, 1, '2024-05-08 06:00:00'),
(52, 'stem_color_change', 6, 1, 5, 23, 1, '2024-05-08 06:00:00'),
(53, 'stem_color_base', 6, 1, 5, 23, 1, '2024-05-08 06:00:00'),
(54, 'stem_color_apex', 6, 1, 5, 23, 1, '2024-05-08 06:00:00'),
(55, 'stem_color_interior', 6, 1, 5, 23, 1, '2024-05-08 06:00:00'),
(56, 'stem_color_exterior', 6, 1, 5, 23, 1, '2024-05-08 06:00:00'),
(57, 'stem_color_bruise', 6, 1, 5, 23, 1, '2024-05-08 06:00:00'),
(58, 'stem_surface', 9, 1, 5, 23, 1, '2024-05-08 06:00:00'),
(59, 'stem_texture', 9, 1, 5, 23, 1, '2024-05-08 06:00:00'),
(60, 'stem_interior', 9, 1, 5, 23, 1, '2024-05-08 06:00:00'),
(61, 'partial_inner_veil_annulus_ring_position', 9, 0, 6, 23, 1, '2024-05-08 06:00:00'),
(62, 'veil_annulus', 9, 0, 6, 23, 1, '2024-05-08 06:00:00'),
(63, 'partial_inner_veil_color', 6, 1, 6, 23, 1, '2024-05-08 06:00:00'),
(64, 'partial_inner_veil_texture', 9, 1, 6, 23, 1, '2024-05-08 06:00:00'),
(65, 'partial_inner_veil_fate', 9, 1, 6, 23, 1, '2024-05-08 06:00:00'),
(66, 'partial_inner_veil_annular_ring', 9, 0, 6, 23, 1, '2024-05-08 06:00:00'),
(67, 'partial_inner_veil_appearance', 9, 1, 6, 23, 1, '2024-05-08 06:00:00'),
(68, 'universal_outer_veil_description', 9, 0, 6, 23, 1, '2024-05-08 06:00:00'),
(69, 'universal_outer_veil_volva', 9, 0, 6, 23, 1, '2024-05-08 06:00:00'),
(70, 'bulb_type', 9, 1, 6, 23, 1, '2024-05-08 06:00:00'),
(71, 'mycelium_color', 6, 1, 7, 23, 1, '2024-05-08 06:00:00'),
(72, 'mycelium_texture', 9, 0, 7, 23, 1, '2024-05-08 06:00:00'),
(73, 'spore_color', 6, 1, 8, 23, 1, '2024-05-08 06:00:00'),
(74, 'spore_range_low', 8, 0, 8, 23, 1, '2024-05-08 06:00:00'),
(75, 'spore_range_high', 8, 0, 8, 23, 1, '2024-05-08 06:00:00'),
(76, 'habitat', 9, 1, 11, 23, 1, '2024-05-08 06:00:00'),
(77, 'soil_type', 9, 1, 11, 23, 1, '2024-05-08 06:00:00'),
(78, 'soil_temp', 4, 0, 11, 23, 1, '2024-05-08 06:00:00'),
(79, 'air_temp', 4, 0, 11, 23, 1, '2024-05-08 06:00:00'),
(80, 'plant_association', 9, 1, 11, 23, 1, '2024-05-08 06:00:00'),
(81, 'rhizomorph_color', 6, 1, 12, 23, 1, '2024-05-08 06:00:00'),
(82, 'rhizomorph_texture', 9, 0, 12, 23, 1, '2024-05-08 06:00:00'),
(83, 'chem_reaction', 9, 1, 13, 23, 1, '2024-05-08 06:00:00'),
(84, 'weight_before_dry', 4, 0, 17, 23, 1, '2024-05-08 06:00:00'),
(85, 'weight_after_dry', 4, 0, 17, 23, 1, '2024-05-08 06:00:00'),
(86, 'elevation', 4, 0, 11, 23, 1, '2024-05-08 06:00:00'),
(87, 'soil_ph', 4, 0, 11, 23, 1, '2024-05-08 06:00:00'),
(88, 'stipe_latex_color_exposed', 6, 1, 5, 23, 1, '2024-05-08 06:00:00'),
(89, 'stipe_latex_taste', 7, 1, 5, 23, 1, '2024-05-08 06:00:00'),
(90, 'stipe_latex_abundance', 17, 1, 5, 23, 1, '2024-05-08 06:00:00'),
(91, 'Mycobank_name', 5, 0, 16, 23, 1, '2024-05-08 06:00:00'),
(92, 'inaturalist_num', 5, 0, 16, 23, 1, '2024-05-08 06:00:00'),
(93, 'mushroom_observer_num', 5, 0, 16, 23, 1, '2024-05-08 06:00:00'),
(94, 'location_found_latitude', 5, 0, 15, 23, 1, '2024-05-08 06:00:00'),
(95, 'location_found_longitude', 5, 0, 15, 23, 1, '2024-05-08 06:00:00'),
(96, 'project', 9, 0, 16, 23, 1, '2024-05-08 06:00:00'),
(97, 'microscoped_slides_included', 9, 0, 17, 23, 1, '2024-05-08 06:00:00'),
(98, 'preservation_method', 9, 1, 17, 23, 1, '2024-05-08 06:00:00'),
(99, 'genus', 9, 1, 16, 23, 1, '2024-05-08 06:00:00'),
(100, 'species', 9, 1, 16, 23, 1, '2024-05-08 06:00:00'),
(101, 'annulus_position', 9, 9, 6, 23, 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `chem_reactions` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '23', 23, '2024-05-08 06:00:00'),
(2, 'Ammonia (NH4OH, Ammonium Hydroxide)', '', '', '8', 23, '2024-05-08 06:00:00'),
(3, 'KOH (Potassium Hydroxide) - 3%', '', '', '8', 23, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `colors` (`id`, `latin_name`, `common_name`, `color_group`, `hex`, `sequence`, `r_val`, `g_val`, `b_val`, `closest_websafe_color`, `cwc_r`, `cwc_g`, `cwc_b`, `image_file`) VALUES
(0, 'Not Entered', 'Not Entered', NULL, NULL, 0, 1, 1, 1, 'None', 0, 0, 0, ''),
(1, 'Albus', 'White', '1', 'FFFFFF', 1, 255, 255, 255, 'White', 255, 255, 255, '../images/AMS_colors/colors/color_1.jpg'),
(2, 'Griseus', 'Grullo', '50', 'A9A292', 53, 169, 162, 146, 'Manatee', 0, 0, 0, '../images/AMS_colors/colors/color_2.jpg'),
(3, 'Murinus', 'Shadow', '50', '857C6B', 55, 133, 124, 107, 'Copper Rose', 0, 0, 0, '../images/AMS_colors/colors/color_3.jpg'),
(4, 'Ater', 'Dark Lava', '50', '4B4435', 57, 75, 68, 53, 'Olive Drab', 0, 0, 0, '../images/AMS_colors/colors/color_4.jpg'),
(5, 'Niger', 'Black', '99', '000000', 99, 0, 0, 0, 'Black', 0, 0, 0, '../images/AMS_colors/colors/color_5.jpg'),
(6, 'Fumosus', 'Pastel Brown', '50', '7E6455', 56, 126, 100, 85, 'Dim Gray', 0, 0, 0, '../images/AMS_colors/colors/color_6.jpg'),
(7, 'Avellaneus', 'Cafe au lait', '70', 'A97848', 72, 169, 120, 72, 'Raw Umber', 0, 0, 0, '../images/AMS_colors/colors/color_7.jpg'),
(8, 'Isabellinus', 'Ruddy Brown', '70', 'BF7029', 74, 194, 112, 41, 'Ruddy Brown', 0, 0, 0, '../images/AMS_colors/colors/color_8.jpg'),
(9, 'Umbrinus', 'Sepia', '70', '6E4116', 77, 110, 65, 22, 'Chocolate', 0, 0, 0, '../images/AMS_colors/colors/color_9.jpg'),
(10, 'Castaneus', 'Caput Mortuum', '70', '5E2914', 80, 94, 41, 20, 'Chocolate', 0, 0, 0, '../images/AMS_colors/colors/color_10.jpg'),
(11, 'Fuligineus', 'Zinnwaldite Brown', '70', '391401', 82, 57, 20, 1, 'Bulgarian Rose', 0, 0, 0, '../images/AMS_colors/colors/color_11.jpg'),
(12, 'Atropurpureus', 'Bulgarian Rose', '70', '4E0F0F', 84, 78, 15, 15, 'Rosewood', 0, 0, 0, '../images/AMS_colors/colors/color_12.jpg'),
(13, 'Purpureus', 'OU Crimson Red', '10', '940101', 10, 148, 1, 1, 'OU Crimson Red', 0, 0, 0, '../images/AMS_colors/colors/color_13.jpg'),
(14, 'Ruber', 'Rosso Corsa', '10', 'D30102', 30, 211, 1, 2, 'Boston University Red', 0, 0, 0, '../images/AMS_colors/colors/color_14.jpg'),
(15, 'Miniatus', 'Coquelicot', '10', 'F73601', 40, 247, 54, 1, 'Coquelicot', 0, 0, 0, '../images/AMS_colors/colors/color_15.jpg'),
(16, 'Incarnatus', 'Deep Carrot Orange', '10', 'ED7236', 70, 237, 114, 54, 'Portland Orange', 0, 0, 0, '../images/AMS_colors/colors/color_16.jpg'),
(17, 'Roseus', 'Light Salmon', '10', 'F39F7C', 90, 243, 159, 124, 'Atomic Tangerine', 0, 0, 0, '../images/AMS_colors/colors/color_17.jpg'),
(18, 'Testaceus', 'Flame', '10', 'DA5110', 50, 218, 81, 16, 'Tenne (Tawny)', 0, 0, 0, '../images/AMS_colors/colors/color_18.jpg'),
(19, 'Latericius', 'Sienna', '10', '97280A', 20, 151, 40, 10, 'Brown', 0, 0, 0, '../images/AMS_colors/colors/color_19.jpg'),
(20, 'Badius', 'Caput Mortuum (also)', '70', '561A10', 81, 86, 26, 16, 'Chocolate', 0, 0, 0, '../images/AMS_colors/colors/color_20.jpg'),
(21, 'Aurantiacus', 'Safety Orange (Blaze Orange)', '10', 'EE6005', 80, 238, 96, 5, 'Safety Orange', 0, 0, 0, '../images/AMS_colors/colors/color_21.jpg'),
(22, 'Luteus', 'Tangerine', '40', 'EE8801', 49, 238, 136, 1, 'Orange', 0, 0, 0, '../images/AMS_colors/colors/color_22.jpg'),
(23, 'Flavus', 'UCLA Gold', '40', 'E7B001', 48, 231, 176, 1, 'Orange', 0, 0, 0, '../images/AMS_colors/colors/color_23.jpg'),
(24, 'Citrinus', 'Meat brown', '40', 'DCC747', 47, 220, 199, 71, 'Pear', 0, 0, 0, '../images/AMS_colors/colors/color_24.jpg'),
(25, 'Sulphureus', 'Straw', '40', 'DCCB71', 43, 220, 203, 113, 'June Bud', 0, 0, 0, '../images/AMS_colors/colors/color_25.jpg'),
(26, 'Stramineus', 'Pale Gold', '40', 'E3CB95', 41, 227, 203, 149, 'Medium Bud Spring', 0, 0, 0, '../images/AMS_colors/colors/color_26.jpg'),
(27, 'Cremeus', 'Pale Gold (also)', '40', 'E8C583', 42, 232, 197, 131, 'Peach-Orange', 0, 0, 0, '../images/AMS_colors/colors/color_27.jpg'),
(28, 'Ochroleucus', 'Topaz', '40', 'F0C378', 44, 240, 195, 120, 'Jonquil', 0, 0, 0, '../images/AMS_colors/colors/color_28.jpg'),
(29, 'Ochraceus', 'Pastel Orange', '40', 'F3B556', 45, 243, 181, 86, 'Jonquil', 0, 0, 0, '../images/AMS_colors/colors/color_29.jpg'),
(30, 'Melleus', 'Indian Yellow', '40', 'DFB54F', 46, 223, 181, 79, 'June Bud', 0, 0, 0, '../images/AMS_colors/colors/color_30.jpg'),
(31, 'Ferrunineus', 'Burnt Orange', '10', 'CB5607', 60, 203, 86, 7, 'Tenne (Tawny)', 0, 0, 0, '../images/AMS_colors/colors/color_31.jpg'),
(32, 'Fulvus', 'Brown (Traditional)', '70', '9E4410', 78, 158, 68, 16, 'Brown', 0, 0, 0, '../images/AMS_colors/colors/color_32.jpg'),
(33, 'Flavo-virens', 'Brass', '60', 'B5AB3E', 61, 181, 171, 62, 'Satin  Sheen Gold', 0, 0, 0, '../images/AMS_colors/colors/color_33.jpg'),
(34, 'Atro-virens', 'Myrtle', '60', '213C25', 65, 33, 60, 37, 'Olive Drab', 0, 0, 0, '../images/AMS_colors/colors/color_34.jpg'),
(35, 'Viridis', 'Fern Green', '60', '4A7A3E', 64, 74, 122, 62, 'Hunter Green', 0, 0, 0, '../images/AMS_colors/colors/color_35.jpg'),
(36, 'Prasinus', 'Fern Green', '60', '6B8046', 62, 107, 128, 70, 'Olive Drab', 0, 0, 0, '../images/AMS_colors/colors/color_36.jpg'),
(37, 'Aerugineus', 'Slate Gray', '60', '6B938A', 63, 107, 147, 138, 'Cadet Blue', 0, 0, 0, '../images/AMS_colors/colors/color_37.jpg'),
(38, 'Glaucus', 'Pastel Gray', '50', 'D6D5B7', 51, 214, 213, 183, 'Pastel Gray', 0, 0, 0, '../images/AMS_colors/colors/color_38.jpg'),
(39, 'Olivaceus', 'Dark Brown', '70', '5C4C1D', 76, 92, 76, 29, 'Wine', 0, 0, 0, '../images/AMS_colors/colors/color_39.jpg'),
(40, 'Atro-cyaneus', 'Oxford Blue', '20', '020F41', 32, 2, 15, 65, 'Oxford Blue', 0, 0, 0, '../images/AMS_colors/colors/color_40.jpg'),
(41, 'Cyaneus', 'Royal Blue (Traditional)', '20', '012866', 22, 1, 40, 102, 'Dark Midnight Blue', 0, 0, 0, '../images/AMS_colors/colors/color_41.jpg'),
(42, 'Caeruleus', 'Moonstone Blue', '20', '76A1BC', 12, 118, 161, 188, 'Blue Gray', 0, 0, 0, '../images/AMS_colors/colors/color_42.jpg'),
(43, 'Caesius', 'Pale Silver', '50', 'C5C3AB', 52, 197, 195, 171, 'Medium Spring Bud', 0, 0, 0, '../images/AMS_colors/colors/color_43.jpg'),
(44, 'Plumbeus', 'Battleship Gray', '50', '858786', 54, 133, 135, 134, 'Manatee', 0, 0, 0, '../images/AMS_colors/colors/color_44.jpg'),
(45, 'Ardesiacus', 'Rifle Green', '60', '303C35', 66, 48, 60, 53, 'Olive Drab', 0, 0, 0, '../images/AMS_colors/colors/color_45.jpg'),
(46, 'Atro-violaceus', 'Caput Mortuum (Also)', '70', '491D31', 79, 73, 29, 49, 'Olive Drab', 0, 0, 0, '../images/AMS_colors/colors/color_46.jpg'),
(47, 'Violaceus', 'French Lilac', '70', '86728E', 73, 134, 114, 142, 'French Lilac', 0, 0, 0, '../images/AMS_colors/colors/color_47.jpg'),
(48, 'Lilacinus', 'Puce', '70', 'C39AA1', 71, 195, 154, 161, 'Puce', 0, 0, 0, '../images/AMS_colors/colors/color_48.jpg'),
(49, 'Lividus', 'Old Mauve', '70', '6E3534', 75, 110, 53, 69, 'Wine', 0, 0, 0, '../images/AMS_colors/colors/color_49.jpg'),
(50, 'Vinosus', 'Bulgarian Rose (Also)', '70', '460910', 83, 70, 9, 16, 'Bulgarian Rose', 0, 0, 0, '../images/AMS_colors/colors/color_50.jpg');

-- --------------------------------------------------------



INSERT INTO `countries` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(0, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(1, 'USA', 'United States', '', '', 1, '2024-05-08 06:00:00'),
(2, 'MEX', 'Mexico', '', '', 1, '2024-05-08 06:00:00'),
(3, 'CAN', 'Canada', '', '', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `data_sources` (`id`, `title`, `author`, `type`, `comment`, `entered_by`, `date_entered`) VALUES
(1, 'Introductory Mycology', 'C. J. Alexopoulos, C. W. Mims,  M. Blackwell', '2', '', 1, '2024-05-08 06:00:00'),
(2, 'Ainsworth & Bisbys Dictionary of the Fungi 10th Edition', 'P. M. Kirk, P. F. Cannon, D. W. Minter and J. A. Stalpers', '2', '', 1, '2024-05-08 06:00:00'),
(3, 'Illustrated Dictionary of Mycology Second Edition', 'Miguel Ulloa and Richard T. Hanlin', '2', '', 1, '2024-05-08 06:00:00'),
(4, 'Mushrooms Demystified Second Edition', 'David Arora', '2', '', 1, '2024-05-08 06:00:00'),
(5, 'Easy Guide to Mushrooms Descriptions', 'Kit Scates', '5', '', 1, '2024-05-08 06:00:00'),
(6, 'Easy Key to Common Gilled Mushrooms', 'Kit Scates', '5', '', 1, '2024-05-08 06:00:00'),
(7, 'https://mycologyst.art/mushroom-identification/mushroom-morphology', 'Unknown', '3', '', 1, '2024-05-08 06:00:00'),
(8, 'www.mushroomexpert.com/index.html', 'Michael Kuo', '3', 'Kuo, Michael (2022). Mushroomexpert.com homepage. Retrieved April 5, 2022 from the Mushroomexpert.Com website: www.mushroomexpert.com/index.html', 1, '2024-05-08 06:00:00'),
(9, 'Fungal Families of the World', 'P. F. Cannon and P. M. Kirk', '2', '', 1, '2024-05-08 06:00:00'),
(10, 'How to Know the Non-Gilled Fleshy Fungi', 'Helen V. Smith Alexander H. Smith', '2', '', 1, '2024-05-08 06:00:00'),
(11, 'How to Know the gilled mushrooms', 'Alexander H. Smith Helen V. Smith Nancy S. Weber', '2', '', 1, '2024-05-08 06:00:00'),
(12, 'National Audubon Society Field Guide to North American Mushrooms', 'Gary H. Lincoff', '2', '', 1, '2024-05-08 06:00:00'),
(13, 'How to Identify Mushrooms to Genus I:  Macroscopic Features', 'David L. Largent', '2', '', 1, '2024-05-08 06:00:00'),
(14, 'How to Identify Mushrooms to Genus III:  Microscopic Features', 'David Largent David Johnson Roy Watling (Consultant)', '2', '', 1, '2024-05-08 06:00:00'),
(15, 'Identification of the Larger Fungi Kindle Edition', 'Roy Watling', '2', '', 1, '2024-05-08 06:00:00'),
(16, 'North American Mushrooms A Field Guide to Edible and Inedible Fungi', 'Dr. Orson K. Miller Jr. and Hope H. Miller', '2', '', 1, '2024-05-08 06:00:00'),
(17, 'Mushrooms of the Southeast', 'Todd F. Elliott and Steven L. Stephenson', '2', '', 1, '2024-05-08 06:00:00'),
(18, 'Mushrooms of the Gulf Coast States A Field Guide to Texas, Louisiana, Mississippi, Alabama, and Florida', 'Alan E. Bessette Arleen R. Bessette David P. Lewis', '2', '', 1, '2024-05-08 06:00:00'),
(19, 'Mushrooms How to Identify and Gather Wild Mushrooms and Other Fungi', 'DK? Thomas Lessoe?', '2', '', 1, '2024-05-08 06:00:00'),
(20, 'Mushrooms of the Midwest', 'Michael Kuo and Andrew S. Methven', '2', '', 1, '2024-05-08 06:00:00'),
(21, 'North American Boletes A Color Guide to the Fleshy Pored Mushrooms', 'Alan E. Bessette, William C. Roody, and Arleen R. Bessette', '2', '', 1, '2024-05-08 06:00:00'),
(22, 'MBList', '', '', '', 1, '2024-05-08 06:00:00'),
(23, 'Will Johnston', 'Will Johnston', '1', '', 1, '2024-05-08 06:00:00'),
(24, 'Comparison of Different Drying Methods for Recovery of Mushroom DNA', 'Shouxian Wang,corresponding author1,2 Yu Liu,2 and Jianping Xu corresponding author1', '', 'Wang S, Liu Y, Xu J. Comparison of Different Drying Methods for Recovery of Mushroom DNA. Sci Rep. 2017 Jun 7;7(1):3008. doi: 10.1038/s41598-017-03570-7. PMID: 28592865; PMCID: PMC5462775.', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------


INSERT INTO `data_source_data_types` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '23', 1, '2024-05-08 06:00:00'),
(2, 'Book', '', '', '23', 1, '2024-05-08 06:00:00'),
(3, 'Website', '', '', '23', 1, '2024-05-08 06:00:00'),
(4, 'Magazine', '', '', '23', 1, '2024-05-08 06:00:00'),
(5, 'Chart', 'like Scates', '', '5', 1, '2024-05-08 06:00:00'),
(6, 'Database', '', '', '23', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `display_options` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '23', 1, '2024-05-08 06:00:00'),
(2, 'text_box_number_mm', '', '', '23', 1, '2024-05-08 06:00:00'),
(3, 'text_box_number_um', '', '', '23', 1, '2024-05-08 06:00:00'),
(4, 'text_box_number', '', '', '23', 1, '2024-05-08 06:00:00'),
(5, 'text_box_string', '', '', '23', 1, '2024-05-08 06:00:00'),
(6, 'color', '', '', '23', 1, '2024-05-08 06:00:00'),
(7, 'taste', '', '', '23', 1, '2024-05-08 06:00:00'),
(8, 'odor', '', '', '23', 1, '2024-05-08 06:00:00'),
(9, 'radio', '', '', '23', 1, '2024-05-08 06:00:00'),
(10, 'drop-down', '', '', '23', 1, '2024-05-08 06:00:00'),
(11, 'state', '', '', '23', 1, '2024-05-08 06:00:00'),
(12, 'country', '', '', '23', 1, '2024-05-08 06:00:00'),
(13, 'texture', '', '', '23', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `fungus_types` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '23', 1, '2024-05-08 06:00:00'),
(2, 'Gills', '', '', '23', 1, '2024-05-08 06:00:00'),
(3, 'Pores', '', '', '23', 1, '2024-05-08 06:00:00'),
(4, 'Teeth', '', '', '23', 1, '2024-05-08 06:00:00'),
(5, 'Cups', '', '', '23', 1, '2024-05-08 06:00:00'),
(6, 'Stinkhorn', '', '', '23', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `genus` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(0, 'Not Entered', '', '', 1, 1, '2024-05-08 06:00:00'),
(1, 'Albatrellus', '', '', 21, 1, '2024-05-08 06:00:00'),
(2, 'Aureoboletus', '', '', 21, 1, '2024-05-08 06:00:00'),
(3, 'Austroboletus', '', '', 21, 1, '2024-05-08 06:00:00'),
(4, 'Boletellus', '', '', 21, 1, '2024-05-08 06:00:00'),
(5, 'Boletinellus', '', '', 21, 1, '2024-05-08 06:00:00'),
(6, 'Boletinus', '', '', 21, 1, '2024-05-08 06:00:00'),
(7, 'Boletopsis', '', '', 21, 1, '2024-05-08 06:00:00'),
(8, 'Boletus', '', '', 21, 1, '2024-05-08 06:00:00'),
(9, 'Chalciporus', '', '', 21, 1, '2024-05-08 06:00:00'),
(10, 'Coltricia', '', '', 21, 1, '2024-05-08 06:00:00'),
(11, 'Fuscoboletinus', '', '', 21, 1, '2024-05-08 06:00:00'),
(12, 'Gastroboletus', '', '', 21, 1, '2024-05-08 06:00:00'),
(13, 'Gastroleccinum', '', '', 21, 1, '2024-05-08 06:00:00'),
(14, 'Gastrosuillus', '', '', 21, 1, '2024-05-08 06:00:00'),
(15, 'Gomphidius', '', '', 21, 1, '2024-05-08 06:00:00'),
(16, 'Gyrodon', '', '', 21, 1, '2024-05-08 06:00:00'),
(17, 'Gyroporus', '', '', 21, 1, '2024-05-08 06:00:00'),
(18, 'Hypomyces', '', '', 21, 1, '2024-05-08 06:00:00'),
(19, 'Jabnoporus', '', '', 21, 1, '2024-05-08 06:00:00'),
(20, 'Leccinum', '', '', 21, 1, '2024-05-08 06:00:00'),
(21, 'Meiorganum', '', '', 21, 1, '2024-05-08 06:00:00'),
(22, 'Mucilopilus', '', '', 21, 1, '2024-05-08 06:00:00'),
(23, 'Paragyrodon', '', '', 21, 1, '2024-05-08 06:00:00'),
(24, 'Paxillus', '', '', 21, 1, '2024-05-08 06:00:00'),
(25, 'Phaeolus', '', '', 21, 1, '2024-05-08 06:00:00'),
(26, 'Phlebopus', '', '', 21, 1, '2024-05-08 06:00:00'),
(27, 'Phylloporus', '', '', 21, 1, '2024-05-08 06:00:00'),
(28, 'Polyporus', '', '', 21, 1, '2024-05-08 06:00:00'),
(29, 'Porphyrellus', '', '', 21, 1, '2024-05-08 06:00:00'),
(30, 'Pseudomerulius', '', '', 21, 1, '2024-05-08 06:00:00'),
(31, 'Pulveroboletus', '', '', 21, 1, '2024-05-08 06:00:00'),
(32, 'Strobilomyces', '', '', 21, 1, '2024-05-08 06:00:00'),
(33, 'Suillellus', '', '', 21, 1, '2024-05-08 06:00:00'),
(34, 'Suillus', '', '', 21, 1, '2024-05-08 06:00:00'),
(35, 'Truncocolumella', '', '', 21, 1, '2024-05-08 06:00:00'),
(36, 'Tylopilus', '', '', 21, 1, '2024-05-08 06:00:00'),
(37, 'Xanthoconium', '', '', 21, 1, '2024-05-08 06:00:00'),
(38, 'Xerocomus', '', '', 21, 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------


INSERT INTO `gill_attachments` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Free - remote', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Free - close', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Adnate - horizontal', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Adnate - ascending', '', '', '5', 1, '2024-05-08 06:00:00'),
(6, 'Adnexed (almost free)', '', '', '5', 1, '2024-05-08 06:00:00'),
(7, 'Sinuate', '', '', '5', 1, '2024-05-08 06:00:00'),
(8, 'Emarginate (notched)', '', '', '5', 1, '2024-05-08 06:00:00'),
(9, 'Decurrent - long', '', '', '5', 1, '2024-05-08 06:00:00'),
(10, 'Decurrent - short', '', '', '5', 1, '2024-05-08 06:00:00'),
(11, 'Seceding (breaking away)', '', '', '5', 1, '2024-05-08 06:00:00'),
(12, 'Uncinate (w/decurrent tooth)', '', '', '5', 1, '2024-05-08 06:00:00'),
(13, 'Collared', 'Gills are attached to a collar or ring that encircles the stipe.', '', '7', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `gill_breadths` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Broad', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Free - close', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Ventricose', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------


INSERT INTO `gill_edges` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Even - entire', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Serrate', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Serrulate', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Eroded (\"gnawed\")', '', '', '5', 1, '2024-05-08 06:00:00'),
(6, 'Fimbriate (fringed)', '', '', '5', 1, '2024-05-08 06:00:00'),
(7, 'Marginate (diff. color)', '', '', '5', 1, '2024-05-08 06:00:00'),
(8, 'Crenate (scalloped)', '', '', '5', 1, '2024-05-08 06:00:00'),
(9, 'Acute', '', '', '5', 1, '2024-05-08 06:00:00'),
(10, 'Obtuse (blunt)', '', '', '5', 1, '2024-05-08 06:00:00'),
(11, 'Crisped (crinkled)', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `gill_miscs` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Veined (with ridges)', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Intervenose (with \"veins\" between gills', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Equal', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Unequal (w/short gills)', '', '', '5', 1, '2024-05-08 06:00:00'),
(6, 'Forking', '', '', '5', 1, '2024-05-08 06:00:00'),
(7, 'Anastomosing (joining crossways)', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------


INSERT INTO `gill_spacings` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Crowded', 'The Gills are tightly close together.', '', '7', 1, '2024-05-08 06:00:00'),
(3, 'Close', 'The Gills are close together.', '', '7', 1, '2024-05-08 06:00:00'),
(4, 'Subdistant', 'The gills are spaced apart.', '', '7', 1, '2024-05-08 06:00:00'),
(5, 'Distant', 'The gills are widely spaced apart.', '', '7', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `gill_thicknesses` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Average', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Thick', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Tapering', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `habits` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Single, solitary', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Scattered (1-2 feet apart)', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Gregarious (growing in a group)', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Caespitose (clustered, not joined)', '', '', '5', 1, '2024-05-08 06:00:00'),
(6, 'Connate (fused at base)', '', '', '5', 1, '2024-05-08 06:00:00'),
(7, 'Imbricate (overlapping)', '', '', '5', 1, '2024-05-08 06:00:00'),
(8, 'In troops or rings', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `habitats` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Terrestrial (on soil - bare )', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Terrestrial (on soil - burned )', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Terrestrial (on soil - disturbed )', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Lignicolous (on wood) - what kind of tree?', '', '', '5', 1, '2024-05-08 06:00:00'),
(6, 'Humicolous (on humus, duff) - conifer, other?', '', '', '5', 1, '2024-05-08 06:00:00'),
(7, 'Coprophious (on dung) what kind?', '', '', '5', 1, '2024-05-08 06:00:00'),
(8, 'In grassy area - lawn, pasture, etc?', '', '', '5', 1, '2024-05-08 06:00:00'),
(9, 'In forest - conifer, hardwood, mixed?', '', '', '5', 1, '2024-05-08 06:00:00'),
(16, 'fungicolous', 'mushroom mycelia grow in other mushrooms', 'p 7, How to Identify Mushrooms to Genus I: Macroscopic Features - David L. Largent', '13', 2, '2024-05-08 06:00:00');

-- --------------------------------------------------------



CREATE TABLE `images_thumbnails` (
  `id` int NOT NULL,
  `specimen_id` int NOT NULL,
  `source_remote` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_width` int NOT NULL,
  `image_height` int NOT NULL,
  `entered_by` int NOT NULL,
  `date_entered` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------


INSERT INTO `lens` (`id`, `make`, `model`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', 1, '2024-05-08 06:00:00'),
(2, 'Nikon', 'Nikon ED AF Micro Nikkor 70-180mm 1:4.5-5.6 D', 2, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `member_list_clusters` (`id`, `specimen_id`, `cluster_id`, `entered_by`, `date_entered`) VALUES
(1, 5, 3, 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------


INSERT INTO `member_list_groups` (`id`, `specimen_id`, `group_id`, `entered_by`, `date_entered`) VALUES
(1, 1, 1, 1, '2024-05-08 06:00:00'),
(2, 2, 1, 1, '2024-05-08 06:00:00'),
(3, 3, 9, 1, '2024-05-08 06:00:00'),
(4, 4, 10, 1, '2024-05-08 06:00:00'),
(5, 5, 10, 1, '2024-05-08 06:00:00'),
(6, 6, 10, 1, '2024-05-08 06:00:00'),
(7, 7, 10, 1, '2024-05-08 06:00:00'),
(8, 8, 10, 1, '2024-05-08 06:00:00'),
(9, 5, 10, 1, '2024-05-08 06:00:00'),
(10, 6, 3, 1, '2024-05-08 06:00:00'),
(11, 7, 10, 1, '2024-05-08 06:00:00'),
(12, 8, 4, 1, '2024-05-08 06:00:00'),
(13, 9, 12, 1, '2024-05-08 06:00:00'),
(14, 10, 12, 1, '2024-05-08 06:00:00'),
(15, 1, 4, 1, '2024-05-08 06:00:00'),
(16, 2, 4, 1, '2024-05-08 06:00:00'),
(17, 1, 13, 1, '2024-05-08 06:00:00'),
(18, 2, 13, 1, '2024-05-08 06:00:00'),
(19, 3, 12, 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `member_types` (`id`, `name`, `entered_by`, `date_entered`) VALUES
(1, 'admin', 1, '2024-05-08 06:00:00'),
(2, 'member', 1, '2024-05-08 06:00:00'),
(3, 'scholar', 1, '2024-05-08 06:00:00'),
(4, 'expert', 1, '2024-05-08 06:00:00'),
(5, 'student', 1, '2024-05-08 06:00:00'),
(6, 'researcher', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `odors` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'None', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Fruity', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Lemony', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Anise (licorice)', '', '', '5', 1, '2024-05-08 06:00:00'),
(6, 'Farinaceous (like fresh meal)', '', '', '5', 1, '2024-05-08 06:00:00'),
(7, 'Pungent', '', '', '5', 1, '2024-05-08 06:00:00'),
(8, 'Nauseous', '', '', '5', 1, '2024-05-08 06:00:00'),
(9, 'Nitrous', '', '', '5', 1, '2024-05-08 06:00:00'),
(10, 'Earthy', '', '', '5', 1, '2024-05-08 06:00:00'),
(11, 'Spermatic', '', '', '5', 1, '2024-05-08 06:00:00'),
(12, 'Garlic', '', '', '4', 1, '2024-05-08 06:00:00'),
(13, 'Marasschino cherries', '', '', '4', 1, '2024-05-08 06:00:00'),
(14, 'Sewer gas', '', '', '4', 1, '2024-05-08 06:00:00'),
(15, 'spicy - red hots - dirty socks', '', '', '4', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `partial_inner_veil_appearances` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Two Rings (from 2 veils)', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Doubly-flared Ring', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, '\"Cogwheel\" Stellate', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Floccose (downy tuffs)', '', '', '5', 1, '2024-05-08 06:00:00'),
(6, 'Cortinate PV & Fibrillose Annular Zone', '', '', '5', 1, '2024-05-08 06:00:00'),
(7, 'Single Ring thick on edge', '', '', '5', 1, '2024-05-08 06:00:00'),
(8, 'Pendant (hanging)', '', '', '5', 1, '2024-05-08 06:00:00'),
(9, 'Subperonate', '', '', '5', 1, '2024-05-08 06:00:00'),
(10, 'Peronate (w/\"boot\")', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------


INSERT INTO `partial_inner_veil_fates` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Disappearing - Evanescent', 'can only be detected in button stage', '', '4', 1, '2024-05-08 06:00:00'),
(3, 'Persistent', 'leaving remnants on cap', '', '4', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `partial_inner_veil_textures` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Membranous (skin-like)', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Cortinate (cobwebby)', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Fibillose (thready)', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Gelatinous (slimy)', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `partial_inter_veil_annulus_ring_positions` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'None', 'Does not have annulus ring', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Superior', 'Near the cap', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Apical', 'upper half', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Median', 'in the middle', '', '5', 1, '2024-05-08 06:00:00'),
(6, 'Inferior', 'Lower half', '', '5', 1, '2024-05-08 06:00:00'),
(7, 'Basal', 'Near the base', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `parts` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '23', 1, '2024-05-08 06:00:00'),
(2, 'Basic', 'default data that every specimen will have', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Cap - Pileus', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Gills - Lamellae', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Stem - Stipe', '', '', '5', 1, '2024-05-08 06:00:00'),
(6, 'Veil', '', '', '5', 1, '2024-05-08 06:00:00'),
(7, 'Mycelium', '', '', '5', 1, '2024-05-08 06:00:00'),
(8, 'Spores', 'micro for spores is here - not in micro', '', '5', 1, '2024-05-08 06:00:00'),
(9, 'Micro', '', '', '5', 1, '2024-05-08 06:00:00'),
(10, 'DNA', '', '', '5', 1, '2024-05-08 06:00:00'),
(11, 'Habitat', 'Habitat, Plant Assoc ', '', '5', 1, '2024-05-08 06:00:00'),
(12, 'Rhizomorph', '', '', '5', 1, '2024-05-08 06:00:00'),
(13, 'Chemical Reaction', '', '', '', 1, '2024-05-08 06:00:00'),
(14, 'Color', 'this will allow color selection for ALL color characters to be in one place', '', '1', 1, '2024-05-08 06:00:00'),
(15, 'Location', 'lat lon city county state country', '', '23', 1, '2024-05-08 06:00:00'),
(16, 'Identification', 'species genus inaturalist etc', '', '23', 1, '2024-05-08 06:00:00'),
(17, 'Storage', '', '', '23', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `preservation_methods` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '23', 1, '2024-05-08 06:00:00'),
(2, 'None', '', '', '23', 1, '2024-05-08 06:00:00'),
(3, 'Unknown', '', '', '23', 1, '2024-05-08 06:00:00'),
(4, 'Dehumidifier', '', '', '23', 1, '2024-05-08 06:00:00'),
(6, 'silica gel', '', '', '', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `soil_types` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Unknown', '', '', '', 1, '2024-05-08 06:00:00'),
(3, 'Loam', '', '', '', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------


INSERT INTO `species` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(0, 'Not Entered', '', '', 1, 1, '2024-05-08 06:00:00'),
(1, 'Some Species', 'Made Up', 'Fake', 1, 1, '2024-05-08 06:00:00'),
(2, 'Another', 'Fake', 'Made Up', 1, 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `specimens` (`id`, `member_id`, `specimen_name`, `common_name`, `description`, `comment`, `specimen_location_now`, `location_found_city`, `location_found_county`, `state`, `country`, `location_public_y_n`, `month_found`, `day_found`, `year_found`, `fungus_type`, `entered_by`, `date_entered`) VALUES
(1, 1, '1_wrj_4_3_2024_root', 'ganoderma I think on overturned tree roots', 'lacquer finish, dried out, light weight, tough, woody type stem', '', 3, 'Blakeley', 'Baldwin', '1', '1', 0, 4, 3, 2024, 4, 1, '2024-05-08 06:00:00'),
(2, 1, '2_wrj_04_03_2024_tree', 'Oyster type growing 6 feet up on tree trunk', 'Growing out of a knothole', '', 3, 'Blakeley', 'Baldwin', '1', '1', 0, 4, 3, 2024, 2, 1, '2024-05-08 06:00:00'),
(3, 1, 'ccccc', 'ccccccc', 'ccccccccc', 'cccccccc', 3, 'cccccccccccccc', 'cccccccccccccccc', '28', '1', 0, 12, 31, 2024, 3, 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `specimen_ages` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 2, '2024-05-08 06:00:00'),
(2, 'Button', 'very young', '', '', 2, '2024-05-08 06:00:00'),
(3, 'Young', '', '', '', 2, '2024-05-08 06:00:00'),
(4, 'Mature', '', '', '', 2, '2024-05-08 06:00:00'),
(5, 'Past Prime', '', '', '', 2, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `specimen_clusters` (`id`, `member_id`, `name`, `description`, `comments`, `entered_by`, `date_entered`) VALUES
(1, 1, 'Parasol - yard - front & back', '', '', 1, '2024-05-08 06:00:00'),
(2, 1, 'Cluster of Ostrich Wings', 'Wing of ostrich clustered.', 'Ostrich Wing Cluster', 1, '2024-05-08 06:00:00'),
(3, 1, 'Ostrich Wing', 'The wing of an ostrich.', 'Wing belonging to ostrich.', 1, '2024-05-08 06:00:00'),
(4, 1, 'Random racoons', 'Racoons that are not orchestrated.', 'No organization, a cluster.', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------


INSERT INTO `specimen_groups` (`id`, `member_id`, `name`, `description`, `comments`, `entered_by`, `date_entered`) VALUES
(1, 1, 'January', '', '', 1, '2024-05-08 06:00:00'),
(2, 1, 'February', '', '', 1, '2024-05-08 06:00:00'),
(3, 1, 'March', '', '', 1, '2024-05-08 06:00:00'),
(4, 1, 'April', '', '', 1, '2024-05-08 06:00:00'),
(5, 1, 'May', '', '', 1, '2024-05-08 06:00:00'),
(6, 1, 'June', '', '', 1, '2024-05-08 06:00:00'),
(7, 1, 'July', '', '', 1, '2024-05-08 06:00:00'),
(8, 1, 'August', '', '', 1, '2024-05-08 06:00:00'),
(9, 1, 'September', '', '', 1, '2024-05-08 06:00:00'),
(10, 1, 'October', '', '', 1, '2024-05-08 06:00:00'),
(11, 1, 'November', '', '', 1, '2024-05-08 06:00:00'),
(12, 1, 'December', '', '', 1, '2024-05-08 06:00:00'),
(13, 1, 'Blakeley', '', '', 1, '2024-05-08 06:00:00'),
(14, 1, 'Daphne', '', '', 1, '2024-05-08 06:00:00'),
(15, 1, 'Disc Golf Park', '', '', 1, '2024-05-08 06:00:00'),
(16, 1, 'Elberta', '', '', 1, '2024-05-08 06:00:00'),
(17, 1, 'Fairhope', '', '', 1, '2024-05-08 06:00:00'),
(18, 1, 'Foley', '', '', 1, '2024-05-08 06:00:00'),
(19, 1, 'Fort Pickens', '', '', 1, '2024-05-08 06:00:00'),
(20, 1, 'Pine Beach Trail', '', '', 1, '2024-05-08 06:00:00'),
(21, 1, 'Weeks Bay', '', '', 1, '2024-05-08 06:00:00'),
(22, 1, 'Yard - Back\r\n', '', '', 1, '2024-05-08 06:00:00'),
(23, 1, 'Yard - Front', '', '', 1, '2024-05-08 06:00:00'),
(24, 1, 'Ostrich Wing', 'The wing of an ostrich.', 'Wing belonging to ostrich.', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `specimen_location_nows` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', 'Not Entered', 'None', '99', 1, '2024-05-08 06:00:00'),
(2, 'Observation Only - No specimen collected', '', 'None', '', 2, '2024-05-08 06:00:00'),
(3, 'Speciment Collector', 'This is you, if you collected this specimen', '', '', 2, '2024-05-08 06:00:00'),
(4, 'Herbarium', '', '', '', 2, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `states` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(0, 'Not Selected', '', '', '', 1, '2024-05-08 06:00:00'),
(1, 'Alabama', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Alaska', '', '', '', 1, '2024-05-08 06:00:00'),
(3, 'Arizona', '', '', '', 1, '2024-05-08 06:00:00'),
(4, 'Arkansas', '', '', '', 1, '2024-05-08 06:00:00'),
(5, 'California', '', '', '', 1, '2024-05-08 06:00:00'),
(6, 'Colorado', '', '', '', 1, '2024-05-08 06:00:00'),
(7, 'Connecticut', '', '', '', 1, '2024-05-08 06:00:00'),
(8, 'Delaware', '', '', '', 1, '2024-05-08 06:00:00'),
(9, 'District of Columbia', '', '', '', 1, '2024-05-08 06:00:00'),
(10, 'Florida', '', '', '', 1, '2024-05-08 06:00:00'),
(11, 'Georgia', '', '', '', 1, '2024-05-08 06:00:00'),
(12, 'Hawaii', '', '', '', 1, '2024-05-08 06:00:00'),
(13, 'Idaho', '', '', '', 1, '2024-05-08 06:00:00'),
(14, 'Illinois', '', '', '', 1, '2024-05-08 06:00:00'),
(15, 'Indiana', '', '', '', 1, '2024-05-08 06:00:00'),
(16, 'Iowa', '', '', '', 1, '2024-05-08 06:00:00'),
(17, 'Kansas', '', '', '', 1, '2024-05-08 06:00:00'),
(18, 'Kentucky', '', '', '', 1, '2024-05-08 06:00:00'),
(19, 'Louisiana', '', '', '', 1, '2024-05-08 06:00:00'),
(20, 'Maine', '', '', '', 1, '2024-05-08 06:00:00'),
(21, 'Maryland', '', '', '', 1, '2024-05-08 06:00:00'),
(22, 'Massachusetts', '', '', '', 1, '2024-05-08 06:00:00'),
(23, 'Michigan', '', '', '', 1, '2024-05-08 06:00:00'),
(24, 'Minnesota', '', '', '', 1, '2024-05-08 06:00:00'),
(25, 'Mississippi', '', '', '', 1, '2024-05-08 06:00:00'),
(26, 'Missouri', '', '', '', 1, '2024-05-08 06:00:00'),
(27, 'Montana', '', '', '', 1, '2024-05-08 06:00:00'),
(28, 'Nebraska', '', '', '', 1, '2024-05-08 06:00:00'),
(29, 'Nevada', '', '', '', 1, '2024-05-08 06:00:00'),
(30, 'New Hampshire', '', '', '', 1, '2024-05-08 06:00:00'),
(31, 'New Jersey', '', '', '', 1, '2024-05-08 06:00:00'),
(32, 'New Mexico', '', '', '', 1, '2024-05-08 06:00:00'),
(33, 'New York', '', '', '', 1, '2024-05-08 06:00:00'),
(34, 'North Carolina', '', '', '', 1, '2024-05-08 06:00:00'),
(35, 'North Dakota', '', '', '', 1, '2024-05-08 06:00:00'),
(36, 'Ohio', '', '', '', 1, '2024-05-08 06:00:00'),
(37, 'Oklahoma', '', '', '', 1, '2024-05-08 06:00:00'),
(38, 'Oregon', '', '', '', 1, '2024-05-08 06:00:00'),
(39, 'Pennsylvania', '', '', '', 1, '2024-05-08 06:00:00'),
(40, 'Rhode Island', '', '', '', 1, '2024-05-08 06:00:00'),
(41, 'South Carolina', '', '', '', 1, '2024-05-08 06:00:00'),
(42, 'South Dakota', '', '', '', 1, '2024-05-08 06:00:00'),
(43, 'Tennessee', '', '', '', 1, '2024-05-08 06:00:00'),
(44, 'Texas', '', '', '', 1, '2024-05-08 06:00:00'),
(45, 'Utah', '', '', '', 1, '2024-05-08 06:00:00'),
(46, 'Vermont', '', '', '', 1, '2024-05-08 06:00:00'),
(47, 'Virginia', '', '', '', 1, '2024-05-08 06:00:00'),
(48, 'Washington', '', '', '', 1, '2024-05-08 06:00:00'),
(49, 'West Virginia', '', '', '', 1, '2024-05-08 06:00:00'),
(50, 'Wisconsin', '', '', '', 1, '2024-05-08 06:00:00'),
(51, 'Wyoming', '', '', '', 1, '2024-05-08 06:00:00'),
(52, 'Alberta', '', '', '', 1, '2024-05-08 06:00:00'),
(53, 'British Columbia', '', '', '', 1, '2024-05-08 06:00:00'),
(54, 'Manitoba', '', '', '', 1, '2024-05-08 06:00:00'),
(55, 'New Brunswick', '', '', '', 1, '2024-05-08 06:00:00'),
(56, 'Newfoundland', '', '', '', 1, '2024-05-08 06:00:00'),
(57, 'Nova Scotia', '', '', '', 1, '2024-05-08 06:00:00'),
(58, 'Northwest Territories', '', '', '', 1, '2024-05-08 06:00:00'),
(59, 'Nunavut', '', '', '', 1, '2024-05-08 06:00:00'),
(60, 'Ontario', '', '', '', 1, '2024-05-08 06:00:00'),
(61, 'Prince Edward Island', '', '', '', 1, '2024-05-08 06:00:00'),
(62, 'Quebec', '', '', '', 1, '2024-05-08 06:00:00'),
(63, 'Saskatchewan', '', '', '', 1, '2024-05-08 06:00:00'),
(64, 'Yukon', '', '', '', 1, '2024-05-08 06:00:00'),
(65, 'Aguascalientes', '', '', '', 1, '2024-05-08 06:00:00'),
(66, 'Baja California', '', '', '', 1, '2024-05-08 06:00:00'),
(67, 'Baja California Sur', '', '', '', 1, '2024-05-08 06:00:00'),
(68, 'Campeche', '', '', '', 1, '2024-05-08 06:00:00'),
(69, 'Chiapas', '', '', '', 1, '2024-05-08 06:00:00'),
(70, 'Chihuahua', '', '', '', 1, '2024-05-08 06:00:00'),
(71, 'Coahuila', '', '', '', 1, '2024-05-08 06:00:00'),
(72, 'Colima', '', '', '', 1, '2024-05-08 06:00:00'),
(73, 'Distrito Federal', '', '', '', 1, '2024-05-08 06:00:00'),
(74, 'Durango', '', '', '', 1, '2024-05-08 06:00:00'),
(75, 'Guanajuato', '', '', '', 1, '2024-05-08 06:00:00'),
(76, 'Guerrero', '', '', '', 1, '2024-05-08 06:00:00'),
(77, 'Hidalgo', '', '', '', 1, '2024-05-08 06:00:00'),
(78, 'Jalisco', '', '', '', 1, '2024-05-08 06:00:00'),
(79, 'Mexico', '', '', '', 1, '2024-05-08 06:00:00'),
(80, 'Michoacan', '', '', '', 1, '2024-05-08 06:00:00'),
(81, 'Morelos', '', '', '', 1, '2024-05-08 06:00:00'),
(82, 'Nayarit', '', '', '', 1, '2024-05-08 06:00:00'),
(83, 'Nuevo Leon', '', '', '', 1, '2024-05-08 06:00:00'),
(84, 'Oaxaca', '', '', '', 1, '2024-05-08 06:00:00'),
(85, 'Puebla', '', '', '', 1, '2024-05-08 06:00:00'),
(86, 'Queretaro', '', '', '', 1, '2024-05-08 06:00:00'),
(87, 'Quintana Roo', '', '', '', 1, '2024-05-08 06:00:00'),
(88, 'San Luis Potosi', '', '', '', 1, '2024-05-08 06:00:00'),
(89, 'Sinaloa', '', '', '', 1, '2024-05-08 06:00:00'),
(90, 'Sonora', '', '', '', 1, '2024-05-08 06:00:00'),
(91, 'Tabasco', '', '', '', 1, '2024-05-08 06:00:00'),
(92, 'Tamaulipas', '', '', '', 1, '2024-05-08 06:00:00'),
(93, 'Tlaxcala', '', '', '', 1, '2024-05-08 06:00:00'),
(94, 'Veracruz', '', '', '', 1, '2024-05-08 06:00:00'),
(95, 'Yucatan', '', '', '', 1, '2024-05-08 06:00:00'),
(96, 'Zacatecas', '', '', '', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `stem_interiors` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Solid', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Hollow (fistulose)', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Tubular', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Cavernous', '', '', '5', 1, '2024-05-08 06:00:00'),
(6, 'Stuffed with pith', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `stem_locations` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Central', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Eccentric (off-center)', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Lateral (attached at margin)', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Sessile (missing)', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `stem_shapes` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Terete (round)', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Compressed (flattened)', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Equal', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Clavate (club)', '', '', '5', 1, '2024-05-08 06:00:00'),
(6, 'Radicating (w/\"root\")', '', '', '5', 1, '2024-05-08 06:00:00'),
(7, 'Flexous', '', '', '5', 1, '2024-05-08 06:00:00'),
(8, 'Ventricose Fusiform', '', '', '5', 1, '2024-05-08 06:00:00'),
(9, 'Tapering', '', '', '5', 1, '2024-05-08 06:00:00'),
(10, 'Abruptly bulbous', '', '', '5', 1, '2024-05-08 06:00:00'),
(11, 'Rounded', '', '', '5', 1, '2024-05-08 06:00:00'),
(12, 'Oblique (angle)', '', '', '5', 1, '2024-05-08 06:00:00'),
(13, 'Marginate', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `stem_surfaces` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Smooth', 'No defining features found on the surface.', '', '7', 1, '2024-05-08 06:00:00'),
(3, 'Uneven', 'A bumpy surface.', '', '7', 1, '2024-05-08 06:00:00'),
(4, 'Rugose', 'A wrinkled or rough surface.', '', '7', 1, '2024-05-08 06:00:00'),
(5, 'Rugulose', 'A slightly wrinkled surface.', '', '7', 1, '2024-05-08 06:00:00'),
(6, 'Rivulose', 'A thinly wrinkled surface of branching wavy or crooked lines.', '', '7', 1, '2024-05-08 06:00:00'),
(7, 'Scrobiculate', 'A pitted or furrowed surface.', '', '7', 1, '2024-05-08 06:00:00'),
(8, 'Warty', 'Remnants of the universal veil remain on the surface in small patches.', '', '7', 1, '2024-05-08 06:00:00'),
(9, 'Virgate', 'A streaked surface.', '', '7', 1, '2024-05-08 06:00:00'),
(10, 'Hygrophanous', 'A surface that is transparent when wet and opaque when dry.', '', '7', 1, '2024-05-08 06:00:00'),
(11, 'Sericeous', 'A silky surface.', '', '7', 1, '2024-05-08 06:00:00'),
(12, 'Fibrillose', 'A surface covered in thread-like filaments.', '', '7', 1, '2024-05-08 06:00:00'),
(13, 'Squamose', 'A surface covered with scales.', '', '7', 1, '2024-05-08 06:00:00'),
(14, 'Squarrose', 'A ragged surface covered with small scales.', '', '7', 1, '2024-05-08 06:00:00'),
(15, 'Pruinose', 'A surface covered with a white powdery frostlike substance.', '', '7', 1, '2024-05-08 06:00:00'),
(16, 'Pulverulent', 'A surface covered with fine dust or powder.', '', '7', 1, '2024-05-08 06:00:00'),
(17, 'Granulose', 'A surface covered in salt-like granulates.', '', '7', 1, '2024-05-08 06:00:00'),
(18, 'Furfuraceous', 'A surface covered in flaky bran-like particles; dandruff-like.', '', '7', 1, '2024-05-08 06:00:00'),
(19, 'Zonate', 'A surface containing zones or bands that are distinguished by texture or color.', '', '7', 1, '2024-05-08 06:00:00'),
(20, 'Areolate', 'A cracked surface resembling dried-mud or paint.', '', '7', 1, '2024-05-08 06:00:00'),
(21, 'Rimose', 'A surface covered in cracks and crevices.', '', '7', 1, '2024-05-08 06:00:00'),
(22, 'Laccate', 'A waxy or lacquered surface texture.', '', '7', 1, '2024-05-08 06:00:00'),
(23, 'Viscid -', 'A sticky glue-like surface texture.', '', '7', 1, '2024-05-08 06:00:00'),
(24, 'Glutinous', 'A slimy surface.', '', '7', 1, '2024-05-08 06:00:00'),
(25, 'Glabrous - Hairy', 'Hairy - a bald surface.', '', '7', 1, '2024-05-08 06:00:00'),
(26, 'Velvety - Hairy', 'Hairy - A surface covered with very fine and soft hairs.', '', '7', 1, '2024-05-08 06:00:00'),
(27, 'Pubescent - Hairy', 'Hairy - A surface cover with fuzz or fine hairs.', '', '7', 1, '2024-05-08 06:00:00'),
(28, 'Canescent - Hairy', 'Hairy - A surface covered in dense white or gray down-like hairs. Giving a frosted appearance.', '', '7', 1, '2024-05-08 06:00:00'),
(29, 'Floccose - Hairy', 'Hairy - A surface covered in Wooly or cotton-like hairs.', '', '7', 1, '2024-05-08 06:00:00'),
(30, 'Tomentose - Hairy', 'Hairy - A surface covered densely with matted hairs.', '', '7', 1, '2024-05-08 06:00:00'),
(31, 'Hispid - Hairy', 'Hairy - A surface covered with straight bristle-like hairs.', '', '7', 1, '2024-05-08 06:00:00'),
(32, 'Hirsute - Hairy', 'Hairy - A surface covered with slightly stiff and shaggy hairs.', '', '7', 1, '2024-05-08 06:00:00'),
(33, 'Villose - Hairy', 'Hairy - A surface covered with long soft hairs.', '', '7', 1, '2024-05-08 06:00:00'),
(34, 'Strigose - Hairy', 'Hairy - A surface covered with long bristle-like hairs.', '', '7', 1, '2024-05-08 06:00:00'),
(35, 'Banded', '', '', '5', 1, '2024-05-08 06:00:00'),
(36, 'Peronate', '', '', '5', 1, '2024-05-08 06:00:00'),
(37, 'Fibrous', '', '', '5', 1, '2024-05-08 06:00:00'),
(38, 'Lacunose (w/dp.grooves)', '', '', '5', 1, '2024-05-08 06:00:00'),
(39, 'Longitudionally striate', '', '', '5', 1, '2024-05-08 06:00:00'),
(40, 'Ribbed/Costate', '', '', '5', 1, '2024-05-08 06:00:00'),
(41, 'Scabrous (scabby)', '', '', '5', 1, '2024-05-08 06:00:00'),
(42, 'Punctuate (w/small dots)', '', '', '5', 1, '2024-05-08 06:00:00'),
(43, 'Glanular-dotted (w/dark sticky dots)', '', '', '5', 1, '2024-05-08 06:00:00'),
(44, 'Reticulate (fishnet)', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `stem_textures` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Fragile', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Pliable', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Chalky', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Rigid', '', '', '5', 1, '2024-05-08 06:00:00'),
(6, 'Fibrous (Fleshy-Fibrous)', 'usually rather thick, and when broken in two, leaves a ragged edge.', '', '5', 1, '2024-05-08 06:00:00'),
(7, 'Cartilaginous', 'Common stipe, usually thin and breaks with a firm split when bent in two, similar to cartilage.', '', '13', 1, '2024-05-08 06:00:00'),
(8, 'Firm', '', '', '5', 1, '2024-05-08 06:00:00'),
(9, 'Woody', '', '', '13', 1, '2024-05-08 06:00:00'),
(10, 'Corky', '', '', '13', 1, '2024-05-08 06:00:00'),
(11, 'Leathery (coriaceous)', '', '', '13', 1, '2024-05-08 06:00:00'),
(12, 'Chalky', 'feels and breaks like chalk in hand. When crushed, it breaks up into powder or chunks.', '', '13', 1, '2024-05-08 06:00:00'),
(13, 'Breaking with a snap', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------


INSERT INTO `synonyms` (`id`, `name`, `synonym_with`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'epigeous', 'above-ground ', '', 'https://en.wikipedia.org/wiki/Basidiocarp', 2, '2024-05-08 06:00:00'),
(2, 'hypogeous', 'underground', '', 'https://en.wikipedia.org/wiki/Basidiocarp', 2, '2024-05-08 06:00:00'),
(3, 'mushroom', 'fruiting body of a fungus', '', 'Page 7 How to Identify Mushrooms To Genus I - David L Largent', 2, '2024-05-08 06:00:00'),
(4, 'basidiocarp', 'fruiting body', '', 'https://en.wikipedia.org/wiki/Basidiocarp', 2, '2024-05-08 06:00:00'),
(5, 'thallus', 'soma', 'entire body of fungus', 'P 27 Introductory Mycology Alexopoulos', 2, '2024-05-08 06:00:00'),
(6, 'sporocarp', 'fruiting body', '', 'P 1 How to Know the Non-Gilled Fleshy Fungi Smith & Smith', 2, '2024-05-08 06:00:00'),
(7, 'pileus', 'cap', '', 'P 7 How to Know the Non-Gilled Fleshy Fungi Smith & Smith', 2, '2024-05-08 06:00:00'),
(8, 'Stipe', 'Stalk', '', 'P 7 How to Know the Non-Gilled Fleshy Fungi Smith & Smith', 2, '2024-05-08 06:00:00'),
(9, 'Gills', 'Lamellae', '', 'P 3 How to Know the Non-Gilled Fleshy Fungi Smith & Smith', 2, '2024-05-08 06:00:00'),
(10, 'Volva', 'cup', '', 'P 3 How to Know the Non-Gilled Fleshy Fungi Smith & Smith', 2, '2024-05-08 06:00:00'),
(11, 'Annulus', 'ring', '', 'P 3 How to Know the Non-Gilled Fleshy Fungi Smith & Smith', 2, '2024-05-08 06:00:00'),
(12, 'cone', 'conical', '', '5', 1, '2024-05-08 06:00:00'),
(13, 'conic', 'conical', '', '5', 1, '2024-05-08 06:00:00'),
(14, 'disc', 'center', '', '5', 1, '2024-05-08 06:00:00'),
(15, 'margin', 'edge', '', '5', 1, '2024-05-08 06:00:00'),
(16, 'ring', 'annulus', '', '5', 1, '2024-05-08 06:00:00'),
(17, 'stem', 'stipe', '', '5', 1, '2024-05-08 06:00:00'),
(18, 'volva', 'cup', '', '5', 1, '2024-05-08 06:00:00'),
(19, 'convex', 'evenly rounded', '', '5', 1, '2024-05-08 06:00:00'),
(20, 'ovoid', 'egg', '', '5', 1, '2024-05-08 06:00:00'),
(21, 'campanulate', 'bell-shaped', '', '5', 1, '2024-05-08 06:00:00'),
(22, 'parabolic', 'half-egg', '', '5', 1, '2024-05-08 06:00:00'),
(23, 'pulvinate', 'cushion', '', '5', 1, '2024-05-08 06:00:00'),
(24, 'cylindric', 'bullet', '', '5', 1, '2024-05-08 06:00:00'),
(25, 'plane', 'flat', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `tastes` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'None', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Mild', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Bitter', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Acrid (=puckery? astringent)/Peppery', '', '', '5', 1, '2024-05-08 06:00:00'),
(6, 'Agreeable', '', '', '5', 1, '2024-05-08 06:00:00'),
(7, 'Farinaceous (like fresh meal)', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------




INSERT INTO `toxics` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 2, '2024-05-08 06:00:00'),
(2, 'Not Toxic', '', '', '', 2, '2024-05-08 06:00:00'),
(3, 'Toxic', '', '', '', 2, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `universal_outer_veil_appearances` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Two Rings (from 2 veils)', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Doubly-flared Ring', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, '\"Cogwheel\" Stellate', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Floccose (downy tuffs)', '', '', '5', 1, '2024-05-08 06:00:00'),
(6, 'Cortinate PV & Fibrillose Annular Zone', '', '', '5', 1, '2024-05-08 06:00:00'),
(7, 'Single Ring thick on edge', '', '', '5', 1, '2024-05-08 06:00:00'),
(8, 'Pendant (hanging)', '', '', '5', 1, '2024-05-08 06:00:00'),
(9, 'Subperonate', '', '', '5', 1, '2024-05-08 06:00:00'),
(10, 'Peronate (w/\"boot\")', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `universal_outer_veil_fates` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Disappearing', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Leaving fragments on cap', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------


INSERT INTO `universal_outer_veil_textures` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Membranous (skin-like)', '', '', '5', 1, '2024-05-08 06:00:00'),
(3, 'Cortinate (cobwebby)', '', '', '5', 1, '2024-05-08 06:00:00'),
(4, 'Fibillose (thready)', '', '', '5', 1, '2024-05-08 06:00:00'),
(5, 'Gelatinous (slimy)', '', '', '5', 1, '2024-05-08 06:00:00');

-- --------------------------------------------------------



INSERT INTO `veils` (`id`, `name`, `description`, `comments`, `source`, `entered_by`, `date_entered`) VALUES
(1, 'Not Entered', '', '', '', 1, '2024-05-08 06:00:00'),
(2, 'Flaring', 'The annulus is flaring upwards.', '', '7', 1, '2024-05-08 06:00:00'),
(3, 'Pendant', 'The veil is hanging downward from the stipe.', '', '7', 1, '2024-05-08 06:00:00'),
(4, 'Double Rings', 'Two visible veils..', '', '7', 1, '2024-05-08 06:00:00'),
(5, 'Ring Zone', 'The stipe is marked with the reminance of the ananulus', '', '7', 1, '2024-05-08 06:00:00'),
(6, 'Cortinate', 'The partial veil is cobweb-like or tread-like (Fibrillose)..', '', '7', 1, '2024-05-08 06:00:00'),
(7, 'Stellate', 'The partial veil resembles a cogwheel.', '', '7', 1, '2024-05-08 06:00:00'),
(8, 'Floccose', 'The partial veil is fluffy and down-like.', '', '7', 1, '2024-05-08 06:00:00'),
(9, 'Peronate', 'The stipe resembles a shealth-like boot or stocking', '', '7', 1, '2024-05-08 06:00:00');

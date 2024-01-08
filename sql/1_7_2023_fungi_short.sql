-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 07, 2024 at 06:57 PM
-- Server version: 8.0.35-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fungi_short`
--

-- --------------------------------------------------------

--
-- Table structure for table `annulus_positions`
--

CREATE TABLE `annulus_positions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` bigint NOT NULL,
  `entered_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `annulus_positions`
--

INSERT INTO `annulus_positions` (`id`, `name`, `comments`, `description`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 0, 1, '2023-11-16 12:00:00', '2023-11-16 12:00:00'),
(2, 'Superior:', '', 'Near the cap', 7, 1, '2023-11-16 12:00:00', '2023-11-16 12:00:00'),
(3, 'Apical:', '', 'upper half', 7, 1, '2023-11-16 12:00:00', '2023-11-16 12:00:00'),
(4, 'Median:', '', 'in the middle', 7, 1, '2023-11-16 12:00:00', '2023-11-16 12:00:00'),
(5, 'Inferior:', '', 'Lower half', 7, 1, '2023-11-16 12:00:00', '2023-11-16 12:00:00'),
(6, 'Basal:', '', 'Near the base', 7, 1, '2023-11-16 12:00:00', '2023-11-16 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cap_context_flesh_textures`
--

CREATE TABLE `cap_context_flesh_textures` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` bigint NOT NULL,
  `entered_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cap_context_flesh_textures`
--

INSERT INTO `cap_context_flesh_textures` (`id`, `name`, `comments`, `description`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Entered', '', '', 5, 2, '2023-11-16 12:00:00', '2023-11-16 12:00:00'),
(2, 'Soft', '', '', 5, 2, '2023-11-16 12:00:00', '2023-11-16 12:00:00'),
(3, 'Spongy', '', '', 5, 2, '2023-11-16 12:00:00', '2023-11-16 12:00:00'),
(4, 'Firm', '', '', 5, 2, '2023-11-16 12:00:00', '2023-11-16 12:00:00'),
(5, 'Compact', '', '', 5, 2, '2023-11-16 12:00:00', '2023-11-16 12:00:00'),
(6, 'Rigid', '', '', 5, 2, '2023-11-16 12:00:00', '2023-11-16 12:00:00'),
(7, 'Brittle', '', '', 5, 2, '2023-11-16 12:00:00', '2023-11-16 12:00:00'),
(8, 'Corky', '', '', 5, 2, '2023-11-16 12:00:00', '2023-11-16 12:00:00'),
(9, 'Other', '', '', 5, 2, '2023-11-16 12:00:00', '2023-11-16 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` bigint NOT NULL,
  `entered_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `comments`, `description`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Not Selected', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(2, 'USA', '', 'United States', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(3, 'MEX', '', 'Mexico', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(4, 'CAN', '', 'Canada', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_01_06_134941_create_sessions_table', 1),
(7, '2023_12_10_201255_create_specimens_table', 2),
(8, '2023_12_10_201256_create_cap_context_flesh_textures_table', 2),
(9, '2023_12_10_201257_create_annulus_positions_table', 2),
(10, '2023_12_10_201258_create_states_table', 2),
(11, '2023_12_10_201259_create_countries_table', 2),
(12, '2023_12_30_072105_create_member_list_clusters_table', 2),
(13, '2023_12_30_072255_create_specimen_clusters_table', 2),
(14, '2023_12_30_132950_create_specimen_groups_table', 2);

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
('UqWkDYikJO0cXLONbnxjJ3WOLnHt5d26DRw5qsUf', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:121.0) Gecko/20100101 Firefox/121.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVEpkTEYyam9PYThQMGtwdTBFYVUwem9GU1VicnFSSHB4M0JMc3dDYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VyL3Byb2ZpbGUiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJDIxeFJzTnEzaXZza0ovRDc1R0RIRE9KUFVCamxFV0N0MGZqMXloWXFmWGZkV1ZkWi9iRHBpIjt9', 1704673151),
('xAAedf6z2aXhOhVLNxCmNewA9ieWqq6CK9N7vPBL', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:121.0) Gecko/20100101 Firefox/121.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoic0pERG9TOEpvSTBMUWZaNmIyVU1TOTA0ZE5FM0dacnVuTmg5Vnp5bCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VyL3Byb2ZpbGUiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJDIxeFJzTnEzaXZza0ovRDc1R0RIRE9KUFVCamxFV0N0MGZqMXloWXFmWGZkV1ZkWi9iRHBpIjt9', 1704669491);

-- --------------------------------------------------------

--
-- Table structure for table `specimens`
--

CREATE TABLE `specimens` (
  `id` bigint UNSIGNED NOT NULL,
  `specimen_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specimen_owner` int NOT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `common_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_month_found` int NOT NULL,
  `date_day_found` int NOT NULL,
  `date_year_found` int NOT NULL,
  `location_found_county` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_found_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int NOT NULL,
  `country` int NOT NULL,
  `annulus_positions` int NOT NULL,
  `cap_context_flesh_texture` int NOT NULL,
  `entered_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specimens`
--

INSERT INTO `specimens` (`id`, `specimen_name`, `specimen_owner`, `comments`, `common_name`, `date_month_found`, `date_day_found`, `date_year_found`, `location_found_county`, `location_found_city`, `state`, `country`, `annulus_positions`, `cap_context_flesh_texture`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Special Specimen', 1, 'Thanks for asking...', 'Otherworldly', 12, 30, 2023, 'Baldwin', 'Fairhope', 1, 1, 3, 4, 1, '2023-12-31 13:18:24', '2023-12-31 13:18:24'),
(2, 'Super duper', 1, 'wait for it...', 'This or that', 12, 30, 2023, 'Baldwin', 'Daphne', 1, 1, 3, 4, 1, '2023-12-31 13:19:19', '2023-12-31 13:19:19');

-- --------------------------------------------------------

--
-- Table structure for table `specimen_clusters`
--

CREATE TABLE `specimen_clusters` (
  `id` bigint UNSIGNED NOT NULL,
  `member_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specimen_clusters`
--

INSERT INTO `specimen_clusters` (`id`, `member_id`, `name`, `description`, `comments`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Parasol - yard - front & back', '', '', 1, '2023-12-31 01:28:53', '2023-12-31 01:28:53'),
(2, 1, 'Octo Hibby Cluster', 'Octo Cluster Hibby', 'Cluster Hibby Octo', 1, '2023-12-31 01:28:53', '2023-12-31 01:28:53'),
(3, 1, 'Wroggo Los No', 'No Los Wroggo', 'Los Wroggo No', 1, '2023-12-31 01:28:53', '2023-12-31 01:28:53');

-- --------------------------------------------------------

--
-- Table structure for table `specimen_groups`
--

CREATE TABLE `specimen_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `member_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entered_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specimen_groups`
--

INSERT INTO `specimen_groups` (`id`, `member_id`, `name`, `description`, `comments`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Home', '', '', 1, '2023-12-31 01:28:53', '2023-12-31 01:28:53'),
(2, 1, 'January', '', '', 1, '2023-12-31 01:28:53', '2023-12-31 01:28:53'),
(3, 1, 'Blakeley State Park', '', '', 1, '2023-12-31 01:28:53', '2023-12-31 01:28:53');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` bigint NOT NULL,
  `entered_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `comments`, `description`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
(1, 'Alabama', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(2, 'Alaska', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(3, 'Arizona', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(4, 'Arkansas', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(5, 'California', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(6, 'Colorado', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(7, 'Connecticut', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(8, 'Delaware', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(9, 'District of Columbia', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(10, 'Florida', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(11, 'Georgia', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(12, 'Hawaii', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(13, 'Idaho', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(14, 'Illinois', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(15, 'Indiana', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(16, 'Iowa', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(17, 'Kansas', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(18, 'Kentucky', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(19, 'Louisiana', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(20, 'Maine', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(21, 'Maryland', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(22, 'Massachusetts', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(23, 'Michigan', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(24, 'Minnesota', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(25, 'Mississippi', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(26, 'Missouri', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(27, 'Montana', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(28, 'Nebraska', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(29, 'Nevada', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(30, 'New Hampshire', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(31, 'New Jersey', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(32, 'New Mexico', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(33, 'New York', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(34, 'North Carolina', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(35, 'North Dakota', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(36, 'Ohio', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(37, 'Oklahoma', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(38, 'Oregon', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(39, 'Pennsylvania', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(40, 'Rhode Island', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(41, 'South Carolina', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(42, 'South Dakota', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(43, 'Tennessee', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(44, 'Texas', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(45, 'Utah', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(46, 'Vermont', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(47, 'Virginia', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(48, 'Washington', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(49, 'West Virginia', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(50, 'Wisconsin', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(51, 'Wyoming', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(52, 'Alberta', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(53, 'British Columbia', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(54, 'Manitoba', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(55, 'New Brunswick', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(56, 'Newfoundland', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(57, 'Nova Scotia', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(58, 'Northwest Territories', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(59, 'Nunavut', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(60, 'Ontario', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(61, 'Prince Edward Island', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(62, 'Quebec', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(63, 'Saskatchewan', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(64, 'Yukon', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(65, 'Aguascalientes', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(66, 'Baja California', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(67, 'Baja California Sur', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(68, 'Campeche', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(69, 'Chiapas', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(70, 'Chihuahua', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(71, 'Coahuila', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(72, 'Colima', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(73, 'Distrito Federal', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(74, 'Durango', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(75, 'Guanajuato', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(76, 'Guerrero', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(77, 'Hidalgo', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(78, 'Jalisco', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(79, 'Mexico', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(80, 'Michoacan', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(81, 'Morelos', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(82, 'Nayarit', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(83, 'Nuevo Leon', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(84, 'Oaxaca', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(85, 'Puebla', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(86, 'Queretaro', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(87, 'Quintana Roo', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(88, 'San Luis Potosi', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(89, 'Sinaloa', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(90, 'Sonora', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(91, 'Tabasco', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(92, 'Tamaulipas', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(93, 'Tlaxcala', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(94, 'Veracruz', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(95, 'Yucatan', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(96, 'Zacatecas', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00'),
(98, 'Not Selected', '', '', 1, 1, '2023-11-17 00:00:00', '2023-11-17 00:00:00');

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
(1, 'Will Johnston', 'willgb54@yahoo.com', NULL, '$2y$12$21xRsNq3ivskJ/D75GDHDOJPUBjlEWCt0fj1yhYqfXfdWVdZ/bDpi', NULL, NULL, NULL, 'pBST4EymJBJPgyFiPLI78FOLHVGX2z07lkkWSzVIZKrdHlUZXCgRADzIi2qv', NULL, NULL, '2024-01-06 20:00:19', '2024-01-06 20:00:19'),
(2, 'Jakson Jonson', 'leo@treadway.com', NULL, '$2y$12$KjCq4lsklP9VX4/LAY0cjOFMPLhaNPne/XGSnqE3XUfnHhUbhkJ2K', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-07 22:17:07', '2024-01-07 22:17:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `annulus_positions`
--
ALTER TABLE `annulus_positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cap_context_flesh_textures`
--
ALTER TABLE `cap_context_flesh_textures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `member_list_clusters`
--
ALTER TABLE `member_list_clusters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `specimens`
--
ALTER TABLE `specimens`
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
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `annulus_positions`
--
ALTER TABLE `annulus_positions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cap_context_flesh_textures`
--
ALTER TABLE `cap_context_flesh_textures`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member_list_clusters`
--
ALTER TABLE `member_list_clusters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specimens`
--
ALTER TABLE `specimens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `specimen_clusters`
--
ALTER TABLE `specimen_clusters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `specimen_groups`
--
ALTER TABLE `specimen_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- MySQL dump 10.13  Distrib 8.0.42, for macos15.2 (arm64)
--
-- Host: localhost    Database: mrdbid_development
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abundances`
--

DROP TABLE IF EXISTS `abundances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abundances` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abundances`
--

LOCK TABLES `abundances` WRITE;
/*!40000 ALTER TABLE `abundances` DISABLE KEYS */;
/*!40000 ALTER TABLE `abundances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `all_group_mushrooms`
--

DROP TABLE IF EXISTS `all_group_mushrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `all_group_mushrooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `all_group` bigint NOT NULL,
  `mushroom` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_group_mushrooms`
--

LOCK TABLES `all_group_mushrooms` WRITE;
/*!40000 ALTER TABLE `all_group_mushrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `all_group_mushrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `all_groups`
--

DROP TABLE IF EXISTS `all_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `all_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_groups`
--

LOCK TABLES `all_groups` WRITE;
/*!40000 ALTER TABLE `all_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `all_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `annulus_positions`
--

DROP TABLE IF EXISTS `annulus_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `annulus_positions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annulus_positions`
--

LOCK TABLES `annulus_positions` WRITE;
/*!40000 ALTER TABLE `annulus_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `annulus_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2025-06-25 00:18:33.702047','2025-06-25 00:18:33.702049'),('schema_sha1','dfc05c420085343cdefb62618a91ec056e33b4ec','2025-06-25 00:18:33.704973','2025-06-25 00:18:33.704974');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `item_code` varchar(255) DEFAULT NULL,
  `comment` text,
  `my_rating` int DEFAULT NULL,
  `my_comment` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulb_types`
--

DROP TABLE IF EXISTS `bulb_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulb_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulb_types`
--

LOCK TABLES `bulb_types` WRITE;
/*!40000 ALTER TABLE `bulb_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulb_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camera_makes`
--

DROP TABLE IF EXISTS `camera_makes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camera_makes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camera_makes`
--

LOCK TABLES `camera_makes` WRITE;
/*!40000 ALTER TABLE `camera_makes` DISABLE KEYS */;
/*!40000 ALTER TABLE `camera_makes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camera_models`
--

DROP TABLE IF EXISTS `camera_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camera_models` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camera_models`
--

LOCK TABLES `camera_models` WRITE;
/*!40000 ALTER TABLE `camera_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `camera_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cameras`
--

DROP TABLE IF EXISTS `cameras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cameras` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `camera_makes` bigint NOT NULL,
  `camera_models` bigint NOT NULL,
  `lens` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cameras`
--

LOCK TABLES `cameras` WRITE;
/*!40000 ALTER TABLE `cameras` DISABLE KEYS */;
/*!40000 ALTER TABLE `cameras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pileus_context_flesh_textures`
--

DROP TABLE IF EXISTS `pileus_context_flesh_textures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pileus_context_flesh_textures` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pileus_context_flesh_textures`
--

LOCK TABLES `pileus_context_flesh_textures` WRITE;
/*!40000 ALTER TABLE `pileus_context_flesh_textures` DISABLE KEYS */;
/*!40000 ALTER TABLE `pileus_context_flesh_textures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pileus_margin_shapes`
--

DROP TABLE IF EXISTS `pileus_margin_shapes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pileus_margin_shapes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pileus_margin_shapes`
--

LOCK TABLES `pileus_margin_shapes` WRITE;
/*!40000 ALTER TABLE `pileus_margin_shapes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pileus_margin_shapes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pileus_margin_types`
--

DROP TABLE IF EXISTS `pileus_margin_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pileus_margin_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pileus_margin_types`
--

LOCK TABLES `pileus_margin_types` WRITE;
/*!40000 ALTER TABLE `pileus_margin_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `pileus_margin_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pileus_shape_top_views`
--

DROP TABLE IF EXISTS `pileus_shape_top_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pileus_shape_top_views` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pileus_shape_top_views`
--

LOCK TABLES `pileus_shape_top_views` WRITE;
/*!40000 ALTER TABLE `pileus_shape_top_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `pileus_shape_top_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pileus_shapes`
--

DROP TABLE IF EXISTS `pileus_shapes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pileus_shapes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pileus_shapes`
--

LOCK TABLES `pileus_shapes` WRITE;
/*!40000 ALTER TABLE `pileus_shapes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pileus_shapes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pileus_surface_drynesses`
--

DROP TABLE IF EXISTS `pileus_surface_drynesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pileus_surface_drynesses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pileus_surface_drynesses`
--

LOCK TABLES `pileus_surface_drynesses` WRITE;
/*!40000 ALTER TABLE `pileus_surface_drynesses` DISABLE KEYS */;
/*!40000 ALTER TABLE `pileus_surface_drynesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pileus_surface_textures`
--

DROP TABLE IF EXISTS `pileus_surface_textures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pileus_surface_textures` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pileus_surface_textures`
--

LOCK TABLES `pileus_surface_textures` WRITE;
/*!40000 ALTER TABLE `pileus_surface_textures` DISABLE KEYS */;
/*!40000 ALTER TABLE `pileus_surface_textures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chem_reactions`
--

DROP TABLE IF EXISTS `chem_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chem_reactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chem_reactions`
--

LOCK TABLES `chem_reactions` WRITE;
/*!40000 ALTER TABLE `chem_reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `chem_reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cluster_mushrooms`
--

DROP TABLE IF EXISTS `cluster_mushrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cluster_mushrooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cluster` bigint NOT NULL,
  `mushroom` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cluster_mushrooms`
--

LOCK TABLES `cluster_mushrooms` WRITE;
/*!40000 ALTER TABLE `cluster_mushrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `cluster_mushrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clusters`
--

DROP TABLE IF EXISTS `clusters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clusters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clusters`
--

LOCK TABLES `clusters` WRITE;
/*!40000 ALTER TABLE `clusters` DISABLE KEYS */;
/*!40000 ALTER TABLE `clusters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `latin_name` varchar(255) DEFAULT NULL,
  `common_name` varchar(255) DEFAULT NULL,
  `color_group` int DEFAULT NULL,
  `hex` varchar(255) DEFAULT NULL,
  `sequence_number` int DEFAULT NULL,
  `r_val` int DEFAULT NULL,
  `g_val` int DEFAULT NULL,
  `b_val` int DEFAULT NULL,
  `closest_websafe_color` varchar(255) DEFAULT NULL,
  `cwc_r` int DEFAULT NULL,
  `cwc_g` int DEFAULT NULL,
  `cwc_b` int DEFAULT NULL,
  `image_file` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `display_options`
--

DROP TABLE IF EXISTS `display_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `display_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `display_options`
--

LOCK TABLES `display_options` WRITE;
/*!40000 ALTER TABLE `display_options` DISABLE KEYS */;
INSERT INTO `display_options` VALUES (1,'Not Entered','','',1,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(2,'text_box_number_mm','','',1,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(3,'text_box_number_um','','',1,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(4,'text_box_number','','',1,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(5,'text_box_string','','',1,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(6,'color','','',1,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(7,'taste','','',1,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(8,'odor','','',1,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(9,'radio','','',1,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(10,'drop-down','','',1,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(11,'state','','',1,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(12,'country','','',1,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(13,'texture','','',1,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(14,'yes no','','',1,'2024-10-09 04:24:41.000000','2024-10-09 04:24:41.000000'),(15,'abundance','','',1,'2024-10-09 04:25:17.000000','2024-10-09 04:25:17.000000'),(16,'text box number grams measurement','','',1,'2024-10-09 04:25:54.000000','2024-10-09 04:25:54.000000'),(17,'Genus Species','','',1,'2024-10-09 04:36:35.000000','2024-10-09 04:36:35.000000');
/*!40000 ALTER TABLE `display_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dna_sequences`
--

DROP TABLE IF EXISTS `dna_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dna_sequences` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mushroom_id` varchar(255) DEFAULT NULL,
  `notes` text,
  `dna_barcode_its` text,
  `genbank_number_url` varchar(255) DEFAULT NULL,
  `genbank_accession_number` varchar(255) DEFAULT NULL,
  `herbarium_catalog_number` varchar(255) DEFAULT NULL,
  `mycomap_blast_results` varchar(255) DEFAULT NULL,
  `provisional_species_name` varchar(255) DEFAULT NULL,
  `sequencing_technology` varchar(255) DEFAULT NULL,
  `trace_files_raw_dna_data` varchar(255) DEFAULT NULL,
  `voucher_number` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dna_sequences`
--

LOCK TABLES `dna_sequences` WRITE;
/*!40000 ALTER TABLE `dna_sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `dna_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epithets`
--

DROP TABLE IF EXISTS `epithets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `epithets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epithets`
--

LOCK TABLES `epithets` WRITE;
/*!40000 ALTER TABLE `epithets` DISABLE KEYS */;
/*!40000 ALTER TABLE `epithets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fungus_types`
--

DROP TABLE IF EXISTS `fungus_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fungus_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fungus_types`
--

LOCK TABLES `fungus_types` WRITE;
/*!40000 ALTER TABLE `fungus_types` DISABLE KEYS */;
INSERT INTO `fungus_types` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Lamellaes - Gills','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Pores','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Teeth','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Cups','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Stinkhorn','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `fungus_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lamella_attachments`
--

DROP TABLE IF EXISTS `lamella_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lamella_attachments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lamella_attachments`
--

LOCK TABLES `lamella_attachments` WRITE;
/*!40000 ALTER TABLE `lamella_attachments` DISABLE KEYS */;
INSERT INTO `lamella_attachments` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Free - remote','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Free - close','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Adnate - horizontal','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Adnate - ascending','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Adnexed (almost free)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(7,'Sinuate','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(8,'Emarginate (notched)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(9,'Decurrent - long','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(10,'Decurrent - short','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(11,'Seceding (breaking away)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(12,'Uncinate (w/decurrent tooth)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(13,'Collared','Lamellaes are attached to a collar or ring that encircles the stipe.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `lamella_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lamella_breadths`
--

DROP TABLE IF EXISTS `lamella_breadths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lamella_breadths` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lamella_breadths`
--

LOCK TABLES `lamella_breadths` WRITE;
/*!40000 ALTER TABLE `lamella_breadths` DISABLE KEYS */;
INSERT INTO `lamella_breadths` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Broad','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Free - close','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Ventricose','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `lamella_breadths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lamella_context_flesh_latex_abundances`
--

DROP TABLE IF EXISTS `lamella_context_flesh_latex_abundances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lamella_context_flesh_latex_abundances` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lamella_context_flesh_latex_abundances`
--

LOCK TABLES `lamella_context_flesh_latex_abundances` WRITE;
/*!40000 ALTER TABLE `lamella_context_flesh_latex_abundances` DISABLE KEYS */;
/*!40000 ALTER TABLE `lamella_context_flesh_latex_abundances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lamella_edges`
--

DROP TABLE IF EXISTS `lamella_edges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lamella_edges` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lamella_edges`
--

LOCK TABLES `lamella_edges` WRITE;
/*!40000 ALTER TABLE `lamella_edges` DISABLE KEYS */;
INSERT INTO `lamella_edges` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Even - entire','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Serrate','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Serrulate','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Eroded (\"gnawed\")','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Fimbriate (fringed)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(7,'Marginate (diff. color)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(8,'Crenate (scalloped)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(9,'Acute','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(10,'Obtuse (blunt)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(11,'Crisped (crinkled)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `lamella_edges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lamella_spacings`
--

DROP TABLE IF EXISTS `lamella_spacings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lamella_spacings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lamella_spacings`
--

LOCK TABLES `lamella_spacings` WRITE;
/*!40000 ALTER TABLE `lamella_spacings` DISABLE KEYS */;
INSERT INTO `lamella_spacings` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Crowded','The Lamellaes are tightly close together.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Close','The Lamellaes are close together.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Subdistant','The Lamellaes are spaced apart.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Distant','The Lamellaes are widely spaced apart.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `lamella_spacings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lamella_thicknesses`
--

DROP TABLE IF EXISTS `lamella_thicknesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lamella_thicknesses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lamella_thicknesses`
--

LOCK TABLES `lamella_thicknesses` WRITE;
/*!40000 ALTER TABLE `lamella_thicknesses` DISABLE KEYS */;
INSERT INTO `lamella_thicknesses` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Average','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Thick','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Tapering','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `lamella_thicknesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitats`
--

DROP TABLE IF EXISTS `habitats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitats` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitats`
--

LOCK TABLES `habitats` WRITE;
/*!40000 ALTER TABLE `habitats` DISABLE KEYS */;
INSERT INTO `habitats` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Terrestrial (on soil - bare )','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Terrestrial (on soil - burned )','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Terrestrial (on soil - disturbed )','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Lignicolous (on wood) - what kind of tree?','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Humicolous (on humus, duff) - conifer, other?','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(7,'Coprophious (on dung) what kind?','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(8,'In grassy area - lawn, pasture, etc?','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(9,'In forest - conifer, hardwood, mixed?','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(16,'fungicolous','mushroom mycelia grow in other mushrooms','p 7, How to Identify Mushrooms to Genus I: Macroscopic Features - David L. Largent',13,'2023-03-16 21:46:17.000000','2023-03-16 21:46:17.000000');
/*!40000 ALTER TABLE `habitats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habits`
--

DROP TABLE IF EXISTS `habits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habits` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habits`
--

LOCK TABLES `habits` WRITE;
/*!40000 ALTER TABLE `habits` DISABLE KEYS */;
INSERT INTO `habits` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Single, solitary','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Scattered (1-2 feet apart)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Gregarious (growing in a group)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Caespitose (clustered, not joined)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Connate (fused at base)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(7,'Imbricate (overlapping)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(8,'In troops or rings','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `habits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_mushroom_thumbnails`
--

DROP TABLE IF EXISTS `image_mushroom_thumbnails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_mushroom_thumbnails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_mushroom` bigint NOT NULL,
  `thumbnail_file_address` varchar(255) DEFAULT NULL,
  `image_width` int DEFAULT NULL,
  `image_height` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_mushroom_thumbnails`
--

LOCK TABLES `image_mushroom_thumbnails` WRITE;
/*!40000 ALTER TABLE `image_mushroom_thumbnails` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_mushroom_thumbnails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_mushrooms`
--

DROP TABLE IF EXISTS `image_mushrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_mushrooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mushroom` bigint NOT NULL,
  `part` bigint NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `image_file_address` varchar(255) DEFAULT NULL,
  `image_width` int DEFAULT NULL,
  `image_height` int DEFAULT NULL,
  `camera_make` bigint NOT NULL,
  `camera_model` varchar(255) DEFAULT NULL,
  `lens` varchar(255) DEFAULT NULL,
  `exposure` varchar(255) DEFAULT NULL,
  `aperture` varchar(255) DEFAULT NULL,
  `iso` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_mushrooms`
--

LOCK TABLES `image_mushrooms` WRITE;
/*!40000 ALTER TABLE `image_mushrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_mushrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lens`
--

DROP TABLE IF EXISTS `lens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `make` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lens`
--

LOCK TABLES `lens` WRITE;
/*!40000 ALTER TABLE `lens` DISABLE KEYS */;
INSERT INTO `lens` VALUES (1,'Not Entered','','','','2024-03-31 00:52:23.000000','2024-03-31 00:52:23.000000'),(2,'Nikon','Nikon ED AF Micro Nikkor 70-180mm 1:4.5-5.6 D','','','2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `lens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mb_lists`
--

DROP TABLE IF EXISTS `mb_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mb_lists` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `taxon_name` varchar(255) DEFAULT NULL,
  `authors` varchar(255) DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT NULL,
  `year_of_effective_publication` int DEFAULT NULL,
  `name_status` varchar(255) DEFAULT NULL,
  `mycobank_number` bigint DEFAULT NULL,
  `hyperlink` varchar(255) DEFAULT NULL,
  `classification` text,
  `current_name` varchar(255) DEFAULT NULL,
  `synonymy` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mb_lists`
--

LOCK TABLES `mb_lists` WRITE;
/*!40000 ALTER TABLE `mb_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `mb_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mr_character_mushrooms`
--

DROP TABLE IF EXISTS `mr_character_mushrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mr_character_mushrooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mr_character` bigint NOT NULL,
  `mushroom` bigint NOT NULL,
  `character_value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mr_character_mushrooms`
--

LOCK TABLES `mr_character_mushrooms` WRITE;
/*!40000 ALTER TABLE `mr_character_mushrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mr_character_mushrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mr_characters`
--

DROP TABLE IF EXISTS `mr_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mr_characters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `display_option` bigint NOT NULL,
  `part` bigint NOT NULL,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mr_characters`
--

LOCK TABLES `mr_characters` WRITE;
/*!40000 ALTER TABLE `mr_characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mr_characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mushroom_ages`
--

DROP TABLE IF EXISTS `mushroom_ages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mushroom_ages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mushroom_ages`
--

LOCK TABLES `mushroom_ages` WRITE;
/*!40000 ALTER TABLE `mushroom_ages` DISABLE KEYS */;
INSERT INTO `mushroom_ages` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Button','very young','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Young','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Mature','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Past Prime','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `mushroom_ages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mushroom_storage_locations`
--

DROP TABLE IF EXISTS `mushroom_storage_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mushroom_storage_locations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mushroom_storage_locations`
--

LOCK TABLES `mushroom_storage_locations` WRITE;
/*!40000 ALTER TABLE `mushroom_storage_locations` DISABLE KEYS */;
INSERT INTO `mushroom_storage_locations` VALUES (1,'Not Entered','Not Entered','None',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Observation Only - No specimen collected','','None',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Specimen Collector','This is you, if you collected this specimen','',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Herbarium','','',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `mushroom_storage_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mushrooms`
--

DROP TABLE IF EXISTS `mushrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mushrooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mushroom_name` varchar(255) DEFAULT NULL,
  `description` text,
  `state` bigint NOT NULL,
  `country` bigint NOT NULL,
  `fungus_type` bigint NOT NULL,
  `mushroom_storage_location` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mushrooms`
--

LOCK TABLES `mushrooms` WRITE;
/*!40000 ALTER TABLE `mushrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mushrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mycelium_textures`
--

DROP TABLE IF EXISTS `mycelium_textures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mycelium_textures` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mycelium_textures`
--

LOCK TABLES `mycelium_textures` WRITE;
/*!40000 ALTER TABLE `mycelium_textures` DISABLE KEYS */;
/*!40000 ALTER TABLE `mycelium_textures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odors`
--

DROP TABLE IF EXISTS `odors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odors`
--

LOCK TABLES `odors` WRITE;
/*!40000 ALTER TABLE `odors` DISABLE KEYS */;
INSERT INTO `odors` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'None','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Fruity','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Lemony','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Anise (licorice)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Farinaceous (like fresh meal)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(7,'Pungent','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(8,'Nauseous','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(9,'Nitrous','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(10,'Earthy','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(11,'Spermatic','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(12,'Garlic','','',4,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(13,'Maraschino cherries','','',4,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(14,'Sewer gas','','',4,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(15,'spicy - red hots - dirty socks','','',4,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `odors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partial_inner_veil_annular_ring_positions`
--

DROP TABLE IF EXISTS `partial_inner_veil_annular_ring_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partial_inner_veil_annular_ring_positions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partial_inner_veil_annular_ring_positions`
--

LOCK TABLES `partial_inner_veil_annular_ring_positions` WRITE;
/*!40000 ALTER TABLE `partial_inner_veil_annular_ring_positions` DISABLE KEYS */;
INSERT INTO `partial_inner_veil_annular_ring_positions` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'None','Does not have annulus ring','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Superior','Near the cap','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Apical','upper half','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Median','in the middle','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Inferior','Lower half','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(7,'Basal','Near the base','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `partial_inner_veil_annular_ring_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partial_inner_veil_appearances`
--

DROP TABLE IF EXISTS `partial_inner_veil_appearances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partial_inner_veil_appearances` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partial_inner_veil_appearances`
--

LOCK TABLES `partial_inner_veil_appearances` WRITE;
/*!40000 ALTER TABLE `partial_inner_veil_appearances` DISABLE KEYS */;
INSERT INTO `partial_inner_veil_appearances` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Two Rings (from 2 veils)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Doubly-flared Ring','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'\"Cogwheel\" Stellate','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Floccose (downy tuffs)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Cortinate PV & Fibrillose Annular Zone','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(7,'Single Ring thick on edge','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(8,'Pendant (hanging)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(9,'Subperonate','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(10,'Peronate (w/\"boot\")','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `partial_inner_veil_appearances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partial_inner_veil_fates`
--

DROP TABLE IF EXISTS `partial_inner_veil_fates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partial_inner_veil_fates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partial_inner_veil_fates`
--

LOCK TABLES `partial_inner_veil_fates` WRITE;
/*!40000 ALTER TABLE `partial_inner_veil_fates` DISABLE KEYS */;
INSERT INTO `partial_inner_veil_fates` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Disappearing - Evanescent','can only be detected in button stage','',4,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Persistent','leaving remnants on cap','',4,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `partial_inner_veil_fates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partial_inner_veil_textures`
--

DROP TABLE IF EXISTS `partial_inner_veil_textures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partial_inner_veil_textures` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partial_inner_veil_textures`
--

LOCK TABLES `partial_inner_veil_textures` WRITE;
/*!40000 ALTER TABLE `partial_inner_veil_textures` DISABLE KEYS */;
INSERT INTO `partial_inner_veil_textures` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Membranous (skin-like)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Cortinate (cobwebby)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Fibillose (thready)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Gelatinous (slimy)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `partial_inner_veil_textures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT INTO `parts` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Basic','default data that every specimen will have','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Cap - Pileus','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Lamellae - Gills','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Stem - Stipe','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Veil','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(7,'Mycelium','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(8,'Spores','micro for spores is here - not in micro','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(9,'Micro','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(10,'DNA','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(11,'Habitat','Habitat, Plant Assoc ','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(12,'Rhizomorph','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(13,'Chemical Reaction','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(14,'Color','this will allow color selection for ALL color characters to be in one place','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(15,'Location','lat lon city county state country','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(16,'Identification','species genus inaturalist etc','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(17,'Storage','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plant_associations`
--

DROP TABLE IF EXISTS `plant_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plant_associations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mushroom_id` bigint NOT NULL,
  `plant_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant_associations`
--

LOCK TABLES `plant_associations` WRITE;
/*!40000 ALTER TABLE `plant_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `plant_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plants`
--

DROP TABLE IF EXISTS `plants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plants`
--

LOCK TABLES `plants` WRITE;
/*!40000 ALTER TABLE `plants` DISABLE KEYS */;
/*!40000 ALTER TABLE `plants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possible_matches`
--

DROP TABLE IF EXISTS `possible_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `possible_matches` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possible_matches`
--

LOCK TABLES `possible_matches` WRITE;
/*!40000 ALTER TABLE `possible_matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `possible_matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preservation_methods`
--

DROP TABLE IF EXISTS `preservation_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preservation_methods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preservation_methods`
--

LOCK TABLES `preservation_methods` WRITE;
/*!40000 ALTER TABLE `preservation_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `preservation_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_belongs_tos`
--

DROP TABLE IF EXISTS `project_belongs_tos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_belongs_tos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_belongs_tos`
--

LOCK TABLES `project_belongs_tos` WRITE;
/*!40000 ALTER TABLE `project_belongs_tos` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_belongs_tos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rhizomorph_textures`
--

DROP TABLE IF EXISTS `rhizomorph_textures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rhizomorph_textures` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rhizomorph_textures`
--

LOCK TABLES `rhizomorph_textures` WRITE;
/*!40000 ALTER TABLE `rhizomorph_textures` DISABLE KEYS */;
/*!40000 ALTER TABLE `rhizomorph_textures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `soil_types`
--

DROP TABLE IF EXISTS `soil_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soil_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soil_types`
--
--
-- Table structure for table `source_data_types`
--

DROP TABLE IF EXISTS `source_data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `source_data_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `comments` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_data_types`
--

LOCK TABLES `source_data_types` WRITE;
/*!40000 ALTER TABLE `source_data_types` DISABLE KEYS */;
INSERT INTO `source_data_types` VALUES (1,'Not Entered','','','2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Book','','','2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Website','','','2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Magazine','','','2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Chart','like Scates','','2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Database','','','2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `source_data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SourceData`
--



LOCK TABLES `sources` WRITE;
/*!40000 ALTER TABLE `sources` DISABLE KEYS */;
INSERT INTO `sources` VALUES (1,'Introductory Mycology','C. J. Alexopoulos, C. W. Mims,  M. Blackwell',NULL,'https://amzn.to/4f8rMUJ','','I have Fourth Edition, Copyright 1996. Look for used.',10,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(2,'Ainsworth & Bisbys Dictionary of the Fungi 10th Edition','P. M. Kirk, P. F. Cannon, D. W. Minter and J. A. Stalpers',NULL,'https://amzn.to/49ztFZf',2,'Not light reading. ',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(3,'Illustrated Dictionary of Mycology Second Edition','Miguel Ulloa and Richard T. Hanlin',NULL,'https://amzn.to/3BwPADK',2,'Wonderful book with lot of information and incredible pictures.',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(4,'Mushrooms Demystified Second Edition','David Arora',NULL,'https://amzn.to/3DdH511',2,'This is the one book to buy if you only buy one.',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(5,'Easy Guide to Mushrooms Descriptions','Kit Scates',NULL,'',5,'Buy here: https://fungi.com/products/easy-mushroom-identification-charts You need this.',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(6,'Easy Key to Common Gilled Mushrooms','Kit Scates',NULL,'',5,'Buy here: https://fungi.com/products/easy-mushroom-identification-charts  You need this.',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(7,'https://mycologyst.art/mushroom-identification/mushroom-morphology','Unknown',NULL,'',3,'',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(8,'www.mushroomexpert.com/index.html','Michael Kuo',NULL,'',3,'Kuo, Michael (2022). Mushroomexpert.com homepage. Retrieved April 5, 2022 from the Mushroomexpert.Com website: www.mushroomexpert.com/index.html',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(9,'Fungal Families of the World','P. F. Cannon and P. M. Kirk',NULL,'https://amzn.to/3OQaRLN',2,'',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(10,'How to Know the Non-Gilled Fleshy Fungi','Helen V. Smith Alexander H. Smith',NULL,'https://amzn.to/4iHnF50',2,'',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(11,'How to Know the gilled mushrooms','Alexander H. Smith Helen V. Smith Nancy S. Weber',NULL,'https://amzn.to/49AHy9O',2,'',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(12,'National Audubon Society Field Guide to North American Mushrooms','Gary H. Lincoff',NULL,'https://amzn.to/3BqkiP6',2,'',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(13,'How to Identify Mushrooms to Genus I:  Macroscopic Features','David L. Largent',NULL,'https://amzn.to/4ffAErE',2,'',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(14,'How to Identify Mushrooms to Genus III:  Microscopic Features','David Largent David Johnson Roy Watling (Consultant)',NULL,'https://amzn.to/49OABC9',2,'',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(15,'Identification of the Larger Fungi Kindle Edition','Roy Watling',NULL,'https://amzn.to/49wsI3S',2,'Be careful with this one if you attempt to get the paper version. The Kindle version text is good, but detail of the images is lacking. I tried to get the exact paper version and ran across some sort of duplicate ISBN number issue. ',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(16,'North American Mushrooms A Field Guide to Edible and Inedible Fungi','Dr. Orson K. Miller Jr. and Hope H. Miller',NULL,'https://amzn.to/4gummUX',2,'',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(17,'Mushrooms of the Southeast','Todd F. Elliott and Steven L. Stephenson',NULL,'https://amzn.to/3OQpn6c',2,'',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(18,'Mushrooms of the Gulf Coast States A Field Guide to Texas, Louisiana, Mississippi, Alabama, and Florida','Alan E. Bessette Arleen R. Bessette David P. Lewis',NULL,'https://amzn.to/4gNz3ur',2,'',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(19,'Mushrooms How to Identify and Gather Wild Mushrooms and Other Fungi','DK? Thomas Lessoe?',NULL,'https://amzn.to/4fhE9O6',2,'',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(20,'Mushrooms of the Midwest','Michael Kuo and Andrew S. Methven',NULL,'https://amzn.to/4g9yOtF',2,'Michael Kuo of The Mushroom Expert website',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(21,'North American Boletes A Color Guide to the Fleshy Pored Mushrooms','Alan E. Bessette, William C. Roody, and Arleen R. Bessette',NULL,'https://amzn.to/3ZPxKoM',2,'',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(22,'MBList','',NULL,'',6,'',NULL,NULL,'2023-07-10 00:00:00.000000','2023-07-10 00:00:00.000000'),(23,'Will Johnston','Will Johnston',NULL,'',1,'',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(24,'Comparison of Different Drying Methods for Recovery of Mushroom DNA','Shouxian Wang - corresponding author Yu Liu and Jianping Xu corresponding author',NULL,'',3,'Wang S, Liu Y, Xu J. Comparison of Different Drying Methods for Recovery of Mushroom DNA. Sci Rep. 2017 Jun 7;7(1):3008. doi: 10.1038/s41598-017-03570-7. PMID: 28592865; PMCID: PMC5462775.',NULL,NULL,'2024-06-02 10:05:27.000000','2024-06-02 10:05:27.000000'),(26,'The Beginners\' Guide to Mushrooms','Britt A. Bunyard & Tavis Lynch','','https://amzn.to/3ZxHO4B',5,'',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(27,'The Lives of Fungi A Natural History of Our Planet\'s Decomposers','Britt A. Bunyard','','https://amzn.to/3BqJwNi',5,'',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(28,'An Introductory To The Taxonomy And Nomenclature Of Fungi','G. R. Bisby, M.A., Ph.D.','','',5,'Copyright 1945, may be hard to come by. Dictionary of the Fungi is known as Ainsworth & Bisby\'s Dictionary Of The Fungi. That Bisby.',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(29,'Edible Wild Mushroom Foraging and Identification Presented by the Alabama Mushroom Society','Anthoni Goodman PhD','','',5,'Buy Here:  https://alabamamushroomsociety.org/recommended-books',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(31,'Healing Mushrooms A Practical Guide to Medicinal Mushrooms','Richard Bray','','https://amzn.to/4gm4tHY',5,'',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(32,'Studying the DISCOMYCETES from initiation to advance levels','René Dougoud with collaboratin of Jean-Paul Priou & Nicolas Van Vooren','','',5,'',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(33,'Methuen Handbook of Colour','Eyre Methuen','','https://amzn.to/3Vw6n0A',5,'You either go all in on colors or you don\'t. My copy is copyright 1981.',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(34,'A Field Guide to Southern Mushrooms','Nancy Smith Weber and Alexander H. Smith','','https://amzn.to/4fcjWte',5,'',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(35,'The Mushroom Hunter\'s Field Guide','Alexander H. Smith and Nancy Smith Weber','','https://amzn.to/4iuFEeM',5,'',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(36,'Biodiversity of FUNGI Inventory and Monitoring Methods','edited by: Gregory M. Mueller, Gerald F. Bills and Mercedes S. Foster','','https://amzn.to/3BoHM74',5,'',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(37,'AGARICUS of NORTH AMERICA','Richard W. Kerrigan','','https://amzn.to/4ixFeUN',5,'',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(38,'how to know the lichens','Mason E. Hale','','https://amzn.to/4iA5HBp',5,'Another older book, copyright 1979',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(39,'The Fungal Pharmacy','Robert Rogers','','https://amzn.to/4g7sq6c',5,'',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(40,'A Mushroom Word Guide','Robert M Hallock, PhD','','https://amzn.to/4gbl4hO',5,'',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(41,'The Complete Mushroom Hunter','Gary Lincoff','','https://amzn.to/41vz7uf',5,'',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(42,'Mushrooms Of Mississippi and Other Fungi and Protists','George H. Dukes Jr.','','https://amzn.to/3ZQFwPz',5,'',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(43,'Molecular Markers in Mycology','Bhim Pratap and Singh Vijai Kumar Gupta Editors','','https://amzn.to/49yEbju',5,'',0,'NULL','2024-12-11 20:56:28.000000','2024-12-11 20:56:28.000000'),(44,'My bookssss','Meee',NULL,NULL,5,'Great!',1,'Great! Great!','2024-12-21 13:11:30.000000','2024-12-21 13:12:19.000000');
/*!40000 ALTER TABLE `sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `country_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_states_on_country_id` (`country_id`),
  CONSTRAINT `fk_rails_40bd891262` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stipe_interiors`
--

DROP TABLE IF EXISTS `stipe_interiors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stipe_interiors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_stipe_interiors_on_source` (`source`),
  CONSTRAINT `fk_rails_4460829c85` FOREIGN KEY (`source`) REFERENCES `sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stipe_interiors`
--

LOCK TABLES `stipe_interiors` WRITE;
/*!40000 ALTER TABLE `stipe_interiors` DISABLE KEYS */;
INSERT INTO `stipe_interiors` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Solid','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Hollow (fistulose)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Tubular','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Cavernous','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Stuffed with pith','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `stipe_interiors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stipe_locations`
--

DROP TABLE IF EXISTS `stipe_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stipe_locations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_stipe_locations_on_source` (`source`),
  CONSTRAINT `fk_rails_0a165b504b` FOREIGN KEY (`source`) REFERENCES `sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stipe_locations`
--

LOCK TABLES `stipe_locations` WRITE;
/*!40000 ALTER TABLE `stipe_locations` DISABLE KEYS */;
INSERT INTO `stipe_locations` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Central','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Eccentric (off-center)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Lateral (attached at margin)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Sessile (missing)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `stipe_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stipe_shapes`
--

DROP TABLE IF EXISTS `stipe_shapes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stipe_shapes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_stipe_shapes_on_source` (`source`),
  CONSTRAINT `fk_rails_12677d0b7a` FOREIGN KEY (`source`) REFERENCES `sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stipe_shapes`
--

LOCK TABLES `stipe_shapes` WRITE;
/*!40000 ALTER TABLE `stipe_shapes` DISABLE KEYS */;
INSERT INTO `stipe_shapes` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Terete (round)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Compressed (flattened)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Equal','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Clavate (club)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Radicating (w/\"root\")','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(7,'Flexous','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(8,'Ventricose Fusiform','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(9,'Tapering','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(10,'Abruptly bulbous','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(11,'Rounded','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(12,'Oblique (angle)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(13,'Marginate','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `stipe_shapes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stipe_surfaces`
--

DROP TABLE IF EXISTS `stipe_surfaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stipe_surfaces` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_stipe_surfaces_on_source` (`source`),
  CONSTRAINT `fk_rails_8d3a7fd124` FOREIGN KEY (`source`) REFERENCES `sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stipe_surfaces`
--

LOCK TABLES `stipe_surfaces` WRITE;
/*!40000 ALTER TABLE `stipe_surfaces` DISABLE KEYS */;
INSERT INTO `stipe_surfaces` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Smooth','No defining features found on the surface.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Uneven','A bumpy surface.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Rugose','A wrinkled or rough surface.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Rugulose','A slightly wrinkled surface.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Rivulose','A thinly wrinkled surface of branching wavy or crooked lines.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(7,'Scrobiculate','A pitted or furrowed surface.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(8,'Warty','Remnants of the universal veil remain on the surface in small patches.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(9,'Virgate','A streaked surface.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(10,'Hygrophanous','A surface that is transparent when wet and opaque when dry.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(11,'Sericeous','A silky surface.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(12,'Fibrillose','A surface covered in thread-like filaments.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(13,'Squamose','A surface covered with scales.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(14,'Squarrose','A ragged surface covered with small scales.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(15,'Pruinose','A surface covered with a white powdery frostlike substance.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(16,'Pulverulent','A surface covered with fine dust or powder.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(17,'Granulose','A surface covered in salt-like granulates.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(18,'Furfuraceous','A surface covered in flaky bran-like particles; dandruff-like.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(19,'Zonate','A surface containing zones or bands that are distinguished by texture or color.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(20,'Areolate','A cracked surface resembling dried-mud or paint.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(21,'Rimose','A surface covered in cracks and crevices.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(22,'Laccate','A waxy or lacquered surface texture.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(23,'Viscid -','A sticky glue-like surface texture.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(24,'Glutinous','A slimy surface.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(25,'Glabrous - Hairy','Hairy - a bald surface.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(26,'Velvety - Hairy','Hairy - A surface covered with very fine and soft hairs.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(27,'Pubescent - Hairy','Hairy - A surface cover with fuzz or fine hairs.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(28,'Canescent - Hairy','Hairy - A surface covered in dense white or gray down-like hairs. Giving a frosted appearance.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(29,'Floccose - Hairy','Hairy - A surface covered in Wooly or cotton-like hairs.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(30,'Tomentose - Hairy','Hairy - A surface covered densely with matted hairs.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(31,'Hispid - Hairy','Hairy - A surface covered with straight bristle-like hairs.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(32,'Hirsute - Hairy','Hairy - A surface covered with slightly stiff and shaggy hairs.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(33,'Villose - Hairy','Hairy - A surface covered with long soft hairs.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(34,'Strigose - Hairy','Hairy - A surface covered with long bristle-like hairs.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(35,'Banded','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(36,'Peronate','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(37,'Fibrous','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(38,'Lacunose (w/dp.grooves)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(39,'Longitudinally striate','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(40,'Ribbed/Costate','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(41,'Scabrous (scabby)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(42,'Punctuate (w/small dots)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(43,'Glanular-dotted (w/dark sticky dots)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(44,'Reticulate (fishnet)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `stipe_surfaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stipe_textures`
--

DROP TABLE IF EXISTS `stipe_textures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stipe_textures` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_stipe_textures_on_source` (`source`),
  CONSTRAINT `fk_rails_caa57da3d2` FOREIGN KEY (`source`) REFERENCES `sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stipe_textures`
--

LOCK TABLES `stipe_textures` WRITE;
/*!40000 ALTER TABLE `stipe_textures` DISABLE KEYS */;
INSERT INTO `stipe_textures` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Fragile','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Pliable','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Chalky','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Rigid','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Fibrous (Fleshy-Fibrous)','usually rather thick, and when broken in two, leaves a ragged edge.','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(7,'Cartilaginous','Common stipe, usually thin and breaks with a firm split when bent in two, similar to cartilage.','',13,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(8,'Firm','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(9,'Woody','','',13,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(10,'Corky','','',13,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(11,'Leathery (coriaceous)','','',13,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(12,'Chalky','feels and breaks like chalk in hand. When crushed, it breaks up into powder or chunks.','',13,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(13,'Breaking with a snap','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `stipe_textures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `synonyms`
--

DROP TABLE IF EXISTS `synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `synonyms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_synonyms_on_source` (`source`),
  CONSTRAINT `fk_rails_bbc88f80aa` FOREIGN KEY (`source`) REFERENCES `sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `synonyms`
--

LOCK TABLES `synonyms` WRITE;
/*!40000 ALTER TABLE `synonyms` DISABLE KEYS */;
INSERT INTO `synonyms` VALUES (1,'epigeous','above-ground ','',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'hypogeous','underground','',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'mushroom','fruiting body of a fungus','',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'basidiocarp','fruiting body','',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'thallus','soma','entire body of fungus',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'sporocarp','fruiting body','',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(7,'pileus','cap','',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(8,'Stipe','Stalk','',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(9,'Gills','Lamellae','',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(10,'Volva','cup','',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(11,'Annulus','ring','',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(12,'cone','conical','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(13,'conic','conical','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(14,'disc','center','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(15,'margin','edge','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(16,'ring','annulus','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(17,'stem','stipe','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(18,'volva','cup','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(19,'convex','evenly rounded','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(20,'ovoid','egg','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(21,'campanulate','bell-shaped','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(22,'parabolic','half-egg','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(23,'pulvinate','cushion','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(24,'cylindric','bullet','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(25,'plane','flat','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastes`
--

DROP TABLE IF EXISTS `tastes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tastes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tastes_on_source` (`source`),
  CONSTRAINT `fk_rails_c22f940445` FOREIGN KEY (`source`) REFERENCES `sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastes`
--

LOCK TABLES `tastes` WRITE;
/*!40000 ALTER TABLE `tastes` DISABLE KEYS */;
INSERT INTO `tastes` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'None','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Mild','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Bitter','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Acrid (= puckery? astringent)/Peppery','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Agreeable','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(7,'Farinaceous (like fresh meal)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `tastes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toxics`
--

DROP TABLE IF EXISTS `toxics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toxics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_toxics_on_source` (`source`),
  CONSTRAINT `fk_rails_4e92f7d2af` FOREIGN KEY (`source`) REFERENCES `sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toxics`
--

LOCK TABLES `toxics` WRITE;
/*!40000 ALTER TABLE `toxics` DISABLE KEYS */;
INSERT INTO `toxics` VALUES (1,'Not Entered','','',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Not Toxic','','',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Toxic','','',2,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `toxics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tree_associations`
--

DROP TABLE IF EXISTS `tree_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tree_associations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mushroom_id` bigint NOT NULL,
  `tree_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tree_associations_on_mushroom_id` (`mushroom_id`),
  KEY `index_tree_associations_on_tree_id` (`tree_id`),
  CONSTRAINT `fk_rails_cbed06af1f` FOREIGN KEY (`mushroom_id`) REFERENCES `mushrooms` (`id`),
  CONSTRAINT `fk_rails_ceeaf39f7e` FOREIGN KEY (`tree_id`) REFERENCES `trees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tree_associations`
--

LOCK TABLES `tree_associations` WRITE;
/*!40000 ALTER TABLE `tree_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tree_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trees`
--

DROP TABLE IF EXISTS `trees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trees` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_trees_on_source` (`source`),
  CONSTRAINT `fk_rails_54960f0aba` FOREIGN KEY (`source`) REFERENCES `sources` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trees`
--

LOCK TABLES `trees` WRITE;
/*!40000 ALTER TABLE `trees` DISABLE KEYS */;
/*!40000 ALTER TABLE `trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universal_outer_veil_appearances`
--

DROP TABLE IF EXISTS `universal_outer_veil_appearances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `universal_outer_veil_appearances` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_universal_outer_veil_appearances_on_source` (`source`),
  CONSTRAINT `fk_rails_1c3ca2044c` FOREIGN KEY (`source`) REFERENCES `sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universal_outer_veil_appearances`
--

LOCK TABLES `universal_outer_veil_appearances` WRITE;
/*!40000 ALTER TABLE `universal_outer_veil_appearances` DISABLE KEYS */;
INSERT INTO `universal_outer_veil_appearances` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Two Rings (from 2 veils)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Doubly-flared Ring','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'\"Cogwheel\" Stellate','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Floccose (downy tuffs)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Cortinate PV & Fibrillose Annular Zone','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(7,'Single Ring thick on edge','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(8,'Pendant (hanging)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(9,'Subperonate','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(10,'Peronate (w/\"boot\")','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `universal_outer_veil_appearances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universal_outer_veil_fates`
--

DROP TABLE IF EXISTS `universal_outer_veil_fates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `universal_outer_veil_fates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_universal_outer_veil_fates_on_source` (`source`),
  CONSTRAINT `fk_rails_4f7af24ae0` FOREIGN KEY (`source`) REFERENCES `sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universal_outer_veil_fates`
--

LOCK TABLES `universal_outer_veil_fates` WRITE;
/*!40000 ALTER TABLE `universal_outer_veil_fates` DISABLE KEYS */;
INSERT INTO `universal_outer_veil_fates` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Disappearing','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Leaving fragments on cap','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `universal_outer_veil_fates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universal_outer_veil_textures`
--

DROP TABLE IF EXISTS `universal_outer_veil_textures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `universal_outer_veil_textures` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_universal_outer_veil_textures_on_source` (`source`),
  CONSTRAINT `fk_rails_6250b49b0e` FOREIGN KEY (`source`) REFERENCES `sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universal_outer_veil_textures`
--

LOCK TABLES `universal_outer_veil_textures` WRITE;
/*!40000 ALTER TABLE `universal_outer_veil_textures` DISABLE KEYS */;
INSERT INTO `universal_outer_veil_textures` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Membranous (skin-like)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Cortinate (cobwebby)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Fibillose (thready)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Gelatinous (slimy)','','',5,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `universal_outer_veil_textures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `role_id` bigint NOT NULL DEFAULT '1',
  `sign_in_count` int NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime(6) DEFAULT NULL,
  `last_sign_in_at` datetime(6) DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_role_id` (`role_id`),
  CONSTRAINT `fk_rails_642f17018b` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veils`
--

DROP TABLE IF EXISTS `veils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veils` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `source` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_veils_on_source` (`source`),
  CONSTRAINT `fk_rails_e451159794` FOREIGN KEY (`source`) REFERENCES `sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veils`
--

LOCK TABLES `veils` WRITE;
/*!40000 ALTER TABLE `veils` DISABLE KEYS */;
INSERT INTO `veils` VALUES (1,'Not Entered','','',1,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(2,'Flaring','The annulus is flaring upwards.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(3,'Pendant','The veil is hanging downward from the stipe.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(4,'Double Rings','Two visible veils..','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(5,'Ring Zone','The stipe is marked with the remnants of the annulus','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(6,'Cortinate','The partial veil is cobweb-like or tread-like (Fibrillose)..','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(7,'Stellate','The partial veil resembles a cogwheel.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(8,'Floccose','The partial veil is fluffy and down-like.','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000'),(9,'Peronate','The stipe resembles a sheath-like boot or stocking','',7,'2024-06-02 05:05:27.000000','2024-06-02 05:05:27.000000');
/*!40000 ALTER TABLE `veils` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-24 19:31:53

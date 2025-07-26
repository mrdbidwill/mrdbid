
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
DROP TABLE IF EXISTS `all_group_mushrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `all_group_mushrooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `all_group_id` bigint DEFAULT NULL,
  `mushroom_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_all_group_mushrooms_on_all_group_id` (`all_group_id`),
  KEY `index_all_group_mushrooms_on_mushroom_id` (`mushroom_id`),
  CONSTRAINT `fk_rails_bf88171658` FOREIGN KEY (`mushroom_id`) REFERENCES `mushrooms` (`id`),
  CONSTRAINT `fk_rails_f845056653` FOREIGN KEY (`all_group_id`) REFERENCES `lookup_items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
DROP TABLE IF EXISTS `cameras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cameras` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `camera_make_id` bigint DEFAULT NULL,
  `camera_model_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cameras_on_camera_make_id` (`camera_make_id`),
  KEY `index_cameras_on_camera_model_id` (`camera_model_id`),
  CONSTRAINT `fk_rails_237c9aa076` FOREIGN KEY (`camera_make_id`) REFERENCES `lookup_items` (`id`),
  CONSTRAINT `fk_rails_7eb7504f0f` FOREIGN KEY (`camera_model_id`) REFERENCES `lookup_items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `cluster_mushrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cluster_mushrooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cluster_id` bigint DEFAULT NULL,
  `mushroom_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cluster_mushrooms_on_cluster_id` (`cluster_id`),
  KEY `index_cluster_mushrooms_on_mushroom_id` (`mushroom_id`),
  CONSTRAINT `fk_rails_96b70e2520` FOREIGN KEY (`mushroom_id`) REFERENCES `mushrooms` (`id`),
  CONSTRAINT `fk_rails_ff0c33bdff` FOREIGN KEY (`cluster_id`) REFERENCES `lookup_items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `latin_name` varchar(255) DEFAULT NULL,
  `common_name` varchar(255) DEFAULT NULL,
  `color_group` int DEFAULT NULL,
  `hex` varchar(255) DEFAULT NULL,
  `sequence` int DEFAULT NULL,
  `r_val` int DEFAULT NULL,
  `g_val` int DEFAULT NULL,
  `b_val` int DEFAULT NULL,
  `closest_websafe_color` varchar(255) DEFAULT NULL,
  `cwc_r` varchar(255) DEFAULT NULL,
  `cwc_g` varchar(255) DEFAULT NULL,
  `cwc_b` varchar(255) DEFAULT NULL,
  `image_file_address` varchar(255) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `display_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `display_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `dna_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dna_sequences` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mushroom_id` bigint DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `index_dna_sequences_on_mushroom_id` (`mushroom_id`),
  CONSTRAINT `fk_rails_54c17fadd6` FOREIGN KEY (`mushroom_id`) REFERENCES `mushrooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `image_mushroom_thumbnails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_mushroom_thumbnails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_mushroom_id` bigint DEFAULT NULL,
  `thumbnail_file_address` varchar(255) DEFAULT NULL,
  `image_width` int DEFAULT NULL,
  `image_height` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_image_mushroom_thumbnails_on_image_mushroom_id` (`image_mushroom_id`),
  CONSTRAINT `fk_rails_55705f4edc` FOREIGN KEY (`image_mushroom_id`) REFERENCES `image_mushrooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `image_mushrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_mushrooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mushroom_id` bigint DEFAULT NULL,
  `part_id` bigint DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `image_file_address` varchar(255) DEFAULT NULL,
  `image_width` int DEFAULT NULL,
  `image_height` int DEFAULT NULL,
  `camera_make_id` bigint DEFAULT NULL,
  `camera_model_id` bigint DEFAULT NULL,
  `lens` varchar(255) DEFAULT NULL,
  `exposure` varchar(255) DEFAULT NULL,
  `aperture` varchar(255) DEFAULT NULL,
  `iso` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_image_mushrooms_on_mushroom_id` (`mushroom_id`),
  KEY `index_image_mushrooms_on_part_id` (`part_id`),
  KEY `index_image_mushrooms_on_camera_make_id` (`camera_make_id`),
  KEY `index_image_mushrooms_on_camera_model_id` (`camera_model_id`),
  CONSTRAINT `fk_rails_6d2bc30fcf` FOREIGN KEY (`camera_model_id`) REFERENCES `lookup_items` (`id`),
  CONSTRAINT `fk_rails_974ee9e8a8` FOREIGN KEY (`mushroom_id`) REFERENCES `mushrooms` (`id`),
  CONSTRAINT `fk_rails_acebcc46f8` FOREIGN KEY (`part_id`) REFERENCES `lookup_items` (`id`),
  CONSTRAINT `fk_rails_dd82651639` FOREIGN KEY (`camera_make_id`) REFERENCES `lookup_items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
DROP TABLE IF EXISTS `lookup_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lookup_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mr_character_id` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `data_source_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_lookup_items_on_mr_character_id` (`mr_character_id`),
  KEY `index_lookup_items_on_data_source_id` (`data_source_id`),
  CONSTRAINT `fk_rails_7986eea0da` FOREIGN KEY (`mr_character_id`) REFERENCES `mr_characters` (`id`),
  CONSTRAINT `fk_rails_db82e6926c` FOREIGN KEY (`id`) REFERENCES `source_data` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `lookup_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lookup_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `mr_character_mushrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mr_character_mushrooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mr_character_id` bigint DEFAULT NULL,
  `mushroom_id` bigint DEFAULT NULL,
  `character_value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mr_character_mushrooms_on_mr_character_id` (`mr_character_id`),
  KEY `index_mr_character_mushrooms_on_mushroom_id` (`mushroom_id`),
  CONSTRAINT `fk_rails_976623cbea` FOREIGN KEY (`mr_character_id`) REFERENCES `mr_characters` (`id`),
  CONSTRAINT `fk_rails_ba5a019ccc` FOREIGN KEY (`mushroom_id`) REFERENCES `mushrooms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `mr_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mr_characters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `part_id` bigint DEFAULT NULL,
  `lookup_type_id` bigint DEFAULT NULL,
  `display_option_id` bigint DEFAULT NULL,
  `source_data_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_mr_characters_on_name` (`name`),
  KEY `index_mr_characters_on_part_id` (`part_id`),
  KEY `index_mr_characters_on_lookup_type_id` (`lookup_type_id`),
  KEY `index_mr_characters_on_display_option_id` (`display_option_id`),
  KEY `index_mr_characters_on_source_data_id` (`source_data_id`),
  KEY `index_mr_characters_on_lookup_type_id_and_part_id` (`lookup_type_id`,`part_id`),
  CONSTRAINT `fk_rails_4452ee2843` FOREIGN KEY (`display_option_id`) REFERENCES `display_options` (`id`),
  CONSTRAINT `fk_rails_97936aa437` FOREIGN KEY (`part_id`) REFERENCES `parts` (`id`),
  CONSTRAINT `fk_rails_f1528c1890` FOREIGN KEY (`lookup_type_id`) REFERENCES `lookup_types` (`id`),
  CONSTRAINT `fk_rails_f919b11cf9` FOREIGN KEY (`source_data_id`) REFERENCES `source_data` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=674 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `mushrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mushrooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comment` text,
  `user_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mushrooms_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_1d15355ab0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `plant_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plant_associations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mushroom_id` bigint DEFAULT NULL,
  `plant_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_plant_associations_on_mushroom_id` (`mushroom_id`),
  KEY `index_plant_associations_on_plant_id` (`plant_id`),
  CONSTRAINT `fk_rails_25779be26c` FOREIGN KEY (`mushroom_id`) REFERENCES `mushrooms` (`id`),
  CONSTRAINT `fk_rails_c8955c80d4` FOREIGN KEY (`plant_id`) REFERENCES `lookup_items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL,
  `permission_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_role_permissions_on_role_id` (`role_id`),
  KEY `index_role_permissions_on_permission_id` (`permission_id`),
  CONSTRAINT `fk_rails_439e640a3f` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `fk_rails_60126080bd` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `source_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `source_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `item_code` varchar(255) DEFAULT NULL,
  `source_data_type_id` bigint DEFAULT NULL,
  `comment` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_source_data_on_source_data_type_id` (`source_data_type_id`),
  CONSTRAINT `fk_rails_e2b6e4c854` FOREIGN KEY (`source_data_type_id`) REFERENCES `source_data_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `source_data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `source_data_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comments` text,
  `country_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_states_on_country_id` (`country_id`),
  CONSTRAINT `fk_rails_40bd891262` FOREIGN KEY (`country_id`) REFERENCES `lookup_items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tree_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tree_associations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mushroom_id` bigint DEFAULT NULL,
  `tree_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tree_associations_on_mushroom_id` (`mushroom_id`),
  KEY `index_tree_associations_on_tree_id` (`tree_id`),
  CONSTRAINT `fk_rails_cbed06af1f` FOREIGN KEY (`mushroom_id`) REFERENCES `mushrooms` (`id`),
  CONSTRAINT `fk_rails_ceeaf39f7e` FOREIGN KEY (`tree_id`) REFERENCES `lookup_items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_roles_on_user_id` (`user_id`),
  KEY `index_user_roles_on_role_id` (`role_id`),
  CONSTRAINT `fk_rails_318345354e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_3369e0d5fc` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `display_name` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `otp_secret` varchar(255) DEFAULT NULL,
  `consumed_timestep` int DEFAULT NULL,
  `otp_required_for_login` tinyint(1) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime(6) DEFAULT NULL,
  `remember_created_at` datetime(6) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime(6) DEFAULT NULL,
  `confirmation_sent_at` datetime(6) DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `failed_attempts` int NOT NULL DEFAULT '0',
  `unlock_token` varchar(255) DEFAULT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`),
  UNIQUE KEY `index_users_on_unlock_token` (`unlock_token`),
  KEY `index_users_on_otp_required_for_login` (`otp_required_for_login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO `schema_migrations` (version) VALUES
('20250726232934'),
('20250719000001'),
('20250717200001'),
('20250713200016'),
('20250713200015'),
('20250713200014'),
('20250713200013'),
('20250713200012'),
('20250713200011'),
('20250713200010'),
('20250713200009'),
('20250713200008'),
('20250713200007'),
('20250713200006'),
('20250713200005'),
('20250713200004'),
('20250713200003'),
('20250713200001'),
('20250712194416'),
('20250712194415'),
('20250712194414'),
('20250712194413'),
('20250712194060'),
('20250712194024'),
('20250711141937'),
('20250710001217'),
('20250710000931'),
('20250709235955'),
('20250709235930'),
('20250709235842'),
('20250709202445'),
('20250704183692'),
('20250630000072'),
('20250630000057'),
('20250630000037'),
('20250630000035'),
('20250630000020'),
('20250630000016'),
('20250630000015'),
('20250630000010'),
('20250630000008'),
('20250630000002'),
('20250630000001');


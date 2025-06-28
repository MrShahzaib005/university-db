CREATE DATABASE  IF NOT EXISTS `university_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `university_db`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: university_db
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `type` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `status` tinyint NOT NULL,
  `purchase_date` datetime NOT NULL,
  `price` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_ten_worker`
--

DROP TABLE IF EXISTS `card_ten_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_ten_worker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(250) NOT NULL,
  `title` int NOT NULL,
  `issue_date` datetime NOT NULL,
  `expiry_date` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint NOT NULL,
  `approved_by` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_card_type` (`title`),
  KEY `fk_approval_user` (`approved_by`),
  CONSTRAINT `fk_approval_user` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_card_type` FOREIGN KEY (`title`) REFERENCES `card_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_ten_worker`
--

LOCK TABLES `card_ten_worker` WRITE;
/*!40000 ALTER TABLE `card_ten_worker` DISABLE KEYS */;
INSERT INTO `card_ten_worker` VALUES (1,'Permanent',1,'2025-06-21 00:42:40','2026-06-21 00:42:40','2025-06-21 00:42:40','2025-06-21 00:42:40',1,1),(2,'Temporary',2,'2025-06-21 00:42:40','2025-07-21 00:42:40','2025-06-21 00:42:40','2025-06-21 00:42:40',1,1);
/*!40000 ALTER TABLE `card_ten_worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_type`
--

DROP TABLE IF EXISTS `card_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `card_title` varchar(250) NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_type`
--

LOCK TABLES `card_type` WRITE;
/*!40000 ALTER TABLE `card_type` DISABLE KEYS */;
INSERT INTO `card_type` VALUES (1,'Employee Access Card',1,'2025-06-21 00:42:40','2025-06-21 00:42:40'),(2,'Visitor Pass',1,'2025-06-21 00:42:40','2025-06-21 00:42:40'),(3,'Contractor Badge',1,'2025-06-21 00:42:40','2025-06-21 00:42:40');
/*!40000 ALTER TABLE `card_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cleaning_service`
--

DROP TABLE IF EXISTS `cleaning_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaning_service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `requested_by` int NOT NULL,
  `cost` int NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equested_by_fk` (`requested_by`),
  CONSTRAINT `equested_by_fk` FOREIGN KEY (`requested_by`) REFERENCES `tenant_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleaning_service`
--

LOCK TABLES `cleaning_service` WRITE;
/*!40000 ALTER TABLE `cleaning_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `cleaning_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_size`
--

DROP TABLE IF EXISTS `company_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_size`
--

LOCK TABLES `company_size` WRITE;
/*!40000 ALTER TABLE `company_size` DISABLE KEYS */;
INSERT INTO `company_size` VALUES (1,'Small (1-10)',1,'2025-06-21 00:42:40','2025-06-21 00:42:40'),(2,'Medium (11-50)',1,'2025-06-21 00:42:40','2025-06-21 00:42:40'),(3,'Large (51+)',1,'2025-06-21 00:42:40','2025-06-21 00:42:40');
/*!40000 ALTER TABLE `company_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(250) NOT NULL,
  `issue_date` datetime NOT NULL,
  `complaint_status` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `assign_to` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_complaint_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_request`
--

DROP TABLE IF EXISTS `event_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `permit_description` text NOT NULL,
  `requested_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `requested_by_fk` (`requested_by`),
  CONSTRAINT `requested_by_fk` FOREIGN KEY (`requested_by`) REFERENCES `tenant_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_request`
--

LOCK TABLES `event_request` WRITE;
/*!40000 ALTER TABLE `event_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gate_pass`
--

DROP TABLE IF EXISTS `gate_pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gate_pass` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `issued_to` varchar(250) NOT NULL,
  `issued_by` int NOT NULL,
  `issued_date` datetime NOT NULL,
  `expiry` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_card_worker` (`issued_by`),
  CONSTRAINT `fk_card_worker` FOREIGN KEY (`issued_by`) REFERENCES `card_ten_worker` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gate_pass`
--

LOCK TABLES `gate_pass` WRITE;
/*!40000 ALTER TABLE `gate_pass` DISABLE KEYS */;
INSERT INTO `gate_pass` VALUES (1,'Main Gate Pass','John Doe',1,'2025-06-21 00:42:40','2025-06-22 00:42:40',1,'2025-06-21 00:42:40','2025-06-21 00:42:40'),(2,'Service Entry Pass','Service Team',2,'2025-06-21 00:42:40','2025-06-22 00:42:40',1,'2025-06-21 00:42:40','2025-06-21 00:42:40');
/*!40000 ALTER TABLE `gate_pass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `category` varchar(250) NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `reorder_level` int NOT NULL,
  `supplier_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_supplier` (`supplier_id`),
  KEY `idx_inventory_name` (`name`),
  KEY `idx_inventory_category` (`category`),
  CONSTRAINT `fk_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'Office Chairs','Furniture',25,15000,5,1,'2025-06-21 00:42:40','2025-06-21 00:42:40',1),(2,'Projector','Electronics',8,35000,2,2,'2025-06-21 00:42:40','2025-06-21 00:42:40',1),(3,'Whiteboard Markers','Stationery',100,150,20,1,'2025-06-21 00:42:40','2025-06-21 00:42:40',1);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_location`
--

DROP TABLE IF EXISTS `meeting_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_location`
--

LOCK TABLES `meeting_location` WRITE;
/*!40000 ALTER TABLE `meeting_location` DISABLE KEYS */;
INSERT INTO `meeting_location` VALUES (1,'Main Conference Room',1,'2025-06-21 00:42:40','2025-06-21 00:42:40'),(2,'Training Hall',1,'2025-06-21 00:42:40','2025-06-21 00:42:40');
/*!40000 ALTER TABLE `meeting_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_room`
--

DROP TABLE IF EXISTS `meeting_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` int NOT NULL,
  `start_time` datetime NOT NULL,
  `duration` datetime NOT NULL,
  `description` text NOT NULL,
  `reserved_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_fk` (`location`),
  KEY `reserved_by_fk` (`reserved_by`),
  CONSTRAINT `location_fk` FOREIGN KEY (`location`) REFERENCES `meeting_location` (`id`),
  CONSTRAINT `reserved_by_fk` FOREIGN KEY (`reserved_by`) REFERENCES `tenant_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_room`
--

LOCK TABLES `meeting_room` WRITE;
/*!40000 ALTER TABLE `meeting_room` DISABLE KEYS */;
INSERT INTO `meeting_room` VALUES (1,1,'2025-06-22 00:42:40','2025-06-21 02:42:40','Quarterly Planning',1,'2025-06-21 00:42:40','2025-06-21 00:42:40',1),(2,2,'2025-06-23 00:42:40','2025-06-21 03:42:40','Team Training',2,'2025-06-21 00:42:40','2025-06-21 00:42:40',1);
/*!40000 ALTER TABLE `meeting_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_event`
--

DROP TABLE IF EXISTS `news_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `date` datetime NOT NULL,
  `expiry` datetime NOT NULL,
  `organizer` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_organizer_fk` (`organizer`),
  CONSTRAINT `event_organizer_fk` FOREIGN KEY (`organizer`) REFERENCES `tenant_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_event`
--

LOCK TABLES `news_event` WRITE;
/*!40000 ALTER TABLE `news_event` DISABLE KEYS */;
INSERT INTO `news_event` VALUES (1,'Tech Conference','Annual technology showcase event','2025-06-28 00:42:40','2025-06-29 00:42:40',1,1,'2025-06-21 00:42:40','2025-06-21 00:42:40'),(2,'Health & Wellness','Employee wellness program launch','2025-07-05 00:42:40','2025-07-06 00:42:40',2,1,'2025-06-21 00:42:40','2025-06-21 00:42:40');
/*!40000 ALTER TABLE `news_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking_tag`
--

DROP TABLE IF EXISTS `parking_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parking_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `issued_to` int NOT NULL,
  `car_number` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tag_expiry` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tenant_company` (`issued_to`),
  CONSTRAINT `fk_tenant_company` FOREIGN KEY (`issued_to`) REFERENCES `tenant_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_tag`
--

LOCK TABLES `parking_tag` WRITE;
/*!40000 ALTER TABLE `parking_tag` DISABLE KEYS */;
INSERT INTO `parking_tag` VALUES (1,'John Doe',1,'ABC-123',1,'2025-06-21 00:42:40','2025-06-21 00:42:40','2025-12-21 00:42:40'),(2,'Jane Smith',2,'XYZ-789',1,'2025-06-21 00:42:40','2025-06-21 00:42:40','2025-12-21 00:42:40');
/*!40000 ALTER TABLE `parking_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petty_cash`
--

DROP TABLE IF EXISTS `petty_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `petty_cash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `amount` int NOT NULL,
  `used_by` int NOT NULL,
  `notes` text NOT NULL,
  `requested_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_card_worker_used` (`used_by`),
  KEY `requested_by_petty_fk` (`requested_by`),
  CONSTRAINT `fk_card_worker_used` FOREIGN KEY (`used_by`) REFERENCES `card_ten_worker` (`id`),
  CONSTRAINT `requested_by_petty_fk` FOREIGN KEY (`requested_by`) REFERENCES `tenant_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petty_cash`
--

LOCK TABLES `petty_cash` WRITE;
/*!40000 ALTER TABLE `petty_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `petty_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Office Suppliers Inc','contact@officesupplies.com',1,'2025-06-21 00:42:40','2025-06-21 00:42:40'),(2,'Tech Equipment Ltd','sales@techequip.com',1,'2025-06-21 00:42:40','2025-06-21 00:42:40');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_company`
--

DROP TABLE IF EXISTS `tenant_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(250) NOT NULL,
  `company_email` varchar(250) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `cp_name` varchar(250) NOT NULL,
  `cp_email` varchar(250) NOT NULL,
  `company_size` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_company_size` (`company_size`),
  CONSTRAINT `fk_company_size` FOREIGN KEY (`company_size`) REFERENCES `company_size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_company`
--

LOCK TABLES `tenant_company` WRITE;
/*!40000 ALTER TABLE `tenant_company` DISABLE KEYS */;
INSERT INTO `tenant_company` VALUES (1,'Tech Innovators','info@techinnov.com','555-1111','John Doe','john@techinnov.com',1,'2025-06-21 00:42:40','2025-06-21 00:42:40'),(2,'Global Solutions','contact@globalsol.com','555-2222','Jane Smith','jane@globalsol.com',2,'2025-06-21 00:42:40','2025-06-21 00:42:40');
/*!40000 ALTER TABLE `tenant_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(250) NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'Admin',1,'2025-06-21 00:42:40','2025-06-21 00:42:40'),(2,'Manager',1,'2025-06-21 00:42:40','2025-06-21 00:42:40'),(3,'Staff',1,'2025-06-21 00:42:40','2025-06-21 00:42:40'),(4,'Tenant',1,'2025-06-21 00:42:40','2025-06-21 00:42:40');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `role_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_roleId` (`role_id`),
  KEY `idx_user_email` (`email`),
  CONSTRAINT `fk_roleId` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Shahzaib','shahzaib@example.com','password123','555-1234',1,1,'2025-06-21 00:42:40','2025-06-21 00:42:40'),(2,'Ali','ali@example.com','password123','555-5678',2,1,'2025-06-21 00:42:40','2025-06-21 00:42:40'),(3,'Ahmed','ahmed@example.com','password123','555-9012',3,1,'2025-06-21 00:42:40','2025-06-21 00:42:40');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_active_complaints`
--

DROP TABLE IF EXISTS `view_active_complaints`;
/*!50001 DROP VIEW IF EXISTS `view_active_complaints`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_active_complaints` AS SELECT 
 1 AS `title`,
 1 AS `type`,
 1 AS `assign_to`,
 1 AS `complaint_status`,
 1 AS `created_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_active_inventory`
--

DROP TABLE IF EXISTS `view_active_inventory`;
/*!50001 DROP VIEW IF EXISTS `view_active_inventory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_active_inventory` AS SELECT 
 1 AS `item_name`,
 1 AS `category`,
 1 AS `quantity`,
 1 AS `price`,
 1 AS `supplier_name`,
 1 AS `contact`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_today_gate_passes`
--

DROP TABLE IF EXISTS `view_today_gate_passes`;
/*!50001 DROP VIEW IF EXISTS `view_today_gate_passes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_today_gate_passes` AS SELECT 
 1 AS `gate_pass_name`,
 1 AS `issued_to`,
 1 AS `issued_by`,
 1 AS `approved_by`,
 1 AS `issued_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_active_complaints`
--

/*!50001 DROP VIEW IF EXISTS `view_active_complaints`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_active_complaints` AS select `complaints`.`title` AS `title`,`complaints`.`type` AS `type`,`complaints`.`assign_to` AS `assign_to`,`complaints`.`complaint_status` AS `complaint_status`,`complaints`.`created_at` AS `created_at` from `complaints` where ((`complaints`.`complaint_status` = 1) and (`complaints`.`status` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_active_inventory`
--

/*!50001 DROP VIEW IF EXISTS `view_active_inventory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_active_inventory` AS select `i`.`name` AS `item_name`,`i`.`category` AS `category`,`i`.`quantity` AS `quantity`,`i`.`price` AS `price`,`s`.`name` AS `supplier_name`,`s`.`contact` AS `contact` from (`inventory` `i` join `supplier` `s` on((`i`.`supplier_id` = `s`.`id`))) where (`i`.`status` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_today_gate_passes`
--

/*!50001 DROP VIEW IF EXISTS `view_today_gate_passes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_today_gate_passes` AS select `gp`.`name` AS `gate_pass_name`,`gp`.`issued_to` AS `issued_to`,`gp`.`issued_by` AS `issued_by`,`u`.`name` AS `approved_by`,`gp`.`issued_date` AS `issued_date` from ((`gate_pass` `gp` join `card_ten_worker` `ctw` on((`gp`.`issued_by` = `ctw`.`id`))) join `users` `u` on((`ctw`.`approved_by` = `u`.`id`))) where (cast(`gp`.`issued_date` as date) = curdate()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-27  1:14:10

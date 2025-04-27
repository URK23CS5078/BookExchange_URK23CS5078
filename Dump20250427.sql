-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: book_exchange
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
-- Table structure for table `approved_exchanges`
--

DROP TABLE IF EXISTS `approved_exchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approved_exchanges` (
  `exchange_id` int NOT NULL AUTO_INCREMENT,
  `request_id` int NOT NULL,
  `approval_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exchange_id`),
  KEY `request_id` (`request_id`),
  CONSTRAINT `approved_exchanges_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `book_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approved_exchanges`
--

LOCK TABLES `approved_exchanges` WRITE;
/*!40000 ALTER TABLE `approved_exchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `approved_exchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_request`
--

DROP TABLE IF EXISTS `book_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookTitle` varchar(50) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_request`
--

LOCK TABLES `book_request` WRITE;
/*!40000 ALTER TABLE `book_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_requests`
--

DROP TABLE IF EXISTS `book_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_title` varchar(255) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `request_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('PENDING','APPROVED','REJECTED') DEFAULT 'PENDING',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_requests`
--

LOCK TABLES `book_requests` WRITE;
/*!40000 ALTER TABLE `book_requests` DISABLE KEYS */;
INSERT INTO `book_requests` VALUES (1,'null','dhanam','dhanams@karunya.edu.in','9876543210','2025-04-24 12:57:16','PENDING'),(2,'null','dhanam','dhanams@karunya.edu.in','9876543210','2025-04-24 13:39:42','PENDING'),(3,'null','shally','shally@gmail.com','9876543210','2025-04-24 13:51:41','PENDING'),(4,'null','Shally','shally@gmail.com','6534875314','2025-04-24 14:10:17','PENDING'),(5,'null','shally','dhanams@karunya.edu.in','9876543210','2025-04-24 19:40:51','PENDING'),(6,'null','shally','shally@gmail.com','6534875314','2025-04-27 05:20:54','PENDING');
/*!40000 ALTER TABLE `book_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_requestt`
--

DROP TABLE IF EXISTS `book_requestt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_requestt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_title` varchar(255) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `request_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `idx_email` (`user_email`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_requestt`
--

LOCK TABLES `book_requestt` WRITE;
/*!40000 ALTER TABLE `book_requestt` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_requestt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `category_id` int DEFAULT NULL,
  `owner_id` int NOT NULL,
  `status` varchar(20) DEFAULT 'AVAILABLE',
  PRIMARY KEY (`book_id`),
  KEY `category_id` (`category_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_requests`
--

DROP TABLE IF EXISTS `exchange_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exchange_requests` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `requester_id` int NOT NULL,
  `status` varchar(20) DEFAULT 'PENDING',
  `request_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`request_id`),
  KEY `book_id` (`book_id`),
  KEY `requester_id` (`requester_id`),
  CONSTRAINT `exchange_requests_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `exchange_requests_ibfk_2` FOREIGN KEY (`requester_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_requests`
--

LOCK TABLES `exchange_requests` WRITE;
/*!40000 ALTER TABLE `exchange_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `exchange_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rejected_requests`
--

DROP TABLE IF EXISTS `rejected_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rejected_requests` (
  `rejection_id` int NOT NULL AUTO_INCREMENT,
  `request_id` int NOT NULL,
  `rejection_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rejection_id`),
  KEY `request_id` (`request_id`),
  CONSTRAINT `rejected_requests_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `book_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rejected_requests`
--

LOCK TABLES `rejected_requests` WRITE;
/*!40000 ALTER TABLE `rejected_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `rejected_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'urk23cs5078@karunya.edu','sshally2209@gmail.com','123'),(3,'dhanam','dhanam@gmail.com','123'),(5,'dhanam','dhanam@karunya.edu.in','123'),(6,'urk23cs5078@karunya.edu','jananir@karunya.edu.in','123'),(8,'usha','ushar@karunya.edu.in','123'),(9,'beulah','belah@gmail.com','567'),(10,'rathna','rathna@gmail.com','1210'),(11,'urk23cs5078@karunya.edu','shally@gmail.com','123'),(12,'jeni','jeni@gmail.com','123'),(13,'urk23cs5078','urk23cs5078@gmail.com','123'),(14,'dkwjj','nwjq@gmail.com','1234'),(15,'shallys','shallys@karunya.edu','123'),(16,'shally','sshally220909@gmail.com','45'),(17,'joy','joy@karunya.com','22'),(18,'nj','jij@gmail.com','98'),(19,'shally','s@gmail.com','123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-27 11:07:13

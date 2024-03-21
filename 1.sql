-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: LibraryDB
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Temporary view structure for view `available_books`
--

DROP TABLE IF EXISTS `available_books`;
/*!50001 DROP VIEW IF EXISTS `available_books`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `available_books` AS SELECT 
 1 AS `Book_id`,
 1 AS `Title`,
 1 AS `Available_Copies`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `Book_id` int NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Publisher_Name` varchar(255) DEFAULT NULL,
  `Pub_Year` int DEFAULT NULL,
  PRIMARY KEY (`Book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Book Title 1','Publisher1',2019),(2,'Book Title 2','Publisher2',2020),(3,'Book Title 3','Publisher3',2018);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_2017`
--

DROP TABLE IF EXISTS `book_2017`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_2017` (
  `Book_id` int NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Publisher_Name` varchar(255) DEFAULT NULL,
  `Pub_Year` int DEFAULT NULL,
  PRIMARY KEY (`Book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_2017`
--

LOCK TABLES `book_2017` WRITE;
/*!40000 ALTER TABLE `book_2017` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_2017` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_2018`
--

DROP TABLE IF EXISTS `book_2018`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_2018` (
  `Book_id` int NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Publisher_Name` varchar(255) DEFAULT NULL,
  `Pub_Year` int DEFAULT NULL,
  PRIMARY KEY (`Book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_2018`
--

LOCK TABLES `book_2018` WRITE;
/*!40000 ALTER TABLE `book_2018` DISABLE KEYS */;
INSERT INTO `book_2018` VALUES (3,'Book Title 3','Publisher3',2018);
/*!40000 ALTER TABLE `book_2018` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_authors`
--

DROP TABLE IF EXISTS `book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_authors` (
  `Book_id` int DEFAULT NULL,
  `Author_Name` varchar(255) DEFAULT NULL,
  KEY `Book_id` (`Book_id`),
  CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_authors`
--

LOCK TABLES `book_authors` WRITE;
/*!40000 ALTER TABLE `book_authors` DISABLE KEYS */;
INSERT INTO `book_authors` VALUES (1,'Author 1'),(2,'Author 2');
/*!40000 ALTER TABLE `book_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_copies`
--

DROP TABLE IF EXISTS `book_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_copies` (
  `Book_id` int NOT NULL,
  `Programme_id` int NOT NULL,
  `No_of_Copies` int DEFAULT NULL,
  PRIMARY KEY (`Book_id`,`Programme_id`),
  CONSTRAINT `book_copies_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_copies`
--

LOCK TABLES `book_copies` WRITE;
/*!40000 ALTER TABLE `book_copies` DISABLE KEYS */;
INSERT INTO `book_copies` VALUES (1,1,5),(1,2,10),(2,1,8);
/*!40000 ALTER TABLE `book_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_lending`
--

DROP TABLE IF EXISTS `book_lending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_lending` (
  `Book_id` int DEFAULT NULL,
  `Programme_id` int DEFAULT NULL,
  `Card_No` int DEFAULT NULL,
  `Date_Out` date DEFAULT NULL,
  `Due_Date` date DEFAULT NULL,
  KEY `Book_id` (`Book_id`,`Programme_id`),
  CONSTRAINT `book_lending_ibfk_1` FOREIGN KEY (`Book_id`, `Programme_id`) REFERENCES `book_copies` (`Book_id`, `Programme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_lending`
--

LOCK TABLES `book_lending` WRITE;
/*!40000 ALTER TABLE `book_lending` DISABLE KEYS */;
INSERT INTO `book_lending` VALUES (1,1,123,'2023-01-01','2023-01-15'),(1,2,456,'2023-02-01','2023-02-15'),(2,1,789,'2023-03-01','2023-03-15');
/*!40000 ALTER TABLE `book_lending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_programme`
--

DROP TABLE IF EXISTS `library_programme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_programme` (
  `Programme_id` int NOT NULL,
  `Programme_Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Programme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_programme`
--

LOCK TABLES `library_programme` WRITE;
/*!40000 ALTER TABLE `library_programme` DISABLE KEYS */;
INSERT INTO `library_programme` VALUES (1,'Programme1','Address1'),(2,'Programme2','Address2');
/*!40000 ALTER TABLE `library_programme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES ('Publisher1','Address1','1234567890'),('Publisher2','Address2','9876543210'),('Publisher3','Address3','4561237890');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `available_books`
--

/*!50001 DROP VIEW IF EXISTS `available_books`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rahul`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `available_books` AS select `b`.`Book_id` AS `Book_id`,`b`.`Title` AS `Title`,count(`bc`.`Book_id`) AS `Available_Copies` from ((`book` `b` left join `book_copies` `bc` on((`b`.`Book_id` = `bc`.`Book_id`))) left join `book_lending` `bl` on((`b`.`Book_id` = `bl`.`Book_id`))) where ((`bl`.`Date_Out` is null) or (`bl`.`Due_Date` < curdate())) group by `b`.`Book_id`,`b`.`Title` */;
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

-- Dump completed on 2024-03-19 15:38:45

CREATE DATABASE  IF NOT EXISTS `cs157a_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cs157a_project`;
-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: cs157a_project
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `Action`
--

DROP TABLE IF EXISTS `Action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Action` (
  `staffid` int NOT NULL,
  `reportid` int NOT NULL,
  `reason` varchar(45) DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staffid`,`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Action`
--

LOCK TABLES `Action` WRITE;
/*!40000 ALTER TABLE `Action` DISABLE KEYS */;
INSERT INTO `Action` VALUES (1,12,'resolved','removed'),(2,6,'resolved','removed'),(3,3,'misinformation','flagged'),(3,14,'spam','removed'),(3,32,'spam','removed'),(3,34,'resolved','removed'),(3,40,'spam','removed'),(3,54,'resolved','flagged'),(3,56,'misinformation','flagged'),(3,58,'spam','flagged'),(4,10,'misinformation','flagged'),(5,8,'resolved','removed'),(6,7,'spam','removed'),(7,1,'misinformation','flagged'),(8,11,'misinformation','flagged'),(9,3,'spam','removed'),(10,15,'misinformation','flagged'),(11,9,'spam','removed'),(12,13,'resolved','removed'),(13,2,'misinformation','flagged'),(14,4,'resolved','removed'),(15,5,'spam','removed');
/*!40000 ALTER TABLE `Action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `userid` int NOT NULL,
  `staffid` int NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `staffid_UNIQUE` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (3,1),(4,2),(1,3),(10,4),(8,5),(6,6),(12,7),(9,8),(14,9),(13,10),(11,11),(15,12),(7,13),(2,14),(5,15);
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alert`
--

DROP TABLE IF EXISTS `Alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alert` (
  `alertid` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`alertid`,`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alert`
--

LOCK TABLES `Alert` WRITE;
/*!40000 ALTER TABLE `Alert` DISABLE KEYS */;
INSERT INTO `Alert` VALUES (4,2,'robbery','Santa Clara'),(5,2,'medical','Santa Clara'),(6,2,'trespassing','Santa Clara'),(7,2,'protest','Santa Clara'),(8,3,'fire','Mountain View'),(9,3,'sexual harassment','Mountain View'),(10,4,'stealing','Palo Alto'),(11,4,'weather','Palo Alto'),(12,4,'suspicious activity','Palo Alto'),(13,4,'trespassing','Palo Alto'),(14,4,'protest','Palo Alto'),(15,5,'fire','San Jose'),(50,1,'Natural Calamity','Mountain View');
/*!40000 ALTER TABLE `Alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Announcement`
--

DROP TABLE IF EXISTS `Announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Announcement` (
  `announcementid` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(90) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`announcementid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Announcement`
--

LOCK TABLES `Announcement` WRITE;
/*!40000 ALTER TABLE `Announcement` DISABLE KEYS */;
INSERT INTO `Announcement` VALUES (6,1,'Test','Test','2020-12-01 21:38:32'),(8,1,'This is an announcement','Announcmeent stuff,.....','2020-12-06 16:31:18'),(9,10,'We\'re Recruiting','Come join us for an info session','2020-12-06 19:35:42'),(10,10,'This is an announcement','Me again, here is an announcement','2020-12-06 19:36:09'),(11,2,'Test Announcement','Testing announcement','2020-12-06 19:36:43'),(12,2,'Be Advised','Be advised there is a man with a gun on the loose','2020-12-06 19:37:23'),(13,13,'Annual Roundtable','The annual roundtable is tonight at 7pm','2020-12-06 19:38:08'),(14,13,'Reminder','Reminder that the roundtable is in 1hr','2020-12-06 19:38:24'),(15,7,'Stay Home','COVID stay at home orders in place','2020-12-06 19:39:03'),(16,7,'Re: Stay at Home','Curfew is in place until 12/30','2020-12-06 19:39:52'),(17,10,'Seminar','We\'re holding a seminar on gun safety','2020-12-06 19:41:04'),(18,4,'Mental Health','Please take care of your mental health','2020-12-06 19:41:35'),(19,4,'Wild Dog','A wild dog is running around the streets pleaase be adivsed','2020-12-06 19:42:03'),(20,8,'Danger Zone','Please stay away from 4th and Santa Clara today','2020-12-06 19:42:47'),(21,8,'COVID Precutions','Please take precautions when going out','2020-12-06 19:43:24'),(22,1,'Announcment','This is an announcement','2020-12-08 19:40:16');
/*!40000 ALTER TABLE `Announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `name` varchar(45) NOT NULL,
  `jurisdiction` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('Campbell Police Department','Campbell'),('Cupertino Police Department','Cupertino'),('Gilroy Police Department','Gilroy'),('Los Altos Police Department','Los Altos'),('Los Gatos Police Department','Los Gatos'),('Milpitas Police Department','Milpitas'),('Morgan Hill Police Department','Morgan Hill'),('Mountain View Fire Department','Mountain View'),('Mountain View Police Department','Mountain View'),('Palo Alto Police Department','Palo Alto'),('San Jose Fire Department','San Jose'),('San Jose Police Department','San Jose'),('Santa Clara Fire Department','Santa Clara'),('Santa Clara Police Department','Santa Clara'),('Sunnyvale Police Department','Sunnyvale');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LawEnforcement`
--

DROP TABLE IF EXISTS `LawEnforcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LawEnforcement` (
  `userid` int NOT NULL,
  `officerid` int NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `officerid_UNIQUE` (`officerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LawEnforcement`
--

LOCK TABLES `LawEnforcement` WRITE;
/*!40000 ALTER TABLE `LawEnforcement` DISABLE KEYS */;
INSERT INTO `LawEnforcement` VALUES (8,1),(1,2),(9,3),(13,4),(14,5),(10,6),(15,7),(7,8),(3,9),(12,10),(4,11),(6,12),(11,13),(5,14),(2,15);
/*!40000 ALTER TABLE `LawEnforcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberOf`
--

DROP TABLE IF EXISTS `MemberOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MemberOf` (
  `officerid` int NOT NULL,
  `departmentName` varchar(45) NOT NULL,
  PRIMARY KEY (`officerid`,`departmentName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberOf`
--

LOCK TABLES `MemberOf` WRITE;
/*!40000 ALTER TABLE `MemberOf` DISABLE KEYS */;
INSERT INTO `MemberOf` VALUES (1,'San Jose Police Department'),(2,'Milpitas Police Department'),(3,'Milpitas Police Department'),(4,'Sunnyvale Police Department'),(5,'Santa Clara Police Department'),(6,'San Jose Police Department'),(7,'San Jose Police Department'),(8,'Palo Alto Police Department'),(9,'Sunnyvale Police Department'),(10,'Cupertino Police Department'),(11,'San Jose Fire Department'),(12,'Los Altos Police Department'),(13,'Campbell Police Department'),(14,'Santa Clara Fire Department'),(15,'Gilroy Police Department');
/*!40000 ALTER TABLE `MemberOf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reply`
--

DROP TABLE IF EXISTS `Reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reply` (
  `replyid` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `reportid` int DEFAULT NULL,
  `text` varchar(45) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`replyid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reply`
--

LOCK TABLES `Reply` WRITE;
/*!40000 ALTER TABLE `Reply` DISABLE KEYS */;
INSERT INTO `Reply` VALUES (5,1,52,'This is a reply','2020-12-06 00:11:50'),(9,1,12,'I saw it too!','2020-12-06 18:40:30'),(10,1,14,'There was a white car near there as well','2020-12-06 19:25:23'),(11,28,54,'Fire is now out','2020-12-06 19:25:56'),(12,28,4,'I think the same person robbed me','2020-12-06 19:26:34'),(13,28,7,'This is a reply','2020-12-06 19:28:42'),(14,7,54,'I think it started near the corner store','2020-12-06 19:29:34'),(15,7,4,'I\'m replying to this post','2020-12-06 19:31:17'),(16,3,54,'This is me replying','2020-12-06 19:31:47'),(17,3,5,'The weather is clear now','2020-12-06 19:31:58'),(18,3,5,'This is me again replying','2020-12-06 19:32:07'),(19,3,9,'Why is this the same post','2020-12-06 19:32:20'),(20,10,10,'Why is it raining now!?!','2020-12-06 19:32:51'),(21,10,54,'I think the blaze started around 10 am','2020-12-06 19:33:15'),(22,10,14,'Robbery!?','2020-12-06 19:33:49'),(23,10,13,'Be careful out there!','2020-12-06 19:34:31');
/*!40000 ALTER TABLE `Reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Report`
--

DROP TABLE IF EXISTS `Report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Report` (
  `reportid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(90) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `flag` int NOT NULL,
  PRIMARY KEY (`reportid`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Report`
--

LOCK TABLES `Report` WRITE;
/*!40000 ALTER TABLE `Report` DISABLE KEYS */;
INSERT INTO `Report` VALUES (3,'Man spotted holding a gun','White male seen walking with gun downtown','San Jose','2020-10-30 18:20:30','Fire',1),(4,'Stealing','A mysterious person stole a purse from a lady near 9th and Santa Clara','San Jose','2020-10-30 18:21:24','Robbery',0),(5,'Storm Clouds Downtown','Looks like it\'s about to rain','San Jose','2020-10-30 18:21:24','Weather',0),(6,'Suspious Activity on 4th','A mysterious person was lurking near 4th St.','Mountain View','2020-10-30 18:21:24','Suspicious Activity',0),(7,'Fire spotted near 9th','I saw a fire near 9th St.','Mountain View','2020-10-30 18:21:24','Fire',0),(9,'Stealing','A mysterious person stole a purse from a lady near 9th and Santa Clara','Mountain View','2020-10-30 18:21:24','Robbery',0),(10,'Storm Clouds Downtown','Looks like it\'s about to rain','Mountain View','2020-10-30 18:21:24','Weather',0),(12,'Fire spotted near 9th','I saw a fire near 9th St.','Palo Alto','2020-10-30 18:21:24','Fire',0),(13,'Man spotted holding a gun','White male seen walking with gun downtown','Santa Clara','2020-10-30 18:21:24','Gun',0),(14,'Stealing','A mysterious person stole a purse from a lady near 9th and Santa Clara','Palo Alto','2020-10-30 18:21:24','Robbery',0),(15,'Storm Clouds Downtown','Looks like it\'s about to rain','Palo Alto','2020-10-30 18:21:24','Weather',0),(16,'Incident','Description','San Jose','2020-11-08 13:09:52','crime',0),(17,'Incident','Description','San Jose','2020-11-08 13:11:25','crime',0),(18,'Incident','Description','San Jose','2020-11-08 13:42:52','Crime',0),(19,'Suspisious Activity on 4th','I saw someone suspisious getting out of a car.','Santa Clara','2020-11-08 18:26:19','Crime',0),(20,'Cloudy Weather Downtown','It looks like it\'s going to rain.','Campbell','2020-11-08 18:36:10','Natural Calamity',0),(21,'Incident','','Morgan Hill','2020-11-21 17:45:07','Crime',0),(22,'Suspisious Activity on 4th','Car on fire.','Santa Clara','2020-11-22 21:10:53','Accident',0),(23,'Suspisious Activity on 4th','Car on fire.','Santa Clara','2020-11-22 21:11:57','Accident',0),(24,'Suspisious Activity on 4th','Car on fire.','Santa Clara','2020-11-22 21:13:05','Accident',0),(25,'Suspisious Activity on 4th','Car on fire.','Santa Clara','2020-11-22 21:14:08','Accident',0),(26,'Suspisious Activity on 4th','Car on fire.','Santa Clara','2020-11-22 21:14:32','Accident',0),(27,'Suspisious Activity on 4th','Car on fire.','Santa Clara','2020-11-22 21:23:47','Accident',0),(28,'Incident','Toxic Gas','Morgan Hill','2020-11-22 21:31:04','Health Hazard',0),(29,'Incident','Toxic Gas','Morgan Hill','2020-11-22 21:31:08','Health Hazard',0),(30,'Incident','Description','Saratoga','2020-11-22 21:34:11','Natural Calamity',0),(31,'Incident','Description','Saratoga','2020-11-22 21:34:16','Natural Calamity',0),(54,'Fire on 4th','There is a fire!!!!','Santa Clara','2020-12-06 16:18:39','Fire',1),(56,'Test','This is a takeover','Mountain View','2020-12-08 17:53:10','Natural Calamity',1),(58,'Test Flag','Testing','Santa Clara','2020-12-08 20:00:21','Crime',1);
/*!40000 ALTER TABLE `Report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reports`
--

DROP TABLE IF EXISTS `Reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reports` (
  `userid` int NOT NULL,
  `reportid` int NOT NULL,
  PRIMARY KEY (`userid`,`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reports`
--

LOCK TABLES `Reports` WRITE;
/*!40000 ALTER TABLE `Reports` DISABLE KEYS */;
INSERT INTO `Reports` VALUES (1,0),(1,1),(1,2),(1,3),(1,8),(1,11),(1,45),(1,46),(1,48),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(2,4),(4,12),(6,5),(7,14),(8,13),(10,6),(10,7),(12,9),(14,15),(15,10),(26,49),(28,50);
/*!40000 ALTER TABLE `Reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Save`
--

DROP TABLE IF EXISTS `Save`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Save` (
  `userid` int NOT NULL,
  `reportid` int NOT NULL,
  PRIMARY KEY (`userid`,`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Save`
--

LOCK TABLES `Save` WRITE;
/*!40000 ALTER TABLE `Save` DISABLE KEYS */;
INSERT INTO `Save` VALUES (1,11),(1,45),(1,46),(1,48),(2,8),(2,14),(3,7),(5,8),(5,13),(7,3),(7,15),(9,10),(9,14),(9,52),(10,11),(13,6),(14,12);
/*!40000 ALTER TABLE `Save` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phonenumber` char(10) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'user1','password1','4085551111','San Jose'),(2,'user2','password2','4085552222','Santa Clara'),(3,'user3','password3','4085553333','Campbell'),(4,'user4','password4','4085554444','Gilroy'),(5,'user5','password5','5105555555','Los Altos'),(6,'user6','password6','5105556666','Milpitas'),(7,'user7','password7','5105557777','Morgan Hill'),(8,'user8','password8','5105558888','Monte Sereno'),(9,'user9','password9','6505559999','Mountain View'),(10,'user10','password10','6505551010','Palo Alto'),(11,'user11','password11','6505551100','Cupertino'),(12,'user12','password12','6505551212','Los Altos Hills'),(13,'user13','password13','6695551313','Saratoga'),(14,'user14','password14','6695551414','Sunnyvale'),(15,'user15','password15','6695551515','Los Gatos'),(19,'user20','password',NULL,NULL),(20,'ryan','password',NULL,NULL),(21,'newuser','newpassword',NULL,NULL),(22,'rkwong','password1','5105555555','San Jose'),(23,'ryankwong','password','5105555555','San Jose'),(24,'newuser1','password','5105555555','San Jose'),(26,'cs157','password','5105555555','San Jose'),(27,'testuser1','password','5105555555','San Jose'),(28,'mikewu','password','5105555555','Santa Clara');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-08 20:09:03

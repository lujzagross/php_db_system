-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: web_developers
-- ------------------------------------------------------
-- Server version	5.6.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clients` (
  `Client-ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Adress` varchar(45) DEFAULT NULL,
  `Contact Name` varchar(45) DEFAULT NULL,
  `Contact Phone` varchar(45) DEFAULT NULL,
  `Zip Code_Zip-ID` int(11) NOT NULL,
  PRIMARY KEY (`Client-ID`),
  KEY `fk_Clients_Zip Code1_idx` (`Zip Code_Zip-ID`),
  CONSTRAINT `fk_Clients_Zip Code1` FOREIGN KEY (`Zip Code_Zip-ID`) REFERENCES `Zip Code` (`Zip-ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES (11,'NDERSION','ASDA','Master Neo','3131331',2800),(12,'Morpheus','Nebuchanezza','Morpheus ','3131313131',2920),(13,'Trinity','Zion','Trin','90909090',2800),(14,'Agent Smith','Matrix','Smith ','90909090',2900),(15,'Oracle','Matrix behind the door','Oracle','90909090',2900);
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project` (
  `Project-ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Start Date` varchar(45) DEFAULT NULL,
  `End Date` varchar(45) DEFAULT NULL,
  `Project Details` varchar(45) DEFAULT NULL,
  `Clients_Client-ID` int(11) NOT NULL,
  PRIMARY KEY (`Project-ID`,`Clients_Client-ID`),
  KEY `fk_Project_Clients_idx` (`Clients_Client-ID`),
  CONSTRAINT `fk_Project_Clients` FOREIGN KEY (`Clients_Client-ID`) REFERENCES `Clients` (`Client-ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES (1,'Project 1 ','Project 1 ','2016-11-07','2016-11-07','bla',12),(2,'Project 2','Project 2','2016-11-07','2016-11-07','Project 2 ',13),(3,'Project 3','Project 3','2016-11-07','2016-11-07','Project 3',11),(4,'Project 4','Project 4','2016-11-07','2016-11-07','Project 4',14),(5,'Project 5','Project 5','2016-11-07','2016-11-07','Project 5',11);
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project_has_Resource`
--

DROP TABLE IF EXISTS `Project_has_Resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project_has_Resource` (
  `Resource_Resource-ID` int(11) NOT NULL,
  `Project_Project-ID` int(11) NOT NULL,
  `From-Date` datetime DEFAULT NULL,
  `To-Date` datetime DEFAULT NULL,
  `Hourly-Usage Rate` int(11) DEFAULT NULL,
  PRIMARY KEY (`Resource_Resource-ID`,`Project_Project-ID`),
  KEY `fk_Project_has_Resource_Resource1_idx` (`Resource_Resource-ID`),
  KEY `fk_Project_has_Resource_Project1_idx` (`Project_Project-ID`),
  CONSTRAINT `fk_Project_has_Resource_Project1` FOREIGN KEY (`Project_Project-ID`) REFERENCES `Project` (`Project-ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Project_has_Resource_Resource1` FOREIGN KEY (`Resource_Resource-ID`) REFERENCES `Resource` (`Resource-ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project_has_Resource`
--

LOCK TABLES `Project_has_Resource` WRITE;
/*!40000 ALTER TABLE `Project_has_Resource` DISABLE KEYS */;
INSERT INTO `Project_has_Resource` VALUES (1,3,'2016-10-05 00:00:00','2016-10-04 00:00:00',200),(3,4,'2016-10-19 00:00:00','2016-10-24 00:00:00',9000),(3,5,'2016-10-20 00:00:00','2016-10-24 00:00:00',800),(4,5,'2016-10-27 00:00:00','2016-10-20 00:00:00',6000);
/*!40000 ALTER TABLE `Project_has_Resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Resource`
--

DROP TABLE IF EXISTS `Resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Resource` (
  `Resource-ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Other Resource Details` varchar(45) DEFAULT NULL,
  `Resource Type_type-ID` int(11) NOT NULL,
  PRIMARY KEY (`Resource-ID`),
  KEY `fk_Resource_Resource Type1_idx` (`Resource Type_type-ID`),
  CONSTRAINT `fk_Resource_Resource Type1` FOREIGN KEY (`Resource Type_type-ID`) REFERENCES `Resource Type` (`Type Code-ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Resource`
--

LOCK TABLES `Resource` WRITE;
/*!40000 ALTER TABLE `Resource` DISABLE KEYS */;
INSERT INTO `Resource` VALUES (1,'Joe','Joes Firm',1),(2,'John','Johns Firm',3),(3,'Neo','Saviour',5),(4,'Bob','Bobs Firm',2);
/*!40000 ALTER TABLE `Resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Resource Type`
--

DROP TABLE IF EXISTS `Resource Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Resource Type` (
  `Type Code-ID` int(11) NOT NULL,
  `Type Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Type Code-ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Resource Type`
--

LOCK TABLES `Resource Type` WRITE;
/*!40000 ALTER TABLE `Resource Type` DISABLE KEYS */;
INSERT INTO `Resource Type` VALUES (1,'Graphic Designer'),(2,'Programmer'),(3,'Print Expert'),(4,'Front-end Developer'),(5,'The Chosen One');
/*!40000 ALTER TABLE `Resource Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zip Code`
--

DROP TABLE IF EXISTS `Zip Code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Zip Code` (
  `Zip-ID` int(11) NOT NULL,
  `City-Zip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Zip-ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zip Code`
--

LOCK TABLES `Zip Code` WRITE;
/*!40000 ALTER TABLE `Zip Code` DISABLE KEYS */;
INSERT INTO `Zip Code` VALUES (2800,'Lyngby'),(2820,'Gentofte'),(2900,'Hellerup'),(2920,'Charlottenlund');
/*!40000 ALTER TABLE `Zip Code` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-07 16:54:48

-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: mosskey
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Current Database: `mosskey`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mosskey` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mosskey`;

--
-- Table structure for table `Authority`
--

DROP TABLE IF EXISTS `Authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authority`
--

LOCK TABLES `Authority` WRITE;
/*!40000 ALTER TABLE `Authority` DISABLE KEYS */;
INSERT INTO `Authority` VALUES (2,'Hedwig'),(1,'Sean Connery');
/*!40000 ALTER TABLE `Authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KeyCharacter`
--

DROP TABLE IF EXISTS `KeyCharacter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KeyCharacter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) NOT NULL,
  `lft` int(11) NOT NULL,
  `rht` int(11) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `AnchorText` varchar(45) DEFAULT NULL,
  `URLid` int(11) DEFAULT NULL,
  `isEye` tinyint(1) DEFAULT NULL,
  `isHandLens` tinyint(1) DEFAULT NULL,
  `isScope` tinyint(1) DEFAULT NULL,
  `TimeStamp` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `url_idx` (`URLid`),
  CONSTRAINT `url` FOREIGN KEY (`URLid`) REFERENCES `URL` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KeyCharacter`
--

LOCK TABLES `KeyCharacter` WRITE;
/*!40000 ALTER TABLE `KeyCharacter` DISABLE KEYS */;
/*!40000 ALTER TABLE `KeyCharacter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Map`
--

DROP TABLE IF EXISTS `Map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TaxaId` int(11) DEFAULT NULL,
  `KeyCharacterId` int(11) DEFAULT NULL,
  `TimeStamp` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `taxaid_idx` (`TaxaId`),
  KEY `keycharacterid_idx` (`KeyCharacterId`),
  CONSTRAINT `keycharacterid` FOREIGN KEY (`KeyCharacterId`) REFERENCES `KeyCharacter` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `taxaid` FOREIGN KEY (`TaxaId`) REFERENCES `Taxa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Map`
--

LOCK TABLES `Map` WRITE;
/*!40000 ALTER TABLE `Map` DISABLE KEYS */;
/*!40000 ALTER TABLE `Map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `URL`
--

DROP TABLE IF EXISTS `URL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `URL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(256) DEFAULT NULL,
  `AltText` varchar(256) DEFAULT NULL,
  `Description` varchar(1024) DEFAULT NULL,
  `Type` enum('image','other') NOT NULL,
  `TimeStamp` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idURL_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `URL`
--

LOCK TABLES `URL` WRITE;
/*!40000 ALTER TABLE `URL` DISABLE KEYS */;
INSERT INTO `URL` VALUES (1,'http://www.efloras.org/florataxon.aspx?flora_id=1&taxon_id=200000987',NULL,NULL,'other','2017-03-05 14:43:32');
/*!40000 ALTER TABLE `URL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxa`
--

DROP TABLE IF EXISTS `taxa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `description` varchar(16384) DEFAULT NULL,
  `URLId` int(11) DEFAULT NULL,
  `AuthorityId` int(11) DEFAULT NULL,
  `TimeStamp` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `url_idx` (`URLId`),
  KEY `authority_idx` (`AuthorityId`),
  CONSTRAINT `authority_taxa` FOREIGN KEY (`AuthorityId`) REFERENCES `Authority` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `url_taxa` FOREIGN KEY (`URLId`) REFERENCES `URL` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxa`
--

LOCK TABLES `taxa` WRITE;
/*!40000 ALTER TABLE `taxa` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-16 13:36:04

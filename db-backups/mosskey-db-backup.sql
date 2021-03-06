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
  `Name` varchar(45) NOT NULL,
  `lft` int(11) NOT NULL,
  `rht` int(11) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `ViewBy` enum('eye','scope','handlense') DEFAULT NULL,
  `AnchorText` varchar(45) DEFAULT NULL,
  `URLid` int(11) DEFAULT NULL,
  `isHandLens` tinyint(1) DEFAULT NULL,
  `isDissectingScope` tinyint(1) DEFAULT NULL,
  `isLightScope` tinyint(1) DEFAULT NULL,
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
INSERT INTO `KeyCharacter` VALUES (1,'Root',1,88,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(2,'Seta',2,37,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(3,'Length',3,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(4,'Seta Length Short',4,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(5,'Seta Length Long (Capsule Completey Emergent)',6,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(6,'Seta Length Very Long',8,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(7,'Orientation',11,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(8,'Seta Straight',12,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(9,'Seta Bent At Capsule Base',14,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(10,'Seta Curved',16,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(11,'Seta Flexuose',18,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(12,'Seta Cygneous (Wet)',20,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(13,'Color',23,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(14,'Seta Color Brownish',24,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(15,'Seta Color Hyaline',26,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(16,'Twisting',29,36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(17,'Seta Twisted Clockwise',30,31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(18,'Seta Twisted Counter Clockwise',32,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(19,'Seta Twists When Wet; Straightens When Dries',34,35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(20,'Capsule',38,87,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(21,'Attachment',39,52,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(22,'Capsule Attachment Terminal',40,41,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(23,'Capsule Attachment Lateral',42,43,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(24,'Capsule Attachment Inclined',44,45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(25,'Capsule Attachment Immersed',46,47,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(26,'Capsule Attachment Exserted ',48,49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(27,'Capsule Attachment Eccentric/Various',50,51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(28,'Shape',53,86,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(29,'Calpsule Shape 4-Angled And Split',54,55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(30,'Capsule Shape Cylindric',56,57,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(31,'Capsule Shape Globose',58,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(32,'Capsule Shape Oblong',60,61,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(33,'Capsule Shape Pyriforme',62,63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(34,'Capsule Shape Sharply 4-5 Angled',64,65,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(35,'Capsule Shape Swollen To One Side',66,67,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(36,'Capsule Shape Symmetric',68,69,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(37,'Capsule Shape Urn',70,71,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(38,'Capsule Shape Asymmetric',72,73,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(39,'Capsule Shape Curved',74,75,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(41,'Capsule Shape Ovoid',76,77,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(42,'Capsule Shape Pyriform',78,79,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(43,'Capsule Shape Short',80,81,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(45,'Capsule Shape Terete',82,83,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31'),(46,'Capsule Strumose',84,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-18 14:15:31');
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
INSERT INTO `Map` VALUES (1,1,3,'2017-02-28 13:59:27'),(2,2,5,'2017-02-28 13:59:27'),(3,1,4,'2017-02-28 16:44:19'),(4,2,6,'2017-02-28 16:44:19'),(5,4,22,'2017-03-05 15:11:19');
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
INSERT INTO `taxa` VALUES 
  (1,'basic moss','this is your basic vanilla moss.',NULL,NULL,'2017-03-05 14:31:30'),
  (2,'peat','used in scotch distillation',NULL,1,'2017-03-05 14:35:50'),
  (4,'Dicranum Scoparium','Plants in loose to dense tufts, light to dark green, glossy to sometimes dull. Stems 2-10 cm, tomentose with white to brown rhizoids. Leaves very variable, usually falcate-secund, rarely straight and erect, slightly contorted and crisped when dry, sometimes slightly rugose or undulate, concave proximally, keeled above, lanceolate, apex acute to somewhat obtuse. margins strongly serrate in the distal or rarely slightly serrulate. laminae 1-stratose, costa percurrent, excurrent, or ending before apex, usually with 2-4 toothed ridges above on abaxial surface, with a row of guide cells, two thin stereid bands, adaxial epidermal layer of cells not differentiated, the abaxial layer interrupted by several enlarged cells that form part of the abaxial ridge, not extending to the apices, cell walls between lamina cells not bulging, leaf cells smooth, alar cells 2-stratose, well- differentiated, sometimes extending to costa. proximal laminal cells linear-rectangular, pitted',1,2,'2017-03-06 09:39:31'),
  (5,'test','syntax tester: &,\\,\', ',NULL,NULL,CURRENT_TIMESTAMP);
;
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

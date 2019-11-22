-- MySQL dump 10.15  Distrib 10.0.28-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.0.28-MariaDB-0+deb8u1

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
-- Table structure for table `tE1y2`
--

DROP TABLE IF EXISTS `tE1y2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tE1y2` (
  `idE1y2` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `rojo` float DEFAULT NULL,
  `verde` float DEFAULT NULL,
  `azul` float DEFAULT NULL,
  `probabilidadHueco` float DEFAULT NULL,
  PRIMARY KEY (`idE1y2`),
  KEY `fk_tE1y2_1_idx` (`idUsuario`),
  CONSTRAINT `fk_tE1y2_1` FOREIGN KEY (`idUsuario`) REFERENCES `tUsuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tE1y2`
--

LOCK TABLES `tE1y2` WRITE;
/*!40000 ALTER TABLE `tE1y2` DISABLE KEYS */;
INSERT INTO `tE1y2` VALUES (1,1,255,255,61,3),(2,2,255,255,0,1),(3,2,255,255,0,21),(4,2,255,159,238,3),(5,2,16,68,18,0),(6,2,43,62,184,8),(7,2,68,113,145,3);
/*!40000 ALTER TABLE `tE1y2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tE3`
--

DROP TABLE IF EXISTS `tE3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tE3` (
  `idE3` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `startAlpha` float DEFAULT NULL,
  `endAlpha` float DEFAULT NULL,
  PRIMARY KEY (`idE3`),
  KEY `fk_tE3_1_idx` (`idUsuario`),
  CONSTRAINT `fk_tE3_1` FOREIGN KEY (`idUsuario`) REFERENCES `tUsuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tE3`
--

LOCK TABLES `tE3` WRITE;
/*!40000 ALTER TABLE `tE3` DISABLE KEYS */;
INSERT INTO `tE3` VALUES (1,1,21,144),(2,2,20,221),(3,2,161,255),(4,2,255,49),(5,2,8,15),(6,2,88,255),(7,2,178,0);
/*!40000 ALTER TABLE `tE3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tE4`
--

DROP TABLE IF EXISTS `tE4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tE4` (
  `idE4` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `maxAlpha` float DEFAULT NULL,
  PRIMARY KEY (`idE4`),
  KEY `fk_tE4_1_idx` (`idUsuario`),
  CONSTRAINT `fk_tE4_1` FOREIGN KEY (`idUsuario`) REFERENCES `tUsuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tE4`
--

LOCK TABLES `tE4` WRITE;
/*!40000 ALTER TABLE `tE4` DISABLE KEYS */;
INSERT INTO `tE4` VALUES (1,1,153),(2,2,150),(3,2,255),(4,2,173),(5,2,255),(6,2,235),(7,2,255);
/*!40000 ALTER TABLE `tE4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tE5`
--

DROP TABLE IF EXISTS `tE5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tE5` (
  `idE5` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `gray1` float DEFAULT NULL,
  `gray2` float DEFAULT NULL,
  `maxAlpha` float DEFAULT NULL,
  `lineChance` float DEFAULT NULL,
  PRIMARY KEY (`idE5`),
  KEY `fk_tE5_1_idx` (`idUsuario`),
  CONSTRAINT `fk_tE5_1` FOREIGN KEY (`idUsuario`) REFERENCES `tUsuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tE5`
--

LOCK TABLES `tE5` WRITE;
/*!40000 ALTER TABLE `tE5` DISABLE KEYS */;
INSERT INTO `tE5` VALUES (1,1,0,200,168.247,0.675556),(2,2,0,200,255,0.5),(3,2,210,19,126.711,0.822222),(4,2,34,255,119.876,0.866667),(5,2,255,0,42.5876,0.766667),(6,2,0,28,80.4433,0.642222),(7,2,0,103,110.412,0.5);
/*!40000 ALTER TABLE `tE5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tE6`
--

DROP TABLE IF EXISTS `tE6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tE6` (
  `idE6` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `startAlpha` float DEFAULT NULL,
  `endAlpha` float DEFAULT NULL,
  PRIMARY KEY (`idE6`),
  KEY `fk_tE6_1_idx` (`idUsuario`),
  CONSTRAINT `fk_tE6_1` FOREIGN KEY (`idUsuario`) REFERENCES `tUsuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tE6`
--

LOCK TABLES `tE6` WRITE;
/*!40000 ALTER TABLE `tE6` DISABLE KEYS */;
INSERT INTO `tE6` VALUES (1,1,148.734,255),(2,2,38.2309,150),(3,2,185.918,255),(4,2,155.542,255),(5,2,23.0433,150),(6,2,254,255),(7,2,90.0784,224.101);
/*!40000 ALTER TABLE `tE6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tFondos`
--

DROP TABLE IF EXISTS `tFondos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tFondos` (
  `idFondo` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `backgroundRed` int(11) DEFAULT NULL,
  `backgroundGreen` int(11) DEFAULT NULL,
  `backgroundBlue` int(11) DEFAULT NULL,
  `imperfectionWeight` float DEFAULT NULL,
  `imperfectionPercentage` float DEFAULT NULL,
  PRIMARY KEY (`idFondo`),
  KEY `fk_tFondos_1_idx` (`idUsuario`),
  CONSTRAINT `fk_tFondos_1` FOREIGN KEY (`idUsuario`) REFERENCES `tUsuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tFondos`
--

LOCK TABLES `tFondos` WRITE;
/*!40000 ALTER TABLE `tFondos` DISABLE KEYS */;
INSERT INTO `tFondos` VALUES (1,1,255,0,0,13.0488,6),(2,2,255,0,0,2,1),(3,2,255,0,0,1.21951,30),(4,2,0,22,7,19.8171,8),(5,2,255,255,147,25,50),(6,2,127,20,123,25,3),(7,2,91,134,187,2,25);
/*!40000 ALTER TABLE `tFondos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tUsuarios`
--

DROP TABLE IF EXISTS `tUsuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tUsuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `correoE` varchar(255) DEFAULT NULL,
  `enviar` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tUsuarios`
--

LOCK TABLES `tUsuarios` WRITE;
/*!40000 ALTER TABLE `tUsuarios` DISABLE KEYS */;
INSERT INTO `tUsuarios` VALUES (1,'ele',0),(2,'',1),(3,'',1),(4,'',1),(5,'',1),(6,'',1),(7,'',1);
/*!40000 ALTER TABLE `tUsuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-23  0:31:58

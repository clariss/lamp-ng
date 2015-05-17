CREATE DATABASE  IF NOT EXISTS `costmodel2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `costmodel2`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: costmodel2
-- ------------------------------------------------------
-- Server version	5.1.44-community

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
-- Table structure for table `allocation`
--

DROP TABLE IF EXISTS `allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allocation` (
  `ALLOCATION_ID` varchar(45) NOT NULL,
  `ROW` int(11) NOT NULL,
  `COL` int(11) NOT NULL,
  `VAL` double DEFAULT NULL,
  PRIMARY KEY (`ALLOCATION_ID`,`ROW`,`COL`),
  KEY `ALLOCATION_FK1` (`ALLOCATION_ID`),
  CONSTRAINT `ALLOCATION_FK1` FOREIGN KEY (`ALLOCATION_ID`) REFERENCES `matrix` (`MATRIX_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocation`
--

LOCK TABLES `allocation` WRITE;
/*!40000 ALTER TABLE `allocation` DISABLE KEYS */;
INSERT INTO `allocation` (`ALLOCATION_ID`, `ROW`, `COL`, `VAL`) VALUES ('A',1,1,966.27),('A',1,2,1997),('A',1,3,1997),('A',1,4,673.64),('A',1,5,505.83),('A',1,6,225.19),('A',1,7,431.6),('A',1,8,735.96),('A',1,9,735.96),('B',1,1,0),('B',1,2,0),('B',1,3,0),('B',1,4,0),('B',1,5,0),('B',1,6,1),('B',1,7,0),('B',2,1,0.2),('B',2,2,0.2),('B',2,3,0.2),('B',2,4,0.2),('B',2,5,0.2),('B',2,6,0),('B',2,7,0),('B',3,1,0.25),('B',3,2,0.25),('B',3,3,0.25),('B',3,4,0.25),('B',3,5,0),('B',3,6,0),('B',3,7,0),('B',4,1,0.25),('B',4,2,0.25),('B',4,3,0.25),('B',4,4,0.25),('B',4,5,0),('B',4,6,0),('B',4,7,0),('B',5,1,0.25),('B',5,2,0.25),('B',5,3,0.25),('B',5,4,0.25),('B',5,5,0),('B',5,6,0),('B',5,7,0),('B',6,1,0),('B',6,2,0),('B',6,3,0),('B',6,4,0),('B',6,5,1),('B',6,6,0),('B',6,7,0),('B',7,1,0),('B',7,2,0),('B',7,3,0),('B',7,4,0),('B',7,5,0),('B',7,6,1),('B',7,7,0),('B',8,1,0),('B',8,2,0),('B',8,3,0),('B',8,4,0),('B',8,5,0),('B',8,6,0),('B',8,7,1),('B',9,1,0),('B',9,2,0),('B',9,3,0),('B',9,4,0),('B',9,5,0),('B',9,6,0),('B',9,7,1),('C',1,1,485),('C',1,2,625.03),('C',1,3,175.25),('C',1,4,558.47),('C',1,5,463.72),('C',1,6,723.92),('C',1,7,220),('C',1,8,1800),('D',1,1,0.1),('D',1,2,0.4),('D',2,1,0.7),('D',2,2,0),('D',3,1,0.7),('D',3,2,0),('D',4,1,0.3),('D',4,2,0.5),('D',5,1,0.4),('D',5,2,0.5),('D',6,1,0.3),('D',6,2,0.6),('D',7,1,0.3),('D',7,2,0.6),('D',8,1,0.3),('D',8,2,0.6),('E',1,1,0),('E',1,2,0.3),('E',1,3,0),('E',1,4,0.7),('E',2,1,0.3),('E',2,2,0),('E',2,3,0.7),('E',2,4,0),('F',1,1,1),('F',2,1,1),('F',3,1,1),('F',4,1,1),('G',1,1,0.5),('G',1,2,0),('G',1,3,0),('G',1,4,0),('G',1,5,0.5),('G',2,1,0),('G',2,2,0.5),('G',2,3,0),('G',2,4,0),('G',2,5,0.5),('G',3,1,0),('G',3,2,0),('G',3,3,0.5),('G',3,4,0),('G',3,5,0.5),('G',4,1,0),('G',4,2,0),('G',4,3,0),('G',4,4,0.5),('G',4,5,0.5),('G',5,1,0),('G',5,2,0),('G',5,3,0),('G',5,4,0),('G',5,5,1),('G',6,1,0),('G',6,2,0),('G',6,3,0),('G',6,4,0),('G',6,5,1),('G',7,1,0.2),('G',7,2,0.2),('G',7,3,0.2),('G',7,4,0.2),('G',7,5,0.2),('H',1,1,0.2),('H',1,2,0.2),('H',1,3,0.2),('H',1,4,0.2),('H',1,5,0.2),('I',1,1,3500),('I',1,2,3500),('J',1,1,1),('J',2,1,1),('K',1,1,5000),('K',1,2,5000),('L',1,1,1),('L',2,1,1),('M',1,1,0),('M',1,2,0.3),('M',1,3,0),('M',1,4,0.7),('N',1,1,0),('N',1,2,0),('N',1,3,1),('N',1,4,0);
/*!40000 ALTER TABLE `allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pool_list`
--

DROP TABLE IF EXISTS `pool_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pool_list` (
  `POOL_LIST_ID` varchar(45) NOT NULL,
  `COMPOSITION_ID` varchar(45) NOT NULL,
  PRIMARY KEY (`POOL_LIST_ID`,`COMPOSITION_ID`),
  KEY `POOL_FK1` (`COMPOSITION_ID`),
  CONSTRAINT `POOL_FK1` FOREIGN KEY (`COMPOSITION_ID`) REFERENCES `composition` (`COMPOSITION_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pool_list`
--

LOCK TABLES `pool_list` WRITE;
/*!40000 ALTER TABLE `pool_list` DISABLE KEYS */;
INSERT INTO `pool_list` (`POOL_LIST_ID`, `COMPOSITION_ID`) VALUES ('DIM12','CALC140'),('DIM15','CALC400'),('DIM15','CALC410');
/*!40000 ALTER TABLE `pool_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimension`
--

DROP TABLE IF EXISTS `dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimension` (
  `DIMENSION_ID` varchar(45) NOT NULL,
  `ROW` int(11) NOT NULL,
  `COL` int(11) NOT NULL,
  `DESC` varchar(45) NOT NULL,
  PRIMARY KEY (`DIMENSION_ID`,`ROW`,`COL`,`DESC`),
  KEY `DIMENSION_FK1` (`DIMENSION_ID`),
  CONSTRAINT `DIMENSION_FK1` FOREIGN KEY (`DIMENSION_ID`) REFERENCES `matrix` (`MATRIX_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimension`
--

LOCK TABLES `dimension` WRITE;
/*!40000 ALTER TABLE `dimension` DISABLE KEYS */;
INSERT INTO `dimension` (`DIMENSION_ID`, `ROW`, `COL`, `DESC`) VALUES ('10',1,1,'prod-app-soa'),('10',1,2,'prod-app-portal'),('10',1,3,'prod-db'),('10',1,4,'prod-san'),('10',1,5,'Oracle Database EE'),('10',1,6,'Oracle Weblogic'),('10',1,7,'Oracle SOA Suite'),('10',1,8,'dev-db'),('10',1,9,'dev-app'),('11',1,1,'AppCarRental'),('11',1,2,'AppFlightRes'),('11',1,3,'AppHotelRes'),('11',1,4,'AppTrainRes'),('11',1,5,'Portal'),('11',1,6,'WebServices'),('11',1,7,'Development'),('12',1,1,'Service CarRental'),('12',1,2,'Service FlightRes'),('12',1,3,'Service HotelRes'),('12',1,4,'Service TrainRes'),('12',1,5,'Service Portal'),('13',1,1,'Network'),('13',1,2,'Mobile phone'),('13',1,3,'Notebook'),('13',1,4,'Email'),('13',1,5,'Server Storage'),('13',1,6,'Phone'),('13',1,7,'PC'),('13',1,8,'Desk space'),('14',1,1,'ICT Gold'),('14',1,2,'ICT Silver'),('15',1,1,'Application Support Analysts'),('15',1,2,'Application Support Management'),('15',1,3,'Software Development Engineers'),('15',1,4,'Software Development Management'),('16',1,1,'ITTeam'),('17',1,1,'Enginner One'),('17',1,2,'Enginner Two'),('18',1,1,'Engineers'),('19',1,1,'Manager One'),('19',1,2,'Manager Two'),('20',1,1,'Managers');
/*!40000 ALTER TABLE `dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrix`
--

DROP TABLE IF EXISTS `matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrix` (
  `MATRIX_ID` varchar(45) NOT NULL,
  `ROWS` int(11) DEFAULT NULL,
  `COLS` int(11) DEFAULT NULL,
  PRIMARY KEY (`MATRIX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrix`
--

LOCK TABLES `matrix` WRITE;
/*!40000 ALTER TABLE `matrix` DISABLE KEYS */;
INSERT INTO `matrix` (`MATRIX_ID`, `ROWS`, `COLS`) VALUES ('10',1,9),('11',1,7),('12',1,5),('13',1,8),('14',1,2),('15',1,4),('16',1,1),('17',1,2),('18',1,1),('19',1,2),('20',1,1),('A',1,9),('B',9,7),('C',1,8),('D',8,2),('E',2,4),('F',4,1),('G',7,5),('H',1,5),('I',1,2),('J',2,1),('K',1,2),('L',2,1),('M',1,4),('N',1,4);
/*!40000 ALTER TABLE `matrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composition`
--

DROP TABLE IF EXISTS `composition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composition` (
  `COMPOSITION_ID` varchar(45) NOT NULL,
  `LHS` varchar(45) DEFAULT NULL,
  `RHS` varchar(45) NOT NULL,
  `POOL_LIST_ID` varchar(45) DEFAULT NULL,
  `DIM` varchar(45) NOT NULL,
  PRIMARY KEY (`COMPOSITION_ID`),
  KEY `COMPOSITION_FK1` (`LHS`),
  KEY `COMPOSITION_FK2` (`RHS`),
  KEY `COMPOSITION_FK3` (`DIM`),
  KEY `COMPOSITION_FK4` (`POOL_LIST_ID`),
  CONSTRAINT `COMPOSITION_FK1` FOREIGN KEY (`LHS`) REFERENCES `composition` (`COMPOSITION_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `COMPOSITION_FK2` FOREIGN KEY (`RHS`) REFERENCES `allocation` (`ALLOCATION_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `COMPOSITION_FK3` FOREIGN KEY (`DIM`) REFERENCES `dimension` (`DIMENSION_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `COMPOSITION_FK4` FOREIGN KEY (`POOL_LIST_ID`) REFERENCES `pool_list` (`POOL_LIST_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composition`
--

LOCK TABLES `composition` WRITE;
/*!40000 ALTER TABLE `composition` DISABLE KEYS */;
INSERT INTO `composition` (`COMPOSITION_ID`, `LHS`, `RHS`, `POOL_LIST_ID`, `DIM`) VALUES ('CALC010',NULL,'A',NULL,'10'),('CALC020','CALC010','B',NULL,'11'),('CALC030','CALC020','G','DIM12','12'),('CALC100',NULL,'C',NULL,'13'),('CALC110','CALC100','D',NULL,'14'),('CALC120','CALC110','E','DIM15','15'),('CALC130','CALC120','F',NULL,'16'),('CALC140','CALC130','H',NULL,'12'),('CALC200',NULL,'I',NULL,'17'),('CALC210','CALC200','J',NULL,'18'),('CALC300',NULL,'K',NULL,'19'),('CALC310','CALC300','L',NULL,'20'),('CALC400','CALC310','M',NULL,'15'),('CALC410','CALC210','N',NULL,'15');
/*!40000 ALTER TABLE `composition` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-17 16:03:05

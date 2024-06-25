-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dbbhms
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblapproval_logs`
--

DROP TABLE IF EXISTS `tblapproval_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblapproval_logs` (
  `ApprovalLogID` int(11) NOT NULL AUTO_INCREMENT,
  `DocumentName` varchar(50) NOT NULL,
  `ApprovalID` int(11) NOT NULL,
  `xTimeStamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `UserID` int(11) NOT NULL,
  `ApproveOrder` int(11) NOT NULL,
  `Action` varchar(40) NOT NULL,
  `Remarks` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ApprovalLogID`),
  UNIQUE KEY `ApprovalLogID` (`ApprovalLogID`),
  KEY `DocumentName` (`DocumentName`),
  KEY `ApprovalID` (`ApprovalID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `tblapproval_logs_fk` FOREIGN KEY (`DocumentName`) REFERENCES `tbldocuments` (`DocumentName`) ON UPDATE CASCADE,
  CONSTRAINT `tblapproval_logs_fk1` FOREIGN KEY (`ApprovalID`) REFERENCES `tblapprovals` (`ApprovalID`) ON UPDATE CASCADE,
  CONSTRAINT `tblapproval_logs_fk2` FOREIGN KEY (`UserID`) REFERENCES `tblusers` (`UserID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblapproval_logs`
--

LOCK TABLES `tblapproval_logs` WRITE;
/*!40000 ALTER TABLE `tblapproval_logs` DISABLE KEYS */;
INSERT INTO `tblapproval_logs` VALUES (17,'SignUp',19,'2023-11-30 01:57:36.616082',1,555,'Reject',NULL),(19,'SignUp',23,'2023-11-30 02:03:51.278599',1,777,'Approve','ok'),(20,'Booking',28,'2023-11-30 02:29:49.824408',5,555,'Reject','Invalid ID'),(21,'Booking',28,'2023-11-30 02:29:56.309820',5,555,'Reject','Invalid ID'),(22,'Booking',29,'2023-11-30 02:31:07.396341',5,777,'Approve','You can start now'),(23,'Booking',30,'2023-11-30 02:41:11.956545',5,555,'Reject','Sorry your ID is not valid'),(24,'Booking',31,'2023-11-30 02:42:13.112675',5,555,'Reject',''),(25,'Booking',32,'2023-11-30 02:42:28.190990',5,777,'Approve','Thank you');
/*!40000 ALTER TABLE `tblapproval_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblapprovals`
--

DROP TABLE IF EXISTS `tblapprovals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblapprovals` (
  `ApprovalID` int(11) NOT NULL AUTO_INCREMENT,
  `DocumentName` varchar(30) NOT NULL,
  `TableName` varchar(40) NOT NULL,
  `PrimaryField` varchar(50) NOT NULL,
  `PrimaryValue` varchar(50) NOT NULL,
  `ApproveOrder` int(11) NOT NULL DEFAULT 0,
  `LastApprover` int(11) NOT NULL DEFAULT 0,
  `UserID1` int(11) DEFAULT NULL,
  `UserID2` int(11) DEFAULT NULL,
  `UserID3` int(11) DEFAULT NULL,
  `xTimeStamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `DisplayOrder` int(11) NOT NULL DEFAULT 0,
  `Rejected_ApproveOrder` int(11) DEFAULT 0,
  PRIMARY KEY (`ApprovalID`),
  UNIQUE KEY `ApprovalID` (`ApprovalID`),
  KEY `DocumentName` (`DocumentName`),
  KEY `UserID1` (`UserID1`),
  KEY `UserID2` (`UserID2`),
  KEY `UserID3` (`UserID3`),
  CONSTRAINT `tblapprovals_fk` FOREIGN KEY (`DocumentName`) REFERENCES `tbldocuments` (`DocumentName`) ON UPDATE CASCADE,
  CONSTRAINT `tblapprovals_fk1` FOREIGN KEY (`UserID1`) REFERENCES `tblusers` (`UserID`) ON UPDATE CASCADE,
  CONSTRAINT `tblapprovals_fk2` FOREIGN KEY (`UserID2`) REFERENCES `tblusers` (`UserID`) ON UPDATE CASCADE,
  CONSTRAINT `tblapprovals_fk3` FOREIGN KEY (`UserID3`) REFERENCES `tblusers` (`UserID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblapprovals`
--

LOCK TABLES `tblapprovals` WRITE;
/*!40000 ALTER TABLE `tblapprovals` DISABLE KEYS */;
INSERT INTO `tblapprovals` VALUES (19,'SignUp','tblsignup','DocNumber','SU2023110000007',555,1,1,NULL,NULL,'2023-11-30 01:57:36.615487',0,555),(23,'SignUp','tblsignup','DocNumber','SU2023110000009',777,1,1,NULL,NULL,'2023-11-30 02:03:51.278237',0,0),(28,'Booking','tblbookings','DocNumber','BK2023110000012',555,5,5,NULL,NULL,'2023-11-30 02:29:56.307722',0,555),(29,'Booking','tblbookings','DocNumber','BK2023110000013',777,5,5,NULL,NULL,'2023-11-30 02:31:07.394609',0,0),(30,'Booking','tblbookings','DocNumber','BK2023110000014',555,5,5,NULL,NULL,'2023-11-30 02:41:11.956156',0,1),(31,'Booking','tblbookings','DocNumber','BK2023110000015',555,5,5,NULL,NULL,'2023-11-30 02:42:13.111238',0,1),(32,'Booking','tblbookings','DocNumber','BK2023110000016',777,5,5,NULL,NULL,'2023-11-30 02:42:28.190196',0,0);
/*!40000 ALTER TABLE `tblapprovals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblapprovers`
--

DROP TABLE IF EXISTS `tblapprovers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblapprovers` (
  `ApproverID` int(11) NOT NULL AUTO_INCREMENT,
  `DocumentName` varchar(50) DEFAULT NULL,
  `UserID1` int(11) DEFAULT NULL,
  `UserID2` int(11) DEFAULT NULL,
  `UserID3` int(11) DEFAULT NULL,
  PRIMARY KEY (`ApproverID`),
  UNIQUE KEY `ApproverID` (`ApproverID`),
  KEY `DocumentName` (`DocumentName`),
  KEY `UserID1` (`UserID1`),
  KEY `UserID2` (`UserID2`),
  KEY `UserID3` (`UserID3`),
  CONSTRAINT `tblapprovers_fk` FOREIGN KEY (`DocumentName`) REFERENCES `tbldocuments` (`DocumentName`) ON UPDATE CASCADE,
  CONSTRAINT `tblapprovers_fk1` FOREIGN KEY (`UserID1`) REFERENCES `tblusers` (`UserID`) ON UPDATE CASCADE,
  CONSTRAINT `tblapprovers_fk2` FOREIGN KEY (`UserID2`) REFERENCES `tblusers` (`UserID`) ON UPDATE CASCADE,
  CONSTRAINT `tblapprovers_fk3` FOREIGN KEY (`UserID3`) REFERENCES `tblusers` (`UserID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblapprovers`
--

LOCK TABLES `tblapprovers` WRITE;
/*!40000 ALTER TABLE `tblapprovers` DISABLE KEYS */;
INSERT INTO `tblapprovers` VALUES (4,'SignUp',1,NULL,NULL);
/*!40000 ALTER TABLE `tblapprovers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblattachments`
--

DROP TABLE IF EXISTS `tblattachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblattachments` (
  `attachmentid` int(11) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(90) DEFAULT NULL,
  `primaryfield` varchar(90) DEFAULT NULL,
  `fieldvalue` varchar(60) CHARACTER SET latin7 DEFAULT NULL COMMENT 'Primary Key Value',
  `filename` varchar(90) DEFAULT NULL,
  `ext` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`attachmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblattachments`
--

LOCK TABLES `tblattachments` WRITE;
/*!40000 ALTER TABLE `tblattachments` DISABLE KEYS */;
INSERT INTO `tblattachments` VALUES (7,'tblbhs','BHID','41','4179833030_543a4075c7_b','jpg'),(8,'tblbhs','BHID','41','living-room-and-kitchen-design','jpg'),(9,'tblbhs','BHID','41','Minimalist-modern-home-interior-design-with-a-patio','jpeg'),(10,'tblbhs','BHID','40','6514225755_d769a4e563_z','jpg'),(11,'tblbhs','BHID','40','squatters-in-manila-philippines-AXCKK6','jpg'),(12,'tblbhs','BHID','42','IMG20231129115644','jpg'),(13,'tblbhs','BHID','42','IMG20231129115633','jpg'),(14,'tblbhs','BHID','42','IMG20231129114113','jpg'),(17,'tblrooms','RoomID','26','living-room-and-kitchen-design','jpg'),(18,'tblbeds','BedID','1','cute-room-ideas-1677096334','png'),(19,'tblrooms','RoomID','26','Minimalist-modern-home-interior-design-with-a-patio','jpeg'),(20,'tblbeds','BedID','2','100632-W-2','jpg'),(21,'tblbeds','BedID','2','cute-room-ideas-1677096334','png'),(22,'tblbookings','DocNumber','OCC2023110000002','5b2bf9e94daf6b536d25586df884f29a','jpg'),(26,'tblbookings','DocNumber','OCC2023110000007','7a7fc4559e7e0c5994b1c20c97d371a1','jpg'),(27,'tblbhs','BHID','43','rob','jpg'),(28,'tblbhs','BHID','43','sk','png'),(29,'tblrooms','RoomID','29','379406940_1685443168635927_5804674737168481424_n','jpg'),(30,'tblrooms','RoomID','29','way','jpg'),(31,'tblbeds','BedID','5','way','jpg'),(32,'tblbeds','BedID','3','384568600_720628910095472_1983442778175572315_n','jpg'),(33,'tblrooms','RoomID','30','Screenshot_2023-10-05-19-58-07-21_f69139cffc4d135a71392e13634f144a','jpg'),(34,'tblrooms','RoomID','30','IMG20230927141525','jpg'),(35,'tblbookings','DocNumber','BK2023110000008','FB_IMG_1701158094433','jpg'),(36,'tblbeds','BedID','6','IMG20230927155233','jpg'),(37,'tblbeds','BedID','6','IMG20230927141525','jpg'),(38,'tblbookings','DocNumber','BK2023110000011','7a7fc4559e7e0c5994b1c20c97d371a1','jpg'),(39,'tblbeds','BedID','6','Screenshot_2023-10-05-19-58-07-21_f69139cffc4d135a71392e13634f144a','jpg'),(40,'tblbookings','DocNumber','BK2023110000012','FB_IMG_1701158094433','jpg'),(41,'tblbookings','DocNumber','BK2023110000013','47395209_304250620184459_5861530370670854144_n','jpg'),(42,'tblbookings','DocNumber','BK2023110000014','384568600_720628910095472_1983442778175572315_n','jpg');
/*!40000 ALTER TABLE `tblattachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblattachments_temp`
--

DROP TABLE IF EXISTS `tblattachments_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblattachments_temp` (
  `attachmentid` int(11) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(90) DEFAULT NULL,
  `primaryfield` varchar(90) DEFAULT NULL,
  `fieldvalue` varchar(60) CHARACTER SET latin7 DEFAULT NULL COMMENT 'Primary Key Value',
  `filename` varchar(90) DEFAULT NULL,
  `ext` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`attachmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblattachments_temp`
--

LOCK TABLES `tblattachments_temp` WRITE;
/*!40000 ALTER TABLE `tblattachments_temp` DISABLE KEYS */;
INSERT INTO `tblattachments_temp` VALUES (6,'tbloccupancy','DocNumber','1801','784f384e81f3b726e4f814654accb736','jpg'),(7,'tbloccupancy','DocNumber','8649','784f384e81f3b726e4f814654accb736','jpg');
/*!40000 ALTER TABLE `tblattachments_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbeds`
--

DROP TABLE IF EXISTS `tblbeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbeds` (
  `BedID` int(11) NOT NULL AUTO_INCREMENT,
  `RoomID` int(11) DEFAULT NULL,
  `BedName` varchar(100) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `Remarks` varchar(60) DEFAULT NULL,
  UNIQUE KEY `BedID` (`BedID`),
  KEY `RoomID` (`RoomID`),
  CONSTRAINT `tblbeds_fk` FOREIGN KEY (`RoomID`) REFERENCES `tblrooms` (`RoomID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbeds`
--

LOCK TABLES `tblbeds` WRITE;
/*!40000 ALTER TABLE `tblbeds` DISABLE KEYS */;
INSERT INTO `tblbeds` VALUES (3,29,'Bed 1','Double deck',2,NULL),(5,29,'Bed2','Single Deck',2,NULL),(6,30,'Bed 2','1 double deck\n1 single deck',3,NULL);
/*!40000 ALTER TABLE `tblbeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbhs`
--

DROP TABLE IF EXISTS `tblbhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbhs` (
  `BHID` int(11) NOT NULL AUTO_INCREMENT,
  `OwnerID` int(11) DEFAULT NULL,
  `BHName` varchar(20) DEFAULT NULL,
  `Address` varchar(20) DEFAULT NULL,
  `Description` varchar(20) DEFAULT NULL,
  `Lat` decimal(10,0) DEFAULT NULL,
  `Long` decimal(10,0) DEFAULT NULL,
  `LandMark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`BHID`),
  KEY `OwnerID` (`OwnerID`),
  CONSTRAINT `tblbhs_fk` FOREIGN KEY (`OwnerID`) REFERENCES `tblusers` (`UserID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbhs`
--

LOCK TABLES `tblbhs` WRITE;
/*!40000 ALTER TABLE `tblbhs` DISABLE KEYS */;
INSERT INTO `tblbhs` VALUES (43,5,'Angkol','Zarraga','Curfew Hours 10:00\nE',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tblbhs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbookings`
--

DROP TABLE IF EXISTS `tblbookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbookings` (
  `BookingID` int(11) NOT NULL AUTO_INCREMENT,
  `DocNumber` varchar(40) NOT NULL,
  `TenantID` int(11) DEFAULT NULL,
  `Message` varchar(150) DEFAULT NULL,
  `xTimeStamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `ApprovalStatus` varchar(50) DEFAULT 'Draft',
  `ApproveOrder` int(11) DEFAULT 0,
  `BHID` int(11) DEFAULT NULL,
  `RoomID` int(11) DEFAULT NULL,
  `BedID` int(11) DEFAULT NULL,
  `MonthlyRent` double(15,3) DEFAULT 0.000,
  `Remarks` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`DocNumber`),
  UNIQUE KEY `OccupancyID` (`BookingID`),
  KEY `TenantID` (`TenantID`),
  KEY `BHID` (`BHID`),
  KEY `RoomID` (`RoomID`),
  KEY `BedID` (`BedID`),
  CONSTRAINT `tbloccupancy_fk` FOREIGN KEY (`TenantID`) REFERENCES `tblusers` (`UserID`) ON UPDATE CASCADE,
  CONSTRAINT `tbloccupancy_fk1` FOREIGN KEY (`BHID`) REFERENCES `tblbhs` (`BHID`) ON UPDATE CASCADE,
  CONSTRAINT `tbloccupancy_fk2` FOREIGN KEY (`RoomID`) REFERENCES `tblrooms` (`RoomID`) ON UPDATE CASCADE,
  CONSTRAINT `tbloccupancy_fk3` FOREIGN KEY (`BedID`) REFERENCES `tblbeds` (`BedID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbookings`
--

LOCK TABLES `tblbookings` WRITE;
/*!40000 ALTER TABLE `tblbookings` DISABLE KEYS */;
INSERT INTO `tblbookings` VALUES (10,'BK2023110000011',6,'I want to apply','2023-11-30 02:25:27.531762','For Approval',1,43,29,3,1000.000,NULL),(11,'BK2023110000012',6,'I want to apply','2023-11-30 02:29:49.794748','Rejected',555,43,29,5,1000.000,'Invalid ID'),(12,'BK2023110000013',6,'want t apply','2023-11-30 02:31:07.366043','Approved',777,43,29,3,1000.000,NULL),(13,'BK2023110000014',7,'I want to reserve this bed 2','2023-11-30 02:41:11.929556','Rejected',555,43,30,6,1000.000,'Sorry your ID is not valid'),(14,'BK2023110000015',7,'I want to reserve this bed 2','2023-11-30 02:42:13.083349','Rejected',555,43,30,6,1000.000,''),(15,'BK2023110000016',7,'I want to reserve this bed 2','2023-11-30 02:42:28.163283','Approved',777,43,30,6,1000.000,NULL);
/*!40000 ALTER TABLE `tblbookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcode_generator`
--

DROP TABLE IF EXISTS `tblcode_generator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcode_generator` (
  `RecordID` int(11) NOT NULL AUTO_INCREMENT,
  `Code` varchar(30) NOT NULL,
  `Prefix` varchar(30) NOT NULL,
  `Length` int(11) NOT NULL DEFAULT 0,
  `Remarks` varchar(50) DEFAULT NULL,
  `CurrentValue` int(11) DEFAULT 0,
  PRIMARY KEY (`RecordID`),
  UNIQUE KEY `tblcode_generator_index01` (`RecordID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcode_generator`
--

LOCK TABLES `tblcode_generator` WRITE;
/*!40000 ALTER TABLE `tblcode_generator` DISABLE KEYS */;
INSERT INTO `tblcode_generator` VALUES (1,'BookingDocNumber','BK',7,NULL,17),(3,'SignUpDocNumber','SU',7,NULL,14);
/*!40000 ALTER TABLE `tblcode_generator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldocuments`
--

DROP TABLE IF EXISTS `tbldocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldocuments` (
  `DocumentID` int(11) NOT NULL AUTO_INCREMENT,
  `DocumentName` varchar(50) NOT NULL,
  `Description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DocumentName`),
  UNIQUE KEY `DocumentID` (`DocumentID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldocuments`
--

LOCK TABLES `tbldocuments` WRITE;
/*!40000 ALTER TABLE `tbldocuments` DISABLE KEYS */;
INSERT INTO `tbldocuments` VALUES (1,'Booking',NULL),(2,'SignUp',NULL);
/*!40000 ALTER TABLE `tbldocuments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnotifications`
--

DROP TABLE IF EXISTS `tblnotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblnotifications` (
  `NotificationID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `Title` varchar(150) NOT NULL,
  `Content` varchar(500) NOT NULL,
  `Seen` int(11) NOT NULL,
  `xTimeStamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`NotificationID`),
  UNIQUE KEY `NotificationID` (`NotificationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnotifications`
--

LOCK TABLES `tblnotifications` WRITE;
/*!40000 ALTER TABLE `tblnotifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpayments`
--

DROP TABLE IF EXISTS `tblpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpayments` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `OwnerID` int(11) DEFAULT NULL,
  `TenantID` int(11) DEFAULT NULL,
  `BHID` int(11) DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `DocNumber` varchar(50) DEFAULT NULL,
  `ApproveOrder` int(11) DEFAULT 0,
  `ApprovalStatus` varchar(20) DEFAULT 'Draft',
  PRIMARY KEY (`PaymentID`),
  UNIQUE KEY `PaymentID` (`PaymentID`),
  KEY `OwnerID` (`OwnerID`),
  KEY `TenantID` (`TenantID`),
  KEY `BHID` (`BHID`),
  CONSTRAINT `tblpayments_fk` FOREIGN KEY (`OwnerID`) REFERENCES `tblusers` (`UserID`) ON UPDATE CASCADE,
  CONSTRAINT `tblpayments_fk1` FOREIGN KEY (`TenantID`) REFERENCES `tblusers` (`UserID`) ON UPDATE CASCADE,
  CONSTRAINT `tblpayments_fk2` FOREIGN KEY (`BHID`) REFERENCES `tblbhs` (`BHID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpayments`
--

LOCK TABLES `tblpayments` WRITE;
/*!40000 ALTER TABLE `tblpayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrooms`
--

DROP TABLE IF EXISTS `tblrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrooms` (
  `RoomID` int(11) NOT NULL AUTO_INCREMENT,
  `BHID` int(11) DEFAULT NULL,
  `RoomName` varchar(20) DEFAULT NULL,
  `Description` varchar(20) DEFAULT NULL,
  `MonthlyRent` varchar(20) DEFAULT NULL,
  `TotalCapacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`RoomID`),
  KEY `tblrooms_ibfk_1` (`BHID`),
  CONSTRAINT `tblrooms_fk` FOREIGN KEY (`BHID`) REFERENCES `tblbhs` (`BHID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrooms`
--

LOCK TABLES `tblrooms` WRITE;
/*!40000 ALTER TABLE `tblrooms` DISABLE KEYS */;
INSERT INTO `tblrooms` VALUES (29,43,'Room 1','Airconditioned','1000',NULL),(30,43,'Room2','Curfew Hours 10:00 P','1000',NULL);
/*!40000 ALTER TABLE `tblrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsignup`
--

DROP TABLE IF EXISTS `tblsignup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsignup` (
  `SignUpID` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(40) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `MiddleName` varchar(30) NOT NULL,
  `MiddleInitial` varchar(10) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `ExtName` varchar(30) NOT NULL,
  `ContactNumber` varchar(30) NOT NULL,
  `EmailAddress` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Address` varchar(40) DEFAULT NULL,
  `VerificationCode` varchar(20) DEFAULT NULL,
  `xTimeStamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `UserType` varchar(50) DEFAULT NULL,
  `ApproveOrder` int(11) DEFAULT 0,
  `ApprovalStatus` varchar(40) DEFAULT 'Draft',
  `Remarks` varchar(250) DEFAULT NULL,
  `DocNumber` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`SignUpID`),
  KEY `SignUpID` (`SignUpID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsignup`
--

LOCK TABLES `tblsignup` WRITE;
/*!40000 ALTER TABLE `tblsignup` DISABLE KEYS */;
INSERT INTO `tblsignup` VALUES (17,'X X. Xx','x','x','x','xx','','9999999999','reilpadilla084@gmail.com','a',NULL,'cde277','2023-11-30 01:56:01.692242','Owner',555,'Rejected','Not real name.','SU2023110000007'),(19,'Reil P. Padilla','reil','pajo','p','padilla','','9999999999','reilpadilla084@gmail.com','x',NULL,'4c96cd','2023-11-30 02:06:26.236840','Owner',777,'Approved',NULL,'SU2023110000009'),(20,'John . Bocal','John','','','Bocal','','9077888705','bjohnlenard@gmail.co','x',NULL,'63a489','2023-11-30 02:19:52.270068','Tenant',777,'Approved',NULL,'SU2023110000010'),(21,'John . Bocal','John','','','Bocal','','9077888705','bjohnlenard@gmail.com','x',NULL,'9076ca','2023-11-30 02:20:23.629785','Tenant',777,'Approved',NULL,'SU2023110000011'),(22,'X X. X','x','x','x','x','','9999999999','reilpadilla084@gmail.com','x',NULL,'9eae66','2023-11-30 02:34:21.265908','Tenant',777,'Approved',NULL,'SU2023110000012'),(23,'X X. X','x','x','x','x','','9999999999','reilpadilla084@gmail.com','x',NULL,'936d74','2023-11-30 02:34:22.677283','Tenant',777,'Approved',NULL,'SU2023110000013');
/*!40000 ALTER TABLE `tblsignup` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tblsignup_after_upd_tr` AFTER UPDATE ON `tblsignup`
  FOR EACH ROW
BEGIN

     IF(new.ApproveOrder = 777 AND new.ApproveOrder <> old.ApproveOrder) THEN
                INSERT INTO tblusers
				(
					UserType,
					SignUpID,
					FullName,
					FirstName,
					MiddleName,
					MiddleInitial,
					LastName,
					ContactNumber,
					EmailAddress,
					UserName,
					Password
				) SELECT
					UserType,
					SignUpID,
					FullName,
					FirstName,
					MiddleName,
					MiddleInitial,
					LastName,
					ContactNumber,
					EmailAddress,
					EmailAddress,
					Password
				FROM tblsignup
				WHERE SignUpID = old.SignUpID;
     END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tblusers`
--

DROP TABLE IF EXISTS `tblusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblusers` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserType` varchar(30) DEFAULT NULL,
  `FullName` varchar(30) DEFAULT NULL,
  `FirstName` varchar(30) DEFAULT NULL,
  `MiddleName` varchar(30) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `ExtName` varchar(30) DEFAULT NULL,
  `MiddleInitial` varchar(20) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `ContactNumber` varchar(30) DEFAULT NULL,
  `EmailAddress` varchar(50) DEFAULT NULL,
  `Username` varchar(30) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Avatar` varchar(40) DEFAULT 'no-img.png',
  `SignUpID` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `SignUpID` (`SignUpID`),
  CONSTRAINT `tblusers_fk` FOREIGN KEY (`SignUpID`) REFERENCES `tblsignup` (`SignUpID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblusers`
--

LOCK TABLES `tblusers` WRITE;
/*!40000 ALTER TABLE `tblusers` DISABLE KEYS */;
INSERT INTO `tblusers` VALUES (1,'Administrator','Administrator','Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin','admin','no-img.png',NULL),(5,'Owner','Reil P. Padilla','reil','pajo','padilla',NULL,'p',NULL,NULL,'2147483647','reilpadilla084@gmail.com','reilpadilla084@gmail.com','x','no-img.png',19),(6,'Tenant','John . Bocal','John','','Bocal',NULL,'',NULL,NULL,'2147483647','bjohnlenard@gmail.com','bjohnlenard@gmail.com','x','no-img.png',21),(7,'Tenant','X X. X','x','x','x',NULL,'x',NULL,NULL,'2147483647','reilpadilla084@gmail.com','reilpadilla084@gmail.com','x','no-img.png',23);
/*!40000 ALTER TABLE `tblusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dbbhms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-30 10:48:56

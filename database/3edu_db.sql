-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for 3edu_db
DROP DATABASE IF EXISTS `3edu_db`;
CREATE DATABASE IF NOT EXISTS `3edu_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `3edu_db`;

-- Dumping structure for table 3edu_db.address
DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `AddressID` int(11) NOT NULL,
  `PrimaryAddress` varchar(50) NOT NULL,
  `SecondaryAddress` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(50) NOT NULL DEFAULT '10010',
  `DistrictID` int(11) NOT NULL,
  `IdentificationID` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.address: ~17 rows (approximately)
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT IGNORE INTO `address` (`AddressID`, `PrimaryAddress`, `SecondaryAddress`, `ZipCode`, `DistrictID`, `IdentificationID`, `UpdatedOn`) VALUES
	(5, 'test', NULL, '10010', 3, 'TECH0000000003', '2020-11-20 11:52:45'),
	(12, '204 B provident road Fairview', 'Lusaka, Chelenge', '10010', 44, 'TECH00000000080', '2021-08-21 18:05:08'),
	(22, 'Lusaka, Chelenge', 'Lusaka, Chelenge', '10010', 49, 'TECH00000000090', '2021-08-23 09:28:56'),
	(23, 'Lusaka, Chelenge', 'Lusaka, Chelenge', '10010', 49, 'TECH00000000091', '2021-08-23 09:31:52'),
	(27, 'Lusaka, Chelenge', 'Lusaka, Chelenge', '10010', 49, 'ITAD00000000021', '2021-09-14 14:42:35'),
	(29, 'Lusaka, Chelenge', 'Lusaka, Chelenge', '10010', 49, 'ITAD00000000023', '2021-09-14 15:51:02'),
	(30, 'Lusaka, Chelenge', NULL, '10010', 49, 'TECH000000000101', '2021-10-10 15:12:00'),
	(31, 'Lusaka, Chelenge', NULL, '10010', 54, 'TECH000000000102', '2021-10-10 15:13:52'),
	(32, 'Lusaka Town Center', NULL, '10010', 49, 'TECH000000000103', '2021-10-12 12:27:32'),
	(33, 'Lusaka', NULL, '10010', 49, 'ITAD00000000024', '2021-10-18 10:21:53'),
	(34, 'testing', NULL, '10010', 49, 'TECH000000000104', '2021-10-18 10:42:04'),
	(35, 'Lusaka Town Center', NULL, '10010', 49, 'TECH000000000105', '2021-10-18 11:56:49'),
	(0, 'Lusaka, Chelenge', 'Lusaka, Chelenge', '10010', 49, 'ITAD00000000025', '2022-03-19 06:28:36'),
	(0, 'Lusaka Zambia', 'Lusaka Zambia', '10010', 49, 'ITAD00000000026', '2022-04-12 23:58:42'),
	(0, 'Lusaka Northmead', 'Lusaka Northmead', '10010', 49, 'TECH000000000106', '2022-04-13 00:11:11'),
	(0, 'Lusaka Zambia', 'Lusaka Zambia', '10010', 49, 'TECH000000000107', '2022-04-13 00:13:51'),
	(0, 'Lusaka Zambia', 'Lusaka Zambia', '10010', 49, 'ACCO00000000012', '2022-04-13 00:17:09');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.assementtypemaster
DROP TABLE IF EXISTS `assementtypemaster`;
CREATE TABLE IF NOT EXISTS `assementtypemaster` (
  `AssementTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `AssementTypeName` varchar(50) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedBy` varchar(50) NOT NULL,
  `TenantID` varchar(400) NOT NULL,
  PRIMARY KEY (`AssementTypeName`,`TenantID`) USING BTREE,
  UNIQUE KEY `Index 3` (`AssementTypeID`),
  KEY `FK_assementtypemaster_tenantmaster` (`TenantID`),
  CONSTRAINT `FK_assementtypemaster_tenantmaster` FOREIGN KEY (`TenantID`) REFERENCES `tenantmaster` (`TenantID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.assementtypemaster: ~12 rows (approximately)
/*!40000 ALTER TABLE `assementtypemaster` DISABLE KEYS */;
INSERT IGNORE INTO `assementtypemaster` (`AssementTypeID`, `AssementTypeName`, `IsActive`, `UpdatedOn`, `UpdatedBy`, `TenantID`) VALUES
	(17, 'Class Excises', '1', '2021-10-18 10:34:57', 'ali_admin', 'Ama616d2ea1a78213.69918222'),
	(1, 'Class Exercis', '1', '2021-06-13 07:28:11', 'sys', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(11, 'Class Exercise', '1', '2021-10-14 18:11:43', 'ta', 'rrr6140a8c632d934.43595166'),
	(2, 'End Of Term Test', '1', '2021-06-13 07:29:01', 'sys', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(15, 'End Of Term Test', '1', '2021-10-18 10:32:07', 'ali_admin', 'Ama616d2ea1a78213.69918222'),
	(9, 'End Of Term Test', '1', '2021-10-14 16:19:19', 'ta', 'rrr6140a8c632d934.43595166'),
	(18, 'End of Term Test', '1', '2022-04-13 00:06:22', 'Madmin', 'Thr6255f612d73866.53144529'),
	(10, 'ewew', '0', '2021-10-14 16:34:31', 'ta', 'rrr6140a8c632d934.43595166'),
	(3, 'Mid Tem Test', '1', '2021-06-13 07:28:30', 'sys', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(16, 'Mid Term Test', '1', '2021-10-18 10:34:41', 'ali_admin', 'Ama616d2ea1a78213.69918222'),
	(19, 'Mid Term Test', '1', '2022-04-13 00:06:27', 'Madmin', 'Thr6255f612d73866.53144529'),
	(7, 'Test', '0', '2021-10-14 15:52:52', 'ta', 'rrr6140a8c632d934.43595166');
/*!40000 ALTER TABLE `assementtypemaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.assementtypemaster_copy
DROP TABLE IF EXISTS `assementtypemaster_copy`;
CREATE TABLE IF NOT EXISTS `assementtypemaster_copy` (
  `AssementTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `GradeMasterID` int(11) NOT NULL,
  `SubjectCode` char(5) NOT NULL,
  `AssementTypeName` varchar(50) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedBy` varchar(50) NOT NULL,
  `TenantID` varchar(400) NOT NULL,
  PRIMARY KEY (`SubjectCode`,`GradeMasterID`,`AssementTypeName`,`TenantID`) USING BTREE,
  UNIQUE KEY `Index 3` (`AssementTypeID`) USING BTREE,
  KEY `FK_assementtypemaster_grademaster` (`GradeMasterID`) USING BTREE,
  KEY `FK_assementtypemaster_tenantmaster` (`TenantID`) USING BTREE,
  CONSTRAINT `assementtypemaster_copy_ibfk_1` FOREIGN KEY (`GradeMasterID`) REFERENCES `grademaster` (`GradeMasterID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `assementtypemaster_copy_ibfk_2` FOREIGN KEY (`SubjectCode`) REFERENCES `subjectmater` (`SubjectCode`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `assementtypemaster_copy_ibfk_3` FOREIGN KEY (`TenantID`) REFERENCES `tenantmaster` (`TenantID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.assementtypemaster_copy: ~6 rows (approximately)
/*!40000 ALTER TABLE `assementtypemaster_copy` DISABLE KEYS */;
INSERT IGNORE INTO `assementtypemaster_copy` (`AssementTypeID`, `GradeMasterID`, `SubjectCode`, `AssementTypeName`, `IsActive`, `UpdatedOn`, `UpdatedBy`, `TenantID`) VALUES
	(1, 8, 'MATH', 'Class Exercis 1', '1', '2021-06-13 07:28:11', 'sys', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(2, 8, 'MATH', 'End Of Tem Test', '1', '2021-06-13 07:29:01', 'sys', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(3, 8, 'MATH', 'Mid Tem Test', '1', '2021-06-13 07:28:30', 'sys', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(4, 9, 'MATH', 'Class Exercis 1', '1', '2021-07-04 11:53:53', 'sys', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(5, 9, 'MATH', 'End Of Tem Test', '1', '2021-07-04 11:54:15', 'sys', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(6, 9, 'MATH', 'Mid Tem Test', '1', '2021-07-04 11:55:02', 'sys', '5fe7597e-f7a1-11eb-a81c-1062e5c23529');
/*!40000 ALTER TABLE `assementtypemaster_copy` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.attendance
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserPublicID` varchar(50) NOT NULL,
  `TenantID` varchar(50) NOT NULL,
  `SignIn` time NOT NULL DEFAULT current_timestamp(),
  `SignOut` time DEFAULT NULL,
  `Date` date NOT NULL DEFAULT current_timestamp(),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.attendance: ~5 rows (approximately)
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT IGNORE INTO `attendance` (`ID`, `UserPublicID`, `TenantID`, `SignIn`, `SignOut`, `Date`) VALUES
	(15, 'TECH0000000003', '', '02:20:59', '02:21:06', '2022-01-06'),
	(20, 'TECH0000000003', '', '11:11:29', '11:26:02', '2022-01-07'),
	(21, 'TECH0000000003', '', '15:33:59', '15:34:09', '2022-01-15'),
	(22, 'TECH0000000003', '', '10:16:59', '10:17:10', '2022-01-26'),
	(23, 'TECH0000000003', '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '17:19:34', '17:21:03', '2022-02-03');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.classdetails
DROP TABLE IF EXISTS `classdetails`;
CREATE TABLE IF NOT EXISTS `classdetails` (
  `ClassDetailsID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassDetailsPublicID` varchar(50) NOT NULL,
  `ClassMasterPublicID` varchar(50) NOT NULL,
  `SubjectCode` char(6) NOT NULL,
  `ClassRoomPublicID` varchar(50) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '1',
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ClassDetailsID`) USING BTREE,
  UNIQUE KEY `ClassDetailsPublicID` (`ClassDetailsPublicID`) USING BTREE,
  KEY `FK_classdetails_classmaster` (`ClassMasterPublicID`) USING BTREE,
  KEY `FK_classdetails_classroom` (`ClassRoomPublicID`) USING BTREE,
  KEY `FK_classdetails_subjectmater` (`SubjectCode`) USING BTREE,
  CONSTRAINT `FK_classdetails_classmaster` FOREIGN KEY (`ClassMasterPublicID`) REFERENCES `classmaster` (`ClassMasterPublicID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_classdetails_classroom` FOREIGN KEY (`ClassRoomPublicID`) REFERENCES `classroom` (`ClassRoomPublicID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_classdetails_subjectmater` FOREIGN KEY (`SubjectCode`) REFERENCES `subjectmater` (`SubjectCode`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.classdetails: ~48 rows (approximately)
/*!40000 ALTER TABLE `classdetails` DISABLE KEYS */;
INSERT IGNORE INTO `classdetails` (`ClassDetailsID`, `ClassDetailsPublicID`, `ClassMasterPublicID`, `SubjectCode`, `ClassRoomPublicID`, `IsActive`, `UpdatedBy`, `UpdatedOn`) VALUES
	(1, 'CLASDT0000000001', 'CLAS0000000004', 'MATH', 'CLRM0000000001', '1', 'SYS', '2020-05-24 16:30:54'),
	(2, 'CLASDT0000000002', 'CLAS0000000004', 'CMST', 'CLRM0000000001', '1', 'A', '2020-05-24 16:31:19'),
	(3, 'CLASDT0000000003', 'CLAS0000000004', 'ENG', 'CLRM0000000001', '1', 'sys', '2021-05-22 10:01:07'),
	(4, 'CLASDT0000000004', 'CLAS0000000004', 'ITSC', 'CLRM0000000001', '1', 'sys', '2021-05-22 10:01:07'),
	(5, 'CLASDT0000000005', 'CLAS0000000004', 'RE110', 'CLRM0000000001', '1', 'sys', '2021-05-22 10:01:07'),
	(6, 'CLASDT0000000006', 'CLAS0000000004', 'BSST', 'CLRM0000000001', '1', 'sys', '2021-05-22 10:01:07'),
	(7, 'CLASDT0000000007', 'CLAS0000000004', 'SCST', 'CLRM0000000001', '1', 'sys', '2021-05-22 10:01:07'),
	(8, 'CLASDT0000000008', 'CLAS0000000004', 'ZMLG', 'CLRM0000000001', '1', 'sys', '2021-05-22 10:01:07'),
	(9, 'CLASDT0000000009', 'CLAS0000000004', 'PYED', 'CLRM0000000001', '1', 'sys', '2021-05-22 10:01:07'),
	(10, 'CLASDT0000000010', 'CLAS0000000005', 'ENG', 'CLRM0000000002', '1', 'sys', '2021-07-03 13:30:24'),
	(13, 'CLASDT0000000011', 'CLAS0000000005', 'MATH', 'CLRM0000000002', '1', 'sys', '2021-07-03 13:30:24'),
	(15, 'CLASDT0000000012', 'CLAS0000000005', 'CMST', 'CLRM0000000002', '1', 'sys', '2021-07-03 13:30:24'),
	(16, 'CLASDT0000000013', 'CLAS0000000005', 'ITSC', 'CLRM0000000002', '1', 'sys', '2021-07-03 13:30:24'),
	(17, 'CLASDT0000000014', 'CLAS0000000005', 'BSST', 'CLRM0000000002', '1', 'sys', '2021-07-03 13:30:24'),
	(18, 'CLASDT0000000015', 'CLAS0000000005', 'SCST', 'CLRM0000000002', '1', 'sys', '2021-07-03 13:30:24'),
	(19, 'CLASDT0000000016', 'CLAS0000000005', 'ZMLG', 'CLRM0000000002', '1', 'sys', '2021-07-03 13:30:24'),
	(23, 'CLASDT0000000017', 'CLAS0000000005', 'PYED', 'CLRM0000000002', '1', 'sys', '2021-07-03 13:30:24'),
	(24, 'CLASDT0000000018', 'CLAS0000000008', 'ZMLG', 'CLRM0000000003', '1', 'sys', '2021-07-03 13:30:24'),
	(25, 'CLASDT0000000019', 'CLAS0000000008', 'SCST', 'CLRM0000000003', '1', 'sys', '2021-07-03 13:30:24'),
	(26, 'CLASDT0000000020', 'CLAS0000000008', 'BSST', 'CLRM0000000003', '1', 'sys', '2021-07-03 13:30:24'),
	(27, 'CLASDT0000000021', 'CLAS0000000008', 'ITSC', 'CLRM0000000003', '1', 'sys', '2021-07-03 13:30:24'),
	(28, 'CLASDT0000000022', 'CLAS0000000008', 'CMST', 'CLRM0000000003', '1', 'sys', '2021-07-03 13:30:24'),
	(29, 'CLASDT0000000023', 'CLAS0000000008', 'MATH', 'CLRM0000000003', '1', 'sys', '2021-07-03 13:30:24'),
	(30, 'CLASDT0000000024', 'CLAS0000000008', 'ENG', 'CLRM0000000003', '1', 'sys', '2021-07-03 13:30:24'),
	(31, 'CLASDT0000000025', 'CLAS0000000008', 'PYED', 'CLRM0000000003', '1', 'sys', '2021-07-03 13:30:24'),
	(39, 'CLDT00000000065', 'CLAS00000000063', 'ACC', 'CLRM0000000001', '1', 'it', '2021-08-18 06:19:54'),
	(40, 'CLDT00000000066', 'CLAS00000000063', 'MATH', 'CLRM0000000001', '1', 'it', '2021-08-18 06:19:54'),
	(41, 'CLDT00000000067', 'CLAS00000000063', 'ENG', 'CLRM0000000001', '1', 'it', '2021-08-18 06:19:54'),
	(42, 'CLDT00000000071', 'CLAS00000000067', 'ART', 'CLRM00000000082', '1', 'ta', '2021-10-13 09:51:14'),
	(43, 'CLDT00000000072', 'CLAS00000000067', 'BK', 'CLRM00000000082', '1', 'ta', '2021-10-13 09:51:14'),
	(44, 'CLDT00000000073', 'CLAS00000000067', 'BEM', 'CLRM00000000082', '1', 'ta', '2021-10-13 09:51:14'),
	(45, 'CLDT00000000074', 'CLAS00000000067', 'COMC', 'CLRM00000000082', '1', 'ta', '2021-10-13 09:51:14'),
	(46, 'CLDT00000000075', 'CLAS00000000067', 'ENG', 'CLRM00000000082', '1', 'ta', '2021-10-13 09:51:14'),
	(47, 'CLDT00000000076', 'CLAS00000000067', 'MATH', 'CLRM00000000082', '1', 'ta', '2021-10-13 09:51:14'),
	(48, 'CLDT00000000077', 'CLAS00000000068', 'MATH', 'CLRM00000000084', '1', 'ali_admin', '2021-10-18 11:35:19'),
	(49, 'CLDT00000000078', 'CLAS00000000068', 'ENG', 'CLRM00000000084', '1', 'ali_admin', '2021-10-18 11:35:19'),
	(50, 'CLDT00000000079', 'CLAS00000000068', 'BIOL', 'CLRM00000000084', '1', 'ali_admin', '2021-10-18 11:35:19'),
	(51, 'CLDT00000000080', 'CLAS00000000068', 'PHY', 'CLRM00000000084', '1', 'ali_admin', '2021-10-18 11:35:19'),
	(52, 'CLDT00000000081', 'CLAS00000000068', 'CHEM', 'CLRM00000000084', '1', 'ali_admin', '2021-10-18 11:35:19'),
	(53, 'CLDT00000000082', 'CLAS00000000069', 'MATH', 'CLRM0000000001', '1', 'it', '2021-11-20 21:23:20'),
	(54, 'CLDT00000000083', 'CLAS00000000069', 'ENG', 'CLRM0000000001', '1', 'it', '2021-11-20 21:23:20'),
	(62, 'CLDT00000000099', 'CLAS00000000069', 'ACC', 'CLRM0000000001', '1', 'it', '2021-11-20 22:18:43'),
	(63, 'CLDT000000000100', 'CLAS00000000076', 'Eng', 'CLRM000000000119', '1', 'Madmin', '2022-04-13 00:20:19'),
	(64, 'CLDT000000000101', 'CLAS00000000076', 'IT', 'CLRM000000000119', '1', 'Madmin', '2022-04-13 00:20:19'),
	(65, 'CLDT000000000102', 'CLAS00000000076', 'Mth', 'CLRM000000000119', '1', 'Madmin', '2022-04-13 00:20:19'),
	(66, 'CLDT000000000103', 'CLAS00000000076', 'SCI', 'CLRM000000000119', '1', 'Madmin', '2022-04-13 00:20:19'),
	(67, 'CLDT000000000104', 'CLAS00000000077', 'Eng', 'CLRM000000000119', '1', 'Madmin', '2022-04-13 03:07:56'),
	(68, 'CLDT000000000105', 'CLAS00000000077', 'IT', 'CLRM000000000119', '1', 'Madmin', '2022-04-13 03:07:56');
/*!40000 ALTER TABLE `classdetails` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.classmaster
DROP TABLE IF EXISTS `classmaster`;
CREATE TABLE IF NOT EXISTS `classmaster` (
  `ClassMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassMasterPublicID` varchar(50) NOT NULL,
  `ClassTeacherID` varchar(50) NOT NULL,
  `GradeMasterID` int(11) NOT NULL,
  `ClassName` varchar(50) NOT NULL,
  `ClassCode` char(4) NOT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `AddedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `TenantID` varchar(400) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ClassMasterID`) USING BTREE,
  UNIQUE KEY `ClassPublicID` (`ClassMasterPublicID`) USING BTREE,
  UNIQUE KEY `ClassCode` (`ClassCode`,`TenantID`) USING BTREE,
  KEY `FK_classmaster_grademaster` (`GradeMasterID`) USING BTREE,
  KEY `FK_classmaster_teachermaster` (`ClassTeacherID`) USING BTREE,
  CONSTRAINT `FK_classmaster_grademaster` FOREIGN KEY (`GradeMasterID`) REFERENCES `grademaster` (`GradeMasterID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_classmaster_teachermaster` FOREIGN KEY (`ClassTeacherID`) REFERENCES `teachermaster` (`TeaherMasterPublicID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.classmaster: ~17 rows (approximately)
/*!40000 ALTER TABLE `classmaster` DISABLE KEYS */;
INSERT IGNORE INTO `classmaster` (`ClassMasterID`, `ClassMasterPublicID`, `ClassTeacherID`, `GradeMasterID`, `ClassName`, `ClassCode`, `Description`, `UpdatedBy`, `UpdatedOn`, `AddedOn`, `IsActive`, `TenantID`) VALUES
	(1, 'CLAS0000000004', 'TECH0000000003', 8, 'Grade 8', '8 A', NULL, 'it', '2021-08-15 14:35:39', '2021-05-16 12:04:00', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(2, 'CLAS0000000005', 'TECH0000000003', 8, 'Grade 8', '8 B', NULL, 'it', '2021-08-15 14:35:40', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(3, 'CLAS0000000006', 'TECH0000000003', 8, 'Grade 8', '8 C', NULL, 'it', '2021-08-15 14:35:41', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(4, 'CLAS0000000007', 'TECH0000000003', 8, 'Grade 8', '8 D', NULL, 'it', '2021-08-15 14:35:41', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(5, 'CLAS0000000008', 'TECH0000000003', 9, 'Grade 9', '9 A', NULL, 'it', '2021-08-15 14:35:42', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(6, 'CLAS0000000009', 'TECH0000000003', 9, 'Grade 9', '9 B', NULL, 'it', '2021-08-15 14:35:43', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(7, 'CLAS0000000010', 'TECH0000000003', 9, 'Grade 9', '9 C', NULL, 'it', '2021-08-15 14:35:44', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(8, 'CLAS0000000011', 'TECH0000000003', 10, 'Grade 10', '10 A', NULL, 'it', '2021-08-15 14:35:44', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(9, 'CLAS0000000012', 'TECH0000000003', 10, 'Grade 10', '10 B', NULL, 'it', '2021-08-15 14:35:45', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(10, 'CLAS0000000013', 'TECH0000000003', 11, 'Grade 11', '11 A', NULL, 'it', '2021-08-15 14:35:46', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(11, 'CLAS0000000014', 'TECH0000000003', 11, 'Grade 11', '11 B', NULL, 'it', '2021-08-15 14:35:46', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(21, 'CLAS00000000063', 'TECH0000000003', 7, 'Grade 7', '7 F', NULL, 'it', '2021-08-18 15:28:04', '2021-08-18 06:19:54', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(27, 'CLAS00000000067', 'TECH000000000103', 14, 'Grade 1', 'G1', 'DISCRIPTION', 'ta', '2021-10-13 09:51:14', '2021-10-13 09:51:14', '1', 'rrr6140a8c632d934.43595166'),
	(28, 'CLAS00000000068', 'TECH000000000104', 20, 'Grade 10', '10A', NULL, 'ali_admin', '2021-10-18 11:35:19', '2021-10-18 11:35:19', '1', 'Ama616d2ea1a78213.69918222'),
	(29, 'CLAS00000000069', 'TECH00000000079', 6, 'Grade 6', '6A', 'testing', 'it', '2021-11-20 22:18:43', '2021-11-20 21:23:20', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(39, 'CLAS00000000076', 'TECH000000000106', 23, 'Grade 1', 'G1', 'Grade 1 teacher', 'Madmin', '2022-04-13 00:20:18', '2022-04-13 00:20:18', '1', 'Thr6255f612d73866.53144529'),
	(40, 'CLAS00000000077', 'TECH000000000106', 24, 'Grade 2', 'G2', 'G2', 'Madmin', '2022-04-13 03:07:56', '2022-04-13 03:07:56', '1', 'Thr6255f612d73866.53144529');
/*!40000 ALTER TABLE `classmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.classroom
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE IF NOT EXISTS `classroom` (
  `ClassRoomID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassRoomPublicID` varchar(50) NOT NULL,
  `ClassRoomName` varchar(50) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `TenantID` varchar(400) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ClassRoomID`) USING BTREE,
  UNIQUE KEY `RoomPublicID` (`ClassRoomPublicID`) USING BTREE,
  KEY `FK_classroom_tenantmaster` (`TenantID`),
  CONSTRAINT `FK_classroom_tenantmaster` FOREIGN KEY (`TenantID`) REFERENCES `tenantmaster` (`TenantID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.classroom: ~15 rows (approximately)
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT IGNORE INTO `classroom` (`ClassRoomID`, `ClassRoomPublicID`, `ClassRoomName`, `UpdatedBy`, `UpdatedOn`, `IsActive`, `TenantID`) VALUES
	(1, 'CLRM0000000001', 'Room 1', 'sys', '2020-05-24 16:17:04', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(2, 'CLRM0000000002', 'Room 2', 'sys', '2020-05-24 16:17:48', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(3, 'CLRM0000000003', 'Room 3', 'sys', '2020-05-24 16:18:00', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(4, 'CLRM0000000004', 'Room 4', 'sys', '2020-05-24 16:18:16', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(169, 'CLRM00000000080', 'Room 5', 'it', '2021-08-22 14:54:10', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(255, 'CLRM00000000081', 'Room 6', 'it', '2021-08-22 15:30:30', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(370, 'CLRM00000000082', 'Room 1', 'ta', '2021-09-25 13:55:31', '1', 'rrr6140a8c632d934.43595166'),
	(371, 'CLRM00000000083', 'Room 2', 'ta', '2021-09-25 13:55:31', '1', 'rrr6140a8c632d934.43595166'),
	(372, 'CLRM00000000084', 'Room 1', 'ali_admin', '2021-10-18 10:26:42', '1', 'Ama616d2ea1a78213.69918222'),
	(373, 'CLRM00000000085', 'Room 2', 'ali_admin', '2021-10-18 10:26:42', '1', 'Ama616d2ea1a78213.69918222'),
	(374, 'CLRM00000000086', 'Room 3', 'ali_admin', '2021-10-18 10:26:42', '1', 'Ama616d2ea1a78213.69918222'),
	(375, 'CLRM00000000087', 'Room 4', 'ali_admin', '2021-10-18 10:26:42', '1', 'Ama616d2ea1a78213.69918222'),
	(376, 'CLRM00000000088', 'Room 5', 'ali_admin', '2021-10-18 10:26:42', '1', 'Ama616d2ea1a78213.69918222'),
	(377, 'CLRM000000000119', 'Room 1', 'Madmin', '2022-04-13 00:08:06', '1', 'Thr6255f612d73866.53144529'),
	(378, 'CLRM000000000120', 'Room 2', 'Madmin', '2022-04-13 00:08:06', '1', 'Thr6255f612d73866.53144529');
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.comboboxvaluemaster
DROP TABLE IF EXISTS `comboboxvaluemaster`;
CREATE TABLE IF NOT EXISTS `comboboxvaluemaster` (
  `ComboBoxValueMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Value` varchar(50) NOT NULL,
  `Active` char(1) NOT NULL DEFAULT '0',
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`,`Name`) USING BTREE,
  UNIQUE KEY `ComboBoxValueMasterID` (`ComboBoxValueMasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.comboboxvaluemaster: ~1 rows (approximately)
/*!40000 ALTER TABLE `comboboxvaluemaster` DISABLE KEYS */;
INSERT IGNORE INTO `comboboxvaluemaster` (`ComboBoxValueMasterID`, `ID`, `Name`, `Value`, `Active`, `UpdatedOn`) VALUES
	(1, '1', 'DocumentType', 'Leson Plan', '1', '2021-07-03 18:11:26');
/*!40000 ALTER TABLE `comboboxvaluemaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.country
DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `CountryID` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(50) NOT NULL,
  `ConuntryCode` char(5) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CountryID`),
  UNIQUE KEY `ConuntryCode` (`ConuntryCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.country: ~1 rows (approximately)
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT IGNORE INTO `country` (`CountryID`, `CountryName`, `ConuntryCode`, `IsActive`) VALUES
	(1, 'Zambia ', '+260', '1');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.credentials_tb
DROP TABLE IF EXISTS `credentials_tb`;
CREATE TABLE IF NOT EXISTS `credentials_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `userType` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.credentials_tb: ~0 rows (approximately)
/*!40000 ALTER TABLE `credentials_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `credentials_tb` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.department
DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `DepartmentID` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(50) NOT NULL,
  `ShortHand` char(4) NOT NULL,
  `SchoolMasterID` varchar(50) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DepartmentID`) USING BTREE,
  UNIQUE KEY `ShortHand` (`ShortHand`,`SchoolMasterID`) USING BTREE,
  KEY `FK_department_schoolmaster` (`SchoolMasterID`),
  CONSTRAINT `FK_department_schoolmaster` FOREIGN KEY (`SchoolMasterID`) REFERENCES `schoolmaster` (`PublicID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.department: ~22 rows (approximately)
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT IGNORE INTO `department` (`DepartmentID`, `DepartmentName`, `ShortHand`, `SchoolMasterID`, `UpdatedBy`, `IsActive`) VALUES
	(1, 'Social Sciences', 'SSS', 'SCHL0000000001', 'it', '1'),
	(2, 'Mathermatics ', 'Math', 'SCHL0000000001', 'it', '1'),
	(3, 'Home Ecomomics', 'HE', 'SCHL0000000001', 'it', '1'),
	(4, 'Science', 'SCEN', 'SCHL0000000001', 'it', '1'),
	(5, 'English Language', 'EGLA', 'SCHL0000000001', 'it', '1'),
	(6, 'Comercial Subject', 'CMSB', 'SCHL0000000001', 'it', '1'),
	(7, 'Expresive Arts', 'EXAT', 'SCHL0000000001', 'it', '1'),
	(21, 'Expresive Arts', 'EXAT', 'SCHL0000000009', 'ta', '1'),
	(22, 'Majuba ', 'Maju', 'SCHL0000000009', 'ta', '1'),
	(33, 'Mathematics ', 'MATH', 'SCHL0000000009', 'ta', '1'),
	(34, 'Social Science ', 'SSS', 'SCHL0000000009', 'ta', '1'),
	(37, 'Mathematics ', 'MATH', 'SCHL00000000010', 'ali_admin', '1'),
	(38, 'Social Sciences ', 'SSS', 'SCHL00000000010', 'ali_admin', '1'),
	(39, 'Expressive Arts', 'EXPA', 'SCHL00000000010', 'ali_admin', '1'),
	(40, 'Sciences', 'SCS', 'SCHL00000000010', 'ali_admin', '1'),
	(42, 'Accounts', 'ACC', 'SCHL0000000001', 'it', '1'),
	(43, 'Infromation Technology', 'ICT', 'SCHL0000000001', 'sys', '1'),
	(44, 'Mathmatics Department', 'MD', 'SCHL00000000011', 'Madmin', '1'),
	(45, 'Accounts Department', 'AD', 'SCHL00000000011', 'Madmin', '1'),
	(46, 'IT Department', 'ITD', 'SCHL00000000011', 'Madmin', '1'),
	(47, 'Science Department', 'SD', 'SCHL00000000011', 'Madmin', '1'),
	(48, 'Early Childhood Department', 'ED', 'SCHL00000000011', 'Madmin', '1');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.district
DROP TABLE IF EXISTS `district`;
CREATE TABLE IF NOT EXISTS `district` (
  `DistrictID` int(11) NOT NULL AUTO_INCREMENT,
  `DistrictName` varchar(50) NOT NULL,
  `ProvinceID` int(11) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DistrictID`),
  KEY `FK_PROVINCEID` (`ProvinceID`),
  CONSTRAINT `FK_PROVINCEID` FOREIGN KEY (`ProvinceID`) REFERENCES `province` (`ProvinceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.district: ~103 rows (approximately)
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT IGNORE INTO `district` (`DistrictID`, `DistrictName`, `ProvinceID`, `IsActive`) VALUES
	(2, 'Chibombo District', 1, '1'),
	(3, 'Kabwe District', 1, '1'),
	(4, 'Kapiri Mposhi District', 1, '1'),
	(5, 'Mkushi District', 1, '1'),
	(6, 'Mumbwa District', 1, '1'),
	(7, 'Serenje District', 1, '1'),
	(8, 'Luano District', 1, '1'),
	(9, 'Chitambo District', 1, '1'),
	(10, 'Ngabwe District', 1, '1'),
	(11, 'Chisamba District', 1, '1'),
	(12, 'Itezhi-Tezhi District', 1, '1'),
	(13, 'Shibuyunji District', 1, '1'),
	(14, 'Chililabombwe District', 2, '1'),
	(15, 'Chingola District', 2, '1'),
	(16, 'Kalulushi District', 2, '1'),
	(17, 'Kitwe District', 2, '1'),
	(18, 'Luanshya District', 2, '1'),
	(19, 'Lufwanyama District', 2, '1'),
	(20, 'Masaiti District', 2, '1'),
	(21, 'Mpongwe District', 2, '1'),
	(22, 'Mufulira District', 2, '1'),
	(23, 'Ndola District', 2, '1'),
	(24, 'Chadiza District', 3, '1'),
	(25, 'Chipata District', 3, '1'),
	(26, 'Katete District', 3, '1'),
	(27, 'Lundazi District', 3, '1'),
	(28, 'Mambwe District', 3, '1'),
	(29, 'Nyimba District', 3, '1'),
	(30, 'Petauke District', 3, '1'),
	(31, 'Sinda District', 3, '1'),
	(32, 'Vubwi District', 3, '1'),
	(33, 'Chiengi District', 4, '1'),
	(34, 'Chipili District', 4, '1'),
	(35, 'Chembe District', 4, '1'),
	(36, 'Kawambwa District', 4, '1'),
	(37, 'Lunga District', 4, '1'),
	(38, 'Mansa District', 4, '1'),
	(39, 'Milenge District', 4, '1'),
	(40, 'Mwansabombwe District', 4, '1'),
	(41, 'Mwense District', 4, '1'),
	(42, 'Nchelenge District', 4, '1'),
	(43, 'Samfya District', 4, '1'),
	(44, 'Chilanga District', 5, '1'),
	(45, 'Chirundu District', 5, '1'),
	(46, 'Chongwe District', 5, '1'),
	(47, 'Kafue District', 5, '1'),
	(48, 'Luangwa District', 5, '1'),
	(49, 'Lusaka District', 5, '1'),
	(50, 'Rufunsa District', 5, '1'),
	(51, 'Chama District', 6, '1'),
	(52, 'Chinsali District', 6, '1'),
	(53, 'Isoka District', 6, '1'),
	(54, 'Mafinga District', 6, '1'),
	(55, 'Mpika District', 6, '1'),
	(56, 'Nakonde District', 6, '1'),
	(57, 'Shiwangandu District', 6, '1'),
	(58, 'Chilubi District', 7, '1'),
	(59, 'Kaputa District', 7, '1'),
	(60, 'Kasama District', 7, '1'),
	(61, 'Luwingu District', 7, '1'),
	(62, 'Mbala District', 7, '1'),
	(63, 'Mporokoso District', 7, '1'),
	(64, 'Mpulungu District', 7, '1'),
	(65, 'Mungwi District', 7, '1'),
	(66, 'Nsama District', 7, '1'),
	(67, 'Chavuma District', 8, '1'),
	(68, 'Ikelenge District', 8, '1'),
	(69, 'Kabompo District', 8, '1'),
	(70, 'Kasempa District', 8, '1'),
	(71, 'Mufumbwe District', 8, '1'),
	(72, 'Mwinilunga District', 8, '1'),
	(73, 'Solwezi District', 8, '1'),
	(74, 'Zambezi District', 8, '1'),
	(75, 'Manyinga District', 8, '1'),
	(76, 'Chikankata District', 9, '1'),
	(77, 'Choma District', 9, '1'),
	(78, 'Gwembe District', 9, '1'),
	(79, 'Kalomo District', 9, '1'),
	(80, 'Kazungula District', 9, '1'),
	(81, 'Livingstone District', 9, '1'),
	(82, 'Mazabuka District', 9, '1'),
	(83, 'Monze District', 9, '1'),
	(84, 'Namwala District', 9, '1'),
	(85, 'Pemba District', 9, '1'),
	(86, 'Siavonga District', 9, '1'),
	(87, 'Sinazongwe District', 9, '1'),
	(88, 'Zimba District', 9, '1'),
	(89, 'Kalabo District', 10, '1'),
	(90, 'Kaoma District', 10, '1'),
	(91, 'Lukulu District', 10, '1'),
	(92, 'Mongu District', 10, '1'),
	(93, 'Mulobezi District', 10, '1'),
	(94, 'Senanga District', 10, '1'),
	(95, 'Sesheke District', 10, '1'),
	(96, 'Shangombo District', 10, '1'),
	(97, 'Nalolo District', 10, '1'),
	(98, 'Limulunga District', 10, '1'),
	(99, 'Nkeyema District', 10, '1'),
	(100, 'Sikongo District', 10, '1'),
	(101, 'Sioma District', 10, '1'),
	(102, 'Mitete District', 10, '1'),
	(103, 'Mwandi District', 10, '1'),
	(104, 'Luampa District', 10, '1');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.emailservice
DROP TABLE IF EXISTS `emailservice`;
CREATE TABLE IF NOT EXISTS `emailservice` (
  `EmailServiceID` int(11) NOT NULL AUTO_INCREMENT,
  `EmailSerial` varchar(20) NOT NULL DEFAULT '0',
  `EmailAddress` varchar(500) NOT NULL,
  `EmailSubject` varchar(100) NOT NULL,
  `SendData` varchar(15000) NOT NULL,
  `Status` char(4) NOT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`EmailServiceID`),
  UNIQUE KEY `EmailSerial` (`EmailSerial`),
  KEY `FK_emailservice_statusmaster` (`Status`),
  CONSTRAINT `FK_emailservice_statusmaster` FOREIGN KEY (`Status`) REFERENCES `statusmaster` (`StatueCode`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.emailservice: ~1 rows (approximately)
/*!40000 ALTER TABLE `emailservice` DISABLE KEYS */;
INSERT IGNORE INTO `emailservice` (`EmailServiceID`, `EmailSerial`, `EmailAddress`, `EmailSubject`, `SendData`, `Status`, `UpdatedBy`, `UpdatedOn`) VALUES
	(1, 'EMIL0000000001', 'prototype1496@gmail.com', 'Teacher Time Management System Temp Login Cridentials', 'Wellcome to T.T.M.S<br><b>Username: </b> alinuswemwandobo@gmail.com<br><b>Temp Password: </b>VIJOE<br>Please login in to system and to change your password<br><br><b>If this message dose not belong to you please ignore it and have a good day </b> ', 'COMP', 'admin', '2020-11-20 11:52:46');
/*!40000 ALTER TABLE `emailservice` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.gendermaster
DROP TABLE IF EXISTS `gendermaster`;
CREATE TABLE IF NOT EXISTS `gendermaster` (
  `GenderMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `Gender` text NOT NULL,
  `ShortName` char(1) NOT NULL DEFAULT 'M',
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`GenderMasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.gendermaster: ~2 rows (approximately)
/*!40000 ALTER TABLE `gendermaster` DISABLE KEYS */;
INSERT IGNORE INTO `gendermaster` (`GenderMasterID`, `Gender`, `ShortName`, `IsActive`) VALUES
	(1, 'Male', 'M', '1'),
	(2, 'Female', 'F', '1');
/*!40000 ALTER TABLE `gendermaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.grademaster
DROP TABLE IF EXISTS `grademaster`;
CREATE TABLE IF NOT EXISTS `grademaster` (
  `GradeMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `Grade` varchar(50) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `TenantID` varchar(50) NOT NULL DEFAULT '',
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`GradeMasterID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.grademaster: ~24 rows (approximately)
/*!40000 ALTER TABLE `grademaster` DISABLE KEYS */;
INSERT IGNORE INTO `grademaster` (`GradeMasterID`, `Grade`, `IsActive`, `TenantID`, `UpdatedBy`, `UpdatedOn`) VALUES
	(1, '1', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'it', '2021-08-22 22:42:22'),
	(2, '2', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'it', '2021-08-22 22:42:22'),
	(3, '3', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'it', '2021-08-22 22:42:22'),
	(4, '4', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'it', '2021-08-22 22:42:22'),
	(5, '5', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'it', '2021-08-22 22:42:22'),
	(6, '6', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'it', '2021-08-22 22:42:22'),
	(7, '7', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'it', '2021-08-22 22:42:22'),
	(8, '8', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'it', '2021-08-22 22:42:22'),
	(9, '9', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'it', '2021-08-22 22:42:22'),
	(10, '10', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'it', '2021-08-22 22:42:22'),
	(11, '11', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'it', '2021-08-22 22:42:22'),
	(12, '12', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'it', '2021-08-22 22:42:22'),
	(13, 'O Level', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'it', '2021-08-29 19:15:40'),
	(14, '1', '1', 'rrr6140a8c632d934.43595166', 'ta', '2021-09-25 13:56:30'),
	(15, 'O Level', '1', 'rrr6140a8c632d934.43595166', 'ta', '2021-09-25 13:56:30'),
	(16, '1', '1', 'Ama616d2ea1a78213.69918222', 'ali_admin', '2021-10-18 10:31:44'),
	(17, '2', '1', 'Ama616d2ea1a78213.69918222', 'ali_admin', '2021-10-18 10:31:44'),
	(18, '3', '1', 'Ama616d2ea1a78213.69918222', 'ali_admin', '2021-10-18 10:31:44'),
	(19, '4', '1', 'Ama616d2ea1a78213.69918222', 'ali_admin', '2021-10-18 10:31:44'),
	(20, '10', '1', 'Ama616d2ea1a78213.69918222', 'ali_admin', '2021-10-18 10:31:44'),
	(21, '11', '1', 'Ama616d2ea1a78213.69918222', 'ali_admin', '2021-10-18 10:31:44'),
	(22, '12', '1', 'Ama616d2ea1a78213.69918222', 'ali_admin', '2021-10-18 10:31:44'),
	(23, '1', '1', 'Thr6255f612d73866.53144529', 'Madmin', '2022-04-13 00:07:35'),
	(24, '2', '1', 'Thr6255f612d73866.53144529', 'Madmin', '2022-04-13 00:07:35');
/*!40000 ALTER TABLE `grademaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.gradingmaster
DROP TABLE IF EXISTS `gradingmaster`;
CREATE TABLE IF NOT EXISTS `gradingmaster` (
  `GradingMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `Grade` char(2) DEFAULT NULL,
  `Percentage` double NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`GradingMasterID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.gradingmaster: ~9 rows (approximately)
/*!40000 ALTER TABLE `gradingmaster` DISABLE KEYS */;
INSERT IGNORE INTO `gradingmaster` (`GradingMasterID`, `Grade`, `Percentage`, `IsActive`, `UpdatedBy`, `UpdatedOn`) VALUES
	(1, 'A+', 95, '1', 'Sys', '2020-04-19 06:31:05'),
	(2, 'A', 85, '1', 'Sys', '2020-04-19 06:31:26'),
	(3, 'B+', 75, '1', 'Sys', '2020-04-19 06:31:48'),
	(4, 'B', 65, '1', 'Sys', '2020-04-19 06:32:12'),
	(5, 'C+', 60, '1', 'Sys', '2020-04-19 06:32:37'),
	(6, 'C', 50, '1', 'Sys', '2020-04-19 06:32:57'),
	(7, 'D+', 45, '1', 'Sys', '2020-04-19 06:33:07'),
	(8, 'D', 40, '1', 'Sys', '2020-04-19 06:33:41'),
	(9, 'F', 39, '1', 'Sys', '2020-04-19 06:33:55');
/*!40000 ALTER TABLE `gradingmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.maritalstatusmaster
DROP TABLE IF EXISTS `maritalstatusmaster`;
CREATE TABLE IF NOT EXISTS `maritalstatusmaster` (
  `MaritalStatusMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `MaritalStatus` varchar(10) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaritalStatusMasterID`),
  UNIQUE KEY `MaritalStatus` (`MaritalStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.maritalstatusmaster: ~4 rows (approximately)
/*!40000 ALTER TABLE `maritalstatusmaster` DISABLE KEYS */;
INSERT IGNORE INTO `maritalstatusmaster` (`MaritalStatusMasterID`, `MaritalStatus`, `IsActive`) VALUES
	(1, 'Married', '1'),
	(2, 'Widow', '1'),
	(3, 'Divorced', '1'),
	(4, 'Single', '1');
/*!40000 ALTER TABLE `maritalstatusmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.periodmaster
DROP TABLE IF EXISTS `periodmaster`;
CREATE TABLE IF NOT EXISTS `periodmaster` (
  `PeriodMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `PeriodName` varchar(50) NOT NULL,
  `SchoolID` varchar(50) NOT NULL,
  `SequenceID` int(11) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `UpdatedBy` varchar(50) NOT NULL DEFAULT '',
  `UpdatedOn` varchar(50) NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PeriodMasterID`),
  UNIQUE KEY `SequenceID` (`SequenceID`,`SchoolID`) USING BTREE,
  KEY `FK_periodmaster_schoolmaster` (`SchoolID`),
  CONSTRAINT `FK_periodmaster_schoolmaster` FOREIGN KEY (`SchoolID`) REFERENCES `schoolmaster` (`PublicID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.periodmaster: ~15 rows (approximately)
/*!40000 ALTER TABLE `periodmaster` DISABLE KEYS */;
INSERT IGNORE INTO `periodmaster` (`PeriodMasterID`, `PeriodName`, `SchoolID`, `SequenceID`, `IsActive`, `UpdatedBy`, `UpdatedOn`) VALUES
	(1, 'Period 1', 'SCHL0000000009', 1, '1', 'sys', '2021-06-27 13:03:21'),
	(2, 'Period 2', 'SCHL0000000009', 2, '1', 'sys', '2021-06-27 13:03:35'),
	(3, 'Period 3', 'SCHL0000000009', 3, '1', 'sys', '2021-06-27 13:03:42'),
	(4, 'Period 4', 'SCHL0000000009', 4, '1', 'sys', '2021-06-27 13:03:47'),
	(5, 'Period 5', 'SCHL0000000009', 5, '0', 'ta', '2021-06-27 13:03:55'),
	(8, 'Period 5 ', 'SCHL0000000007', 5, '0', 'ta', '2021-10-18 07:09:33'),
	(9, 'Period 1', 'SCHL00000000010', 1, '1', 'ali_admin', '2021-10-18 10:23:15'),
	(10, 'Period 2', 'SCHL00000000010', 2, '1', 'ali_admin', '2021-10-18 10:23:21'),
	(11, 'Period 3', 'SCHL00000000010', 3, '1', 'ali_admin', '2021-10-18 10:23:30'),
	(12, 'Period 4', 'SCHL00000000010', 4, '1', 'ali_admin', '2021-10-18 10:23:44'),
	(13, 'Period 5', 'SCHL00000000010', 5, '1', '', '2022-03-27 03:24:08'),
	(14, 'Period 1', 'SCHL00000000011', 1, '1', 'Madmin', '2022-04-30 19:34:53'),
	(15, 'Period 2', 'SCHL00000000011', 2, '1', 'Madmin', '2022-04-30 19:35:00'),
	(16, 'Period 3', 'SCHL00000000011', 3, '1', 'Madmin', '2022-04-30 19:35:08'),
	(17, 'Period 4', 'SCHL00000000011', 4, '1', 'Madmin', '2022-04-30 19:35:14');
/*!40000 ALTER TABLE `periodmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.province
DROP TABLE IF EXISTS `province`;
CREATE TABLE IF NOT EXISTS `province` (
  `ProvinceID` int(11) NOT NULL AUTO_INCREMENT,
  `ProvinceName` varchar(50) NOT NULL,
  `CountryID` int(11) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProvinceID`),
  KEY `FK_province_country` (`CountryID`),
  CONSTRAINT `FK_province_country` FOREIGN KEY (`CountryID`) REFERENCES `country` (`CountryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.province: ~10 rows (approximately)
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT IGNORE INTO `province` (`ProvinceID`, `ProvinceName`, `CountryID`, `IsActive`) VALUES
	(1, 'Central', 1, '1'),
	(2, 'Copperbelt', 1, '1'),
	(3, 'Eastern', 1, '1'),
	(4, 'Luapula', 1, '1'),
	(5, 'Lusaka', 1, '1'),
	(6, 'Muchinga', 1, '1'),
	(7, 'Northern', 1, '1'),
	(8, 'Northwestern', 1, '1'),
	(9, 'Southern', 1, '1'),
	(10, 'Western', 1, '1');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.schoolmaster
DROP TABLE IF EXISTS `schoolmaster`;
CREATE TABLE IF NOT EXISTS `schoolmaster` (
  `SchoolID` int(11) NOT NULL AUTO_INCREMENT,
  `PublicID` varchar(50) CHARACTER SET latin1 NOT NULL,
  `EMISNO` varchar(50) CHARACTER SET latin1 NOT NULL,
  `PicURL` varchar(10000) CHARACTER SET latin1 DEFAULT '',
  `SchoolName` varchar(50) CHARACTER SET latin1 NOT NULL,
  `ShortName` varchar(50) NOT NULL,
  `SchoolMotto` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `SchoolURl` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `SchoolDescription` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `MaxTerms` int(11) NOT NULL DEFAULT 3,
  `Longitude` double NOT NULL DEFAULT 0,
  `Latitude` double NOT NULL DEFAULT 0,
  `Tel` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `PhoneNo` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `UpdatedBy` varchar(50) CHARACTER SET latin1 NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `TenantID` varchar(400) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`SchoolID`) USING BTREE,
  UNIQUE KEY `PublicID` (`PublicID`) USING BTREE,
  UNIQUE KEY `EMISNO` (`EMISNO`) USING BTREE,
  KEY `FK_schoolmaster_tenantmaster` (`TenantID`),
  CONSTRAINT `FK_schoolmaster_tenantmaster` FOREIGN KEY (`TenantID`) REFERENCES `tenantmaster` (`TenantID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table 3edu_db.schoolmaster: ~6 rows (approximately)
/*!40000 ALTER TABLE `schoolmaster` DISABLE KEYS */;
INSERT IGNORE INTO `schoolmaster` (`SchoolID`, `PublicID`, `EMISNO`, `PicURL`, `SchoolName`, `ShortName`, `SchoolMotto`, `SchoolURl`, `SchoolDescription`, `MaxTerms`, `Longitude`, `Latitude`, `Tel`, `PhoneNo`, `IsActive`, `UpdatedBy`, `UpdatedOn`, `TenantID`) VALUES
	(2, 'SCHL0000000001', 'E43435', '../../uploads/shcool_logos/SCHL0000000001_logo.png', 'Lusaka Secondary School', '', 'Quality And Ealencey', '', 'ThisSchool Aims at bringing out the best n your ch', 3, 3.3311, 322.2252, '+262222147', '+260998854878', '1', 'a', '2020-01-24 16:56:52', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(4, 'SCHL0000000004', 'E43434', '../../uploads/shcool_logos/defult_school.png', 'Sacred Hart Convert School', '', NULL, NULL, NULL, 3, 434.45466, 33434.34376, '+262222147', '+260998854878', '1', 'a', '2021-04-27 06:08:14', 'a29294e8-f7a1-11eb-a81c-1062e5c23529'),
	(17, 'SCHL0000000007', 'EMISn2212', '../../uploads/shcool_logos/SCHL0000000007_FVH-Logo.png', 'TESTTTEW', 'TEST', 'TEING IS TESTING', 'www.tick.some', 'SDFSDFSF', 3, 343534535, -1515, '0977512255', '+260977100587', '1', 'a', '2021-09-14 14:42:34', 'TES614098baeb6188.42391041'),
	(19, 'SCHL0000000009', 'EMISNO2123', '../../uploads/shcool_logos/SCHL0000000009_FVH-Logo.png', 'Wakanda Secondary School', 'Wakanda Secondary School', 'Wakanda Forever', 'www.tick.some', 'Try this', 3, 343534535, -151, '09775122556', '+2609771005687', '1', 'a', '2021-09-14 15:51:02', 'rrr6140a8c632d934.43595166'),
	(20, 'SCHL00000000010', 'EMISNO2120', '../../uploads/shcool_logos/defult_school.png', 'Amazing Grace', 'AMG', 'Hard Work Overcomes All', 'www.amezinggrace.com', NULL, 3, 1211221, -1144411, '+2602223552', '+260988755', '1', 'a', '2021-10-18 10:21:53', 'Ama616d2ea1a78213.69918222'),
	(21, 'SCHL00000000011', 'ESIM2021', '../../uploads/shcool_logos/SCHL00000000011_School Logo Demo.jpg', 'Three Encryptions Trust School', 'TETS', 'Promoting the smart nation', 'www.three.com', 'test Account', 3, 453, 564, '+26021145254', '+260971145345', '1', 'a', '2022-04-12 23:58:42', 'Thr6255f612d73866.53144529');
/*!40000 ALTER TABLE `schoolmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.sequencemaster
DROP TABLE IF EXISTS `sequencemaster`;
CREATE TABLE IF NOT EXISTS `sequencemaster` (
  `SequenceMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `SequnceCode` char(4) NOT NULL,
  `LastInsertedID` int(11) NOT NULL DEFAULT 0,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SequenceMasterID`),
  UNIQUE KEY `SequnceCode` (`SequnceCode`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.sequencemaster: ~18 rows (approximately)
/*!40000 ALTER TABLE `sequencemaster` DISABLE KEYS */;
INSERT IGNORE INTO `sequencemaster` (`SequenceMasterID`, `SequnceCode`, `LastInsertedID`, `UpdatedOn`) VALUES
	(1, 'TECH', 107, '2019-11-01 19:08:09'),
	(2, 'HEAD', 0, '2019-11-01 19:49:01'),
	(3, 'TOKN', 394, '2019-11-01 20:00:03'),
	(4, 'EMIL', 3, '2019-11-15 05:28:12'),
	(5, 'TRPD', 3, '2019-11-17 07:13:19'),
	(6, 'SCHL', 11, '2019-11-17 18:52:58'),
	(7, 'TRD', 2, '2019-11-18 21:59:20'),
	(8, 'STNO', 49, '2021-05-22 19:45:06'),
	(9, 'SDNT', 44, '2021-05-22 20:49:17'),
	(10, 'STDT', 44, '2021-05-22 22:25:57'),
	(18, 'CLAS', 77, '2021-08-16 12:49:49'),
	(19, 'CLDT', 105, '2021-08-16 12:50:17'),
	(20, 'TEDT', 128, '2021-08-21 11:22:16'),
	(21, 'CLRM', 120, '2021-08-22 11:42:24'),
	(22, 'ITAD', 26, '2021-09-06 04:44:36'),
	(23, 'BILL', 0, '2021-09-17 16:46:37'),
	(24, 'ACCO', 12, '2021-11-27 16:15:30'),
	(25, 'URDI', 8, '2022-01-16 04:08:45');
/*!40000 ALTER TABLE `sequencemaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.session
DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `SessionID` int(11) NOT NULL AUTO_INCREMENT,
  `UserMasterPublicID` varchar(50) NOT NULL,
  `SerialID` varchar(50) NOT NULL,
  `TokenID` varchar(100) NOT NULL,
  `TokenCreatedTime` varchar(50) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SessionID`),
  KEY `FK_session_usermaster` (`UserMasterPublicID`),
  CONSTRAINT `FK_session_usermaster` FOREIGN KEY (`UserMasterPublicID`) REFERENCES `usermaster` (`PublicID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.session: ~26 rows (approximately)
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT IGNORE INTO `session` (`SessionID`, `UserMasterPublicID`, `SerialID`, `TokenID`, `TokenCreatedTime`, `UpdatedBy`, `UpdatedOn`) VALUES
	(126, 'TECH00000000080', 'TOKN000000000126', '84e67696a545489c6e2e17b4b79d1f1c4a6591555e4e7623aa', '1629703557', 'TES', '2021-08-23 09:25:57'),
	(221, 'TECH000000000103', 'TOKN000000000221', '1da195fd8817eaa88adfc2bee0080edd575a9cefb004427225', '1634231351', 'Helen', '2021-10-14 19:09:11'),
	(223, 'TECH000000000101', 'TOKN000000000223', 'e93e840c79e47121d31bbae514b6ca5ed4752a0d0eb62db067', '1634279436', 'Mwaka', '2021-10-15 08:30:36'),
	(225, 'ITAD00000000023', 'TOKN000000000225', '08eacd72a4841c3f3d922fa575b3d78773c4824620fab1c764', '1634529757', 'ta', '2021-10-18 06:02:37'),
	(232, 'TECH000000000104', 'TOKN000000000232', '4699f78b39d549cc4211fd653d813bb11fbdff5afcf23499b6', '1634551240', 'nakamba', '2021-10-18 12:00:40'),
	(234, 'TECH000000000105', 'TOKN000000000234', 'db26e83cc80598c8682e1a8fbcac7e4f8c58ee61ba194b20f1', '1634556867', 'alinani', '2021-10-18 13:34:28'),
	(238, 'SDNT00000000000', 'TOKN000000000238', '01ede60520df9c2a7e54586c361d29d64135e5b6920a9d3c22', '1637387879', 'SN202137', '2021-11-20 07:57:59'),
	(239, 'SDNT00000000036', 'TOKN000000000239', '6ce38cc9e7e54512bae425ee55ccccd7631e709597c0adb2e4', '1637388125', 'SN2021041', '2021-11-20 08:02:05'),
	(254, 'SDNT00000000039', 'TOKN000000000254', '0e35fac89d1b300313f46213bc58c730c602a07ea19faee886', '1637423824', 'SN2021044', '2021-11-20 17:57:04'),
	(283, 'ACCO0000000004', 'TOKN000000000283', 'b87cc1ba0ff9d8c4ee4bcfbcc2929c1ff97144199e48d8d309', '1642301723', 'acc_test', '2022-01-16 04:55:23'),
	(319, 'ITAD00000000025', 'TOKN000000000319', 'b6cc0558ce4645cbbaff69b44b46892a6ce62da206a4ac72d60a96feb3376c51', '1647674887', 'thittest', '2022-03-19 09:28:07'),
	(326, 'TECH00000000079', 'TOKN000000000326', '3fe0aca03cf5f82d0e22659173218116497ec13cea2b1da20c2d2a1b75c31781', '1647676776', 'alinuswemwandobo@gmail.com', '2022-03-19 09:59:36'),
	(330, 'SDNT00000000035', 'TOKN000000000330', '9a8d30c9c90e71bf65825a8335209307ea359ac2592c1c73450713a170c2b069', '1647677151', 'SN2021040', '2022-03-19 10:05:52'),
	(332, 'SDNT00000000031', 'TOKN000000000332', 'a9511f03962f7a44d063d1cd7fe032002813cedb780f6370aac4168e8e05df86', '1647681959', 'SN2021036', '2022-03-19 11:26:00'),
	(337, 'TECH0000000001', 'TOKN000000000337', '9272bf6fb286674d59d15f6c1e4df1dcae9eb45f6518227757c9d08a168a8599', '1648315757', 'h', '2022-03-26 17:29:17'),
	(341, 'TECH0000000003', 'TOKN000000000341', 'a2ff068e070dbf98cfa1678d844beee224ef347c2931ead229c5eb6fdbaec0c9', '1648352013', 't', '2022-03-27 03:33:33'),
	(342, 'ITAD00000000024', 'TOKN000000000342', '2538db74f4d1c92011c64ab0ebbdd9b7fac260f1c5e6c4e4f4a79c2420d05b81', '1648352132', 'ali_admin', '2022-03-27 03:35:32'),
	(346, 'ADMIN00001', 'TOKN000000000346', 'd34aaefa1d24c6e87d400882ac33e1c5173acfac66447e5f3b3363c262c67f12', '1648405887', 'a', '2022-03-27 18:31:28'),
	(347, 'ACCO00001', 'TOKN000000000347', 'c31fd57384767498e90c3e50efeff6ab57b4cc8c657a12fcc1ce89896252a666', '1649672086', 'acc', '2022-04-11 10:14:47'),
	(374, 'ACCO00000000012', 'TOKN000000000374', '06c95ab3703373d98ab46baa61c165b3830e544a609a14d414e6bcdab8c3ada0', '1651335146', 'Accounts', '2022-04-30 18:12:26'),
	(378, 'ITAD00000000026', 'TOKN000000000378', '5c8020560736dca3a2ea2a5f1267e620bb2ca926f72e20e3a3bba99553d83342', '1651339286', 'Madmin', '2022-04-30 19:21:26'),
	(380, 'SDNT00000000040', 'TOKN000000000380', 'e5987ea1db66985e4743d9c1afe2b1e3ba5fa7ee3086e223eed3b69def29ecb0', '1651341857', 'SN2022045', '2022-04-30 20:04:17'),
	(381, 'SDNT00000000043', 'TOKN000000000381', '06c918f9d5b660697abf54cd6df63cbfe8d0388efdcd18562551dd9068134837', '1651342080', 'SN2022048', '2022-04-30 20:08:00'),
	(388, 'ITADM00001', 'TOKN000000000388', 'ecbb0416e2552468d942c7514cd42eca3d91c08dfa92335b72b4b967593dff67', '1651377307', 'it', '2022-05-01 05:55:07'),
	(393, 'TECH000000000106', 'TOKN000000000393', '93f650d6c10d4882c9571dc11add3c7fb02c3f4550e7da617b414a83df09179c', '1651420877', 'Nyambe', '2022-05-01 18:01:17'),
	(394, 'TECH000000000107', 'TOKN000000000394', '7b663ad5a81ddff9c403b3499af28556a530d6b1c5af612106d9809c9e470a78', '1651420969', 'Tupa', '2022-05-01 18:02:50');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.sessionhistory
DROP TABLE IF EXISTS `sessionhistory`;
CREATE TABLE IF NOT EXISTS `sessionhistory` (
  `SessionHistoryID` int(11) NOT NULL AUTO_INCREMENT,
  `SessionID` varchar(50) NOT NULL,
  `UserMasterPublicID` varchar(50) NOT NULL,
  `SerialID` varchar(50) NOT NULL,
  `TokenID` varchar(50) NOT NULL,
  `TokenCreatedTime` varchar(50) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SessionHistoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.sessionhistory: ~275 rows (approximately)
/*!40000 ALTER TABLE `sessionhistory` DISABLE KEYS */;
INSERT IGNORE INTO `sessionhistory` (`SessionHistoryID`, `SessionID`, `UserMasterPublicID`, `SerialID`, `TokenID`, `TokenCreatedTime`, `UpdatedBy`, `UpdatedOn`) VALUES
	(120, '120', '202000041', 'TOKN000000000120', 'ded346951f1db8eeaa836276b1a89f73752c350b4dd1fe9308', '1629644352', 's', '2021-08-22 16:59:13'),
	(121, '121', 'SDNT00000000035', 'TOKN000000000121', '6b2dba56e25335b7406ba187f2af10c3fafbc19b3986a8e172', '1629647125', 'SN2021040', '2021-08-22 17:45:25'),
	(122, '122', 'TECH0000000003', 'TOKN000000000122', '97651468aeb9c0b9d38214d79ea2a5155866f83f9bebf50a89', '1629655461', 't', '2021-08-22 20:04:21'),
	(123, '123', 'SDNT00000000035', 'TOKN000000000123', 'aea64054d8b4996fbe091b818b95a5a39f652ccc4d93734db7', '1629655527', 'SN2021040', '2021-08-22 20:05:27'),
	(124, '124', 'ITADM00001', 'TOKN000000000124', '9975803062fa954c49f1207780a43fafa2e78186e255a6adf0', '1629658553', 'it', '2021-08-22 20:55:53'),
	(125, '125', 'TECH00000000080', 'TOKN000000000125', '3c1ec68bc21c3a9db55f97bcd55307447b2912fdf3dfa97efb', '1629703484', 'TES', '2021-08-23 09:24:44'),
	(126, '126', 'TECH00000000080', 'TOKN000000000126', '84e67696a545489c6e2e17b4b79d1f1c4a6591555e4e7623aa', '1629703557', 'TES', '2021-08-23 09:25:57'),
	(127, '127', 'ITADM00001', 'TOKN000000000127', '246ba43245c914232afc8971b3ceecc27e279f106621ad0b25', '1629703667', 'it', '2021-08-23 09:27:47'),
	(128, '128', 'SDNT00000000035', 'TOKN000000000128', 'bdef49825d0feebfad6c6c560cf7ac32cfbf6e0b313385f3d9', '1629704017', 'SN2021040', '2021-08-23 09:33:38'),
	(129, '129', 'TECH0000000001', 'TOKN000000000129', '2814abcfe9dfd73d782ff43439fc0692f1d525d3a3f80f1b52', '1630053497', 'h', '2021-08-27 10:38:17'),
	(130, '130', 'ITADM00001', 'TOKN000000000130', '9d37e7a12509fec69a4e98db18fea40e3c361a1b3720b6dcc4', '1630053522', 'it', '2021-08-27 10:38:42'),
	(131, '131', 'ITADM00001', 'TOKN000000000131', '3dac1d03c2d10894820e077d8f4642a7c3d061643a035e7649', '1630053733', 'it', '2021-08-27 10:42:13'),
	(132, '132', 'SDNT00000000035', 'TOKN000000000132', '01836916a62c26d93d2b29592bd49835ededf5a0bf82098064', '1630053840', 'SN2021040', '2021-08-27 10:44:00'),
	(133, '133', 'TECH0000000003', 'TOKN000000000133', 'e9f8aa0192f7612884701fbba15dc08f108d5ce7d851c8dab3', '1630053870', 't', '2021-08-27 10:44:30'),
	(134, '134', 'SDNT00000000035', 'TOKN000000000134', 'bbbe4ce8c35041d01deb23c2197ba172aa00638d896a791128', '1630073320', 'SN2021040', '2021-08-27 16:08:41'),
	(135, '135', 'ITADM00001', 'TOKN000000000135', '2dcaa04365cd0d2e45328afcecd6b3af0482c55008874692fc', '1630257236', 'it', '2021-08-29 19:13:56'),
	(136, '136', 'TECH0000000001', 'TOKN000000000136', 'be3af33be0e5d5287aa3b2b17909689ec92a5774b6e7550ce2', '1630257737', 'h', '2021-08-29 19:22:17'),
	(137, '137', 'ITADM00001', 'TOKN000000000137', '2928fafc1c876795ab8104f7f64fc48950fea00651e38cfc42', '1630259853', 'it', '2021-08-29 19:57:33'),
	(138, '138', 'TECH0000000001', 'TOKN000000000138', '4a4d7a1a22c0591cd4c8f5c26e75eb5b82c67bb023cb23dfb0', '1630259869', 'h', '2021-08-29 19:57:49'),
	(139, '139', 'ITADM00001', 'TOKN000000000139', '4d52be5c7da01f4cbd6bf546daa26bd76c855dc3fbc32a9fe6', '1630260653', 'it', '2021-08-29 20:10:53'),
	(140, '140', 'TECH0000000001', 'TOKN000000000140', 'b1e38a75897e1de37a2c427da79cb50dbdac8f307558681ab8', '1630260668', 'h', '2021-08-29 20:11:08'),
	(141, '141', 'TECH0000000003', 'TOKN000000000141', '043e684892791ae92f40ccc125cabb41510345fc2c61f6635d', '1630304174', 't', '2021-08-30 08:16:16'),
	(142, '142', 'TECH0000000001', 'TOKN000000000142', 'a1b7e33bd42610aadcc4bf2e34e94ffab8c80f42db21f1ed28', '1630827806', 'h', '2021-09-05 09:43:27'),
	(143, '143', 'ITADM00001', 'TOKN000000000143', '9216dead31fb3f510cb0d8d392791c40fd346dd96f3bbf8ee6', '1630833802', 'it', '2021-09-05 11:23:22'),
	(144, '144', 'TECH0000000001', 'TOKN000000000144', '04331bce7356641a3dd7b25cdaf52d009e3b71faf2390aea85', '1630833842', 'h', '2021-09-05 11:24:03'),
	(145, '145', 'ADMIN00001', 'TOKN000000000145', '3e4f6bb0b780492aa10d469c2bf48d314ef35094176977626d', '1630861240', 'a', '2021-09-05 19:00:41'),
	(146, '146', 'ITADM00001', 'TOKN000000000146', '9e901f62dfa247be380afe1710186ba48bd718956cd5d8737a', '1630865767', 'it', '2021-09-05 20:16:07'),
	(147, '147', 'ADMIN00001', 'TOKN000000000147', '8c06abeb9db52ce5e3f0866a39370e0896a10fe39e5453cce0', '1630865792', 'a', '2021-09-05 20:16:32'),
	(148, '148', 'SDNT00000000035', 'TOKN000000000148', '15ffb9521f2400ec76f70607d81303b9b3473785f541507eaa', '1630898177', 'SN2021040', '2021-09-06 05:16:17'),
	(149, '149', 'ADMIN00001', 'TOKN000000000149', '89e75a56888ae5c40e6e40d2b3fe1bc5be1d23855cfb7351b3', '1631194686', 'a', '2021-09-09 15:38:06'),
	(150, '150', 'ADMIN00001', 'TOKN000000000150', '8b705dd26029c516a2b050f83d8c59d3804d382579ee981431', '1631281389', 'a', '2021-09-10 15:43:09'),
	(151, '151', 'ADMIN00001', 'TOKN000000000151', '4ed9a57d8a16f51ce84341faf94dd0d21a95f8f34285ce339c', '1631500563', 'a', '2021-09-13 04:36:03'),
	(152, '152', 'ADMIN00001', 'TOKN000000000152', '73f5a026ff35f26255eda378ef1346b84bd9483a2189d7b668', '1631604404', 'a', '2021-09-14 09:26:44'),
	(153, '153', 'ITAD00000000023', 'TOKN000000000153', '0590462c2fe37c5e82bd44f99c95d014fe76fb296c9edb8840', '1631627686', 'TEST2admin', '2021-09-14 15:54:47'),
	(154, '154', 'ITAD00000000023', 'TOKN000000000154', 'a25d84648ba1696fa9589bc4c80cda3a80aaa6c4aa20253aa9', '1631629843', 'TEST2admin', '2021-09-14 16:30:43'),
	(155, '155', 'ITAD00000000023', 'TOKN000000000155', 'c032d812b9f7fd76ddde0b9b3abab012679068991822d9e9aa', '1631630232', 'TEST2admin', '2021-09-14 16:37:12'),
	(156, '156', 'TECH0000000001', 'TOKN000000000156', '68ec4e9f77353b9fa7cae0561b71a6ea5a63296c17e1db5322', '1631630515', 'h', '2021-09-14 16:41:56'),
	(157, '157', 'TECH0000000003', 'TOKN000000000157', '277ed1b4b2d88cfb7302ca6d5f68892feb6b44ba298c078f1e', '1631630557', 't', '2021-09-14 16:42:37'),
	(158, '158', 'ITAD00000000023', 'TOKN000000000158', '339d2b0da1e7eb1f128772591edf32d04e7a301dc384b1ed26', '1631630586', 'TEST2admin', '2021-09-14 16:43:06'),
	(159, '159', 'ITAD00000000023', 'TOKN000000000159', 'af87370b71982707b511dcf1b293dc6a4b651fbeb3ad2acf74', '1631631677', 'ta', '2021-09-14 17:01:17'),
	(160, '160', 'ADMIN00001', 'TOKN000000000160', 'fdd7fb2164bbdb5f66900e6fb79caeaf8cca1e4994c022a534', '1631888658', 'a', '2021-09-17 16:24:19'),
	(161, '161', 'ITAD00000000023', 'TOKN000000000161', '53db1d0f76b3de845516f8960b91f2d40fd70edc765b13b8ee', '1631888729', 'ta', '2021-09-17 16:25:29'),
	(162, '162', 'ADMIN00001', 'TOKN000000000162', 'abc4f8e6d99766a3cae6bd8eae242a63930a9b0bf9aef232bb', '1631888806', 'a', '2021-09-17 16:26:47'),
	(163, '163', 'ITADM00001', 'TOKN000000000163', 'a830de25563ef6eddba630d002608e5c1c8bcf0c9373500c5e', '1631890090', 'it', '2021-09-17 16:48:10'),
	(164, '164', 'ADMIN00001', 'TOKN000000000164', '4303c5261c54a7228c152e7eabffc46809fcc7137a4d659f60', '1631890198', 'a', '2021-09-17 16:49:58'),
	(165, '165', 'ITADM00001', 'TOKN000000000165', '20a8187a2573ea3d19f23decce1481e0d14f7b593eaec495d5', '1631976441', 'it', '2021-09-18 16:47:22'),
	(166, '166', 'ADMIN00001', 'TOKN000000000166', 'cfd28266265b49ca2b048a9fedaba1814d40e9d502b339ceaf', '1631976472', 'a', '2021-09-18 16:47:52'),
	(167, '167', 'ITADM00001', 'TOKN000000000167', '7e5f1c74d49a168f020d3cd7e27672435a6720a94fc0c85934', '1631976885', 'it', '2021-09-18 16:54:45'),
	(168, '168', 'ADMIN00001', 'TOKN000000000168', '7aebd06b6f839fcf61d1d9cdcf31864183dacd25df39fc91d9', '1631977021', 'a', '2021-09-18 16:57:01'),
	(169, '169', 'ITADM00001', 'TOKN000000000169', '6badb9c2396acbf1c63602773f32112f8fcc278646b7f5a62e', '1632026974', 'it', '2021-09-19 06:49:34'),
	(170, '170', 'ADMIN00001', 'TOKN000000000170', '61bcf44928a8632ed6c1abaaccfb6768b00b401d2c126e86d3', '1632032138', 'a', '2021-09-19 08:15:38'),
	(171, '171', 'ADMIN00001', 'TOKN000000000171', 'ac88a826ff6ff135ede34bd87f12bdbf28f394529ba420fd21', '1632046617', 'a', '2021-09-19 12:16:57'),
	(172, '172', 'ADMIN00001', 'TOKN000000000172', 'e6a9c53dbddbb921dec26cd739b09edbea45b7324013997046', '1632301776', 'a', '2021-09-22 11:09:36'),
	(173, '173', 'ITAD00000000023', 'TOKN000000000173', '2fb186368387fbd84c79053e9be61de264252f7a1fc9e1d8ff', '1632317998', 'ta', '2021-09-22 15:39:58'),
	(174, '174', 'TECH0000000003', 'TOKN000000000174', 'faf30212c9e0ec44032da91d6fc2c44556967dad3b2bbf878f', '1632318027', 't', '2021-09-22 15:40:27'),
	(175, '175', 'TECH0000000003', 'TOKN000000000175', '7219658df9bc7c6bc09930367450229b38f29b46fc2363fc88', '1632318078', 't', '2021-09-22 15:41:18'),
	(176, '176', 'ADMIN00001', 'TOKN000000000176', 'd04925762c6a470156230f8da2fdf8e22b718dbd313fe7cfd0', '1632318747', 'a', '2021-09-22 15:52:27'),
	(177, '177', 'ADMIN00001', 'TOKN000000000177', '5dde77156be7f296f8f3036bc3500a45a94ed9f37febafc6bc', '1632318782', 'a', '2021-09-22 15:53:02'),
	(178, '178', 'ITADM00001', 'TOKN000000000178', 'd8990339aee5a63de2c6c0a881fbc0780bf318523bde5b33ca', '1632403195', 'it', '2021-09-23 15:19:55'),
	(179, '179', 'ADMIN00001', 'TOKN000000000179', '352cc8095761a483c1f2ffe3e65e435ed43e566cd89c58454f', '1632403222', 'a', '2021-09-23 15:20:23'),
	(180, '180', 'ADMIN00001', 'TOKN000000000180', '04f99cea299e3c9d1d4603da45e12179602e8f0e77effc6e3b', '1632466407', 'a', '2021-09-24 08:53:27'),
	(181, '181', 'ADMIN00001', 'TOKN000000000181', '7e862daec9bbb00200c334e6229d2fc4facf37c6fc377f45ca', '1632544417', 'a', '2021-09-25 06:33:38'),
	(182, '182', 'ITADM00001', 'TOKN000000000182', 'ffaaa53039609a4986d734213adf0efce79f2e881d68dd5bc8', '1632546701', 'it', '2021-09-25 07:11:41'),
	(183, '183', '202000041', 'TOKN000000000183', '8689a03b02ffbd3c1ba84b25ba22ce6bdda5aa9ebf16cd95c4', '1632569562', 's', '2021-09-25 13:32:42'),
	(184, '184', 'SDNT00000000032', 'TOKN000000000184', '74fe7423c924eaec4625f1e508f4bdbab15726423620e77d17', '1632570014', 'SN202137', '2021-09-25 13:40:14'),
	(185, '185', 'ITAD00000000023', 'TOKN000000000185', '59efe92113836e5fad77c0d8599b87a52023bdf580e69336de', '1632570744', 'ta', '2021-09-25 13:52:24'),
	(186, '186', 'ADMIN00001', 'TOKN000000000186', '8543e823e1ffe39c677a2a07f9e1593f6a60ac60e828754383', '1632571072', 'a', '2021-09-25 13:57:52'),
	(187, '187', 'ITAD00000000023', 'TOKN000000000187', '5e0e0458ec81fc511b145e56c069e93318c6d53e4a96e8d978', '1632571114', 'ta', '2021-09-25 13:58:34'),
	(188, '188', 'TECH0000000001', 'TOKN000000000188', '44ab33df5155bd1bdc759ec02499f9d0c72c4998fb543dd716', '1632572237', 'h', '2021-09-25 14:17:17'),
	(189, '189', 'ITADM00001', 'TOKN000000000189', 'a44a39a70ecfb2bd10fda31175de83476f6c1ec090d378e848', '1632572302', 'it', '2021-09-25 14:18:22'),
	(190, '190', 'ITADM00001', 'TOKN000000000190', 'c54a42784c296fe7e1bf9c9567f971be19ef5c2575c15e3d14', '1632573983', 'it', '2021-09-25 14:46:23'),
	(191, '191', 'ITAD00000000023', 'TOKN000000000191', '3f9b2adf78d0e1b4bdb19e9198f48dd25ce87d016dc9d00f07', '1633843510', 'ta', '2021-10-10 07:25:11'),
	(192, '192', 'TECH000000000101', 'TOKN000000000192', '50efd06eccaad361aca01a46e30e1786189f2df189863e672c', '1633872132', 'Mwaka', '2021-10-10 15:22:13'),
	(193, '193', 'TECH000000000101', 'TOKN000000000193', '27d6a31732eb37a2056387f77f99f7ccdc629a6b25e818f142', '1633872189', 'Mwaka', '2021-10-10 15:23:09'),
	(194, '194', 'ITAD00000000023', 'TOKN000000000194', 'd81422370ea51a2c6422869a9a19d80e898ed916b1a9e2cae6', '1633877349', 'ta', '2021-10-10 16:49:09'),
	(195, '195', 'TECH0000000003', 'TOKN000000000195', '2852296189e3332047c6240478cd04ae3d25c1e4404c5dd542', '1633882396', 't', '2021-10-10 18:13:17'),
	(196, '196', 'TECH0000000003', 'TOKN000000000196', '87b7037eb5fc5e9c4738df976b1899b43fcc687f9da6be9a69', '1634024196', 't', '2021-10-12 09:36:36'),
	(197, '197', 'ITAD00000000023', 'TOKN000000000197', '4aa884de33b0217340bdf52f1131932babb6a986f87c1af931', '1634033449', 'ta', '2021-10-12 12:10:49'),
	(198, '198', 'TECH000000000103', 'TOKN000000000198', 'd21167ff9e6cd16cad372a0cd0e77d0b888da29f4b28fa973d', '1634034527', 'Helen', '2021-10-12 12:28:47'),
	(199, '199', 'ITAD00000000023', 'TOKN000000000199', '34b8f88a8d3d7bd00fe15c2356b4781c448a3f3a67a41d238a', '1634044985', 'ta', '2021-10-12 15:23:06'),
	(200, '200', 'TECH000000000103', 'TOKN000000000200', '65f588ca8bcabc7c82abae662fb5a67afee50d8dcebc40e238', '1634111941', 'Helen', '2021-10-13 09:59:01'),
	(201, '201', 'ITAD00000000023', 'TOKN000000000201', '22e34c8bac55eb61184ef5b6cda2cad7729827e53d2f3320b3', '1634112967', 'ta', '2021-10-13 10:16:07'),
	(202, '202', 'TECH000000000103', 'TOKN000000000202', '6b04f5d885f3a809f136eda613ee1532f992957acbf58bbd0e', '1634117388', 'Helen', '2021-10-13 11:29:48'),
	(203, '203', 'ITAD00000000023', 'TOKN000000000203', 'a7c1f94a6293b61c4f7ad40bd4301dfd0f5fbda82228b7a8da', '1634117479', 'ta', '2021-10-13 11:31:20'),
	(204, '204', 'ITAD00000000023', 'TOKN000000000204', 'f098abfdef4595a279bc2d61b33a880bc3a31e0abecbe9df5d', '1634195078', 'ta', '2021-10-14 09:04:38'),
	(205, '205', 'TECH000000000103', 'TOKN000000000205', '23afef3cec08b2febed458ca0f26f52e9101ba04fe99f058e3', '1634203966', 'Helen', '2021-10-14 11:32:46'),
	(206, '206', 'ITAD00000000023', 'TOKN000000000206', 'c741a1cf1f131f2baa1444c5335d0236a02c551e485a120a9a', '1634206793', 'ta', '2021-10-14 12:19:53'),
	(207, '207', 'ADMIN00001', 'TOKN000000000207', '22b0f3fe57bcad6e7e6efeed8956fb1f6d58aa451467b10d7e', '1634207002', 'a', '2021-10-14 12:23:22'),
	(208, '208', 'ITAD00000000023', 'TOKN000000000208', 'a53f974bdfde6a68c45bf85761b5671196e5affaea6269f9ba', '1634215959', 'ta', '2021-10-14 14:52:39'),
	(209, '209', 'ITAD00000000023', 'TOKN000000000209', 'e4c44d9185eb37bcd0c68cc78ef264785ecdb3dc0045f96ed6', '1634218462', 'ta', '2021-10-14 15:34:22'),
	(210, '210', 'TECH0000000003', 'TOKN000000000210', 'df256f5fa1bc711efcb3db7be7eda015d71de09855a7c93424', '1634223423', 't', '2021-10-14 16:57:03'),
	(211, '211', 'TECH000000000103', 'TOKN000000000211', '6b40dd180169af286ced66d6712ae012b4196acc55776af494', '1634223476', 'Helen', '2021-10-14 16:57:56'),
	(212, '212', 'TECH0000000001', 'TOKN000000000212', '03d8dff42809cdeccb99e1cbadcec6f58b874057b27e378c8d', '1634226000', 'h', '2021-10-14 17:40:00'),
	(213, '213', 'TECH000000000101', 'TOKN000000000213', '97b6ae26b4e7fdb7d936443d89bbde27b5cb475b807f889fbc', '1634226097', 'Mwaka', '2021-10-14 17:41:37'),
	(214, '214', 'ITAD00000000023', 'TOKN000000000214', '10fea72a4fe4e007b04374c3dbfaaadb4bffdcc327a2195709', '1634226214', 'ta', '2021-10-14 17:43:34'),
	(215, '215', 'TECH000000000101', 'TOKN000000000215', '2b65b7af1f1ecc54a9be3b7f3c200ec2978f9417c0daff146c', '1634226420', 'Mwaka', '2021-10-14 17:47:00'),
	(216, '216', 'ITAD00000000023', 'TOKN000000000216', 'bceef5d0146bbf39a76a8bd387b9ca29dcebdc3319b46947ab', '1634226996', 'ta', '2021-10-14 17:56:37'),
	(217, '217', 'TECH000000000101', 'TOKN000000000217', 'b404d06183e49fe6ec681bc5d5c0f7a5a80bc63b06bab6015f', '1634227557', 'Mwaka', '2021-10-14 18:05:57'),
	(218, '218', 'TECH000000000103', 'TOKN000000000218', '8c06b35a5bcf61bcfb898e3f84d06293e9f20e07f493e62655', '1634227748', 'Helen', '2021-10-14 18:09:09'),
	(219, '219', 'ITAD00000000023', 'TOKN000000000219', '864d223d97b93176b9ffdd2412776b988d7b876a482414cf53', '1634227885', 'ta', '2021-10-14 18:11:25'),
	(220, '220', 'ITAD00000000023', 'TOKN000000000220', 'e881eae7e8659e3be8e0656e6a76ce1cfec9c2bcff2c5f0388', '1634230173', 'ta', '2021-10-14 18:49:33'),
	(221, '221', 'TECH000000000103', 'TOKN000000000221', '1da195fd8817eaa88adfc2bee0080edd575a9cefb004427225', '1634231351', 'Helen', '2021-10-14 19:09:11'),
	(222, '222', 'ITAD00000000023', 'TOKN000000000222', '7021f19a7dff6dd956f371b7e5bc17e6468e78321a2df798f5', '1634279401', 'ta', '2021-10-15 08:30:02'),
	(223, '223', 'TECH000000000101', 'TOKN000000000223', 'e93e840c79e47121d31bbae514b6ca5ed4752a0d0eb62db067', '1634279436', 'Mwaka', '2021-10-15 08:30:36'),
	(224, '224', 'ITAD00000000023', 'TOKN000000000224', '430470c87f6e79d9caa9cc52f99f655e3535a4e3f14107d7b2', '1634279480', 'ta', '2021-10-15 08:31:20'),
	(225, '225', 'ITAD00000000023', 'TOKN000000000225', '08eacd72a4841c3f3d922fa575b3d78773c4824620fab1c764', '1634529757', 'ta', '2021-10-18 06:02:37'),
	(226, '226', 'ADMIN00001', 'TOKN000000000226', '4deb6dc9c2eae2408d9834f2e24986647862d5bb270413efc4', '1634545112', 'a', '2021-10-18 10:18:32'),
	(227, '227', 'ITAD00000000024', 'TOKN000000000227', 'c5fee077fbb2a365cdcfb1ee92db6405f09afe716578c839e4', '1634545361', 'ali_admin', '2021-10-18 10:22:41'),
	(228, '228', 'SDNT00000000039', 'TOKN000000000228', '549296c50bae9884e61b0e900d30e0b46f3347a6aaa67cb2db', '1634550161', 'SN2021044', '2021-10-18 11:42:41'),
	(229, '229', 'SDNT00000000039', 'TOKN000000000229', 'c990ff9001bf0412233e5b206c698c59a086c47351a3e7ba5a', '1634550796', 'SN2021044', '2021-10-18 11:53:16'),
	(230, '230', 'ITAD00000000024', 'TOKN000000000230', '1043bac544c669059a55c91e686279e8921356260e6b8fba8a', '1634550924', 'ali_admin', '2021-10-18 11:55:24'),
	(231, '231', 'TECH000000000105', 'TOKN000000000231', 'cde2dd0272bad8696fd42807082d400737f732083d056912a5', '1634551055', 'alinani', '2021-10-18 11:57:35'),
	(232, '232', 'TECH000000000104', 'TOKN000000000232', '4699f78b39d549cc4211fd653d813bb11fbdff5afcf23499b6', '1634551240', 'nakamba', '2021-10-18 12:00:40'),
	(233, '233', 'SDNT00000000039', 'TOKN000000000233', '8976a29feba63661a8f743e930b8b8eb9a5effd5e51f477ab6', '1634556820', 'SN2021044', '2021-10-18 13:33:40'),
	(234, '234', 'TECH000000000105', 'TOKN000000000234', 'db26e83cc80598c8682e1a8fbcac7e4f8c58ee61ba194b20f1', '1634556867', 'alinani', '2021-10-18 13:34:28'),
	(235, '235', 'ITAD00000000024', 'TOKN000000000235', '5503220a332d40c5f655fdcc0f7c573c503871323590cd861d', '1634557485', 'ali_admin', '2021-10-18 13:44:45'),
	(236, '236', 'SDNT00000000035', 'TOKN000000000236', '916c67a316863a4f0c1c13cd4901f48514952b3cc8614f5701', '1637207857', 'SN2021040', '2021-11-18 05:57:37'),
	(237, '237', 'SDNT00000000035', 'TOKN000000000237', 'd6d23641aed210b552050e342219ca22ede104c9adb48efa41', '1637387480', 'SN2021040', '2021-11-20 07:51:22'),
	(238, '238', 'SDNT00000000032', 'TOKN000000000238', '01ede60520df9c2a7e54586c361d29d64135e5b6920a9d3c22', '1637387879', 'SN202137', '2021-11-20 07:57:59'),
	(239, '239', 'SDNT00000000036', 'TOKN000000000239', '6ce38cc9e7e54512bae425ee55ccccd7631e709597c0adb2e4', '1637388125', 'SN2021041', '2021-11-20 08:02:05'),
	(240, '240', 'SDNT00000000039', 'TOKN000000000240', '5bd200f7db20188a69d5bf5935f38a710ff72dbc8bb8875a2c', '1637388217', 'SN2021044', '2021-11-20 08:03:37'),
	(241, '241', 'ADMIN00001', 'TOKN000000000241', '1f145c9d02ff9088810745131e171746f13ba878dc1fd4a14b', '1637388253', 'a', '2021-11-20 08:04:13'),
	(242, '242', 'SDNT00000000039', 'TOKN000000000242', 'eb573f39de92b16fda814031b536fb45f4e5b4be4966374e86', '1637388338', 'SN2021044', '2021-11-20 08:05:38'),
	(243, '243', 'SDNT00000000035', 'TOKN000000000243', 'cd031b4f4371c6891bb282890ca9f9bb9230fb47de0ee2e79d', '1637388377', 'SN2021040', '2021-11-20 08:06:18'),
	(244, '244', 'SDNT00000000039', 'TOKN000000000244', 'c3a5545b7ad9ffe728dd127652f7b559b62bd55d50c92ea1aa', '1637390063', 'SN2021044', '2021-11-20 08:34:23'),
	(245, '245', 'TECH0000000003', 'TOKN000000000245', 'fb9d5f56b453bf8e214821256f064c3d9b9a608162776ff705', '1637408118', 't', '2021-11-20 13:35:18'),
	(246, '246', 'TECH0000000001', 'TOKN000000000246', '08debbfb26b32acde4aefefb1b6e2d542e0e430da4b99dcc26', '1637414532', 'h', '2021-11-20 15:22:13'),
	(247, '247', 'ITADM00001', 'TOKN000000000247', 'f50d09449ba6047fd1952b48ffc10753b60df4166689929259', '1637414651', 'it', '2021-11-20 15:24:11'),
	(248, '248', 'ADMIN00001', 'TOKN000000000248', '54296104cae07d9e52140c6c3ac41e1e7bc27adda10072f4c4', '1637414837', 'a', '2021-11-20 15:27:17'),
	(249, '249', 'TECH0000000001', 'TOKN000000000249', '1163721899b83d15530d1d2af2b46488b69ca2c312dc5ccc60', '1637415056', 'h', '2021-11-20 15:30:56'),
	(250, '250', 'ITADM00001', 'TOKN000000000250', 'f7f6045c5528a54fb26894227fe75245b73c9c98a14c31de6e', '1637415123', 'it', '2021-11-20 15:32:03'),
	(251, '251', 'SDNT00000000035', 'TOKN000000000251', '8c6d63d4c134ac8963f83dbff2b3d04fbe2cd7bdf69d7e8a71', '1637423577', 'SN2021040', '2021-11-20 17:52:58'),
	(252, '252', 'ITADM00001', 'TOKN000000000252', 'a6a847ddfbd9fab402ac74b424fd7b5aad08c115401b59ac44', '1637423708', 'it', '2021-11-20 17:55:08'),
	(253, '253', 'SDNT00000000035', 'TOKN000000000253', '9d1b4c5552a88591cf1eae91e781146d59d64b3cdec62fbe71', '1637423787', 'SN2021040', '2021-11-20 17:56:27'),
	(254, '254', 'SDNT00000000039', 'TOKN000000000254', '0e35fac89d1b300313f46213bc58c730c602a07ea19faee886', '1637423824', 'SN2021044', '2021-11-20 17:57:04'),
	(255, '255', 'SDNT00000000031', 'TOKN000000000255', '5ed6a5648218de3f6538be91b6c051f7ad0a52664b32849a88', '1637423866', 'SN2021036', '2021-11-20 17:57:46'),
	(256, '256', 'ITADM00001', 'TOKN000000000256', '5b54a28ace5f9eb04edcc822b04539fc126194438cf2fe0f14', '1637423923', 'it', '2021-11-20 17:58:43'),
	(257, '257', 'SDNT00000000035', 'TOKN000000000257', 'f752ee0afa278c82fa84f4e9e14bd83d3ae044840fbecba61c', '1637423978', 'SN2021040', '2021-11-20 17:59:38'),
	(258, '258', 'ADMIN00001', 'TOKN000000000258', '7532033d930841359bd244c86b1db44ab577320ef74fbaf4b0', '1637425423', 'a', '2021-11-20 18:23:43'),
	(259, '259', 'ITADM00001', 'TOKN000000000259', '59fc0c91b91a0b623845d08852756b2e8c7e22b3468dec3ef5', '1637425441', 'it', '2021-11-20 18:24:02'),
	(260, '260', 'SDNT00000000035', 'TOKN000000000260', 'e821c51f51a28705dd574470704f90f8e86ca798b2a619f9f8', '1637425467', 'SN2021040', '2021-11-20 18:24:27'),
	(261, '261', 'ADMIN00001', 'TOKN000000000261', '80583579da9c453ae4d4abbaf9f77cedc1196a50ee85c85c7f', '1637426012', 'a', '2021-11-20 18:33:32'),
	(262, '262', 'ITADM00001', 'TOKN000000000262', '6f970f999bced3508dffb14e9e238d30faf762bec15f7f3230', '1637426100', 'it', '2021-11-20 18:35:00'),
	(263, '263', 'ITADM00001', 'TOKN000000000263', 'b7747674303b85ddd78f16016f86a7bd830b40a8c5832cf94e', '1637440649', 'it', '2021-11-20 22:37:29'),
	(264, '264', 'TECH0000000003', 'TOKN000000000264', 'f81ca94ab82ece652e637742d5c0888e255d6ce35ad0e5ea30', '1637440670', 't', '2021-11-20 22:37:51'),
	(265, '265', 'ITADM00001', 'TOKN000000000265', '930c5ed79e0bbc4bdb2328e0a54ace810def06dad3be8198e1', '1637440909', 'it', '2021-11-20 22:41:49'),
	(266, '266', 'ITADM00001', 'TOKN000000000266', '70dfbd10258d8630ebe7ca88391055890e606b6c4ea3f36a43', '1637440916', 'it', '2021-11-20 22:41:56'),
	(267, '267', 'ITADM00001', 'TOKN000000000267', 'bebd4fa175a202fc6718afcfeaf543a227cbc517611d2c5b29', '1637440947', 'it', '2021-11-20 22:42:27'),
	(268, '268', 'ITADM00001', 'TOKN000000000268', 'af4c5ed244d6a29b0bc72ff2b19f4c014995c0c5df1543c0fa', '1637441034', 'it', '2021-11-20 22:43:54'),
	(269, '269', 'ITADM00001', 'TOKN000000000269', '8d9dee18fdcac33e917742e6c054885a13e31c12abf6a69c5f', '1637441156', 'it', '2021-11-20 22:45:57'),
	(270, '270', 'TECH0000000003', 'TOKN000000000270', '16431646eb9d88d82c0d28aa6cbbb141a17e1c1f8f13fbbb99', '1637441177', 't', '2021-11-20 22:46:17'),
	(271, '271', 'ITADM00001', 'TOKN000000000271', '18c84d8fa8a305c68dc94856e72d2a10bd748eea1bdee825a6', '1638021781', 'it', '2021-11-27 16:03:01'),
	(272, '272', 'ADMIN00001', 'TOKN000000000272', 'bd4c2a04a3532641563481e14902c4eff33f7f85293158648a', '1638022394', 'a', '2021-11-27 16:13:14'),
	(273, '273', 'ACCO00001', 'TOKN000000000273', '146e1e8dd5dc1e82630a1ad74cda16eab12b388acabefd07a1', '1638022883', 'acc', '2021-11-27 16:21:24'),
	(274, '274', 'ACCO00001', 'TOKN000000000274', 'ae1435cfdc2258d80d050710e42c927fae906d67856cbba4a0', '1638022889', 'acc', '2021-11-27 16:21:29'),
	(275, '275', 'ACCO00001', 'TOKN000000000275', '663840bc25f06b6127c609e511c32d45223cab1cd6ef5306ec', '1638023069', 'acc', '2021-11-27 16:24:29'),
	(276, '276', 'TECH0000000003', 'TOKN000000000276', '0aea1133bdb4cb58d3caccb2132e2e8120a6ec2388d0a346d1', '1638067315', 't', '2021-11-28 04:41:55'),
	(277, '277', 'ACCO00001', 'TOKN000000000277', '01a745a3ef690939f79bb300e8248cd183e7377a4b99750889', '1638067537', 'acc', '2021-11-28 04:45:37'),
	(278, '278', 'ACCO00001', 'TOKN000000000278', '79b2c8015c99d5eb20f10473b37e8c22ac30c71ae2bb5623a1', '1638414804', 'acc', '2021-12-02 05:13:26'),
	(279, '279', 'ACCO00001', 'TOKN000000000279', '7a83010e9656c459cc05d938d8517d98fb21dd47fa04768bc4', '1638475987', 'acc', '2021-12-02 22:13:10'),
	(280, '280', 'ADMIN00001', 'TOKN000000000280', '7fa07bdc7c672d975cfd5986abb55e95546839951304c6b5b4', '1641124843', 'a', '2022-01-02 14:00:43'),
	(281, '281', 'TECH0000000001', 'TOKN000000000281', 'e2ee841ea29dd1282d813c2aa7c360dec04a7c296bb7e3da6d', '1641124897', 'h', '2022-01-02 14:01:37'),
	(282, '282', 'TECH0000000001', 'TOKN000000000282', '8ab59df8635db38f0b20379b8c83458434965b067dbbd7eeeb', '1642297007', 'h', '2022-01-16 03:36:47'),
	(283, '283', 'ACCO0000000004', 'TOKN000000000283', 'b87cc1ba0ff9d8c4ee4bcfbcc2929c1ff97144199e48d8d309', '1642301723', 'acc_test', '2022-01-16 04:55:23'),
	(284, '284', 'TECH0000000003', 'TOKN000000000284', 'cf2919dcd9e8fe63004b29b186248250ae9d16a7b5721e37d9', '1642302240', 't', '2022-01-16 05:04:00'),
	(285, '285', 'SDNT00000000031', 'TOKN000000000285', '6a9d46c69eb2ab0192875fd9f899e6e134b5b929a4fdf8ba25', '1642302463', 'SN2021036', '2022-01-16 05:07:44'),
	(286, '286', 'TECH0000000003', 'TOKN000000000286', '7416290938ee9c6805df161cf219c01f6f54b6e6998307fd38', '1642302503', 't', '2022-01-16 05:08:23'),
	(287, '287', 'ACCO00001', 'TOKN000000000287', '5a4c50e1cd02839bc657bc9948072576f0bf647900bdb8ea4e', '1642302638', 'acc', '2022-01-16 05:10:38'),
	(288, '288', 'ITADM00001', 'TOKN000000000288', 'cce9422eed2596dbd7cd56dce85d579db801f47489eaf4532f', '1642302798', 'it', '2022-01-16 05:13:18'),
	(289, '289', 'ITADM00001', 'TOKN000000000289', '696840b9adb06577328d1478ce76f89ded6820dbb49441b35d', '1642304213', 'it', '2022-01-16 05:36:53'),
	(290, '290', 'ITADM00001', 'TOKN000000000290', '3437a3c679f1cc593890a5d5f5e5a621085a2f602de1bbe836', '1642304493', 'it', '2022-01-16 05:41:34'),
	(291, '291', 'ITADM00001', 'TOKN000000000291', '8e267b6d782b12cf31bd8c68809939fe7732767a8c63655510', '1642304528', 'it', '2022-01-16 05:42:09'),
	(292, '292', 'ITADM00001', 'TOKN000000000292', '4149d64c77df2f5249cb71057e87fa6e3f9d65f97c7c52a7b9', '1642304584', 'it', '2022-01-16 05:43:04'),
	(293, '293', 'ITADM00001', 'TOKN000000000293', 'd18bc639c02b03998ab2310b0891d5e3dda0ce1e5b4020acbe', '1642305053', 'it', '2022-01-16 05:50:53'),
	(294, '294', 'TECH0000000001', 'TOKN000000000294', '004f4e3c523015475be9cc0e5834a80018eace0623ce1f7679', '1642305212', 'h', '2022-01-16 05:53:32'),
	(295, '295', 'ACCO00001', 'TOKN000000000295', '3655fbd545559fd7f838adaf61cb1702dc39190ef466e74ca2', '1642305451', 'acc', '2022-01-16 05:57:31'),
	(296, '296', 'TECH0000000001', 'TOKN000000000296', '1f7f142951c06607ef52599f9cefac97883e8ffafc49a3a283', '1642321021', 'h', '2022-01-16 10:17:01'),
	(297, '297', 'ITADM00001', 'TOKN000000000297', 'fba65000c55855858fdd8a027564ee05972a081c533adb11e5', '1642321034', 'it', '2022-01-16 10:17:15'),
	(298, '298', 'ACCO00001', 'TOKN000000000298', '90eb44bcf5672bed86df9e7014c4d570ab7b74c0266dc77e81', '1642326290', 'acc', '2022-01-16 11:44:50'),
	(299, '299', 'ITADM00001', 'TOKN000000000299', '2e7e8acfc8e98191fa0a988945ba63c21bb550a37d8689d059', '1642326310', 'it', '2022-01-16 11:45:10'),
	(300, '300', 'ACCO00001', 'TOKN000000000300', 'e8c223d8c80d397b0314c62a5393b3b24808a4971af1eb2bf2', '1642326327', 'acc', '2022-01-16 11:45:27'),
	(301, '301', 'TECH0000000003', 'TOKN000000000301', '60f7d99ab58789f8a054ba5d4c26300f1bf232a3a28c504897', '1643655860', 't', '2022-01-31 19:04:20'),
	(302, '302', 'TECH0000000001', 'TOKN000000000302', '837ffadf4a0a4fa96f72b964eb5fe2e46e0c8923a6422ed847', '1643655877', 'h', '2022-01-31 19:04:37'),
	(303, '303', 'TECH0000000001', 'TOKN000000000303', 'd817a969c6e96a287f159ae4bd31a4a5b5437e28c913d7ba0f', '1643655887', 'h', '2022-01-31 19:04:47'),
	(304, '304', 'TECH0000000001', 'TOKN000000000304', '69c4d8c18baa24598092df106790e408f55463833d58c7ba6c', '1643897107', 'h', '2022-02-03 16:05:09'),
	(305, '305', 'TECH0000000003', 'TOKN000000000305', 'd2dc090f954c3b4e4bca51910442e7158237ae6808e353dd11', '1643899736', 't', '2022-02-03 16:48:56'),
	(306, '306', 'TECH0000000001', 'TOKN000000000306', '8d0d4d16c57dadb7dd0780f00e0ef953e117ca2b91520fe640', '1643902116', 'h', '2022-02-03 17:28:36'),
	(307, '307', 'ITADM00001', 'TOKN000000000307', '3fd48f0130d2434440b72b774f7ae7fe11d57705d9607e308c', '1647661140', 'it', '2022-03-19 05:39:01'),
	(308, '308', 'TECH0000000001', 'TOKN000000000308', '5fdef0f646f52b707da918497bbc6850a36b63701b8fdc1628', '1647661248', 'h', '2022-03-19 05:40:48'),
	(309, '309', 'ITADM00001', 'TOKN000000000309', '2a4147057843a6d32a33faf41f43ab2ee787731ea7c87744f3', '1647661403', 'it', '2022-03-19 05:43:24'),
	(310, '310', 'ADMIN00001', 'TOKN000000000310', '97d12a5e8e632f5bf3324b142c9f1eeb1c35aaad49acc38875', '1647661429', 'a', '2022-03-19 05:43:49'),
	(311, '311', 'ITADM00001', 'TOKN000000000311', '729263caca70f0e97aebf308245c6132fc22ffa0d053ced2ee', '1647661466', 'it', '2022-03-19 05:44:27'),
	(312, '312', 'ADMIN00001', 'TOKN000000000312', '29a79b650786c1953e59bfb7d64bb7f8d3d53d499eabf85a7b', '1647661827', 'a', '2022-03-19 05:50:27'),
	(313, '313', 'ITADM00001', 'TOKN000000000313', 'd9844d2577cfbbe48f14acedd12851a6c720510442fc861883', '1647661905', 'it', '2022-03-19 05:51:45'),
	(314, '314', 'ITAD00000000025', 'TOKN000000000314', '0eb21fbe092af0da67c12785bd8ce00289859be1ab1303b9cd', '1647673904', 'thittest', '2022-03-19 09:11:44'),
	(315, '315', 'ITADM00001', 'TOKN000000000315', '4d42763e4c1b7c48b8f32d4ba87c1e3a45c6e01383c8d6d939', '1647673913', 'it', '2022-03-19 09:11:53'),
	(316, '316', 'ITAD00000000025', 'TOKN000000000316', '1c568b8c8480d2cc2f9ebaa321981c5c704841780d017523fd', '1647674459', 'thittest', '2022-03-19 09:20:59'),
	(317, '317', 'ITAD00000000025', 'TOKN000000000317', '64ef849faf34030b509785f6f7576682bfcbff277806a9b51c', '1647674559', 'thittest', '2022-03-19 09:22:39'),
	(318, '318', 'ITADM00001', 'TOKN000000000318', '6c4e5e08e36e33b0b398eaa54e11e97cea898703287f83d063', '1647674832', 'it', '2022-03-19 09:27:12'),
	(319, '319', 'ITAD00000000025', 'TOKN000000000319', 'b6cc0558ce4645cbbaff69b44b46892a6ce62da206a4ac72d6', '1647674887', 'thittest', '2022-03-19 09:28:07'),
	(320, '320', 'ITADM00001', 'TOKN000000000320', 'dc31d70c2435d988345783320100766430358e680c18ff7a27', '1647674892', 'it', '2022-03-19 09:28:12'),
	(321, '321', 'ITADM00001', 'TOKN000000000321', '2838d75d14ae173f1edddecd675067abd55c579dbe04172061', '1647675587', 'it', '2022-03-19 09:39:48'),
	(322, '322', 'ACCO00001', 'TOKN000000000322', '1cce99f6258a44bd04e73fe1266c12d3bd4697e2088abab832', '1647675612', 'acc', '2022-03-19 09:40:13'),
	(323, '323', 'ITADM00001', 'TOKN000000000323', 'aa2ac22bc19b6cbcdb942435f5fa4288120975639c440eece4', '1647675644', 'it', '2022-03-19 09:40:44'),
	(324, '324', 'TECH00000000079', 'TOKN000000000324', 'a91b62267d10b52a376ddb28d201ab02384dc21adf9b898d9a', '1647676698', 'alinuswemwandobo@gmail.com', '2022-03-19 09:58:18'),
	(325, '325', 'ITADM00001', 'TOKN000000000325', '3bc2651591cc223edfa772e7da494266db469183978491507c', '1647676706', 'it', '2022-03-19 09:58:26'),
	(326, '326', 'TECH00000000079', 'TOKN000000000326', '3fe0aca03cf5f82d0e22659173218116497ec13cea2b1da20c', '1647676776', 'alinuswemwandobo@gmail.com', '2022-03-19 09:59:36'),
	(327, '327', 'ITADM00001', 'TOKN000000000327', 'f903b2b439bd4cb0b4e24ccaf164533cc5d0cd9082d9798a06', '1647676784', 'it', '2022-03-19 09:59:44'),
	(328, '328', 'ITADM00001', 'TOKN000000000328', 'd280c9d056669f732de7d656fadd503a61b8c945005613d3cc', '1647676849', 'it', '2022-03-19 10:00:49'),
	(329, '329', 'ITADM00001', 'TOKN000000000329', '39572f4581652aa3fd39248992c305f4bbfdd519366c86eb66', '1647677002', 'it', '2022-03-19 10:03:22'),
	(330, '330', 'SDNT00000000035', 'TOKN000000000330', '9a8d30c9c90e71bf65825a8335209307ea359ac2592c1c7345', '1647677151', 'SN2021040', '2022-03-19 10:05:52'),
	(331, '331', 'ACCO00001', 'TOKN000000000331', 'f36dfc3e9d93123230d31406038eef0bc81a5e403ba07c7191', '1647677291', 'acc', '2022-03-19 10:08:11'),
	(332, '332', 'SDNT00000000031', 'TOKN000000000332', 'a9511f03962f7a44d063d1cd7fe032002813cedb780f6370aa', '1647681959', 'SN2021036', '2022-03-19 11:26:00'),
	(333, '333', 'TECH0000000001', 'TOKN000000000333', 'fbc580f74d740ec81173ce917e343b1eaed811cfbe14b78d08', '1647709251', 'h', '2022-03-19 19:00:52'),
	(334, '334', 'TECH0000000003', 'TOKN000000000334', '64a913a4fc0b9ccb3e867f24ed9cd9e379bb160a41d5298aa5', '1647713385', 't', '2022-03-19 20:09:45'),
	(335, '335', 'ACCO00001', 'TOKN000000000335', '964ed5fc74ecda098791f62e22b02d493d450775549713d139', '1647713561', 'acc', '2022-03-19 20:12:41'),
	(336, '336', 'ACCO00001', 'TOKN000000000336', 'ddea40cf40854ea71956f76475ccb143cc50e6f4b05d73fe1e', '1648315700', 'acc', '2022-03-26 17:28:23'),
	(337, '337', 'TECH0000000001', 'TOKN000000000337', '9272bf6fb286674d59d15f6c1e4df1dcae9eb45f6518227757', '1648315757', 'h', '2022-03-26 17:29:17'),
	(338, '338', 'ITADM00001', 'TOKN000000000338', '2ef6043c3e3f2962679f7c1f6b675630d73ebf637ec1f9ce5a', '1648315947', 'it', '2022-03-26 17:32:28'),
	(339, '339', 'ITADM00001', 'TOKN000000000339', 'f2291d69ba94b40d679beb663201da053cc91c3a762f4a5f76', '1648351245', 'it', '2022-03-27 03:20:46'),
	(340, '340', 'ITAD00000000024', 'TOKN000000000340', 'faba90b09585f2434fd3f22d91ec41976cff73a81c1688951a', '1648351299', 'ali_admin', '2022-03-27 03:21:39'),
	(341, '341', 'TECH0000000003', 'TOKN000000000341', 'a2ff068e070dbf98cfa1678d844beee224ef347c2931ead229', '1648352013', 't', '2022-03-27 03:33:33'),
	(342, '342', 'ITAD00000000024', 'TOKN000000000342', '2538db74f4d1c92011c64ab0ebbdd9b7fac260f1c5e6c4e4f4', '1648352132', 'ali_admin', '2022-03-27 03:35:32'),
	(343, '343', 'ADMIN00001', 'TOKN000000000343', 'c708da470aaccf7a94648aa516c9b623a4dbeb6b14a50fb18e', '1648382411', 'a', '2022-03-27 12:00:11'),
	(344, '344', 'ITADM00001', 'TOKN000000000344', 'c28f5bc50a0a0ce4ae1ccc1ef6064788f71d0992606d2b9c63', '1648382431', 'it', '2022-03-27 12:00:32'),
	(345, '345', 'ADMIN00001', 'TOKN000000000345', 'f4c5d7fc2b577f704781bc883af6c31bc33c8ae74910d4af15', '1648405870', 'a', '2022-03-27 18:31:11'),
	(346, '346', 'ADMIN00001', 'TOKN000000000346', 'd34aaefa1d24c6e87d400882ac33e1c5173acfac66447e5f3b', '1648405887', 'a', '2022-03-27 18:31:28'),
	(347, '347', 'ACCO00001', 'TOKN000000000347', 'c31fd57384767498e90c3e50efeff6ab57b4cc8c657a12fcc1', '1649672086', 'acc', '2022-04-11 10:14:47'),
	(348, '348', 'ITAD00000000026', 'TOKN000000000348', '7aa886d11a19df110d0dd9cf3afe4f4f4cb0041a5cbf060045', '1649800769', 'Madmin', '2022-04-12 23:59:29'),
	(349, '349', 'TECH000000000106', 'TOKN000000000349', 'c3b874c96e41b35dcfb81ba02161d5f869359a51e464673e6d', '1649801704', 'Nyambe', '2022-04-13 00:15:04'),
	(350, '350', 'ITAD00000000026', 'TOKN000000000350', '5f034eeb30ab5253dfb2bdb5fc44a79ec1c28a581d4b050a86', '1649801720', 'Madmin', '2022-04-13 00:15:20'),
	(351, '351', 'ITAD00000000026', 'TOKN000000000351', 'dd06fa079b03f557abbd0b2de4ec5e2c4c0c84805e7b2487a7', '1649801890', 'Madmin', '2022-04-13 00:18:10'),
	(352, '352', 'SDNT00000000040', 'TOKN000000000352', '3e5010306a6cfcf70f2b1b8e2f99028fd08392248bca512427', '1649802358', 'SN2022045', '2022-04-13 00:25:58'),
	(353, '353', 'ITAD00000000026', 'TOKN000000000353', '8e68d4e6963ab77aedb67a3b9de1ca79f1c9b1a2c4ed6bfee7', '1649802617', 'Madmin', '2022-04-13 00:30:20'),
	(354, '354', 'ACCO00000000012', 'TOKN000000000354', '5cd41ff1ccfd34b165d10407c7e682ebccf8daea2df2a6f795', '1649802694', 'Accounts', '2022-04-13 00:31:34'),
	(355, '355', 'ACCO00000000012', 'TOKN000000000355', '92d25379cd1a599a479033ca20a1a459b495a91aef832c8581', '1649802965', 'Accounts', '2022-04-13 00:36:05'),
	(356, '356', 'TECH000000000106', 'TOKN000000000356', '6eb15869ba9a3385c6c55a4f46d6f3b6209549986453fd7b86', '1649803045', 'Nyambe', '2022-04-13 00:37:25'),
	(357, '357', 'ITAD00000000026', 'TOKN000000000357', 'e86fcee84b77ee504b36083f09fc45fc7d002976645997fe28', '1649803114', 'Madmin', '2022-04-13 00:38:35'),
	(358, '358', 'ACCO00000000012', 'TOKN000000000358', '2cf2c9f021c22bf2547406e7fbb6c8c15fee1125e5084a4a74', '1649803320', 'Accounts', '2022-04-13 00:42:00'),
	(359, '359', 'ITAD00000000026', 'TOKN000000000359', '02314365edfbedb949d45c7e9e53f5e743f803597c6e0251ce', '1649803763', 'Madmin', '2022-04-13 00:49:23'),
	(360, '360', 'ACCO00000000012', 'TOKN000000000360', '4d3e6116d4ccfa0409d9bf141e8b61a133d81f671c489035bb', '1649803929', 'Accounts', '2022-04-13 00:52:10'),
	(361, '361', 'ITAD00000000026', 'TOKN000000000361', '3c1162ac95cb59b60977c61f2d9329669c2fe4f6011bfe0c6f', '1649806969', 'Madmin', '2022-04-13 01:42:49'),
	(362, '362', 'ACCO00000000012', 'TOKN000000000362', '88f4872e526a7ffdf5f6155f9b595e29a3211e4daf20cd028e', '1649807031', 'Accounts', '2022-04-13 01:43:51'),
	(363, '363', 'ITAD00000000026', 'TOKN000000000363', '6a22c31fa23db86c4c8969c58dfc47c33ccc292938eaf63cae', '1649807305', 'Madmin', '2022-04-13 01:48:25'),
	(364, '364', 'ACCO00000000012', 'TOKN000000000364', 'f1469d6f0df863c740da06a30cb8fa51197637018fccb57152', '1649807351', 'Accounts', '2022-04-13 01:49:11'),
	(365, '365', 'ITAD00000000026', 'TOKN000000000365', 'd2e79f83e86399f7bb65fdda7ead2cc9f82ff7b1ba70afdbc0', '1649811126', 'Madmin', '2022-04-13 02:52:06'),
	(366, '366', 'ACCO00000000012', 'TOKN000000000366', 'fc5609f9bb60694ff54f345616dbc8f291c8863bab26d9c01b', '1649811193', 'Accounts', '2022-04-13 02:53:15'),
	(367, '367', 'ITAD00000000026', 'TOKN000000000367', 'd64d14de1b0023e9451913b5fbd55a9415522e3a22bb67edaf', '1649811984', 'Madmin', '2022-04-13 03:06:25'),
	(368, '368', 'TECH000000000106', 'TOKN000000000368', '63f08282ad702d0d3d956abdf67b3b7da76307ef080d97a76a', '1649812176', 'Nyambe', '2022-04-13 03:09:36'),
	(369, '369', 'TECH000000000106', 'TOKN000000000369', 'ff1ea9d53279aecf2299e596cf8bf14d8f950a82d15803a969', '1650101584', 'Nyambe', '2022-04-16 11:33:12'),
	(370, '370', 'TECH000000000107', 'TOKN000000000370', '273d826a3c4ff9132a6980df9b0610cef6f99a85296224be8b', '1650103779', 'Tupa', '2022-04-16 12:09:40'),
	(371, '371', 'ACCO00000000012', 'TOKN000000000371', '30784465099efad62cfe5f32e227b6d47a253d0173ca325b5b', '1651330152', 'Accounts', '2022-04-30 16:49:13'),
	(372, '372', 'ACCO00000000012', 'TOKN000000000372', '281d86a6af16debca6f5c1c5c0361249b88072b531028142be', '1651330674', 'Accounts', '2022-04-30 16:57:54'),
	(373, '373', 'SDNT00000000040', 'TOKN000000000373', '21fec4f5b459f5dfc2c695901b9d1cc5b24d6a6f8f930d6f38', '1651335083', 'SN2022045', '2022-04-30 18:11:23'),
	(374, '374', 'ACCO00000000012', 'TOKN000000000374', '06c95ab3703373d98ab46baa61c165b3830e544a609a14d414', '1651335146', 'Accounts', '2022-04-30 18:12:26'),
	(375, '375', 'SDNT00000000040', 'TOKN000000000375', 'aa7ecad514398a03a4b3285dea4ea259a63cb31a4667f9e3e2', '1651335440', 'SN2022045', '2022-04-30 18:17:20'),
	(376, '376', 'SDNT00000000043', 'TOKN000000000376', '4370bacab5dfcf5261eef8f5bb120e46f17cb528dedb69ff9c', '1651337319', 'SN2022048', '2022-04-30 18:48:39'),
	(377, '377', 'SDNT00000000043', 'TOKN000000000377', 'de8555a8b2c63ab826e842807af3d086e09343c8a578be6c5b', '1651339239', 'SN2022048', '2022-04-30 19:20:40'),
	(378, '378', 'ITAD00000000026', 'TOKN000000000378', '5c8020560736dca3a2ea2a5f1267e620bb2ca926f72e20e3a3', '1651339286', 'Madmin', '2022-04-30 19:21:26'),
	(379, '379', 'SDNT00000000043', 'TOKN000000000379', 'c986f826e08119f5fe0c95e7834580522e70c3000868575486', '1651341830', 'SN2022048', '2022-04-30 20:03:50'),
	(380, '380', 'SDNT00000000040', 'TOKN000000000380', 'e5987ea1db66985e4743d9c1afe2b1e3ba5fa7ee3086e223ee', '1651341857', 'SN2022045', '2022-04-30 20:04:17'),
	(381, '381', 'SDNT00000000043', 'TOKN000000000381', '06c918f9d5b660697abf54cd6df63cbfe8d0388efdcd185625', '1651342080', 'SN2022048', '2022-04-30 20:08:00'),
	(382, '382', 'TECH000000000106', 'TOKN000000000382', '2094beb8836e62745af89db85c5de892d93046923995dbb9b4', '1651342182', 'Nyambe', '2022-04-30 20:09:42'),
	(383, '383', 'TECH000000000106', 'TOKN000000000383', 'd36822ac98ff5e577da0be8e05a3748fe05244b7ee773a83c0', '1651342714', 'Nyambe', '2022-04-30 20:18:34'),
	(384, '384', 'TECH000000000106', 'TOKN000000000384', '04752f4fd2b7986981445b8b7db197c9412b2d4670148cbbbb', '1651342743', 'Nyambe', '2022-04-30 20:19:03'),
	(385, '385', 'TECH000000000106', 'TOKN000000000385', '13c3e00b8b13836b67348f51f242dbfe153cbeb2da4eeeb32a', '1651342795', 'Nyambe', '2022-04-30 20:19:55'),
	(386, '386', 'TECH000000000107', 'TOKN000000000386', '512c96da664c1e25e85e47fe70ddaa491fec2cefbb97efc6a7', '1651344091', 'Tupa', '2022-04-30 20:41:31'),
	(387, '387', 'TECH000000000107', 'TOKN000000000387', 'd086938b60172dad5ba339cb4452505b61de99024c8fb44e4c', '1651344550', 'Tupa', '2022-04-30 20:49:10'),
	(388, '388', 'ITADM00001', 'TOKN000000000388', 'ecbb0416e2552468d942c7514cd42eca3d91c08dfa92335b72', '1651377307', 'it', '2022-05-01 05:55:07'),
	(389, '389', 'TECH000000000107', 'TOKN000000000389', '7cbb38fdda6740d6a001c37be71c0dc8b9e6642c780148cf0d', '1651417347', 'Tupa', '2022-05-01 17:02:27'),
	(390, '390', 'TECH000000000107', 'TOKN000000000390', 'a77500a82879260f8be5e273c33430b67ebafc7f26dc7a61b2', '1651419253', 'Tupa', '2022-05-01 17:34:13'),
	(391, '391', 'TECH000000000106', 'TOKN000000000391', '434e7656ba7dee50555aa774882e8861ca2f08149906a4c4fa', '1651419312', 'Nyambe', '2022-05-01 17:35:12'),
	(392, '392', 'TECH000000000107', 'TOKN000000000392', 'cf98232734ca002f393c2782aebc918f5be5d81d61aa5bd1db', '1651419719', 'Tupa', '2022-05-01 17:41:59'),
	(393, '393', 'TECH000000000106', 'TOKN000000000393', '93f650d6c10d4882c9571dc11add3c7fb02c3f4550e7da617b', '1651420877', 'Nyambe', '2022-05-01 18:01:17'),
	(394, '394', 'TECH000000000107', 'TOKN000000000394', '7b663ad5a81ddff9c403b3499af28556a530d6b1c5af612106', '1651420969', 'Tupa', '2022-05-01 18:02:50');
/*!40000 ALTER TABLE `sessionhistory` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.statusmaster
DROP TABLE IF EXISTS `statusmaster`;
CREATE TABLE IF NOT EXISTS `statusmaster` (
  `StatusMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `StatueCode` char(4) NOT NULL,
  `Statue` varchar(50) NOT NULL,
  PRIMARY KEY (`StatusMasterID`),
  UNIQUE KEY `StatueCode` (`StatueCode`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.statusmaster: ~15 rows (approximately)
/*!40000 ALTER TABLE `statusmaster` DISABLE KEYS */;
INSERT IGNORE INTO `statusmaster` (`StatusMasterID`, `StatueCode`, `Statue`) VALUES
	(1, 'SUCC', 'Success'),
	(2, 'PEND', 'Pending'),
	(3, 'ERRO', 'Error'),
	(4, 'FAIL', 'Failed'),
	(5, 'APPR', 'Approved'),
	(6, 'REQU', 'Requested'),
	(7, 'REGE', 'Rejection'),
	(8, 'MODI', 'Modified'),
	(9, 'COMP', 'Complited'),
	(10, 'PROC', 'Processing'),
	(11, 'STAT', 'Started'),
	(12, 'FRJC', 'Final Rejection'),
	(13, '1', 'Present'),
	(14, '2', 'Absent'),
	(15, '3', 'Unmarked');
/*!40000 ALTER TABLE `statusmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.studentattendance
DROP TABLE IF EXISTS `studentattendance`;
CREATE TABLE IF NOT EXISTS `studentattendance` (
  `StudentAttendanceID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` varchar(50) NOT NULL,
  `ClassID` varchar(50) NOT NULL DEFAULT '',
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `Status` varchar(50) NOT NULL,
  `Reason` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`StudentAttendanceID`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.studentattendance: ~30 rows (approximately)
/*!40000 ALTER TABLE `studentattendance` DISABLE KEYS */;
INSERT IGNORE INTO `studentattendance` (`StudentAttendanceID`, `StudentID`, `ClassID`, `UpdatedOn`, `Status`, `Reason`) VALUES
	(59, '3EDU202100034', 'CLAS0000000008', '2021-07-02 12:54:13', '2', 'hjvhjv'),
	(60, '3EDU202100023', 'CLAS0000000004', '2021-07-02 12:54:56', '2', NULL),
	(61, '3EDU202100020', 'CLAS0000000004', '2021-07-02 12:54:56', '1', NULL),
	(62, '3EDU202100010', 'CLAS0000000004', '2021-07-02 12:54:56', '1', NULL),
	(63, '3EDU202100009', 'CLAS0000000004', '2021-07-02 12:54:56', '2', NULL),
	(64, '3EDU202100023', 'CLAS0000000004', '2021-07-01 13:02:17', '3', NULL),
	(65, '3EDU202100020', 'CLAS0000000004', '2021-07-01 13:02:17', '3', NULL),
	(66, '3EDU202100010', 'CLAS0000000004', '2021-07-01 13:02:17', '3', NULL),
	(67, '3EDU202100009', 'CLAS0000000004', '2021-07-01 13:02:17', '3', NULL),
	(68, 'SN2021040', 'CLAS0000000004', '2021-08-22 20:05:12', '1', ''),
	(69, 'SN2021037', 'CLAS0000000004', '2021-08-22 20:05:12', '2', NULL),
	(70, 'SN2021036', 'CLAS0000000004', '2021-08-22 20:05:12', '2', NULL),
	(71, 'SN2021035', 'CLAS0000000004', '2021-08-22 20:05:12', '2', NULL),
	(72, 'SN2021031', 'CLAS0000000004', '2021-08-22 20:05:12', '1', NULL),
	(73, 'SN2021030', 'CLAS0000000004', '2021-08-22 20:05:12', '2', NULL),
	(74, 'SN2021029', 'CLAS0000000004', '2021-08-22 20:05:12', '1', NULL),
	(75, 'SN2021028', 'CLAS0000000004', '2021-08-22 20:05:12', '2', NULL),
	(76, 'SN2021044', 'CLAS00000000068', '2021-10-18 12:21:30', '1', NULL),
	(77, 'SN2021040', 'CLAS0000000004', '2022-01-16 05:09:06', '1', NULL),
	(78, 'SN2021037', 'CLAS0000000004', '2022-01-16 05:09:06', '1', NULL),
	(79, 'SN2021036', 'CLAS0000000004', '2022-01-16 05:09:06', '1', NULL),
	(80, 'SN2021035', 'CLAS0000000004', '2022-01-16 05:09:06', '1', NULL),
	(81, 'SN2021031', 'CLAS0000000004', '2022-01-16 05:09:06', '1', NULL),
	(82, 'SN2021030', 'CLAS0000000004', '2022-01-16 05:09:06', '1', NULL),
	(83, 'SN2021029', 'CLAS0000000004', '2022-01-16 05:09:06', '2', NULL),
	(84, 'SN2021028', 'CLAS0000000004', '2022-01-16 05:09:06', '1', NULL),
	(85, 'SN2022047', 'CLAS00000000076', '2022-04-16 11:36:48', '1', NULL),
	(86, 'SN2022046', 'CLAS00000000076', '2022-04-16 11:36:48', '1', NULL),
	(87, 'SN2022045', 'CLAS00000000076', '2022-04-16 11:36:48', '1', NULL),
	(88, 'SN2022048', 'CLAS00000000077', '2022-04-16 11:37:13', '1', NULL);
/*!40000 ALTER TABLE `studentattendance` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.studentcomments
DROP TABLE IF EXISTS `studentcomments`;
CREATE TABLE IF NOT EXISTS `studentcomments` (
  `StudentCommentID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentMasterPublicID` varchar(50) NOT NULL,
  `TeaherMasterName` varchar(50) DEFAULT NULL,
  `HeadTeacherName` varchar(50) DEFAULT NULL,
  `TeacherComment` varchar(250) DEFAULT NULL,
  `HeadTeacherComment` varchar(250) DEFAULT NULL,
  `State` varchar(30) DEFAULT NULL,
  `Term` varchar(200) NOT NULL,
  `AssessmentName` int(11) NOT NULL DEFAULT 0,
  `CreatedAt` date NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` date NOT NULL DEFAULT current_timestamp(),
  `UpdatedBy` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`StudentCommentID`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.studentcomments: ~4 rows (approximately)
/*!40000 ALTER TABLE `studentcomments` DISABLE KEYS */;
INSERT IGNORE INTO `studentcomments` (`StudentCommentID`, `StudentMasterPublicID`, `TeaherMasterName`, `HeadTeacherName`, `TeacherComment`, `HeadTeacherComment`, `State`, `Term`, `AssessmentName`, `CreatedAt`, `UpdatedAt`, `UpdatedBy`) VALUES
	(212, 'SDNT00000000043', 'Nyambe Mubukwanu', 'Tupa Mukamba', 'gOOD', 'Avrage', 'Done', 'Term 1', 18, '2022-05-01', '2022-05-01', 'Tupa'),
	(213, 'SDNT00000000042', 'Nyambe Mubukwanu', 'Tupa Mukamba', 'GOOD', 'Avrage', 'Done', 'Term 1', 18, '2022-05-01', '2022-05-01', 'Tupa'),
	(214, 'SDNT00000000041', 'Nyambe Mubukwanu', 'Tupa Mukamba', 'gOOD', 'Avrage', 'Done', 'Term 1', 18, '2022-05-01', '2022-05-01', 'Tupa'),
	(215, 'SDNT00000000040', 'Nyambe Mubukwanu', 'Tupa Mukamba', 'Avrage', 'Avrage', 'Done', 'Term 1', 18, '2022-05-01', '2022-05-01', 'Tupa');
/*!40000 ALTER TABLE `studentcomments` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.studentdetails
DROP TABLE IF EXISTS `studentdetails`;
CREATE TABLE IF NOT EXISTS `studentdetails` (
  `StudentDetailsID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentDetailsPublicID` varchar(50) NOT NULL,
  `StudentMasterPublicID` varchar(50) NOT NULL,
  `SubjectCode` char(10) NOT NULL,
  `ClassMasterPublicID` varchar(50) NOT NULL,
  `Year` year(4) NOT NULL DEFAULT year(curdate()),
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedBy` varchar(50) NOT NULL,
  PRIMARY KEY (`Year`,`ClassMasterPublicID`,`SubjectCode`,`StudentMasterPublicID`) USING BTREE,
  UNIQUE KEY `StudentDetailsID` (`StudentDetailsID`),
  UNIQUE KEY `StudentDetailsPublicID` (`StudentDetailsPublicID`),
  KEY `FK_studentdetails_classmaster` (`ClassMasterPublicID`),
  KEY `FK_studentdetails_subjectmater` (`SubjectCode`),
  KEY `FK_studentdetails_studentmaster` (`StudentMasterPublicID`),
  CONSTRAINT `FK_studentdetails_classmaster` FOREIGN KEY (`ClassMasterPublicID`) REFERENCES `classmaster` (`ClassMasterPublicID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_studentdetails_studentmaster` FOREIGN KEY (`StudentMasterPublicID`) REFERENCES `studentmaster` (`StudentMasterPublicID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_studentdetails_subjectmater` FOREIGN KEY (`SubjectCode`) REFERENCES `subjectmater` (`SubjectCode`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.studentdetails: ~0 rows (approximately)
/*!40000 ALTER TABLE `studentdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentdetails` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.studentmaster
DROP TABLE IF EXISTS `studentmaster`;
CREATE TABLE IF NOT EXISTS `studentmaster` (
  `StudentMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentMasterPublicID` varchar(50) NOT NULL,
  `ProfilePic` varchar(10000) NOT NULL DEFAULT '../../uploads/defult.png',
  `StudentNo` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `OtherName` varchar(50) DEFAULT NULL,
  `GenderID` int(11) NOT NULL DEFAULT 0,
  `MaritalStatusID` int(11) NOT NULL DEFAULT 0,
  `ClassMasterPublicID` varchar(50) NOT NULL DEFAULT '0',
  `DOB` date NOT NULL,
  `EmailAddress` varchar(50) DEFAULT NULL,
  `GuardianContactNo` varchar(10) NOT NULL,
  `GuardianMaleName` varchar(50) DEFAULT NULL,
  `GuardianFemaleName` varchar(50) DEFAULT NULL,
  `Address` varchar(5000) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `Year` year(4) DEFAULT 2021,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `IsGraduated` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`StudentMasterID`) USING BTREE,
  UNIQUE KEY `StudentNo` (`StudentNo`),
  UNIQUE KEY `StudentMasterPublicID` (`StudentMasterPublicID`),
  KEY `FK_studentmaster_gendermaster` (`GenderID`),
  KEY `FK_studentmaster_maritalstatusmaster` (`MaritalStatusID`),
  KEY `FK_studentmaster_classmaster` (`ClassMasterPublicID`),
  CONSTRAINT `FK_studentmaster_classmaster` FOREIGN KEY (`ClassMasterPublicID`) REFERENCES `classmaster` (`ClassMasterPublicID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_studentmaster_gendermaster` FOREIGN KEY (`GenderID`) REFERENCES `gendermaster` (`GenderMasterID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_studentmaster_maritalstatusmaster` FOREIGN KEY (`MaritalStatusID`) REFERENCES `maritalstatusmaster` (`MaritalStatusMasterID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.studentmaster: ~19 rows (approximately)
/*!40000 ALTER TABLE `studentmaster` DISABLE KEYS */;
INSERT IGNORE INTO `studentmaster` (`StudentMasterID`, `StudentMasterPublicID`, `ProfilePic`, `StudentNo`, `FirstName`, `LastName`, `OtherName`, `GenderID`, `MaritalStatusID`, `ClassMasterPublicID`, `DOB`, `EmailAddress`, `GuardianContactNo`, `GuardianMaleName`, `GuardianFemaleName`, `Address`, `UpdatedBy`, `UpdatedOn`, `Year`, `IsActive`, `IsGraduated`) VALUES
	(3, 'SDNT0000000001', '../../uploads/3EDU20210005_images.png', 'SN2021028', 'Alinuswe', 'Banda', NULL, 1, 4, 'CLAS0000000004', '1996-05-22', NULL, '097785684', 'Ali Mwanza', 'Tina Type', 'North mind Bwigimfumu', 'it', '2021-05-22 18:01:06', '2021', '1', '0'),
	(9, 'SDNT0000000005', '../../uploads/3EDU202100010_reri.jpg', 'SN2021029', 'Samuel', 'Banda', 'Liabwa', 1, 3, 'CLAS0000000004', '1992-01-01', NULL, '0977856258', 'Mwamba Liabwa Banda', 'Mwape Liabwa', 'North Mid Lusaka', 'it', '2021-05-22 22:23:33', '2021', '1', '0'),
	(17, 'SDNT00000000015', '../../uploads/3EDU20210008_lady.png', 'SN2021030', 'Mwaka', 'Vwalika', 'Candy', 1, 4, 'CLAS0000000004', '2004-01-01', NULL, '0977856258', 'Mwamba Liabwa Vwalika', 'Mwape Vwalika', '204 B provident road Fairview', 'it', '2021-05-22 23:57:34', '2021', '1', '0'),
	(20, 'SDNT00000000018', '../../uploads/defult.png', 'SN2021031', 'Myday', 'Kasalwe', NULL, 2, 1, 'CLAS0000000004', '2004-05-14', NULL, '0977100587', 'Mwamba Liabwa Banda', NULL, 'Luska Zambia', 'it', '2021-05-23 00:13:35', '2021', '1', '0'),
	(22, 'SDNT00000000026', '../../uploads/defult.png', 'SN2021032', 'Emmanuel', 'Mwando', 'Lukulu', 1, 2, 'CLAS0000000013', '2021-05-07', NULL, '0977100587', 'sdsd', NULL, 'Lusaka, Chelenge', 'it', '2021-05-23 00:31:30', '2021', '1', '0'),
	(24, 'SDNT00000000028', '../../uploads/3EDU202100033_lady.png', 'SN2021033', 'Test', 'Pupile', NULL, 1, 4, 'CLAS0000000013', '2000-01-01', 'alinuswemwandobo@gmail.com4', '0977100587', 'Mwamba Liabwa Banda', 'Mwape Liabwa', 'Lusaka, Chelenge', 'it', '2021-05-23 21:59:44', '2021', '1', '0'),
	(27, 'SDNT00000000029', '../../uploads/defult.png', 'SN2021034', 'Mwazube', 'Mkonde', NULL, 1, 4, 'CLAS0000000008', '2021-07-04', NULL, '', 'Mwaba Kaenga', NULL, 'Lusaka Xelston', 'it', '2021-07-04 12:03:36', '2021', '1', '0'),
	(29, 'SDNT00000000030', '../../uploads/defult.png', 'SN2021035', 'Emmanuel', 'Mwando', 'Mwando', 1, 4, 'CLAS0000000004', '1996-01-01', 'prototype1496@gmail.com', '0977100587', 'Mwamba Liabwa Banda', 'Banda', '204 B provident road Fairview', 'it', '2021-08-07 16:37:46', '2021', '1', '0'),
	(30, 'SDNT00000000031', '../../uploads/3EDU202100036_marcal.jpg', 'SN2021036', 'Student', 'X', 'Mwando', 1, 4, 'CLAS0000000004', '1996-01-01', 'prototype1496@gmail.com', '0977100587', 'Mwamba Liabwa Banda', 'Banda', '204 B provident road Fairview', 'it', '2021-08-07 16:38:56', '2021', '1', '0'),
	(31, 'SDNT00000000032', '../../uploads/3EDU20210005_images.png', 'SN2021037', 'Test', 'John', 'Kambondo', 1, 4, 'CLAS0000000008', '2003-12-31', 'prototype1496@gmail.com', '0977100583', 'Mwamba Liabwa', 'Mwandobo BK', 'Accara, Zambia', 'it', '2021-08-07 18:31:50', '2021', '1', '0'),
	(34, 'SDNT00000000035', '../../uploads/defult.png', 'SN2021040', 'Tenant', 'Tenat Nwe', NULL, 1, 1, 'CLAS0000000004', '1996-01-01', 'prototype1496@gmail.com', '0977100587', 'sdsd', 'Mwando', 'Lusaka, Chelenge', 'it', '2021-08-08 07:45:28', '2021', '1', '0'),
	(35, 'SDNT00000000036', '../../uploads/SN2021041_images.png', 'SN2021041', 'Liko', 'Mwnza', NULL, 2, 4, 'CLAS00000000067', '2003-01-01', 'prototype1496@gmail.com', '0977100587', 'Mwamba Liabwa Banda', 'Mwandobo', 'C/O.Mr.A.B.Mwandobo Flat 23C MURAMBA ROAD CHILENJE', 'ta', '2021-10-14 17:46:42', '2021', '1', '0'),
	(36, 'SDNT00000000037', '../../uploads/SN2021042_images.png', 'SN2021042', 'Muke', 'Mambwe', NULL, 2, 4, 'CLAS00000000067', '2003-01-01', NULL, '0973609319', 'Mwamba Liabwa Banda', 'Banda', '204 B provident road Fairview', 'Mwaka', '2021-10-14 17:48:40', '2021', '1', '0'),
	(37, 'SDNT00000000038', '../../uploads/SN2021043_images.png', 'SN2021043', 'Vilkinga', 'Makayi', NULL, 2, 4, 'CLAS00000000067', '2003-01-01', NULL, '0973609319', 'Mwamba Liabwa Banda', 'Banda', '204 B provident road Fairview', 'Mwaka', '2021-10-14 17:49:55', '2021', '1', '0'),
	(38, 'SDNT00000000039', '../../uploads/SN2021044_images.png', 'SN2021044', 'Minza', 'Munati', NULL, 1, 4, 'CLAS00000000068', '2003-12-31', 'prototype1496@gmail.com', '0977100587', 'Mwamba Liabwa Banda', 'Mwando', 'Lusaka, Chelenge', 'ali_admin', '2021-10-18 11:36:10', '2021', '1', '0'),
	(39, 'SDNT00000000040', '../../uploads/SN2022045_Tukozani194614694.jpg', 'SN2022045', 'Tokozani', 'Lungu', NULL, 1, 4, 'CLAS00000000076', '2022-04-13', 'alimwanza@gmail.com', '0971145232', 'Peter Mwanza', 'Alice Mwiche', '4 Azikwe Road Lusaka', 'Madmin', '2022-04-13 00:22:31', '2021', '1', '0'),
	(40, 'SDNT00000000041', '../../uploads/SN2022046_Chileshe194653423.jpg', 'SN2022046', 'Thandi', 'Zimba', NULL, 2, 4, 'CLAS00000000076', '2022-04-11', 'alimwanza@gmail.com', '0971145232', 'Peter Mwanza', 'Alice Mwiche', '4 Azikwe Road lusaka', 'Madmin', '2022-04-13 00:23:42', '2021', '1', '0'),
	(41, 'SDNT00000000042', '../../uploads/SN2022047_CholaChanda192556708.png', 'SN2022047', 'Luka', 'Nyrenda', NULL, 1, 4, 'CLAS00000000076', '2022-04-11', 'alimwanza@gmail.com', '0971145232', 'Peter Mwanza', 'Alice Mwiche', 'Lusaka Zambia', 'Madmin', '2022-04-13 00:25:13', '2021', '1', '0'),
	(42, 'SDNT00000000043', '../../uploads/SN2022048_Francis190715338.jpg', 'SN2022048', 'Francis', 'Lili', NULL, 1, 4, 'CLAS00000000076', '2022-04-12', 'alimwanza@gmail.com', '0971145232', 'Peter Mwanza', 'Alice Mwiche', 'Lusaka Zambia', 'Madmin', '2022-04-13 00:40:58', '2021', '1', '0');
/*!40000 ALTER TABLE `studentmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.studnetassesment
DROP TABLE IF EXISTS `studnetassesment`;
CREATE TABLE IF NOT EXISTS `studnetassesment` (
  `StudnetAssesmenID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentMasterPublicID` varchar(50) NOT NULL,
  `AssecemntTypeMasterID` int(11) NOT NULL,
  `ClassMasterPublicID` varchar(50) NOT NULL,
  `SubjectMasterID` int(11) NOT NULL,
  `YearAdded` year(4) NOT NULL DEFAULT year(current_timestamp()),
  `AssecementName` varchar(50) NOT NULL,
  `Score` double NOT NULL,
  `AddedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `Commment` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`StudnetAssesmenID`) USING BTREE,
  KEY `FK_studnetassesment_classmaster` (`ClassMasterPublicID`),
  KEY `FK_studnetassesment_assementtypemaster` (`AssecemntTypeMasterID`),
  KEY `FK_studnetassesment_subjectmater` (`SubjectMasterID`),
  KEY `FK_studnetassesment_studentmaster` (`StudentMasterPublicID`),
  CONSTRAINT `FK_studnetassesment_assementtypemaster` FOREIGN KEY (`AssecemntTypeMasterID`) REFERENCES `assementtypemaster` (`AssementTypeID`) ON DELETE NO ACTION,
  CONSTRAINT `FK_studnetassesment_classmaster` FOREIGN KEY (`ClassMasterPublicID`) REFERENCES `classmaster` (`ClassMasterPublicID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_studnetassesment_studentmaster` FOREIGN KEY (`StudentMasterPublicID`) REFERENCES `studentmaster` (`StudentMasterPublicID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_studnetassesment_subjectmater` FOREIGN KEY (`SubjectMasterID`) REFERENCES `subjectmater` (`SubjectMaterID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.studnetassesment: ~22 rows (approximately)
/*!40000 ALTER TABLE `studnetassesment` DISABLE KEYS */;
INSERT IGNORE INTO `studnetassesment` (`StudnetAssesmenID`, `StudentMasterPublicID`, `AssecemntTypeMasterID`, `ClassMasterPublicID`, `SubjectMasterID`, `YearAdded`, `AssecementName`, `Score`, `AddedOn`, `Commment`, `UpdatedBy`, `UpdatedOn`) VALUES
	(1, 'SDNT00000000039', 17, 'CLAS00000000068', 39, '2021', 'sets', 85, '2021-10-18 13:19:11', 'GOOD', 'nakamba', '2021-10-18 13:19:11'),
	(2, 'SDNT00000000039', 17, 'CLAS00000000068', 40, '2021', 'pronouns', 30, '2021-10-18 13:19:46', 'Poor', 'nakamba', '2021-10-18 13:19:46'),
	(3, 'SDNT00000000039', 17, 'CLAS00000000068', 41, '2021', 'skeleton', 5, '2021-10-18 13:20:18', NULL, 'nakamba', '2021-10-18 13:20:18'),
	(4, 'SDNT00000000031', 1, 'CLAS0000000004', 1, '2022', 'math', 2, '2022-01-16 05:04:46', 'GOOD', 't', '2022-01-16 05:04:46'),
	(5, 'SDNT00000000035', 1, 'CLAS0000000004', 1, '2022', 'math', 1, '2022-01-16 05:04:46', 'gOOD', 't', '2022-01-16 05:04:46'),
	(6, 'SDNT00000000032', 1, 'CLAS0000000004', 1, '2022', 'math', 8, '2022-01-16 05:04:46', 'gOOD', 't', '2022-01-16 05:04:46'),
	(7, 'SDNT00000000042', 18, 'CLAS00000000076', 48, '2022', 'test 1', 87, '2022-04-16 11:38:59', NULL, 'Nyambe', '2022-04-16 11:38:59'),
	(8, 'SDNT00000000041', 18, 'CLAS00000000076', 48, '2022', 'test 1', 23, '2022-04-16 11:38:59', NULL, 'Nyambe', '2022-04-16 11:38:59'),
	(9, 'SDNT00000000040', 18, 'CLAS00000000076', 48, '2022', 'test 1', 87, '2022-04-16 11:38:59', NULL, 'Nyambe', '2022-04-16 11:38:59'),
	(10, 'SDNT00000000042', 18, 'CLAS00000000076', 45, '2022', 'test 1', 65, '2022-04-16 11:41:07', NULL, 'Nyambe', '2022-04-16 11:41:07'),
	(11, 'SDNT00000000041', 18, 'CLAS00000000076', 45, '2022', 'test 1', 78, '2022-04-16 11:41:08', NULL, 'Nyambe', '2022-04-16 11:41:08'),
	(12, 'SDNT00000000040', 18, 'CLAS00000000076', 45, '2022', 'test 1', 89, '2022-04-16 11:41:08', NULL, 'Nyambe', '2022-04-16 11:41:08'),
	(13, 'SDNT00000000042', 18, 'CLAS00000000076', 47, '2022', 'test 1', 89, '2022-04-16 11:42:03', NULL, 'Nyambe', '2022-04-16 11:42:03'),
	(14, 'SDNT00000000041', 18, 'CLAS00000000076', 47, '2022', 'test 1', 63, '2022-04-16 11:42:03', NULL, 'Nyambe', '2022-04-16 11:42:03'),
	(15, 'SDNT00000000040', 18, 'CLAS00000000076', 47, '2022', 'test 1', 90, '2022-04-16 11:42:03', NULL, 'Nyambe', '2022-04-16 11:42:03'),
	(16, 'SDNT00000000042', 18, 'CLAS00000000076', 46, '2022', 'test 1', 98, '2022-04-16 11:43:12', NULL, 'Nyambe', '2022-04-16 11:43:12'),
	(17, 'SDNT00000000041', 18, 'CLAS00000000076', 46, '2022', 'test 1', 80, '2022-04-16 11:43:12', NULL, 'Nyambe', '2022-04-16 11:43:12'),
	(18, 'SDNT00000000040', 18, 'CLAS00000000076', 46, '2022', 'test 1', 9, '2022-04-16 11:43:12', NULL, 'Nyambe', '2022-04-16 11:43:12'),
	(19, 'SDNT00000000043', 18, 'CLAS00000000076', 48, '2022', 'test 2', 40, '2022-05-01 18:02:33', 'gOOD', 'Nyambe', '2022-05-01 18:02:33'),
	(20, 'SDNT00000000042', 18, 'CLAS00000000076', 48, '2022', 'test 2', 85, '2022-05-01 18:02:33', 'gOOD', 'Nyambe', '2022-05-01 18:02:33'),
	(21, 'SDNT00000000041', 18, 'CLAS00000000076', 48, '2022', 'test 2', 50, '2022-05-01 18:02:33', 'Avrage', 'Nyambe', '2022-05-01 18:02:33'),
	(22, 'SDNT00000000040', 18, 'CLAS00000000076', 48, '2022', 'test 2', 50, '2022-05-01 18:02:33', 'Avrage', 'Nyambe', '2022-05-01 18:02:33');
/*!40000 ALTER TABLE `studnetassesment` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.subjectmater
DROP TABLE IF EXISTS `subjectmater`;
CREATE TABLE IF NOT EXISTS `subjectmater` (
  `SubjectMaterID` int(11) NOT NULL AUTO_INCREMENT,
  `SubjectName` varchar(50) NOT NULL,
  `SubjectCode` char(10) NOT NULL,
  `DepartmentCode` int(11) NOT NULL DEFAULT 0,
  `SubjectDiscription` varchar(500) DEFAULT NULL,
  `SchoolID` varchar(50) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SubjectMaterID`) USING BTREE,
  UNIQUE KEY `SubjectCode` (`SubjectCode`,`SchoolID`) USING BTREE,
  KEY `FK_subjectmater_department` (`DepartmentCode`),
  KEY `FK_subjectmater_schoolmaster` (`SchoolID`),
  CONSTRAINT `FK_subjectmater_department` FOREIGN KEY (`DepartmentCode`) REFERENCES `department` (`DepartmentID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_subjectmater_schoolmaster` FOREIGN KEY (`SchoolID`) REFERENCES `schoolmaster` (`PublicID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.subjectmater: ~43 rows (approximately)
/*!40000 ALTER TABLE `subjectmater` DISABLE KEYS */;
INSERT IGNORE INTO `subjectmater` (`SubjectMaterID`, `SubjectName`, `SubjectCode`, `DepartmentCode`, `SubjectDiscription`, `SchoolID`, `UpdatedBy`, `UpdatedOn`, `IsActive`) VALUES
	(1, 'Mathematics', 'MATH', 1, NULL, 'SCHL0000000001', 'HAHHA', '2020-05-24 13:52:00', '1'),
	(2, 'English', 'ENG', 1, NULL, 'SCHL0000000001', 'Sys', '2020-05-24 13:52:05', '1'),
	(3, 'History', 'HIST', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:53:10', '1'),
	(4, 'Additional Mathematics', 'ADMA', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:57:24', '1'),
	(5, 'Biology ', 'BIOL', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:57:41', '1'),
	(7, 'Physics', 'PHSY', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:58:05', '1'),
	(8, 'Chemistry', 'CHEM', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:58:20', '1'),
	(9, 'Geography ', 'GEOG', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:58:44', '1'),
	(10, 'Art', 'ART', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:59:04', '1'),
	(11, 'Geometrical Mechanical Drawing ', 'GMD', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:59:22', '1'),
	(12, 'Technical Drawing', 'TD', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:59:45', '1'),
	(13, 'Religious Education', 'RE110', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:00:45', '1'),
	(14, 'Religious Education', 'RE210', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:06:05', '1'),
	(15, 'Agriculture Science', 'AGR', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:06:34', '1'),
	(16, 'Food And Nutrition', 'FN', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:06:58', '1'),
	(17, 'Home Economics', 'HE', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:07:13', '1'),
	(18, 'Fashion And Fabrics', 'FF', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:07:37', '1'),
	(19, 'Civic Education', 'CVIC', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:07:55', '1'),
	(20, 'Accounts ', 'ACC', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:08:15', '1'),
	(22, 'Book Keeping', 'BK', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:08:41', '1'),
	(23, 'French ', 'FNCH', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:09:02', '1'),
	(24, 'Bemba ', 'BEM', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:09:11', '1'),
	(25, 'Music ', 'MUIC', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:09:43', '1'),
	(26, 'Commerce ', 'COMC', 1, NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:09:59', '1'),
	(27, 'Scinece', 'SCEN', 1, NULL, 'SCHL0000000001', 'SYS', '2021-05-22 10:04:43', '1'),
	(28, 'Computer Studies ', 'CMST', 1, NULL, 'SCHL0000000001', 'SYS', '2021-05-22 10:33:03', '1'),
	(29, 'Integrated Science', 'ITSC', 1, NULL, 'SCHL0000000001', 'SYS', '0000-00-00 00:00:00', '1'),
	(30, 'Business Studies', 'BSST', 1, NULL, 'SCHL0000000001', 'SYS', '2021-05-22 10:39:31', '1'),
	(31, 'Socials Studies ', 'SCST', 1, NULL, 'SCHL0000000001', 'SYS', '2021-05-22 10:47:05', '1'),
	(32, 'Zambian Language ', 'ZMLG', 1, NULL, 'SCHL0000000001', 'SYS', '2021-05-22 10:47:57', '1'),
	(33, 'Physical Education', 'PYED', 1, NULL, 'SCHL0000000001', 'SYS', '2021-05-22 10:53:24', '1'),
	(34, 'Matthematics', 'MATH', 1, NULL, 'SCHL0000000009', 'ta', '2021-10-14 18:22:56', '0'),
	(38, 'English', 'ENG', 34, '', 'SCHL0000000009', 'ta', '2021-10-18 08:40:33', '1'),
	(39, 'Mathematics', 'MATH', 37, '', 'SCHL00000000010', 'ali_admin', '2021-10-18 10:27:53', '1'),
	(40, 'English', 'ENG', 38, '', 'SCHL00000000010', 'ali_admin', '2021-10-18 10:28:05', '1'),
	(41, 'Biology', 'BIOL', 40, '', 'SCHL00000000010', 'ali_admin', '2021-10-18 10:29:18', '1'),
	(42, 'Physics', 'PHY', 40, '', 'SCHL00000000010', 'ali_admin', '2021-10-18 10:29:34', '1'),
	(43, 'Chemistry', 'CHEM', 40, '', 'SCHL00000000010', 'ali_admin', '2021-10-18 10:29:57', '1'),
	(44, 'Art', 'ART', 39, '', 'SCHL00000000010', 'ali_admin', '2021-10-18 10:30:20', '1'),
	(45, 'ICT', 'IT', 46, 'ICT', 'SCHL00000000011', 'Madmin', '2022-04-13 00:04:28', '1'),
	(46, 'Science', 'SCI', 47, 'Science', 'SCHL00000000011', 'Madmin', '2022-04-13 00:05:14', '1'),
	(47, 'Math', 'Mth', 44, 'Mathamatics Department', 'SCHL00000000011', 'Madmin', '2022-04-13 00:05:38', '1'),
	(48, 'English', 'Eng', 48, 'Eng', 'SCHL00000000011', 'Madmin', '2022-04-13 00:05:56', '1');
/*!40000 ALTER TABLE `subjectmater` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.teacherdetails
DROP TABLE IF EXISTS `teacherdetails`;
CREATE TABLE IF NOT EXISTS `teacherdetails` (
  `TeacherDetailsID` int(11) NOT NULL AUTO_INCREMENT,
  `TeacherDetailsPublicID` varchar(50) NOT NULL,
  `TeacherMasterPublicID` varchar(50) NOT NULL,
  `SubjectCode` char(6) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `AddedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TeacherDetailsID`) USING BTREE,
  UNIQUE KEY `TeacherDetailsPublicID` (`TeacherDetailsPublicID`) USING BTREE,
  KEY `FK_teacherdetails_teachermaster` (`TeacherMasterPublicID`) USING BTREE,
  KEY `FK_teacherdetails_subjectmater` (`SubjectCode`) USING BTREE,
  CONSTRAINT `FK_teacherdetails_subjectmater` FOREIGN KEY (`SubjectCode`) REFERENCES `subjectmater` (`SubjectCode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_teacherdetails_teachermaster` FOREIGN KEY (`TeacherMasterPublicID`) REFERENCES `teachermaster` (`TeaherMasterPublicID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.teacherdetails: ~26 rows (approximately)
/*!40000 ALTER TABLE `teacherdetails` DISABLE KEYS */;
INSERT IGNORE INTO `teacherdetails` (`TeacherDetailsID`, `TeacherDetailsPublicID`, `TeacherMasterPublicID`, `SubjectCode`, `UpdatedBy`, `UpdatedOn`, `AddedOn`) VALUES
	(1, 'TECHDT0000000002', 'TECH0000000003', 'MATH', 'SYS', '2020-05-24 16:27:49', '2021-08-21 11:26:32'),
	(2, 'TECHDT0000000001', 'TECH0000000003', 'ADMA', 'sys', '2020-05-24 16:27:49', '2021-08-21 11:26:32'),
	(3, 'TECHDT0000000005', 'TECH0000000003', 'ART', 't', '2020-06-15 22:56:50', '2021-08-21 11:26:32'),
	(4, 'TECHDT0000000006', 'TECH0000000001', 'GMD', 't', '2020-06-15 22:56:50', '2021-08-21 11:26:32'),
	(5, 'TEDT00000000087', 'TECH00000000079', 'HE', 'it', '2021-08-21 18:02:09', '2021-08-21 18:02:09'),
	(6, 'TEDT00000000088', 'TECH00000000079', 'HIST', 'it', '2021-08-21 18:02:09', '2021-08-21 18:02:09'),
	(7, 'TEDT00000000089', 'TECH00000000080', 'ACC', 'it', '2021-08-21 18:05:08', '2021-08-21 18:05:08'),
	(8, 'TEDT00000000090', 'TECH00000000080', 'COMC', 'it', '2021-08-21 18:05:08', '2021-08-21 18:05:08'),
	(9, 'TEDT00000000091', 'TECH00000000080', 'BIOL', 'it', '2021-08-21 18:05:08', '2021-08-21 18:05:08'),
	(16, 'TEDT000000000105', 'TECH00000000091', 'ACC', 'it', '2021-08-23 09:31:52', '2021-08-23 09:31:52'),
	(17, 'TEDT000000000106', 'TECH00000000091', 'BIOL', 'it', '2021-08-23 09:31:52', '2021-08-23 09:31:52'),
	(18, 'TEDT000000000114', 'TECH000000000101', 'ACC', 'ta', '2021-10-10 15:12:00', '2021-10-10 15:12:00'),
	(19, 'TEDT000000000115', 'TECH000000000101', 'ENG', 'ta', '2021-10-10 15:12:00', '2021-10-10 15:12:00'),
	(20, 'TEDT000000000116', 'TECH000000000102', 'ACC', 'ta', '2021-10-10 15:13:52', '2021-10-10 15:13:52'),
	(21, 'TEDT000000000117', 'TECH000000000103', 'ACC', 'ta', '2021-10-12 12:27:32', '2021-10-12 12:27:32'),
	(22, 'TEDT000000000118', 'TECH000000000103', 'HIST', 'ta', '2021-10-12 12:27:32', '2021-10-12 12:27:32'),
	(23, 'TEDT000000000119', 'TECH000000000104', 'BIOL', 'ali_admin', '2021-10-18 11:16:47', '2021-10-18 10:42:04'),
	(24, 'TEDT000000000120', 'TECH000000000105', 'MATH', 'ali_admin', '2021-10-18 11:56:49', '2021-10-18 11:56:49'),
	(25, 'TEDT000000000121', 'TECH000000000106', 'Eng', 'Madmin', '2022-04-13 00:11:11', '2022-04-13 00:11:11'),
	(26, 'TEDT000000000122', 'TECH000000000106', 'IT', 'Madmin', '2022-04-13 00:11:11', '2022-04-13 00:11:11'),
	(27, 'TEDT000000000123', 'TECH000000000106', 'Mth', 'Madmin', '2022-04-13 00:11:11', '2022-04-13 00:11:11'),
	(28, 'TEDT000000000124', 'TECH000000000106', 'SCI', 'Madmin', '2022-04-13 00:11:11', '2022-04-13 00:11:11'),
	(29, 'TEDT000000000125', 'TECH000000000107', 'Eng', 'Madmin', '2022-04-13 00:13:51', '2022-04-13 00:13:51'),
	(30, 'TEDT000000000126', 'TECH000000000107', 'IT', 'Madmin', '2022-04-13 00:13:51', '2022-04-13 00:13:51'),
	(31, 'TEDT000000000127', 'TECH000000000107', 'Mth', 'Madmin', '2022-04-13 00:13:51', '2022-04-13 00:13:51'),
	(32, 'TEDT000000000128', 'TECH000000000107', 'SCI', 'Madmin', '2022-04-13 00:13:51', '2022-04-13 00:13:51');
/*!40000 ALTER TABLE `teacherdetails` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.teacherdocument
DROP TABLE IF EXISTS `teacherdocument`;
CREATE TABLE IF NOT EXISTS `teacherdocument` (
  `TeacherdocumentID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `DocumentTypeID` varchar(50) NOT NULL,
  `DocumentURL` varchar(10000) NOT NULL,
  `IsApproved` char(1) NOT NULL DEFAULT '0',
  `AddedBy` varchar(50) NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `AddedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`TeacherdocumentID`),
  KEY `FK_teacherdocument_comboboxvaluemaster` (`DocumentTypeID`),
  CONSTRAINT `FK_teacherdocument_comboboxvaluemaster` FOREIGN KEY (`DocumentTypeID`) REFERENCES `comboboxvaluemaster` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.teacherdocument: ~5 rows (approximately)
/*!40000 ALTER TABLE `teacherdocument` DISABLE KEYS */;
INSERT IGNORE INTO `teacherdocument` (`TeacherdocumentID`, `Title`, `DocumentTypeID`, `DocumentURL`, `IsApproved`, `AddedBy`, `LastUpdatedBy`, `AddedOn`, `UpdatedOn`) VALUES
	(5, '', '1', '', '0', 't', 't', '2021-07-04 04:46:13', '2021-07-04 05:47:56'),
	(11, 'Liko Mwanza Lesson Plan', '1', '../../documents_uploads/TECH0000000003_6128a6a802c2bpdf-test.pdf', '0', 't', 't', '2021-08-27 10:47:36', '2021-08-27 10:47:36'),
	(12, 'Hellen Lesson Plan', '1', '../../documents_uploads/TECH000000000103_61684f2a90da2pdf-test.pdf', '0', 'Helen', 'Helen', '2021-10-14 17:39:22', '2021-10-14 17:39:22'),
	(13, 'Nakamba Node Lesson Plan', '1', '../../documents_uploads/TECH000000000104_616d47d183482Test pdf For Uploads.pdf', '0', 'nakamba', 'nakamba', '2021-10-18 12:09:21', '2021-10-18 12:09:21'),
	(14, 'Nkamba Lesson Plan', '1', '../../documents_uploads/TECH000000000104_616d58f9c4dc4Test pdf For Uploads.pdf', '0', 'nakamba', 'nakamba', '2021-10-18 13:22:33', '2021-10-18 13:22:33');
/*!40000 ALTER TABLE `teacherdocument` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.teachermaster
DROP TABLE IF EXISTS `teachermaster`;
CREATE TABLE IF NOT EXISTS `teachermaster` (
  `TeacherID` int(11) NOT NULL AUTO_INCREMENT,
  `TeaherMasterPublicID` varchar(50) NOT NULL,
  `TeacherPositionID` int(11) NOT NULL,
  `DeparmrntCode` char(50) NOT NULL,
  `StartDate` datetime NOT NULL DEFAULT current_timestamp(),
  `EndDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeacherID`) USING BTREE,
  UNIQUE KEY `PublicID` (`TeaherMasterPublicID`) USING BTREE,
  KEY `FK_teachermaster_teacherpositionmaster` (`TeacherPositionID`) USING BTREE,
  KEY `FK_teachermaster_department` (`DeparmrntCode`),
  CONSTRAINT `FK_teachermaster_department` FOREIGN KEY (`DeparmrntCode`) REFERENCES `department` (`ShortHand`) ON UPDATE CASCADE,
  CONSTRAINT `FK_teachermaster_teacherpositionmaster` FOREIGN KEY (`TeacherPositionID`) REFERENCES `teacherpositionmaster` (`TeacherPositionMasterID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.teachermaster: ~13 rows (approximately)
/*!40000 ALTER TABLE `teachermaster` DISABLE KEYS */;
INSERT IGNORE INTO `teachermaster` (`TeacherID`, `TeaherMasterPublicID`, `TeacherPositionID`, `DeparmrntCode`, `StartDate`, `EndDate`, `UpdatedBy`, `UpdatedOn`, `IsActive`) VALUES
	(1, 'TECH0000000001', 3, 'Math', '2020-05-24 16:25:03', NULL, 'it', '2020-05-24 16:25:06', '1'),
	(2, 'TECH0000000003', 4, 'EXAT', '2020-06-15 22:56:50', NULL, 'it', '2020-06-15 22:56:50', '1'),
	(6, 'TECH00000000068', 1, 'EXAT', '2021-08-21 17:24:46', NULL, 'it', '2021-08-21 17:24:46', '1'),
	(9, 'TECH00000000079', 1, 'EXAT', '2021-08-21 18:02:09', NULL, 'it', '2021-08-21 18:02:09', '0'),
	(10, 'TECH00000000080', 4, 'EGLA', '2021-08-21 18:05:08', NULL, 'it', '2021-08-21 18:05:08', '1'),
	(21, 'TECH00000000091', 4, 'SCEN', '2021-08-23 09:31:52', NULL, 'it', '2021-08-23 09:31:52', '1'),
	(26, 'TECH000000000101', 3, 'Maju', '2021-10-10 15:12:00', NULL, 'ta', '2021-10-10 15:12:00', '1'),
	(27, 'TECH000000000102', 2, 'Maju', '2021-10-10 15:13:52', NULL, 'ta', '2021-10-10 15:13:52', '1'),
	(28, 'TECH000000000103', 4, 'EXAT', '2021-10-12 12:27:32', NULL, 'ta', '2021-10-12 12:27:32', '1'),
	(29, 'TECH000000000104', 4, 'SCS', '2021-10-18 10:42:04', NULL, 'ali_admin', '2021-10-18 10:42:04', '1'),
	(30, 'TECH000000000105', 3, 'MATH', '2021-10-18 11:56:49', NULL, 'ali_admin', '2021-10-18 11:56:49', '1'),
	(31, 'TECH000000000106', 4, 'ED', '2022-04-13 00:11:11', NULL, 'Madmin', '2022-04-13 00:11:11', '1'),
	(32, 'TECH000000000107', 3, 'ED', '2022-04-13 00:13:51', NULL, 'Madmin', '2022-04-13 00:13:51', '1');
/*!40000 ALTER TABLE `teachermaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.teacherpositionmaster
DROP TABLE IF EXISTS `teacherpositionmaster`;
CREATE TABLE IF NOT EXISTS `teacherpositionmaster` (
  `TeacherPositionMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `PositionName` varchar(50) NOT NULL,
  `PositionDescription` varchar(500) DEFAULT NULL,
  `UpdatedBy` varchar(20) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`TeacherPositionMasterID`),
  UNIQUE KEY `PositionName` (`PositionName`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.teacherpositionmaster: ~7 rows (approximately)
/*!40000 ALTER TABLE `teacherpositionmaster` DISABLE KEYS */;
INSERT IGNORE INTO `teacherpositionmaster` (`TeacherPositionMasterID`, `PositionName`, `PositionDescription`, `UpdatedBy`, `UpdatedOn`, `IsActive`) VALUES
	(1, 'Head Of Department', 'This posion is head department', 'admin', '2019-11-04 00:08:23', '1'),
	(2, 'Deputy Head Teacher', 'Deputy Head Teacher Roll is to manage the School', 'admin', '2019-11-12 14:25:31', '1'),
	(3, 'Head Teacher ', 'Head Teacher  to manage the over role school activities ', 'admin', '2019-11-12 14:38:50', '1'),
	(4, 'Teacher', 'Teacher Role is to mange classes and pupils', 'admin', '2019-11-12 14:43:48', '1'),
	(5, 'Head Accountant ', NULL, 'admin', '2022-01-16 03:41:54', '1'),
	(6, 'Accountant ', NULL, 'admin', '2022-01-16 03:42:05', '1'),
	(7, 'IT Admin', NULL, 'admin', '2022-03-19 06:13:40', '1');
/*!40000 ALTER TABLE `teacherpositionmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.tenantmaster
DROP TABLE IF EXISTS `tenantmaster`;
CREATE TABLE IF NOT EXISTS `tenantmaster` (
  `TenantMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `TenantID` varchar(400) NOT NULL,
  `TenantName` varchar(100) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`TenantMasterID`),
  UNIQUE KEY `TenantID` (`TenantID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.tenantmaster: ~7 rows (approximately)
/*!40000 ALTER TABLE `tenantmaster` DISABLE KEYS */;
INSERT IGNORE INTO `tenantmaster` (`TenantMasterID`, `TenantID`, `TenantName`, `UpdatedOn`, `IsActive`) VALUES
	(1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'Lusaka Secondary School ', '2021-08-07 19:10:57', '1'),
	(2, 'a29294e8-f7a1-11eb-a81c-1062e5c23529', 'Test School ', '2021-08-07 19:11:28', '1'),
	(3, '3edu_29294e8-f7a1-11eb-a81c-1062e5c23520', '3Eedu Admin', '2021-08-07 21:42:07', '1'),
	(9, 'TES614098baeb6188.42391041', 'TESTTTEW', '2021-09-14 14:42:34', '1'),
	(11, 'rrr6140a8c632d934.43595166', 'rrrrrrrrrr', '2021-09-14 15:51:02', '1'),
	(12, 'Ama616d2ea1a78213.69918222', 'Amazing Grace', '2021-10-18 10:21:53', '1'),
	(13, 'Thr6255f612d73866.53144529', 'Three Encryptions Trust School', '2022-04-12 23:58:42', '1');
/*!40000 ALTER TABLE `tenantmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.termmaster
DROP TABLE IF EXISTS `termmaster`;
CREATE TABLE IF NOT EXISTS `termmaster` (
  `TermMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `TenantID` varchar(5000) NOT NULL,
  `TermName` varchar(50) NOT NULL,
  `IsSysActive` char(1) NOT NULL DEFAULT '0',
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `UpdatedBy` varchar(50) NOT NULL DEFAULT '0',
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TermMasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.termmaster: ~9 rows (approximately)
/*!40000 ALTER TABLE `termmaster` DISABLE KEYS */;
INSERT IGNORE INTO `termmaster` (`TermMasterID`, `TenantID`, `TermName`, `IsSysActive`, `IsActive`, `UpdatedBy`, `UpdatedOn`) VALUES
	(1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'Term 1', '1', '1', 'it', '2021-11-27 15:10:22'),
	(2, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'Term 2', '0', '1', 'it', '2021-11-27 15:10:30'),
	(3, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'Term 3 ', '0', '1', 'it', '2021-11-27 15:10:40'),
	(4, 'Ama616d2ea1a78213.69918222', 'Term 1', '0', '1', '0', '2021-11-27 15:11:03'),
	(5, 'Ama616d2ea1a78213.69918222', 'Term 2', '0', '1', '0', '2021-11-27 15:11:11'),
	(6, 'Ama616d2ea1a78213.69918222', 'Term 3', '1', '1', '0', '2021-11-27 15:11:23'),
	(9, 'Thr6255f612d73866.53144529', 'Term 1', '0', '1', 'Madmin', '2022-04-13 00:00:00'),
	(10, 'Thr6255f612d73866.53144529', 'Term 2', '0', '1', 'Madmin', '2022-04-13 00:00:05'),
	(11, 'Thr6255f612d73866.53144529', 'Term 3', '1', '1', 'Madmin', '2022-04-13 00:00:09');
/*!40000 ALTER TABLE `termmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.timetabledetails
DROP TABLE IF EXISTS `timetabledetails`;
CREATE TABLE IF NOT EXISTS `timetabledetails` (
  `TimeTableDetailsID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeTableMaterD` int(11) NOT NULL,
  `Monday` varchar(50) DEFAULT NULL,
  `Tuesday` varchar(50) DEFAULT NULL,
  `Wednesday` varchar(50) DEFAULT NULL,
  `Thursday` varchar(50) DEFAULT NULL,
  `Friday` varchar(50) DEFAULT NULL,
  `Saturday` varchar(50) DEFAULT NULL,
  `Sunday` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `AddedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TimeTableDetailsID`),
  KEY `FK_timetabledetails_timetablemaster` (`TimeTableMaterD`),
  CONSTRAINT `FK_timetabledetails_timetablemaster` FOREIGN KEY (`TimeTableMaterD`) REFERENCES `timetablemaster` (`TimeTableMasterID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.timetabledetails: ~27 rows (approximately)
/*!40000 ALTER TABLE `timetabledetails` DISABLE KEYS */;
INSERT IGNORE INTO `timetabledetails` (`TimeTableDetailsID`, `TimeTableMaterD`, `Monday`, `Tuesday`, `Wednesday`, `Thursday`, `Friday`, `Saturday`, `Sunday`, `UpdatedBy`, `UpdatedOn`, `AddedOn`) VALUES
	(1, 1, 'MATH', 'ENG', 'SCEN', 'MATH', 'ENG', 'ENG', NULL, 'it', '2022-05-01 05:57:45', '2021-06-27 13:00:42'),
	(2, 5, 'ENG', 'MATH', 'MATH', 'ENG', 'ENG', NULL, NULL, 'it', '2021-09-25 14:24:36', '2021-06-27 13:12:51'),
	(3, 6, 'SCEN', 'RE110', 'ZMLG', 'CMST', 'MATH', NULL, NULL, 'it', '2021-09-25 14:24:50', '2021-06-27 13:23:57'),
	(4, 7, NULL, NULL, 'ITSC', 'MATH', 'MATH', NULL, NULL, 'it', '2021-09-25 14:24:36', '2021-06-27 13:24:18'),
	(5, 10, 'MATH', 'ENG', NULL, NULL, NULL, NULL, NULL, 't', '2021-07-04 13:40:37', '2021-06-28 04:44:47'),
	(6, 8, 'MATH', 'CMST', 'ITSC', 'ADMA', 'ADMA', NULL, NULL, 't', '2021-07-10 12:35:20', '2021-06-28 04:46:08'),
	(7, 9, 'MATH', 'CMST', 'CMST', NULL, NULL, NULL, NULL, 't', '2021-07-10 12:35:20', '2021-07-03 13:18:46'),
	(10, 12, 'ENG', 'ITSC', 'CMST', NULL, NULL, NULL, NULL, 't', '2021-07-10 12:35:20', '2021-07-03 13:19:32'),
	(11, 13, 'ENG', 'ITSC', 'SCST', NULL, NULL, NULL, NULL, 't', '2021-07-10 12:35:20', '2021-07-03 13:19:47'),
	(19, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sys', '2021-10-13 18:19:50', '2021-10-13 18:19:50'),
	(20, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sys', '2021-10-13 18:20:15', '2021-10-13 18:20:15'),
	(25, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sys', '2021-10-13 18:29:27', '2021-10-13 18:29:27'),
	(30, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sys', '2021-10-14 09:06:31', '2021-10-14 09:06:31'),
	(33, 37, 'MATH', 'BEM', 'ENG', 'BK', 'ART', NULL, NULL, 'Mwaka', '2021-10-15 08:30:56', '2021-10-14 09:08:39'),
	(34, 38, NULL, 'BEM', NULL, 'ART', NULL, NULL, NULL, 'Mwaka', '2021-10-15 08:30:56', '2021-10-14 09:08:49'),
	(35, 39, 'BK', 'COMC', 'MATH', 'COMC', NULL, NULL, NULL, 'Mwaka', '2021-10-15 08:30:56', '2021-10-14 09:09:45'),
	(36, 40, 'BK', 'ENG', 'MATH', 'MATH', NULL, NULL, NULL, 'Mwaka', '2021-10-15 08:30:56', '2021-10-14 09:10:00'),
	(37, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ta', '2021-10-18 07:12:22', '2021-10-18 07:12:22'),
	(38, 42, 'MATH', 'ENG', 'CHEM', 'MATH', 'PHY', NULL, NULL, 'ali_admin', '2021-10-18 19:39:48', '2021-10-18 11:38:46'),
	(39, 43, 'MATH', 'ENG', 'CHEM', NULL, 'PHY', NULL, NULL, 'ali_admin', '2021-10-18 19:39:48', '2021-10-18 11:38:56'),
	(42, 46, 'ENG', 'BIOL', 'MATH', 'PHY', 'PHY', NULL, NULL, 'ali_admin', '2021-10-18 19:39:48', '2021-10-18 11:40:02'),
	(43, 47, 'ENG', NULL, NULL, NULL, 'PHY', NULL, NULL, 'ali_admin', '2021-10-18 19:39:48', '2021-10-18 11:40:15'),
	(44, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ali_admin', '2022-03-27 03:25:18', '2022-03-27 03:25:18'),
	(45, 49, NULL, NULL, NULL, NULL, 'Mth', 'Eng', NULL, 'Tupa', '2022-04-30 20:47:56', '2022-04-30 19:35:55'),
	(46, 50, NULL, NULL, NULL, NULL, 'IT', NULL, NULL, 'Tupa', '2022-04-30 20:48:36', '2022-04-30 19:36:11'),
	(47, 51, NULL, NULL, NULL, NULL, 'IT', 'Mth', NULL, 'Tupa', '2022-04-30 20:47:56', '2022-04-30 19:36:31'),
	(48, 52, NULL, NULL, NULL, NULL, 'Eng', 'Eng', NULL, 'Tupa', '2022-04-30 20:47:56', '2022-04-30 19:37:48');
/*!40000 ALTER TABLE `timetabledetails` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.timetablemaster
DROP TABLE IF EXISTS `timetablemaster`;
CREATE TABLE IF NOT EXISTS `timetablemaster` (
  `TimeTableMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassMasterID` varchar(50) NOT NULL,
  `PeriodMasterID` int(11) NOT NULL,
  `TimeFrom` time NOT NULL,
  `TimeTo` time NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `UpdatedBy` varchar(50) NOT NULL DEFAULT '',
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TimeTableMasterID`),
  KEY `FK_timetablemaster_classmaster` (`ClassMasterID`),
  KEY `FK_timetablemaster_periodmaster` (`PeriodMasterID`),
  CONSTRAINT `FK_timetablemaster_classmaster` FOREIGN KEY (`ClassMasterID`) REFERENCES `classmaster` (`ClassMasterPublicID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_timetablemaster_periodmaster` FOREIGN KEY (`PeriodMasterID`) REFERENCES `periodmaster` (`PeriodMasterID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.timetablemaster: ~23 rows (approximately)
/*!40000 ALTER TABLE `timetablemaster` DISABLE KEYS */;
INSERT IGNORE INTO `timetablemaster` (`TimeTableMasterID`, `ClassMasterID`, `PeriodMasterID`, `TimeFrom`, `TimeTo`, `IsActive`, `UpdatedBy`, `UpdatedOn`) VALUES
	(1, 'CLAS0000000004', 1, '08:00:00', '09:00:00', '1', 'sys', '2021-06-27 12:54:50'),
	(5, 'CLAS0000000004', 2, '09:00:00', '10:00:00', '1', 'sys', '2021-06-27 13:11:54'),
	(6, 'CLAS0000000004', 3, '10:00:00', '11:00:00', '1', 'sys', '2021-06-27 13:12:03'),
	(7, 'CLAS0000000004', 4, '11:00:00', '12:00:00', '1', 'sys', '2021-06-27 13:12:15'),
	(8, 'CLAS0000000005', 1, '08:00:00', '09:00:00', '1', 'sys', '2021-06-27 13:12:26'),
	(9, 'CLAS0000000005', 2, '10:00:00', '13:00:00', '1', 'sys', '2021-06-27 13:12:37'),
	(10, 'CLAS0000000004', 5, '12:00:00', '13:00:00', '1', 'SYS', '2021-06-28 04:45:16'),
	(12, 'CLAS0000000005', 3, '10:00:00', '11:00:00', '1', 'sys', '2021-07-03 13:17:25'),
	(13, 'CLAS0000000005', 4, '11:00:00', '12:00:00', '1', 'sys', '2021-07-03 13:17:59'),
	(37, 'CLAS00000000067', 1, '08:00:00', '09:00:00', '1', 'ta', '2021-10-14 09:08:39'),
	(38, 'CLAS00000000067', 2, '09:00:00', '10:00:00', '1', 'ta', '2021-10-14 09:08:49'),
	(39, 'CLAS00000000067', 3, '10:00:00', '11:00:00', '1', 'ta', '2021-10-14 09:09:45'),
	(40, 'CLAS00000000067', 4, '11:00:00', '12:00:00', '1', 'ta', '2021-10-14 09:10:00'),
	(41, 'CLAS00000000067', 5, '12:00:00', '13:00:00', '1', 'ta', '2021-10-18 07:12:22'),
	(42, 'CLAS00000000068', 9, '08:00:00', '09:00:00', '1', 'ali_admin', '2021-10-18 11:38:46'),
	(43, 'CLAS00000000068', 10, '09:00:00', '10:00:00', '1', 'ali_admin', '2021-10-18 11:38:56'),
	(46, 'CLAS00000000068', 11, '10:00:00', '11:00:00', '1', 'ali_admin', '2021-10-18 11:40:02'),
	(47, 'CLAS00000000068', 12, '11:00:00', '12:00:00', '1', 'ali_admin', '2021-10-18 11:40:15'),
	(48, 'CLAS00000000068', 13, '14:00:00', '15:00:00', '1', 'ali_admin', '2022-03-27 03:25:18'),
	(49, 'CLAS00000000076', 14, '08:00:00', '09:00:00', '1', 'Madmin', '2022-04-30 19:35:55'),
	(50, 'CLAS00000000076', 15, '09:00:00', '10:00:00', '1', 'Madmin', '2022-04-30 19:36:11'),
	(51, 'CLAS00000000076', 16, '11:00:00', '11:00:00', '1', 'Madmin', '2022-04-30 19:36:31'),
	(52, 'CLAS00000000076', 17, '12:00:00', '13:00:00', '1', 'Madmin', '2022-04-30 19:37:48');
/*!40000 ALTER TABLE `timetablemaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.titlemaster
DROP TABLE IF EXISTS `titlemaster`;
CREATE TABLE IF NOT EXISTS `titlemaster` (
  `TitleMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `LongName` varchar(50) DEFAULT NULL,
  `ShortName` varchar(10) DEFAULT NULL,
  `isActive` char(1) DEFAULT '0',
  PRIMARY KEY (`TitleMasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.titlemaster: ~4 rows (approximately)
/*!40000 ALTER TABLE `titlemaster` DISABLE KEYS */;
INSERT IGNORE INTO `titlemaster` (`TitleMasterID`, `LongName`, `ShortName`, `isActive`) VALUES
	(1, 'Mister', 'Mr', '1'),
	(2, 'Miss', 'Miss', '1'),
	(3, 'Mrs', 'Mrs', '1'),
	(4, 'Ms', 'Ms', '1');
/*!40000 ALTER TABLE `titlemaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.userdetails
DROP TABLE IF EXISTS `userdetails`;
CREATE TABLE IF NOT EXISTS `userdetails` (
  `UserDetailsID` int(11) NOT NULL AUTO_INCREMENT,
  `UserDetailsPublicID` varchar(100) NOT NULL,
  `UserMasterID` varchar(100) NOT NULL,
  `PositionID` varchar(50) NOT NULL,
  `DepartmentID` varchar(50) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `AddedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL,
  PRIMARY KEY (`UserDetailsID`) USING BTREE,
  UNIQUE KEY `TeacherDetailsPublicID` (`UserDetailsPublicID`) USING BTREE,
  KEY `FK_userdetails_usermaster` (`UserMasterID`),
  CONSTRAINT `FK_userdetails_usermaster` FOREIGN KEY (`UserMasterID`) REFERENCES `usermaster` (`PublicID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.userdetails: ~10 rows (approximately)
/*!40000 ALTER TABLE `userdetails` DISABLE KEYS */;
INSERT IGNORE INTO `userdetails` (`UserDetailsID`, `UserDetailsPublicID`, `UserMasterID`, `PositionID`, `DepartmentID`, `UpdatedBy`, `UpdatedOn`, `AddedOn`, `IsActive`) VALUES
	(26, 'URDI0000000001', 'ACCO0000000004', '6', '42', 'h', '2022-01-16 04:38:27', '2022-01-16 04:38:27', '1'),
	(27, 'URDI0000000002', 'ACCO0000000006', '6', '42', 'h', '2022-01-16 04:47:28', '2022-01-16 04:47:28', '1'),
	(28, 'URDI0000000003', 'ACCO0000000007', '6', '42', 'h', '2022-01-16 04:48:47', '2022-01-16 04:48:47', '1'),
	(29, 'URDI0000000004', 'ACCO0000000008', '6', '42', 'h', '2022-01-16 04:49:56', '2022-01-16 04:49:56', '1'),
	(30, 'URDI0000000005', 'ACCO0000000009', '6', '42', 'h', '2022-01-16 04:50:35', '2022-01-16 04:50:35', '1'),
	(31, 'URDI0000000006', 'ACCO00000000011', '6', '42', 'it', '2022-01-16 05:47:28', '2022-01-16 05:47:28', '1'),
	(32, 'URDI0000000007', 'ITAD00000000025', '7', '43', 'it', '2022-03-19 07:13:54', '2022-03-19 06:28:35', '1'),
	(33, 'URDI0000000000', 'ITADM00001', '7', '43', 'it', '2022-03-19 09:38:42', '2022-03-19 07:29:11', '1'),
	(34, '', 'ACCO00001', '6', '42', 'it', '2022-03-19 09:38:37', '2022-03-19 09:38:37', '1'),
	(35, 'URDI0000000008', 'ACCO00000000012', '6', '45', 'Madmin', '2022-04-13 00:17:09', '2022-04-13 00:17:09', '1');
/*!40000 ALTER TABLE `userdetails` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.usermaster
DROP TABLE IF EXISTS `usermaster`;
CREATE TABLE IF NOT EXISTS `usermaster` (
  `UserMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `PublicID` varchar(20) NOT NULL,
  `ProfilPicURL` varchar(200) NOT NULL DEFAULT '../../uploads/defult.png',
  `NRC` varchar(10) DEFAULT NULL,
  `Passport` varchar(50) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(400) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `OtherName` varchar(50) DEFAULT NULL,
  `EmailAddress` varchar(100) DEFAULT NULL,
  `ContactNo` varchar(13) DEFAULT NULL,
  `GenderID` int(1) NOT NULL,
  `MaritalStatusID` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `UserTypeID` int(11) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `LoginAttempts` char(1) NOT NULL DEFAULT '0',
  `IsLocked` char(1) NOT NULL DEFAULT '0',
  `TenantID` varchar(400) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserMasterID`),
  UNIQUE KEY `UserName` (`UserName`,`TenantID`) USING BTREE,
  UNIQUE KEY `PublicID` (`PublicID`,`TenantID`) USING BTREE,
  KEY `FK_usermaster_usertypemaster` (`UserTypeID`),
  KEY `FK_usermaster_maritalstatusmaster` (`MaritalStatusID`),
  KEY `FK_usermaster_gendermaster` (`GenderID`),
  KEY `FK_usermaster_tenantmaster` (`TenantID`),
  CONSTRAINT `FK_usermaster_gendermaster` FOREIGN KEY (`GenderID`) REFERENCES `gendermaster` (`GenderMasterID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_usermaster_maritalstatusmaster` FOREIGN KEY (`MaritalStatusID`) REFERENCES `maritalstatusmaster` (`MaritalStatusMasterID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_usermaster_tenantmaster` FOREIGN KEY (`TenantID`) REFERENCES `tenantmaster` (`TenantID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_usermaster_usertypemaster` FOREIGN KEY (`UserTypeID`) REFERENCES `usertypemaster` (`UserTypeMasterID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.usermaster: ~39 rows (approximately)
/*!40000 ALTER TABLE `usermaster` DISABLE KEYS */;
INSERT IGNORE INTO `usermaster` (`UserMasterID`, `PublicID`, `ProfilPicURL`, `NRC`, `Passport`, `UserName`, `Password`, `FirstName`, `LastName`, `OtherName`, `EmailAddress`, `ContactNo`, `GenderID`, `MaritalStatusID`, `DOB`, `UserTypeID`, `UpdatedBy`, `UpdatedOn`, `IsActive`, `LoginAttempts`, `IsLocked`, `TenantID`) VALUES
	(1, 'TECH0000000001', '../../uploads/defult.png', '55445/16/1', 'cc', 'h', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Head', 'System', 'Teacher', 'prototype1496@gmail.com', '988755487', 1, 4, '1997-01-02', 3, 'it', '2019-11-14 08:56:25', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(2, 'TECH0000000003', '../../uploads/defult.png', '515151/8/8', '74444/45/45', 't', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Alinuswe', 'Mwandobo', NULL, 'alinuswemwandobo@gmail.com', '977100587', 1, 1, '1996-01-01', 3, 'it', '2020-11-20 11:52:45', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(5, 'ADMIN00001', '../../uploads/defult.png', NULL, NULL, 'a', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'System', 'Admin', NULL, 'sys@gmail.com', '097758568', 1, 4, '2021-06-18', 1, 'sys', '2021-06-18 11:00:21', '1', '0', '0', '3edu_29294e8-f7a1-11eb-a81c-1062e5c23520'),
	(7, 'ITADM00001', '../../uploads/defult.png', NULL, NULL, 'it', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'IT', 'Admin', NULL, NULL, NULL, 1, 4, '2021-08-07', 4, 'sys', '2021-08-07 08:22:21', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(8, 'SDNT00000000031', '../../uploads/defult.png', NULL, NULL, 'SN2021036', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Student', 'X', 'Mwando', NULL, NULL, 1, 4, '1996-01-01', 2, 'it', '2021-08-07 17:49:45', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(9, 'SDNT00000000032', '../../uploads/defult.png', NULL, NULL, 'SN202137', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Test J', 'John', NULL, NULL, NULL, 1, 4, '2000-12-31', 2, 'it', '2021-08-07 18:31:50', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(11, 'SDNT00000000000', '../../uploads/defult.png', NULL, NULL, 'SN202137', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'D', 'F', NULL, NULL, NULL, 2, 3, '2021-08-07', 2, 'it', '2021-08-07 19:06:06', '1', '0', '0', 'a29294e8-f7a1-11eb-a81c-1062e5c23529'),
	(14, 'SDNT00000000035', '../../uploads/defult.png', NULL, NULL, 'SN2021040', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Tenant', 'Tenat Nwe', NULL, NULL, NULL, 1, 1, '1996-01-01', 2, 'it', '2021-08-08 07:45:28', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(27, 'TECH00000000079', '../../uploads/defult.png', '515151/16/', '55455', 'alinuswemwandobo@gmail.com', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Alinuwe', 'Mwandobo', 'Mwando', 'prototype1496@gmail.com', '0977100587', 1, 2, '1996-01-01', 3, 'it', '2021-08-21 18:02:09', '1', '0', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(28, 'TECH00000000080', '../../uploads/teacher_profile/TECH00000000080_Screenshot 2021-08-20 211428.png', '515151/8/8', '74444/45/40', 'TES', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Sannuel', 'Banda', 'Mwando', 'prototype1496@gmail.com', '0977100587', 1, 2, '1196-01-01', 3, 'it', '2021-08-21 18:05:08', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(39, 'TECH00000000091', '../../uploads/defult.png', '515151/8/8', NULL, 'thisisatest', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Emmanuel', 'Mwando', NULL, 'prototype14926@gmail.com', '0977100580', 1, 1, '1996-01-01', 3, 'it', '2021-08-23 09:31:52', '0', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(43, 'ITAD00000000021', '../../uploads/it_profile/ITAD00000000021_lady.png', '5151051/8/', '744440/45/40', 'TESTadmin', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Test', 'Test', 'Tt', 'prTototype1496@gmail.com', '0977100587', 1, 4, '1996-10-31', 4, 'a', '2021-09-14 14:42:34', '0', '0', '0', 'TES614098baeb6188.42391041'),
	(45, 'ITAD00000000023', '../../uploads/it_profile/ITAD00000000021_lady.png', '5150051/8/', '744340/45/40', 'ta', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Test', 'Test', 'Tt', 'priototype1496@gmail.com', '0977100587', 1, 4, '1996-10-31', 4, 'a', '2021-09-14 15:51:02', '1', '0', '0', 'rrr6140a8c632d934.43595166'),
	(49, 'TECH000000000101', '../../uploads/teacher_profile/TECH000000000101_marcal.jpg', '515151/81/', NULL, 'Mwaka', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Mwaka', 'Vwalika', NULL, 'Mwaka@gmail.com', '0977100586', 2, 4, '1996-01-01', 3, 'ta', '2021-10-10 15:12:00', '1', '0', '0', 'rrr6140a8c632d934.43595166'),
	(50, 'TECH000000000102', '../../uploads/teacher_profile/TECH000000000102_marcal.jpg', '515151/81/', NULL, 'MwakaV', '$2y$10$NEEvM3ov25/vIfLDPgMiwe.0MlQv.OIA8DPs7cHcai59rvHtg.3se', 'Mwaka', 'Vwalika', NULL, 'Mwaka@gmail.com', '0977100588', 2, 4, '1996-01-01', 3, 'ta', '2021-10-10 15:13:52', '0', '0', '0', 'rrr6140a8c632d934.43595166'),
	(51, 'TECH000000000103', '../../uploads/defult.png', '5542555/18', NULL, 'Helen', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Hellen', 'Phiri', NULL, 'heramaureenscents@gmail.com', '0977100588', 2, 2, '1996-02-08', 3, 'ta', '2021-10-12 12:27:32', '1', '0', '0', 'rrr6140a8c632d934.43595166'),
	(52, 'SDNT00000000036', '../../uploads/defult.png', NULL, NULL, 'SN2021041', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Liko', 'Mwnza', NULL, NULL, NULL, 2, 4, '2003-01-01', 2, 'ta', '2021-10-14 17:46:42', '1', '0', '0', 'rrr6140a8c632d934.43595166'),
	(53, 'SDNT00000000037', '../../uploads/defult.png', NULL, NULL, 'SN2021042', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Muke', 'Mambwe', NULL, NULL, NULL, 2, 4, '2003-01-01', 2, 'Mwaka', '2021-10-14 17:48:40', '0', '0', '0', 'rrr6140a8c632d934.43595166'),
	(54, 'SDNT00000000038', '../../uploads/defult.png', NULL, NULL, 'SN2021043', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Vilkinga', 'Makayi', NULL, NULL, NULL, 2, 4, '2003-01-01', 2, 'Mwaka', '2021-10-14 17:49:55', '0', '0', '0', 'rrr6140a8c632d934.43595166'),
	(55, 'ITAD00000000024', '../../uploads/it_profile/ITAD00000000024_images.png', NULL, '74444/45/40', 'ali_admin', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Alinuswe', 'Mwandobo', 'Boston', 'alinuswemwandobo@gmail.com', '09756666666', 1, 4, '1996-10-31', 4, 'a', '2021-10-18 10:21:53', '1', '0', '0', 'Ama616d2ea1a78213.69918222'),
	(56, 'TECH000000000104', '../../uploads/teacher_profile/TECH000000000104_marcal.jpg', '515151/8/8', NULL, 'nakamba', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Nakamba', 'Nonde', NULL, 'nakmaba.node@gmsil.com', '0977100586', 2, 1, '1996-01-01', 3, 'ali_admin', '2021-10-18 10:42:04', '1', '0', '0', 'Ama616d2ea1a78213.69918222'),
	(57, 'SDNT00000000039', '../../uploads/defult.png', NULL, NULL, 'SN2021044', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Minza', 'Munati', NULL, NULL, NULL, 1, 4, '2003-12-31', 2, 'ali_admin', '2021-10-18 11:36:10', '1', '0', '0', 'Ama616d2ea1a78213.69918222'),
	(58, 'TECH000000000105', '../../uploads/defult.png', '515151/8/8', NULL, 'alinuani', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Alinanu', 'Mwaza', NULL, 'heramaureenscents@gmail.com', '0977100588', 1, 1, '1996-12-31', 3, 'ali_admin', '2021-10-18 11:56:49', '1', '0', '0', 'Ama616d2ea1a78213.69918222'),
	(63, 'ACCO00001', '../../uploads/defult.png', NULL, NULL, 'acc', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'School ', 'Accountant', NULL, 'acc@gmail.com', '0975688416', 1, 4, '1996-01-01', 5, 'it', '2021-11-27 16:16:29', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(66, 'ACCO0000000004', '../../uploads/acc_profile/ACCO0000000004_marcal.jpg', '6515151/16', '744444/45/40', 'acc_test', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'ACC', 'TEST', 'T', 'prototype1496@gmail.com', '0977100587', 1, 2, '2022-01-16', 5, 'h', '2022-01-16 04:38:27', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(67, 'ACCO0000000006', '../../uploads/defult.png', '65155151/1', '744444/45/40', 'acc_test2', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'ACC2', 'TEST2', 'T', 'prototype1496@gmail.com', '0977100587', 1, 3, '2022-01-16', 5, 'h', '2022-01-16 04:47:28', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(68, 'ACCO0000000007', '../../uploads/defult.png', '665155151/', '7444644/45/40', 'acc_test3', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'ACC3', 'TEST2', 'T', 'prototype1496@gmail.com', '0977100587', 1, 3, '2022-01-16', 5, 'h', '2022-01-16 04:48:47', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(69, 'ACCO0000000008', '../../uploads/defult.png', '665e155151', '74e44644/45/40', 'acc_test6', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'ACC4', 'TEST2', 'T', 'prototype1496@gmail.com', '0977100587', 1, 3, '2022-01-16', 5, 'h', '2022-01-16 04:49:56', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(70, 'ACCO0000000009', '../../uploads/defult.png', '6654e15515', '74e444644/45/40', 'acc_test7', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'ACC7', 'TEST2', 'T', 'prototype1496@gmail.com', '0977100587', 1, 3, '2022-01-16', 5, 'h', '2022-01-16 04:50:34', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(72, 'ACCO00000000011', '../../uploads/acc_profile/ACCO00000000011_images.png', '55515151/1', NULL, 'ACC99', '$2y$10$gpf/4KYfEUmVmsj1i9mV4OgB7b82wu3KYUK7kHvOwm8Zgd1qZg0Gu', 'Ali', 'ACC', NULL, 'prototype1496@gmail.com', '0977100586', 2, 4, '2022-01-07', 5, 'it', '2022-01-16 05:47:28', '0', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(73, 'ITAD00000000025', '../../uploads/defult.png', '515151/17/', '74444/45/40', 'thittest', '$2y$10$vfbiJ8BxdqAiCHHfOd6/ROZX1zeSilEvCzAaWG8uTEYYgAWY.fJz6', 'uhb', 'bjhj', 'hjb', 'prototy8pe1496@gmail.com', '0977100586', 1, 1, '1996-01-01', 4, 'it', '2022-03-19 06:28:35', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(74, 'ITAD00000000026', '../../uploads/it_profile/ITAD00000000026_Profile193826187.jpg', '339006010', 'ZN20231453', 'Madmin', '$2y$10$GDxjqf3ApsEeLdHm0/x2S.0ErqEILtlUaUNGObDY1m2a1myg0sb6K', 'Ali', 'Mwanza', NULL, 'alimwanza@gmail.com', '+260971145253', 1, 4, '2022-04-11', 4, 'a', '2022-04-12 23:58:42', '1', '0', '0', 'Thr6255f612d73866.53144529'),
	(75, 'TECH000000000106', '../../uploads/teacher_profile/TECH000000000106_test teacher.png', '339006010', 'ZN20231453', 'Nyambe', '$2y$10$5PEVpYyk6EorqxCk2CFe8.fNPbfCH4/xMXR/j1o2VmWgxWVD4L9WO', 'Nyambe', 'Mubukwanu', NULL, 'alimwanza@gmail.com', '+260971145253', 1, 4, '2022-04-13', 3, 'Madmin', '2022-04-13 00:11:11', '1', '0', '0', 'Thr6255f612d73866.53144529'),
	(76, 'TECH000000000107', '../../uploads/teacher_profile/TECH000000000107_Tupa Profile.jpg', '339006010', 'ZN20231453', 'Tupa', '$2y$10$yWDCZYuCDrJBqxnUYeUNee7UQ.4c3YskE2teQuZNt.mWA/UH42Ik2', 'Tupa', 'Mukamba', NULL, 'alimwanza@gmail.com', '+260971145253', 1, 4, '2022-04-13', 3, 'Madmin', '2022-04-13 00:13:51', '1', '0', '0', 'Thr6255f612d73866.53144529'),
	(77, 'ACCO00000000012', '../../uploads/acc_profile/ACCO00000000012_Sandra194944234.jfif', '339006010', 'ZN20231453', 'Accounts', '$2y$10$.AcQF65JqeCUiA7zzDKS/ej.kvBSChhvAPY3vihvdShRfCP3YoUMG', 'Sandra', 'Lungu', NULL, 'alimwanza@gmail.com', '+260971145253', 2, 4, '2022-04-13', 5, 'Madmin', '2022-04-13 00:17:09', '1', '0', '0', 'Thr6255f612d73866.53144529'),
	(78, 'SDNT00000000040', '../../uploads/defult.png', NULL, NULL, 'SN2022045', '$2y$10$tp3hdh1CBLqC/4Q0wGXYHeJBBNz/GonqBLNwIOALffpaRIL/BXbnO', 'Tokozani', 'Lungu', NULL, NULL, NULL, 1, 4, '2022-04-13', 2, 'Madmin', '2022-04-13 00:22:31', '1', '0', '0', 'Thr6255f612d73866.53144529'),
	(79, 'SDNT00000000041', '../../uploads/defult.png', NULL, NULL, 'SN2022046', '$2y$10$ra/kOeiaK7t3NV6JrEotTOmNe8W4JZtk2F.Z7PvddgeSjH.StgJL6', 'Thandi', 'Zimba', NULL, NULL, NULL, 2, 4, '2022-04-11', 2, 'Madmin', '2022-04-13 00:23:42', '1', '0', '0', 'Thr6255f612d73866.53144529'),
	(80, 'SDNT00000000042', '../../uploads/defult.png', NULL, NULL, 'SN2022047', '$2y$10$WhV9Fg.t7M8cdkVl.XLIPe869lLGvgSXyZnEsncrC5QQSFd0YYs..', 'Luka', 'Nyrenda', NULL, NULL, NULL, 1, 4, '2022-04-11', 2, 'Madmin', '2022-04-13 00:25:13', '1', '0', '0', 'Thr6255f612d73866.53144529'),
	(81, 'SDNT00000000043', '../../uploads/defult.png', NULL, NULL, 'SN2022048', '$2y$10$XXPBb.sTnXW59o36aUBaIONTvVSdTgK/t61QR6vqDK/00fbtkeboa', 'Francis', 'Lili', NULL, NULL, NULL, 1, 4, '2022-04-12', 2, 'Madmin', '2022-04-13 00:40:58', '1', '0', '0', 'Thr6255f612d73866.53144529');
/*!40000 ALTER TABLE `usermaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.usertypemaster
DROP TABLE IF EXISTS `usertypemaster`;
CREATE TABLE IF NOT EXISTS `usertypemaster` (
  `UserTypeMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `UserType` varchar(20) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserTypeMasterID`),
  UNIQUE KEY `UserType` (`UserType`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.usertypemaster: ~5 rows (approximately)
/*!40000 ALTER TABLE `usertypemaster` DISABLE KEYS */;
INSERT IGNORE INTO `usertypemaster` (`UserTypeMasterID`, `UserType`, `IsActive`) VALUES
	(1, 'Admin', '1'),
	(2, 'Student', '1'),
	(3, 'Teacher', '1'),
	(4, 'ITAdmin', '1'),
	(5, 'Acountant', '1');
/*!40000 ALTER TABLE `usertypemaster` ENABLE KEYS */;

-- Dumping structure for view 3edu_db.vwsequncemaster
DROP VIEW IF EXISTS `vwsequncemaster`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vwsequncemaster` (
	`SequenceMasterID` INT(11) NOT NULL,
	`SequnceCode` CHAR(4) NOT NULL COLLATE 'latin1_swedish_ci',
	`LastInsertedID` INT(11) NOT NULL,
	`UpdatedOn` DATETIME NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for procedure 3edu_db.ActivateUser
DROP PROCEDURE IF EXISTS `ActivateUser`;
DELIMITER //
CREATE PROCEDURE `ActivateUser`(IN `UserMasterID_` INT)
BEGIN
			DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		     SELECT 0 AS message;
		     ROLLBACK;
		END;
		
		SET @PUBLCID  = (SELECT UM.PublicID FROM usermaster UM WHERE UM.UserMasterID = UserMasterID_);
		
		UPDATE teachermaster SET `IsActive` = 1 WHERE PublicUserID = @PUBLCID;
		UPDATE usermaster  SET `IsActive` = 1 , `Password` = '$2y$10$JL396wwdluH7joCFCxZ8ceWJDwbanf4DycWODBtuhokcw.gqRKz1y' WHERE `UserMasterID` = UserMasterID_ ;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.DeactivateUser
DROP PROCEDURE IF EXISTS `DeactivateUser`;
DELIMITER //
CREATE PROCEDURE `DeactivateUser`(IN `UserMasterID_` INT)
BEGIN
			DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		     SELECT 0 AS message;
		     ROLLBACK;
		END;
		
		SET @PUBLCID  = (SELECT UM.PublicID FROM usermaster UM WHERE UM.UserMasterID = UserMasterID_);
		
		UPDATE teachermaster SET `IsActive` = 0 WHERE PublicUserID = @PUBLCID;
		UPDATE usermaster  SET `IsActive` = 0 , `Password` = 'DEACTIVATED' WHERE `UserMasterID` = UserMasterID_ ;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAccessmentByStudentPublicID
DROP PROCEDURE IF EXISTS `GetAccessmentByStudentPublicID`;
DELIMITER //
CREATE PROCEDURE `GetAccessmentByStudentPublicID`(IN `STUDENTPUBLICID` VARCHAR(100))
BEGIN
		SELECT   STA.StudnetAssesmenID																									AS 'PublicID',
					STM.StudentNo																												AS 'StudentNo',
					CONCAT(STM.FirstName,IF(STM.OtherName IS NULL,' ',CONCAT(' ',STM.OtherName,' ')),STM.LastName )	AS 'Name',
					CONCAT(CM.ClassName,' (',CM.ClassCode,')')																		AS 'ClassName',
				   CONCAT(SM.SubjectName,' (',SM.SubjectCode,')')																	AS 'Subject',
					CONCAT(ASTM.AssementTypeName, ' (',STA.AssecementName,')')													AS 'AssecementName',
					CONCAT(STA.Score,' %')																									AS 'Score',
				   DATE_FORMAT(STA.UpdatedOn, "%d %b, %Y") 					   												   AS 'MarkedOn'
				   
					
		FROM studnetassesment STA
		JOIN studentmaster STM ON STM.StudentMasterPublicID = STA.StudentMasterPublicID 
		JOIN assementtypemaster ASTM ON ASTM.AssementTypeID = STA.AssecemntTypeMasterID
		
		JOIN classmaster CM ON CM.ClassMasterPublicID = STA.ClassMasterPublicID AND STM.StudentMasterPublicID = STUDENTPUBLICID
		JOIN subjectmater SM ON SM.SubjectMaterID = STA.SubjectMasterID
		ORDER BY CM.GradeMasterID, SM.SubjectName,STA.AddedOn ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAccessmentByStudentPublicIDAndAssecmentTypeID
DROP PROCEDURE IF EXISTS `GetAccessmentByStudentPublicIDAndAssecmentTypeID`;
DELIMITER //
CREATE PROCEDURE `GetAccessmentByStudentPublicIDAndAssecmentTypeID`(
	IN `STUDENTPUBLICID` VARCHAR(100),
	IN `AssecemntTypeMasterID_` INT,
	IN `date` DATE
)
BEGIN
	SELECT   STA.StudnetAssesmenID																									AS 'PublicID',
					STM.StudentNo																												AS 'StudentNo',
					CONCAT(STM.FirstName,IF(STM.OtherName IS NULL,' ',CONCAT(' ',STM.OtherName,' ')),STM.LastName )	AS 'Name',
					CONCAT(CM.ClassName,' (',CM.ClassCode,')')																		AS 'ClassName',
				   CONCAT(SM.SubjectName,' (',SM.SubjectCode,')')																	AS 'Subject',
					CONCAT(ASTM.AssementTypeName, ' (',STA.AssecementName,')')													AS 'AssecementName',
					CONCAT(STA.Score,' %')																									AS 'Score',
				   DATE_FORMAT(STA.UpdatedOn, "%d %b, %Y") 					   												   AS 'MarkedOn'
				   
					
		FROM studnetassesment STA
		JOIN studentmaster STM ON STM.StudentMasterPublicID = STA.StudentMasterPublicID 
		JOIN assementtypemaster ASTM ON ASTM.AssementTypeID = AssecemntTypeMasterID_
		
		JOIN classmaster CM ON CM.ClassMasterPublicID = STA.ClassMasterPublicID AND STM.StudentMasterPublicID = STUDENTPUBLICID
		JOIN subjectmater SM ON SM.SubjectMaterID = STA.SubjectMasterID
		ORDER BY CM.GradeMasterID, SM.SubjectName,STA.AddedOn ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAccessmentTypeByID
DROP PROCEDURE IF EXISTS `GetAccessmentTypeByID`;
DELIMITER //
CREATE PROCEDURE `GetAccessmentTypeByID`(
	IN `TenantID_` VARCHAR(500),
	IN `AssementTypeID_` INT
)
BEGIN
SELECT * FROM assementtypemaster ACS WHERE ACS.TenantID =TenantID_ AND ACS.AssementTypeID = AssementTypeID_;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetActiveTermByID
DROP PROCEDURE IF EXISTS `GetActiveTermByID`;
DELIMITER //
CREATE PROCEDURE `GetActiveTermByID`(IN `TenantID_` VARCHAR(500))
BEGIN
			SELECT TM.TermMasterID 'TermMasterID',
					 TM.TenantID		'TenantID',
					 TM.TermName		'TermName',
					 TM.IsSysActive 	'IsSysActive'
			FROM termmaster TM WHERE TM.TenantID = TenantID_ AND  TM.IsActive ORDER BY TM.IsSysActive ASC,TM.TermName ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllActiveAssecmentTypesBYTenantID
DROP PROCEDURE IF EXISTS `GetAllActiveAssecmentTypesBYTenantID`;
DELIMITER //
CREATE PROCEDURE `GetAllActiveAssecmentTypesBYTenantID`(IN `TenanantID_` VARCHAR(300))
BEGIN
	SELECT 	 ATM.AssementTypeID 						AS 'AssementTypeID',
				 ATM.AssementTypeName   				AS 'AssementTypeName',
				 IF (ATM.IsActive = 1,'Yes','No')	AS  'Active'
				 
	FROM assementtypemaster ATM WHERE ATM.TenantID=TenanantID_ ORDER BY  ATM.IsActive DESC, ATM.TenantID ASC,ATM.AssementTypeName ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllActiveClasses
DROP PROCEDURE IF EXISTS `GetAllActiveClasses`;
DELIMITER //
CREATE PROCEDURE `GetAllActiveClasses`(IN `TenantID` VARCHAR(400))
BEGIN
SELECT   CM.ClassMasterPublicID																											AS 'ClassMasterPublicID',
			CM.GradeMasterID																													AS 'ClassName',
			CONCAT(CM.ClassName, ' (',CM.ClassCode,')') 																				AS 'Class',	
		   	IF(CM.Description IS NULL,'--',CM.Description)																		AS 'Description',
			DATE_FORMAT(CM.AddedOn, "%d %b, %Y")																						AS 'AddOn',
			CONCAT(UM.FirstName,IF(UM.OtherName IS NULL,' ',CONCAT(' ',UM.OtherName,' ')),	UM.LastName ) 			AS 'UpdatedBy',
			CONCAT(TUM.FirstName,IF(TUM.OtherName IS NULL,' ',CONCAT(' ',TUM.OtherName,' ')),	TUM.LastName )  	AS 'TeacherName'
			
FROM classmaster CM 
JOIN usermaster UM ON UM.UserName = CM.UpdatedBy
JOIN usermaster TUM ON TUM.PublicID = CM.ClassTeacherID
WHERE CM.IsActive = 1 AND CM.TenantID = TenantID ORDER BY CM.GradeMasterID ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllActivePeriods
DROP PROCEDURE IF EXISTS `GetAllActivePeriods`;
DELIMITER //
CREATE PROCEDURE `GetAllActivePeriods`(IN `SchoolID` VARCHAR(50))
BEGIN
		SELECT PM.PeriodMasterID,
				 PM.PeriodName 
		FROM periodmaster PM WHERE PM.IsActive = 1 AND PM.SchoolID = SchoolID ORDER BY PM.SequenceID, PM.PeriodName ASC ;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllActivesGradesByTenantID
DROP PROCEDURE IF EXISTS `GetAllActivesGradesByTenantID`;
DELIMITER //
CREATE PROCEDURE `GetAllActivesGradesByTenantID`(IN `TenantID` VARCHAR(400))
BEGIN
SELECT GM.GradeMasterID		AS 'GradeMasterID',
		 GM.Grade				AS 'Grade',
		 GM.IsActive			AS 'IsActive'
FROM grademaster GM WHERE GM.IsActive =1 AND GM.TenantID = TenantID;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllActiveTermsByTenantID
DROP PROCEDURE IF EXISTS `GetAllActiveTermsByTenantID`;
DELIMITER //
CREATE PROCEDURE `GetAllActiveTermsByTenantID`(IN `TenantID_` VARCHAR(100))
BEGIN
		SELECT TM.TermMasterID		'TermMasterID',
				 TM.TenantID		'TenantID',
				 TM.TermName		'TermName',
				 TM.IsSysActive   'IsSysActive',
				 TM.IsActive      'Active'
		FROM termmaster TM 
		WHERE TM.TenantID = TenantID_ AND TM.IsActive = 1;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllClasses
DROP PROCEDURE IF EXISTS `GetAllClasses`;
DELIMITER //
CREATE PROCEDURE `GetAllClasses`()
BEGIN
SELECT CM.ClassMasterPublicID,
			CM.GradeMasterID ,
			CONCAT(CM.ClassName, ' (',CM.ClassCode,')') AS Class

FROM classmaster CM WHERE CM.IsActive = 1 ORDER BY CM.GradeMasterID ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllClassesByGradeID
DROP PROCEDURE IF EXISTS `GetAllClassesByGradeID`;
DELIMITER //
CREATE PROCEDURE `GetAllClassesByGradeID`(IN `GradeID` INT)
BEGIN
SELECT CM.ClassMasterPublicID,
			CM.GradeMasterID ,
			CONCAT(CM.ClassName, ' (',CM.ClassCode,')') AS Class

FROM classmaster CM WHERE CM.GradeMasterID =GradeID;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllClassesByTenantID
DROP PROCEDURE IF EXISTS `GetAllClassesByTenantID`;
DELIMITER //
CREATE PROCEDURE `GetAllClassesByTenantID`(IN `TenantID` VARCHAR(300))
BEGIN
SELECT CM.ClassMasterPublicID,
			CM.GradeMasterID ,
			CONCAT(CM.ClassName, ' (',CM.ClassCode,')') AS Class

FROM classmaster CM WHERE CM.IsActive = 1 AND CM.TenantID = TenantID ORDER BY CM.GradeMasterID ASC ;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllClassesWithMappedSubjects
DROP PROCEDURE IF EXISTS `GetAllClassesWithMappedSubjects`;
DELIMITER //
CREATE PROCEDURE `GetAllClassesWithMappedSubjects`(IN `TenantID_` VARCHAR(500))
BEGIN
SELECT   CM.ClassMasterPublicID,
			CM.GradeMasterID ,
			CONCAT(CM.ClassName, ' (',CM.ClassCode,')') AS Class

FROM classmaster CM WHERE CM.IsActive = 1 AND CM.TenantID = TenantID_ AND CM.ClassMasterPublicID IN (SELECT CD.ClassMasterPublicID FROM classdetails CD) ORDER BY CM.GradeMasterID ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllDepartmentsByShoolID
DROP PROCEDURE IF EXISTS `GetAllDepartmentsByShoolID`;
DELIMITER //
CREATE PROCEDURE `GetAllDepartmentsByShoolID`(IN `SHOOLID` VARCHAR(50))
BEGIN
		SELECT 	DPT.DepartmentID 													AS 'DepartmentID',
					DPT.DepartmentName												AS 'DepartmentName',
					DPT.ShortHand														AS 'ShortHand',
					CONCAT(DPT.DepartmentName,' (',DPT.ShortHand,')') 		AS 'Department',
					DPT.SchoolMasterID												AS 'SchoolMasterID' 
		FROM department DPT WHERE DPT.SchoolMasterID = SHOOLID ORDER BY DPT.DepartmentName ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllPeriods
DROP PROCEDURE IF EXISTS `GetAllPeriods`;
DELIMITER //
CREATE PROCEDURE `GetAllPeriods`(IN `CLASSMASTERID_` VARCHAR(50))
BEGIN
		SET @CLASSMASTERID  = CLASSMASTERID_;
		
		SELECT  TM.TimeTableMasterID					      AS 'TimeTableMasterID',
				  TM.ClassMasterID								AS 'ClassMasterID',
				  TM.PeriodMasterID								AS 'PeriodMasterID',
				  PM.PeriodName    								AS 'PeriodName',
				  TIME_FORMAT(TM.TimeFrom,"%H:%i")			AS 'TimeForm',
				  TIME_FORMAT(TM.TimeTo,"%H:%i")				AS 'TimeTo',
				  IF (TM.IsActive = 1,'Yes', 'No')			AS 'Active'	
		FROM timetablemaster TM 
		JOIN periodmaster PM ON PM.PeriodMasterID =  TM.PeriodMasterID 
		WHERE TM.ClassMasterID = @CLASSMASTERID ORDER BY TM.IsActive DESC, TM.PeriodMasterID ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllPeriodsBySchoolID
DROP PROCEDURE IF EXISTS `GetAllPeriodsBySchoolID`;
DELIMITER //
CREATE PROCEDURE `GetAllPeriodsBySchoolID`(
	IN `SchoolID_` VARCHAR(50)
)
BEGIN
      SELECT   PM.PeriodMasterID						AS 'PeriodMasterID',
					PM.PeriodName							AS 'PeriodName',
					PM.SchoolID								AS 'SchoolID',
					PM.SequenceID							AS 'SequenceID',
					IF(PM.IsActive = 1, 'Yes', 'No') AS 'Active'
		FROM periodmaster PM 
		WHERE  PM.SchoolID = SchoolID_ ORDER BY PM.SequenceID, PM.PeriodName ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllSchoolDetails
DROP PROCEDURE IF EXISTS `GetAllSchoolDetails`;
DELIMITER //
CREATE PROCEDURE `GetAllSchoolDetails`()
BEGIN
		SELECT SM.PublicID 				AS 'PublicID',
				 SM.EMISNO	 				AS 'EMISNO',
				 SM.PicURL					AS 'PicURL',
				 SM.SchoolName				AS 'SchoolName',
				 SM.ShortName				AS 'ShortName',
				 SM.SchoolMotto			AS 'SchoolMotto',
				 SM.SchoolURl				AS 'SchoolURl',
				 SM.SchoolDescription	AS 'SchoolDescription',
				 SM.MaxTerms				AS 'MaxTerms',
				 SM.Longitude				AS 'Longitude',
				 SM.Latitude				AS 'Latitude',
				 SM.Tel						AS 'Tel',
				 SM.PhoneNo					AS 'PhoneNo',
				 SM.TenantID				AS 'TenantID',
				 IF(SM.IsActive=1,'Yes','No') AS 'IsActive'
		 
		FROM schoolmaster SM ORDER BY SM.IsActive DESC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllSchoolDetailsBySchoolID
DROP PROCEDURE IF EXISTS `GetAllSchoolDetailsBySchoolID`;
DELIMITER //
CREATE PROCEDURE `GetAllSchoolDetailsBySchoolID`(IN `SCHOOLPUBLICID` VARCHAR(50))
BEGIN
		SELECT SM.PublicID 				AS 'PublicID',
				 SM.EMISNO	 				AS 'EMISNO',
				 SM.PicURL					AS 'PicURL',
				 SM.SchoolName				AS 'SchoolName',
				 SM.ShortName				AS 'ShortName',
				 SM.SchoolMotto			AS 'SchoolMotto',
				 SM.SchoolURl				AS 'SchoolURl',
				 SM.SchoolDescription	AS 'SchoolDescription',
				 SM.MaxTerms				AS 'MaxTerms',
				 SM.Longitude				AS 'Longitude',
				 SM.Latitude				AS 'Latitude',
				 SM.Tel						AS 'Tel',
				 SM.PhoneNo					AS 'PhoneNo',
				 SM.TenantID				AS 'TenantID',
				 IF(SM.IsActive=1,'Yes','No') AS 'IsActive'
		 
		FROM schoolmaster SM WHERE SM.PublicID =  SCHOOLPUBLICID;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllStudentDetails
DROP PROCEDURE IF EXISTS `GetAllStudentDetails`;
DELIMITER //
CREATE PROCEDURE `GetAllStudentDetails`(IN `TenantID` VARCHAR(400))
BEGIN
SELECT 	SM.StudentMasterPublicID																													AS 'StudentMasterPublicID',
			SM.StudentNo																																	AS 'PublicID',
			CONCAT(SM.FirstName,IF(SM.OtherName IS NULL,' ',CONCAT(' ',SM.OtherName,' ')),	SM.LastName )						AS 'Name', 
		 	SM.GuardianContactNo																															AS 'ContactNo',
		 	DATE_FORMAT(SM.DOB, "%d %b, %Y")																											AS 'DOB',
		 	SM.Address																																		AS 'Address',
		 	GM.Gender																																		AS 'Gender',
		 	MSM.MaritalStatus																																AS 'MaritalStatus',
		 	SM.GuardianMaleName																															AS 'GuardianMaleName',
		 	SM.GuardianFemaleName																														AS 'GuardianFemaleName',
		 	SM.ProfilePic																																	AS 'ProfilePic'
		 	
FROM studentmaster SM
JOIN gendermaster GM ON GM.GenderMasterID = SM.GenderID
JOIN maritalstatusmaster MSM ON MSM.MaritalStatusMasterID = SM.MaritalStatusID 
JOIN classmaster CM ON CM.ClassMasterPublicID = SM.ClassMasterPublicID WHERE SM.IsActive = 1 AND CM.TenantID = TenantID ORDER BY SM.StudentNo DESC;


END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllStudentDetailsByClassID
DROP PROCEDURE IF EXISTS `GetAllStudentDetailsByClassID`;
DELIMITER //
CREATE PROCEDURE `GetAllStudentDetailsByClassID`(IN `ClassID` VARCHAR(50))
BEGIN
SELECT 	SM.StudentMasterPublicID																													AS 'StudentMasterPublicID',
			SM.StudentNo																																	AS 'PublicID',
			CONCAT(SM.FirstName,IF(SM.OtherName IS NULL,' ',CONCAT(' ',SM.OtherName,' ')),	SM.LastName )						AS 'Name', 
		 	SM.GuardianContactNo																															AS 'ContactNo',
		 	DATE_FORMAT(SM.DOB, "%d %b, %Y")																											AS 'DOB',
		 	SM.Address																																		AS 'Address',
		 	GM.Gender																																		AS 'Gender',
		 	MSM.MaritalStatus																																AS 'MaritalStatus',
		 	SM.GuardianMaleName																															AS 'GuardianMaleName',
		 	SM.GuardianFemaleName																														AS 'GuardianFemaleName',
		 	SM.ProfilePic																																	AS 'ProfilePic'
		 	
FROM studentmaster SM
JOIN gendermaster GM ON GM.GenderMasterID = SM.GenderID
JOIN maritalstatusmaster MSM ON MSM.MaritalStatusMasterID = SM.MaritalStatusID 
JOIN classmaster CM ON CM.ClassMasterPublicID = SM.ClassMasterPublicID WHERE SM.IsActive = 1 AND CM.ClassMasterPublicID = ClassID ORDER BY SM.StudentNo DESC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllStudentDetailsByClassMasterPublicID
DROP PROCEDURE IF EXISTS `GetAllStudentDetailsByClassMasterPublicID`;
DELIMITER //
CREATE PROCEDURE `GetAllStudentDetailsByClassMasterPublicID`(
	IN `CLASSMASTERPUBLICID_` VARCHAR(50),
	IN `ATENDANCYTYPEID_` INT
)
BEGIN
			SET @CLASSMASTERPUBLICID  = CLASSMASTERPUBLICID_;
			SET @AtendancyTypeID  = ATENDANCYTYPEID_;
			
			SELECT 	SM.StudentMasterPublicID																																AS 'StudentMasterPublicID',
						SM.StudentNo																																				AS 'StudentNo',
						CONCAT(SM.FirstName,IF(SM.OtherName IS NULL,' ',CONCAT(' ',SM.OtherName,' ')),	SM.LastName,' (',GM.ShortName,')' )		AS 'NameInfo', 
						CONCAT(SM.StudentNo,'-',SM.FirstName,IF(SM.OtherName IS NULL,' ',CONCAT(' ',SM.OtherName,' ')),	SM.LastName,' (',GM.ShortName,')' )		AS 'NameData',
						CONCAT(SM.FirstName,IF(SM.OtherName IS NULL,' ',CONCAT(' ',SM.OtherName,' ')),	SM.LastName )									AS 'Name', 
						CONCAT(CM.ClassName, ' (',CM.ClassCode,')') 																										AS  'Class',
					 	SM.GuardianContactNo																																		AS 'ContactNo',
					 	DATE_FORMAT(SM.DOB, "%d %b, %Y")																														AS 'DOB',
					 	SM.Address																																					AS 'Address',
					 	GM.Gender																																					AS 'Gender',
					 	MSM.MaritalStatus																																			AS 'MaritalStatus',
					 	SM.GuardianMaleName																																		AS 'GuardianMaleName',
					 	SM.GuardianFemaleName																																	AS 'GuardianFemaleName',
					 	SM.ProfilePic																																				AS 'ProfilePic'
					 	
			FROM studentmaster SM
			JOIN gendermaster GM ON GM.GenderMasterID = SM.GenderID
			JOIN maritalstatusmaster MSM ON MSM.MaritalStatusMasterID = SM.MaritalStatusID 
			JOIN usermaster UM ON UM.PublicID = SM.StudentMasterPublicID
			JOIN classmaster CM ON CM.ClassMasterPublicID = SM.ClassMasterPublicID WHERE CM.ClassMasterPublicID = @CLASSMASTERPUBLICID  AND SM.IsActive = 1 AND UM.IsActive = 1
		
			
			ORDER BY SM.FirstName,SM.LastName,SM.StudentNo ASC;

END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllStudentDetailsByPublicID
DROP PROCEDURE IF EXISTS `GetAllStudentDetailsByPublicID`;
DELIMITER //
CREATE PROCEDURE `GetAllStudentDetailsByPublicID`(IN `PUBLICID_` VARCHAR(50))
BEGIN
SET @PUBLICID = PUBLICID_;
SELECT 	SM.StudentNo																																	AS 'StudenNo',
			CONCAT(SM.FirstName,IF(SM.OtherName IS NULL,' ',CONCAT(' ',SM.OtherName,' ')),	SM.LastName )						AS 'Name', 
		 	SM.GuardianContactNo																															AS 'ContactNo',
		 	DATE_FORMAT(SM.DOB, "%d %b, %Y")																											AS 'DOB',
		 	SM.Address																																		AS 'Address',
		 	GM.Gender																																		AS 'Gender',
		 	MSM.MaritalStatus																																AS 'MaritalStatus',
		 	SM.GuardianMaleName																															AS 'GuardianMaleName',
		 	SM.GuardianFemaleName																														AS 'GuardianFemaleName',
		 	SM.ProfilePic																																	AS 'ProfilePic',
		 	CONCAT(CM.ClassName,' (', CM.ClassCode,')')																							AS 'ClassName',
		 	IF(SM.EmailAddress IS NULL OR SM.EmailAddress = '','None',SM.EmailAddress )												AS 'EmailAddress',
		 	CM.ClassMasterPublicID																														AS 'ClassMasterPublicID',
		 	SCM.PicURL																																		AS 'PicURL'
		 	
		 	
FROM studentmaster SM
JOIN gendermaster GM ON GM.GenderMasterID = SM.GenderID
JOIN maritalstatusmaster MSM ON MSM.MaritalStatusMasterID = SM.MaritalStatusID 
JOIN classmaster CM ON CM.ClassMasterPublicID = SM.ClassMasterPublicID 
LEFT JOIN schoolmaster SCM ON  SCM.TenantID = CM.TenantID
WHERE SM.IsActive = 1 AND SM.StudentMasterPublicID = @PUBLICID;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllStudentDetailsByStudentNo
DROP PROCEDURE IF EXISTS `GetAllStudentDetailsByStudentNo`;
DELIMITER //
CREATE PROCEDURE `GetAllStudentDetailsByStudentNo`(
	IN `StudentNo` VARCHAR(50)
)
BEGIN
SET @StudentNo = StudentNo;
SELECT 	SM.StudentNo																																	AS 'PublicID',
			SM.StudentMasterPublicID																													AS 'StudentMasterPublicID',
			CONCAT(SM.FirstName,IF(SM.OtherName IS NULL,' ',CONCAT(' ',SM.OtherName,' ')),	SM.LastName )						AS 'Name',
			SM.FirstName																																	AS 'FirstName', 
			SM.LastName 																																	AS 'LastName', 
			SM.OtherName																																	AS 'OtherName', 
		 	SM.GuardianContactNo																															AS 'ContactNo',
		 	DATE_FORMAT(SM.DOB, "%d %b, %Y")																											AS 'DOB',
	    	SM.DOB																	                                  						   AS 'OGDOB',
		 	SM.Address																																		AS 'Address',
		 	GM.GenderMasterID																															   AS 'GenderMasterID',
		 	GM.Gender																																		AS 'Gender',
		 	MSM.MaritalStatus																																AS 'MaritalStatus',
		 	MSM.MaritalStatusMasterID																													AS 'MaritalStatusID',
		 	SM.GuardianMaleName																															AS 'GuardianMaleName',
		 	SM.GuardianFemaleName																														AS 'GuardianFemaleName',
		 	SM.ProfilePic																																	AS 'ProfilePic',
		 	CONCAT(CM.ClassName,' (', CM.ClassCode,')')																							AS 'ClassName',
		  	CM.ClassMasterPublicID								                                                                  AS 'ClassMasterPublicID',				  CONCAT(CM.ClassName,' (',CM.ClassCode,')')                                                                     AS 'Class',
		  	GRM.GradeMasterID																																AS 'GradeMasterID',
		  	GRM.Grade																																		AS 'Grade',
		 	IF(SM.EmailAddress IS NULL OR SM.EmailAddress = '','None',SM.EmailAddress )								   			AS 'EmailAddress'
		 	
FROM studentmaster SM
JOIN gendermaster GM ON GM.GenderMasterID = SM.GenderID
JOIN maritalstatusmaster MSM ON MSM.MaritalStatusMasterID = SM.MaritalStatusID 
JOIN classmaster CM ON CM.ClassMasterPublicID = SM.ClassMasterPublicID  
JOIN grademaster GRM ON GRM.GradeMasterID = CM.GradeMasterID
WHERE SM.IsActive = 1 AND SM.StudentNo = @StudentNo;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllSubjects
DROP PROCEDURE IF EXISTS `GetAllSubjects`;
DELIMITER //
CREATE PROCEDURE `GetAllSubjects`()
BEGIN
	SELECT SM.SubjectCode AS 												'SujectCode',
				 CONCAT(SM.SubjectName,' ( ',SM.SubjectCode,' )')		AS 'SubjectName',
				 	 SM.SubjectName		AS 'Subject' 
		FROM subjectmater SM WHERE SM.IsActive = 1 ORDER BY SM.SubjectName ASC ;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllSubjectsBySchooID
DROP PROCEDURE IF EXISTS `GetAllSubjectsBySchooID`;
DELIMITER //
CREATE PROCEDURE `GetAllSubjectsBySchooID`(IN `SCHOOLID_` VARCHAR(50))
BEGIN

SET @SCHOOLID = SCHOOLID_;

SELECT SM.SubjectMaterID                                                   AS 'SubjectMaterID',
		SM.SubjectCode																			AS  'SubjectCode',
		 CONCAT(SM.SubjectName,' (',SM.SubjectCode,')')								AS 'Subject',
		 CONCAT(DPT.DepartmentName,' (',DPT.ShortHand,')')							AS 'Department',
		 IF(SM.IsActive = 1, 'Yes','No')													AS 'Active' 
FROM subjectmater SM
JOIN department DPT ON DPT.DepartmentID = SM.DepartmentCode
WHERE SM.SchoolID = @SCHOOLID AND DPT.IsActive = 1  ORDER BY SM.IsActive, SM.SubjectName, SM.DepartmentCode ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllTeacherDetailsByID
DROP PROCEDURE IF EXISTS `GetAllTeacherDetailsByID`;
DELIMITER //
CREATE PROCEDURE `GetAllTeacherDetailsByID`(IN `TenantID` VARCHAR(400), IN `TeacherID` VARCHAR(50))
BEGIN
SELECT TM.TeaherMasterPublicID																																					AS 'TeaherMasterPublicID',
		 CONCAT(UM.FirstName,IF(UM.OtherName IS NULL,' ',CONCAT(' ',UM.OtherName,' ')),	UM.LastName) 														AS 'TeacherName',
		 UM.FirstName,
		 UM.OtherName,
		 UM.LastName,
		 DPT.DepartmentName,
		 UM.NRC,
		  UM.ContactNo,
		 DATE_FORMAT(UM.DOB, "%d %b, %Y")	AS 'DOB',
		 UM.ProfilPicURL,
		 UM.UserName,
		 IF(UM.EmailAddress IS NULL, 'None', UM.EmailAddress  )  AS 'EmailAddress'
FROM teachermaster TM 
JOIN usermaster UM ON UM.PublicID = TM.TeaherMasterPublicID 
JOIN teacherpositionmaster TPM ON TPM.TeacherPositionMasterID = TM.TeacherPositionID
JOIN department DPT ON DPT.ShortHand = TM.DeparmrntCode
WHERE UM.TenantID = TenantID AND UM.IsActive = 1 AND TM.IsActive = 1 AND TM.TeaherMasterPublicID = TeacherID AND  TPM.TeacherPositionMasterID NOT IN (2,3);
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllTeacherDetailsByTenantID
DROP PROCEDURE IF EXISTS `GetAllTeacherDetailsByTenantID`;
DELIMITER //
CREATE PROCEDURE `GetAllTeacherDetailsByTenantID`(
	IN `TenantID_` VARCHAR(500)
)
BEGIN
SELECT TM.TeaherMasterPublicID																																					AS 'TeaherMasterPublicID',
		 CONCAT(UM.FirstName,IF(UM.OtherName IS NULL,' ',CONCAT(' ',UM.OtherName,' ')),	UM.LastName, ' (',DPT.DepartmentName,' Dpt.)') 			AS 'Teacher',
		 UM.FirstName,
		 UM.OtherName,
		 UM.LastName,
		 DPT.DepartmentName,
		 UM.NRC,
		  UM.ContactNo,
		 DATE_FORMAT(UM.DOB, "%d %b, %Y")	AS 'DOB',
		 IF (TM.IsActive = 1,'Yes','No')								AS 'IsActive',
		 IF (UM.IsLocked = 1,'Yes','No')								AS 'IsLocked'
FROM teachermaster TM 
JOIN usermaster UM ON UM.PublicID = TM.TeaherMasterPublicID 
JOIN teacherpositionmaster TPM ON TPM.TeacherPositionMasterID = TM.TeacherPositionID
JOIN schoolmaster SM ON SM.TenantID = TenantID_ 
JOIN department DPT ON DPT.ShortHand = TM.DeparmrntCode AND DPT.SchoolMasterID = SM.PublicID
WHERE UM.TenantID = TenantID_ ORDER BY TM.IsActive DESC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllTeacherLessionPlanDocuments
DROP PROCEDURE IF EXISTS `GetAllTeacherLessionPlanDocuments`;
DELIMITER //
CREATE PROCEDURE `GetAllTeacherLessionPlanDocuments`(IN `TenantID_` VARCHAR(300))
BEGIN
SELECT 	
			CONCAT(UM.FirstName,IF(UM.OtherName IS NULL,' ',CONCAT(' ',UM.OtherName,' ')),	UM.LastName,'-',GM.ShortName, ' [',DP.DepartmentName,']  (',TD.Title,')' )						AS 'LessonPlanData', 
			TD.TeacherdocumentID							AS 'TeacherdocumentID',
			TD.Title											AS 'Title',
		 	TD.DocumentURL									AS 'DocumentURL',
		 	 DATE_FORMAT(TD.AddedOn, "%d %b, %Y")  AS 'AddedOn'
		 		

FROM teacherdocument TD 
JOIN usermaster UM ON UM.UserName = TD.AddedBy AND UM.TenantID  =TenantID_
JOIN teachermaster TM ON TM.TeaherMasterPublicID = UM.PublicID 
JOIN department DP ON DP.ShortHand = TM.DeparmrntCode
JOIN gendermaster GM ON GM.GenderMasterID = UM.GenderID 
ORDER BY  TD.UpdatedOn, TD.IsApproved,DP.DepartmentName DESC ;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllUserDetailsByTenantID
DROP PROCEDURE IF EXISTS `GetAllUserDetailsByTenantID`;
DELIMITER //
CREATE PROCEDURE `GetAllUserDetailsByTenantID`(
	IN `TenantID_` VARCHAR(9000)
)
BEGIN
SELECT UM.PublicID																																	 AS 'UserMasterPublicID',
		 CONCAT(UM.FirstName,IF(UM.OtherName IS NULL,' ',CONCAT(' ',UM.OtherName,' ')),	UM.LastName, ' (',DPT.DepartmentName,' Dpt.)') 			AS 'Name',
		 UM.FirstName,
		 UM.OtherName,
		 UM.LastName,
		 DPT.DepartmentName,
		 UM.NRC,
		  UM.ContactNo 'Contact',
		 DATE_FORMAT(UM.DOB, "%d %b, %Y")	AS 'DOB',
		 IF (UM.IsActive = 1,'Yes','No')								AS 'IsActive',
		  IF (UM.IsLocked = 1,'Yes','No')								AS 'IsLocked'
FROM usermaster UM
JOIN userdetails UD ON UM.PublicID = UD.UserMasterID
JOIN teacherpositionmaster TPM ON UD.PositionID = TPM.TeacherPositionMasterID
JOIN schoolmaster SM ON SM.TenantID = TenantID_ 
JOIN department DPT ON DPT.DepartmentID = UD.DepartmentID AND DPT.SchoolMasterID = SM.PublicID
WHERE UM.TenantID = TenantID_ ORDER BY UM.IsActive DESC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAssecmentTypeBySubjectCode
DROP PROCEDURE IF EXISTS `GetAssecmentTypeBySubjectCode`;
DELIMITER //
CREATE PROCEDURE `GetAssecmentTypeBySubjectCode`(IN `CLASSMASTERID` VARCHAR(50), IN `SUBJECT_CODE` CHAR(5), IN `TENANTMASTERID` VARCHAR(300))
BEGIN
		SET @SUBJECTCODE = SUBJECT_CODE;
		SET @GRADEID = (SELECT CM.GradeMasterID FROM classmaster CM WHERE CM.ClassMasterPublicID = CLASSMASTERID);
		SELECT ATM.AssementTypeID,
				
				 ATM.AssementTypeName
				 
		FROM assementtypemaster ATM
		WHERE ATM.IsActive = 1 AND ATM.TenantID=TENANTMASTERID  ORDER BY ATM.AssementTypeName ASC ;
	--	AND ATM.SubjectCode = @SUBJECTCODE AND ATM.GradeMasterID = @GRADEID
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAssecmwntTye
DROP PROCEDURE IF EXISTS `GetAssecmwntTye`;
DELIMITER //
CREATE PROCEDURE `GetAssecmwntTye`(IN `StudentMasterPublicID_` INT)
BEGIN
		SELECT   STA.StudnetAssesmenID																									AS 'PublicID',
					STM.StudentNo																												AS 'StudentNo',
					CONCAT(STM.FirstName,IF(STM.OtherName IS NULL,' ',CONCAT(' ',STM.OtherName,' ')),STM.LastName )	AS 'Name',
					CONCAT(CM.ClassName,' (',CM.ClassCode,')')																		AS 'ClassName',
				   CONCAT(SM.SubjectName,' (',SM.SubjectCode,')')																	AS 'Subject',
					CONCAT(ASTM.AssementTypeName, ' (',STA.AssecementName,')')													AS 'AssecementName',
					CONCAT(STA.Score,' %')																									AS 'Score',
				   DATE_FORMAT(STA.UpdatedOn, "%d %b, %Y") 					   												   AS 'MarkedOn'
				   
					
		FROM studnetassesment STA
		JOIN studentmaster STM ON STM.StudentMasterPublicID = STA.StudentMasterPublicID 
		JOIN assementtypemaster ASTM ON ASTM.AssementTypeID = STA.AssecemntTypeMasterID
		
		JOIN classmaster CM ON CM.ClassMasterPublicID = STA.ClassMasterPublicID AND STM.StudentMasterPublicID = StudentMasterPublicID_
		JOIN subjectmater SM ON SM.SubjectMaterID = STA.SubjectMasterID
		ORDER BY CM.GradeMasterID, STM.StudentNo,STM.FirstName,STM.LastName ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetClassByGreadeID
DROP PROCEDURE IF EXISTS `GetClassByGreadeID`;
DELIMITER //
CREATE PROCEDURE `GetClassByGreadeID`(IN `GradeID` INT)
BEGIN
SET @GRADE = GradeID;
SELECT CM.ClassMasterPublicID								'ClassMasterPublicID',
		 CM.ClassName											'ClassName',
		 CM.GradeMasterID										'GradeMasterID',
		 CONCAT(CM.ClassName,' (',CM.ClassCode,')')   'class'
FROM classmaster CM WHERE CM.GradeMasterID = @GRADE ; 
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetClassDetailsByID
DROP PROCEDURE IF EXISTS `GetClassDetailsByID`;
DELIMITER //
CREATE PROCEDURE `GetClassDetailsByID`(IN `ClassMasterID` VARCHAR(50))
BEGIN
			SELECT   CM.ClassMasterPublicID																																				AS 'ClassMasterPublicID',
				CM.ClassCode																																									AS 'ClassCode',
				CM.ClassName																																									AS 'ClassName',
				CM.Description																																									AS 'Description',
				CONCAT(UM.FirstName,IF(UM.OtherName IS NULL,' ',CONCAT(' ',UM.OtherName,' ')),	UM.LastName, ' (',DPT.DepartmentName,' Dpt.)') 			AS 'Teacher',
				TM.TeaherMasterPublicID																																						AS 'TeaherMasterPublicID',
				GM.GradeMasterID																																								AS 'GradeMasterID',
				GM.Grade																																											AS 'Grade'
			FROM classmaster CM 
			JOIN usermaster UM ON UM.PublicID = CM.ClassTeacherID
			JOIN  teachermaster TM ON TM.TeaherMasterPublicID = CM.ClassTeacherID
			JOIN teacherpositionmaster TPM ON TPM.TeacherPositionMasterID = TM.TeacherPositionID
			JOIN department DPT ON DPT.ShortHand = TM.DeparmrntCode
			JOIN grademaster GM ON GM.GradeMasterID = CM.GradeMasterID
			WHERE CM.IsActive = 1 AND  CM.ClassMasterPublicID = ClassMasterID;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetClassDetailsByPublicID
DROP PROCEDURE IF EXISTS `GetClassDetailsByPublicID`;
DELIMITER //
CREATE PROCEDURE `GetClassDetailsByPublicID`(IN `CLASSMASTERID_` VARCHAR(50))
BEGIN
		SET @CLASSMASTERID = CLASSMASTERID_;
		SELECT CM.ClassMasterPublicID								'ClassMasterPublicID',
				 CM.ClassName											'ClassName',
				 CM.GradeMasterID										'GradeMasterID',
				 CONCAT(CM.ClassName,' (',CM.ClassCode,')')   'class'
		FROM classmaster CM WHERE CM.ClassMasterPublicID = @CLASSMASTERID ; 
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetClassRoomsByID
DROP PROCEDURE IF EXISTS `GetClassRoomsByID`;
DELIMITER //
CREATE PROCEDURE `GetClassRoomsByID`(IN `TenantID` VARCHAR(400))
BEGIN
		SELECT CR.ClassRoomPublicID		AS 'ClassRoomPublicID', 
				 CR.ClassRoomName				AS 'ClassRoomName'
		FROM classroom CR WHERE CR.TenantID = TenantID AND CR.IsActive = 1;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetClassSubjectsByClassMasterID
DROP PROCEDURE IF EXISTS `GetClassSubjectsByClassMasterID`;
DELIMITER //
CREATE PROCEDURE `GetClassSubjectsByClassMasterID`(IN `CLASSMASTERID` VARCHAR(50))
BEGIN
		SET @CLASSMASTERID = CLASSMASTERID;
		SELECT CD.ClassDetailsPublicID									AS 'ClassDetailsPublicID',
				 CD.ClassMasterPublicID										AS 'ClassMasterPublicID',
				 CD.SubjectCode												AS 'SubjectCode',
				 CONCAT(SM.SubjectName, ' (',SM.SubjectCode,')') 	AS 'Subject'
		FROM classdetails CD 
		JOIN subjectmater SM ON SM.SubjectCode = CD.SubjectCode 
		WHERE CD.ClassMasterPublicID = @CLASSMASTERID  AND CD.IsActive = 1 ORDER BY SM.SubjectName ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetClassSubjectsByID
DROP PROCEDURE IF EXISTS `GetClassSubjectsByID`;
DELIMITER //
CREATE PROCEDURE `GetClassSubjectsByID`(IN `ClassMasterID` VARCHAR(50), IN `SchoolID` VARCHAR(50))
BEGIN
		SELECT CD.ClassDetailsPublicID											AS 'ClassDetailsPublicID',
				 SM.SubjectCode 														AS 'SujectCode',
				 CONCAT(SM.SubjectName,' ( ',SM.SubjectCode,' )')			AS 'SubjectName',
				 SM.SubjectName														AS 'Subject',
				 SM.SubjectCode		 												AS 'SubjectCode',
				 CM.ClassRoomName		 												AS 'ClassRoomName',
				 CM.ClassRoomPublicID 												AS 'ClassRoomPublicID' 
		FROM subjectmater SM
		JOIN classdetails CD ON CD.SubjectCode = SM.SubjectCode 
		JOIN classroom CM ON CM.ClassRoomPublicID = CD.ClassRoomPublicID
		WHERE CD.ClassMasterPublicID = ClassMasterID AND CD.IsActive = 1 AND SM.SchoolID =SchoolID ;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetCompleteTeacherDetailsByID
DROP PROCEDURE IF EXISTS `GetCompleteTeacherDetailsByID`;
DELIMITER //
CREATE PROCEDURE `GetCompleteTeacherDetailsByID`(IN `TenantID` VARCHAR(500), IN `TeacherID` VARCHAR(50))
BEGIN
SELECT TM.TeaherMasterPublicID																																					AS 'TeaherMasterPublicID',
		 CONCAT(UM.FirstName,IF(UM.OtherName IS NULL,' ',CONCAT(' ',UM.OtherName,' ')),	UM.LastName) 														AS 'TeacherName',
		 UM.FirstName,
		 UM.OtherName,
		 UM.LastName,
		 DPT.DepartmentName,
		 UM.NRC,
		  UM.ContactNo,
		 DATE_FORMAT(UM.DOB, "%d %b, %Y")	AS 'DOB',
		 UM.ProfilPicURL,
		 UM.UserName,
		 IF(UM.EmailAddress IS NULL, 'None', UM.EmailAddress  )  AS 'EmailAddress'
FROM teachermaster TM 
JOIN usermaster UM ON UM.PublicID = TM.TeaherMasterPublicID 
JOIN teacherpositionmaster TPM ON TPM.TeacherPositionMasterID = TM.TeacherPositionID
JOIN department DPT ON DPT.ShortHand = TM.DeparmrntCode
WHERE UM.TenantID = TenantID AND UM.IsActive = 1 AND TM.IsActive = 1 AND TM.TeaherMasterPublicID = TeacherID AND  TPM.TeacherPositionMasterID;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetCompletStudentDetails
DROP PROCEDURE IF EXISTS `GetCompletStudentDetails`;
DELIMITER //
CREATE PROCEDURE `GetCompletStudentDetails`(
	IN `TenantID` VARCHAR(500)
)
BEGIN
SELECT 	SM.StudentMasterPublicID																													AS 'StudentMasterPublicID',
			SM.StudentNo																																	AS 'PublicID',
			CONCAT(SM.FirstName,IF(SM.OtherName IS NULL,' ',CONCAT(' ',SM.OtherName,' ')),	SM.LastName )						AS 'Name', 
		 	SM.GuardianContactNo																															AS 'ContactNo',
		 	DATE_FORMAT(SM.DOB, "%d %b, %Y")																											AS 'DOB',
		 	SM.Address																																		AS 'Address',
		 	GM.Gender																																		AS 'Gender',
		 	MSM.MaritalStatus																																AS 'MaritalStatus',
		 	SM.GuardianMaleName																															AS 'GuardianMaleName',
		 	SM.GuardianFemaleName																														AS 'GuardianFemaleName',
		 	SM.ProfilePic																																	AS 'ProfilePic',
		 	IF(SM.IsActive = 1, 'Yes', 'No')																											AS 'Active',
			IF(UM.IsLocked = 1, 'Yes', 'No')																											AS 'IsLocked'
		 	
FROM studentmaster SM
JOIN gendermaster GM ON GM.GenderMasterID = SM.GenderID
JOIN maritalstatusmaster MSM ON MSM.MaritalStatusMasterID = SM.MaritalStatusID 
JOIN usermaster UM ON UM.PublicID = SM.StudentMasterPublicID
JOIN classmaster CM ON CM.ClassMasterPublicID = SM.ClassMasterPublicID WHERE  UM.TenantID = TenantID ORDER BY SM.IsActive DESC, SM.StudentNo DESC;

END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetCountryCode
DROP PROCEDURE IF EXISTS `GetCountryCode`;
DELIMITER //
CREATE PROCEDURE `GetCountryCode`()
BEGIN
		SELECT   CT.CountryID		AS 'CountryID',
					CT.ConuntryCode 	AS 'ConuntryCode'
		FROM country CT WHERE CT.IsActive=1;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetDashboardUserCounts
DROP PROCEDURE IF EXISTS `GetDashboardUserCounts`;
DELIMITER //
CREATE PROCEDURE `GetDashboardUserCounts`(IN `TENANTID_` VARCHAR(400))
BEGIN
SET @TENANTID = TENANTID_;

SET @TOTALUSERS = (SELECT COUNT(UM.UserMasterID) FROM usermaster UM WHERE UM.TenantID = @TENANTID AND UM.IsActive = 1);
SET @TOTALUSERSUPDATEDATE = (SELECT MAX(UM.UpdatedOn) FROM usermaster UM WHERE UM.TenantID = @TENANTID AND UM.IsActive = 1);

SET @TOTALSTUDENTS = (SELECT COUNT(UM.UserMasterID) FROM usermaster UM WHERE UM.TenantID = @TENANTID AND UM.IsActive = 1 AND UM.UserTypeID = 2);
SET @TOTALSTUDENTSUPDATEDATE = (SELECT MAX(UM.UpdatedOn) FROM usermaster UM WHERE UM.TenantID = @TENANTID AND UM.IsActive = 1 AND UM.UserTypeID = 2);

SET @TOTALTEACHERS = (SELECT COUNT(UM.UserMasterID) FROM usermaster UM WHERE UM.TenantID = @TENANTID AND UM.IsActive = 1 AND UM.UserTypeID = 3);
SET @TOTALTEACHERSUPDATEDATE = (SELECT MAX(UM.UpdatedOn) FROM usermaster UM WHERE UM.TenantID = @TENANTID AND UM.IsActive = 1 AND UM.UserTypeID = 3);

SELECT @TOTALUSERS 																		AS 'TotalUsers',
		 DATE_FORMAT(@TOTALUSERSUPDATEDATE, "%d %b, %Y %H:%m")	      	AS 'LastUpdatedDateTotalUsers',
		 
	 	 @TOTALSTUDENTS 																	AS 'TotalStudents',
	 	  DATE_FORMAT(@TOTALSTUDENTSUPDATEDATE, "%d %b, %Y %H:%m")	   AS 'LastUpdatedDateTotalUsers',
	 	  
		 @TOTALTEACHERS 																	AS 'TotalTeachers',
		  DATE_FORMAT(@TOTALTEACHERSUPDATEDATE, "%d %b, %Y %H:%m")	   AS 'LastUpdatedDateTotalUsers';
		  
		  
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetDefultGradeCharges
DROP PROCEDURE IF EXISTS `GetDefultGradeCharges`;
DELIMITER //
CREATE PROCEDURE `GetDefultGradeCharges`(IN `TenantID_` VARCHAR(500), IN `NotUsed` INT)
BEGIN
			SELECT GM.GradeMasterID												AS 'GradeMasterID',
					 GM.Grade														AS	'Grade',
					 0 																AS 'Amount',
					 'System' 														AS 'UpdatedBy',
					DATE_FORMAT(CURRENT_TIMESTAMP(), "%d %b, %Y")		AS 'UpdatedOn',
					'No'																AS  'IsCharged'	
					 	
			FROM grademaster GM WHERE GM.TenantID = TenantID_ AND GM.IsActive = 1 ORDER BY GM.GradeMasterID ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetDepartmentByCode
DROP PROCEDURE IF EXISTS `GetDepartmentByCode`;
DELIMITER //
CREATE PROCEDURE `GetDepartmentByCode`(IN `DEPARTMENTCODE_` CHAR(4))
BEGIN
		SET @DEPARTMENTCODE = DEPARTMENTCODE_;

		SELECT 	DP.DepartmentID		AS 'DepartmentID',
					DP.DepartmentName		AS 'DepartmentName',
					DP.ShortHand			AS 'ShortHand'
		FROM department DP
		WHERE DP.ShortHand = @DEPARTMENTCODE ORDER BY DP.DepartmentName ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetDepartmentBySchoolIDAndDptCode
DROP PROCEDURE IF EXISTS `GetDepartmentBySchoolIDAndDptCode`;
DELIMITER //
CREATE PROCEDURE `GetDepartmentBySchoolIDAndDptCode`(IN `SHOOLID` VARCHAR(50), IN `DEPARTMENT_CODE` CHAR(5))
BEGIN
	SELECT 	DPT.DepartmentID 													AS 'DepartmentID',
					DPT.DepartmentName												AS 'DepartmentName',
					DPT.ShortHand														AS 'ShortHand',
					CONCAT(DPT.DepartmentName,' (',DPT.ShortHand,')') 		AS 'Department',
					DPT.SchoolMasterID												AS 'SchoolMasterID' 
		FROM department DPT WHERE DPT.SchoolMasterID = SHOOLID AND DPT.ShortHand = DEPARTMENT_CODE  ORDER BY DPT.DepartmentName ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetDistrictByProvinceId
DROP PROCEDURE IF EXISTS `GetDistrictByProvinceId`;
DELIMITER //
CREATE PROCEDURE `GetDistrictByProvinceId`(IN `Provinceid` INT)
BEGIN
		SET @ProvinceId = Provinceid;
		SELECT	DST.DistrictID AS districtId,
		 			DST.DistrictName		AS name
		FROM district DST WHERE DST.ProvinceID = @ProvinceId AND DST.IsActive = 1;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GeteacherLessionPlanDocumentsByID
DROP PROCEDURE IF EXISTS `GeteacherLessionPlanDocumentsByID`;
DELIMITER //
CREATE PROCEDURE `GeteacherLessionPlanDocumentsByID`(IN `TeaherMasterPublicID_` VARCHAR(50))
BEGIN
SELECT 	
			CONCAT(UM.FirstName,IF(UM.OtherName IS NULL,' ',CONCAT(' ',UM.OtherName,' ')),	UM.LastName,'-',GM.ShortName, ' [',DP.DepartmentName,']  (',TD.Title,')' )						AS 'LessonPlanData', 
			TD.TeacherdocumentID							AS 'TeacherdocumentID',
			TD.Title											AS 'Title',
		 	TD.DocumentURL									AS 'DocumentURL',
		 	 DATE_FORMAT(TD.AddedOn, "%d %b, %Y")  AS 'AddedOn'
		 		

FROM teacherdocument TD 
JOIN usermaster UM ON UM.UserName = TD.AddedBy
JOIN teachermaster TM ON TM.TeaherMasterPublicID = UM.PublicID
JOIN department DP ON DP.ShortHand = TM.DeparmrntCode
JOIN gendermaster GM ON GM.GenderMasterID = UM.GenderID WHERE TM.TeaherMasterPublicID= TeaherMasterPublicID_
ORDER BY  TD.UpdatedOn, TD.IsApproved,DP.DepartmentName DESC ;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetEmailAdressByPositionID
DROP PROCEDURE IF EXISTS `GetEmailAdressByPositionID`;
DELIMITER //
CREATE PROCEDURE `GetEmailAdressByPositionID`(IN `PositionID_` INT)
BEGIN
			SELECT IF (UM.EmailAddress IS NULL, '', UM.EmailAddress)	AS 'EmailAddress'
			FROM usermaster UM 
			JOIN teachermaster TM  ON UM.PublicID = TM.PublicUserID WHERE TM.PositionID = PositionID_ AND UM.IsActive = 1 AND TM.IsActive = 1;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetEmailData
DROP PROCEDURE IF EXISTS `GetEmailData`;
DELIMITER //
CREATE PROCEDURE `GetEmailData`()
BEGIN
		DECLARE STATUSCODE CHAR(4);
		DECLARE NEWSTATUSCODE CHAR(4);
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		     SELECT 0 AS message;
		     ROLLBACK;
		END;
		
		SET STATUSCODE = 'PEND', NEWSTATUSCODE = 'PROC';
		UPDATE emailservice SET `Status` = NEWSTATUSCODE WHERE `Status` = STATUSCODE ;
		 
		SELECT   EM.EmailSerial		AS 'EmailSerial',
					EM.SendData			AS 'SendData',
					EM.`Status`			AS 'Status',
					EM.EmailSubject	AS 'EmailSubject',
					EM.EmailAddress	AS 'EmailAddress'
		FROM emailservice EM WHERE EM.`Status` = NEWSTATUSCODE;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetEmptyResult
DROP PROCEDURE IF EXISTS `GetEmptyResult`;
DELIMITER //
CREATE PROCEDURE `GetEmptyResult`()
BEGIN
			SELECT 1  AS 'Nothing'
						LIMIT 0;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetGender
DROP PROCEDURE IF EXISTS `GetGender`;
DELIMITER //
CREATE PROCEDURE `GetGender`()
BEGIN
		SELECT 	GM.GenderMasterID AS 'genderId',
					GM.Gender		AS 'gender'
		FROM gendermaster GM;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetMaritalStatus
DROP PROCEDURE IF EXISTS `GetMaritalStatus`;
DELIMITER //
CREATE PROCEDURE `GetMaritalStatus`()
BEGIN
			SELECT 	MS.MaritalStatusMasterID   	 AS 'MaritalStatusMasterID',
						MS.MaritalStatus			   	AS 'MaritalStatus'
			FROM maritalstatusmaster MS WHERE MS.IsActive = 1;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetMaxTems
DROP PROCEDURE IF EXISTS `GetMaxTems`;
DELIMITER //
CREATE PROCEDURE `GetMaxTems`()
BEGIN
		SELECT SCH.MaxTerms	'MaxTerms' 
		FROM school SCH;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetPositionDetails
DROP PROCEDURE IF EXISTS `GetPositionDetails`;
DELIMITER //
CREATE PROCEDURE `GetPositionDetails`(IN `limitstart_` INT, IN `limitend_` INT)
BEGIN
		
       
     		SELECT 	TPM.TeacherPositionMasterID 	AS 'TeacherPositionMasterID',
						TPM.PositionName					AS 'PositionName',
						TPM.PositionDescription			AS 'PositionDescription',
						TPM.IsActive						AS 'IsActive' 			 
			FROM teacherpositionmaster TPM ORDER BY TPM.TeacherPositionMasterID ASC LIMIT limitstart_, limitend_;
	END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetPositions
DROP PROCEDURE IF EXISTS `GetPositions`;
DELIMITER //
CREATE PROCEDURE `GetPositions`()
BEGIN
			SELECT   TPM.TeacherPositionMasterID	AS 'TeacherPositionMasterID',
						TPM.PositionName					AS 'PositionName'
			FROM teacherpositionmaster TPM WHERE TPM.IsActive = 1;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetPositonPages
DROP PROCEDURE IF EXISTS `GetPositonPages`;
DELIMITER //
CREATE PROCEDURE `GetPositonPages`(IN `limit_` VARCHAR(50))
BEGIN
		SET @LIMIT_ = limit_;
		SET @NUMBEROFTERMS  = (SELECT COUNT(TPM.TeacherPositionMasterID)  AS COUNT FROM teacherpositionmaster TPM );
		
		SET @NUMBEROFPAGES = @NUMBEROFTERMS/@LIMIT_;
		
		SELECT CEILING(@NUMBEROFPAGES) AS 'Pages',@NUMBEROFTERMS AS 'TotalRecords';
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetProvinces
DROP PROCEDURE IF EXISTS `GetProvinces`;
DELIMITER //
CREATE PROCEDURE `GetProvinces`()
BEGIN
			SELECT	PV.ProvinceID		AS 'ProvinceID',
						PV.ProvinceName	AS 'ProvinceName'
			FROM province PV;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetSchoolDetailsByTenatID
DROP PROCEDURE IF EXISTS `GetSchoolDetailsByTenatID`;
DELIMITER //
CREATE PROCEDURE `GetSchoolDetailsByTenatID`(IN `TenantID_` VARCHAR(400))
BEGIN
SELECT SM.PublicID 				AS 'PublicID',
		 SM.PicURL					AS 'PicURL',
		 SM.SchoolName 			AS 'SchoolName',
		 SM.SchoolMotto			AS 'SchoolMotto',
		 SM.SchoolURl				AS 'SchoolURl',
		 SM.SchoolDescription	AS 'SchoolDescription',
		 SM.Longitude				AS 'Longitude',
		 SM.Latitude				AS 'Latitude',
		 SM.Tel 						AS 'Tel'
FROM schoolmaster SM WHERE SM.TenantID = TenantID_;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetSequence
DROP PROCEDURE IF EXISTS `GetSequence`;
DELIMITER //
CREATE PROCEDURE `GetSequence`(IN `SequenceID` INT)
BEGIN
				DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
			     SELECT 0 AS message;
			     ROLLBACK;
 END;
				
				SET @LASTINSERTEDID = (SELECT SM.LastInsertedID FROM sequencemaster SM WHERE SM.SequenceMasterID = SequenceID );
				
				SET @NEWLASTINSETEDID  = (( SELECT SM.LastInsertedID FROM sequencemaster SM WHERE SM.SequenceMasterID = SequenceID)+1 );
				
				SET @SEQUNCECODE = (SELECT SM.SequnceCode FROM sequencemaster SM WHERE SM.SequenceMasterID = SequenceID);
				
				SET @SEQUNCE  = ( CONCAT(@SEQUNCECODE,"000000000",@NEWLASTINSETEDID) );
				
				UPDATE sequencemaster SET `LastInsertedID` = @NEWLASTINSETEDID WHERE SequenceMasterID = SequenceID;
				
				SELECT @SEQUNCE	AS 'SequnceNumber';
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetSequnces
DROP PROCEDURE IF EXISTS `GetSequnces`;
DELIMITER //
CREATE PROCEDURE `GetSequnces`()
BEGIN
		SELECT SM.SequenceMasterID AS 'SequenceMasterID',
				 SM.SequnceCode		AS 'SequnceCode',
				 SM.LastInsertedID	AS 'LastInsertedID',
				 SM.UpdatedOn			AS 'UpdatedOn'
		
		FROM vwsequncemaster SM ORDER BY SM.SequenceMasterID ;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetSessionDetails
DROP PROCEDURE IF EXISTS `GetSessionDetails`;
DELIMITER //
CREATE PROCEDURE `GetSessionDetails`(IN `UserMasterID` INT, IN `SerialID` VARCHAR(50), IN `TokenID` VARCHAR(50))
BEGIN
		SELECT 	SES.UserMasterPublicID		AS 'UserMasterPublicID',
					SES.SerialID					AS 'SerialID',
					SES.TokenID						AS 'TokenID' 
		FROM `session` SES WHERE SES.UserMasterPublicID  = UserMasterID AND SES.SerialID = SerialID AND SES.TokenID = TokenID;

END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetSessionDetailsByUserMasterPublicID
DROP PROCEDURE IF EXISTS `GetSessionDetailsByUserMasterPublicID`;
DELIMITER //
CREATE PROCEDURE `GetSessionDetailsByUserMasterPublicID`(IN `UserMasterPublicID` VARCHAR(50))
BEGIN
		SELECT 	SN.SerialID				AS 'SerialID',
					SN.TokenID				AS 'TokenID',
					SN.TokenCreatedTime	AS 'TokenCreatedTime',
					SN.UpdatedBy			AS 'Username',
					SN.UserMasterPublicID AS 'UserMasterPublicID'
		FROM `session` SN WHERE SN.UserMasterPublicID = UserMasterPublicID;

END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetSessionLogs
DROP PROCEDURE IF EXISTS `GetSessionLogs`;
DELIMITER //
CREATE PROCEDURE `GetSessionLogs`()
SELECT sh.UserMasterPublicID,um.ContactNo
     ,sh.UpdatedOn, um.FirstName,um.LastName
FROM sessionhistory AS sh
JOIN usermaster AS um ON um.PublicID = sh.UserMasterPublicID//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetSingInLogs
DROP PROCEDURE IF EXISTS `GetSingInLogs`;
DELIMITER //
CREATE PROCEDURE `GetSingInLogs`()
SELECT a.UserPublicID,a.SignOut,a.Date
     ,a.SignIn, um.FirstName,um.LastName
FROM attendance AS a
JOIN usermaster AS um ON um.PublicID = a.UserPublicID//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetStudentAsscementMarkReport
DROP PROCEDURE IF EXISTS `GetStudentAsscementMarkReport`;
DELIMITER //
CREATE PROCEDURE `GetStudentAsscementMarkReport`(IN `TenantID_` VARCHAR(300))
BEGIN
		SELECT   STA.StudnetAssesmenID																									AS 'PublicID',
					STM.StudentNo																												AS 'StudentNo',
					CONCAT(STM.FirstName,IF(STM.OtherName IS NULL,' ',CONCAT(' ',STM.OtherName,' ')),STM.LastName )	AS 'Name',
					CONCAT(CM.ClassName,' (',CM.ClassCode,')')																		AS 'ClassName',
				   CONCAT(SM.SubjectName,' (',SM.SubjectCode,')')																	AS 'Subject',
					CONCAT(ASTM.AssementTypeName, ' (',STA.AssecementName,')')													AS 'AssecementName',
					CONCAT(STA.Score,' %')																									AS 'Score',
				   DATE_FORMAT(STA.UpdatedOn, "%d %b, %Y") 					   												   AS 'MarkedOn'
				   
					
		FROM studnetassesment STA
		JOIN studentmaster STM ON STM.StudentMasterPublicID = STA.StudentMasterPublicID 
		JOIN assementtypemaster ASTM ON ASTM.AssementTypeID = STA.AssecemntTypeMasterID
		
		JOIN classmaster CM ON CM.ClassMasterPublicID = STA.ClassMasterPublicID AND CM.TenantID = TenantID_
		JOIN subjectmater SM ON SM.SubjectMaterID = STA.SubjectMasterID
		ORDER BY CM.GradeMasterID, STM.StudentNo,STM.FirstName,STM.LastName ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetStudentAttendanceReport
DROP PROCEDURE IF EXISTS `GetStudentAttendanceReport`;
DELIMITER //
CREATE PROCEDURE `GetStudentAttendanceReport`(IN `TENANTID` VARCHAR(300))
BEGIN
		SELECT  STA.StudentAttendanceID																								   AS 'PublicID',
					 STM.StudentNo																												AS 'StudentNo',
					CONCAT(STM.FirstName,IF(STM.OtherName IS NULL,' ',CONCAT(' ',STM.OtherName,' ')),STM.LastName )	AS 'Name',
					CONCAT(CM.ClassName,' (',CM.ClassCode,')')																		AS 'ClassName',
					IF (STA.Reason IS NULL,'None',STA.Reason)																			AS 'Reason',
					STAM.Statue																													AS 'Statue',
				   DATE_FORMAT(STA.UpdatedOn, "%d %b, %Y") 					   												   AS 'MarkedOn'
					
		FROM studentattendance STA
		JOIN studentmaster STM ON STM.StudentNo = STA.StudentID 
		JOIN classmaster CM ON CM.ClassMasterPublicID = STA.ClassID AND CM.TenantID = TENANTID
		JOIN statusmaster STAM ON STAM.StatueCode =STA.`Status` 
		
		ORDER BY CM.ClassCode,STA.StudentID,DATE (STA.UpdatedOn),STM.FirstName,STM.LastName ASC;

END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetStudentAttendanceReportByPublicID
DROP PROCEDURE IF EXISTS `GetStudentAttendanceReportByPublicID`;
DELIMITER //
CREATE PROCEDURE `GetStudentAttendanceReportByPublicID`(
	IN `PUBLIC_ID` VARCHAR(50)
)
BEGIN

SET @TOTALABSETDAYS = (SELECT  COUNT(STA.StudentAttendanceID)	FROM studentattendance STA JOIN studentmaster STM ON STM.StudentNo = STA.StudentID JOIN classmaster CM ON CM.ClassMasterPublicID = STA.ClassID JOIN statusmaster STAM ON STAM.StatueCode =STA.`Status`	WHERE STM.StudentMasterPublicID = PUBLIC_ID AND STAM.StatueCode IN (2,3));


SET @TOTALPRESENTDAYS = (SELECT  COUNT(STA.StudentAttendanceID)	FROM studentattendance STA JOIN studentmaster STM ON STM.StudentNo = STA.StudentID JOIN classmaster CM ON CM.ClassMasterPublicID = STA.ClassID JOIN statusmaster STAM ON STAM.StatueCode =STA.`Status`	WHERE STM.StudentMasterPublicID = PUBLIC_ID AND STAM.StatueCode IN (1));


SELECT        STA.StudentAttendanceID																								   AS 'PublicID',
					STM.StudentNo																												AS 'StudentNo',
					CONCAT(STM.FirstName,IF(STM.OtherName IS NULL,' ',CONCAT(' ',STM.OtherName,' ')),STM.LastName )	AS 'Name',
					CONCAT(CM.ClassName,' (',CM.ClassCode,')')																		AS 'ClassName',
					IF (STA.Reason IS NULL,'None',STA.Reason)																			AS 'Reason',
					STAM.Statue																													AS 'Statue',
				   DATE_FORMAT(STA.UpdatedOn, "%d %b, %Y") 					   												   AS 'MarkedOn',
				   @TOTALABSETDAYS 																											AS 'TOTALABSETDAYS',
				   @TOTALPRESENTDAYS																											AS 'TOTALPRESENTDAYS'
				   
					
		FROM studentattendance STA
		JOIN studentmaster STM ON STM.StudentNo = STA.StudentID 
		JOIN classmaster CM ON CM.ClassMasterPublicID = STA.ClassID 
		JOIN statusmaster STAM ON STAM.StatueCode =STA.`Status`
		WHERE STM.StudentMasterPublicID = PUBLIC_ID ORDER BY CM.ClassCode,STA.StudentID,DATE (STA.UpdatedOn),STM.FirstName,STM.LastName ASC;

END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetStudentNo
DROP PROCEDURE IF EXISTS `GetStudentNo`;
DELIMITER //
CREATE PROCEDURE `GetStudentNo`(IN `SequenceID` INT)
BEGIN
   
 			DECLARE LASTINSERTEDID VARCHAR(50);
			DECLARE NEWLASTINSETEDID VARCHAR(50);
			DECLARE SEQUNCECODE CHAR(4);
		
    
         SELECT SM.LastInsertedID INTO LASTINSERTEDID FROM sequencemaster SM WHERE SM.SequenceMasterID = SequenceID;
			
			SELECT SM.LastInsertedID+1 INTO NEWLASTINSETEDID FROM sequencemaster SM  WHERE SM.SequenceMasterID = SequenceID;
				
			SELECT SM.SequnceCode INTO  SEQUNCECODE FROM sequencemaster SM  WHERE SM.SequenceMasterID = SequenceID;
				
			UPDATE sequencemaster SET `LastInsertedID` = NEWLASTINSETEDID WHERE SequenceMasterID = SequenceID;
				
			-- return the Sequence
		 SELECT	CONCAT('SN',YEAR(CURDATE()),"0",NEWLASTINSETEDID) AS SequnceNumber;
				
			
			
    
   
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetSubjectsByClassMasterPublicID
DROP PROCEDURE IF EXISTS `GetSubjectsByClassMasterPublicID`;
DELIMITER //
CREATE PROCEDURE `GetSubjectsByClassMasterPublicID`(IN `ClassmasterPublicID_` VARCHAR(50), IN `SCHOOLID` VARCHAR(50))
BEGIN
		SET @CLASSMASTERPUBLICID =  ClassmasterPublicID_;
		
		SELECT 		 SM.SubjectCode 													AS	'SujectCode',
						 SM.SubjectMaterID												AS 'SubjectMaterID',
						 CONCAT(SM.SubjectName,' ( ',SM.SubjectCode,' )')		AS 'SubjectName'
						   
		FROM classmaster CM 
		JOIN classdetails CD ON CD.ClassMasterPublicID = CM.ClassMasterPublicID
		JOIN subjectmater SM ON SM.SubjectCode = CD.SubjectCode  WHERE CM.ClassMasterPublicID = @CLASSMASTERPUBLICID AND SM.SchoolID = SCHOOLID ;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetSuperAdminDashbordUserCount
DROP PROCEDURE IF EXISTS `GetSuperAdminDashbordUserCount`;
DELIMITER //
CREATE PROCEDURE `GetSuperAdminDashbordUserCount`(IN `TENANTID` VARCHAR(400))
BEGIN


SET @TOTALUSERS = (SELECT COUNT(UM.UserMasterID) FROM usermaster UM WHERE  UM.IsActive = 1);
SET @TOTALUSERSUPDATEDATE = (SELECT MAX(UM.UpdatedOn) FROM usermaster UM WHERE  UM.IsActive = 1);

SET @TOTALSTUDENTS = (SELECT COUNT(UM.UserMasterID) FROM usermaster UM WHERE  UM.IsActive = 1 AND UM.UserTypeID = 2);
SET @TOTALSTUDENTSUPDATEDATE = (SELECT MAX(UM.UpdatedOn) FROM usermaster UM WHERE  UM.IsActive = 1 AND UM.UserTypeID = 2);

SET @TOTALTEACHERS = (SELECT COUNT(UM.UserMasterID) FROM usermaster UM WHERE  UM.IsActive = 1 AND UM.UserTypeID = 3);
SET @TOTALTEACHERSUPDATEDATE = (SELECT MAX(UM.UpdatedOn) FROM usermaster UM WHERE UM.IsActive = 1 AND UM.UserTypeID = 3);

SELECT @TOTALUSERS 																		AS 'TotalUsers',
		 DATE_FORMAT(@TOTALUSERSUPDATEDATE, "%d %b, %Y %H:%m")	      	AS 'LastUpdatedDateTotalUsers',
		 
	 	 @TOTALSTUDENTS 																	AS 'TotalStudents',
	 	  DATE_FORMAT(@TOTALSTUDENTSUPDATEDATE, "%d %b, %Y %H:%m")	   AS 'LastUpdatedDateTotalUsers',
	 	  
		 @TOTALTEACHERS 																	AS 'TotalTeachers',
		  DATE_FORMAT(@TOTALTEACHERSUPDATEDATE, "%d %b, %Y %H:%m")	   AS 'LastUpdatedDateTotalUsers';
		  
		  
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetSysActiveTermsByID
DROP PROCEDURE IF EXISTS `GetSysActiveTermsByID`;
DELIMITER //
CREATE PROCEDURE `GetSysActiveTermsByID`(IN `TenantID_` VARCHAR(500))
BEGIN
		SELECT TM.TermMasterID,
				 TM.TenantID,
				 TM.TermName	AS 'TermName',
				 TM.IsSysActive 
		FROM termmaster TM WHERE TM.TenantID = TenantID_ AND TM.IsSysActive = 1 AND TM.IsActive;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetTeacherDetailsByID
DROP PROCEDURE IF EXISTS `GetTeacherDetailsByID`;
DELIMITER //
CREATE PROCEDURE `GetTeacherDetailsByID`(IN `TenantID` VARCHAR(400))
BEGIN
SELECT TM.TeaherMasterPublicID																																					AS 'TeaherMasterPublicID',
		 CONCAT(UM.FirstName,IF(UM.OtherName IS NULL,' ',CONCAT(' ',UM.OtherName,' ')),	UM.LastName, ' (',DPT.DepartmentName,' Dpt.)') 			AS 'Teacher',
		 UM.FirstName,
		 UM.OtherName,
		 UM.LastName,
		 DPT.DepartmentName,
		 UM.NRC,
		  UM.ContactNo,
		 DATE_FORMAT(UM.DOB, "%d %b, %Y")	AS 'DOB'
FROM teachermaster TM 
JOIN usermaster UM ON UM.PublicID = TM.TeaherMasterPublicID 
JOIN teacherpositionmaster TPM ON TPM.TeacherPositionMasterID = TM.TeacherPositionID
JOIN department DPT ON DPT.ShortHand = TM.DeparmrntCode
WHERE UM.TenantID = TenantID AND UM.IsActive = 1 AND TM.IsActive = 1 AND TPM.TeacherPositionMasterID NOT IN (2,3);
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetTeacherDocumentDetailsByID
DROP PROCEDURE IF EXISTS `GetTeacherDocumentDetailsByID`;
DELIMITER //
CREATE PROCEDURE `GetTeacherDocumentDetailsByID`(IN `DOCUMENTID_` INT)
BEGIN
SET @DOCUMENTID = DOCUMENTID_;

SELECT 	TD.TeacherdocumentID		AS 'TeacherdocumentID',
			TD.Title						AS 'Title',
		 	TD.DocumentURL				AS 'DocumentURL'

FROM teacherdocument TD WHERE TD.TeacherdocumentID = @DOCUMENTID;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetTermDetails
DROP PROCEDURE IF EXISTS `GetTermDetails`;
DELIMITER //
CREATE PROCEDURE `GetTermDetails`()
BEGIN
		SELECT TM.TermMasterID	AS 'TermMasterID',
				 TM.TermName		AS 'TermName' 
		FROM termmaster TM ORDER BY TM.TermMasterID ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetTermPages
DROP PROCEDURE IF EXISTS `GetTermPages`;
DELIMITER //
CREATE PROCEDURE `GetTermPages`(IN `limit_` VARCHAR(50))
BEGIN
		SET @LIMIT_ = limit_;
		SET @NUMBEROFTERMS  = (SELECT COUNT(TM.TermMasterID)  AS COUNT FROM termmaster TM );
		
		SET @NUMBEROFPAGES = @NUMBEROFTERMS/@LIMIT_;
		
		SELECT CEILING(@NUMBEROFPAGES) AS 'Pages',@NUMBEROFTERMS AS 'TotalRecords';
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetTimeTable
DROP PROCEDURE IF EXISTS `GetTimeTable`;
DELIMITER //
CREATE PROCEDURE `GetTimeTable`(
	IN `ClassMasterID_` VARCHAR(50)
)
BEGIN
SET @ClassMasterID_ = ClassMasterID_;

SET @SCHOOLID = (SELECT SM.PublicID FROM schoolmaster SM WHERE SM.TenantID  = (SELECT CM.TenantID FROM classmaster CM WHERE CM.ClassMasterPublicID = @ClassMasterID_) );

SELECT  TTD.TimeTableDetailsID																														AS 'TimeTableDetailsID',
		  PM.SequenceID																																	AS 'SequenceID',  
		  CONCAT(PM.PeriodName,"<br>(",TIME_FORMAT(TTM.TimeFrom,"%H:%i"), " - " ,TIME_FORMAT(TTM.TimeTo,"%H:%i"),")")		AS 'PeriodName',
		  GetClassName(TTD.Monday,@SCHOOLID)																														AS 'SubjectCodeM',
		  TTD.Monday																																		AS 'Monday',
		  GetClassName(TTD.Tuesday,@SCHOOLID)																													AS 'SubjectCodeT',
		  TTD.Tuesday																																		AS 'Tuesday',
		  GetClassName(TTD.Wednesday,@SCHOOLID)																													AS 'SubjectCodeW',
		  TTD.Wednesday																																	AS 'Wednesday',
		  GetClassName(TTD.Thursday,@SCHOOLID)																													AS 'SubjectCodeTH',
		  TTD.Thursday																																		AS 'Thursday',
		  GetClassName(TTD.Friday,@SCHOOLID)																										AS 'SubjectCodeF',
		  TTD.Friday																																		AS 'Friday',
		  GetClassName(TTD.Saturday,@SCHOOLID)																										AS 'SubjectCodeS',
		  TTD.Saturday																																		AS 'Saturday',
		  GetClassName(TTD.Sunday,@SCHOOLID)																										AS 'SubjectCodeSN',
		  TTD.Sunday																																		AS 'Sunday'
FROM timetablemaster TTM 
JOIN periodmaster PM ON PM.PeriodMasterID = TTM.PeriodMasterID
JOIN timetabledetails TTD ON  TTM.TimeTableMasterID =TTD.TimeTableMaterD

WHERE TTM.ClassMasterID = @ClassMasterID_ AND TTM.IsActive = 1 AND PM.IsActive = 1 ORDER BY TTM.ClassMasterID,PM.SequenceID ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetTotalStudentAttendancyDaysByPublicID
DROP PROCEDURE IF EXISTS `GetTotalStudentAttendancyDaysByPublicID`;
DELIMITER //
CREATE PROCEDURE `GetTotalStudentAttendancyDaysByPublicID`(
	IN `PUBLIC_ID` VARCHAR(500)
)
BEGIN
SET @TOTALABSETDAYS = (SELECT  COUNT(STA.StudentAttendanceID)	FROM studentattendance STA JOIN studentmaster STM ON STM.StudentNo = STA.StudentID JOIN classmaster CM ON CM.ClassMasterPublicID = STA.ClassID JOIN statusmaster STAM ON STAM.StatueCode =STA.`Status`	WHERE STM.StudentMasterPublicID = PUBLIC_ID AND STAM.StatueCode IN (2,3));


SET @TOTALPRESENTDAYS = (SELECT  COUNT(STA.StudentAttendanceID)	FROM studentattendance STA JOIN studentmaster STM ON STM.StudentNo = STA.StudentID JOIN classmaster CM ON CM.ClassMasterPublicID = STA.ClassID JOIN statusmaster STAM ON STAM.StatueCode =STA.`Status`	WHERE STM.StudentMasterPublicID = PUBLIC_ID AND STAM.StatueCode IN (1));


SELECT @TOTALABSETDAYS     AS 'TOTALABSETDAYS',
       @TOTALPRESENTDAYS	AS 'TOTALPRESENTDAYS';
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetUserByUsername
DROP PROCEDURE IF EXISTS `GetUserByUsername`;
DELIMITER //
CREATE PROCEDURE `GetUserByUsername`(
	IN `username` VARCHAR(50)
)
BEGIN
		SELECT UM.PublicID		AS 'PublicID',
				 UM.UserName		AS 'UserName',
				 UM.Password		AS 'Password',
				 UM.UserTypeID		AS 'UserTypeID',
				 UM.IsActive  		AS 'IsActive',
				 IF(UM.EmailAddress IS NULL , Null, UM.EmailAddress)	AS 'EmailAddress',
				 CONCAT(UM.FirstName," ",IF(UM.OtherName IS NULL, '', UM.OtherName)," ",UM.LastName)	AS 'Name',
				 TM.TeacherPositionID		AS 'PositionID',
				 DP.ShortHand		AS 'ShortHand',
				 TNM.TenantID		AS 'TenantID',
				 TNM.IsActive		AS 'IsTenantActive',
				 SM.PublicID		AS 'SchoolPublicID',
				 SM.PicURL			AS 'LogoPicURL',
				 UM.ProfilPicURL  AS 'ProfilPicURL',
				 UM.IsLocked      AS 'IsAccountLocked'
		FROM usermaster UM
		JOIN usertypemaster UTM ON UTM.UserTypeMasterID = UM.UserTypeID
		JOIN tenantmaster TNM ON TNM.TenantID = UM.TenantID
		LEFT JOIN teachermaster TM ON TM.TeaherMasterPublicID = UM.PublicID
		LEFT JOIN department DP ON DP.ShortHand = TM.DeparmrntCode	
		LEFT JOIN schoolmaster SM ON SM.TenantID = TNM.TenantID
		WHERE UM.UserName = username ;

END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetUserDetailsByID
DROP PROCEDURE IF EXISTS `GetUserDetailsByID`;
DELIMITER //
CREATE PROCEDURE `GetUserDetailsByID`(IN `UserID_` VARCHAR(50))
BEGIN
				SELECT   UM.PublicID												AS 'PublicID',
							UM.FirstName											AS 'FirstName',
							IF(UM.OtherName IS NULL, '',UM.OtherName)		AS	'OtherName',
							UM.LastName												AS 'LastName', 
							IF(UM.NRC IS NULL, 'None', UM.NRC)				AS 'NRC',
							TPM.PositionName										AS 'PositionName',
							DP.DepartmentName										AS 'DepartmentName',
							GM.Gender												AS	'Gender',
							IF(UM.Passport IS NULL,'None',UM.Passport)	AS 'Passport',
							UM.ContactNo											AS 'ContactNo',
							UM.EmailAddress										AS 'EmailAddress',
							UM.UserMasterID										AS 'UserMasterID'
								
				FROM usermaster UM
				LEFT JOIN teachermaster TM ON TM.PublicUserID = UM.PublicID 
				LEFT JOIN department DP ON DP.ShortHand = TM.DepartmentCode
				LEFT JOIN gendermaster GM ON GM.GenderMasterID = UM.GenderID
				LEFT JOIN teacherpositionmaster TPM ON TPM.TeacherPositionMasterID = TM.PositionID
				WHERE UM.PublicID = UserID_;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetUserDetailsByPublicID
DROP PROCEDURE IF EXISTS `GetUserDetailsByPublicID`;
DELIMITER //
CREATE PROCEDURE `GetUserDetailsByPublicID`(IN `PublicID` VARCHAR(50))
BEGIN
			SET @PublicID = PublicID;
			SELECT	UM.PublicID 														AS 'PublicID',
						IF(UM.NRC IS NULL, 'None',UM.NRC)							AS 'NRC',
						IF(UM.Passport IS NULL, 'None',UM.Passport)				AS 'Passport',
						UM.UserName															AS 'UserName',
						UM.FirstName														AS 'FirstName',
						IF(UM.OtherName IS NULL, 'None',UM.OtherName)		   AS 'OtherName',
						IF(UM.EmailAddress IS NULL, 'None',UM.EmailAddress)	AS 'EmailAddress',	
						UM.ContactNo														AS 'ContactNo',
						GM.Gender															AS 'Gender',
						MRS.MaritalStatus													AS 'MaritalStatus',
						UM.DOB																AS 'DOB',
						TPM.PositionName													AS 'PositionName',
						TM.StartDate														AS 'StartDate',
						TM.IsOnLeave														AS 'IsOnLeave'
					  
			FROM usermaster UM 
			JOIN teachermaster TM ON TM.PublicID = UM.PublicID
			JOIN address AD ON AD.IdentificationID = TM.PublicID
			JOIN gendermaster GM ON GM.GenderMasterID = UM.GenderID
			JOIN maritalstatusmaster MRS ON MRS.MaritalStatusMasterID = UM.MaritalStatusID
			JOIN teacherpositionmaster TPM ON TPM.TeacherPositionMasterID = TM.PositionID  WHERE GM.IsActive = 1 AND TPM.IsActive = 1 AND  UM.IsActive = 1 AND UM.PublicID =  @PublicID ; 

END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetUserEmailByID
DROP PROCEDURE IF EXISTS `GetUserEmailByID`;
DELIMITER //
CREATE PROCEDURE `GetUserEmailByID`(IN `TEACHERID` VARCHAR(50))
BEGIN
		SELECT IF(UM.EmailAddress IS NULL, '' , UM.EmailAddress)	AS 'EmailAddress'
		FROM usermaster UM WHERE UM.PublicID = TEACHERID AND UM.IsActive = 1;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.ResetPasswordByUserPublicID
DROP PROCEDURE IF EXISTS `ResetPasswordByUserPublicID`;
DELIMITER //
CREATE PROCEDURE `ResetPasswordByUserPublicID`(
	IN `publicid_` VARCHAR(1000),
	IN `password_` VARCHAR(5000),
	IN `updatedby_` VARCHAR(50)
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		     SELECT 0 AS message;
		     ROLLBACK;
		END;
		
	
		
		UPDATE usermaster SET `Password` = password_, IsActive = 0,IsLocked = 0,LoginAttempts = 0, UpdatedBy=updatedby_ WHERE PublicID = publicid_;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.SearchActivatedUsers
DROP PROCEDURE IF EXISTS `SearchActivatedUsers`;
DELIMITER //
CREATE PROCEDURE `SearchActivatedUsers`(IN `UserName_` VARCHAR(50), IN `FirstName_` VARCHAR(50), IN `LastName_` VARCHAR(50))
BEGIN
		SET @USERNAMEC =    (SELECT IF ( UserName_ IS NULL OR UserName_='' , NULL , CONCAT("%",UserName_,"%")) );
		SET @FIRSTNAMEC =   (SELECT IF ( FirstName_ IS NULL OR FirstName_='' , NULL , CONCAT("%",FirstName_,"%")) );
		SET @LASTNAMEC = 		(SELECT IF ( LastName_ IS NULL OR LastName_='' , NULL , CONCAT("%",LastName_,"%")) );

		SELECT   UM.PublicID												AS 'PublicID',
					UM.FirstName											AS 'FirstName',
					IF(UM.OtherName IS NULL, '',UM.OtherName)		AS	'OtherName',
					UM.LastName												AS 'LastName', 
					IF(UM.NRC IS NULL, 'None', UM.NRC)				AS 'NRC',
					TPM.PositionName										AS 'PositionName',
					DP.DepartmentName										AS'DepartmentName'			
		FROM usermaster UM
		LEFT JOIN teachermaster TM ON TM.PublicUserID = UM.PublicID 
		LEFT JOIN department DP ON DP.ShortHand = TM.DepartmentCode
		LEFT JOIN teacherpositionmaster TPM ON TPM.TeacherPositionMasterID = TM.PositionID
		WHERE ((UM.UserName LIKE @USERNAMEC) OR  (UM.FirstName  LIKE @FIRSTNAMEC) OR (UM.LastName LIKE @LASTNAMEC)) AND ( UM.IsActive = 1 );
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.SearchUsers
DROP PROCEDURE IF EXISTS `SearchUsers`;
DELIMITER //
CREATE PROCEDURE `SearchUsers`(IN `UserName_` VARCHAR(50), IN `FirstName_` VARCHAR(50), IN `LastName_` VARCHAR(50))
BEGIN
		SET @USERNAMEC =    (SELECT IF ( UserName_ IS NULL OR UserName_='' , NULL , CONCAT("%",UserName_,"%")) );
		SET @FIRSTNAMEC =   (SELECT IF ( FirstName_ IS NULL OR FirstName_='' , NULL , CONCAT("%",FirstName_,"%")) );
		SET @LASTNAMEC = 		(SELECT IF ( LastName_ IS NULL OR LastName_='' , NULL , CONCAT("%",LastName_,"%")) );

		SELECT   UM.PublicID												AS 'PublicID',
					UM.FirstName											AS 'FirstName',
					IF(UM.OtherName IS NULL, '',UM.OtherName)		AS	'OtherName',
					UM.LastName												AS 'LastName', 
					IF(UM.NRC IS NULL, 'None', UM.NRC)				AS 'NRC',
					TPM.PositionName										AS 'PositionName',
					DP.DepartmentName										AS'DepartmentName'			
		FROM usermaster UM
		LEFT JOIN teachermaster TM ON TM.PublicUserID = UM.PublicID 
		LEFT JOIN department DP ON DP.ShortHand = TM.DepartmentCode
		LEFT JOIN teacherpositionmaster TPM ON TPM.TeacherPositionMasterID = TM.PositionID
		WHERE ((UM.UserName LIKE @USERNAMEC) OR  (UM.FirstName  LIKE @FIRSTNAMEC) OR (UM.LastName LIKE @LASTNAMEC)) AND ( UM.IsActive = 0 );
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.UpdateAssecemntTypeActiveStatusByID
DROP PROCEDURE IF EXISTS `UpdateAssecemntTypeActiveStatusByID`;
DELIMITER //
CREATE PROCEDURE `UpdateAssecemntTypeActiveStatusByID`(IN `AsscementTypePublicID` INT, IN `UpdatedBy_` VARCHAR(50))
BEGIN
SET @PublicID  = AsscementTypePublicID;

UPDATE assementtypemaster  SET UpdatedBy = UpdatedBy_, `IsActive` =  CASE  
	WHEN  `IsActive` = 1	THEN  0
	WHEN  `IsActive` = 0	THEN  1
	ELSE 
	`IsActive`
	END  
	WHERE AssementTypeID = @PublicID;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.UpdateClassActiveStatusByID
DROP PROCEDURE IF EXISTS `UpdateClassActiveStatusByID`;
DELIMITER //
CREATE PROCEDURE `UpdateClassActiveStatusByID`(IN `ClassPublicID` VARCHAR(100), IN `UpdatedBy_` VARCHAR(50))
BEGIN
SET @PublicID  = ClassPublicID;

UPDATE timetablemaster  SET UpdatedBy = UpdatedBy_, `IsActive` =  CASE  
	WHEN  `IsActive` = 1	THEN  0
	WHEN  `IsActive` = 0	THEN  1
	ELSE 
	`IsActive`
	END  
	WHERE TimeTableMasterID = @PublicID;
	


END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.UpdateEmailSatusCode
DROP PROCEDURE IF EXISTS `UpdateEmailSatusCode`;
DELIMITER //
CREATE PROCEDURE `UpdateEmailSatusCode`(IN `EMAILESERIAL` VARCHAR(50), IN `STATUSCODE` CHAR(4), IN `CURRENTCODE` CHAR(4))
BEGIN
		
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		     SELECT 0 AS message;
		     ROLLBACK;
		END;
		
		UPDATE emailservice  SET `Status` = STATUSCODE WHERE EmailSerial = EMAILESERIAL And `Status` = CURRENTCODE;
		 
	
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.UpdatePasswordByUsername
DROP PROCEDURE IF EXISTS `UpdatePasswordByUsername`;
DELIMITER //
CREATE PROCEDURE `UpdatePasswordByUsername`(IN `username_` VARCHAR(50), IN `password_` VARCHAR(300))
BEGIN
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		     SELECT 0 AS message;
		     ROLLBACK;
		END;
		
		SET @PUBLICID  = (SELECT UM.PublicID FROM usermaster UM WHERE UM.UserName = username_ );
		
		UPDATE usermaster SET `Password` = password_, IsActive = 1 WHERE UserName = username_;
		
		UPDATE teachermaster SET IsActive = 1 WHERE PublicUserID = @PUBLICID ;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.UpdatePasswordByUserPublicID
DROP PROCEDURE IF EXISTS `UpdatePasswordByUserPublicID`;
DELIMITER //
CREATE PROCEDURE `UpdatePasswordByUserPublicID`(
	IN `publicid_` VARCHAR(500),
	IN `password_` VARCHAR(700)
)
BEGIN
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		     SELECT 0 AS message;
		     ROLLBACK;
		END;
		
	
		
		UPDATE usermaster SET `Password` = password_, IsActive = 1,IsLocked = 0,LoginAttempts = 0 WHERE PublicID = publicid_;
		
		
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.UpdatePeriodMaterActiveStatusByID
DROP PROCEDURE IF EXISTS `UpdatePeriodMaterActiveStatusByID`;
DELIMITER //
CREATE PROCEDURE `UpdatePeriodMaterActiveStatusByID`(IN `PeriodPublicID` INT, IN `UpdatedBy_` VARCHAR(50))
BEGIN
SET @PublicID  = PeriodPublicID;

UPDATE periodmaster  SET UpdatedBy = UpdatedBy_, `IsActive` =  CASE  
	WHEN  `IsActive` = 1	THEN  0
	WHEN  `IsActive` = 0	THEN  1
	ELSE 
	`IsActive`
	END  
	WHERE PeriodMasterID = @PublicID;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.UpdateSchoolActiveStatusByID
DROP PROCEDURE IF EXISTS `UpdateSchoolActiveStatusByID`;
DELIMITER //
CREATE PROCEDURE `UpdateSchoolActiveStatusByID`(IN `SchoolPublicID` VARCHAR(50), IN `UpdatedBy_` VARCHAR(50))
BEGIN
SET @PublicID  = SchoolPublicID;
SET @TENANTID = (SELECT SM.TenantID FROM schoolmaster SM WHERE SM.PublicID = SchoolPublicID);
UPDATE schoolmaster SET UpdatedBy = UpdatedBy_, `IsActive` =  CASE  
	WHEN  `IsActive` = 1	THEN  0
	WHEN  `IsActive` = 0	THEN  1
	ELSE 
	`IsActive`
	END  
	WHERE `PublicID` = @PublicID;
	

SET @ACTIVESTATUS  = (SELECT SM.IsActive FROM schoolmaster SM WHERE SM.PublicID = SchoolPublicID);

UPDATE tenantmaster SET IsActive = @ACTIVESTATUS WHERE TenantID = @TENANTID;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.UpdateStudentLokedStatus
DROP PROCEDURE IF EXISTS `UpdateStudentLokedStatus`;
DELIMITER //
CREATE PROCEDURE `UpdateStudentLokedStatus`(IN `STUDENTNO_` VARCHAR(500), IN `UpdatedBy_` VARCHAR(50))
BEGIN

SET @PublicID  = (SELECT SM.StudentMasterPublicID FROM studentmaster SM WHERE SM.StudentNo = STUDENTNO_ );

UPDATE usermaster SET UpdatedBy = UpdatedBy_, `IsLocked` =  CASE  
	WHEN  `IsLocked` = 1	THEN  0
	WHEN  `IsLocked` = 0	THEN  1
	ELSE 
	`IsLocked`
	END  
	WHERE `PublicID` = @PublicID;

UPDATE studentmaster  SET UpdatedBy = UpdatedBy_,  IsActive =  CASE  
	WHEN  `IsActive` = 1	THEN  0
	WHEN  `IsActive` = 0	THEN  1
	ELSE 
	`IsActive`
	END  
	WHERE  `StudentMasterPublicID` = @PublicID;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.UpdateSubjectMaterActiveStatusByID
DROP PROCEDURE IF EXISTS `UpdateSubjectMaterActiveStatusByID`;
DELIMITER //
CREATE PROCEDURE `UpdateSubjectMaterActiveStatusByID`(IN `SUBJECTMASTERID_` VARCHAR(50), IN `UpdatedBy_` VARCHAR(50))
BEGIN
SET @PublicID = SUBJECTMASTERID_;
UPDATE subjectmater  SET UpdatedBy = UpdatedBy_, `IsActive` =  CASE  
	WHEN  `IsActive` = 1	THEN  0
	WHEN  `IsActive` = 0	THEN  1
	ELSE 
	`IsActive`
	END  
	WHERE SubjectMaterID = @PublicID;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.UpdateTeacherLockedStatus
DROP PROCEDURE IF EXISTS `UpdateTeacherLockedStatus`;
DELIMITER //
CREATE PROCEDURE `UpdateTeacherLockedStatus`(IN `PublicID_` VARCHAR(50), IN `UpdatedBy_` VARCHAR(50))
BEGIN

SET @PublicID  = PublicID_;

UPDATE usermaster SET UpdatedBy = UpdatedBy_, `IsLocked` =  CASE  
	WHEN  `IsLocked` = 1	THEN  0
	WHEN  `IsLocked` = 0	THEN  1
	ELSE 
	`IsLocked`
	END  
	WHERE `PublicID` = @PublicID;

UPDATE teachermaster SET UpdatedBy = UpdatedBy_, IsActive =  CASE  
	WHEN  `IsActive` = 1	THEN  0
	WHEN  `IsActive` = 0	THEN  1
	ELSE 
	`IsActive`
	END  
	WHERE `TeaherMasterPublicID`  = @PublicID;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.UpdateTermMasterStatus
DROP PROCEDURE IF EXISTS `UpdateTermMasterStatus`;
DELIMITER //
CREATE PROCEDURE `UpdateTermMasterStatus`(IN `TermID` INT, IN `TenantID_` VARCHAR(500), IN `UpdatedBy_` VARCHAR(50))
BEGIN
		SET @TermMasterID  = TermID;
		
		UPDATE  termmaster  SET UpdatedBy = UpdatedBy_, `IsSysActive` = 0 WHERE `IsSysActive` = 1 AND TenantID= TenantID_;
		
		UPDATE termmaster  SET UpdatedBy = UpdatedBy_, `IsSysActive` =  CASE  
			WHEN  `IsSysActive` = 1	THEN  0
			WHEN  `IsSysActive` = 0	THEN  1
			ELSE 
			`IsSysActive`
			END  
			WHERE TermMasterID = @TermMasterID AND TenantID= TenantID_;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.UpdateUserLockedStatus
DROP PROCEDURE IF EXISTS `UpdateUserLockedStatus`;
DELIMITER //
CREATE PROCEDURE `UpdateUserLockedStatus`(
	IN `PublicID_` VARCHAR(500),
	IN `UpdatedBy_` VARCHAR(100)
)
BEGIN
SET @PublicID  = PublicID_;

UPDATE usermaster SET UpdatedBy = UpdatedBy_, `IsLocked` =  CASE  
	WHEN  `IsLocked` = 1	THEN  0
	WHEN  `IsLocked` = 0	THEN  1
	ELSE 
	`IsLocked`
	END  
	WHERE `PublicID` = @PublicID;

END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.UpdateUserPassword
DROP PROCEDURE IF EXISTS `UpdateUserPassword`;
DELIMITER //
CREATE PROCEDURE `UpdateUserPassword`()
BEGIN
SET @PublicID  = PublicID_;

UPDATE usermaster SET UpdatedBy = UpdatedBy_, `IsLocked` =  CASE  
	WHEN  `IsLocked` = 1	THEN  0
	WHEN  `IsLocked` = 0	THEN  1
	ELSE 
	`IsLocked`
	END  
	WHERE `PublicID` = @PublicID;
	
	UPDATE usermaster  SET Password = '' WHERE `PublicID` = @PublicID;
END//
DELIMITER ;

-- Dumping structure for function 3edu_db.GetClassName
DROP FUNCTION IF EXISTS `GetClassName`;
DELIMITER //
CREATE FUNCTION `GetClassName`(`ClassCode` CHAR(5), `SchoolID` VARCHAR(50)) RETURNS varchar(50) CHARSET utf8mb4
BEGIN
   
 			DECLARE SUBJECTNAME VARCHAR(50);
		
		     SELECT SM.SubjectName INTO SUBJECTNAME FROM subjectmater SM WHERE SM.SubjectCode = ClassCode AND SM.SchoolID = SchoolID;
    
         
			
	
				
			-- return the Sequence
			RETURN SUBJECTNAME ;
				
			
			
    
   
END//
DELIMITER ;

-- Dumping structure for function 3edu_db.GetSequence
DROP FUNCTION IF EXISTS `GetSequence`;
DELIMITER //
CREATE FUNCTION `GetSequence`(`SequenceID` INT) RETURNS varchar(50) CHARSET latin1
BEGIN
   
 			DECLARE LASTINSERTEDID VARCHAR(50);
			DECLARE NEWLASTINSETEDID VARCHAR(50);
			DECLARE SEQUNCECODE CHAR(4);
		
    
         SELECT SM.LastInsertedID INTO LASTINSERTEDID FROM sequencemaster SM WHERE SM.SequenceMasterID = SequenceID;
			
			SELECT SM.LastInsertedID+1 INTO NEWLASTINSETEDID FROM sequencemaster SM  WHERE SM.SequenceMasterID = SequenceID;
				
			SELECT SM.SequnceCode INTO  SEQUNCECODE FROM sequencemaster SM  WHERE SM.SequenceMasterID = SequenceID;
				
			UPDATE sequencemaster SET `LastInsertedID` = NEWLASTINSETEDID WHERE SequenceMasterID = SequenceID;
				
			-- return the Sequence
			RETURN CONCAT(SEQUNCECODE,"000000000",NEWLASTINSETEDID) ;
				
			
			
    
   
END//
DELIMITER ;

-- Dumping structure for function 3edu_db.GetStudntNo
DROP FUNCTION IF EXISTS `GetStudntNo`;
DELIMITER //
CREATE FUNCTION `GetStudntNo`(`SequenceID` INT) RETURNS varchar(50) CHARSET latin1
BEGIN
   
 			DECLARE LASTINSERTEDID VARCHAR(50);
			DECLARE NEWLASTINSETEDID VARCHAR(50);
			DECLARE SEQUNCECODE CHAR(4);
		
    
         SELECT SM.LastInsertedID INTO LASTINSERTEDID FROM sequencemaster SM WHERE SM.SequenceMasterID = SequenceID;
			
			SELECT SM.LastInsertedID+1 INTO NEWLASTINSETEDID FROM sequencemaster SM  WHERE SM.SequenceMasterID = SequenceID;
				
			SELECT SM.SequnceCode INTO  SEQUNCECODE FROM sequencemaster SM  WHERE SM.SequenceMasterID = SequenceID;
				
			UPDATE sequencemaster SET `LastInsertedID` = NEWLASTINSETEDID WHERE SequenceMasterID = SequenceID;
				
			-- return the Sequence
			RETURN CONCAT('SN',YEAR(CURDATE()),"0",NEWLASTINSETEDID) ;
				
			
			
    
   
END//
DELIMITER ;

-- Dumping structure for function 3edu_db.GetTenantIDByClassMasterPublicID
DROP FUNCTION IF EXISTS `GetTenantIDByClassMasterPublicID`;
DELIMITER //
CREATE FUNCTION `GetTenantIDByClassMasterPublicID`(`ClassMasterPublicID_` VARCHAR(100)) RETURNS varchar(100) CHARSET utf8mb4
BEGIN
   
 			DECLARE TENANTID VARCHAR(100);
		
		     SELECT CM.TenantID INTO TENANTID FROM classmaster CM WHERE CM.ClassMasterPublicID = ClassMasterPublicID_ ;
    
         
			
	
				
			-- return the Sequence
			RETURN TENANTID ;
				
			
			
    
   
END//
DELIMITER ;

-- Dumping structure for trigger 3edu_db.AddStudentToUserMaster
DROP TRIGGER IF EXISTS `AddStudentToUserMaster`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `AddStudentToUserMaster` AFTER INSERT ON `studentmaster` FOR EACH ROW BEGIN

DECLARE Password_ VARCHAR(300);
SELECT '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO' INTO Password_ ;
INSERT INTO usermaster
	(
	 PublicID,
	 UserName, 
	 Password, 
	 FirstName, 
	 LastName, 
	 OtherName,
	 GenderID,
	 MaritalStatusID,
	 DOB, 
	 UserTypeID, 
	 UpdatedBy,
	 UpdatedOn,
	 IsActive,
	 TenantID
	 )
	 
	SELECT SM.StudentMasterPublicID,
		 SM.StudentNo,
		 Password_,
		 SM.FirstName,
		 SM.LastName,
		 SM.OtherName,
		 SM.GenderID,
		 SM.MaritalStatusID,
		 SM.DOB,
		 2,
		SM.UpdatedBy,
		NOW(),
		 0,
		GetTenantIDByClassMasterPublicID(SM.ClassMasterPublicID)		 
  FROM studentmaster SM  WHERE SM.StudentMasterID = (SELECT MAX(STM.StudentMasterID) FROM studentmaster STM);
	

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger 3edu_db.AddTimeTableDeails
DROP TRIGGER IF EXISTS `AddTimeTableDeails`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `AddTimeTableDeails` AFTER INSERT ON `timetablemaster` FOR EACH ROW BEGIN
SET @TIMETABLEMASTERID  = (SELECT MAX(TimeTableMasterID) FROM timetablemaster);

SET @UPDATEDBY  = (SELECT TM.UpdatedBy FROM timetablemaster TM WHERE TM.TimeTableMasterID = @TIMETABLEMASTERID );

INSERT INTO timetabledetails (`TimeTableMaterD`,`UpdatedBy`) VALUES (@TIMETABLEMASTERID,@UPDATEDBY);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger 3edu_db.SessionHistory
DROP TRIGGER IF EXISTS `SessionHistory`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `SessionHistory` AFTER INSERT ON `session` FOR EACH ROW BEGIN
			INSERT INTO sessionhistory  (	
													SessionID,
													UserMasterPublicID,
													SerialID,TokenID,
													TokenCreatedTime,
													UpdatedBy,UpdatedOn 
									)
			SELECT * 
			FROM `session` SH WHERE SH.SessionID = (SELECT MAX(SN.SessionID) FROM `session` SN );
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for view 3edu_db.vwsequncemaster
DROP VIEW IF EXISTS `vwsequncemaster`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vwsequncemaster`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vwsequncemaster` AS SELECT `SM`.`SequenceMasterID` AS `SequenceMasterID`, `SM`.`SequnceCode` AS `SequnceCode`, `SM`.`LastInsertedID` AS `LastInsertedID`, `SM`.`UpdatedOn` AS `UpdatedOn` FROM `sequencemaster` AS `SM` ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

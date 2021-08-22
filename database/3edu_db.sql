-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.20-MariaDB - mariadb.org binary distribution
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
  `AddressID` int(11) NOT NULL AUTO_INCREMENT,
  `PrimaryAddress` varchar(50) NOT NULL,
  `SecondaryAddress` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(50) NOT NULL DEFAULT '10010',
  `DistrictID` int(11) NOT NULL,
  `IdentificationID` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`AddressID`),
  KEY `FK_address_district` (`DistrictID`),
  CONSTRAINT `FK_address_district` FOREIGN KEY (`DistrictID`) REFERENCES `district` (`DistrictID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.address: ~2 rows (approximately)
DELETE FROM `address`;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` (`AddressID`, `PrimaryAddress`, `SecondaryAddress`, `ZipCode`, `DistrictID`, `IdentificationID`, `UpdatedOn`) VALUES
	(5, 'test', NULL, '10010', 3, 'TECH0000000003', '2020-11-20 11:52:45'),
	(12, '204 B provident road Fairview', 'Lusaka, Chelenge', '10010', 44, 'TECH00000000080', '2021-08-21 18:05:08');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.assementtypemaster
DROP TABLE IF EXISTS `assementtypemaster`;
CREATE TABLE IF NOT EXISTS `assementtypemaster` (
  `AssementTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `GradeMasterID` int(11) NOT NULL,
  `SubjectCode` char(5) NOT NULL,
  `AssementTypeName` varchar(50) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedBy` varchar(50) NOT NULL,
  `TenantID` varchar(400) NOT NULL,
  PRIMARY KEY (`SubjectCode`,`GradeMasterID`,`AssementTypeName`,`TenantID`) USING BTREE,
  UNIQUE KEY `Index 3` (`AssementTypeID`),
  KEY `FK_assementtypemaster_grademaster` (`GradeMasterID`),
  KEY `FK_assementtypemaster_tenantmaster` (`TenantID`),
  CONSTRAINT `FK_assementtypemaster_grademaster` FOREIGN KEY (`GradeMasterID`) REFERENCES `grademaster` (`GradeMasterID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_assementtypemaster_subjectmater` FOREIGN KEY (`SubjectCode`) REFERENCES `subjectmater` (`SubjectCode`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_assementtypemaster_tenantmaster` FOREIGN KEY (`TenantID`) REFERENCES `tenantmaster` (`TenantID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.assementtypemaster: ~6 rows (approximately)
DELETE FROM `assementtypemaster`;
/*!40000 ALTER TABLE `assementtypemaster` DISABLE KEYS */;
INSERT INTO `assementtypemaster` (`AssementTypeID`, `GradeMasterID`, `SubjectCode`, `AssementTypeName`, `IsActive`, `UpdatedOn`, `UpdatedBy`, `TenantID`) VALUES
	(1, 8, 'MATH', 'Class Exercis 1', '1', '2021-06-13 07:28:11', 'sys', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(2, 8, 'MATH', 'End Of Tem Test', '1', '2021-06-13 07:29:01', 'sys', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(3, 8, 'MATH', 'Mid Tem Test', '1', '2021-06-13 07:28:30', 'sys', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(4, 9, 'MATH', 'Class Exercis 1', '1', '2021-07-04 11:53:53', 'sys', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(5, 9, 'MATH', 'End Of Tem Test', '1', '2021-07-04 11:54:15', 'sys', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(6, 9, 'MATH', 'Mid Tem Test', '1', '2021-07-04 11:55:02', 'sys', '5fe7597e-f7a1-11eb-a81c-1062e5c23529');
/*!40000 ALTER TABLE `assementtypemaster` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.classdetails: ~28 rows (approximately)
DELETE FROM `classdetails`;
/*!40000 ALTER TABLE `classdetails` DISABLE KEYS */;
INSERT INTO `classdetails` (`ClassDetailsID`, `ClassDetailsPublicID`, `ClassMasterPublicID`, `SubjectCode`, `ClassRoomPublicID`, `IsActive`, `UpdatedBy`, `UpdatedOn`) VALUES
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
	(41, 'CLDT00000000067', 'CLAS00000000063', 'ENG', 'CLRM0000000001', '1', 'it', '2021-08-18 06:19:54');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.classmaster: ~12 rows (approximately)
DELETE FROM `classmaster`;
/*!40000 ALTER TABLE `classmaster` DISABLE KEYS */;
INSERT INTO `classmaster` (`ClassMasterID`, `ClassMasterPublicID`, `ClassTeacherID`, `GradeMasterID`, `ClassName`, `ClassCode`, `Description`, `UpdatedBy`, `UpdatedOn`, `AddedOn`, `IsActive`, `TenantID`) VALUES
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
	(21, 'CLAS00000000063', 'TECH0000000003', 7, 'Grade 7', '7 F', NULL, 'it', '2021-08-18 15:28:04', '2021-08-18 06:19:54', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529');
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
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.classroom: ~6 rows (approximately)
DELETE FROM `classroom`;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` (`ClassRoomID`, `ClassRoomPublicID`, `ClassRoomName`, `UpdatedBy`, `UpdatedOn`, `IsActive`, `TenantID`) VALUES
	(1, 'CLRM0000000001', 'Room 1', 'sys', '2020-05-24 16:17:04', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(2, 'CLRM0000000002', 'Room 2', 'sys', '2020-05-24 16:17:48', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(3, 'CLRM0000000003', 'Room 3', 'sys', '2020-05-24 16:18:00', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(4, 'CLRM0000000004', 'Room 4', 'sys', '2020-05-24 16:18:16', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(169, 'CLRM00000000080', 'Room 5', 'it', '2021-08-22 14:54:10', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(255, 'CLRM00000000081', 'Room 6', 'it', '2021-08-22 15:30:30', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529');
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

-- Dumping data for table 3edu_db.comboboxvaluemaster: ~0 rows (approximately)
DELETE FROM `comboboxvaluemaster`;
/*!40000 ALTER TABLE `comboboxvaluemaster` DISABLE KEYS */;
INSERT INTO `comboboxvaluemaster` (`ComboBoxValueMasterID`, `ID`, `Name`, `Value`, `Active`, `UpdatedOn`) VALUES
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

-- Dumping data for table 3edu_db.country: ~0 rows (approximately)
DELETE FROM `country`;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`CountryID`, `CountryName`, `ConuntryCode`, `IsActive`) VALUES
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
DELETE FROM `credentials_tb`;
/*!40000 ALTER TABLE `credentials_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `credentials_tb` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.department
DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `DepartmentID` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(50) NOT NULL,
  `ShortHand` char(4) NOT NULL,
  `SchoolMasterID` varchar(50) NOT NULL,
  PRIMARY KEY (`DepartmentID`),
  UNIQUE KEY `ShortHand` (`ShortHand`),
  KEY `FK_department_schoolmaster` (`SchoolMasterID`),
  CONSTRAINT `FK_department_schoolmaster` FOREIGN KEY (`SchoolMasterID`) REFERENCES `schoolmaster` (`PublicID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.department: ~7 rows (approximately)
DELETE FROM `department`;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`DepartmentID`, `DepartmentName`, `ShortHand`, `SchoolMasterID`) VALUES
	(1, 'Social Sciences', 'SSS', 'SCHL0000000001'),
	(2, 'Mathermatics', 'MATH', 'SCHL0000000001'),
	(3, 'Home Ecomomics', 'HE', 'SCHL0000000001'),
	(4, 'Science', 'SCEN', 'SCHL0000000001'),
	(5, 'English Language', 'EGLA', 'SCHL0000000001'),
	(6, 'Comercial Subject', 'CMSB', 'SCHL0000000001'),
	(7, 'Expresive Arts', 'EXAT', 'SCHL0000000001');
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
DELETE FROM `district`;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` (`DistrictID`, `DistrictName`, `ProvinceID`, `IsActive`) VALUES
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

-- Dumping data for table 3edu_db.emailservice: ~0 rows (approximately)
DELETE FROM `emailservice`;
/*!40000 ALTER TABLE `emailservice` DISABLE KEYS */;
INSERT INTO `emailservice` (`EmailServiceID`, `EmailSerial`, `EmailAddress`, `EmailSubject`, `SendData`, `Status`, `UpdatedBy`, `UpdatedOn`) VALUES
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
DELETE FROM `gendermaster`;
/*!40000 ALTER TABLE `gendermaster` DISABLE KEYS */;
INSERT INTO `gendermaster` (`GenderMasterID`, `Gender`, `ShortName`, `IsActive`) VALUES
	(1, 'Male', 'M', '1'),
	(2, 'Female', 'F', '1');
/*!40000 ALTER TABLE `gendermaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.grademaster
DROP TABLE IF EXISTS `grademaster`;
CREATE TABLE IF NOT EXISTS `grademaster` (
  `GradeMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `Grade` int(11) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `TenantID` varbinary(400) NOT NULL,
  PRIMARY KEY (`GradeMasterID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.grademaster: ~12 rows (approximately)
DELETE FROM `grademaster`;
/*!40000 ALTER TABLE `grademaster` DISABLE KEYS */;
INSERT INTO `grademaster` (`GradeMasterID`, `Grade`, `IsActive`, `TenantID`) VALUES
	(1, 1, '1', _binary 0x35666537353937652d663761312d313165622d613831632d313036326535633233353239),
	(2, 2, '1', _binary 0x35666537353937652d663761312d313165622d613831632d313036326535633233353239),
	(3, 3, '1', _binary 0x35666537353937652d663761312d313165622d613831632d313036326535633233353239),
	(4, 4, '1', _binary 0x35666537353937652d663761312d313165622d613831632d313036326535633233353239),
	(5, 5, '1', _binary 0x35666537353937652d663761312d313165622d613831632d313036326535633233353239),
	(6, 6, '1', _binary 0x35666537353937652d663761312d313165622d613831632d313036326535633233353239),
	(7, 7, '1', _binary 0x35666537353937652d663761312d313165622d613831632d313036326535633233353239),
	(8, 8, '1', _binary 0x35666537353937652d663761312d313165622d613831632d313036326535633233353239),
	(9, 9, '1', _binary 0x35666537353937652d663761312d313165622d613831632d313036326535633233353239),
	(10, 10, '1', _binary 0x35666537353937652d663761312d313165622d613831632d313036326535633233353239),
	(11, 11, '1', _binary 0x35666537353937652d663761312d313165622d613831632d313036326535633233353239),
	(12, 12, '1', _binary 0x35666537353937652d663761312d313165622d613831632d313036326535633233353239);
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
DELETE FROM `gradingmaster`;
/*!40000 ALTER TABLE `gradingmaster` DISABLE KEYS */;
INSERT INTO `gradingmaster` (`GradingMasterID`, `Grade`, `Percentage`, `IsActive`, `UpdatedBy`, `UpdatedOn`) VALUES
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
DELETE FROM `maritalstatusmaster`;
/*!40000 ALTER TABLE `maritalstatusmaster` DISABLE KEYS */;
INSERT INTO `maritalstatusmaster` (`MaritalStatusMasterID`, `MaritalStatus`, `IsActive`) VALUES
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
  `SequenceID` int(11) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `UpdatedOn` varchar(50) NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PeriodMasterID`),
  UNIQUE KEY `SequenceID` (`SequenceID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.periodmaster: ~5 rows (approximately)
DELETE FROM `periodmaster`;
/*!40000 ALTER TABLE `periodmaster` DISABLE KEYS */;
INSERT INTO `periodmaster` (`PeriodMasterID`, `PeriodName`, `SequenceID`, `IsActive`, `UpdatedOn`) VALUES
	(1, 'Period 1', 1, '1', '2021-06-27 13:03:21'),
	(2, 'Period 2', 2, '1', '2021-06-27 13:03:35'),
	(3, 'Period 3', 3, '1', '2021-06-27 13:03:42'),
	(4, 'Period 4', 4, '1', '2021-06-27 13:03:47'),
	(5, 'Period 5', 5, '0', '2021-06-27 13:03:55');
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
DELETE FROM `province`;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` (`ProvinceID`, `ProvinceName`, `CountryID`, `IsActive`) VALUES
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
  `SchoolMotto` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `SchoolURl` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `SchoolDescription` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `MaxTerms` int(11) NOT NULL DEFAULT 3,
  `Longitude` double NOT NULL DEFAULT 0,
  `Latitude` double NOT NULL DEFAULT 0,
  `Tel` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `PhoneNo` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `IsActive` char(1) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `UpdatedBy` varchar(50) CHARACTER SET latin1 NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `TenantID` varchar(400) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`SchoolID`) USING BTREE,
  UNIQUE KEY `PublicID` (`PublicID`) USING BTREE,
  UNIQUE KEY `EMISNO` (`EMISNO`) USING BTREE,
  KEY `FK_schoolmaster_tenantmaster` (`TenantID`),
  CONSTRAINT `FK_schoolmaster_tenantmaster` FOREIGN KEY (`TenantID`) REFERENCES `tenantmaster` (`TenantID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table 3edu_db.schoolmaster: ~2 rows (approximately)
DELETE FROM `schoolmaster`;
/*!40000 ALTER TABLE `schoolmaster` DISABLE KEYS */;
INSERT INTO `schoolmaster` (`SchoolID`, `PublicID`, `EMISNO`, `PicURL`, `SchoolName`, `SchoolMotto`, `SchoolURl`, `SchoolDescription`, `MaxTerms`, `Longitude`, `Latitude`, `Tel`, `PhoneNo`, `IsActive`, `UpdatedBy`, `UpdatedOn`, `TenantID`) VALUES
	(2, 'SCHL0000000001', 'E43435', '../../uploads/shcool_logos/SCHL0000000001_logo.png', 'Lusaka Secondary School', 'Quality And Ealencey', '', 'ThisSchool Aims at bringing out the best n your ch', 3, 3.3311, 322.2252, '+262222147', '+260998854878', '1', 'Admin', '2020-01-24 16:56:52', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(4, 'SCHL0000000004', 'E43434', '', 'Sacred Hart Convert School', NULL, NULL, NULL, 3, 434.45466, 33434.34376, '+262222147', '+260998854878', '1', 'debs', '2021-04-27 06:08:14', 'a29294e8-f7a1-11eb-a81c-1062e5c23529');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.sequencemaster: ~14 rows (approximately)
DELETE FROM `sequencemaster`;
/*!40000 ALTER TABLE `sequencemaster` DISABLE KEYS */;
INSERT INTO `sequencemaster` (`SequenceMasterID`, `SequnceCode`, `LastInsertedID`, `UpdatedOn`) VALUES
	(1, 'TECH', 89, '2019-11-01 19:08:09'),
	(2, 'HEAD', 0, '2019-11-01 19:49:01'),
	(3, 'TOKN', 123, '2019-11-01 20:00:03'),
	(4, 'EMIL', 3, '2019-11-15 05:28:12'),
	(5, 'TRPD', 3, '2019-11-17 07:13:19'),
	(6, 'SCHL', 2, '2019-11-17 18:52:58'),
	(7, 'TRD', 2, '2019-11-18 21:59:20'),
	(8, 'STNO', 40, '2021-05-22 19:45:06'),
	(9, 'SDNT', 35, '2021-05-22 20:49:17'),
	(10, 'STDT', 44, '2021-05-22 22:25:57'),
	(18, 'CLAS', 63, '2021-08-16 12:49:49'),
	(19, 'CLDT', 67, '2021-08-16 12:50:17'),
	(20, 'TEDT', 102, '2021-08-21 11:22:16'),
	(21, 'CLRM', 81, '2021-08-22 11:42:24');
/*!40000 ALTER TABLE `sequencemaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.session
DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `SessionID` int(11) NOT NULL AUTO_INCREMENT,
  `UserMasterPublicID` varchar(50) NOT NULL,
  `SerialID` varchar(50) NOT NULL,
  `TokenID` varchar(50) NOT NULL,
  `TokenCreatedTime` varchar(50) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SessionID`),
  KEY `FK_session_usermaster` (`UserMasterPublicID`),
  CONSTRAINT `FK_session_usermaster` FOREIGN KEY (`UserMasterPublicID`) REFERENCES `usermaster` (`PublicID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.session: ~3 rows (approximately)
DELETE FROM `session`;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` (`SessionID`, `UserMasterPublicID`, `SerialID`, `TokenID`, `TokenCreatedTime`, `UpdatedBy`, `UpdatedOn`) VALUES
	(120, '202000041', 'TOKN000000000120', 'ded346951f1db8eeaa836276b1a89f73752c350b4dd1fe9308', '1629644352', 's', '2021-08-22 16:59:13'),
	(122, 'TECH0000000003', 'TOKN000000000122', '97651468aeb9c0b9d38214d79ea2a5155866f83f9bebf50a89', '1629655461', 't', '2021-08-22 20:04:21'),
	(123, 'SDNT00000000035', 'TOKN000000000123', 'aea64054d8b4996fbe091b818b95a5a39f652ccc4d93734db7', '1629655527', 'SN2021040', '2021-08-22 20:05:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.sessionhistory: ~4 rows (approximately)
DELETE FROM `sessionhistory`;
/*!40000 ALTER TABLE `sessionhistory` DISABLE KEYS */;
INSERT INTO `sessionhistory` (`SessionHistoryID`, `SessionID`, `UserMasterPublicID`, `SerialID`, `TokenID`, `TokenCreatedTime`, `UpdatedBy`, `UpdatedOn`) VALUES
	(120, '120', '202000041', 'TOKN000000000120', 'ded346951f1db8eeaa836276b1a89f73752c350b4dd1fe9308', '1629644352', 's', '2021-08-22 16:59:13'),
	(121, '121', 'SDNT00000000035', 'TOKN000000000121', '6b2dba56e25335b7406ba187f2af10c3fafbc19b3986a8e172', '1629647125', 'SN2021040', '2021-08-22 17:45:25'),
	(122, '122', 'TECH0000000003', 'TOKN000000000122', '97651468aeb9c0b9d38214d79ea2a5155866f83f9bebf50a89', '1629655461', 't', '2021-08-22 20:04:21'),
	(123, '123', 'SDNT00000000035', 'TOKN000000000123', 'aea64054d8b4996fbe091b818b95a5a39f652ccc4d93734db7', '1629655527', 'SN2021040', '2021-08-22 20:05:27');
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
DELETE FROM `statusmaster`;
/*!40000 ALTER TABLE `statusmaster` DISABLE KEYS */;
INSERT INTO `statusmaster` (`StatusMasterID`, `StatueCode`, `Statue`) VALUES
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.studentattendance: ~17 rows (approximately)
DELETE FROM `studentattendance`;
/*!40000 ALTER TABLE `studentattendance` DISABLE KEYS */;
INSERT INTO `studentattendance` (`StudentAttendanceID`, `StudentID`, `ClassID`, `UpdatedOn`, `Status`, `Reason`) VALUES
	(59, '3EDU202100034', 'CLAS0000000008', '2021-07-02 12:54:13', '2', 'hjvhjv'),
	(60, '3EDU202100023', 'CLAS0000000004', '2021-07-02 12:54:56', '2', NULL),
	(61, '3EDU202100020', 'CLAS0000000004', '2021-07-02 12:54:56', '1', NULL),
	(62, '3EDU202100010', 'CLAS0000000004', '2021-07-02 12:54:56', '1', NULL),
	(63, '3EDU202100009', 'CLAS0000000004', '2021-07-02 12:54:56', '2', NULL),
	(64, '3EDU202100023', 'CLAS0000000004', '2021-07-01 13:02:17', '3', NULL),
	(65, '3EDU202100020', 'CLAS0000000004', '2021-07-01 13:02:17', '3', NULL),
	(66, '3EDU202100010', 'CLAS0000000004', '2021-07-01 13:02:17', '3', NULL),
	(67, '3EDU202100009', 'CLAS0000000004', '2021-07-01 13:02:17', '3', NULL),
	(68, 'SN2021040', 'CLAS0000000004', '2021-08-22 20:05:12', '1', NULL),
	(69, 'SN2021037', 'CLAS0000000004', '2021-08-22 20:05:12', '2', NULL),
	(70, 'SN2021036', 'CLAS0000000004', '2021-08-22 20:05:12', '2', NULL),
	(71, 'SN2021035', 'CLAS0000000004', '2021-08-22 20:05:12', '2', NULL),
	(72, 'SN2021031', 'CLAS0000000004', '2021-08-22 20:05:12', '1', NULL),
	(73, 'SN2021030', 'CLAS0000000004', '2021-08-22 20:05:12', '2', NULL),
	(74, 'SN2021029', 'CLAS0000000004', '2021-08-22 20:05:12', '1', NULL),
	(75, 'SN2021028', 'CLAS0000000004', '2021-08-22 20:05:12', '2', NULL);
/*!40000 ALTER TABLE `studentattendance` ENABLE KEYS */;

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
DELETE FROM `studentdetails`;
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
  PRIMARY KEY (`StudentMasterID`) USING BTREE,
  UNIQUE KEY `StudentNo` (`StudentNo`),
  UNIQUE KEY `StudentMasterPublicID` (`StudentMasterPublicID`),
  KEY `FK_studentmaster_gendermaster` (`GenderID`),
  KEY `FK_studentmaster_maritalstatusmaster` (`MaritalStatusID`),
  KEY `FK_studentmaster_classmaster` (`ClassMasterPublicID`),
  CONSTRAINT `FK_studentmaster_classmaster` FOREIGN KEY (`ClassMasterPublicID`) REFERENCES `classmaster` (`ClassMasterPublicID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_studentmaster_gendermaster` FOREIGN KEY (`GenderID`) REFERENCES `gendermaster` (`GenderMasterID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_studentmaster_maritalstatusmaster` FOREIGN KEY (`MaritalStatusID`) REFERENCES `maritalstatusmaster` (`MaritalStatusMasterID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.studentmaster: ~11 rows (approximately)
DELETE FROM `studentmaster`;
/*!40000 ALTER TABLE `studentmaster` DISABLE KEYS */;
INSERT INTO `studentmaster` (`StudentMasterID`, `StudentMasterPublicID`, `ProfilePic`, `StudentNo`, `FirstName`, `LastName`, `OtherName`, `GenderID`, `MaritalStatusID`, `ClassMasterPublicID`, `DOB`, `EmailAddress`, `GuardianContactNo`, `GuardianMaleName`, `GuardianFemaleName`, `Address`, `UpdatedBy`, `UpdatedOn`, `Year`, `IsActive`) VALUES
	(3, 'SDNT0000000001', '../../uploads/3EDU20210005_images.png', 'SN2021028', 'Alinuswe', 'Banda', NULL, 1, 4, 'CLAS0000000004', '1996-05-22', NULL, '097785684', 'Ali Mwanza', 'Tina Type', 'North mind Bwigimfumu', 'it', '2021-05-22 18:01:06', '2021', '1'),
	(9, 'SDNT0000000005', '../../uploads/3EDU202100010_reri.jpg', 'SN2021029', 'Samuel', 'Banda', 'Liabwa', 1, 3, 'CLAS0000000004', '1992-01-01', NULL, '0977856258', 'Mwamba Liabwa Banda', 'Mwape Liabwa', 'North Mid Lusaka', 'it', '2021-05-22 22:23:33', '2021', '1'),
	(17, 'SDNT00000000015', '../../uploads/3EDU20210008_lady.png', 'SN2021030', 'Mwaka', 'Vwalika', 'Candy', 1, 4, 'CLAS0000000004', '2004-01-01', NULL, '0977856258', 'Mwamba Liabwa Vwalika', 'Mwape Vwalika', '204 B provident road Fairview', 'it', '2021-05-22 23:57:34', '2021', '1'),
	(20, 'SDNT00000000018', '../../uploads/defult.png', 'SN2021031', 'Myday', 'Kasalwe', NULL, 2, 1, 'CLAS0000000004', '2004-05-14', NULL, '0977100587', 'Mwamba Liabwa Banda', NULL, 'Luska Zambia', 'it', '2021-05-23 00:13:35', '2021', '1'),
	(22, 'SDNT00000000026', '../../uploads/defult.png', 'SN2021032', 'Emmanuel', 'Mwando', 'Lukulu', 1, 2, 'CLAS0000000013', '2021-05-07', NULL, '0977100587', 'sdsd', NULL, 'Lusaka, Chelenge', 'it', '2021-05-23 00:31:30', '2021', '1'),
	(24, 'SDNT00000000028', '../../uploads/3EDU202100033_lady.png', 'SN2021033', 'Test', 'Pupile', NULL, 1, 4, 'CLAS0000000013', '2000-01-01', 'alinuswemwandobo@gmail.com4', '0977100587', 'Mwamba Liabwa Banda', 'Mwape Liabwa', 'Lusaka, Chelenge', 'it', '2021-05-23 21:59:44', '2021', '1'),
	(27, 'SDNT00000000029', '../../uploads/defult.png', 'SN2021034', 'Mwazube', 'Mkonde', NULL, 1, 4, 'CLAS0000000008', '2021-07-04', NULL, '', 'Mwaba Kaenga', NULL, 'Lusaka Xelston', 'it', '2021-07-04 12:03:36', '2021', '1'),
	(29, 'SDNT00000000030', '../../uploads/defult.png', 'SN2021035', 'Emmanuel', 'Mwando', 'Mwando', 1, 4, 'CLAS0000000004', '1996-01-01', 'prototype1496@gmail.com', '0977100587', 'Mwamba Liabwa Banda', 'Banda', '204 B provident road Fairview', 'it', '2021-08-07 16:37:46', '2021', '1'),
	(30, 'SDNT00000000031', '../../uploads/3EDU202100036_marcal.jpg', 'SN2021036', 'Student', 'X', 'Mwando', 1, 4, 'CLAS0000000004', '1996-01-01', 'prototype1496@gmail.com', '0977100587', 'Mwamba Liabwa Banda', 'Banda', '204 B provident road Fairview', 'it', '2021-08-07 16:38:56', '2021', '1'),
	(31, 'SDNT00000000032', '../../uploads/defult.png', 'SN2021037', 'Test J', 'John', NULL, 1, 4, 'CLAS0000000004', '2000-12-31', 'prototype1496@gmail.com', '0977100587', 'Mwamba Liabwa Banda', 'Mwandobo', 'Accara', 'it', '2021-08-07 18:31:50', '2021', '1'),
	(34, 'SDNT00000000035', '../../uploads/defult.png', 'SN2021040', 'Tenant', 'Tenat Nwe', NULL, 1, 1, 'CLAS0000000004', '1996-01-01', 'prototype1496@gmail.com', '0977100587', 'sdsd', 'Mwando', 'Lusaka, Chelenge', 'it', '2021-08-08 07:45:28', '2021', '1');
/*!40000 ALTER TABLE `studentmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.studnetassesment
DROP TABLE IF EXISTS `studnetassesment`;
CREATE TABLE IF NOT EXISTS `studnetassesment` (
  `StudnetAssesmenID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentMasterPublicID` varchar(50) NOT NULL,
  `AssecemntTypeMasterID` int(11) NOT NULL,
  `ClassMasterPublicID` varchar(50) NOT NULL,
  `YearAdded` year(4) NOT NULL DEFAULT year(current_timestamp()),
  `AssecementName` varchar(50) NOT NULL,
  `Score` double NOT NULL,
  `Commment` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `AddedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`StudentMasterPublicID`,`ClassMasterPublicID`,`YearAdded`,`AssecemntTypeMasterID`) USING BTREE,
  UNIQUE KEY `StudnetAssesmenID` (`StudnetAssesmenID`),
  KEY `FK_studnetassesment_classmaster` (`ClassMasterPublicID`),
  KEY `FK_studnetassesment_assementtypemaster` (`AssecemntTypeMasterID`),
  CONSTRAINT `FK_studnetassesment_assementtypemaster` FOREIGN KEY (`AssecemntTypeMasterID`) REFERENCES `assementtypemaster` (`AssementTypeID`) ON DELETE NO ACTION,
  CONSTRAINT `FK_studnetassesment_classmaster` FOREIGN KEY (`ClassMasterPublicID`) REFERENCES `classmaster` (`ClassMasterPublicID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_studnetassesment_studentmaster` FOREIGN KEY (`StudentMasterPublicID`) REFERENCES `studentmaster` (`StudentMasterPublicID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.studnetassesment: ~13 rows (approximately)
DELETE FROM `studnetassesment`;
/*!40000 ALTER TABLE `studnetassesment` DISABLE KEYS */;
INSERT INTO `studnetassesment` (`StudnetAssesmenID`, `StudentMasterPublicID`, `AssecemntTypeMasterID`, `ClassMasterPublicID`, `YearAdded`, `AssecementName`, `Score`, `Commment`, `UpdatedBy`, `UpdatedOn`, `AddedOn`) VALUES
	(1, 'SDNT0000000001', 1, 'CLAS0000000004', '2021', 'sets', 85, 'gOOD', 't', '2021-07-04 11:06:32', '2021-07-04 11:06:32'),
	(2, 'SDNT0000000001', 2, 'CLAS0000000004', '2021', 'term 1  examination', 85, NULL, 't', '2021-07-04 11:07:36', '2021-07-04 11:07:36'),
	(3, 'SDNT0000000001', 3, 'CLAS0000000004', '2021', 'mid term 1  examination', 40, NULL, 't', '2021-07-04 11:08:17', '2021-07-04 11:08:17'),
	(4, 'SDNT00000000015', 1, 'CLAS0000000004', '2021', 'sets', 30, 'Bad', 't', '2021-07-04 11:06:32', '2021-07-04 11:06:32'),
	(5, 'SDNT00000000015', 2, 'CLAS0000000004', '2021', 'term 1  examination', 20, NULL, 't', '2021-07-04 11:07:36', '2021-07-04 11:07:36'),
	(6, 'SDNT00000000015', 3, 'CLAS0000000004', '2021', 'mid term 1  examination', 43, NULL, 't', '2021-07-04 11:08:17', '2021-07-04 11:08:17'),
	(7, 'SDNT00000000018', 1, 'CLAS0000000004', '2021', 'sets', 90, 'Good', 't', '2021-07-04 11:06:32', '2021-07-04 11:06:32'),
	(8, 'SDNT00000000018', 2, 'CLAS0000000004', '2021', 'term 1  examination', 20, NULL, 't', '2021-07-04 11:07:36', '2021-07-04 11:07:36'),
	(9, 'SDNT00000000018', 3, 'CLAS0000000004', '2021', 'mid term 1  examination', 49, NULL, 't', '2021-07-04 11:08:17', '2021-07-04 11:08:17'),
	(13, 'SDNT00000000029', 5, 'CLAS0000000008', '2021', 'end of examination term 1', 58, 'Avrage', 't', '2021-07-04 12:08:24', '2021-07-04 12:08:24'),
	(10, 'SDNT0000000005', 1, 'CLAS0000000004', '2021', 'sets', 100, 'V.Good', 't', '2021-07-04 11:06:32', '2021-07-04 11:06:32'),
	(11, 'SDNT0000000005', 2, 'CLAS0000000004', '2021', 'term 1  examination', 55, NULL, 't', '2021-07-04 11:07:36', '2021-07-04 11:07:36'),
	(12, 'SDNT0000000005', 3, 'CLAS0000000004', '2021', 'mid term 1  examination', 60, NULL, 't', '2021-07-04 11:08:17', '2021-07-04 11:08:17');
/*!40000 ALTER TABLE `studnetassesment` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.subjectmater
DROP TABLE IF EXISTS `subjectmater`;
CREATE TABLE IF NOT EXISTS `subjectmater` (
  `SubjectMaterID` int(11) NOT NULL AUTO_INCREMENT,
  `SubjectName` varchar(50) NOT NULL,
  `SubjectCode` char(10) NOT NULL,
  `DepartmentCode` char(4) NOT NULL,
  `SubjectDiscription` varchar(500) DEFAULT NULL,
  `SchoolID` varchar(50) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SubjectMaterID`) USING BTREE,
  UNIQUE KEY `SubjectCode` (`SubjectCode`) USING BTREE,
  KEY `FK_subjectmater_department` (`DepartmentCode`),
  KEY `FK_subjectmater_schoolmaster` (`SchoolID`),
  CONSTRAINT `FK_subjectmater_department` FOREIGN KEY (`DepartmentCode`) REFERENCES `department` (`ShortHand`) ON UPDATE CASCADE,
  CONSTRAINT `FK_subjectmater_schoolmaster` FOREIGN KEY (`SchoolID`) REFERENCES `schoolmaster` (`PublicID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.subjectmater: ~31 rows (approximately)
DELETE FROM `subjectmater`;
/*!40000 ALTER TABLE `subjectmater` DISABLE KEYS */;
INSERT INTO `subjectmater` (`SubjectMaterID`, `SubjectName`, `SubjectCode`, `DepartmentCode`, `SubjectDiscription`, `SchoolID`, `UpdatedBy`, `UpdatedOn`, `IsActive`) VALUES
	(1, 'Mathematics', 'MATH', 'MATH', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:52:00', '1'),
	(2, 'English', 'ENG', 'EGLA', NULL, 'SCHL0000000001', 'Sys', '2020-05-24 13:52:05', '1'),
	(3, 'History', 'HIST', 'SSS', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:53:10', '1'),
	(4, 'Additional Mathematics', 'ADMA', 'MATH', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:57:24', '1'),
	(5, 'Biology ', 'BIOL', 'SCEN', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:57:41', '1'),
	(7, 'Physics', 'PHSY', 'SCEN', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:58:05', '1'),
	(8, 'Chemistry', 'CHEM', 'SCEN', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:58:20', '1'),
	(9, 'Geography ', 'GEOG', 'SSS', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:58:44', '1'),
	(10, 'Art', 'ART', 'EXAT', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:59:04', '1'),
	(11, 'Geometrical Mechanical Drawing ', 'GMD', 'EXAT', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:59:22', '1'),
	(12, 'Technical Drawing', 'TD', 'EXAT', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 13:59:45', '1'),
	(13, 'Religious Education', 'RE110', 'SSS', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:00:45', '1'),
	(14, 'Religious Education', 'RE210', 'SSS', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:06:05', '1'),
	(15, 'Agriculture Science', 'AGR', 'SCEN', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:06:34', '1'),
	(16, 'Food And Nutrition', 'FN', 'HE', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:06:58', '1'),
	(17, 'Home Economics', 'HE', 'HE', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:07:13', '1'),
	(18, 'Fashion And Fabrics', 'FF', 'HE', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:07:37', '1'),
	(19, 'Civic Education', 'CVIC', 'SSS', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:07:55', '1'),
	(20, 'Accounts ', 'ACC', 'CMSB', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:08:15', '1'),
	(22, 'Book Keeping', 'BK', 'CMSB', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:08:41', '1'),
	(23, 'French ', 'FNCH', 'EGLA', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:09:02', '1'),
	(24, 'Bemba ', 'BEM', 'EGLA', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:09:11', '1'),
	(25, 'Music ', 'MUIC', 'EXAT', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:09:43', '1'),
	(26, 'Commerce ', 'COMC', 'CMSB', NULL, 'SCHL0000000001', 'SYS', '2020-05-24 14:09:59', '1'),
	(27, 'Scinece', 'SCEN', 'SCEN', NULL, 'SCHL0000000001', 'SYS', '2021-05-22 10:04:43', '1'),
	(28, 'Computer Studies ', 'CMST', 'SCEN', NULL, 'SCHL0000000001', 'SYS', '2021-05-22 10:33:03', '1'),
	(29, 'Integrated Science', 'ITSC', 'SCEN', NULL, 'SCHL0000000001', 'SYS', '0000-00-00 00:00:00', '1'),
	(30, 'Business Studies', 'BSST', 'SSS', NULL, 'SCHL0000000001', 'SYS', '2021-05-22 10:39:31', '1'),
	(31, 'Socials Studies ', 'SCST', 'SSS', NULL, 'SCHL0000000001', 'SYS', '2021-05-22 10:47:05', '1'),
	(32, 'Zambian Language ', 'ZMLG', 'CMSB', NULL, 'SCHL0000000001', 'SYS', '2021-05-22 10:47:57', '1'),
	(33, 'Physical Education', 'PYED', 'CMSB', NULL, 'SCHL0000000001', 'SYS', '2021-05-22 10:53:24', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.teacherdetails: ~9 rows (approximately)
DELETE FROM `teacherdetails`;
/*!40000 ALTER TABLE `teacherdetails` DISABLE KEYS */;
INSERT INTO `teacherdetails` (`TeacherDetailsID`, `TeacherDetailsPublicID`, `TeacherMasterPublicID`, `SubjectCode`, `UpdatedBy`, `UpdatedOn`, `AddedOn`) VALUES
	(1, 'TECHDT0000000002', 'TECH0000000003', 'MATH', 'SYS', '2020-05-24 16:27:49', '2021-08-21 11:26:32'),
	(2, 'TECHDT0000000001', 'TECH0000000003', 'ADMA', 'sys', '2020-05-24 16:27:49', '2021-08-21 11:26:32'),
	(3, 'TECHDT0000000005', 'TECH0000000003', 'ART', 't', '2020-06-15 22:56:50', '2021-08-21 11:26:32'),
	(4, 'TECHDT0000000006', 'TECH0000000001', 'GMD', 't', '2020-06-15 22:56:50', '2021-08-21 11:26:32'),
	(5, 'TEDT00000000087', 'TECH00000000079', 'HE', 'it', '2021-08-21 18:02:09', '2021-08-21 18:02:09'),
	(6, 'TEDT00000000088', 'TECH00000000079', 'HIST', 'it', '2021-08-21 18:02:09', '2021-08-21 18:02:09'),
	(7, 'TEDT00000000089', 'TECH00000000080', 'ACC', 'it', '2021-08-21 18:05:08', '2021-08-21 18:05:08'),
	(8, 'TEDT00000000090', 'TECH00000000080', 'COMC', 'it', '2021-08-21 18:05:08', '2021-08-21 18:05:08'),
	(9, 'TEDT00000000091', 'TECH00000000080', 'BIOL', 'it', '2021-08-21 18:05:08', '2021-08-21 18:05:08');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.teacherdocument: ~0 rows (approximately)
DELETE FROM `teacherdocument`;
/*!40000 ALTER TABLE `teacherdocument` DISABLE KEYS */;
INSERT INTO `teacherdocument` (`TeacherdocumentID`, `Title`, `DocumentTypeID`, `DocumentURL`, `IsApproved`, `AddedBy`, `LastUpdatedBy`, `AddedOn`, `UpdatedOn`) VALUES
	(5, '', '1', '', '0', 't', 't', '2021-07-04 04:46:13', '2021-07-04 05:47:56');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.teachermaster: ~5 rows (approximately)
DELETE FROM `teachermaster`;
/*!40000 ALTER TABLE `teachermaster` DISABLE KEYS */;
INSERT INTO `teachermaster` (`TeacherID`, `TeaherMasterPublicID`, `TeacherPositionID`, `DeparmrntCode`, `StartDate`, `EndDate`, `UpdatedBy`, `UpdatedOn`, `IsActive`) VALUES
	(1, 'TECH0000000001', 3, 'MATH', '2020-05-24 16:25:03', NULL, 'sys', '2020-05-24 16:25:06', '1'),
	(2, 'TECH0000000003', 4, 'EXAT', '2020-06-15 22:56:50', NULL, 't', '2020-06-15 22:56:50', '1'),
	(6, 'TECH00000000068', 1, 'EXAT', '2021-08-21 17:24:46', NULL, 'it', '2021-08-21 17:24:46', '1'),
	(9, 'TECH00000000079', 1, 'EXAT', '2021-08-21 18:02:09', NULL, 'it', '2021-08-21 18:02:09', '1'),
	(10, 'TECH00000000080', 4, 'EGLA', '2021-08-21 18:05:08', NULL, 'it', '2021-08-21 18:05:08', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.teacherpositionmaster: ~4 rows (approximately)
DELETE FROM `teacherpositionmaster`;
/*!40000 ALTER TABLE `teacherpositionmaster` DISABLE KEYS */;
INSERT INTO `teacherpositionmaster` (`TeacherPositionMasterID`, `PositionName`, `PositionDescription`, `UpdatedBy`, `UpdatedOn`, `IsActive`) VALUES
	(1, 'Head Of Department', 'This posion is head department', 'admin', '2019-11-04 00:08:23', '1'),
	(2, 'Deputy Head Teacher', 'Deputy Head Teacher Roll is to manage the School', 'admin', '2019-11-12 14:25:31', '1'),
	(3, 'Head Teacher ', 'Head Teacher  to manage the over role school activities ', 'admin', '2019-11-12 14:38:50', '1'),
	(4, 'Teacher', 'Teacher Role is to mange classes and pupils', 'admin', '2019-11-12 14:43:48', '1');
/*!40000 ALTER TABLE `teacherpositionmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.tenantmaster
DROP TABLE IF EXISTS `tenantmaster`;
CREATE TABLE IF NOT EXISTS `tenantmaster` (
  `TenantMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `TenantID` varchar(400) NOT NULL,
  `TenantName` varchar(100) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TenantMasterID`),
  UNIQUE KEY `TenantID` (`TenantID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.tenantmaster: ~3 rows (approximately)
DELETE FROM `tenantmaster`;
/*!40000 ALTER TABLE `tenantmaster` DISABLE KEYS */;
INSERT INTO `tenantmaster` (`TenantMasterID`, `TenantID`, `TenantName`, `UpdatedOn`, `IsActive`) VALUES
	(1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 'Lusaka Secondary School ', '2021-08-07 19:10:57', '1'),
	(2, 'a29294e8-f7a1-11eb-a81c-1062e5c23529', 'Test School ', '2021-08-07 19:11:28', '1'),
	(3, '3edu_29294e8-f7a1-11eb-a81c-1062e5c23520', '3Eedu Admin', '2021-08-07 21:42:07', '1');
/*!40000 ALTER TABLE `tenantmaster` ENABLE KEYS */;

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
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `AddedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TimeTableDetailsID`),
  KEY `FK_timetabledetails_timetablemaster` (`TimeTableMaterD`),
  CONSTRAINT `FK_timetabledetails_timetablemaster` FOREIGN KEY (`TimeTableMaterD`) REFERENCES `timetablemaster` (`TimeTableMasterID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.timetabledetails: ~9 rows (approximately)
DELETE FROM `timetabledetails`;
/*!40000 ALTER TABLE `timetabledetails` DISABLE KEYS */;
INSERT INTO `timetabledetails` (`TimeTableDetailsID`, `TimeTableMaterD`, `Monday`, `Tuesday`, `Wednesday`, `Thursday`, `Friday`, `UpdatedBy`, `UpdatedOn`, `AddedOn`) VALUES
	(1, 1, 'MATH', 'ENG', 'SCEN', 'MATH', 'ENG', 'it', '2021-08-07 17:10:34', '2021-06-27 13:00:42'),
	(2, 5, 'ENG', 'MATH', 'MATH', 'ENG', 'ENG', 'it', '2021-08-07 17:10:34', '2021-06-27 13:12:51'),
	(3, 6, 'SCEN', 'RE110', 'ZMLG', NULL, 'MATH', 'it', '2021-08-07 17:10:34', '2021-06-27 13:23:57'),
	(4, 7, 'PYED', NULL, 'MATH', 'MATH', 'MATH', 'it', '2021-08-07 17:10:34', '2021-06-27 13:24:18'),
	(5, 10, 'MATH', 'ENG', NULL, NULL, NULL, 't', '2021-07-04 13:40:37', '2021-06-28 04:44:47'),
	(6, 8, 'MATH', 'CMST', 'ITSC', 'ADMA', 'ADMA', 't', '2021-07-10 12:35:20', '2021-06-28 04:46:08'),
	(7, 9, 'MATH', 'CMST', 'CMST', NULL, NULL, 't', '2021-07-10 12:35:20', '2021-07-03 13:18:46'),
	(10, 12, 'ENG', 'ITSC', 'CMST', NULL, NULL, 't', '2021-07-10 12:35:20', '2021-07-03 13:19:32'),
	(11, 13, 'ENG', 'ITSC', 'SCST', NULL, NULL, 't', '2021-07-10 12:35:20', '2021-07-03 13:19:47');
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
  `UpdatedBy` varbinary(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TimeTableMasterID`),
  KEY `FK_timetablemaster_classmaster` (`ClassMasterID`),
  KEY `FK_timetablemaster_periodmaster` (`PeriodMasterID`),
  CONSTRAINT `FK_timetablemaster_classmaster` FOREIGN KEY (`ClassMasterID`) REFERENCES `classmaster` (`ClassMasterPublicID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_timetablemaster_periodmaster` FOREIGN KEY (`PeriodMasterID`) REFERENCES `periodmaster` (`PeriodMasterID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.timetablemaster: ~9 rows (approximately)
DELETE FROM `timetablemaster`;
/*!40000 ALTER TABLE `timetablemaster` DISABLE KEYS */;
INSERT INTO `timetablemaster` (`TimeTableMasterID`, `ClassMasterID`, `PeriodMasterID`, `TimeFrom`, `TimeTo`, `IsActive`, `UpdatedBy`, `UpdatedOn`) VALUES
	(1, 'CLAS0000000004', 1, '08:00:00', '09:00:00', '1', _binary 0x737973, '2021-06-27 12:54:50'),
	(5, 'CLAS0000000004', 2, '09:00:00', '10:00:00', '1', _binary 0x737973, '2021-06-27 13:11:54'),
	(6, 'CLAS0000000004', 3, '10:00:00', '11:00:00', '1', _binary 0x737973, '2021-06-27 13:12:03'),
	(7, 'CLAS0000000004', 4, '11:00:00', '12:00:00', '1', _binary 0x737973, '2021-06-27 13:12:15'),
	(8, 'CLAS0000000005', 1, '08:00:00', '09:00:00', '1', _binary 0x737973, '2021-06-27 13:12:26'),
	(9, 'CLAS0000000005', 2, '10:00:00', '13:00:00', '1', _binary 0x737973, '2021-06-27 13:12:37'),
	(10, 'CLAS0000000004', 5, '12:00:00', '13:00:00', '1', _binary 0x535953, '2021-06-28 04:45:16'),
	(12, 'CLAS0000000005', 3, '10:00:00', '11:00:00', '1', _binary 0x737973, '2021-07-03 13:17:25'),
	(13, 'CLAS0000000005', 4, '11:00:00', '12:00:00', '1', _binary 0x737973, '2021-07-03 13:17:59');
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
DELETE FROM `titlemaster`;
/*!40000 ALTER TABLE `titlemaster` DISABLE KEYS */;
INSERT INTO `titlemaster` (`TitleMasterID`, `LongName`, `ShortName`, `isActive`) VALUES
	(1, 'Mister', 'Mr', '1'),
	(2, 'Miss', 'Miss', '1'),
	(3, 'Mrs', 'Mrs', '1'),
	(4, 'Ms', 'Ms', '1');
/*!40000 ALTER TABLE `titlemaster` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.usermaster: ~12 rows (approximately)
DELETE FROM `usermaster`;
/*!40000 ALTER TABLE `usermaster` DISABLE KEYS */;
INSERT INTO `usermaster` (`UserMasterID`, `PublicID`, `ProfilPicURL`, `NRC`, `Passport`, `UserName`, `Password`, `FirstName`, `LastName`, `OtherName`, `EmailAddress`, `ContactNo`, `GenderID`, `MaritalStatusID`, `DOB`, `UserTypeID`, `UpdatedBy`, `UpdatedOn`, `IsActive`, `LoginAttempts`, `IsLocked`, `TenantID`) VALUES
	(1, 'TECH0000000001', '../../uploads/defult.png', '55445/16/1', 'cc', 'h', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Head', 'System', 'Teacher', 'prototype1496@gmail.com', '988755487', 1, 4, '1997-01-02', 3, 'Sys', '2019-11-14 08:56:25', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(2, 'TECH0000000003', '../../uploads/defult.png', '515151/8/8', '74444/45/45', 't', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Alinuswe', 'Mwandobo', NULL, 'alinuswemwandobo@gmail.com', '977100587', 1, 1, '1996-01-01', 3, 'admin', '2020-11-20 11:52:45', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(4, '202000041', '../../uploads/defult.png', NULL, NULL, 's', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Student', 'Grace', NULL, NULL, '09771258789', 2, 4, '1996-05-16', 2, 'Sys', '2021-05-16 11:43:28', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(5, 'ADMIN00001', '../../uploads/defult.png', NULL, NULL, 'a', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'System', 'Admin', NULL, 'sys@gmail.com', '097758568', 1, 4, '2021-06-18', 1, 'sys', '2021-06-18 11:00:21', '1', '0', '0', '3edu_29294e8-f7a1-11eb-a81c-1062e5c23520'),
	(7, 'ITADM00001', '../../uploads/defult.png', NULL, NULL, 'it', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'IT', 'Admin', NULL, NULL, NULL, 1, 4, '2021-08-07', 4, 'sys', '2021-08-07 08:22:21', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(8, 'SDNT00000000031', '../../uploads/defult.png', NULL, NULL, '3EDU202100036', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Student', 'X', 'Mwando', NULL, NULL, 1, 4, '1996-01-01', 2, 'it', '2021-08-07 17:49:45', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(9, 'SDNT00000000032', '../../uploads/defult.png', NULL, NULL, 'SN202137', '$2y$10$LBZGtSbfiZXWurSjU9aNbOfkj2LoaGAmkDYiYjlGgJO2P6qC6egH.', 'Test J', 'John', NULL, NULL, NULL, 1, 4, '2000-12-31', 2, 'it', '2021-08-07 18:31:50', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(11, 'SDNT00000000032', '../../uploads/defult.png', NULL, NULL, 'SN202137', '$2y$10$LBZGtSbfiZXWurSjU9aNbOfkj2LoaGAmkDYiYjlGgJO2P6qC6egH.', 'D', 'F', NULL, NULL, NULL, 2, 3, '2021-08-07', 2, 'it', '2021-08-07 19:06:06', '1', '0', '0', 'a29294e8-f7a1-11eb-a81c-1062e5c23529'),
	(14, 'SDNT00000000035', '../../uploads/defult.png', NULL, NULL, 'SN2021040', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Tenant', 'Tenat Nwe', NULL, NULL, NULL, 1, 1, '1996-01-01', 2, 'it', '2021-08-08 07:45:28', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(27, 'TECH00000000079', '../../uploads/defult.png', '515151/16/', '55455', 'alinuswemwandobo@gmail.com', '$2y$10$vBjuS5p9Mgl4iF2Yoiq6cui9s8KXYfIpLmhSomHXwm0fQKUo0LPvO', 'Alinuwe', 'Mwandobo', 'Mwando', 'prototype1496@gmail.com', '0977100587', 1, 2, '1996-01-01', 3, 'it', '2021-08-21 18:02:09', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(28, 'TECH00000000080', '../../uploads/teacher_profile/TECH00000000080_Screenshot 2021-08-20 211428.png', '515151/8/8', '74444/45/40', 'TES', '$2y$10$VT02YlNvH8qbUoBTRb9VlOUYZt6zWtJwua3OWQxnB6uQAyTz4Cgz.', 'Sannuel', 'Banda', 'Mwando', 'prototype1496@gmail.com', '0977100587', 1, 2, '1196-01-01', 3, 'it', '2021-08-21 18:05:08', '1', '0', '0', '5fe7597e-f7a1-11eb-a81c-1062e5c23529');
/*!40000 ALTER TABLE `usermaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.usertypemaster
DROP TABLE IF EXISTS `usertypemaster`;
CREATE TABLE IF NOT EXISTS `usertypemaster` (
  `UserTypeMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `UserType` varchar(20) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserTypeMasterID`),
  UNIQUE KEY `UserType` (`UserType`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.usertypemaster: ~4 rows (approximately)
DELETE FROM `usertypemaster`;
/*!40000 ALTER TABLE `usertypemaster` DISABLE KEYS */;
INSERT INTO `usertypemaster` (`UserTypeMasterID`, `UserType`, `IsActive`) VALUES
	(1, 'Admin', '1'),
	(2, 'Student', '1'),
	(3, 'Teacher', '1'),
	(4, 'ITAdmin', '1');
/*!40000 ALTER TABLE `usertypemaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.user_tb
DROP TABLE IF EXISTS `user_tb`;
CREATE TABLE IF NOT EXISTS `user_tb` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `userType` int(11) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.user_tb: ~0 rows (approximately)
DELETE FROM `user_tb`;
/*!40000 ALTER TABLE `user_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tb` ENABLE KEYS */;

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
CREATE PROCEDURE `ActivateUser`(
	IN `UserMasterID_` INT
)
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
CREATE PROCEDURE `DeactivateUser`(
	IN `UserMasterID_` INT



)
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

-- Dumping structure for procedure 3edu_db.GetAllActiveClasses
DROP PROCEDURE IF EXISTS `GetAllActiveClasses`;
DELIMITER //
CREATE PROCEDURE `GetAllActiveClasses`(
	IN `TenantID` VARCHAR(400)
)
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

-- Dumping structure for procedure 3edu_db.GetAllActivesGradesByTenantID
DROP PROCEDURE IF EXISTS `GetAllActivesGradesByTenantID`;
DELIMITER //
CREATE PROCEDURE `GetAllActivesGradesByTenantID`(
	IN `TenantID` VARCHAR(400)
)
BEGIN
SELECT GM.GradeMasterID		AS 'GradeMasterID',
		 GM.Grade				AS 'Grade',
		 GM.IsActive			AS 'IsActive'
FROM grademaster GM WHERE GM.IsActive =1 AND GM.TenantID = TenantID;
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
CREATE PROCEDURE `GetAllClassesByGradeID`(
	IN `GradeID` INT
)
BEGIN
SELECT CM.ClassMasterPublicID,
			CM.GradeMasterID ,
			CONCAT(CM.ClassName, ' (',CM.ClassCode,')') AS Class

FROM classmaster CM WHERE CM.GradeMasterID =GradeID;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllClassesWithMappedSubjects
DROP PROCEDURE IF EXISTS `GetAllClassesWithMappedSubjects`;
DELIMITER //
CREATE PROCEDURE `GetAllClassesWithMappedSubjects`()
    COMMENT 'This sp reterns all callses that have mapped subjects in class details table '
BEGIN
SELECT CM.ClassMasterPublicID,
			CM.GradeMasterID ,
			CONCAT(CM.ClassName, ' (',CM.ClassCode,')') AS Class

FROM classmaster CM WHERE CM.IsActive = 1 AND CM.ClassMasterPublicID IN (SELECT CD.ClassMasterPublicID FROM classdetails CD) ORDER BY CM.GradeMasterID ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllDepartmentsByShoolID
DROP PROCEDURE IF EXISTS `GetAllDepartmentsByShoolID`;
DELIMITER //
CREATE PROCEDURE `GetAllDepartmentsByShoolID`(
	IN `SHOOLID` VARCHAR(50)
)
BEGIN
		SELECT 	DPT.ShortHand 		AS 'DepartmentID',
					DPT.DepartmentName	AS 'DepartmentName' 
		FROM department DPT WHERE DPT.SchoolMasterID = SHOOLID ORDER BY DPT.DepartmentName ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllStudentDetails
DROP PROCEDURE IF EXISTS `GetAllStudentDetails`;
DELIMITER //
CREATE PROCEDURE `GetAllStudentDetails`()
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
JOIN classmaster CM ON CM.ClassMasterPublicID = SM.ClassMasterPublicID WHERE SM.IsActive = 1 ORDER BY SM.StudentNo DESC;


END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllStudentDetailsByClassID
DROP PROCEDURE IF EXISTS `GetAllStudentDetailsByClassID`;
DELIMITER //
CREATE PROCEDURE `GetAllStudentDetailsByClassID`(
	IN `ClassID` VARCHAR(50)
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
			JOIN classmaster CM ON CM.ClassMasterPublicID = SM.ClassMasterPublicID WHERE CM.ClassMasterPublicID = @CLASSMASTERPUBLICID  AND SM.IsActive = 1 
		
			
			ORDER BY SM.FirstName,SM.LastName,SM.StudentNo ASC;

END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAllStudentDetailsByPublicID
DROP PROCEDURE IF EXISTS `GetAllStudentDetailsByPublicID`;
DELIMITER //
CREATE PROCEDURE `GetAllStudentDetailsByPublicID`(
	IN `PUBLICID_` VARCHAR(50)
)
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
		 	IF(SM.EmailAddress IS NULL OR SM.EmailAddress = '','None',SM.EmailAddress )																																AS 'EmailAddress'
		 	
FROM studentmaster SM
JOIN gendermaster GM ON GM.GenderMasterID = SM.GenderID
JOIN maritalstatusmaster MSM ON MSM.MaritalStatusMasterID = SM.MaritalStatusID 
JOIN classmaster CM ON CM.ClassMasterPublicID = SM.ClassMasterPublicID  WHERE SM.IsActive = 1 AND SM.StudentNo = @StudentNo;
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

-- Dumping structure for procedure 3edu_db.GetAllTeacherLessionPlanDocuments
DROP PROCEDURE IF EXISTS `GetAllTeacherLessionPlanDocuments`;
DELIMITER //
CREATE PROCEDURE `GetAllTeacherLessionPlanDocuments`()
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
JOIN gendermaster GM ON GM.GenderMasterID = UM.GenderID
ORDER BY  TD.UpdatedOn, TD.IsApproved,DP.DepartmentName DESC ;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetAssecmentTypeBySubjectCode
DROP PROCEDURE IF EXISTS `GetAssecmentTypeBySubjectCode`;
DELIMITER //
CREATE PROCEDURE `GetAssecmentTypeBySubjectCode`(
	IN `CLASSMASTERID` VARCHAR(50),
	IN `SUBJECT_CODE` CHAR(5)
)
BEGIN
		SET @SUBJECTCODE = SUBJECT_CODE;
		SET @GRADEID = (SELECT CM.GradeMasterID FROM classmaster CM WHERE CM.ClassMasterPublicID = CLASSMASTERID);
		SELECT ATM.AssementTypeID,
				 ATM.GradeMasterID,
				 ATM.SubjectCode,
				 ATM.AssementTypeName
				 
		FROM assementtypemaster ATM
		WHERE ATM.IsActive = 1 AND ATM.SubjectCode = @SUBJECTCODE AND ATM.GradeMasterID = @GRADEID ORDER BY ATM.AssementTypeName ASC ;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetClassByGreadeID
DROP PROCEDURE IF EXISTS `GetClassByGreadeID`;
DELIMITER //
CREATE PROCEDURE `GetClassByGreadeID`(
	IN `GradeID` INT
)
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
CREATE PROCEDURE `GetClassDetailsByID`(
	IN `ClassMasterID` VARCHAR(50)
)
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
CREATE PROCEDURE `GetClassDetailsByPublicID`(
	IN `CLASSMASTERID_` VARCHAR(50)
)
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
CREATE PROCEDURE `GetClassRoomsByID`(
	IN `TenantID` VARCHAR(400)
)
BEGIN
		SELECT CR.ClassRoomPublicID		AS 'ClassRoomPublicID', 
				 CR.ClassRoomName				AS 'ClassRoomName'
		FROM classroom CR WHERE CR.TenantID = TenantID AND CR.IsActive = 1;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetClassSubjectsByClassMasterID
DROP PROCEDURE IF EXISTS `GetClassSubjectsByClassMasterID`;
DELIMITER //
CREATE PROCEDURE `GetClassSubjectsByClassMasterID`(
	IN `CLASSMASTERID` VARCHAR(50)
)
BEGIN
		SET @CLASSMASTERID = CLASSMASTERID;
		SELECT CD.ClassDetailsPublicID									AS 'ClassDetailsPublicID',
				 CD.ClassMasterPublicID										AS 'ClassMasterPublicID',
				 CD.SubjectCode												AS 'SubjectCode',
				 CONCAT(SM.SubjectName, ' (',SM.SubjectCode,')') 	AS 'Subject'
		FROM classdetails CD 
		JOIN subjectmater SM ON SM.SubjectCode = CD.SubjectCode 
		WHERE CD.ClassMasterPublicID = @CLASSMASTERID AND CD.IsActive = 1 ORDER BY SM.SubjectName ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetClassSubjectsByID
DROP PROCEDURE IF EXISTS `GetClassSubjectsByID`;
DELIMITER //
CREATE PROCEDURE `GetClassSubjectsByID`(
	IN `ClassMasterID` VARCHAR(50)
)
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
		WHERE CD.ClassMasterPublicID = ClassMasterID AND CD.IsActive = 1;
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
CREATE PROCEDURE `GetDashboardUserCounts`(
	IN `TENANTID_` VARCHAR(400)
)
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

-- Dumping structure for procedure 3edu_db.GetDepartmentByCode
DROP PROCEDURE IF EXISTS `GetDepartmentByCode`;
DELIMITER //
CREATE PROCEDURE `GetDepartmentByCode`(
	IN `DEPARTMENTCODE_` CHAR(4)
)
BEGIN
		SET @DEPARTMENTCODE = DEPARTMENTCODE_;

		SELECT 	DP.DepartmentID		AS 'DepartmentID',
					DP.DepartmentName		AS 'DepartmentName',
					DP.ShortHand			AS 'ShortHand'
		FROM department DP
		WHERE DP.ShortHand = @DEPARTMENTCODE ORDER BY DP.DepartmentName ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetDistrictByProvinceId
DROP PROCEDURE IF EXISTS `GetDistrictByProvinceId`;
DELIMITER //
CREATE PROCEDURE `GetDistrictByProvinceId`(
	IN `Provinceid` INT



)
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
CREATE PROCEDURE `GeteacherLessionPlanDocumentsByID`(
	IN `TeaherMasterPublicID_` VARCHAR(50)
)
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
CREATE PROCEDURE `GetEmailAdressByPositionID`(
	IN `PositionID_` INT

)
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
CREATE PROCEDURE `GetPositionDetails`(
	IN `limitstart_` INT,
	IN `limitend_` INT
)
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
    COMMENT 'The sp is used to get the aviable defined positions'
BEGIN
			SELECT   TPM.TeacherPositionMasterID	AS 'TeacherPositionMasterID',
						TPM.PositionName					AS 'PositionName'
			FROM teacherpositionmaster TPM WHERE TPM.IsActive = 1;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetPositonPages
DROP PROCEDURE IF EXISTS `GetPositonPages`;
DELIMITER //
CREATE PROCEDURE `GetPositonPages`(
	IN `limit_` VARCHAR(50)
)
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
CREATE PROCEDURE `GetSchoolDetailsByTenatID`(
	IN `TenantID_` VARCHAR(400)
)
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
CREATE PROCEDURE `GetSequence`(
	IN `SequenceID` INT


)
    COMMENT 'This sp is used to get the defined sequnce'
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
CREATE PROCEDURE `GetSessionDetails`(
	IN `UserMasterID` INT,
	IN `SerialID` VARCHAR(50),
	IN `TokenID` VARCHAR(50)

)
    COMMENT 'Used to get the details about user sessions '
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
CREATE PROCEDURE `GetSessionDetailsByUserMasterPublicID`(
	IN `UserMasterPublicID` VARCHAR(50)

)
BEGIN
		SELECT 	SN.SerialID				AS 'SerialID',
					SN.TokenID				AS 'TokenID',
					SN.TokenCreatedTime	AS 'TokenCreatedTime',
					SN.UpdatedBy			AS 'Username',
					SN.UserMasterPublicID AS 'UserMasterPublicID'
		FROM `session` SN WHERE SN.UserMasterPublicID = UserMasterPublicID;

END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetStudentAsscementMarkReport
DROP PROCEDURE IF EXISTS `GetStudentAsscementMarkReport`;
DELIMITER //
CREATE PROCEDURE `GetStudentAsscementMarkReport`()
BEGIN
		SELECT   STA.StudnetAssesmenID																									AS 'PublicID',
					STM.StudentNo																												AS 'StudentNo',
					CONCAT(STM.FirstName,IF(STM.OtherName IS NULL,' ',CONCAT(' ',STM.OtherName,' ')),STM.LastName )	AS 'Name',
					CONCAT(CM.ClassName,' (',CM.ClassCode,')')																		AS 'ClassName',
					SM.SubjectName																												AS 'SubjectName',
					CONCAT(ASTM.AssementTypeName, ' (',STA.AssecementName,')')													AS 'AssecementName',
					CONCAT(STA.Score,' %')																									AS 'Score',
				   DATE_FORMAT(STA.UpdatedOn, "%d %b, %Y") 					   												   AS 'MarkedOn'
					
		FROM studnetassesment STA
		JOIN studentmaster STM ON STM.StudentMasterPublicID = STA.StudentMasterPublicID 
		JOIN assementtypemaster ASTM ON ASTM.AssementTypeID = STA.AssecemntTypeMasterID
		JOIN subjectmater SM ON SM.SubjectCode = ASTM.SubjectCode
		JOIN classmaster CM ON CM.ClassMasterPublicID = STA.ClassMasterPublicID ORDER BY CM.GradeMasterID, STM.StudentNo,STM.FirstName,STM.LastName ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetStudentAttendanceReport
DROP PROCEDURE IF EXISTS `GetStudentAttendanceReport`;
DELIMITER //
CREATE PROCEDURE `GetStudentAttendanceReport`()
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
		JOIN classmaster CM ON CM.ClassMasterPublicID = STA.ClassID 
		JOIN statusmaster STAM ON STAM.StatueCode =STA.`Status` ORDER BY CM.ClassCode,STA.StudentID,DATE (STA.UpdatedOn),STM.FirstName,STM.LastName ASC;

END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetStudentAttendanceReportByPublicID
DROP PROCEDURE IF EXISTS `GetStudentAttendanceReportByPublicID`;
DELIMITER //
CREATE PROCEDURE `GetStudentAttendanceReportByPublicID`(
	IN `PUBLIC_ID` VARCHAR(50)
)
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
		JOIN classmaster CM ON CM.ClassMasterPublicID = STA.ClassID 
		JOIN statusmaster STAM ON STAM.StatueCode =STA.`Status`
		WHERE STM.StudentMasterPublicID = PUBLIC_ID ORDER BY CM.ClassCode,STA.StudentID,DATE (STA.UpdatedOn),STM.FirstName,STM.LastName ASC;

END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetStudentNo
DROP PROCEDURE IF EXISTS `GetStudentNo`;
DELIMITER //
CREATE PROCEDURE `GetStudentNo`(
	IN `SequenceID` INT
)
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
CREATE PROCEDURE `GetSubjectsByClassMasterPublicID`(
	IN `ClassmasterPublicID_` VARCHAR(50)
)
BEGIN
		SET @CLASSMASTERPUBLICID =  ClassmasterPublicID_;
		
		SELECT 		 SM.SubjectCode AS 												'SujectCode',
						 CONCAT(SM.SubjectName,' ( ',SM.SubjectCode,' )')		AS 'SubjectName'  
		FROM classmaster CM 
		JOIN classdetails CD ON CD.ClassMasterPublicID = CM.ClassMasterPublicID
		JOIN subjectmater SM ON SM.SubjectCode = CD.SubjectCode WHERE CM.ClassMasterPublicID = @CLASSMASTERPUBLICID ;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetSuperAdminDashbordUserCount
DROP PROCEDURE IF EXISTS `GetSuperAdminDashbordUserCount`;
DELIMITER //
CREATE PROCEDURE `GetSuperAdminDashbordUserCount`(
	IN `TENANTID` VARCHAR(400)
)
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

-- Dumping structure for procedure 3edu_db.GetTeacherDetailsByID
DROP PROCEDURE IF EXISTS `GetTeacherDetailsByID`;
DELIMITER //
CREATE PROCEDURE `GetTeacherDetailsByID`(
	IN `TenantID` VARCHAR(400)
)
BEGIN
SELECT TM.TeaherMasterPublicID																																					AS 'TeaherMasterPublicID',
		 CONCAT(UM.FirstName,IF(UM.OtherName IS NULL,' ',CONCAT(' ',UM.OtherName,' ')),	UM.LastName, ' (',DPT.DepartmentName,' Dpt.)') 			AS 'Teacher',
		 UM.FirstName,
		 UM.OtherName,
		 UM.LastName,
		 DPT.DepartmentName
FROM teachermaster TM 
JOIN usermaster UM ON UM.PublicID = TM.TeaherMasterPublicID 
JOIN teacherpositionmaster TPM ON TPM.TeacherPositionMasterID = TM.TeacherPositionID
JOIN department DPT ON DPT.ShortHand = TM.DeparmrntCode
WHERE UM.TenantID = TenantID AND UM.IsActive = 1 AND TM.IsActive = 1 AND TPM.TeacherPositionMasterID NOT IN (1,3);
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetTeacherDocumentDetailsByID
DROP PROCEDURE IF EXISTS `GetTeacherDocumentDetailsByID`;
DELIMITER //
CREATE PROCEDURE `GetTeacherDocumentDetailsByID`(
	IN `DOCUMENTID_` INT
)
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
CREATE PROCEDURE `GetTermPages`(
	IN `limit_` VARCHAR(50)



)
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
SELECT  TTD.TimeTableDetailsID																														AS 'TimeTableDetailsID',
		  PM.SequenceID																																	AS 'SequenceID',  
		  CONCAT(PM.PeriodName,"<br>(",TIME_FORMAT(TTM.TimeFrom,"%H:%i"), " - " ,TIME_FORMAT(TTM.TimeTo,"%H:%i"),")")		AS 'PeriodName',
		  GetClassName(TTD.Monday)																														AS 'SubjectCodeM',
		  TTD.Monday																																		AS 'Monday',
		  GetClassName(TTD.Tuesday)																													AS 'SubjectCodeT',
		  TTD.Tuesday																																		AS 'Tuesday',
		  GetClassName(TTD.Wednesday)																													AS 'SubjectCodeW',
		  TTD.Wednesday																																	AS 'Wednesday',
		  GetClassName(TTD.Thursday)																													AS 'SubjectCodeTH',
		  TTD.Thursday																																		AS 'Thursday',
		  GetClassName(TTD.Friday)																														AS 'SubjectCodeF',
		  TTD.Friday																																		AS 'Friday'
FROM timetablemaster TTM 
JOIN periodmaster PM ON PM.PeriodMasterID = TTM.PeriodMasterID
JOIN timetabledetails TTD ON  TTM.TimeTableMasterID =TTD.TimeTableMaterD

WHERE TTM.ClassMasterID = @ClassMasterID_ AND TTM.IsActive = 1 AND PM.IsActive = 1 ORDER BY TTM.ClassMasterID,PM.SequenceID ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.GetUserByUsername
DROP PROCEDURE IF EXISTS `GetUserByUsername`;
DELIMITER //
CREATE PROCEDURE `GetUserByUsername`(
	IN `username` VARCHAR(50)
)
    COMMENT 'This sp gets the user details by user name'
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
				 SM.PublicID		AS 'SchoolPublicID'
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
CREATE PROCEDURE `GetUserDetailsByID`(
	IN `UserID_` VARCHAR(50)

)
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
CREATE PROCEDURE `GetUserDetailsByPublicID`(
	IN `PublicID` VARCHAR(50)
)
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
CREATE PROCEDURE `GetUserEmailByID`(
	IN `TEACHERID` VARCHAR(50)
)
BEGIN
		SELECT IF(UM.EmailAddress IS NULL, '' , UM.EmailAddress)	AS 'EmailAddress'
		FROM usermaster UM WHERE UM.PublicID = TEACHERID AND UM.IsActive = 1;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db.SearchActivatedUsers
DROP PROCEDURE IF EXISTS `SearchActivatedUsers`;
DELIMITER //
CREATE PROCEDURE `SearchActivatedUsers`(
	IN `UserName_` VARCHAR(50),
	IN `FirstName_` VARCHAR(50),
	IN `LastName_` VARCHAR(50)

)
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
CREATE PROCEDURE `SearchUsers`(
	IN `UserName_` VARCHAR(50),
	IN `FirstName_` VARCHAR(50),
	IN `LastName_` VARCHAR(50)

)
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

-- Dumping structure for procedure 3edu_db.UpdateEmailSatusCode
DROP PROCEDURE IF EXISTS `UpdateEmailSatusCode`;
DELIMITER //
CREATE PROCEDURE `UpdateEmailSatusCode`(
	IN `EMAILESERIAL` VARCHAR(50),
	IN `STATUSCODE` CHAR(4),
	IN `CURRENTCODE` CHAR(4)
)
    COMMENT 'This sp is used to update the statuse code of the emailservice table'
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
CREATE PROCEDURE `UpdatePasswordByUsername`(
	IN `username_` VARCHAR(50)
,
	IN `password_` VARCHAR(300)





)
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
	IN `publicid_` VARCHAR(50)
,
	IN `password_` VARCHAR(300)





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

-- Dumping structure for function 3edu_db.GetClassName
DROP FUNCTION IF EXISTS `GetClassName`;
DELIMITER //
CREATE FUNCTION `GetClassName`(`ClassCode` CHAR(5)


) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
    COMMENT 'This Function is used to get the class name '
BEGIN
   
 			DECLARE SUBJECTNAME VARCHAR(50);
		
		     SELECT SM.SubjectName INTO SUBJECTNAME FROM subjectmater SM WHERE SM.SubjectCode = ClassCode ;
    
         
			
	
				
			-- return the Sequence
			RETURN SUBJECTNAME ;
				
			
			
    
   
END//
DELIMITER ;

-- Dumping structure for function 3edu_db.GetSequence
DROP FUNCTION IF EXISTS `GetSequence`;
DELIMITER //
CREATE FUNCTION `GetSequence`(`SequenceID` INT


) RETURNS varchar(50) CHARSET latin1
    DETERMINISTIC
    COMMENT 'This Function is used to get a sequnce based on the defined sequnces'
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
CREATE FUNCTION `GetStudntNo`(`SequenceID` INT
) RETURNS varchar(50) CHARSET latin1
    DETERMINISTIC
    COMMENT 'This Function is used to get a sequnce based on the defined sequnces'
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
CREATE FUNCTION `GetTenantIDByClassMasterPublicID`(`ClassMasterPublicID_` VARCHAR(100)
) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
    COMMENT 'This Function is used to get tenandtID by callss puplic ID '
BEGIN
   
 			DECLARE TENANTID VARCHAR(100);
		
		     SELECT CM.TenantID INTO TENANTID FROM classmaster CM WHERE CM.ClassMasterPublicID = ClassMasterPublicID_ ;
    
         
			
	
				
			-- return the Sequence
			RETURN TENANTID ;
				
			
			
    
   
END//
DELIMITER ;

-- Dumping structure for trigger 3edu_db.AddStudentToUserMaster
DROP TRIGGER IF EXISTS `AddStudentToUserMaster`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
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
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vwsequncemaster` AS SELECT SM.SequenceMasterID AS 'SequenceMasterID',
		 SM.SequnceCode		AS 'SequnceCode',
		 SM.LastInsertedID	AS 'LastInsertedID',
		 SM.UpdatedOn			AS 'UpdatedOn'

FROM sequencemaster SM ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

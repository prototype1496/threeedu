-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.8-MariaDB - mariadb.org binary distribution
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.address: ~2 rows (approximately)
DELETE FROM `address`;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` (`AddressID`, `PrimaryAddress`, `SecondaryAddress`, `ZipCode`, `DistrictID`, `IdentificationID`, `UpdatedOn`) VALUES
	(5, 'test', NULL, '10010', 3, 'TECH0000000003', '2020-11-20 11:52:45'),
	(6, 'This address is for the test ', NULL, '10010', 4, '202000041', '2021-05-16 12:17:05');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.assementtypemaster
DROP TABLE IF EXISTS `assementtypemaster`;
CREATE TABLE IF NOT EXISTS `assementtypemaster` (
  `AssementTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `GradeMasterID` int(11) NOT NULL,
  `SubjectCode` char(5) NOT NULL,
  `AssementTypeName` varchar(50) NOT NULL,
  `IsActive` char(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedBy` varchar(50) NOT NULL,
  PRIMARY KEY (`SubjectCode`,`GradeMasterID`,`AssementTypeName`),
  UNIQUE KEY `Index 3` (`AssementTypeID`),
  KEY `FK_assementtypemaster_grademaster` (`GradeMasterID`),
  CONSTRAINT `FK_assementtypemaster_grademaster` FOREIGN KEY (`GradeMasterID`) REFERENCES `grademaster` (`GradeMasterID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_assementtypemaster_subjectmater` FOREIGN KEY (`SubjectCode`) REFERENCES `subjectmater` (`SubjectCode`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.assementtypemaster: ~3 rows (approximately)
DELETE FROM `assementtypemaster`;
/*!40000 ALTER TABLE `assementtypemaster` DISABLE KEYS */;
INSERT INTO `assementtypemaster` (`AssementTypeID`, `GradeMasterID`, `SubjectCode`, `AssementTypeName`, `IsActive`, `UpdatedOn`, `UpdatedBy`) VALUES
	(1, 8, 'MATH', 'Class Exercis 1', '1', '2021-06-13 07:28:11', ''),
	(2, 8, 'MATH', 'End Of Tem Test', '1', '2021-06-13 07:29:01', ''),
	(3, 8, 'MATH', 'Mid Tem Test', '1', '2021-06-13 07:28:30', '');
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
  CONSTRAINT `FK_classdetails_classmaster` FOREIGN KEY (`ClassMasterPublicID`) REFERENCES `classmaster` (`ClassMasterPublicID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_classdetails_classroom` FOREIGN KEY (`ClassRoomPublicID`) REFERENCES `classroom` (`ClassRoomPublicID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_classdetails_subjectmater` FOREIGN KEY (`SubjectCode`) REFERENCES `subjectmater` (`SubjectCode`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.classdetails: ~9 rows (approximately)
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
	(9, 'CLASDT0000000009', 'CLAS0000000004', 'PYED', 'CLRM0000000001', '1', 'sys', '2021-05-22 10:01:07');
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
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ClassMasterID`) USING BTREE,
  UNIQUE KEY `ClassCode` (`ClassCode`) USING BTREE,
  UNIQUE KEY `ClassPublicID` (`ClassMasterPublicID`) USING BTREE,
  KEY `FK_classmaster_grademaster` (`GradeMasterID`) USING BTREE,
  KEY `FK_classmaster_teachermaster` (`ClassTeacherID`) USING BTREE,
  CONSTRAINT `FK_classmaster_grademaster` FOREIGN KEY (`GradeMasterID`) REFERENCES `grademaster` (`GradeMasterID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_classmaster_teachermaster` FOREIGN KEY (`ClassTeacherID`) REFERENCES `teachermaster` (`TeaherMasterPublicID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.classmaster: ~11 rows (approximately)
DELETE FROM `classmaster`;
/*!40000 ALTER TABLE `classmaster` DISABLE KEYS */;
INSERT INTO `classmaster` (`ClassMasterID`, `ClassMasterPublicID`, `ClassTeacherID`, `GradeMasterID`, `ClassName`, `ClassCode`, `Description`, `UpdatedBy`, `UpdatedOn`, `IsActive`) VALUES
	(1, 'CLAS0000000004', 'TECH0000000003', 8, 'Grade 8', '8 A', NULL, 'sYS', '2021-05-16 12:04:00', '1'),
	(2, 'CLAS0000000005', 'TECH0000000003', 8, 'Grade 8', '8 B', NULL, 'Syd', '2021-05-20 16:53:51', '1'),
	(3, 'CLAS0000000006', 'TECH0000000003', 8, 'Grade 8', '8 C', NULL, 'Syd', '2021-05-20 16:53:51', '1'),
	(4, 'CLAS0000000007', 'TECH0000000003', 8, 'Grade 8', '8 D', NULL, 'Syd', '2021-05-20 16:53:51', '1'),
	(5, 'CLAS0000000008', 'TECH0000000003', 9, 'Grade 9', '9 A', NULL, 'Syd', '2021-05-20 16:53:51', '1'),
	(6, 'CLAS0000000009', 'TECH0000000003', 9, 'Grade 9', '9 B', NULL, 'Syd', '2021-05-20 16:53:51', '1'),
	(7, 'CLAS0000000010', 'TECH0000000003', 9, 'Grade 9', '9 C', NULL, 'Syd', '2021-05-20 16:53:51', '1'),
	(8, 'CLAS0000000011', 'TECH0000000003', 10, 'Grade 10', '10 A', NULL, 'Syd', '2021-05-20 16:53:51', '1'),
	(9, 'CLAS0000000012', 'TECH0000000003', 10, 'Grade 10', '10 B', NULL, 'Syd', '2021-05-20 16:53:51', '1'),
	(10, 'CLAS0000000013', 'TECH0000000003', 11, 'Grade 11', '11 A', NULL, 'Syd', '2021-05-20 16:53:51', '1'),
	(11, 'CLAS0000000014', 'TECH0000000003', 11, 'Grade 11', '11 B', NULL, 'Syd', '2021-05-20 16:53:51', '1');
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
  PRIMARY KEY (`ClassRoomID`) USING BTREE,
  UNIQUE KEY `RoomPublicID` (`ClassRoomPublicID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.classroom: ~4 rows (approximately)
DELETE FROM `classroom`;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` (`ClassRoomID`, `ClassRoomPublicID`, `ClassRoomName`, `UpdatedBy`, `UpdatedOn`, `IsActive`) VALUES
	(1, 'CLRM0000000001', 'Room 1', 'sys', '2020-05-24 16:17:04', '1'),
	(2, 'CLRM0000000002', 'Room 2', 'sys', '2020-05-24 16:17:48', '1'),
	(3, 'CLRM0000000003', 'Room 3', 'sys', '2020-05-24 16:18:00', '1'),
	(4, 'CLRM0000000004', 'Room 4', 'sys', '2020-05-24 16:18:16', '1');
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;

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
  PRIMARY KEY (`DepartmentID`),
  UNIQUE KEY `ShortHand` (`ShortHand`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.department: ~7 rows (approximately)
DELETE FROM `department`;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`DepartmentID`, `DepartmentName`, `ShortHand`) VALUES
	(1, 'Social Sciences', 'SSS'),
	(2, 'Mathermatics', 'MATH'),
	(3, 'Home Ecomomics', 'HE'),
	(4, 'Science', 'SCEN'),
	(5, 'English Language', 'EGLA'),
	(6, 'Comercial Subject', 'CMSB'),
	(7, 'Expresive Arts', 'EXAT');
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
  PRIMARY KEY (`GradeMasterID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.grademaster: ~12 rows (approximately)
DELETE FROM `grademaster`;
/*!40000 ALTER TABLE `grademaster` DISABLE KEYS */;
INSERT INTO `grademaster` (`GradeMasterID`, `Grade`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 11),
	(12, 12);
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
	(3, 'Devorced', '1'),
	(4, 'Single', '1');
/*!40000 ALTER TABLE `maritalstatusmaster` ENABLE KEYS */;

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

-- Dumping structure for table 3edu_db.sequencemaster
DROP TABLE IF EXISTS `sequencemaster`;
CREATE TABLE IF NOT EXISTS `sequencemaster` (
  `SequenceMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `SequnceCode` char(4) NOT NULL,
  `LastInsertedID` int(11) NOT NULL DEFAULT 0,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SequenceMasterID`),
  UNIQUE KEY `SequnceCode` (`SequnceCode`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.sequencemaster: ~10 rows (approximately)
DELETE FROM `sequencemaster`;
/*!40000 ALTER TABLE `sequencemaster` DISABLE KEYS */;
INSERT INTO `sequencemaster` (`SequenceMasterID`, `SequnceCode`, `LastInsertedID`, `UpdatedOn`) VALUES
	(1, 'TECH', 4, '2019-11-01 19:08:09'),
	(2, 'HEAD', 0, '2019-11-01 19:49:01'),
	(3, 'TOKN', 25, '2019-11-01 20:00:03'),
	(4, 'EMIL', 2, '2019-11-15 05:28:12'),
	(5, 'TRPD', 3, '2019-11-17 07:13:19'),
	(6, 'SCHL', 1, '2019-11-17 18:52:58'),
	(7, 'TRD', 2, '2019-11-18 21:59:20'),
	(8, 'STNO', 33, '2021-05-22 19:45:06'),
	(9, 'SDNT', 28, '2021-05-22 20:49:17'),
	(10, 'STDT', 44, '2021-05-22 22:25:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.session: ~2 rows (approximately)
DELETE FROM `session`;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` (`SessionID`, `UserMasterPublicID`, `SerialID`, `TokenID`, `TokenCreatedTime`, `UpdatedBy`, `UpdatedOn`) VALUES
	(24, 'TECH0000000001', 'TOKN00000000024', 'ccf770174decb8687b6b041dc09f97164824b5c38788aa217c', '1623561126', 'a', '2021-06-13 07:12:10'),
	(25, 'TECH0000000003', 'TOKN00000000025', 'a1635177ffd79203b49fdfb1092eb13c2040aa7140487acdf2', '1623572749', 't', '2021-06-13 10:25:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.sessionhistory: ~15 rows (approximately)
DELETE FROM `sessionhistory`;
/*!40000 ALTER TABLE `sessionhistory` DISABLE KEYS */;
INSERT INTO `sessionhistory` (`SessionHistoryID`, `SessionID`, `UserMasterPublicID`, `SerialID`, `TokenID`, `TokenCreatedTime`, `UpdatedBy`, `UpdatedOn`) VALUES
	(11, '11', 'TECH0000000003', 'TOKN00000000011', 'e74312f42ce76a5220211d263341a41b3c9f9de8e7ddb003a0', '1621154057', 't', '2021-05-16 10:34:17'),
	(12, '12', 'TECH0000000003', 'TOKN00000000012', '93d539adc365577fe58b01dfd91ce7464c698a2acfbf44e0be', '1621156605', 't', '2021-05-16 11:16:45'),
	(13, '13', 'TECH0000000003', 'TOKN00000000013', '912f3774cc2ce47c43c46f1beaca7fac345aacb03334fd7fd5', '1621247775', 't', '2021-05-17 12:36:17'),
	(14, '14', 'TECH0000000003', 'TOKN00000000014', '1429d1a771841b0e70a47f803123a1226c6d9ce63c08469be2', '1621258756', 't', '2021-05-17 15:39:17'),
	(15, '15', 'TECH0000000001', 'TOKN00000000015', '89dfd1f9a45b42496b83c892625abac3559eccdc9396575dd3', '1621504084', 'a', '2021-05-20 11:48:07'),
	(16, '16', 'TECH0000000001', 'TOKN00000000016', '5619883bdc3b99c02003690ac5091848ae73d1969dd861ae34', '1621670356', 'a', '2021-05-22 09:59:17'),
	(17, '17', 'TECH0000000001', 'TOKN00000000017', '2cdce058de63efe18aa1e6f6113d62c59a5805bdb1ea6ab2cd', '1621767854', 'a', '2021-05-23 13:04:16'),
	(18, '18', 'TECH0000000001', 'TOKN00000000018', 'ddc729cde648e4a168440d65687e4963d5f04b02095f61d170', '1621796706', 'a', '2021-05-23 21:05:07'),
	(19, '19', 'TECH0000000003', 'TOKN00000000019', '5d0494c3eb093049f0469b681119733f6c3cd31dff8fdb4e48', '1621801826', 't', '2021-05-23 22:30:26'),
	(20, '20', 'TECH0000000003', 'TOKN00000000020', 'c9af313095b749b383d0061be1c66951b7a605e1e5f471d106', '1622292108', 't', '2021-05-29 14:41:51'),
	(21, '21', 'TECH0000000001', 'TOKN00000000021', 'ead1717beda82a63945a58061a021648206faaaa4f46da5961', '1622292261', 'a', '2021-05-29 14:44:21'),
	(22, '22', 'TECH0000000003', 'TOKN00000000022', 'd51f593d831ee7f0607d91ccef31932c71ab7227584c3f55f4', '1622292309', 't', '2021-05-29 14:45:09'),
	(23, '23', 'TECH0000000003', 'TOKN00000000023', 'd8150c3089dbdde596b2129b52cdc6def25dffab19b25b9d22', '1623479474', 't', '2021-06-12 08:31:15'),
	(24, '24', 'TECH0000000001', 'TOKN00000000024', 'ccf770174decb8687b6b041dc09f97164824b5c38788aa217c', '1623561126', 'a', '2021-06-13 07:12:10'),
	(25, '25', 'TECH0000000003', 'TOKN00000000025', 'a1635177ffd79203b49fdfb1092eb13c2040aa7140487acdf2', '1623572749', 't', '2021-06-13 10:25:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.studentattendance: ~24 rows (approximately)
DELETE FROM `studentattendance`;
/*!40000 ALTER TABLE `studentattendance` DISABLE KEYS */;
INSERT INTO `studentattendance` (`StudentAttendanceID`, `StudentID`, `ClassID`, `UpdatedOn`, `Status`, `Reason`) VALUES
	(33, ' 3EDU202100031', 'CLAS0000000004', '2021-05-29 18:04:43', '3', NULL),
	(34, ' 3EDU202100023', 'CLAS0000000004', '2021-05-29 18:04:43', '3', NULL),
	(35, ' 3EDU202100020', 'CLAS0000000004', '2021-05-29 18:04:43', '3', NULL),
	(36, ' 3EDU202100010', 'CLAS0000000004', '2021-05-29 18:04:43', '3', NULL),
	(37, ' 3EDU202100009', 'CLAS0000000004', '2021-05-29 18:04:43', '3', NULL),
	(38, ' 3EDU202100031', 'CLAS0000000004', '2021-05-29 18:05:25', '3', NULL),
	(39, ' 3EDU202100023', 'CLAS0000000004', '2021-05-29 18:05:25', '3', NULL),
	(40, ' 3EDU202100020', 'CLAS0000000004', '2021-05-29 18:05:25', '3', NULL),
	(41, ' 3EDU202100010', 'CLAS0000000004', '2021-05-29 18:05:25', '3', NULL),
	(42, ' 3EDU202100009', 'CLAS0000000004', '2021-05-29 18:05:25', '3', NULL),
	(43, ' 3EDU202100031', 'CLAS0000000004', '2021-05-29 18:07:43', '3', NULL),
	(44, ' 3EDU202100023', 'CLAS0000000004', '2021-05-29 18:07:43', '3', NULL),
	(45, ' 3EDU202100020', 'CLAS0000000004', '2021-05-29 18:07:43', '3', NULL),
	(46, ' 3EDU202100010', 'CLAS0000000004', '2021-05-29 18:07:43', '3', NULL),
	(47, ' 3EDU202100009', 'CLAS0000000004', '2021-05-29 18:07:43', '3', NULL),
	(48, ' 3EDU202100031', 'CLAS0000000004', '2021-05-29 18:09:01', '3', NULL),
	(49, ' 3EDU202100023', 'CLAS0000000004', '2021-05-29 18:09:01', '3', NULL),
	(50, ' 3EDU202100020', 'CLAS0000000004', '2021-05-29 18:09:01', '3', NULL),
	(51, ' 3EDU202100010', 'CLAS0000000004', '2021-05-29 18:09:01', '3', NULL),
	(52, ' 3EDU202100009', 'CLAS0000000004', '2021-05-29 18:09:01', '3', NULL),
	(53, ' 3EDU202100031', 'CLAS0000000004', '2021-05-29 18:11:01', '3', NULL),
	(54, ' 3EDU202100023', 'CLAS0000000004', '2021-05-29 18:11:01', '3', NULL),
	(55, ' 3EDU202100020', 'CLAS0000000004', '2021-05-29 18:11:01', '3', NULL),
	(56, ' 3EDU202100010', 'CLAS0000000004', '2021-05-29 18:11:01', '3', NULL),
	(57, ' 3EDU202100009', 'CLAS0000000004', '2021-05-29 18:11:01', '3', NULL);
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
  `Column 12` varchar(10) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.studentmaster: ~6 rows (approximately)
DELETE FROM `studentmaster`;
/*!40000 ALTER TABLE `studentmaster` DISABLE KEYS */;
INSERT INTO `studentmaster` (`StudentMasterID`, `StudentMasterPublicID`, `ProfilePic`, `StudentNo`, `FirstName`, `LastName`, `OtherName`, `GenderID`, `MaritalStatusID`, `ClassMasterPublicID`, `DOB`, `EmailAddress`, `GuardianContactNo`, `Column 12`, `GuardianMaleName`, `GuardianFemaleName`, `Address`, `UpdatedBy`, `UpdatedOn`, `Year`, `IsActive`) VALUES
	(3, 'SDNT0000000001', '../../uploads/3EDU20210005_images.png', '3EDU202100009', 'Alinuswe', 'Banda', NULL, 1, 4, 'CLAS0000000004', '1996-05-22', NULL, '097785684', '', 'Ali Mwanza', 'Tina Type', 'North mind Bwigimfumu', 'sys', '2021-05-22 18:01:06', '2021', '1'),
	(9, 'SDNT0000000005', '../../uploads/3EDU202100010_reri.jpg', '3EDU202100010', 'Samuel', 'Banda', 'Liabwa', 1, 3, 'CLAS0000000004', '1992-01-01', NULL, '0977856258', '', 'Mwamba Liabwa Banda', 'Mwape Liabwa', 'North Mid Lusaka', 'a', '2021-05-22 22:23:33', '2021', '1'),
	(17, 'SDNT00000000015', '../../uploads/3EDU20210008_lady.png', '3EDU202100020', 'Mwaka', 'Vwalika', 'Candy', 1, 4, 'CLAS0000000004', '2004-01-01', NULL, '0977856258', '', 'Mwamba Liabwa Vwalika', 'Mwape Vwalika', '204 B provident road Fairview', 'a', '2021-05-22 23:57:34', '2021', '1'),
	(20, 'SDNT00000000018', '../../uploads/defult.png', '3EDU202100023', 'Myday', 'Kasalwe', NULL, 2, 1, 'CLAS0000000004', '2004-05-14', NULL, '0977100587', '', 'Mwamba Liabwa Banda', NULL, 'Luska Zambia', 'a', '2021-05-23 00:13:35', '2021', '1'),
	(22, 'SDNT00000000026', '../../uploads/defult.png', '3EDU202100031', 'Emmanuel', 'Mwando', 'Lukulu', 1, 2, 'CLAS0000000013', '2021-05-07', NULL, '0977100587', '', 'sdsd', NULL, 'Lusaka, Chelenge', 'a', '2021-05-23 00:31:30', '2021', '1'),
	(24, 'SDNT00000000028', '../../uploads/3EDU202100033_lady.png', '3EDU202100033', 'Test', 'Pupile', NULL, 1, 4, 'CLAS0000000013', '2000-01-01', 'alinuswemwandobo@gmail.com4', '0977100587', '', 'Mwamba Liabwa Banda', 'Mwape Liabwa', 'Lusaka, Chelenge', 'a', '2021-05-23 21:59:44', '2021', '1');
/*!40000 ALTER TABLE `studentmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.studnetassesment
DROP TABLE IF EXISTS `studnetassesment`;
CREATE TABLE IF NOT EXISTS `studnetassesment` (
  `StudentMasterPublicID` varchar(50) NOT NULL,
  `AssecemntTypeMasterID` int(11) NOT NULL,
  `ClassMasterPublicID` varchar(50) NOT NULL,
  `YearAdded` year(4) NOT NULL DEFAULT year(current_timestamp()),
  `Score` double NOT NULL,
  `Commment` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `AddedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`StudentMasterPublicID`,`ClassMasterPublicID`,`YearAdded`,`AssecemntTypeMasterID`) USING BTREE,
  KEY `FK_studnetassesment_classmaster` (`ClassMasterPublicID`),
  KEY `FK_studnetassesment_assementtypemaster` (`AssecemntTypeMasterID`),
  CONSTRAINT `FK_studnetassesment_assementtypemaster` FOREIGN KEY (`AssecemntTypeMasterID`) REFERENCES `assementtypemaster` (`AssementTypeID`) ON DELETE NO ACTION,
  CONSTRAINT `FK_studnetassesment_classmaster` FOREIGN KEY (`ClassMasterPublicID`) REFERENCES `classmaster` (`ClassMasterPublicID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_studnetassesment_studentmaster` FOREIGN KEY (`StudentMasterPublicID`) REFERENCES `studentmaster` (`StudentMasterPublicID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.studnetassesment: ~4 rows (approximately)
DELETE FROM `studnetassesment`;
/*!40000 ALTER TABLE `studnetassesment` DISABLE KEYS */;
/*!40000 ALTER TABLE `studnetassesment` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.subjectmater
DROP TABLE IF EXISTS `subjectmater`;
CREATE TABLE IF NOT EXISTS `subjectmater` (
  `SubjectMaterID` int(11) NOT NULL AUTO_INCREMENT,
  `SubjectName` varchar(50) NOT NULL,
  `SubjectCode` char(10) NOT NULL,
  `DepartmentCode` char(4) NOT NULL,
  `SubjectDiscription` varchar(500) DEFAULT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SubjectMaterID`) USING BTREE,
  UNIQUE KEY `SubjectCode` (`SubjectCode`) USING BTREE,
  KEY `FK_subjectmater_department` (`DepartmentCode`),
  CONSTRAINT `FK_subjectmater_department` FOREIGN KEY (`DepartmentCode`) REFERENCES `department` (`ShortHand`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.subjectmater: ~27 rows (approximately)
DELETE FROM `subjectmater`;
/*!40000 ALTER TABLE `subjectmater` DISABLE KEYS */;
INSERT INTO `subjectmater` (`SubjectMaterID`, `SubjectName`, `SubjectCode`, `DepartmentCode`, `SubjectDiscription`, `UpdatedBy`, `UpdatedOn`, `IsActive`) VALUES
	(1, 'Mathematics', 'MATH', 'MATH', NULL, 'SYS', '2020-05-24 13:52:00', '1'),
	(2, 'English', 'ENG', 'EGLA', NULL, 'Sys', '2020-05-24 13:52:05', '1'),
	(3, 'History', 'HIST', 'SSS', NULL, 'SYS', '2020-05-24 13:53:10', '1'),
	(4, 'Additional Mathematics', 'ADMA', 'MATH', NULL, 'SYS', '2020-05-24 13:57:24', '1'),
	(5, 'Biology ', 'BIOL', 'SCEN', NULL, 'SYS', '2020-05-24 13:57:41', '1'),
	(7, 'Physics', 'PHSY', 'SCEN', NULL, 'SYS', '2020-05-24 13:58:05', '1'),
	(8, 'Chemistry', 'CHEM', 'SCEN', NULL, 'SYS', '2020-05-24 13:58:20', '1'),
	(9, 'Geography ', 'GEOG', 'SSS', NULL, 'SYS', '2020-05-24 13:58:44', '1'),
	(10, 'Art', 'ART', 'EXAT', NULL, 'SYS', '2020-05-24 13:59:04', '1'),
	(11, 'Geometrical Mechanical Drawing ', 'GMD', 'EXAT', NULL, 'SYS', '2020-05-24 13:59:22', '1'),
	(12, 'Technical Drawing', 'TD', 'EXAT', NULL, 'SYS', '2020-05-24 13:59:45', '1'),
	(13, 'Religious Education', 'RE110', 'SSS', NULL, 'SYS', '2020-05-24 14:00:45', '1'),
	(14, 'Religious Education', 'RE210', 'SSS', NULL, 'SYS', '2020-05-24 14:06:05', '1'),
	(15, 'Agriculture Science', 'AGR', 'SCEN', NULL, 'SYS', '2020-05-24 14:06:34', '1'),
	(16, 'Food And Nutrition', 'FN', 'HE', NULL, 'SYS', '2020-05-24 14:06:58', '1'),
	(17, 'Home Economics', 'HE', 'HE', NULL, 'SYS', '2020-05-24 14:07:13', '1'),
	(18, 'Fashion And Fabrics', 'FF', 'HE', NULL, 'SYS', '2020-05-24 14:07:37', '1'),
	(19, 'Civic Education', 'CVIC', 'SSS', NULL, 'SYS', '2020-05-24 14:07:55', '1'),
	(20, 'Accounts ', 'ACC', 'CMSB', NULL, 'SYS', '2020-05-24 14:08:15', '1'),
	(22, 'Book Keeping', 'BK', 'CMSB', NULL, 'SYS', '2020-05-24 14:08:41', '1'),
	(23, 'French ', 'FNCH', 'EGLA', NULL, 'SYS', '2020-05-24 14:09:02', '1'),
	(24, 'Bemba ', 'BEM', 'EGLA', NULL, 'SYS', '2020-05-24 14:09:11', '1'),
	(25, 'Music ', 'MUIC', 'EXAT', NULL, 'SYS', '2020-05-24 14:09:43', '1'),
	(26, 'Commerce ', 'COMC', 'CMSB', NULL, 'SYS', '2020-05-24 14:09:59', '1'),
	(27, 'Scinece', 'SCEN', 'SCEN', NULL, 'SYS', '2021-05-22 10:04:43', '1'),
	(28, 'Computer Studies ', 'CMST', 'SCEN', NULL, 'SYS', '2021-05-22 10:33:03', '1'),
	(29, 'Integrated Science', 'ITSC', 'SCEN', NULL, 'SYS', '0000-00-00 00:00:00', '1'),
	(30, 'Business Studies', 'BSST', 'SSS', NULL, 'SYS', '2021-05-22 10:39:31', '1'),
	(31, 'Socials Studies ', 'SCST', 'SSS', NULL, 'SYS', '2021-05-22 10:47:05', '1'),
	(32, 'Zambian Language ', 'ZMLG', 'CMSB', NULL, 'SYS', '2021-05-22 10:47:57', '1'),
	(33, 'Physical Education', 'PYED', 'CMSB', NULL, 'SYS', '2021-05-22 10:53:24', '1');
/*!40000 ALTER TABLE `subjectmater` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.teacherdetails
DROP TABLE IF EXISTS `teacherdetails`;
CREATE TABLE IF NOT EXISTS `teacherdetails` (
  `TeacherDetailsID` int(11) NOT NULL AUTO_INCREMENT,
  `TeacherDetailsPublicID` varchar(50) NOT NULL,
  `TeacherMasterPublicID` varchar(50) NOT NULL,
  `SubjectCode` char(6) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TeacherDetailsID`) USING BTREE,
  UNIQUE KEY `TeacherDetailsPublicID` (`TeacherDetailsPublicID`) USING BTREE,
  KEY `FK_teacherdetails_teachermaster` (`TeacherMasterPublicID`) USING BTREE,
  KEY `FK_teacherdetails_subjectmater` (`SubjectCode`) USING BTREE,
  CONSTRAINT `FK_teacherdetails_subjectmater` FOREIGN KEY (`SubjectCode`) REFERENCES `subjectmater` (`SubjectCode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_teacherdetails_teachermaster` FOREIGN KEY (`TeacherMasterPublicID`) REFERENCES `teachermaster` (`TeaherMasterPublicID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.teacherdetails: ~4 rows (approximately)
DELETE FROM `teacherdetails`;
/*!40000 ALTER TABLE `teacherdetails` DISABLE KEYS */;
INSERT INTO `teacherdetails` (`TeacherDetailsID`, `TeacherDetailsPublicID`, `TeacherMasterPublicID`, `SubjectCode`, `UpdatedBy`, `UpdatedOn`) VALUES
	(1, 'TECHDT0000000002', 'TECH0000000003', 'MATH', 'SYS', '2020-05-24 16:27:49'),
	(2, 'TECHDT0000000001', 'TECH0000000003', 'ADMA', 'sys', '2020-05-24 16:27:49'),
	(3, 'TECHDT0000000005', 'TECH0000000003', 'ART', 't', '2020-06-15 22:56:50'),
	(4, 'TECHDT0000000006', 'TECH0000000001', 'GMD', 't', '2020-06-15 22:56:50');
/*!40000 ALTER TABLE `teacherdetails` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.teachermaster: ~2 rows (approximately)
DELETE FROM `teachermaster`;
/*!40000 ALTER TABLE `teachermaster` DISABLE KEYS */;
INSERT INTO `teachermaster` (`TeacherID`, `TeaherMasterPublicID`, `TeacherPositionID`, `DeparmrntCode`, `StartDate`, `EndDate`, `UpdatedBy`, `UpdatedOn`, `IsActive`) VALUES
	(1, 'TECH0000000001', 3, 'MATH', '2020-05-24 16:25:03', NULL, 'sys', '2020-05-24 16:25:06', '1'),
	(2, 'TECH0000000003', 4, 'EXAT', '2020-06-15 22:56:50', NULL, 't', '2020-06-15 22:56:50', '1');
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
  `NRC` varchar(10) DEFAULT NULL,
  `Passport` varchar(50) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(300) NOT NULL,
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
  PRIMARY KEY (`UserMasterID`),
  UNIQUE KEY `PublicID` (`PublicID`),
  UNIQUE KEY `UserName` (`UserName`),
  UNIQUE KEY `NRC` (`NRC`),
  UNIQUE KEY `Passport` (`Passport`),
  KEY `FK_usermaster_usertypemaster` (`UserTypeID`),
  KEY `FK_usermaster_maritalstatusmaster` (`MaritalStatusID`),
  KEY `FK_usermaster_gendermaster` (`GenderID`),
  CONSTRAINT `FK_usermaster_gendermaster` FOREIGN KEY (`GenderID`) REFERENCES `gendermaster` (`GenderMasterID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_usermaster_maritalstatusmaster` FOREIGN KEY (`MaritalStatusID`) REFERENCES `maritalstatusmaster` (`MaritalStatusMasterID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_usermaster_usertypemaster` FOREIGN KEY (`UserTypeID`) REFERENCES `usertypemaster` (`UserTypeMasterID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.usermaster: ~3 rows (approximately)
DELETE FROM `usermaster`;
/*!40000 ALTER TABLE `usermaster` DISABLE KEYS */;
INSERT INTO `usermaster` (`UserMasterID`, `PublicID`, `NRC`, `Passport`, `UserName`, `Password`, `FirstName`, `LastName`, `OtherName`, `EmailAddress`, `ContactNo`, `GenderID`, `MaritalStatusID`, `DOB`, `UserTypeID`, `UpdatedBy`, `UpdatedOn`, `IsActive`, `LoginAttempts`, `IsLocked`) VALUES
	(1, 'TECH0000000001', '55445/16/1', 'cc', 'a', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Head', 'System', 'Teacher', 'prototype1496@gmail.com', '988755487', 1, 4, '1997-01-02', 3, 'Sys', '2019-11-14 08:56:25', '1', '0', '0'),
	(2, 'TECH0000000003', '515151/8/8', '74444/45/45', 't', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Alinuswe', 'Mwandobo', NULL, 'alinuswemwandobo@gmail.com', '977100587', 1, 1, '1996-01-01', 3, 'admin', '2020-11-20 11:52:45', '1', '0', '0'),
	(4, '202000041', NULL, NULL, 's', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Student', 'Grace', NULL, NULL, '09771258789', 2, 4, '1996-05-16', 3, 'Sys', '2021-05-16 11:43:28', '1', '0', '0');
/*!40000 ALTER TABLE `usermaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db.usertypemaster
DROP TABLE IF EXISTS `usertypemaster`;
CREATE TABLE IF NOT EXISTS `usertypemaster` (
  `UserTypeMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `UserType` varchar(20) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserTypeMasterID`),
  UNIQUE KEY `UserType` (`UserType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db.usertypemaster: ~2 rows (approximately)
DELETE FROM `usertypemaster`;
/*!40000 ALTER TABLE `usertypemaster` DISABLE KEYS */;
INSERT INTO `usertypemaster` (`UserTypeMasterID`, `UserType`, `IsActive`) VALUES
	(1, 'Admin', '1'),
	(3, 'Teacher', '1');
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

-- Dumping structure for procedure 3edu_db.GetAllDepartments
DROP PROCEDURE IF EXISTS `GetAllDepartments`;
DELIMITER //
CREATE PROCEDURE `GetAllDepartments`()
BEGIN
		SELECT 	DPT.ShortHand 		AS 'DepartmentID',
					DPT.DepartmentName	AS 'DepartmentName' 
		FROM department DPT;
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
	IN `CLASSMASTERPUBLICID_` VARCHAR(50)
)
BEGIN
			SET @CLASSMASTERPUBLICID  = CLASSMASTERPUBLICID_;
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
			JOIN classmaster CM ON CM.ClassMasterPublicID = SM.ClassMasterPublicID WHERE CM.ClassMasterPublicID = @CLASSMASTERPUBLICID  AND SM.IsActive = 1 ORDER BY SM.FirstName,SM.LastName,SM.StudentNo ASC;
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
				 CONCAT(SM.SubjectName,' ( ',SM.SubjectCode,' )')		AS 'SubjectName' 
		FROM subjectmater SM ;
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
		WHERE DP.ShortHand = @DEPARTMENTCODE;
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
		 SELECT	CONCAT('3EDU',YEAR(CURDATE()),"000",NEWLASTINSETEDID) AS SequnceNumber;
				
			
			
    
   
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
				 DP.ShortHand		AS 'ShortHand'
		FROM usermaster UM
		JOIN usertypemaster UTM ON UTM.UserTypeMasterID = UM.UserTypeID
		LEFT JOIN teachermaster TM ON TM.TeaherMasterPublicID = UM.PublicID
		LEFT JOIN department DP ON DP.ShortHand = TM.DeparmrntCode
	
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
			RETURN CONCAT('EDU',YEAR(CURDATE()),"000",NEWLASTINSETEDID) ;
				
			
			
    
   
END//
DELIMITER ;

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

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for 3edu_db_aupha
DROP DATABASE IF EXISTS `3edu_db_aupha`;
CREATE DATABASE IF NOT EXISTS `3edu_db_aupha` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `3edu_db_aupha`;

-- Dumping structure for table 3edu_db_aupha.address
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

-- Dumping data for table 3edu_db_aupha.address: ~2 rows (approximately)
DELETE FROM `address`;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` (`AddressID`, `PrimaryAddress`, `SecondaryAddress`, `ZipCode`, `DistrictID`, `IdentificationID`, `UpdatedOn`) VALUES
	(5, 'test', NULL, '10010', 3, 'TECH0000000003', '2020-11-20 11:52:45'),
	(6, 'This address is for the test ', NULL, '10010', 4, '202000041', '2021-05-16 12:17:05');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.classmaster
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db_aupha.classmaster: ~1 rows (approximately)
DELETE FROM `classmaster`;
/*!40000 ALTER TABLE `classmaster` DISABLE KEYS */;
INSERT INTO `classmaster` (`ClassMasterID`, `ClassMasterPublicID`, `ClassTeacherID`, `GradeMasterID`, `ClassName`, `ClassCode`, `Description`, `UpdatedBy`, `UpdatedOn`, `IsActive`) VALUES
	(1, 'CLAS0000000004', 'TECH0000000003', 8, 'Grade 8', '8 A', NULL, 'sYS', '2021-05-16 12:04:00', '1');
/*!40000 ALTER TABLE `classmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.country
DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `CountryID` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(50) NOT NULL,
  `ConuntryCode` char(5) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CountryID`),
  UNIQUE KEY `ConuntryCode` (`ConuntryCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db_aupha.country: ~1 rows (approximately)
DELETE FROM `country`;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`CountryID`, `CountryName`, `ConuntryCode`, `IsActive`) VALUES
	(1, 'Zambia ', '+260', '1');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.credentials_tb
DROP TABLE IF EXISTS `credentials_tb`;
CREATE TABLE IF NOT EXISTS `credentials_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `userType` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db_aupha.credentials_tb: ~0 rows (approximately)
DELETE FROM `credentials_tb`;
/*!40000 ALTER TABLE `credentials_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `credentials_tb` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.department
DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `DepartmentID` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(50) NOT NULL,
  `ShortHand` char(4) NOT NULL,
  PRIMARY KEY (`DepartmentID`),
  UNIQUE KEY `ShortHand` (`ShortHand`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db_aupha.department: ~7 rows (approximately)
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

-- Dumping structure for table 3edu_db_aupha.district
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

-- Dumping data for table 3edu_db_aupha.district: ~103 rows (approximately)
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

-- Dumping structure for table 3edu_db_aupha.emailservice
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

-- Dumping data for table 3edu_db_aupha.emailservice: ~1 rows (approximately)
DELETE FROM `emailservice`;
/*!40000 ALTER TABLE `emailservice` DISABLE KEYS */;
INSERT INTO `emailservice` (`EmailServiceID`, `EmailSerial`, `EmailAddress`, `EmailSubject`, `SendData`, `Status`, `UpdatedBy`, `UpdatedOn`) VALUES
	(1, 'EMIL0000000001', 'prototype1496@gmail.com', 'Teacher Time Management System Temp Login Cridentials', 'Wellcome to T.T.M.S<br><b>Username: </b> alinuswemwandobo@gmail.com<br><b>Temp Password: </b>VIJOE<br>Please login in to system and to change your password<br><br><b>If this message dose not belong to you please ignore it and have a good day </b> ', 'COMP', 'admin', '2020-11-20 11:52:46');
/*!40000 ALTER TABLE `emailservice` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.gendermaster
DROP TABLE IF EXISTS `gendermaster`;
CREATE TABLE IF NOT EXISTS `gendermaster` (
  `GenderMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `Gender` text NOT NULL,
  `ShortName` char(1) NOT NULL DEFAULT 'M',
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`GenderMasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db_aupha.gendermaster: ~2 rows (approximately)
DELETE FROM `gendermaster`;
/*!40000 ALTER TABLE `gendermaster` DISABLE KEYS */;
INSERT INTO `gendermaster` (`GenderMasterID`, `Gender`, `ShortName`, `IsActive`) VALUES
	(1, 'Male', 'M', '1'),
	(2, 'Female', 'F', '1');
/*!40000 ALTER TABLE `gendermaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.grademaster
DROP TABLE IF EXISTS `grademaster`;
CREATE TABLE IF NOT EXISTS `grademaster` (
  `GradeMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `Grade` int(11) NOT NULL,
  PRIMARY KEY (`GradeMasterID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db_aupha.grademaster: ~12 rows (approximately)
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

-- Dumping structure for table 3edu_db_aupha.gradingmaster
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

-- Dumping data for table 3edu_db_aupha.gradingmaster: ~9 rows (approximately)
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

-- Dumping structure for table 3edu_db_aupha.maritalstatusmaster
DROP TABLE IF EXISTS `maritalstatusmaster`;
CREATE TABLE IF NOT EXISTS `maritalstatusmaster` (
  `MaritalStatusMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `MaritalStatus` varchar(10) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaritalStatusMasterID`),
  UNIQUE KEY `MaritalStatus` (`MaritalStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db_aupha.maritalstatusmaster: ~4 rows (approximately)
DELETE FROM `maritalstatusmaster`;
/*!40000 ALTER TABLE `maritalstatusmaster` DISABLE KEYS */;
INSERT INTO `maritalstatusmaster` (`MaritalStatusMasterID`, `MaritalStatus`, `IsActive`) VALUES
	(1, 'Married', '1'),
	(2, 'Widow', '1'),
	(3, 'Devorced', '1'),
	(4, 'Single', '1');
/*!40000 ALTER TABLE `maritalstatusmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.province
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

-- Dumping data for table 3edu_db_aupha.province: ~10 rows (approximately)
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

-- Dumping structure for table 3edu_db_aupha.sequencemaster
DROP TABLE IF EXISTS `sequencemaster`;
CREATE TABLE IF NOT EXISTS `sequencemaster` (
  `SequenceMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `SequnceCode` char(4) NOT NULL,
  `LastInsertedID` int(11) NOT NULL DEFAULT 0,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SequenceMasterID`),
  UNIQUE KEY `SequnceCode` (`SequnceCode`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db_aupha.sequencemaster: ~7 rows (approximately)
DELETE FROM `sequencemaster`;
/*!40000 ALTER TABLE `sequencemaster` DISABLE KEYS */;
INSERT INTO `sequencemaster` (`SequenceMasterID`, `SequnceCode`, `LastInsertedID`, `UpdatedOn`) VALUES
	(1, 'TECH', 4, '2019-11-01 19:08:09'),
	(2, 'HEAD', 0, '2019-11-01 19:49:01'),
	(3, 'TOKN', 12, '2019-11-01 20:00:03'),
	(4, 'EMIL', 1, '2019-11-15 05:28:12'),
	(5, 'TRPD', 3, '2019-11-17 07:13:19'),
	(6, 'SCHL', 1, '2019-11-17 18:52:58'),
	(7, 'TRD', 2, '2019-11-18 21:59:20');
/*!40000 ALTER TABLE `sequencemaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.session
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db_aupha.session: ~1 rows (approximately)
DELETE FROM `session`;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` (`SessionID`, `UserMasterPublicID`, `SerialID`, `TokenID`, `TokenCreatedTime`, `UpdatedBy`, `UpdatedOn`) VALUES
	(12, 'TECH0000000003', 'TOKN00000000012', '93d539adc365577fe58b01dfd91ce7464c698a2acfbf44e0be', '1621156605', 't', '2021-05-16 11:16:45');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.sessionhistory
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db_aupha.sessionhistory: ~2 rows (approximately)
DELETE FROM `sessionhistory`;
/*!40000 ALTER TABLE `sessionhistory` DISABLE KEYS */;
INSERT INTO `sessionhistory` (`SessionHistoryID`, `SessionID`, `UserMasterPublicID`, `SerialID`, `TokenID`, `TokenCreatedTime`, `UpdatedBy`, `UpdatedOn`) VALUES
	(11, '11', 'TECH0000000003', 'TOKN00000000011', 'e74312f42ce76a5220211d263341a41b3c9f9de8e7ddb003a0', '1621154057', 't', '2021-05-16 10:34:17'),
	(12, '12', 'TECH0000000003', 'TOKN00000000012', '93d539adc365577fe58b01dfd91ce7464c698a2acfbf44e0be', '1621156605', 't', '2021-05-16 11:16:45');
/*!40000 ALTER TABLE `sessionhistory` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.statusmaster
DROP TABLE IF EXISTS `statusmaster`;
CREATE TABLE IF NOT EXISTS `statusmaster` (
  `StatusMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `StatueCode` char(4) NOT NULL,
  `Statue` varchar(50) NOT NULL,
  PRIMARY KEY (`StatusMasterID`),
  UNIQUE KEY `StatueCode` (`StatueCode`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db_aupha.statusmaster: ~12 rows (approximately)
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
	(12, 'FRJC', 'Final Rejection');
/*!40000 ALTER TABLE `statusmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.studentmaster
DROP TABLE IF EXISTS `studentmaster`;
CREATE TABLE IF NOT EXISTS `studentmaster` (
  `StudentMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `TitleLMasterID` int(11) NOT NULL DEFAULT 0,
  `StudentNo` varchar(50) NOT NULL,
  `ClassMasterPublicID` varchar(50) NOT NULL,
  `ParentMaleName` varchar(50) DEFAULT NULL,
  `ParentFemaleName` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`StudentMasterID`) USING BTREE,
  KEY `FK_studentmaster_classmaster` (`ClassMasterPublicID`) USING BTREE,
  KEY `FK_studentmaster_usermaster` (`StudentNo`),
  KEY `FK_studentmaster_titlemaster` (`TitleLMasterID`),
  CONSTRAINT `FK_studentmaster_classmaster` FOREIGN KEY (`ClassMasterPublicID`) REFERENCES `classmaster` (`ClassMasterPublicID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_studentmaster_titlemaster` FOREIGN KEY (`TitleLMasterID`) REFERENCES `titlemaster` (`TitleMasterID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_studentmaster_usermaster` FOREIGN KEY (`StudentNo`) REFERENCES `usermaster` (`PublicID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db_aupha.studentmaster: ~1 rows (approximately)
DELETE FROM `studentmaster`;
/*!40000 ALTER TABLE `studentmaster` DISABLE KEYS */;
INSERT INTO `studentmaster` (`StudentMasterID`, `TitleLMasterID`, `StudentNo`, `ClassMasterPublicID`, `ParentMaleName`, `ParentFemaleName`, `UpdatedBy`, `UpdatedOn`, `IsActive`) VALUES
	(2, 1, '202000041', 'CLAS0000000004', 'Jecob Mosses', 'Mreey Jecobs', 't', '2020-06-11 01:59:02', '1');
/*!40000 ALTER TABLE `studentmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.subjectmater
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db_aupha.subjectmater: ~24 rows (approximately)
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
	(26, 'Commerce ', 'COMC', 'CMSB', NULL, 'SYS', '2020-05-24 14:09:59', '1');
/*!40000 ALTER TABLE `subjectmater` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.teacherdetails
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

-- Dumping data for table 3edu_db_aupha.teacherdetails: ~4 rows (approximately)
DELETE FROM `teacherdetails`;
/*!40000 ALTER TABLE `teacherdetails` DISABLE KEYS */;
INSERT INTO `teacherdetails` (`TeacherDetailsID`, `TeacherDetailsPublicID`, `TeacherMasterPublicID`, `SubjectCode`, `UpdatedBy`, `UpdatedOn`) VALUES
	(1, 'TECHDT0000000002', 'TECH0000000003', 'MATH', 'SYS', '2020-05-24 16:27:49'),
	(2, 'TECHDT0000000001', 'TECH0000000003', 'ADMA', 'sys', '2020-05-24 16:27:49'),
	(3, 'TECHDT0000000005', 'TECH0000000003', 'ART', 't', '2020-06-15 22:56:50'),
	(4, 'TECHDT0000000006', 'TECH0000000001', 'GMD', 't', '2020-06-15 22:56:50');
/*!40000 ALTER TABLE `teacherdetails` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.teachermaster
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

-- Dumping data for table 3edu_db_aupha.teachermaster: ~2 rows (approximately)
DELETE FROM `teachermaster`;
/*!40000 ALTER TABLE `teachermaster` DISABLE KEYS */;
INSERT INTO `teachermaster` (`TeacherID`, `TeaherMasterPublicID`, `TeacherPositionID`, `DeparmrntCode`, `StartDate`, `EndDate`, `UpdatedBy`, `UpdatedOn`, `IsActive`) VALUES
	(1, 'TECH0000000001', 3, 'MATH', '2020-05-24 16:25:03', NULL, 'sys', '2020-05-24 16:25:06', '1'),
	(2, 'TECH0000000003', 4, 'EXAT', '2020-06-15 22:56:50', NULL, 't', '2020-06-15 22:56:50', '1');
/*!40000 ALTER TABLE `teachermaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.teacherpositionmaster
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

-- Dumping data for table 3edu_db_aupha.teacherpositionmaster: ~4 rows (approximately)
DELETE FROM `teacherpositionmaster`;
/*!40000 ALTER TABLE `teacherpositionmaster` DISABLE KEYS */;
INSERT INTO `teacherpositionmaster` (`TeacherPositionMasterID`, `PositionName`, `PositionDescription`, `UpdatedBy`, `UpdatedOn`, `IsActive`) VALUES
	(1, 'Head Of Department', 'This posion is head department', 'admin', '2019-11-04 00:08:23', '1'),
	(2, 'Deputy Head Teacher', 'Deputy Head Teacher Roll is to manage the School', 'admin', '2019-11-12 14:25:31', '1'),
	(3, 'Head Teacher ', 'Head Teacher  to manage the over role school activities ', 'admin', '2019-11-12 14:38:50', '1'),
	(4, 'Teacher', 'Teacher Role is to mange classes and pupils', 'admin', '2019-11-12 14:43:48', '1');
/*!40000 ALTER TABLE `teacherpositionmaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.titlemaster
DROP TABLE IF EXISTS `titlemaster`;
CREATE TABLE IF NOT EXISTS `titlemaster` (
  `TitleMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `LongName` varchar(50) DEFAULT NULL,
  `ShortName` varchar(10) DEFAULT NULL,
  `isActive` char(1) DEFAULT '0',
  PRIMARY KEY (`TitleMasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db_aupha.titlemaster: ~4 rows (approximately)
DELETE FROM `titlemaster`;
/*!40000 ALTER TABLE `titlemaster` DISABLE KEYS */;
INSERT INTO `titlemaster` (`TitleMasterID`, `LongName`, `ShortName`, `isActive`) VALUES
	(1, 'Mister', 'Mr', '1'),
	(2, 'Miss', 'Miss', '1'),
	(3, 'Mrs', 'Mrs', '1'),
	(4, 'Ms', 'Ms', '1');
/*!40000 ALTER TABLE `titlemaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.usermaster
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

-- Dumping data for table 3edu_db_aupha.usermaster: ~3 rows (approximately)
DELETE FROM `usermaster`;
/*!40000 ALTER TABLE `usermaster` DISABLE KEYS */;
INSERT INTO `usermaster` (`UserMasterID`, `PublicID`, `NRC`, `Passport`, `UserName`, `Password`, `FirstName`, `LastName`, `OtherName`, `EmailAddress`, `ContactNo`, `GenderID`, `MaritalStatusID`, `DOB`, `UserTypeID`, `UpdatedBy`, `UpdatedOn`, `IsActive`, `LoginAttempts`, `IsLocked`) VALUES
	(1, 'TECH0000000001', '55445/16/1', 'cc', 'a', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Head', 'System', 'Teacher', 'prototype1496@gmail.com', '988755487', 1, 4, '1997-01-02', 3, 'Sys', '2019-11-14 08:56:25', '1', '0', '0'),
	(2, 'TECH0000000003', '515151/8/8', '74444/45/45', 't', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Alinuswe', 'Mwandobo', NULL, 'alinuswemwandobo@gmail.com', '977100587', 1, 1, '1996-01-01', 3, 'admin', '2020-11-20 11:52:45', '1', '0', '0'),
	(4, '202000041', NULL, NULL, 's', '$2y$10$2ZCc8dd426.0EuN6e3jSIuS1bXXSwhnEu2MfZNUgRpl9RjMyRqRXO', 'Student', 'Grace', NULL, NULL, '09771258789', 2, 4, '1996-05-16', 3, 'Sys', '2021-05-16 11:43:28', '1', '0', '0');
/*!40000 ALTER TABLE `usermaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.usertypemaster
DROP TABLE IF EXISTS `usertypemaster`;
CREATE TABLE IF NOT EXISTS `usertypemaster` (
  `UserTypeMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `UserType` varchar(20) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserTypeMasterID`),
  UNIQUE KEY `UserType` (`UserType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_db_aupha.usertypemaster: ~2 rows (approximately)
DELETE FROM `usertypemaster`;
/*!40000 ALTER TABLE `usertypemaster` DISABLE KEYS */;
INSERT INTO `usertypemaster` (`UserTypeMasterID`, `UserType`, `IsActive`) VALUES
	(1, 'Admin', '1'),
	(3, 'Teacher', '1');
/*!40000 ALTER TABLE `usertypemaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_db_aupha.user_tb
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

-- Dumping data for table 3edu_db_aupha.user_tb: ~0 rows (approximately)
DELETE FROM `user_tb`;
/*!40000 ALTER TABLE `user_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tb` ENABLE KEYS */;

-- Dumping structure for procedure 3edu_db_aupha.ActivateUser
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

-- Dumping structure for procedure 3edu_db_aupha.DeactivateUser
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

-- Dumping structure for procedure 3edu_db_aupha.GetAllDepartments
DROP PROCEDURE IF EXISTS `GetAllDepartments`;
DELIMITER //
CREATE PROCEDURE `GetAllDepartments`()
BEGIN
		SELECT 	DPT.ShortHand 		AS 'DepartmentID',
					DPT.DepartmentName	AS 'DepartmentName' 
		FROM department DPT;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db_aupha.GetCountryCode
DROP PROCEDURE IF EXISTS `GetCountryCode`;
DELIMITER //
CREATE PROCEDURE `GetCountryCode`()
BEGIN
		SELECT   CT.CountryID		AS 'CountryID',
					CT.ConuntryCode 	AS 'ConuntryCode'
		FROM country CT WHERE CT.IsActive=1;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db_aupha.GetDepartmentByCode
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

-- Dumping structure for procedure 3edu_db_aupha.GetDistrictByProvinceId
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

-- Dumping structure for procedure 3edu_db_aupha.GetEmailAdressByPositionID
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

-- Dumping structure for procedure 3edu_db_aupha.GetEmailData
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

-- Dumping structure for procedure 3edu_db_aupha.GetEmptyResult
DROP PROCEDURE IF EXISTS `GetEmptyResult`;
DELIMITER //
CREATE PROCEDURE `GetEmptyResult`()
BEGIN
			SELECT 1  AS 'Nothing'
						LIMIT 0;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db_aupha.GetGender
DROP PROCEDURE IF EXISTS `GetGender`;
DELIMITER //
CREATE PROCEDURE `GetGender`()
BEGIN
		SELECT 	GM.GenderMasterID AS 'genderId',
					GM.Gender		AS 'gender'
		FROM gendermaster GM;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db_aupha.GetMaritalStatus
DROP PROCEDURE IF EXISTS `GetMaritalStatus`;
DELIMITER //
CREATE PROCEDURE `GetMaritalStatus`()
BEGIN
			SELECT 	MS.MaritalStatusMasterID   	 AS 'MaritalStatusMasterID',
						MS.MaritalStatus			   	AS 'MaritalStatus'
			FROM maritalstatusmaster MS WHERE MS.IsActive = 1;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db_aupha.GetMaxTems
DROP PROCEDURE IF EXISTS `GetMaxTems`;
DELIMITER //
CREATE PROCEDURE `GetMaxTems`()
BEGIN
		SELECT SCH.MaxTerms	'MaxTerms' 
		FROM school SCH;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db_aupha.GetPositionDetails
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

-- Dumping structure for procedure 3edu_db_aupha.GetPositions
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

-- Dumping structure for procedure 3edu_db_aupha.GetPositonPages
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

-- Dumping structure for procedure 3edu_db_aupha.GetProvinces
DROP PROCEDURE IF EXISTS `GetProvinces`;
DELIMITER //
CREATE PROCEDURE `GetProvinces`()
BEGIN
			SELECT	PV.ProvinceID		AS 'ProvinceID',
						PV.ProvinceName	AS 'ProvinceName'
			FROM province PV;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db_aupha.GetSequence
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

-- Dumping structure for procedure 3edu_db_aupha.GetSessionDetails
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

-- Dumping structure for procedure 3edu_db_aupha.GetSessionDetailsByUserMasterPublicID
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

-- Dumping structure for procedure 3edu_db_aupha.GetStudentNo
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
		 SELECT	CONCAT(YEAR(CURDATE()),"000",NEWLASTINSETEDID) AS SequnceNumber;
				
			
			
    
   
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db_aupha.GetTermDetails
DROP PROCEDURE IF EXISTS `GetTermDetails`;
DELIMITER //
CREATE PROCEDURE `GetTermDetails`()
BEGIN
		SELECT TM.TermMasterID	AS 'TermMasterID',
				 TM.TermName		AS 'TermName' 
		FROM termmaster TM ORDER BY TM.TermMasterID ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_db_aupha.GetTermPages
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

-- Dumping structure for procedure 3edu_db_aupha.GetUserByUsername
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

-- Dumping structure for procedure 3edu_db_aupha.GetUserDetailsByID
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

-- Dumping structure for procedure 3edu_db_aupha.GetUserDetailsByPublicID
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

-- Dumping structure for procedure 3edu_db_aupha.GetUserEmailByID
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

-- Dumping structure for procedure 3edu_db_aupha.SearchActivatedUsers
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

-- Dumping structure for procedure 3edu_db_aupha.SearchUsers
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

-- Dumping structure for procedure 3edu_db_aupha.UpdateEmailSatusCode
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

-- Dumping structure for procedure 3edu_db_aupha.UpdatePasswordByUsername
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

-- Dumping structure for function 3edu_db_aupha.GetSequence
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

-- Dumping structure for function 3edu_db_aupha.GetStudntNo
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
			RETURN CONCAT(YEAR(CURDATE()),"000",NEWLASTINSETEDID) ;
				
			
			
    
   
END//
DELIMITER ;

-- Dumping structure for trigger 3edu_db_aupha.SessionHistory
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

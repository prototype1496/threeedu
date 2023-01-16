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


-- Dumping database structure for 3edu_accounts_db
DROP DATABASE IF EXISTS `3edu_accounts_db`;
CREATE DATABASE IF NOT EXISTS `3edu_accounts_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `3edu_accounts_db`;

-- Dumping structure for table 3edu_accounts_db.feecharges
DROP TABLE IF EXISTS `feecharges`;
CREATE TABLE IF NOT EXISTS `feecharges` (
  `FeeChargesID` int(11) NOT NULL AUTO_INCREMENT,
  `GradeMasterID` int(11) NOT NULL DEFAULT 0,
  `TermID` int(11) NOT NULL DEFAULT 0,
  `TenantMasterID` varchar(500) NOT NULL,
  `Year` year(4) NOT NULL DEFAULT current_timestamp(),
  `Grade` varchar(50) NOT NULL DEFAULT '0',
  `IsCharged` int(11) NOT NULL DEFAULT 1,
  `Amount` double NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `AddedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`GradeMasterID`,`TenantMasterID`,`TermID`,`Year`) USING BTREE,
  UNIQUE KEY `FeeChargesID` (`FeeChargesID`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_accounts_db.feecharges: ~39 rows (approximately)
DELETE FROM `feecharges`;
/*!40000 ALTER TABLE `feecharges` DISABLE KEYS */;
INSERT INTO `feecharges` (`FeeChargesID`, `GradeMasterID`, `TermID`, `TenantMasterID`, `Year`, `Grade`, `IsCharged`, `Amount`, `UpdatedBy`, `UpdatedOn`, `AddedOn`) VALUES
	(124, 1, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2020', '1', 1, 1000, 'acc', '2020-01-16 08:07:20', '2020-01-16 08:07:20'),
	(137, 1, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '1', 1, 1000, 'acc', '2021-01-16 08:12:00', '2021-01-16 08:12:00'),
	(163, 1, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '1', 1, 1000, 'acc', '2022-01-16 08:21:50', '2022-01-16 08:21:50'),
	(176, 1, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2023', '1', 1, 500, 'acc', '2023-01-16 12:13:39', '2023-01-16 12:13:39'),
	(125, 2, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2020', '2', 1, 1000, 'acc', '2020-01-16 08:07:20', '2020-01-16 08:07:20'),
	(138, 2, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '2', 1, 1000, 'acc', '2021-01-16 08:12:00', '2021-01-16 08:12:00'),
	(164, 2, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '2', 1, 1000, 'acc', '2022-01-16 08:21:50', '2022-01-16 08:21:50'),
	(177, 2, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2023', '2', 1, 500, 'acc', '2023-01-16 12:13:39', '2023-01-16 12:13:39'),
	(126, 3, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2020', '3', 1, 1000, 'acc', '2020-01-16 08:07:20', '2020-01-16 08:07:20'),
	(139, 3, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '3', 1, 1000, 'acc', '2021-01-16 08:12:00', '2021-01-16 08:12:00'),
	(165, 3, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '3', 1, 1000, 'acc', '2022-01-16 08:21:50', '2022-01-16 08:21:50'),
	(178, 3, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2023', '3', 1, 500, 'acc', '2023-01-16 12:13:39', '2023-01-16 12:13:39'),
	(127, 4, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2020', '4', 1, 1000, 'acc', '2020-01-16 08:07:20', '2020-01-16 08:07:20'),
	(140, 4, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '4', 1, 1000, 'acc', '2021-01-16 08:12:00', '2021-01-16 08:12:00'),
	(166, 4, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '4', 1, 1000, 'acc', '2022-01-16 08:21:50', '2022-01-16 08:21:50'),
	(179, 4, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2023', '4', 1, 500, 'acc', '2023-01-16 12:13:39', '2023-01-16 12:13:39'),
	(128, 5, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2020', '5', 1, 1000, 'acc', '2020-01-16 08:07:20', '2020-01-16 08:07:20'),
	(141, 5, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '5', 1, 1000, 'acc', '2021-01-16 08:12:00', '2021-01-16 08:12:00'),
	(167, 5, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '5', 1, 1000, 'acc', '2022-01-16 08:21:50', '2022-01-16 08:21:50'),
	(180, 5, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2023', '5', 1, 500, 'acc', '2023-01-16 12:13:39', '2023-01-16 12:13:39'),
	(129, 6, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2020', '6', 1, 1000, 'acc', '2020-01-16 08:07:20', '2020-01-16 08:07:20'),
	(142, 6, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '6', 1, 1000, 'acc', '2021-01-16 08:12:00', '2021-01-16 08:12:00'),
	(168, 6, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '6', 1, 1000, 'acc', '2022-01-16 08:21:50', '2022-01-16 08:21:50'),
	(181, 6, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2023', '6', 1, 500, 'acc', '2023-01-16 12:13:39', '2023-01-16 12:13:39'),
	(130, 7, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2020', '7', 1, 1000, 'acc', '2020-01-16 08:07:20', '2020-01-16 08:07:20'),
	(143, 7, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '7', 1, 1000, 'acc', '2021-01-16 08:12:00', '2021-01-16 08:12:00'),
	(169, 7, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '7', 1, 1000, 'acc', '2022-01-16 08:21:50', '2022-01-16 08:21:50'),
	(182, 7, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2023', '7', 1, 500, 'acc', '2023-01-16 12:13:39', '2023-01-16 12:13:39'),
	(131, 8, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2020', '8', 1, 1000, 'acc', '2020-01-16 08:07:20', '2020-01-16 08:07:20'),
	(144, 8, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '8', 1, 1000, 'acc', '2021-01-16 08:12:00', '2021-01-16 08:12:00'),
	(170, 8, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '8', 1, 1000, 'acc', '2022-01-16 08:21:50', '2022-01-16 08:21:50'),
	(183, 8, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2023', '8', 1, 500, 'acc', '2023-01-16 12:13:39', '2023-01-16 12:13:39'),
	(132, 9, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2020', '9', 1, 1000, 'acc', '2020-01-16 08:07:20', '2020-01-16 08:07:20'),
	(145, 9, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '9', 1, 1000, 'acc', '2021-01-16 08:12:00', '2021-01-16 08:12:00'),
	(171, 9, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '9', 1, 1000, 'acc', '2022-01-16 08:21:50', '2022-01-16 08:21:50'),
	(184, 9, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2023', '9', 1, 500, 'acc', '2023-01-16 12:13:39', '2023-01-16 12:13:39'),
	(133, 10, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2020', '10', 1, 1000, 'acc', '2020-01-16 08:07:20', '2020-01-16 08:07:20'),
	(146, 10, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '10', 1, 1000, 'acc', '2021-01-16 08:12:00', '2021-01-16 08:12:00'),
	(172, 10, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '10', 1, 1000, 'acc', '2022-01-16 08:21:50', '2022-01-16 08:21:50'),
	(185, 10, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2023', '10', 1, 500, 'acc', '2023-01-16 12:13:39', '2023-01-16 12:13:39'),
	(134, 11, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2020', '11', 1, 1000, 'acc', '2020-01-16 08:07:20', '2020-01-16 08:07:20'),
	(147, 11, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '11', 1, 1000, 'acc', '2021-01-16 08:12:00', '2021-01-16 08:12:00'),
	(173, 11, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '11', 1, 1000, 'acc', '2022-01-16 08:21:50', '2022-01-16 08:21:50'),
	(186, 11, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2023', '11', 1, 500, 'acc', '2023-01-16 12:13:39', '2023-01-16 12:13:39'),
	(135, 12, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2020', '12', 1, 1000, 'acc', '2020-01-16 08:07:20', '2020-01-16 08:07:20'),
	(148, 12, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '12', 1, 1000, 'acc', '2021-01-16 08:12:00', '2021-01-16 08:12:00'),
	(174, 12, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '12', 1, 1000, 'acc', '2022-01-16 08:21:50', '2022-01-16 08:21:50'),
	(187, 12, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2023', '12', 1, 500, 'acc', '2023-01-16 12:13:39', '2023-01-16 12:13:39'),
	(136, 13, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2020', 'O Level', 1, 1000, 'acc', '2020-01-16 08:07:20', '2020-01-16 08:07:20'),
	(149, 13, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', 'O Level', 1, 1000, 'acc', '2021-01-16 08:12:00', '2021-01-16 08:12:00'),
	(175, 13, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', 'O Level', 1, 1000, 'acc', '2022-01-16 08:21:50', '2022-01-16 08:21:50'),
	(188, 13, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2023', 'O Level', 1, 500, 'acc', '2023-01-16 12:13:39', '2023-01-16 12:13:39');
/*!40000 ALTER TABLE `feecharges` ENABLE KEYS */;

-- Dumping structure for table 3edu_accounts_db.patmenttypemaster
DROP TABLE IF EXISTS `patmenttypemaster`;
CREATE TABLE IF NOT EXISTS `patmenttypemaster` (
  `PatmentTypeMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentType` varchar(50) NOT NULL DEFAULT '0',
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PatmentTypeMasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_accounts_db.patmenttypemaster: ~2 rows (approximately)
DELETE FROM `patmenttypemaster`;
/*!40000 ALTER TABLE `patmenttypemaster` DISABLE KEYS */;
INSERT INTO `patmenttypemaster` (`PatmentTypeMasterID`, `PaymentType`, `IsActive`) VALUES
	(1, 'On Demad Payment', '1'),
	(2, 'Card', '1');
/*!40000 ALTER TABLE `patmenttypemaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_accounts_db.sequencemaster
DROP TABLE IF EXISTS `sequencemaster`;
CREATE TABLE IF NOT EXISTS `sequencemaster` (
  `SequenceMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `SequnceCode` char(4) NOT NULL,
  `LastInsertedID` int(11) NOT NULL DEFAULT 0,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SequenceMasterID`) USING BTREE,
  UNIQUE KEY `SequnceCode` (`SequnceCode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_accounts_db.sequencemaster: ~18 rows (approximately)
DELETE FROM `sequencemaster`;
/*!40000 ALTER TABLE `sequencemaster` DISABLE KEYS */;
INSERT INTO `sequencemaster` (`SequenceMasterID`, `SequnceCode`, `LastInsertedID`, `UpdatedOn`) VALUES
	(1, 'TECH', 105, '2019-11-01 19:08:09'),
	(2, 'HEAD', 0, '2019-11-01 19:49:01'),
	(3, 'TOKN', 275, '2019-11-01 20:00:03'),
	(4, 'EMIL', 3, '2019-11-15 05:28:12'),
	(5, 'TRPD', 3, '2019-11-17 07:13:19'),
	(6, 'SCHL', 10, '2019-11-17 18:52:58'),
	(7, 'TRD', 2, '2019-11-18 21:59:20'),
	(8, 'STNO', 44, '2021-05-22 19:45:06'),
	(9, 'SDNT', 39, '2021-05-22 20:49:17'),
	(10, 'STDT', 44, '2021-05-22 22:25:57'),
	(18, 'CLAS', 75, '2021-08-16 12:49:49'),
	(19, 'CLDT', 99, '2021-08-16 12:50:17'),
	(20, 'TEDT', 120, '2021-08-21 11:22:16'),
	(21, 'CLRM', 118, '2021-08-22 11:42:24'),
	(22, 'TRID', 62, '2021-09-06 04:44:36'),
	(23, 'BILL', 15, '2021-09-17 16:46:37'),
	(24, 'ACCO', 0, '2021-11-27 16:15:30'),
	(25, 'TRAN', 88, '2021-11-28 02:57:12');
/*!40000 ALTER TABLE `sequencemaster` ENABLE KEYS */;

-- Dumping structure for table 3edu_accounts_db.transactiondetails
DROP TABLE IF EXISTS `transactiondetails`;
CREATE TABLE IF NOT EXISTS `transactiondetails` (
  `TransactionDetailsID` int(11) NOT NULL AUTO_INCREMENT,
  `TransactionMasterPublicID` varchar(50) NOT NULL,
  `ReciptNo` varchar(50) NOT NULL,
  `PaidAmout` double NOT NULL,
  `Balace` double NOT NULL,
  `PaymentType` int(11) NOT NULL DEFAULT 0,
  `PaidBy` varchar(50) NOT NULL,
  `RecivedBy` varchar(50) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `AddedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`TransactionDetailsID`),
  UNIQUE KEY `ReciptNo` (`ReciptNo`),
  KEY `FK_transactiondetails_transactionmaster` (`TransactionMasterPublicID`),
  CONSTRAINT `FK_transactiondetails_transactionmaster` FOREIGN KEY (`TransactionMasterPublicID`) REFERENCES `transactionmaster` (`TransactionMasterPublicID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_accounts_db.transactiondetails: ~6 rows (approximately)
DELETE FROM `transactiondetails`;
/*!40000 ALTER TABLE `transactiondetails` DISABLE KEYS */;
INSERT INTO `transactiondetails` (`TransactionDetailsID`, `TransactionMasterPublicID`, `ReciptNo`, `PaidAmout`, `Balace`, `PaymentType`, `PaidBy`, `RecivedBy`, `UpdatedBy`, `AddedOn`, `UpdatedOn`, `IsActive`) VALUES
	(15, 'TRAN00000000039', 'BILL00000000010', 100, 900, 1, 'SDNT00000000031', 'acc', 'acc', '2020-01-16 08:09:11', '2020-01-16 08:09:11', '1'),
	(16, 'TRAN00000000039', 'BILL00000000011', 100, 800, 1, 'SDNT00000000031', 'acc', 'acc', '2020-01-16 08:09:39', '2020-01-16 08:09:39', '1'),
	(17, 'TRAN00000000039', 'BILL00000000012', 300, 500, 1, 'SDNT00000000031', 'acc', 'acc', '2020-01-16 08:09:55', '2020-01-16 08:09:55', '1'),
	(18, 'TRAN00000000050', 'BILL00000000013', 200, 1300, 1, 'SDNT00000000031', 'acc', 'acc', '2021-01-16 08:14:32', '2021-01-16 08:14:32', '1'),
	(19, 'TRAN00000000050', 'BILL00000000014', 100, 1200, 1, 'SDNT00000000031', 'acc', 'acc', '2021-01-16 08:14:51', '2021-01-16 08:14:51', '1'),
	(20, 'TRAN00000000072', 'BILL00000000015', 500, 1700, 1, 'SDNT00000000031', 'acc', 'acc', '2022-01-16 08:25:29', '2022-01-16 08:25:29', '1');
/*!40000 ALTER TABLE `transactiondetails` ENABLE KEYS */;

-- Dumping structure for table 3edu_accounts_db.transactionmaster
DROP TABLE IF EXISTS `transactionmaster`;
CREATE TABLE IF NOT EXISTS `transactionmaster` (
  `TransactionMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `TransactionMasterPublicID` varchar(50) NOT NULL,
  `StudentMasterPublicID` varchar(50) NOT NULL,
  `TermMasterID` int(11) NOT NULL DEFAULT 0,
  `GradeMasterID` int(11) NOT NULL DEFAULT 0,
  `GradeName` varchar(50) NOT NULL DEFAULT '0',
  `Balance` double NOT NULL DEFAULT 0,
  `BilledAmount` double NOT NULL DEFAULT 0,
  `IsActive` char(50) NOT NULL DEFAULT '1',
  `UpdatedBy` varchar(50) NOT NULL DEFAULT 'System',
  `Year` year(4) NOT NULL DEFAULT year(current_timestamp()),
  `UpdatedOn` varchar(50) NOT NULL DEFAULT current_timestamp(),
  `AddedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `TenantMasterID` varchar(500) NOT NULL,
  PRIMARY KEY (`TransactionMasterID`),
  UNIQUE KEY `TransactionMasterPublicID` (`TransactionMasterPublicID`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_accounts_db.transactionmaster: ~3 rows (approximately)
DELETE FROM `transactionmaster`;
/*!40000 ALTER TABLE `transactionmaster` DISABLE KEYS */;
INSERT INTO `transactionmaster` (`TransactionMasterID`, `TransactionMasterPublicID`, `StudentMasterPublicID`, `TermMasterID`, `GradeMasterID`, `GradeName`, `Balance`, `BilledAmount`, `IsActive`, `UpdatedBy`, `Year`, `UpdatedOn`, `AddedOn`, `TenantMasterID`) VALUES
	(118, 'TRAN00000000039', 'SDNT00000000031', 1, 8, '8', 500, 1000, '1', 'acc', '2020', '2020-01-16 08:07:20', '2020-01-16 08:07:20', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(137, 'TRAN00000000050', 'SDNT00000000031', 1, 8, '8', 1200, 1000, '1', 'acc', '2021', '2021-01-16 08:12:00', '2021-01-16 08:12:00', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(175, 'TRAN00000000072', 'SDNT00000000031', 1, 8, '8', 1700, 1000, '1', 'acc', '2022', '2022-01-16 08:21:50', '2022-01-16 08:21:50', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(189, 'TRAN00000000078', 'SDNT0000000001', 1, 8, '8', 500, 500, '1', 'System', '2023', '2023-01-16 12:13:39', '2023-01-16 12:13:39', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(190, 'TRAN00000000079', 'SDNT0000000005', 1, 8, '8', 500, 500, '1', 'System', '2023', '2023-01-16 12:13:39', '2023-01-16 12:13:39', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(191, 'TRAN00000000080', 'SDNT00000000015', 1, 8, '8', 500, 500, '1', 'System', '2023', '2023-01-16 12:13:39', '2023-01-16 12:13:39', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(192, 'TRAN00000000081', 'SDNT00000000018', 1, 8, '8', 500, 500, '1', 'System', '2023', '2023-01-16 12:13:39', '2023-01-16 12:13:39', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(193, 'TRAN00000000082', 'SDNT00000000030', 1, 8, '8', 500, 500, '1', 'System', '2023', '2023-01-16 12:13:39', '2023-01-16 12:13:39', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(194, 'TRAN00000000083', 'SDNT00000000031', 1, 8, '8', 2200, 500, '1', 'System', '2023', '2023-01-16 12:13:39', '2023-01-16 12:13:39', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(195, 'TRAN00000000084', 'SDNT00000000032', 1, 8, '8', 500, 500, '1', 'System', '2023', '2023-01-16 12:13:39', '2023-01-16 12:13:39', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(196, 'TRAN00000000085', 'SDNT00000000035', 1, 8, '8', 500, 500, '1', 'System', '2023', '2023-01-16 12:13:39', '2023-01-16 12:13:39', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(204, 'TRAN00000000086', 'SDNT00000000029', 1, 9, '9', 500, 500, '1', 'System', '2023', '2023-01-16 12:13:39', '2023-01-16 12:13:39', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(205, 'TRAN00000000087', 'SDNT00000000026', 1, 11, '11', 500, 500, '1', 'System', '2023', '2023-01-16 12:13:39', '2023-01-16 12:13:39', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(206, 'TRAN00000000088', 'SDNT00000000028', 1, 11, '11', 500, 500, '1', 'System', '2023', '2023-01-16 12:13:39', '2023-01-16 12:13:39', '5fe7597e-f7a1-11eb-a81c-1062e5c23529');
/*!40000 ALTER TABLE `transactionmaster` ENABLE KEYS */;

-- Dumping structure for procedure 3edu_accounts_db.CheckIfFessExists
DROP PROCEDURE IF EXISTS `CheckIfFessExists`;
DELIMITER //
CREATE PROCEDURE `CheckIfFessExists`(
	IN `TenantMasterID_` VARCHAR(500),
	IN `TermID_` INT
)
BEGIN
SELECT EXISTS( SELECT * FROM feecharges FCH WHERE FCH.TenantMasterID = TenantMasterID_ AND FCH.TermID = TermID_ AND YEAR(FCH.AddedOn) = YEAR(CURRENT_TIMESTAMP())) AS 'IsExists';
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_accounts_db.GetBillTransactionHistory
DROP PROCEDURE IF EXISTS `GetBillTransactionHistory`;
DELIMITER //
CREATE PROCEDURE `GetBillTransactionHistory`(
	IN `StudentMasterPublicID_` VARCHAR(100)
)
BEGIN
SELECT CONCAT(SM.StudentNo,'-',SM.FirstName,IF(SM.OtherName IS NULL,' ',CONCAT(' ',SM.OtherName,' ')),	SM.LastName )		AS 'Name',
        CONCAT('-',TRD.PaidAmout)	AS 'PaidAmout',
        TRD.Balace,
        PMM.PaymentType,
        TRD.ReciptNo,
        DATE_FORMAT(TRD.AddedOn, "%d %b, %Y")  AS 'BilledOn',
        TRD.UpdatedBy

FROM transactionmaster TM 
JOIN transactiondetails TRD ON TRD.TransactionMasterPublicID = TM.TransactionMasterPublicID
JOIN patmenttypemaster PMM ON PMM.PatmentTypeMasterID = TRD.PaymentType
JOIN 3edu_db.studentmaster SM ON SM.StudentMasterPublicID = TM.StudentMasterPublicID WHERE SM.StudentMasterPublicID = StudentMasterPublicID_ ORDER BY TRD.AddedOn ASC ;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_accounts_db.GetBillTransactionHistroryByTransactionID
DROP PROCEDURE IF EXISTS `GetBillTransactionHistroryByTransactionID`;
DELIMITER //
CREATE PROCEDURE `GetBillTransactionHistroryByTransactionID`(
	IN `TransactionMasterPublicID_` VARCHAR(50)
)
BEGIN
SELECT CONCAT(SM.StudentNo,'-',SM.FirstName,IF(SM.OtherName IS NULL,' ',CONCAT(' ',SM.OtherName,' ')),	SM.LastName )		AS 'Name',
        CONCAT('-',TRD.PaidAmout)	AS 'PaidAmout',
        TRD.Balace,
        PMM.PaymentType,
        TRD.ReciptNo,
        DATE_FORMAT(TRD.AddedOn, "%d %b, %Y")  AS 'BilledOn',
        TRD.UpdatedBy

FROM transactionmaster TM 
JOIN transactiondetails TRD ON TRD.TransactionMasterPublicID = TM.TransactionMasterPublicID
JOIN patmenttypemaster PMM ON PMM.PatmentTypeMasterID = TRD.PaymentType
JOIN 3edu_db.studentmaster SM ON SM.StudentMasterPublicID = TM.StudentMasterPublicID WHERE TM.TransactionMasterPublicID = TransactionMasterPublicID_  ORDER BY TRD.AddedOn ASC ;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_accounts_db.GetBillTransactionMasterDataByStudentID
DROP PROCEDURE IF EXISTS `GetBillTransactionMasterDataByStudentID`;
DELIMITER //
CREATE PROCEDURE `GetBillTransactionMasterDataByStudentID`(
	IN `StudentMasterPublicID_` VARCHAR(200)
)
BEGIN
SELECT TM.TransactionMasterPublicID,
CONCAT('Billed-', TRM.TermName,' (Grade ',TM.GradeName,') K',TM.BilledAmount,', ',DATE_FORMAT(TM.AddedOn, "%d %b, %Y"), ' /',TM.TransactionMasterPublicID ) AS 'BillInfo'
FROM transactionmaster TM 
JOIN 3edu_db.termmaster TRM ON TRM.TermMasterID = TM.TermMasterID
WHERE TM.StudentMasterPublicID = StudentMasterPublicID_;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_accounts_db.GetEmptyReult
DROP PROCEDURE IF EXISTS `GetEmptyReult`;
DELIMITER //
CREATE PROCEDURE `GetEmptyReult`(
	IN `T` VARCHAR(50),
	IN `TEMP` INT
)
BEGIN
	SELECT FCH.FeeChargesID											AS 'FeeChargesID',
				 FCH.GradeMasterID										AS 'GradeMasterID',
				 FCH.Grade													AS 'Grade',
				 FCH.Amount													AS 'Amount',
				 FCH.UpdatedBy												AS 'UpdatedBy',
				 FCH.TenantMasterID										AS 'TenantMasterID',
				 DATE_FORMAT(FCH.UpdatedOn, "%d %b, %Y")			AS 'UpdatedOn',
				 FCH.IsCharged												AS 'IsCharged'
		FROM feecharges FCH LIMIT 0;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_accounts_db.GetFeeChargesByTermAndTenantID
DROP PROCEDURE IF EXISTS `GetFeeChargesByTermAndTenantID`;
DELIMITER //
CREATE PROCEDURE `GetFeeChargesByTermAndTenantID`(
	IN `TenantMasterID_` VARCHAR(500),
	IN `TermID_` INT
)
BEGIN
		SELECT FCH.FeeChargesID											AS 'FeeChargesID',
				 FCH.GradeMasterID										AS 'GradeMasterID',
				 FCH.Grade													AS 'Grade',
				 FCH.Amount													AS 'Amount',
				 FCH.UpdatedBy												AS 'UpdatedBy',
				 FCH.TenantMasterID										AS 'TenantMasterID',
				 DATE_FORMAT(FCH.UpdatedOn, "%d %b, %Y")			AS 'UpdatedOn',
				IF( FCH.IsCharged = 1, 'Yes', 'No')												AS 'IsCharged'
		FROM feecharges FCH WHERE FCH.TenantMasterID = TenantMasterID_ AND FCH.TermID = TermID_;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_accounts_db.GetTotalBalance
DROP PROCEDURE IF EXISTS `GetTotalBalance`;
DELIMITER //
CREATE PROCEDURE `GetTotalBalance`(
	IN `StudentMasterPublicID_` VARCHAR(50)
)
BEGIN
SET @MAXDATE = (SELECT MAX(TM.AddedOn) FROM transactionmaster TM WHERE TM.StudentMasterPublicID = StudentMasterPublicID_);

SET @TOTALBALANCE = (SELECT SUM(TM.Balance) FROM transactionmaster TM WHERE TM.StudentMasterPublicID = StudentMasterPublicID_);

SELECT 
TM.Balance,
TM.TransactionMasterPublicID,
TM.BilledAmount
FROM transactionmaster TM 
 WHERE TM.StudentMasterPublicID = StudentMasterPublicID_  AND DATE(TM.AddedOn) = DATE(@MAXDATE);
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_accounts_db.GetTotalTransactioanalHitory
DROP PROCEDURE IF EXISTS `GetTotalTransactioanalHitory`;
DELIMITER //
CREATE PROCEDURE `GetTotalTransactioanalHitory`(
	IN `TenantID_` VARCHAR(500)
)
BEGIN

SET @TOTALBALACE = (SELECT  SUM(TM.Balance) FROM transactionmaster TM WHERE TM.Year = YEAR(CURDATE()));

SELECT TM.StudentMasterPublicID																															AS 'StudentMasterPublicID', 
       SUM(TM.Balance)																																		AS 'Balace', 
		 SUM(TM.BilledAmount)																																AS 'BilledAmount',
		 CONCAT(SM.StudentNo,'-',SM.FirstName,IF(SM.OtherName IS NULL,' ',CONCAT(' ',SM.OtherName,' ')),	SM.LastName )		AS 'Name',
		 @TOTALBALACE																																			AS 'TOTALBALACE'
FROM transactionmaster TM 
JOIN 3edu_db.studentmaster SM ON SM.StudentMasterPublicID = TM.StudentMasterPublicID
WHERE TM.Year = YEAR(CURDATE()) AND TM.TenantMasterID = TenantID_
GROUP BY TM.StudentMasterPublicID ORDER BY SM.FirstName, SM.LastName ASC;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_accounts_db.GetTotalTransactioanalHitoryByIDDate
DROP PROCEDURE IF EXISTS `GetTotalTransactioanalHitoryByIDDate`;
DELIMITER //
CREATE PROCEDURE `GetTotalTransactioanalHitoryByIDDate`(
	IN `TermMasterID_` INT,
	IN `Year_` YEAR,
	IN `TenantID_` VARCHAR(500)
)
BEGIN
SET @TOTALBALACE = (SELECT  SUM(TM.Balance) FROM transactionmaster TM  WHERE  TM.TermMasterID =TermMasterID_ AND TM.Year = Year_);

SELECT TM.StudentMasterPublicID																															AS 'StudentMasterPublicID', 
       SUM(TM.Balance)																																		AS 'Balace', 
		 SUM(TM.BilledAmount)																																AS 'BilledAmount',
		 CONCAT(SM.StudentNo,'-',SM.FirstName,IF(SM.OtherName IS NULL,' ',CONCAT(' ',SM.OtherName,' ')),	SM.LastName )		AS 'Name',
		 @TOTALBALACE																																			AS 'TOTALBALACE'
FROM transactionmaster TM 
JOIN 3edu_db.studentmaster SM ON SM.StudentMasterPublicID = TM.StudentMasterPublicID WHERE  TM.TermMasterID =TermMasterID_ AND TM.Year = Year_ AND TM.TenantMasterID = TenantID_
GROUP BY TM.StudentMasterPublicID ORDER BY SM.FirstName, SM.LastName ASC;

END//
DELIMITER ;

-- Dumping structure for function 3edu_accounts_db.GetSequence
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

-- Dumping structure for function 3edu_accounts_db.GetTotalBlance
DROP FUNCTION IF EXISTS `GetTotalBlance`;
DELIMITER //
CREATE FUNCTION `GetTotalBlance`(`student_id` VARCHAR(50),
	`amount` VARCHAR(65535 )
) RETURNS varchar(50) CHARSET latin1
    DETERMINISTIC
    COMMENT 'This Function is used to get a sequnce based on the defined sequnces'
BEGIN
   
 			DECLARE balance VARCHAR(65535);
		
		
    
        SELECT IFNULL(SUM(TM.Balance),0)+amount INTO balance 
		  FROM transactionmaster TM 
		  WHERE TM.StudentMasterPublicID = student_id AND TM.Year = YEAR(CURDATE()) - 1; 
        
			
	
			-- return the Sequence
			RETURN balance ;
				
			
			
    
   
END//
DELIMITER ;

-- Dumping structure for trigger 3edu_accounts_db.BilllStudents
DROP TRIGGER IF EXISTS `BilllStudents`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `BilllStudents` AFTER INSERT ON `feecharges` FOR EACH ROW BEGIN
SET @FEECHARGID = (SELECT MAX(FCH.FeeChargesID) FROM feecharges FCH);

SET @GRADEMASTERID = (SELECT FC.GradeMasterID FROM feecharges FC WHERE FC.FeeChargesID = @FEECHARGID);

SET @TERMID = (SELECT FC.TermID FROM feecharges FC WHERE FC.FeeChargesID = @FEECHARGID);

SET @AMOUNT = (SELECT FC.Amount FROM feecharges FC WHERE FC.FeeChargesID = @FEECHARGID);

SET @GRADENAME = (SELECT FC.Grade FROM feecharges FC WHERE FC.FeeChargesID = @FEECHARGID);

SET @TENANTID = (SELECT FC.TenantMasterID FROM feecharges FC WHERE FC.FeeChargesID = @FEECHARGID);

SET @CLASSMASTERID  = (SELECT CM.ClassMasterPublicID FROM 3edu_db.classmaster CM WHERE CM.GradeMasterID = @GRADEMASTERID AND CM.TenantID = @TENANTID LIMIT 1);



INSERT INTO transactionmaster
	(
	TransactionMasterPublicID, 
	StudentMasterPublicID, 
	TermMasterID, 
	GradeMasterID, 
	GradeName, 
	Balance, 
	BilledAmount,
	TenantMasterID
	)
	SELECT
	GetSequence(25),  
	SM.StudentMasterPublicID,
	@TERMID,
	@GRADEMASTERID,
	@GRADENAME,
	GetTotalBlance(StudentMasterPublicID,@AMOUNT),
	@AMOUNT,
	@TENANTID
	FROM 3edu_db.studentmaster SM WHERE SM.ClassMasterPublicID = @CLASSMASTERID AND SM.IsActive = 1 AND SM.IsGraduated = 0 ;
	
	
	
	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger 3edu_accounts_db.UpadateTransactionMasterBalance
DROP TRIGGER IF EXISTS `UpadateTransactionMasterBalance`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `UpadateTransactionMasterBalance` AFTER INSERT ON `transactiondetails` FOR EACH ROW BEGIN
SET @TRANDITID = (SELECT MAX(TD.TransactionDetailsID) FROM transactiondetails TD);
SET @PAIDAMOUNT = (SELECT TSD.PaidAmout FROM transactiondetails TSD WHERE TSD.TransactionDetailsID = @TRANDITID);
SET @UPDATEDBY = (SELECT TSD.UpdatedBy FROM transactiondetails TSD WHERE TSD.TransactionDetailsID = @TRANDITID);
SET @TRANSACTIONMASTERID = (SELECT TSD.TransactionMasterPublicID FROM transactiondetails TSD WHERE TSD.TransactionDetailsID = @TRANDITID);

SET @MASTERBALANCE  = (SELECT TM.Balance FROM transactionmaster TM WHERE TM.TransactionMasterPublicID = @TRANSACTIONMASTERID);

SET @UPDATEBALCE  = @MASTERBALANCE - @PAIDAMOUNT; 


UPDATE transactionmaster SET Balance = @UPDATEBALCE,UpdatedBy = @UPDATEDBY WHERE TransactionMasterPublicID = @TRANSACTIONMASTERID;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

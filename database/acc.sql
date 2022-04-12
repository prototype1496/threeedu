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
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_accounts_db.feecharges: ~39 rows (approximately)
/*!40000 ALTER TABLE `feecharges` DISABLE KEYS */;
INSERT IGNORE INTO `feecharges` (`FeeChargesID`, `GradeMasterID`, `TermID`, `TenantMasterID`, `Year`, `Grade`, `IsCharged`, `Amount`, `UpdatedBy`, `UpdatedOn`, `AddedOn`) VALUES
	(280, 1, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '1', 1, 2000, 'acc', '2021-04-11 17:11:59', '2021-04-11 17:11:59'),
	(306, 1, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '1', 1, 1000, 'acc', '2022-04-11 17:27:07', '2022-04-11 17:27:07'),
	(293, 1, 2, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '1', 1, 3000, 'acc', '2021-04-11 17:19:38', '2021-04-11 17:19:38'),
	(281, 2, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '2', 1, 2000, 'acc', '2021-04-11 17:11:59', '2021-04-11 17:11:59'),
	(307, 2, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '2', 1, 1000, 'acc', '2022-04-11 17:27:07', '2022-04-11 17:27:07'),
	(294, 2, 2, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '2', 1, 3000, 'acc', '2021-04-11 17:19:38', '2021-04-11 17:19:38'),
	(282, 3, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '3', 1, 2000, 'acc', '2021-04-11 17:11:59', '2021-04-11 17:11:59'),
	(308, 3, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '3', 1, 1000, 'acc', '2022-04-11 17:27:07', '2022-04-11 17:27:07'),
	(295, 3, 2, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '3', 1, 3000, 'acc', '2021-04-11 17:19:38', '2021-04-11 17:19:38'),
	(283, 4, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '4', 1, 2000, 'acc', '2021-04-11 17:11:59', '2021-04-11 17:11:59'),
	(309, 4, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '4', 1, 1000, 'acc', '2022-04-11 17:27:07', '2022-04-11 17:27:07'),
	(296, 4, 2, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '4', 1, 3000, 'acc', '2021-04-11 17:19:38', '2021-04-11 17:19:38'),
	(284, 5, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '5', 1, 2000, 'acc', '2021-04-11 17:11:59', '2021-04-11 17:11:59'),
	(310, 5, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '5', 1, 1000, 'acc', '2022-04-11 17:27:07', '2022-04-11 17:27:07'),
	(297, 5, 2, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '5', 1, 3000, 'acc', '2021-04-11 17:19:38', '2021-04-11 17:19:38'),
	(285, 6, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '6', 1, 2000, 'acc', '2021-04-11 17:11:59', '2021-04-11 17:11:59'),
	(311, 6, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '6', 1, 1000, 'acc', '2022-04-11 17:27:07', '2022-04-11 17:27:07'),
	(298, 6, 2, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '6', 1, 3000, 'acc', '2021-04-11 17:19:38', '2021-04-11 17:19:38'),
	(286, 7, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '7', 1, 2000, 'acc', '2021-04-11 17:11:59', '2021-04-11 17:11:59'),
	(312, 7, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '7', 1, 1000, 'acc', '2022-04-11 17:27:07', '2022-04-11 17:27:07'),
	(299, 7, 2, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '7', 1, 3000, 'acc', '2021-04-11 17:19:38', '2021-04-11 17:19:38'),
	(287, 8, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '8', 1, 2000, 'acc', '2021-04-11 17:11:59', '2021-04-11 17:11:59'),
	(313, 8, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '8', 1, 1000, 'acc', '2022-04-11 17:27:07', '2022-04-11 17:27:07'),
	(300, 8, 2, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '8', 1, 3000, 'acc', '2021-04-11 17:19:38', '2021-04-11 17:19:38'),
	(288, 9, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '9', 1, 2000, 'acc', '2021-04-11 17:11:59', '2021-04-11 17:11:59'),
	(314, 9, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '9', 1, 1000, 'acc', '2022-04-11 17:27:07', '2022-04-11 17:27:07'),
	(301, 9, 2, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '9', 1, 3000, 'acc', '2021-04-11 17:19:38', '2021-04-11 17:19:38'),
	(289, 10, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '10', 1, 2000, 'acc', '2021-04-11 17:11:59', '2021-04-11 17:11:59'),
	(315, 10, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '10', 1, 1000, 'acc', '2022-04-11 17:27:07', '2022-04-11 17:27:07'),
	(302, 10, 2, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '10', 1, 3000, 'acc', '2021-04-11 17:19:38', '2021-04-11 17:19:38'),
	(290, 11, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '11', 1, 2000, 'acc', '2021-04-11 17:11:59', '2021-04-11 17:11:59'),
	(316, 11, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '11', 1, 1000, 'acc', '2022-04-11 17:27:07', '2022-04-11 17:27:07'),
	(303, 11, 2, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '11', 1, 3000, 'acc', '2021-04-11 17:19:38', '2021-04-11 17:19:38'),
	(291, 12, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '12', 1, 2000, 'acc', '2021-04-11 17:11:59', '2021-04-11 17:11:59'),
	(317, 12, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', '12', 1, 1000, 'acc', '2022-04-11 17:27:07', '2022-04-11 17:27:07'),
	(304, 12, 2, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', '12', 1, 3000, 'acc', '2021-04-11 17:19:38', '2021-04-11 17:19:38'),
	(292, 13, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', 'O Level', 1, 2000, 'acc', '2021-04-11 17:11:59', '2021-04-11 17:11:59'),
	(318, 13, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2022', 'O Level', 1, 1000, 'acc', '2022-04-11 17:27:07', '2022-04-11 17:27:07'),
	(305, 13, 2, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', '2021', 'O Level', 1, 3000, 'acc', '2021-04-11 17:19:38', '2021-04-11 17:19:38');
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
/*!40000 ALTER TABLE `patmenttypemaster` DISABLE KEYS */;
INSERT IGNORE INTO `patmenttypemaster` (`PatmentTypeMasterID`, `PaymentType`, `IsActive`) VALUES
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
/*!40000 ALTER TABLE `sequencemaster` DISABLE KEYS */;
INSERT IGNORE INTO `sequencemaster` (`SequenceMasterID`, `SequnceCode`, `LastInsertedID`, `UpdatedOn`) VALUES
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
	(23, 'BILL', 22, '2021-09-17 16:46:37'),
	(24, 'ACCO', 0, '2021-11-27 16:15:30'),
	(25, 'TRAN', 222, '2021-11-28 02:57:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_accounts_db.transactiondetails: ~3 rows (approximately)
/*!40000 ALTER TABLE `transactiondetails` DISABLE KEYS */;
INSERT IGNORE INTO `transactiondetails` (`TransactionDetailsID`, `TransactionMasterPublicID`, `ReciptNo`, `PaidAmout`, `Balace`, `PaymentType`, `PaidBy`, `RecivedBy`, `UpdatedBy`, `AddedOn`, `UpdatedOn`, `IsActive`) VALUES
	(28, 'TRAN000000000195', 'BILL00000000020', 200, 1800, 1, 'SDNT00000000031', 'acc', 'acc', '2021-04-11 17:12:31', '2021-04-11 17:12:31', '1'),
	(29, 'TRAN000000000195', 'BILL00000000021', 500, 1300, 1, 'SDNT00000000031', 'acc', 'acc', '2021-04-11 17:16:00', '2021-04-11 17:16:00', '1'),
	(30, 'TRAN000000000217', 'BILL00000000022', 2000, 3300, 1, 'SDNT00000000031', 'acc', 'acc', '2022-04-11 17:29:05', '2022-04-11 17:29:05', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_accounts_db.transactionmaster: ~33 rows (approximately)
/*!40000 ALTER TABLE `transactionmaster` DISABLE KEYS */;
INSERT IGNORE INTO `transactionmaster` (`TransactionMasterID`, `TransactionMasterPublicID`, `StudentMasterPublicID`, `TermMasterID`, `GradeMasterID`, `GradeName`, `Balance`, `BilledAmount`, `IsActive`, `UpdatedBy`, `Year`, `UpdatedOn`, `AddedOn`, `TenantMasterID`) VALUES
	(351, 'TRAN000000000190', 'SDNT0000000001', 1, 8, '8', 2000, 2000, '1', 'System', '2021', '2021-04-11 17:11:59', '2021-04-11 17:11:59', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(352, 'TRAN000000000191', 'SDNT0000000005', 1, 8, '8', 2000, 2000, '1', 'System', '2021', '2021-04-11 17:11:59', '2021-04-11 17:11:59', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(353, 'TRAN000000000192', 'SDNT00000000015', 1, 8, '8', 2000, 2000, '1', 'System', '2021', '2021-04-11 17:11:59', '2021-04-11 17:11:59', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(354, 'TRAN000000000193', 'SDNT00000000018', 1, 8, '8', 2000, 2000, '1', 'System', '2021', '2021-04-11 17:11:59', '2021-04-11 17:11:59', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(355, 'TRAN000000000194', 'SDNT00000000030', 1, 8, '8', 2000, 2000, '1', 'System', '2021', '2021-04-11 17:11:59', '2021-04-11 17:11:59', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(356, 'TRAN000000000195', 'SDNT00000000031', 1, 8, '8', 1300, 2000, '1', 'acc', '2021', '2021-04-11 17:11:59', '2021-04-11 17:11:59', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(357, 'TRAN000000000196', 'SDNT00000000032', 1, 8, '8', 2000, 2000, '1', 'System', '2021', '2021-04-11 17:11:59', '2021-04-11 17:11:59', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(358, 'TRAN000000000197', 'SDNT00000000035', 1, 8, '8', 2000, 2000, '1', 'System', '2021', '2021-04-11 17:11:59', '2021-04-11 17:11:59', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(366, 'TRAN000000000198', 'SDNT00000000029', 1, 9, '9', 2000, 2000, '1', 'System', '2021', '2021-04-11 17:11:59', '2021-04-11 17:11:59', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(367, 'TRAN000000000199', 'SDNT00000000026', 1, 11, '11', 2000, 2000, '1', 'System', '2021', '2021-04-11 17:11:59', '2021-04-11 17:11:59', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(368, 'TRAN000000000200', 'SDNT00000000028', 1, 11, '11', 2000, 2000, '1', 'System', '2021', '2021-04-11 17:11:59', '2021-04-11 17:11:59', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(370, 'TRAN000000000201', 'SDNT0000000001', 2, 8, '8', 5000, 3000, '1', 'System', '2021', '2021-04-11 17:19:38', '2021-04-11 17:19:38', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(371, 'TRAN000000000202', 'SDNT0000000005', 2, 8, '8', 5000, 3000, '1', 'System', '2021', '2021-04-11 17:19:38', '2021-04-11 17:19:38', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(372, 'TRAN000000000203', 'SDNT00000000015', 2, 8, '8', 5000, 3000, '1', 'System', '2021', '2021-04-11 17:19:38', '2021-04-11 17:19:38', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(373, 'TRAN000000000204', 'SDNT00000000018', 2, 8, '8', 5000, 3000, '1', 'System', '2021', '2021-04-11 17:19:38', '2021-04-11 17:19:38', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(374, 'TRAN000000000205', 'SDNT00000000030', 2, 8, '8', 5000, 3000, '1', 'System', '2021', '2021-04-11 17:19:38', '2021-04-11 17:19:38', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(375, 'TRAN000000000206', 'SDNT00000000031', 2, 8, '8', 4300, 3000, '1', 'System', '2021', '2021-04-11 17:19:38', '2021-04-11 17:19:38', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(376, 'TRAN000000000207', 'SDNT00000000032', 2, 8, '8', 5000, 3000, '1', 'System', '2021', '2021-04-11 17:19:38', '2021-04-11 17:19:38', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(377, 'TRAN000000000208', 'SDNT00000000035', 2, 8, '8', 5000, 3000, '1', 'System', '2021', '2021-04-11 17:19:38', '2021-04-11 17:19:38', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(385, 'TRAN000000000209', 'SDNT00000000029', 2, 9, '9', 5000, 3000, '1', 'System', '2021', '2021-04-11 17:19:38', '2021-04-11 17:19:38', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(386, 'TRAN000000000210', 'SDNT00000000026', 2, 11, '11', 5000, 3000, '1', 'System', '2021', '2021-04-11 17:19:38', '2021-04-11 17:19:38', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(387, 'TRAN000000000211', 'SDNT00000000028', 2, 11, '11', 5000, 3000, '1', 'System', '2021', '2021-04-11 17:19:38', '2021-04-11 17:19:38', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(389, 'TRAN000000000212', 'SDNT0000000001', 1, 8, '8', 6000, 1000, '1', 'System', '2022', '2022-04-11 17:27:07', '2022-04-11 17:27:07', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(390, 'TRAN000000000213', 'SDNT0000000005', 1, 8, '8', 6000, 1000, '1', 'System', '2022', '2022-04-11 17:27:07', '2022-04-11 17:27:07', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(391, 'TRAN000000000214', 'SDNT00000000015', 1, 8, '8', 6000, 1000, '1', 'System', '2022', '2022-04-11 17:27:07', '2022-04-11 17:27:07', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(392, 'TRAN000000000215', 'SDNT00000000018', 1, 8, '8', 6000, 1000, '1', 'System', '2022', '2022-04-11 17:27:07', '2022-04-11 17:27:07', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(393, 'TRAN000000000216', 'SDNT00000000030', 1, 8, '8', 6000, 1000, '1', 'System', '2022', '2022-04-11 17:27:07', '2022-04-11 17:27:07', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(394, 'TRAN000000000217', 'SDNT00000000031', 1, 8, '8', 3300, 1000, '1', 'acc', '2022', '2022-04-11 17:27:07', '2022-04-11 17:27:07', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(395, 'TRAN000000000218', 'SDNT00000000032', 1, 8, '8', 6000, 1000, '1', 'System', '2022', '2022-04-11 17:27:07', '2022-04-11 17:27:07', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(396, 'TRAN000000000219', 'SDNT00000000035', 1, 8, '8', 6000, 1000, '1', 'System', '2022', '2022-04-11 17:27:07', '2022-04-11 17:27:07', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(404, 'TRAN000000000220', 'SDNT00000000029', 1, 9, '9', 6000, 1000, '1', 'System', '2022', '2022-04-11 17:27:07', '2022-04-11 17:27:07', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(405, 'TRAN000000000221', 'SDNT00000000026', 1, 11, '11', 6000, 1000, '1', 'System', '2022', '2022-04-11 17:27:07', '2022-04-11 17:27:07', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(406, 'TRAN000000000222', 'SDNT00000000028', 1, 11, '11', 6000, 1000, '1', 'System', '2022', '2022-04-11 17:27:07', '2022-04-11 17:27:07', '5fe7597e-f7a1-11eb-a81c-1062e5c23529');
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
		FROM feecharges FCH WHERE FCH.TenantMasterID = TenantMasterID_ AND FCH.TermID = TermID_ AND FCH.Year = YEAR(CURDATE());
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

SET @TOTALBALACE = (SELECT  SUM(TM.Balance) FROM transactionmaster TM WHERE  TM.TenantMasterID = TenantID_ AND TM.Year = YEAR(CURDATE()));
SET @CURRENTBILLED = (SELECT  SUM(TM.BilledAmount) FROM transactionmaster TM WHERE  TM.TenantMasterID = TenantID_ AND TM.Year = YEAR(CURDATE()));
SELECT TM.StudentMasterPublicID																															AS 'StudentMasterPublicID', 
       SUM(TM.Balance)																																		AS 'Balace', 
		 SUM(TM.BilledAmount)																																AS 'BilledAmount',
		 CONCAT(SM.StudentNo,'-',SM.FirstName,IF(SM.OtherName IS NULL,' ',CONCAT(' ',SM.OtherName,' ')),	SM.LastName )		AS 'Name',
		 @TOTALBALACE																																			AS 'TOTALBALACE',
		  @CURRENTBILLED																																		AS  'CURRENTBILLED'
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
SET @TOTALBALACE = (SELECT  SUM(TM.Balance) FROM transactionmaster TM  WHERE  TM.TermMasterID =TermMasterID_ AND TM.Year = Year_ AND TM.TenantMasterID = TenantID_ );

SET @CURRENTBILLED = (SELECT  SUM(TM.BilledAmount) FROM transactionmaster TM WHERE TM.TermMasterID =TermMasterID_ AND TM.TenantMasterID = TenantID_ AND TM.Year = Year_);
SELECT TM.StudentMasterPublicID																															AS 'StudentMasterPublicID', 
       SUM(TM.Balance)																																		AS 'Balace', 
		 SUM(TM.BilledAmount)																																AS 'BilledAmount',
		 CONCAT(SM.StudentNo,'-',SM.FirstName,IF(SM.OtherName IS NULL,' ',CONCAT(' ',SM.OtherName,' ')),	SM.LastName )		AS 'Name',
		 @TOTALBALACE																																			AS 'TOTALBALACE',
		 @CURRENTBILLED 																																		AS 'CURRENTBILLED'
FROM transactionmaster TM 
JOIN 3edu_db.studentmaster SM ON SM.StudentMasterPublicID = TM.StudentMasterPublicID WHERE  TM.TermMasterID =TermMasterID_ AND TM.Year = Year_ AND TM.TenantMasterID = TenantID_
GROUP BY TM.StudentMasterPublicID ORDER BY SM.FirstName, SM.LastName ASC;

END//
DELIMITER ;

-- Dumping structure for function 3edu_accounts_db.GetPreviousBlance
DROP FUNCTION IF EXISTS `GetPreviousBlance`;
DELIMITER //
CREATE FUNCTION `GetPreviousBlance`(`student_id` VARCHAR(50),
	`amount` VARCHAR(65535 )
) RETURNS varchar(50) CHARSET latin1
    DETERMINISTIC
    COMMENT 'This Function is used to get a sequnce based on the defined sequnces'
BEGIN
   
 			DECLARE balance VARCHAR(65535);
		

		
	SELECT IFNULL((SELECT TM.Balance FROM transactionmaster TM  WHERE TM.StudentMasterPublicID = student_id ORDER BY TM.AddedOn DESC LIMIT 1)+amount, (SELECT amount)) INTO balance;
			-- return the Sequence
			RETURN balance ;
				
			
			
    
   
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
	GetPreviousBlance(StudentMasterPublicID,@AMOUNT),
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

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
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
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_accounts_db.feecharges: ~8 rows (approximately)
INSERT IGNORE INTO `feecharges` (`FeeChargesID`, `GradeMasterID`, `TermID`, `TenantMasterID`, `Year`, `Grade`, `IsCharged`, `Amount`, `UpdatedBy`, `UpdatedOn`, `AddedOn`) VALUES
	(323, 23, 9, 'Thr6255f612d73866.53144529', '2022', '1', 1, 5000, 'Accounts', '2022-04-13 01:44:36', '2022-04-13 01:44:36'),
	(325, 23, 10, 'Thr6255f612d73866.53144529', '2022', '1', 1, 5000, 'Accounts', '2022-04-13 01:49:39', '2022-04-13 01:49:39'),
	(327, 23, 11, 'Thr6255f612d73866.53144529', '2022', '1', 1, 1000, 'Accounts', '2022-04-13 02:54:01', '2022-04-13 02:54:01'),
	(324, 24, 9, 'Thr6255f612d73866.53144529', '2022', '2', 1, 5000, 'Accounts', '2022-04-13 01:44:36', '2022-04-13 01:44:36'),
	(326, 24, 10, 'Thr6255f612d73866.53144529', '2022', '2', 1, 5000, 'Accounts', '2022-04-13 01:49:40', '2022-04-13 01:49:40'),
	(328, 24, 11, 'Thr6255f612d73866.53144529', '2022', '2', 1, 1000, 'Accounts', '2022-04-13 02:54:01', '2022-04-13 02:54:01'),
	(333, 25, 12, 'Ali62763c730ca728.22561562', '2022', 'Grade 1', 1, 8000, 'accc', '2022-05-07 16:50:50', '2022-05-07 16:50:50'),
	(335, 25, 13, 'Ali62763c730ca728.22561562', '2022', 'Grade 1', 1, 4000, 'accc', '2022-05-07 16:57:12', '2022-05-07 16:57:12'),
	(334, 26, 12, 'Ali62763c730ca728.22561562', '2022', 'Grade 2', 1, 11000, 'accc', '2022-05-07 16:50:50', '2022-05-07 16:50:50'),
	(336, 26, 13, 'Ali62763c730ca728.22561562', '2022', 'Grade 2', 1, 4000, 'accc', '2022-05-07 16:57:12', '2022-05-07 16:57:12');

-- Dumping structure for table 3edu_accounts_db.patmenttypemaster
DROP TABLE IF EXISTS `patmenttypemaster`;
CREATE TABLE IF NOT EXISTS `patmenttypemaster` (
  `PatmentTypeMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentType` varchar(50) NOT NULL DEFAULT '0',
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PatmentTypeMasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_accounts_db.patmenttypemaster: ~2 rows (approximately)
INSERT IGNORE INTO `patmenttypemaster` (`PatmentTypeMasterID`, `PaymentType`, `IsActive`) VALUES
	(1, 'On Demad Payment', '1'),
	(2, 'Card', '1');

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
	(23, 'BILL', 33, '2021-09-17 16:46:37'),
	(24, 'ACCO', 0, '2021-11-27 16:15:30'),
	(25, 'TRAN', 252, '2021-11-28 02:57:12');

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_accounts_db.transactiondetails: ~6 rows (approximately)
INSERT IGNORE INTO `transactiondetails` (`TransactionDetailsID`, `TransactionMasterPublicID`, `ReciptNo`, `PaidAmout`, `Balace`, `PaymentType`, `PaidBy`, `RecivedBy`, `UpdatedBy`, `AddedOn`, `UpdatedOn`, `IsActive`) VALUES
	(34, 'TRAN000000000233', 'BILL00000000026', 1000, 4000, 1, 'SDNT00000000043', 'Accounts', 'Accounts', '2022-04-13 01:45:53', '2022-04-13 01:45:53', '1'),
	(35, 'TRAN000000000232', 'BILL00000000027', 1000, 4000, 1, 'SDNT00000000042', 'Accounts', 'Accounts', '2022-04-13 01:46:27', '2022-04-13 01:46:27', '1'),
	(36, 'TRAN000000000237', 'BILL00000000028', 1000, 8000, 1, 'SDNT00000000043', 'Accounts', 'Accounts', '2022-04-13 02:11:32', '2022-04-13 02:11:32', '1'),
	(37, 'TRAN000000000241', 'BILL00000000029', 1500.45, 7499.55, 1, 'SDNT00000000043', 'Accounts', 'Accounts', '2022-04-13 02:56:11', '2022-04-13 02:56:11', '1'),
	(38, 'TRAN000000000241', 'BILL00000000030', 500, 6999.55, 1, 'SDNT00000000043', 'Accounts', 'Accounts', '2022-04-13 02:59:15', '2022-04-13 02:59:15', '1'),
	(39, 'TRAN000000000241', 'BILL00000000031', -500, 7499.55, 1, 'SDNT00000000043', 'Accounts', 'Accounts', '2022-04-13 03:00:52', '2022-04-13 03:00:52', '1'),
	(40, 'TRAN000000000249', 'BILL00000000032', 12000, -1000, 1, 'SDNT00000000047', 'accc', 'accc', '2022-05-07 16:55:59', '2022-05-07 16:55:59', '1'),
	(41, 'TRAN000000000252', 'BILL00000000033', 1000, 2000, 1, 'SDNT00000000047', 'accc', 'accc', '2022-05-07 16:58:00', '2022-05-07 16:58:00', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_accounts_db.transactionmaster: ~14 rows (approximately)
INSERT IGNORE INTO `transactionmaster` (`TransactionMasterID`, `TransactionMasterPublicID`, `StudentMasterPublicID`, `TermMasterID`, `GradeMasterID`, `GradeName`, `Balance`, `BilledAmount`, `IsActive`, `UpdatedBy`, `Year`, `UpdatedOn`, `AddedOn`, `TenantMasterID`) VALUES
	(418, 'TRAN000000000230', 'SDNT00000000040', 9, 23, '1', 5000, 5000, '1', 'System', '2021', '2022-04-13 01:44:36', '2022-04-13 01:44:36', 'Thr6255f612d73866.53144529'),
	(419, 'TRAN000000000231', 'SDNT00000000041', 9, 23, '1', 5000, 5000, '1', 'System', '2022', '2022-04-13 01:44:36', '2022-04-13 01:44:36', 'Thr6255f612d73866.53144529'),
	(420, 'TRAN000000000232', 'SDNT00000000042', 9, 23, '1', 4000, 5000, '1', 'Accounts', '2022', '2022-04-13 01:44:36', '2022-04-13 01:44:36', 'Thr6255f612d73866.53144529'),
	(421, 'TRAN000000000233', 'SDNT00000000043', 9, 23, '1', 4000, 5000, '1', 'Accounts', '2022', '2022-04-13 01:44:36', '2022-04-13 01:44:36', 'Thr6255f612d73866.53144529'),
	(425, 'TRAN000000000234', 'SDNT00000000040', 10, 23, '1', 10000, 5000, '1', 'System', '2022', '2022-04-13 01:49:39', '2022-04-13 01:49:39', 'Thr6255f612d73866.53144529'),
	(426, 'TRAN000000000235', 'SDNT00000000041', 10, 23, '1', 10000, 5000, '1', 'System', '2022', '2022-04-13 01:49:39', '2022-04-13 01:49:39', 'Thr6255f612d73866.53144529'),
	(427, 'TRAN000000000236', 'SDNT00000000042', 10, 23, '1', 9000, 5000, '1', 'System', '2022', '2022-04-13 01:49:39', '2022-04-13 01:49:39', 'Thr6255f612d73866.53144529'),
	(428, 'TRAN000000000237', 'SDNT00000000043', 10, 23, '1', 8000, 5000, '1', 'Accounts', '2022', '2022-04-13 01:49:39', '2022-04-13 01:49:39', 'Thr6255f612d73866.53144529'),
	(432, 'TRAN000000000238', 'SDNT00000000040', 11, 23, '1', 11000, 1000, '1', 'System', '2022', '2022-04-13 02:54:01', '2022-04-13 02:54:01', 'Thr6255f612d73866.53144529'),
	(433, 'TRAN000000000239', 'SDNT00000000041', 11, 23, '1', 11000, 1000, '1', 'System', '2022', '2022-04-13 02:54:01', '2022-04-13 02:54:01', 'Thr6255f612d73866.53144529'),
	(434, 'TRAN000000000240', 'SDNT00000000042', 11, 23, '1', 10000, 1000, '1', 'System', '2022', '2022-04-13 02:54:01', '2022-04-13 02:54:01', 'Thr6255f612d73866.53144529'),
	(435, 'TRAN000000000241', 'SDNT00000000043', 11, 23, '1', 7499.55, 1000, '1', 'Accounts', '2022', '2022-04-13 02:54:01', '2022-04-13 02:54:01', 'Thr6255f612d73866.53144529'),
	(442, 'TRAN000000000247', 'SDNT00000000045', 12, 25, 'Grade 1', 8000, 8000, '1', 'System', '2022', '2022-05-07 16:50:50', '2022-05-07 16:50:50', 'Ali62763c730ca728.22561562'),
	(443, 'TRAN000000000248', 'SDNT00000000046', 12, 26, 'Grade 2', 11000, 11000, '1', 'System', '2022', '2022-05-07 16:50:50', '2022-05-07 16:50:50', 'Ali62763c730ca728.22561562'),
	(444, 'TRAN000000000249', 'SDNT00000000047', 12, 26, 'Grade 2', -1000, 11000, '1', 'accc', '2022', '2022-05-07 16:50:50', '2022-05-07 16:50:50', 'Ali62763c730ca728.22561562'),
	(446, 'TRAN000000000250', 'SDNT00000000045', 13, 25, 'Grade 1', 12000, 4000, '1', 'System', '2022', '2022-05-07 16:57:12', '2022-05-07 16:57:12', 'Ali62763c730ca728.22561562'),
	(447, 'TRAN000000000251', 'SDNT00000000046', 13, 26, 'Grade 2', 15000, 4000, '1', 'System', '2022', '2022-05-07 16:57:12', '2022-05-07 16:57:12', 'Ali62763c730ca728.22561562'),
	(448, 'TRAN000000000252', 'SDNT00000000047', 13, 26, 'Grade 2', 2000, 4000, '1', 'accc', '2022', '2022-05-07 16:57:12', '2022-05-07 16:57:12', 'Ali62763c730ca728.22561562');

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
 WHERE TM.StudentMasterPublicID = StudentMasterPublicID_  ORDER BY  TM.AddedOn DESC LIMIT 1;
END//
DELIMITER ;

-- Dumping structure for procedure 3edu_accounts_db.GetTotalTransactioanalHitory
DROP PROCEDURE IF EXISTS `GetTotalTransactioanalHitory`;
DELIMITER //
CREATE PROCEDURE `GetTotalTransactioanalHitory`(
	IN `TenantID_` VARCHAR(500)
)
BEGIN

SET @TOTALBALACE = (SELECT  SUM(TM.Balance) FROM transactionmaster TM WHERE  TM.TenantMasterID = TenantID_  AND TM.TermMasterID = (SELECT TRM.TermMasterID FROM 3edu_db.termmaster  TRM WHERE TRM.TenantID = TenantID_ AND TRM.IsSysActive = 1 AND TRM.IsActive = 1 ) );

SET @CURRENTBILLED = (SELECT  SUM(TM.BilledAmount) FROM transactionmaster TM WHERE  TM.TenantMasterID = TenantID_ );
SELECT TM.StudentMasterPublicID																															AS 'StudentMasterPublicID', 
        TM.Balance																							    											AS 'Balace', 
		 GetTotalStudentBlance(TM.StudentMasterPublicID,TenantID_)										      								AS 'BilledAmount',
		 CONCAT(SM.StudentNo,'-',SM.FirstName,IF(SM.OtherName IS NULL,' ',CONCAT(' ',SM.OtherName,' ')),	SM.LastName )		AS 'Name',
		 @TOTALBALACE																																			AS 'TOTALBALACE',
		  @CURRENTBILLED																																		AS  'CURRENTBILLED'
FROM transactionmaster TM 
JOIN 3edu_db.studentmaster SM ON SM.StudentMasterPublicID = TM.StudentMasterPublicID
WHERE TM.Year = YEAR(CURDATE()) AND TM.TenantMasterID = TenantID_ AND TM.TermMasterID = (SELECT TRM.TermMasterID FROM 3edu_db.termmaster  TRM WHERE TRM.TenantID = TenantID_ AND TRM.IsSysActive = 1 AND TRM.IsActive = 1 )
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

-- Dumping structure for function 3edu_accounts_db.GetTotalStudentBlance
DROP FUNCTION IF EXISTS `GetTotalStudentBlance`;
DELIMITER //
CREATE FUNCTION `GetTotalStudentBlance`(`student_master_public_id` VARCHAR(300),
	`tenant_id` VARCHAR(300)
) RETURNS varchar(50) CHARSET latin1
    DETERMINISTIC
    COMMENT 'This Function is used to get a sequnce based on the defined sequnces'
BEGIN
   
 			DECLARE balance VARCHAR(65535);
		

			
			(SELECT  SUM(TM.BilledAmount) FROM transactionmaster TM WHERE  TM.TenantMasterID = tenant_id AND TM.StudentMasterPublicID =student_master_public_id ) INTO balance;
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
	FROM 3edu_db.studentmaster SM WHERE SM.ClassMasterPublicID in (SELECT CM.ClassMasterPublicID FROM 3edu_db.classmaster CM WHERE CM.GradeMasterID = @GRADEMASTERID AND CM.TenantID = @TENANTID) AND SM.IsActive = 1 AND SM.IsGraduated = 0 ;
	
	
	
	
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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

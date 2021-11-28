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
  `Grade` varchar(50) NOT NULL DEFAULT '0',
  `Amount` double NOT NULL,
  `TermID` int(11) NOT NULL DEFAULT 0,
  `TenantMasterID` varchar(500) NOT NULL,
  `IsCharged` int(11) NOT NULL DEFAULT 1,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `AddedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`GradeMasterID`,`TenantMasterID`,`TermID`) USING BTREE,
  UNIQUE KEY `FeeChargesID` (`FeeChargesID`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_accounts_db.feecharges: ~22 rows (approximately)
DELETE FROM `feecharges`;
/*!40000 ALTER TABLE `feecharges` DISABLE KEYS */;
INSERT INTO `feecharges` (`FeeChargesID`, `GradeMasterID`, `Grade`, `Amount`, `TermID`, `TenantMasterID`, `IsCharged`, `UpdatedBy`, `UpdatedOn`, `AddedOn`) VALUES
	(68, 1, '1', 0, 3, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'acc', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(1, 2, '2', 200, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'systest', '2021-11-27 18:00:31', '2021-11-27 17:35:20'),
	(69, 2, '2', 0, 3, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'acc', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(8, 3, '3', 400, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'systest', '2021-11-27 18:00:31', '2021-11-27 17:38:14'),
	(70, 3, '3', 0, 3, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'acc', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(11, 4, '4', 400, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'systest', '2021-11-27 18:00:31', '2021-11-27 17:38:14'),
	(71, 4, '4', 0, 3, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'acc', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(14, 5, '5', 400, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'systest', '2021-11-27 18:00:31', '2021-11-27 17:38:14'),
	(72, 5, '5', 0, 3, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'acc', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(73, 6, '6', 0, 3, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'acc', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(17, 7, '7', 400, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'systest', '2021-11-27 18:00:31', '2021-11-27 17:38:14'),
	(74, 7, '7', 0, 3, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'acc', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(33, 8, '8', 400, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'systest', '2021-11-28 03:45:04', '2021-11-27 17:38:14'),
	(75, 8, '8', 800, 3, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'acc', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(23, 9, '9', 400, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'systest', '2021-11-27 18:00:31', '2021-11-27 17:38:14'),
	(76, 9, '9', 0, 3, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'acc', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(24, 10, '10', 400, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'systest', '2021-11-28 03:44:55', '2021-11-27 17:38:14'),
	(77, 10, '10', 800, 3, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'acc', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(29, 11, '11', 400, 1, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'systest', '2021-11-27 18:00:31', '2021-11-27 17:38:14'),
	(78, 11, '11', 800, 3, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'acc', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(79, 12, '12', 800, 3, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'acc', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(80, 13, 'O Level', 800, 3, '5fe7597e-f7a1-11eb-a81c-1062e5c23529', 1, 'acc', '2021-11-28 04:10:11', '2021-11-28 04:10:11');
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
	(1, 'On Demad Posting ', '1'),
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
	(23, 'BILL', 0, '2021-09-17 16:46:37'),
	(24, 'ACCO', 0, '2021-11-27 16:15:30'),
	(25, 'TRAN', 0, '2021-11-28 02:57:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_accounts_db.transactiondetails: ~2 rows (approximately)
DELETE FROM `transactiondetails`;
/*!40000 ALTER TABLE `transactiondetails` DISABLE KEYS */;
INSERT INTO `transactiondetails` (`TransactionDetailsID`, `TransactionMasterPublicID`, `ReciptNo`, `PaidAmout`, `Balace`, `PaymentType`, `PaidBy`, `RecivedBy`, `UpdatedBy`, `AddedOn`, `UpdatedOn`, `IsActive`) VALUES
	(1, 'ITAD00000000057', 'LSK-00001', 100, 700, 1, 'student', 'sys', 'sys', '2021-11-27 15:41:36', '2021-11-28 06:58:14', '1'),
	(2, 'ITAD00000000057', 'LSK-00002', 200, 500, 1, 'studen', 'sys', 'sys', '2021-11-27 15:43:09', '2021-11-28 06:58:09', '1');
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
  PRIMARY KEY (`TransactionMasterID`),
  UNIQUE KEY `TransactionMasterPublicID` (`TransactionMasterPublicID`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

-- Dumping data for table 3edu_accounts_db.transactionmaster: ~15 rows (approximately)
DELETE FROM `transactionmaster`;
/*!40000 ALTER TABLE `transactionmaster` DISABLE KEYS */;
INSERT INTO `transactionmaster` (`TransactionMasterID`, `TransactionMasterPublicID`, `StudentMasterPublicID`, `TermMasterID`, `GradeMasterID`, `GradeName`, `Balance`, `BilledAmount`, `IsActive`, `UpdatedBy`, `Year`, `UpdatedOn`, `AddedOn`) VALUES
	(1, 'ghgh', '2201112', 1, 1, 'Grade 1', 4700, 5000, '1', 'sys', '2021', '2021-11-27 15:27:17', '2021-11-27 15:27:17'),
	(2, 'sdsd', '2201112', 2, 1, 'Grade 1', 2000, 2000, '1', 'ysy', '2021', '2021-11-27 15:28:30', '2021-11-27 15:28:29'),
	(3, 'sdsd55', '2201112', 3, 1, 'Grade 1', 1000, 1000, '1', 'sys', '2021', '2021-11-27 15:28:56', '2021-11-27 15:28:55'),
	(4, 'dsfsvgfd', '2201112', 1, 2, 'Grade 2', 1000, 1000, '1', 'sys', '2021', '2021-11-27 15:29:32', '2021-11-27 15:29:30'),
	(39, 'ITAD00000000052', 'SDNT0000000001', 3, 8, '8', 800, 800, '1', 'System', '2021', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(40, 'ITAD00000000053', 'SDNT000000000031', 3, 8, '8', 800, 800, '1', 'System', '2021', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(41, 'ITAD00000000054', 'SDNT00000000015', 3, 8, '8', 800, 800, '1', 'System', '2021', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(42, 'ITAD00000000055', 'SDNT00000000018', 3, 8, '8', 800, 800, '1', 'System', '2021', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(43, 'ITAD00000000056', 'SDNT00000000030', 3, 8, '8', 800, 800, '1', 'System', '2021', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(44, 'ITAD00000000057', 'SDNT00000000031', 3, 8, '8', 500, 800, '1', 'System', '2021', '2021-11-28 04:10:11', '2021-11-28 05:10:11'),
	(45, 'ITAD00000000058', 'SDNT00000000032', 3, 8, '8', 800, 800, '1', 'System', '2021', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(46, 'ITAD00000000059', 'SDNT00000000035', 3, 8, '8', 800, 800, '1', 'System', '2021', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(54, 'ITAD00000000060', 'SDNT00000000029', 3, 9, '9', 0, 0, '1', 'System', '2021', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(55, 'ITAD00000000061', 'SDNT00000000026', 3, 11, '11', 800, 800, '1', 'System', '2021', '2021-11-28 04:10:11', '2021-11-28 04:10:11'),
	(56, 'ITAD00000000062', 'SDNT00000000028', 3, 11, '11', 800, 800, '1', 'System', '2021', '2021-11-28 04:10:11', '2021-11-28 04:10:11');
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
SELECT 
TM.Balance,
TM.TransactionMasterPublicID
FROM transactionmaster TM 
 WHERE TM.StudentMasterPublicID = StudentMasterPublicID_  AND DATE(TM.AddedOn) = DATE(@MAXDATE);
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
	BilledAmount
	)
	SELECT
	GetSequence(25),  
	SM.StudentMasterPublicID,
	@TERMID,
	@GRADEMASTERID,
	@GRADENAME,
	@AMOUNT,
	@AMOUNT
	FROM 3edu_db.studentmaster SM WHERE SM.ClassMasterPublicID = @CLASSMASTERID AND SM.IsActive = 1 AND SM.IsGraduated = 0 ;
	
	
	
	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

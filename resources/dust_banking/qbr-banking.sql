CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `accountid` int(11) DEFAULT NULL,
  `balance` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Savings','Business') NOT NULL DEFAULT 'Savings',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  UNIQUE KEY `accountid` (`accountid`),
  KEY `job` (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `accountid` int(11) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `job` (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

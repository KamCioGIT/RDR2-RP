CREATE TABLE IF NOT EXISTS `diseases` (
  `charid` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `diseases` longtext DEFAULT '{}',
  PRIMARY KEY (`charid`),
  CONSTRAINT `citizenid` FOREIGN KEY (`charid`) REFERENCES `characters` (`citizenid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `hospital` (
  `hospital` varchar(50) NOT NULL,
  PRIMARY KEY (`hospital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `hospital` (`hospital`) VALUES
	('Saint Denis Hospital');

CREATE TABLE IF NOT EXISTS `hospital_notes` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital` varchar(50) NOT NULL DEFAULT '',
  `written_by` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT 0,
  `note` longtext NOT NULL,
  `patient` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`note_id`) USING BTREE,
  KEY `hospital` (`hospital`),
  CONSTRAINT `hospital` FOREIGN KEY (`hospital`) REFERENCES `hospital` (`hospital`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
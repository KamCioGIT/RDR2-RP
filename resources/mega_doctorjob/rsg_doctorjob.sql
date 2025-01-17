CREATE TABLE `diseases` (
    `charid` int(11) DEFAULT 0,
    `diseases` longtext DEFAULT '{}',
    PRIMARY KEY (`charid`) USING BTREE,
    CONSTRAINT `characterid_fk` FOREIGN KEY (`charid`) REFERENCES `characters` (`characterid`) ON UPDATE NO ACTION ON DELETE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `hospital` (
    `hospital` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
    PRIMARY KEY (`hospital`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `hospital_notes` (
    `note_id` INT(11) NOT NULL AUTO_INCREMENT,
    `hospital` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
    `written_by` VARCHAR(255) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
    `date` BIGINT(20) NOT NULL DEFAULT '0',
    `note` LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
    `patient` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    PRIMARY KEY (`note_id`) USING BTREE,
    INDEX `hospital` (`hospital`) USING BTREE,
    CONSTRAINT `hospital` FOREIGN KEY (`hospital`) REFERENCES `hospital` (`hospital`) ON UPDATE NO ACTION ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
CREATE TABLE IF NOT EXISTS `telegrams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) NOT NULL DEFAULT '0',
  `recipient` varchar(50) NOT NULL,
  `message` longtext NOT NULL,
  `date` datetime NULL,
  `selected` int(11) NOT NULL DEFAULT 0,
  `post` varchar(50) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb4;

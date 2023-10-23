CREATE TABLE IF NOT EXISTS `cattle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cowid` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `milk` int(11) NOT NULL DEFAULT 0,
  `date` datetime NULL,
  `selected` int(11) NOT NULL DEFAULT 0,
  `stable` varchar(50) NULL,
  `model` varchar(50) NULL,
  `race` varchar(50) NULL,
  `name` varchar(50) NULL,
  `job` varchar(50) NOT NULL DEFAULT 'x',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

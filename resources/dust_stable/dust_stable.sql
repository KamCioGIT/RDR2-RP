CREATE TABLE IF NOT EXISTS `stable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `horseid` int(11) NOT NULL,
  `identifier` varchar(40) NOT NULL,
  `charid` int(11) NOT NULL,
  `selected` int(11) NOT NULL DEFAULT 0,
  `stable` varchar(50) NULL,
  `model` varchar(50) NULL,
  `race` varchar(50) NULL,
  `name` varchar(50) NULL,
  `components`  varchar(5000) NOT NULL DEFAULT '{}',
  `meta`  varchar(5000) NOT NULL DEFAULT '{}',
  `job` varchar(50) NOT NULL DEFAULT 'x',
  `jobgrade` int(11) NOT NULL DEFAULT 0,
  `gang` varchar(50) NOT NULL DEFAULT 'x',
  `ganggrade` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

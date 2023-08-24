SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE IF NOT EXISTS `stable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `horseid` int(11) NOT NULL,
  `identifier` varchar(40) NOT NULL,
  `charid` int(11) NOT NULL,
  `selected` int(11) NOT NULL DEFAULT 0,
  `stable` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `components`  varchar(5000) NOT NULL DEFAULT '{}',
  `job` varchar(50) NOT NULL,
  `jobgrade` int(11) NOT NULL,
  `gang` varchar(50) NOT NULL,
  `gangrade` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_horses_characters` (`charid`)
);

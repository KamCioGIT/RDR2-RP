CREATE TABLE `vault` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `charid` int(11) DEFAULT 0,
  `coords` varchar(200) COLLATE utf8mb4_bin DEFAULT '{}',
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

ALTER TABLE `vault`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `vault`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
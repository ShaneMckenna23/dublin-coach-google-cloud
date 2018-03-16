CREATE TABLE `dublin_coach_db`.`users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
)

CREATE TABLE `dublin_coach_db`.`stops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `lat` decimal(10,8) DEFAULT NULL,
  `long` decimal(11,8) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
)

CREATE TABLE `dublin_coach_db`.`routes` (
  `id` int PRIMARY KEY,
  `name` varchar(200),
  `route_detail_id` int,
  `schedule_id` int,
  FOREIGN KEY (`route_detail_id`) REFERENCES route_details (id),
  FOREIGN KEY (`schedule_id`) REFERENCES schedules (id)
);

CREATE TABLE `dublin_coach_db`.`route_details` (
  `id` int,
  `stop_number` int, -- starting from 1
  `stop_id` int,
  `leg_minutes` int, -- minutes from the previous stop to this one (0 for stop_number=1)
  FOREIGN KEY (stop_id) REFERENCES stops (id),
  PRIMARY KEY (id, stop_number)
);

CREATE TABLE `dublin_coach_db`.`schedules`( 
  `id` int PRIMARY KEY,
  `start_time` varchar(8), -- hh:mm:ss
  `end_time` varchar(8),
  `frequency` varchar(8)
);


-- Query which route goes from B to E
SELECT r.*
FROM routes r
JOIN route_details rs ON (rs.route_id = r.route_id)
JOIN stops ss ON (ss.stop_id = rs.stop_id)
JOIN route_details re ON (re.route_id = r.route_id)
JOIN stops se ON (se.stop_id = re.stop_id)
WHERE ss.name = 'B' AND se.name = 'E' AND rs.stop_number < re.stop_number;
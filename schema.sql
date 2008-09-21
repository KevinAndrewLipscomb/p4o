-- phpMyAdmin SQL Dump
-- version 2.6.4-pl4
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Sep 21, 2008 at 12:17 PM
-- Server version: 5.0.20
-- PHP Version: 4.4.7

SET FOREIGN_KEY_CHECKS=0;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- 
-- Database: `p4odb_x`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `bureau`
-- 

DROP TABLE IF EXISTS `bureau`;
CREATE TABLE IF NOT EXISTS `bureau` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `description` varchar(63) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `bureau`
-- 

INSERT INTO `bureau` VALUES (1, 'Operations Support');
INSERT INTO `bureau` VALUES (2, 'Planning & Analysis');
INSERT INTO `bureau` VALUES (3, 'Administration & Support');
INSERT INTO `bureau` VALUES (4, 'Field Operations');

-- --------------------------------------------------------

-- 
-- Table structure for table `division`
-- 

DROP TABLE IF EXISTS `division`;
CREATE TABLE IF NOT EXISTS `division` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `description` varchar(63) NOT NULL,
  `bureau_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `bureau_id` (`bureau_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `division`
-- 

INSERT INTO `division` VALUES (1, 'Special Operations', 1);
INSERT INTO `division` VALUES (2, 'Investigations', 1);
INSERT INTO `division` VALUES (3, 'Community Services & Support', 4);
INSERT INTO `division` VALUES (4, 'Patrol Operations', 4);
INSERT INTO `division` VALUES (5, '(Administration and Support)', 3);
INSERT INTO `division` VALUES (6, '(Planning & Analysis)', 2);

-- --------------------------------------------------------

-- 
-- Table structure for table `journal`
-- 

DROP TABLE IF EXISTS `journal`;
CREATE TABLE IF NOT EXISTS `journal` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `actor` varchar(31) NOT NULL,
  `action` varchar(2047) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `actor` (`actor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `journal`
-- 

INSERT INTO `journal` VALUES (1, '2008-09-21 11:47:22', '', 'insert into user set username = "appadmin" , encoded_password = "11bb645ed1010af811f98e3fc9bdb49e8dab24ae" , be_stale_password = FALSE , password_reset_email_address = "p4o@frompaper2web.com" , last_login = NOW()');
INSERT INTO `journal` VALUES (2, '2008-09-21 12:02:03', 'appadmin', 'insert member set registration_code = NULLIF("1","") ,  last_name = NULLIF("Lipscomb","") , first_name = NULLIF("Kevin","") , email_address = NULLIF("kevinlipscomb@frompaper2web.com","") , squad_id = NULLIF("9","") on duplicate key update  last_name = NULLIF("Lipscomb","") , first_name = NULLIF("Kevin","") , email_address = NULLIF("kevinlipscomb@frompaper2web.com","") , squad_id = NULLIF("9","")');
INSERT INTO `journal` VALUES (3, '2008-09-21 12:04:25', 'appadmin', 'insert division set id = NULLIF("","") ,  description = NULLIF("(Planning & Analysis)","") , bureau_id = NULLIF("2","") on duplicate key update  description = NULLIF("(Planning & Analysis)","") , bureau_id = NULLIF("2","")');
INSERT INTO `journal` VALUES (4, '2008-09-21 12:05:39', 'appadmin', 'insert unit set id = NULLIF("","") ,  description = NULLIF("Technical Services","") , division_id = NULLIF("6","") on duplicate key update  description = NULLIF("Technical Services","") , division_id = NULLIF("6","")');
INSERT INTO `journal` VALUES (5, '2008-09-21 12:06:00', 'appadmin', 'insert squad set id = NULLIF("","") ,  description = NULLIF("(Technical Services)","") , unit_id = NULLIF("15","") on duplicate key update  description = NULLIF("(Technical Services)","") , unit_id = NULLIF("15","")');
INSERT INTO `journal` VALUES (6, '2008-09-21 12:06:36', 'appadmin', 'insert member set registration_code = NULLIF("1","") ,  last_name = NULLIF("Lipscomb","") , first_name = NULLIF("Kevin","") , email_address = NULLIF("president@frompaper2web.com","") , squad_id = NULLIF("15","") on duplicate key update  last_name = NULLIF("Lipscomb","") , first_name = NULLIF("Kevin","") , email_address = NULLIF("president@frompaper2web.com","") , squad_id = NULLIF("15","")');
INSERT INTO `journal` VALUES (7, '2008-09-21 12:09:20', 'appadmin', 'insert member set registration_code = NULLIF("ilocklin","") ,  last_name = NULLIF("Burke","") , first_name = NULLIF("Scott","") , email_address = NULLIF("burkes@portsmouthva.gov","") , squad_id = NULLIF("9","") on duplicate key update  last_name = NULLIF("Burke","") , first_name = NULLIF("Scott","") , email_address = NULLIF("burkes@portsmouthva.gov","") , squad_id = NULLIF("9","")');
INSERT INTO `journal` VALUES (8, '2008-09-21 12:10:27', 'appadmin', 'insert member set registration_code = NULLIF("litivarm","") ,  last_name = NULLIF("White","") , first_name = NULLIF("Scott","") , email_address = NULLIF("swhite@portsmouthva.gov","") , squad_id = NULLIF("15","") on duplicate key update  last_name = NULLIF("White","") , first_name = NULLIF("Scott","") , email_address = NULLIF("swhite@portsmouthva.gov","") , squad_id = NULLIF("15","")');

-- --------------------------------------------------------

-- 
-- Table structure for table `member`
-- 

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `last_name` varchar(31) NOT NULL,
  `first_name` varchar(31) NOT NULL,
  `email_address` varchar(255) default NULL,
  `registration_code` varchar(15) default NULL,
  `squad_id` bigint(20) unsigned default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `registration_code` (`registration_code`),
  KEY `last_name` (`last_name`),
  KEY `first_name` (`first_name`),
  KEY `member_squad_id` (`squad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `member`
-- 

INSERT INTO `member` VALUES (1, 'Lipscomb', 'Kevin', 'KevinLipscomb@frompaper2web.com', '1', 15);
INSERT INTO `member` VALUES (2, 'Burke', 'Scott', 'ScottBurke@frompaper2web.com', 'ilocklin', 9);
INSERT INTO `member` VALUES (3, 'White', 'Scott', 'ScottWhite@frompaper2web.com', 'litivarm', 15);

-- --------------------------------------------------------

-- 
-- Table structure for table `notification`
-- 

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(63) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `notification`
-- 

INSERT INTO `notification` VALUES (1, 'member-added');

-- --------------------------------------------------------

-- 
-- Table structure for table `privilege`
-- 

DROP TABLE IF EXISTS `privilege`;
CREATE TABLE IF NOT EXISTS `privilege` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(63) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `privilege`
-- 

INSERT INTO `privilege` VALUES (4, 'config-business-objects');
INSERT INTO `privilege` VALUES (5, 'config-members');
INSERT INTO `privilege` VALUES (3, 'config-roles-and-matrices');
INSERT INTO `privilege` VALUES (2, 'config-users');
INSERT INTO `privilege` VALUES (1, 'send-quickmessages');

-- --------------------------------------------------------

-- 
-- Table structure for table `role`
-- 

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(63) NOT NULL,
  `soft_hyphenation_text` varchar(127) NOT NULL,
  `pecking_order` int(10) unsigned NOT NULL,
  `tier_id` tinyint(3) unsigned default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `tier_id` (`tier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `role`
-- 

INSERT INTO `role` VALUES (1, 'Application Administrator', 'Ap&shy;pli&shy;ca&shy;tion Ad&shy;min&shy;is&shy;tra&shy;tor', 11000, 1);
INSERT INTO `role` VALUES (2, 'Department Authority', 'De&shy;part&shy;ment Au&shy;thor&shy;i&shy;ty', 10000, 1);
INSERT INTO `role` VALUES (3, 'Bureau Authority', 'Bu&shy;reau Au&shy;thor&shy;i&shy;ty', 20000, 2);
INSERT INTO `role` VALUES (4, 'Division Authority', 'Di&shy;vi&shy;sion Au&shy;thor&shy;i&shy;ty', 30000, 3);
INSERT INTO `role` VALUES (5, 'Unit/Platoon Authority', 'Unit&shy;/&shy;Pla&shy;toon Au&shy;thor&shy;i&shy;ty', 40000, 4);
INSERT INTO `role` VALUES (6, 'Squad Authority', 'Squad Au&shy;thor&shy;i&shy;ty', 50000, 5);

-- --------------------------------------------------------

-- 
-- Table structure for table `role_member_map`
-- 

DROP TABLE IF EXISTS `role_member_map`;
CREATE TABLE IF NOT EXISTS `role_member_map` (
  `member_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`member_id`,`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `role_member_map`
-- 

INSERT INTO `role_member_map` VALUES (1, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `role_notification_map`
-- 

DROP TABLE IF EXISTS `role_notification_map`;
CREATE TABLE IF NOT EXISTS `role_notification_map` (
  `role_id` int(10) unsigned NOT NULL,
  `notification_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`role_id`,`notification_id`),
  KEY `privilege_id` (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `role_notification_map`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `role_privilege_map`
-- 

DROP TABLE IF EXISTS `role_privilege_map`;
CREATE TABLE IF NOT EXISTS `role_privilege_map` (
  `role_id` int(10) unsigned NOT NULL,
  `privilege_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`role_id`,`privilege_id`),
  KEY `privilege_id` (`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `role_privilege_map`
-- 

INSERT INTO `role_privilege_map` VALUES (1, 1);
INSERT INTO `role_privilege_map` VALUES (1, 2);
INSERT INTO `role_privilege_map` VALUES (1, 3);
INSERT INTO `role_privilege_map` VALUES (1, 4);
INSERT INTO `role_privilege_map` VALUES (1, 5);

-- --------------------------------------------------------

-- 
-- Table structure for table `squad`
-- 

DROP TABLE IF EXISTS `squad`;
CREATE TABLE IF NOT EXISTS `squad` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `description` varchar(63) NOT NULL,
  `unit_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `unit_id` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `squad`
-- 

INSERT INTO `squad` VALUES (1, 'K-9 / Mounted Patrol', 1);
INSERT INTO `squad` VALUES (2, 'Tactical Response', 1);
INSERT INTO `squad` VALUES (3, 'Special Events', 2);
INSERT INTO `squad` VALUES (4, 'Strategic Traffic Enforcement', 2);
INSERT INTO `squad` VALUES (5, 'Special Investigations', 3);
INSERT INTO `squad` VALUES (6, 'Homicide & Robbery', 4);
INSERT INTO `squad` VALUES (7, 'Property Crimes', 4);
INSERT INTO `squad` VALUES (8, 'Special Victims', 4);
INSERT INTO `squad` VALUES (9, 'PTO Coordinator', 6);
INSERT INTO `squad` VALUES (10, 'Property & Evidence', 7);
INSERT INTO `squad` VALUES (11, 'Police Records', 7);
INSERT INTO `squad` VALUES (12, 'PSA-1 / PSA-3', 9);
INSERT INTO `squad` VALUES (13, 'Crime Prevention / PSA-2', 9);
INSERT INTO `squad` VALUES (14, 'PSA-4 / PSA-5', 9);
INSERT INTO `squad` VALUES (15, '(Technical Services)', 15);

-- --------------------------------------------------------

-- 
-- Table structure for table `tier`
-- 

DROP TABLE IF EXISTS `tier`;
CREATE TABLE IF NOT EXISTS `tier` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` varchar(31) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `tier`
-- 

INSERT INTO `tier` VALUES (2, 'Bureau');
INSERT INTO `tier` VALUES (1, 'Department');
INSERT INTO `tier` VALUES (3, 'Division');
INSERT INTO `tier` VALUES (5, 'Squad');
INSERT INTO `tier` VALUES (4, 'Unit/Platoon');

-- --------------------------------------------------------

-- 
-- Table structure for table `unit`
-- 

DROP TABLE IF EXISTS `unit`;
CREATE TABLE IF NOT EXISTS `unit` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `description` varchar(63) NOT NULL,
  `division_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `division_id` (`division_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `unit`
-- 

INSERT INTO `unit` VALUES (1, 'Special Operations', 1);
INSERT INTO `unit` VALUES (2, 'Special Events & Planning', 1);
INSERT INTO `unit` VALUES (3, 'Special Investigations', 1);
INSERT INTO `unit` VALUES (4, 'Criminal Investigations', 2);
INSERT INTO `unit` VALUES (5, 'Administrative Services', 5);
INSERT INTO `unit` VALUES (6, 'Training', 5);
INSERT INTO `unit` VALUES (7, 'Support Services', 5);
INSERT INTO `unit` VALUES (8, 'Communications', 3);
INSERT INTO `unit` VALUES (9, 'Community Services', 3);
INSERT INTO `unit` VALUES (10, 'Uniform Patrol (admin)', 4);
INSERT INTO `unit` VALUES (11, 'First Platoon', 4);
INSERT INTO `unit` VALUES (12, 'Second Platoon', 4);
INSERT INTO `unit` VALUES (13, 'Third Platoon', 4);
INSERT INTO `unit` VALUES (14, 'Auxiliary', 4);
INSERT INTO `unit` VALUES (15, 'Technical Services', 6);

-- --------------------------------------------------------

-- 
-- Table structure for table `user`
-- 

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` char(40) NOT NULL,
  `encoded_password` char(40) default NULL,
  `be_stale_password` tinyint(1) NOT NULL default '1',
  `password_reset_email_address` varchar(255) NOT NULL,
  `be_active` tinyint(1) NOT NULL default '1',
  `num_unsuccessful_login_attempts` int(10) unsigned NOT NULL default '0',
  `last_login` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `password_reset_email_address` (`password_reset_email_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `user`
-- 

INSERT INTO `user` VALUES (1, 'appadmin', '11bb645ed1010af811f98e3fc9bdb49e8dab24ae', 0, 'appadmin@frompaper2web.com', 1, 0, '2008-09-21 11:47:34');

-- --------------------------------------------------------

-- 
-- Table structure for table `user_member_map`
-- 

DROP TABLE IF EXISTS `user_member_map`;
CREATE TABLE IF NOT EXISTS `user_member_map` (
  `user_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `user_member_map`
-- 

INSERT INTO `user_member_map` VALUES (1, 1);

-- 
-- Constraints for dumped tables
-- 

-- 
-- Constraints for table `division`
-- 
ALTER TABLE `division`
  ADD CONSTRAINT `division_bureau_id` FOREIGN KEY (`bureau_id`) REFERENCES `bureau` (`id`);

-- 
-- Constraints for table `member`
-- 
ALTER TABLE `member`
  ADD CONSTRAINT `member_squad_id` FOREIGN KEY (`squad_id`) REFERENCES `squad` (`id`);

-- 
-- Constraints for table `role`
-- 
ALTER TABLE `role`
  ADD CONSTRAINT `tier_id` FOREIGN KEY (`tier_id`) REFERENCES `tier` (`id`);

-- 
-- Constraints for table `role_member_map`
-- 
ALTER TABLE `role_member_map`
  ADD CONSTRAINT `role_member_map_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `role_member_map_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

-- 
-- Constraints for table `squad`
-- 
ALTER TABLE `squad`
  ADD CONSTRAINT `squad_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`);

-- 
-- Constraints for table `unit`
-- 
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_division_id` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`);

-- 
-- Constraints for table `user_member_map`
-- 
ALTER TABLE `user_member_map`
  ADD CONSTRAINT `user_member_map_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_member_map_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`);

SET FOREIGN_KEY_CHECKS=1;

COMMIT;

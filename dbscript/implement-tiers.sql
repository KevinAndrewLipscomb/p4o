START TRANSACTION;

-- --------------------------------------------------------

--
-- Table structure for table `tier`
--
DROP TABLE IF EXISTS tier;
CREATE TABLE tier (
  id tinyint unsigned NOT NULL,
  name varchar(31) NOT NULL,
  PRIMARY KEY id (id),
  UNIQUE name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT tier (id,name) VALUES
(1,'Department'),
(2,'Bureau'),
(3,'Division'),
(4,'Unit/Platoon'),
(5,'Squad');

ALTER TABLE role
  ADD COLUMN tier_id TINYINT UNSIGNED,
  ADD KEY tier_id (tier_id),
  ADD CONSTRAINT role_tier_id FOREIGN KEY role_tier_id (tier_id) REFERENCES tier (id);

update role set tier_id = 1 where name = "Application Administrator";

insert role (name,soft_hyphenation_text,pecking_order,tier_id) values
("Department Authority","De&shy;part&shy;ment Au&shy;thor&shy;i&shy;ty",10000,1),
("Bureau Authority","Bu&shy;reau Au&shy;thor&shy;i&shy;ty",20000,2),
("Division Authority","Di&shy;vi&shy;sion Au&shy;thor&shy;i&shy;ty",30000,3),
("Unit/Platoon Authority","Unit&shy;/&shy;Pla&shy;toon Au&shy;thor&shy;i&shy;ty",40000,4),
("Squad Authority","Squad Au&shy;thor&shy;i&shy;ty",50000,5);

insert role_member_map set
  role_id = (select id from role where name = "Application Administrator"),
  member_id = (select id from member where registration_code = "1");

insert privilege (name) values
("config-users"),
("config-roles-and-matrices"),
("config-business-objects"),
("config-members");

insert role_privilege_map (role_id,privilege_id) values
((select id from role where name = "Application Administrator"),(select id from privilege where name = "send-quickmessages")),
((select id from role where name = "Application Administrator"),(select id from privilege where name = "config-users")),
((select id from role where name = "Application Administrator"),(select id from privilege where name = "config-roles-and-matrices")),
((select id from role where name = "Application Administrator"),(select id from privilege where name = "config-business-objects")),
((select id from role where name = "Application Administrator"),(select id from privilege where name = "config-members"));

ALTER TABLE `member`
 ADD COLUMN `squad_id` BIGINT UNSIGNED,
 ADD UNIQUE `registration_code`(`registration_code`),
 ADD CONSTRAINT `member_squad_id` FOREIGN KEY `member_squad_id` (`squad_id`) REFERENCES `squad` (`id`);

COMMIT
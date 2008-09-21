START TRANSACTION;

ALTER TABLE `division`
 ADD COLUMN `bureau_id` BIGINT UNSIGNED NOT NULL,
 ADD INDEX `bureau_id`(`bureau_id`);
update division set bureau_id = 1;
ALTER TABLE `division`
 ADD CONSTRAINT `division_bureau_id` FOREIGN KEY `division_bureau_id` (`bureau_id`) REFERENCES `bureau` (`id`);

ALTER TABLE `unit`
 ADD COLUMN `division_id` BIGINT UNSIGNED NOT NULL,
 ADD INDEX `division_id`(`division_id`);
update unit set division_id = 1;
ALTER TABLE `unit`
 ADD CONSTRAINT `unit_division_id` FOREIGN KEY `unit_division_id` (`division_id`) REFERENCES `division` (`id`);

ALTER TABLE `squad`
 ADD COLUMN `unit_id` BIGINT UNSIGNED NOT NULL,
 ADD INDEX `unit_id`(`unit_id`);
update squad set unit_id = 1;
ALTER TABLE `squad`
 ADD CONSTRAINT `squad_unit_id` FOREIGN KEY `squad_unit_id` (`unit_id`) REFERENCES `unit` (`id`);

COMMIT
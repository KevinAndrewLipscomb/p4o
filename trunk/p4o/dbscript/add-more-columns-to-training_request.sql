START TRANSACTION;

ALTER TABLE `training_request`
 ADD COLUMN `member_id` INTEGER UNSIGNED NOT NULL,
 ADD COLUMN `submission_timestamp` DATETIME NOT NULL,
 ADD CONSTRAINT `training_request_member_id` FOREIGN KEY `training_request_member_id` (`member_id`)
    REFERENCES `member` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT;

COMMIT
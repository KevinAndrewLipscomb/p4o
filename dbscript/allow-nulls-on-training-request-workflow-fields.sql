START TRANSACTION;

ALTER TABLE `training_request`
 MODIFY COLUMN `disposition_training_timestamp` DATETIME,
 MODIFY COLUMN `disposition_training_member_id` INTEGER UNSIGNED,
 MODIFY COLUMN `disposition_training_funding_source` BIGINT(20) UNSIGNED,
 MODIFY COLUMN `disposition_squad_timestamp` DATETIME,
 MODIFY COLUMN `disposition_squad_member_id` INTEGER UNSIGNED,
 MODIFY COLUMN `disposition_squad_be_approved` TINYINT(1) DEFAULT 0,
 MODIFY COLUMN `disposition_unit_timestamp` DATETIME,
 MODIFY COLUMN `disposition_unit_member_id` INTEGER UNSIGNED,
 MODIFY COLUMN `disposition_unit_be_approved` TINYINT(1) DEFAULT 0,
 MODIFY COLUMN `disposition_division_timestamp` DATETIME,
 MODIFY COLUMN `disposition_division_member_id` INTEGER UNSIGNED,
 MODIFY COLUMN `disposition_division_be_approved` TINYINT(1) DEFAULT 0,
 MODIFY COLUMN `disposition_assistant_chief_timestamp` DATETIME,
 MODIFY COLUMN `disposition_assistant_chief_member_id` INTEGER UNSIGNED,
 MODIFY COLUMN `disposition_assistant_chief_be_approved` TINYINT(1) DEFAULT 0,
 MODIFY COLUMN `payment_timestamp` DATETIME,
 MODIFY COLUMN `payment_member_id` INTEGER UNSIGNED,
 MODIFY COLUMN `payment_be_done` TINYINT(1) DEFAULT 0,
 MODIFY COLUMN `payment_actual_amount` DECIMAL(10,2) UNSIGNED,
 MODIFY COLUMN `finalization_timestamp` DATETIME;

COMMIT
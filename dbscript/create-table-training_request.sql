START TRANSACTION;

DROP TABLE IF EXISTS training_request;
CREATE TABLE IF NOT EXISTS training_request (
  id SERIAL,
  nature VARCHAR(127) NOT NULL,
  dates VARCHAR(255),
  conducting_agency VARCHAR(127) NOT NULL,
  location VARCHAR(127),
  cost_of_enrollment DECIMAL(10,2) UNSIGNED NOT NULL,
  cost_of_lodging DECIMAL(10,2) UNSIGNED DEFAULT "0" NOT NULL,
  cost_of_meals DECIMAL(10,2) UNSIGNED DEFAULT "0" NOT NULL,
  cost_of_transportation DECIMAL(10,2) UNSIGNED DEFAULT "0" NOT NULL,
  reason TEXT,
  disposition_training_timestamp DATETIME NOT NULL,
  disposition_training_member_id INTEGER UNSIGNED NOT NULL,
  disposition_training_funding_source BIGINT UNSIGNED NOT NULL,
  disposition_training_comments TEXT,
  disposition_squad_timestamp DATETIME NOT NULL,
  disposition_squad_member_id INTEGER UNSIGNED NOT NULL,
  disposition_squad_be_approved BOOLEAN DEFAULT "0" NOT NULL,
  disposition_squad_comments TEXT,
  disposition_unit_timestamp DATETIME NOT NULL,
  disposition_unit_member_id INTEGER UNSIGNED NOT NULL,
  disposition_unit_be_approved BOOLEAN DEFAULT "0" NOT NULL,
  disposition_unit_comments TEXT,
  disposition_division_timestamp DATETIME NOT NULL,
  disposition_division_member_id INTEGER UNSIGNED NOT NULL,
  disposition_division_be_approved BOOLEAN DEFAULT "0" NOT NULL,
  disposition_division_comments TEXT,
  disposition_assistant_chief_timestamp DATETIME NOT NULL,
  disposition_assistant_chief_member_id INTEGER UNSIGNED NOT NULL,
  disposition_assistant_chief_be_approved BOOLEAN DEFAULT "0" NOT NULL,
  disposition_assistant_chief_comments TEXT,
  payment_timestamp DATETIME NOT NULL,
  payment_member_id INTEGER UNSIGNED NOT NULL,
  payment_be_done BOOLEAN DEFAULT "0" NOT NULL,
  payment_actual_amount DECIMAL(10,2) UNSIGNED NOT NULL,
  payment_comments TEXT,
  status_code BIGINT UNSIGNED NOT NULL,
  finalization_timestamp DATETIME NOT NULL,
  PRIMARY KEY(id)
)
ENGINE = InnoDB;

ALTER TABLE `training_request`
 ADD CONSTRAINT `training_request_disposition_training_member_id` FOREIGN KEY `training_request_disposition_training_member_id` (`disposition_training_member_id`)
    REFERENCES `member` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
 ADD CONSTRAINT `training_request_disposition_squad_member_id` FOREIGN KEY `training_request_disposition_squad_member_id` (`disposition_squad_member_id`)
    REFERENCES `member` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
 ADD CONSTRAINT `training_request_disposition_unit_member_id` FOREIGN KEY `training_request_disposition_unit_member_id` (`disposition_unit_member_id`)
    REFERENCES `member` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
 ADD CONSTRAINT `training_request_disposition_division_member_id` FOREIGN KEY `training_request_disposition_division_member_id` (`disposition_division_member_id`)
    REFERENCES `member` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
 ADD CONSTRAINT `training_request_disposition_assistant_chief_member_id` FOREIGN KEY `training_request_disposition_assistant_chief_member_id` (`disposition_assistant_chief_member_id`)
    REFERENCES `member` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
 ADD CONSTRAINT `training_request_payment_member_id` FOREIGN KEY `training_request_payment_member_id` (`payment_member_id`)
    REFERENCES `member` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT;

COMMIT
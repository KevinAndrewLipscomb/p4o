DROP TABLE IF EXISTS member;
CREATE TABLE IF NOT EXISTS member (
  id SERIAL,
  last_name VARCHAR(31) NOT NULL,
  first_name VARCHAR(31) NOT NULL,
  email_address VARCHAR(255),
  registration_code VARCHAR(15) NOT NULL,
  squad_id BIGINT UNSIGNED,
  PRIMARY KEY(id),
  UNIQUE (registration_code)
)
ENGINE = InnoDB;

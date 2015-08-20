START TRANSACTION;

DROP TABLE IF EXISTS bureau;
CREATE TABLE IF NOT EXISTS bureau (
  id SERIAL,
  description VARCHAR(63) NOT NULL,
  PRIMARY KEY(id)
)
ENGINE = InnoDB;

COMMIT
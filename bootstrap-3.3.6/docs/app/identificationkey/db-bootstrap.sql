-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mosskey
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mosskey
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mosskey` ;
USE `mosskey` ;

-- -----------------------------------------------------
-- Table `mosskey`.`URL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mosskey`.`URL` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(256) NULL,
  `AltText` VARCHAR(256) NULL,
  `Description` VARCHAR(1024) NULL,
  `Type` ENUM('image', 'other') NOT NULL,
  `TimeStamp` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idURL_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mosskey`.`Authority`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mosskey`.`Authority` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mosskey`.`KeyCharacter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mosskey`.`KeyCharacter` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `lft` INT NOT NULL,
  `rht` INT NOT NULL,
  `description` VARCHAR(1024) NULL,
  `ViewBy` ENUM('eye', 'scope', 'handlense') NULL,
  `AnchorText` VARCHAR(45) NULL,
  `URLid` INT NULL,
  `isHandLens` TINYINT(1) NULL,
  `isDissectingScope` TINYINT(1) NULL,
  `isLightScope` TINYINT(1) NULL,
  `TimeStamp` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `url_idx` (`URLid` ASC),
  CONSTRAINT `url`
    FOREIGN KEY (`URLid`)
    REFERENCES `mosskey`.`URL` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mosskey`.`Taxa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mosskey`.`Taxa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `lft` INT NOT NULL,
  `rht` INT NOT NULL,
  `Description` VARCHAR(1024) NULL,
  `URLId` INT NULL,
  `AuthorityId` INT NULL,
  `TimeStamp` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `url_idx` (`URLId` ASC),
  INDEX `authority_idx` (`AuthorityId` ASC),
  CONSTRAINT `url_taxa`
    FOREIGN KEY (`URLId`)
    REFERENCES `mosskey`.`URL` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `authority_taxa`
    FOREIGN KEY (`AuthorityId`)
    REFERENCES `mosskey`.`Authority` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mosskey`.`Map`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mosskey`.`Map` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `TaxaId` INT NULL,
  `KeyCharacterId` INT NULL,
  `TimeStamp` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `taxaid_idx` (`TaxaId` ASC),
  INDEX `keycharacterid_idx` (`KeyCharacterId` ASC),
  CONSTRAINT `taxaid`
    FOREIGN KEY (`TaxaId`)
    REFERENCES `mosskey`.`Taxa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `keycharacterid`
    FOREIGN KEY (`KeyCharacterId`)
    REFERENCES `mosskey`.`KeyCharacter` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE USER 'web';

GRANT SELECT ON TABLE `mydb`.* TO 'web';
GRANT SELECT ON TABLE `mosskey`.* TO 'web';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

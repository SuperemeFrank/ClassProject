-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pols
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pols
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pols` DEFAULT CHARACTER SET utf8 ;
USE `pols` ;

-- -----------------------------------------------------
-- Table `pols`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pols`.`Users` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Email address` VARCHAR(45) NOT NULL,
  `Gender` TINYINT NULL,
  `DOB` DATE NULL,
  `StudentFlag` TINYINT NOT NULL,
  `Address` VARCHAR(45) NULL,
  `Total points` INT NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pols`.`Syllabus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pols`.`Syllabus` (
  `idSyllabus` INT NOT NULL,
  `Syllabus name` VARCHAR(45) NOT NULL,
  `Upload date` DATETIME NOT NULL,
  PRIMARY KEY (`idSyllabus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pols`.`Classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pols`.`Classes` (
  `idClass` INT NOT NULL,
  `Class name` VARCHAR(45) NOT NULL,
  `Start date` DATE NOT NULL,
  `End date` DATE NOT NULL,
  `Syllabus_idSyllabus` INT NOT NULL,
  PRIMARY KEY (`idClass`, `Syllabus_idSyllabus`),
  CONSTRAINT `fk_Classes_Syllabus1`
    FOREIGN KEY (`Syllabus_idSyllabus`)
    REFERENCES `pols`.`Syllabus` (`idSyllabus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pols`.`Assignments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pols`.`Assignments` (
  `idAssignment` INT NOT NULL,
  `Assignment name` VARCHAR(45) NOT NULL,
  `Upload date` DATETIME NULL,
  PRIMARY KEY (`idAssignment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pols`.`Grades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pols`.`Grades` (
  `idUser` INT NOT NULL,
  `idAssignment` INT NOT NULL,
  `Grade` INT NULL,
  `Assignments_idAssignment` INT NOT NULL,
  `Users_idUser` INT NOT NULL,
  PRIMARY KEY (`idUser`, `idAssignment`, `Assignments_idAssignment`, `Users_idUser`),
  CONSTRAINT `fk_Grades_Assignments1`
    FOREIGN KEY (`Assignments_idAssignment`)
    REFERENCES `pols`.`Assignments` (`idAssignment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Grades_Users1`
    FOREIGN KEY (`Users_idUser`)
    REFERENCES `pols`.`Users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pols`.`Videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pols`.`Videos` (
  `idVideo` INT NOT NULL,
  `Video name` VARCHAR(45) NOT NULL,
  `Upload date` DATETIME NOT NULL,
  `Youtube url` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idVideo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pols`.`Files`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pols`.`Files` (
  `idFile` INT NOT NULL,
  `File name` VARCHAR(45) NOT NULL,
  `Upload date` DATETIME NOT NULL,
  `Classes_idClass` INT NOT NULL,
  `Classes_Syllabus_idSyllabus` INT NOT NULL,
  PRIMARY KEY (`idFile`, `Classes_idClass`, `Classes_Syllabus_idSyllabus`),
  CONSTRAINT `fk_Files_Classes1`
    FOREIGN KEY (`Classes_idClass` , `Classes_Syllabus_idSyllabus`)
    REFERENCES `pols`.`Classes` (`idClass` , `Syllabus_idSyllabus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pols`.`User_Class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pols`.`User_Class` (
  `Users_idUser` INT NOT NULL,
  `Classes_idClass` INT NOT NULL,
  PRIMARY KEY (`Users_idUser`, `Classes_idClass`),
  CONSTRAINT `fk_Users_has_Classes_Users`
    FOREIGN KEY (`Users_idUser`)
    REFERENCES `pols`.`Users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Users_has_Classes_Classes1`
    FOREIGN KEY (`Classes_idClass`)
    REFERENCES `pols`.`Classes` (`idClass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pols`.`Class_Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pols`.`Class_Video` (
  `Classes_idClass` INT NOT NULL,
  `Videos_idVideo` INT NOT NULL,
  PRIMARY KEY (`Classes_idClass`, `Videos_idVideo`),
  CONSTRAINT `fk_Classes_has_Videos_Classes1`
    FOREIGN KEY (`Classes_idClass`)
    REFERENCES `pols`.`Classes` (`idClass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Classes_has_Videos_Videos1`
    FOREIGN KEY (`Videos_idVideo`)
    REFERENCES `pols`.`Videos` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

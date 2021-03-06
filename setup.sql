SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

 
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

 
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `balance` INT NULL DEFAULT 0,
  `id` INT PRIMARY KEY auto_increment,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));



CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `id` INT PRIMARY KEY auto_increment,
  `owner` INT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `category` INT NOT NULL,
  `price` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `quantity` INT NULL,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `owner_idx` (`owner` ASC) VISIBLE,
  INDEX `category_idx` (`category` ASC) VISIBLE,
  CONSTRAINT `owner`
    FOREIGN KEY (`owner`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `category`
    FOREIGN KEY (`category`)
    REFERENCES `mydb`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
  

CREATE TABLE IF NOT EXISTS `mydb`.`history` (
  `id` INT NOT NULL,
  `seller` INT NULL,
  `buyer` INT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `facture` INT NULL,
  `product` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `buyer_idx` (`buyer` ASC) VISIBLE,
  INDEX `product_idx` (`product` ASC) VISIBLE,
  INDEX `seller_idx` (`seller` ASC) VISIBLE,
  CONSTRAINT `seller`
    FOREIGN KEY (`seller`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `buyer`
    FOREIGN KEY (`buyer`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product`
    FOREIGN KEY (`product`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

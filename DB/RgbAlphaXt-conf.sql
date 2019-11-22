-- Tabla de Usuarios
CREATE TABLE `RgbAlphaXt`.`tUsuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `correoE` VARCHAR(255) NULL,
  PRIMARY KEY (`idUsuario`));
ALTER TABLE `RgbAlphaXt`.`tUsuarios` 
ADD COLUMN `enviar` TINYINT(1) NULL AFTER `correoE`;

-- Tabla de Fondo
CREATE TABLE `RgbAlphaXt`.`tFondos` (
  `idFondo` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NULL,
  `backgroundRed` INT NULL,
  `backgroundGreen` INT NULL,
  `backgroundBlue` INT NULL,
  `imperfectionWeight` FLOAT NULL,
  `imperfectionPercentage` FLOAT NULL,
  PRIMARY KEY (`idFondo`),
  INDEX `fk_tFondos_1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_tFondos_1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `RgbAlphaXt`.`tUsuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Tabla Elementos 1 y 2
CREATE TABLE `RgbAlphaXt`.`tE1y2` (
  `idE1y2` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NULL,
  `rojo` FLOAT NULL,
  `verde` FLOAT NULL,
  `azul` FLOAT NULL,
  `probabilidadHueco` FLOAT NULL,
  PRIMARY KEY (`idE1y2`),
  INDEX `fk_tE1y2_1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_tE1y2_1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `RgbAlphaXt`.`tUsuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Tabla Elemento 3

CREATE TABLE `RgbAlphaXt`.`tE3` (
  `idE3` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NULL,
  `startAlpha` FLOAT NULL,
  `endAlpha` FLOAT NULL,
  PRIMARY KEY (`idE3`),
  INDEX `fk_tE3_1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_tE3_1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `RgbAlphaXt`.`tUsuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Tabla Elemento 4
CREATE TABLE `RgbAlphaXt`.`tE4` (
  `idE4` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NULL,
  `maxAlpha` FLOAT NULL,
  PRIMARY KEY (`idE4`),
  INDEX `fk_tE4_1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_tE4_1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `RgbAlphaXt`.`tUsuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Tabla Elemento 5
CREATE TABLE `RgbAlphaXt`.`tE5` (
  `idE5` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NULL,
  `gray1` FLOAT NULL,
  `gray2` FLOAT NULL,
  `maxAlpha` FLOAT NULL,
  `lineChance` FLOAT NULL,
  PRIMARY KEY (`idE5`),
  INDEX `fk_tE5_1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_tE5_1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `RgbAlphaXt`.`tUsuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Tabla Elemento 6
CREATE TABLE `RgbAlphaXt`.`tE6` (
  `idE6` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NULL,
  `startAlpha` FLOAT NULL,
  `endAlpha` FLOAT NULL,
  PRIMARY KEY (`idE6`),
  INDEX `fk_tE6_1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_tE6_1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `RgbAlphaXt`.`tUsuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



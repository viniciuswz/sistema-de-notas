-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema notas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema notas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `notas` DEFAULT CHARACTER SET latin1 ;
USE `notas` ;

-- -----------------------------------------------------
-- Table `notas`.`tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`tipo_usuario` (
  `cod_tipo_usuario` INT NOT NULL AUTO_INCREMENT,
  `status_tipo_usuario` CHAR(1) NOT NULL,
  `descricao_tipo_usuario` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`cod_tipo_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`usuario` (
  `cod_usuario` INT NOT NULL AUTO_INCREMENT,
  `cpf_usuario` VARCHAR(14) NOT NULL,
  `senha_usaurio` VARCHAR(100) NOT NULL,
  `dataHora_registro` DATETIME NOT NULL,
  `nome_usuario` VARCHAR(100) NOT NULL,
  `foto_usuario_perfil` VARCHAR(100) NULL,
  `status_usuario` CHAR(1) NOT NULL,
  `cod_tipo_usuario` INT NOT NULL,
  PRIMARY KEY (`cod_usuario`),
  UNIQUE INDEX `cod_usuario_UNIQUE` (`cod_usuario` ASC),
  UNIQUE INDEX `cpf_usuario_UNIQUE` (`cpf_usuario` ASC),
  INDEX `fk_usuario_tipo_usuario_idx` (`cod_tipo_usuario` ASC),
  CONSTRAINT `fk_usuario_tipo_usuario`
    FOREIGN KEY (`cod_tipo_usuario`)
    REFERENCES `notas`.`tipo_usuario` (`cod_tipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas`.`disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`disciplina` (
  `cod_disciplina` INT NOT NULL AUTO_INCREMENT,
  `descricao_disciplina` VARCHAR(100) NOT NULL,
  `status_disciplina` CHAR(1) NOT NULL,
  PRIMARY KEY (`cod_disciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas`.`disciplina_responsavel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`disciplina_responsavel` (
  `cod_disciplina_responsavel` INT NOT NULL AUTO_INCREMENT,
  `status_disciplina_responsavel` CHAR(1) NOT NULL,
  `cod_usuario` INT NOT NULL,
  `cod_disciplina` INT NOT NULL,
  PRIMARY KEY (`cod_disciplina_responsavel`),
  UNIQUE INDEX `cod_disciplina_responsavel_UNIQUE` (`cod_disciplina_responsavel` ASC),
  INDEX `fk_disciplina_usuario_usuario1_idx` (`cod_usuario` ASC),
  INDEX `fk_disciplina_responsavel_disciplina1_idx` (`cod_disciplina` ASC),
  CONSTRAINT `fk_disciplina_usuario_usuario1`
    FOREIGN KEY (`cod_usuario`)
    REFERENCES `notas`.`usuario` (`cod_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disciplina_responsavel_disciplina1`
    FOREIGN KEY (`cod_disciplina`)
    REFERENCES `notas`.`disciplina` (`cod_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`curso` (
  `cod_curso` INT NOT NULL AUTO_INCREMENT,
  `nome_curso` VARCHAR(100) NOT NULL,
  `status_curso` CHAR(1) NOT NULL,
  PRIMARY KEY (`cod_curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas`.`periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`periodo` (
  `cod_periodo` INT NOT NULL AUTO_INCREMENT,
  `status_periodo` CHAR(1) NOT NULL,
  `descricao_periodo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`cod_periodo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`turma` (
  `cod_turma` INT NOT NULL AUTO_INCREMENT,
  `sala_turma` VARCHAR(45) NOT NULL,
  `qtd_maxima_alunos_turma` INT NOT NULL,
  `status_turma` CHAR(1) NOT NULL,
  `descricao_turma` VARCHAR(100) NOT NULL,
  `cod_periodo` INT NOT NULL,
  PRIMARY KEY (`cod_turma`),
  INDEX `fk_turma_periodo1_idx` (`cod_periodo` ASC),
  CONSTRAINT `fk_turma_periodo1`
    FOREIGN KEY (`cod_periodo`)
    REFERENCES `notas`.`periodo` (`cod_periodo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas`.`turma_disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`turma_disciplina` (
  `cod_turma_disciplina` INT NOT NULL AUTO_INCREMENT,
  `status_disciplina` CHAR(1) NOT NULL,
  `cod_disciplina_responsavel` INT NOT NULL,
  `cod_turma` INT NOT NULL,
  PRIMARY KEY (`cod_turma_disciplina`),
  INDEX `fk_turma_disciplina_disciplina_responsavel1_idx` (`cod_disciplina_responsavel` ASC),
  INDEX `fk_turma_disciplina_turma1_idx` (`cod_turma` ASC),
  CONSTRAINT `fk_turma_disciplina_disciplina_responsavel1`
    FOREIGN KEY (`cod_disciplina_responsavel`)
    REFERENCES `notas`.`disciplina_responsavel` (`cod_disciplina_responsavel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_disciplina_turma1`
    FOREIGN KEY (`cod_turma`)
    REFERENCES `notas`.`turma` (`cod_turma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas`.`disciplina_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`disciplina_curso` (
  `cod_disciplina` INT NOT NULL,
  `cod_curso` INT NOT NULL,
  `status_curso` CHAR(1) NOT NULL,
  INDEX `fk_disciplina_has_curso_curso1_idx` (`cod_curso` ASC),
  INDEX `fk_disciplina_has_curso_disciplina1_idx` (`cod_disciplina` ASC),
  CONSTRAINT `fk_disciplina_has_curso_disciplina1`
    FOREIGN KEY (`cod_disciplina`)
    REFERENCES `notas`.`disciplina` (`cod_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disciplina_has_curso_curso1`
    FOREIGN KEY (`cod_curso`)
    REFERENCES `notas`.`curso` (`cod_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`aluno` (
  `cod_aluno` INT NOT NULL AUTO_INCREMENT,
  `nome_aluno` VARCHAR(100) NOT NULL,
  `data_nascimento_aluno` DATE NOT NULL,
  `cpf_aluno` VARCHAR(14) NOT NULL,
  `cpf_responsavel` VARCHAR(14) NOT NULL,
  `telefone_contato` VARCHAR(20) NULL,
  `nome_resposavel` VARCHAR(100) NOT NULL,
  `status_aluno` CHAR(1) NOT NULL,
  `cep_residencia_aluno` VARCHAR(20) NOT NULL,
  `foto_aluno` VARCHAR(100) NOT NULL,
  `rg_aluno` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`cod_aluno`),
  UNIQUE INDEX `cpf_aluno_UNIQUE` (`cpf_aluno` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas`.`matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`matricula` (
  `cod_matricula` INT NOT NULL AUTO_INCREMENT,
  `dataHora_matricula` DATETIME NOT NULL,
  `status_matricula` CHAR(1) NOT NULL,
  `turma_cod_turma` INT NOT NULL,
  `aluno_cod_aluno` INT NOT NULL,
  PRIMARY KEY (`cod_matricula`),
  INDEX `fk_matricula_turma1_idx` (`turma_cod_turma` ASC),
  INDEX `fk_matricula_aluno1_idx` (`aluno_cod_aluno` ASC),
  CONSTRAINT `fk_matricula_turma1`
    FOREIGN KEY (`turma_cod_turma`)
    REFERENCES `notas`.`turma` (`cod_turma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matricula_aluno1`
    FOREIGN KEY (`aluno_cod_aluno`)
    REFERENCES `notas`.`aluno` (`cod_aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas`.`atividades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`atividades` (
  `cod_atividade` INT NOT NULL AUTO_INCREMENT,
  `nome_atividade` VARCHAR(100) NOT NULL,
  `peso_atividade` VARCHAR(3) NOT NULL,
  `numero_periodo` VARCHAR(1) NOT NULL,
  `dataHora_atividade` DATETIME NOT NULL,
  `status_atividade` CHAR(1) NOT NULL,
  `cod_turma_disciplina` INT NOT NULL,
  PRIMARY KEY (`cod_atividade`),
  INDEX `fk_atividades_turma_disciplina1_idx` (`cod_turma_disciplina` ASC),
  CONSTRAINT `fk_atividades_turma_disciplina1`
    FOREIGN KEY (`cod_turma_disciplina`)
    REFERENCES `notas`.`turma_disciplina` (`cod_turma_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`notas` (
  `cod_nota` INT NOT NULL AUTO_INCREMENT,
  `nota` VARCHAR(6) NOT NULL,
  `cod_matricula` INT NOT NULL,
  `cod_atividade` INT NOT NULL,
  PRIMARY KEY (`cod_nota`),
  INDEX `fk_notas_matricula1_idx` (`cod_matricula` ASC),
  INDEX `fk_notas_atividades1_idx` (`cod_atividade` ASC),
  CONSTRAINT `fk_notas_matricula1`
    FOREIGN KEY (`cod_matricula`)
    REFERENCES `notas`.`matricula` (`cod_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notas_atividades1`
    FOREIGN KEY (`cod_atividade`)
    REFERENCES `notas`.`atividades` (`cod_atividade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas`.`acrescimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`acrescimo` (
  `cod_acrescimo` INT NOT NULL AUTO_INCREMENT,
  `vlr_acrescimo` VARCHAR(4) NOT NULL,
  `cod_nota` INT NOT NULL,
  `cod_disciplina_responsavel` INT NOT NULL,
  PRIMARY KEY (`cod_acrescimo`),
  INDEX `fk_acrescimo_notas1_idx` (`cod_nota` ASC),
  INDEX `fk_acrescimo_disciplina_responsavel1_idx` (`cod_disciplina_responsavel` ASC),
  CONSTRAINT `fk_acrescimo_notas1`
    FOREIGN KEY (`cod_nota`)
    REFERENCES `notas`.`notas` (`cod_nota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acrescimo_disciplina_responsavel1`
    FOREIGN KEY (`cod_disciplina_responsavel`)
    REFERENCES `notas`.`disciplina_responsavel` (`cod_disciplina_responsavel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: notas
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acrescimo`
--

DROP TABLE IF EXISTS `acrescimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acrescimo` (
  `cod_acrescimo` int(11) NOT NULL AUTO_INCREMENT,
  `vlr_acrescimo` varchar(4) NOT NULL,
  `cod_nota` int(11) NOT NULL,
  `cod_disciplina_responsavel` int(11) NOT NULL,
  PRIMARY KEY (`cod_acrescimo`),
  KEY `fk_acrescimo_notas1_idx` (`cod_nota`),
  KEY `fk_acrescimo_disciplina_responsavel1_idx` (`cod_disciplina_responsavel`),
  CONSTRAINT `fk_acrescimo_disciplina_responsavel1` FOREIGN KEY (`cod_disciplina_responsavel`) REFERENCES `disciplina_responsavel` (`cod_disciplina_responsavel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acrescimo_notas1` FOREIGN KEY (`cod_nota`) REFERENCES `notas` (`cod_nota`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acrescimo`
--

LOCK TABLES `acrescimo` WRITE;
/*!40000 ALTER TABLE `acrescimo` DISABLE KEYS */;
/*!40000 ALTER TABLE `acrescimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `cod_aluno` int(11) NOT NULL AUTO_INCREMENT,
  `nome_aluno` varchar(100) NOT NULL,
  `data_nascimento_aluno` date NOT NULL,
  `cpf_aluno` varchar(14) NOT NULL,
  `cpf_responsavel` varchar(14) NOT NULL,
  `telefone_contato` varchar(20) DEFAULT NULL,
  `nome_resposavel` varchar(100) NOT NULL,
  `status_aluno` char(1) NOT NULL,
  `cep_residencia_aluno` varchar(20) NOT NULL,
  `foto_aluno` varchar(100) NOT NULL,
  `rg_aluno` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_aluno`),
  UNIQUE KEY `cpf_aluno_UNIQUE` (`cpf_aluno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'Berce','2001-08-29','123.234.123-40','123.564.897-40','(11) 4002-8922','Maria','A','06415-045','','123.098.987-40'),(2,'Matheus','2002-07-29','653.234.545-40','123.564.897-41','(11) 4002-8922','Maria','A','06415-045','','123.098.987-40'),(3,'Cleiton','2003-09-08','423.645.525.31','123.564.897-42','(11) 4002-8922','Maria','A','06415-045','','123.098.987-40');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividades`
--

DROP TABLE IF EXISTS `atividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividades` (
  `cod_atividade` int(11) NOT NULL AUTO_INCREMENT,
  `nome_atividade` varchar(100) NOT NULL,
  `peso_atividade` varchar(3) NOT NULL,
  `numero_periodo` varchar(1) NOT NULL,
  `dataHora_atividade` datetime NOT NULL,
  `status_atividade` char(1) NOT NULL,
  `cod_turma_disciplina` int(11) NOT NULL,
  PRIMARY KEY (`cod_atividade`),
  KEY `fk_atividades_turma_disciplina1_idx` (`cod_turma_disciplina`),
  CONSTRAINT `fk_atividades_turma_disciplina1` FOREIGN KEY (`cod_turma_disciplina`) REFERENCES `turma_disciplina` (`cod_turma_disciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividades`
--

LOCK TABLES `atividades` WRITE;
/*!40000 ALTER TABLE `atividades` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `cod_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nome_curso` varchar(100) NOT NULL,
  `status_curso` char(1) NOT NULL,
  PRIMARY KEY (`cod_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Informática para Internet','A'),(2,'Química','A'),(3,'Análises Clínicas','A'),(4,'Farmacia','A'),(5,'Informática','A'),(6,'Hospedagem ','A');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `cod_disciplina` int(11) NOT NULL AUTO_INCREMENT,
  `descricao_disciplina` varchar(100) NOT NULL,
  `status_disciplina` char(1) NOT NULL,
  PRIMARY KEY (`cod_disciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'Matemática','A'),(2,'Português','A'),(3,'História','A'),(4,'Geografia','A'),(5,'Anatomia Humana ','A'),(6,'Análise Biológica','A'),(7,'Programação','A'),(8,'Banco de Dados','A'),(9,'Virologia','A'),(10,'Segurança da informação','A'),(11,'Pacote Office','A'),(12,'Antibióticos','A');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina_curso`
--

DROP TABLE IF EXISTS `disciplina_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina_curso` (
  `cod_disciplina` int(11) NOT NULL,
  `cod_curso` int(11) NOT NULL,
  `status_curso` char(1) NOT NULL,
  KEY `fk_disciplina_has_curso_curso1_idx` (`cod_curso`),
  KEY `fk_disciplina_has_curso_disciplina1_idx` (`cod_disciplina`),
  CONSTRAINT `fk_disciplina_has_curso_curso1` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`cod_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_disciplina_has_curso_disciplina1` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplina` (`cod_disciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina_curso`
--

LOCK TABLES `disciplina_curso` WRITE;
/*!40000 ALTER TABLE `disciplina_curso` DISABLE KEYS */;
INSERT INTO `disciplina_curso` VALUES (1,1,'A'),(1,2,'A'),(1,3,'A'),(1,4,'A'),(1,5,'A'),(1,6,'A'),(2,1,'A'),(2,2,'A'),(2,3,'A'),(2,4,'A'),(2,5,'A'),(2,6,'A'),(3,1,'A'),(3,2,'A'),(3,3,'A'),(3,4,'A'),(3,5,'A'),(3,6,'A'),(4,1,'A'),(4,2,'A'),(4,3,'A'),(4,4,'A'),(4,5,'A'),(4,6,'A'),(5,3,'A'),(5,4,'A'),(6,3,'A'),(6,4,'A'),(7,1,'A'),(7,5,'A'),(8,1,'A'),(8,5,'A'),(9,3,'A'),(9,4,'A'),(10,1,'A'),(10,5,'A'),(11,1,'A'),(11,5,'A'),(12,3,'A'),(12,4,'A');
/*!40000 ALTER TABLE `disciplina_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina_responsavel`
--

DROP TABLE IF EXISTS `disciplina_responsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina_responsavel` (
  `cod_disciplina_responsavel` int(11) NOT NULL AUTO_INCREMENT,
  `status_disciplina_responsavel` char(1) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `cod_disciplina` int(11) NOT NULL,
  PRIMARY KEY (`cod_disciplina_responsavel`),
  UNIQUE KEY `cod_disciplina_responsavel_UNIQUE` (`cod_disciplina_responsavel`),
  KEY `fk_disciplina_usuario_usuario1_idx` (`cod_usuario`),
  KEY `fk_disciplina_responsavel_disciplina1_idx` (`cod_disciplina`),
  CONSTRAINT `fk_disciplina_responsavel_disciplina1` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplina` (`cod_disciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_disciplina_usuario_usuario1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina_responsavel`
--

LOCK TABLES `disciplina_responsavel` WRITE;
/*!40000 ALTER TABLE `disciplina_responsavel` DISABLE KEYS */;
INSERT INTO `disciplina_responsavel` VALUES (35,'A',1,1),(36,'A',2,1),(37,'A',2,2),(38,'A',2,3),(39,'A',3,4),(40,'A',3,5),(41,'A',5,5),(42,'A',5,6),(43,'A',6,7);
/*!40000 ALTER TABLE `disciplina_responsavel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matricula` (
  `cod_matricula` int(11) NOT NULL AUTO_INCREMENT,
  `dataHora_matricula` datetime NOT NULL,
  `status_matricula` char(1) NOT NULL,
  `turma_cod_turma` int(11) NOT NULL,
  `aluno_cod_aluno` int(11) NOT NULL,
  PRIMARY KEY (`cod_matricula`),
  KEY `fk_matricula_turma1_idx` (`turma_cod_turma`),
  KEY `fk_matricula_aluno1_idx` (`aluno_cod_aluno`),
  CONSTRAINT `fk_matricula_aluno1` FOREIGN KEY (`aluno_cod_aluno`) REFERENCES `aluno` (`cod_aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matricula_turma1` FOREIGN KEY (`turma_cod_turma`) REFERENCES `turma` (`cod_turma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (1,'2019-03-01 01:40:12','A',1,1),(2,'2019-03-01 01:40:12','A',1,2),(3,'2019-03-01 01:40:12','A',1,3);
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas` (
  `cod_nota` int(11) NOT NULL AUTO_INCREMENT,
  `nota` varchar(6) NOT NULL,
  `cod_matricula` int(11) NOT NULL,
  `cod_atividade` int(11) NOT NULL,
  PRIMARY KEY (`cod_nota`),
  KEY `fk_notas_matricula1_idx` (`cod_matricula`),
  KEY `fk_notas_atividades1_idx` (`cod_atividade`),
  CONSTRAINT `fk_notas_atividades1` FOREIGN KEY (`cod_atividade`) REFERENCES `atividades` (`cod_atividade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_notas_matricula1` FOREIGN KEY (`cod_matricula`) REFERENCES `matricula` (`cod_matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodo` (
  `cod_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `status_periodo` char(1) NOT NULL,
  `descricao_periodo` varchar(100) NOT NULL,
  PRIMARY KEY (`cod_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` VALUES (1,'A','Semestre'),(2,'A','Bimestre'),(3,'A','Trimeste');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `cod_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `status_tipo_usuario` char(1) NOT NULL,
  `descricao_tipo_usuario` varchar(60) NOT NULL,
  PRIMARY KEY (`cod_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'A','Professor'),(2,'A','Aluno'),(3,'A','Diretor');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma` (
  `cod_turma` int(11) NOT NULL AUTO_INCREMENT,
  `sala_turma` varchar(45) NOT NULL,
  `qtd_maxima_alunos_turma` int(11) NOT NULL,
  `status_turma` char(1) NOT NULL,
  `descricao_turma` varchar(100) NOT NULL,
  `cod_periodo` int(11) NOT NULL,
  PRIMARY KEY (`cod_turma`),
  KEY `fk_turma_periodo1_idx` (`cod_periodo`),
  CONSTRAINT `fk_turma_periodo1` FOREIGN KEY (`cod_periodo`) REFERENCES `periodo` (`cod_periodo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (1,'2',30,'A','INI3A',3),(2,'3',29,'A','INI3B',3),(3,'4',28,'A','ACL3A',3),(4,'5',30,'A','QUIM3A',2),(5,'6',40,'A','INF3C',2),(6,'7',20,'A','FAR3A',1);
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma_disciplina`
--

DROP TABLE IF EXISTS `turma_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma_disciplina` (
  `cod_turma_disciplina` int(11) NOT NULL AUTO_INCREMENT,
  `status_disciplina` char(1) NOT NULL,
  `cod_disciplina_responsavel` int(11) NOT NULL,
  `cod_turma` int(11) NOT NULL,
  PRIMARY KEY (`cod_turma_disciplina`),
  KEY `fk_turma_disciplina_disciplina_responsavel1_idx` (`cod_disciplina_responsavel`),
  KEY `fk_turma_disciplina_turma1_idx` (`cod_turma`),
  CONSTRAINT `fk_turma_disciplina_disciplina_responsavel1` FOREIGN KEY (`cod_disciplina_responsavel`) REFERENCES `disciplina_responsavel` (`cod_disciplina_responsavel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_disciplina_turma1` FOREIGN KEY (`cod_turma`) REFERENCES `turma` (`cod_turma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma_disciplina`
--

LOCK TABLES `turma_disciplina` WRITE;
/*!40000 ALTER TABLE `turma_disciplina` DISABLE KEYS */;
INSERT INTO `turma_disciplina` VALUES (1,'A',35,1),(2,'A',35,2),(3,'',35,3),(4,'',35,4),(5,'',35,5),(6,'',35,6),(7,'',37,1),(8,'',37,2),(9,'',37,3),(10,'',43,4),(11,'',43,5);
/*!40000 ALTER TABLE `turma_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `cod_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `cpf_usuario` varchar(14) NOT NULL,
  `senha_usuario` varchar(100) NOT NULL,
  `dataHora_registro` datetime NOT NULL,
  `nome_usuario` varchar(100) NOT NULL,
  `foto_usuario_perfil` varchar(100) DEFAULT NULL,
  `status_usuario` char(1) NOT NULL,
  `cod_tipo_usuario` int(11) NOT NULL,
  PRIMARY KEY (`cod_usuario`),
  UNIQUE KEY `cod_usuario_UNIQUE` (`cod_usuario`),
  UNIQUE KEY `cpf_usuario_UNIQUE` (`cpf_usuario`),
  KEY `fk_usuario_tipo_usuario_idx` (`cod_tipo_usuario`),
  CONSTRAINT `fk_usuario_tipo_usuario` FOREIGN KEY (`cod_tipo_usuario`) REFERENCES `tipo_usuario` (`cod_tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'123.123.123-40','$2y$12$hnoJTARiH6gyz9ZAK3J.GO3vuI4nDaTPtwxXMMwydboxmiZPjGdPW','2019-03-01 01:18:33','Aldo',NULL,'A',1),(2,'123.123.124-45','$2y$12$hnoJTARiH6gyz9ZAK3J.GO3vuI4nDaTPtwxXMMwydboxmiZPjGdPW','2019-03-01 01:18:33','Junior',NULL,'A',1),(3,'123.123.124-46','$2y$12$hnoJTARiH6gyz9ZAK3J.GO3vuI4nDaTPtwxXMMwydboxmiZPjGdPW','2019-03-01 01:18:33','Maria',NULL,'A',1),(5,'123.123.124-47','$2y$12$hnoJTARiH6gyz9ZAK3J.GO3vuI4nDaTPtwxXMMwydboxmiZPjGdPW','2019-03-01 01:18:33','Marina',NULL,'A',1),(6,'123.123.124-48','$2y$12$hnoJTARiH6gyz9ZAK3J.GO3vuI4nDaTPtwxXMMwydboxmiZPjGdPW','2019-03-01 01:18:33','Nathalia',NULL,'A',1),(7,'123.123.124-49','$2y$12$hnoJTARiH6gyz9ZAK3J.GO3vuI4nDaTPtwxXMMwydboxmiZPjGdPW','2019-03-01 01:18:33','Carlos',NULL,'A',1),(9,'123.123.124-50','$2y$12$hnoJTARiH6gyz9ZAK3J.GO3vuI4nDaTPtwxXMMwydboxmiZPjGdPW','2019-03-01 01:18:33','Guilherme',NULL,'A',1),(10,'123.123.124-51','$2y$12$hnoJTARiH6gyz9ZAK3J.GO3vuI4nDaTPtwxXMMwydboxmiZPjGdPW','2019-03-01 01:18:33','Janaina',NULL,'A',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-01  3:09:34

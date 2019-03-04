-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: notas
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.37-MariaDB

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'Berce','2001-08-29','123.234.123-40','123.564.897-40','(11) 4002-8922','Maria','A','06415-045','','123.098.987-40'),(2,'Matheus','2002-07-29','653.234.545-40','123.564.897-41','(11) 4002-8922','Maria','A','06415-045','','123.098.987-40'),(3,'Cleiton','2003-09-08','423.645.525-31','123.564.897-42','(11) 4002-8922','Maria','A','06415-045','','123.098.987-40'),(4,'Junior','2003-09-08','425.658.654-40','123.564.897-43','(11) 4002-8922','Maria','A','06415-045','','123.098.987-40'),(5,'Maria','2003-09-08','425.658.654-44','123.564.897-44','(11) 4002-8922','José','A','06415-045','','123.098.987-40'),(7,'Daniel','2003-09-08','425.658.654-45','123.564.897-45','(11) 4002-8922','José','A','06415-045','','123.098.987-40'),(8,'Vinicius','2003-09-08','425.658.654-46','123.564.897-46','(11) 4002-8922','José','A','06415-045','','123.098.987-40'),(9,'Leandro','2003-09-08','425.658.654-47','123.564.897-47','(11) 4002-8922','José','A','06415-045','','123.098.987-40'),(10,'Giovana','2003-09-08','425.658.654-48','123.564.897-48','(11) 4002-8922','José','A','06415-045','','123.098.987-40'),(11,'Liandra','2003-09-08','425.658.654-49','123.564.897-49','(11) 4002-8922','José','A','06415-045','','123.098.987-40'),(12,'Amanda','2003-09-08','425.658.654-50','123.564.897-49','(11) 4002-8922','José','A','06415-045','','123.098.987-40'),(13,'Ricardo','2003-09-08','425.658.654-51','123.564.897-49','(11) 4002-8922','José','A','06415-045','','123.098.987-40'),(14,'Gustavo','2003-09-08','425.658.654-52','123.564.897-49','(11) 4002-8922','José','A','06415-045','','123.098.987-40'),(15,'Sara','2003-09-08','425.658.654-53','123.564.897-49','(11) 4002-8922','José','A','06415-045','','123.098.987-40'),(16,'Marcos','2003-09-08','425.658.654-54','123.564.897-49','(11) 4002-8922','José','A','06415-045','','123.098.987-40'),(17,'Lucas','2003-09-08','425.658.654-55','123.564.897-49','(11) 4002-8922','José','A','06415-045','','123.098.987-40'),(18,'Jonathan','2003-09-08','425.658.654-56','123.564.897-49','(11) 4002-8922','José','A','06415-045','','123.098.987-40'),(19,'Ana','2003-09-08','425.658.654-57','123.564.897-49','(11) 4002-8922','José','A','06415-045','','123.098.987-40');
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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividades`
--

LOCK TABLES `atividades` WRITE;
/*!40000 ALTER TABLE `atividades` DISABLE KEYS */;
INSERT INTO `atividades` VALUES (1,'Prova Trimestral','1','1','0000-00-00 00:00:00','A',1),(2,'Trabalho','1','1','0000-00-00 00:00:00','A',1),(3,'Trabalho','1','1','0000-00-00 00:00:00','A',1),(4,'Participação','1','1','0000-00-00 00:00:00','A',1),(5,'Prova Trimestral','1','2','0000-00-00 00:00:00','A',1),(6,'Trabalho','1','2','0000-00-00 00:00:00','A',1),(7,'Trabalho','1','2','0000-00-00 00:00:00','A',1),(8,'Participação','1','2','0000-00-00 00:00:00','A',1),(9,'Prova Trimestral','1','3','0000-00-00 00:00:00','A',1),(10,'Trabalho','1','3','0000-00-00 00:00:00','A',1),(11,'Trabalho','1','3','0000-00-00 00:00:00','A',1),(12,'Participação','1','3','0000-00-00 00:00:00','A',1),(13,'Prova Trimestral','1','1','0000-00-00 00:00:00','A',13),(14,'Trabalho','1','1','0000-00-00 00:00:00','A',13),(15,'Trabalho','1','1','0000-00-00 00:00:00','A',13),(16,'Participação','1','1','0000-00-00 00:00:00','A',13),(17,'Prova Trimestral','1','2','0000-00-00 00:00:00','A',13),(18,'Lição de Casa','1','2','0000-00-00 00:00:00','A',13),(19,'Trabalho','1','2','0000-00-00 00:00:00','A',13),(20,'Participação','1','2','0000-00-00 00:00:00','A',13),(21,'Prova Trimestral','1','1','0000-00-00 00:00:00','A',6),(22,'Lição de Casa','1','1','0000-00-00 00:00:00','A',6),(23,'Trabalho','1','1','0000-00-00 00:00:00','A',6),(24,'Participação','1','1','0000-00-00 00:00:00','A',6),(25,'Prova Trimestral','1','2','0000-00-00 00:00:00','A',6),(26,'Lição de Casa','1','2','0000-00-00 00:00:00','A',6),(27,'Trabalho','1','2','0000-00-00 00:00:00','A',6),(28,'Participação','1','2','0000-00-00 00:00:00','A',6),(29,'Prova Trimestral','1','1','0000-00-00 00:00:00','A',5),(30,'Lição de Casa','1','1','0000-00-00 00:00:00','A',5),(31,'Trabalho','1','1','0000-00-00 00:00:00','A',5),(32,'Participação','1','1','0000-00-00 00:00:00','A',5),(33,'Prova Trimestral','1','2','0000-00-00 00:00:00','A',5),(34,'Lição de Casa','1','2','0000-00-00 00:00:00','A',5),(35,'Trabalho','1','2','0000-00-00 00:00:00','A',5),(36,'Participação','1','2','0000-00-00 00:00:00','A',5),(37,'Prova Trimestral','1','3','0000-00-00 00:00:00','A',5),(38,'Lição de Casa','1','3','0000-00-00 00:00:00','A',5),(39,'Trabalho','1','3','0000-00-00 00:00:00','A',5),(40,'Participação','1','3','0000-00-00 00:00:00','A',5),(41,'Prova Trimestral','1','4','0000-00-00 00:00:00','A',5),(42,'Lição de Casa','1','4','0000-00-00 00:00:00','A',5),(43,'Trabalho','1','4','0000-00-00 00:00:00','A',5),(44,'Participação','1','4','0000-00-00 00:00:00','A',5),(45,'Prova Bimestral','1','1','0000-00-00 00:00:00','A',4),(46,'Lição de Casa','1','1','0000-00-00 00:00:00','A',4),(47,'Trabalho','1','1','0000-00-00 00:00:00','A',4),(48,'Participação','1','1','0000-00-00 00:00:00','A',4),(49,'Prova Bimestral','1','2','0000-00-00 00:00:00','A',4),(50,'Lição de Casa','1','2','0000-00-00 00:00:00','A',4),(51,'Trabalho','1','2','0000-00-00 00:00:00','A',4),(52,'Participação','1','2','0000-00-00 00:00:00','A',4),(53,'Prova Bimestral','1','3','0000-00-00 00:00:00','A',4),(54,'Lição de Casa','1','3','0000-00-00 00:00:00','A',4),(55,'Trabalho','1','3','0000-00-00 00:00:00','A',4),(56,'Participação','1','3','0000-00-00 00:00:00','A',4),(57,'Prova Bimestral','1','4','0000-00-00 00:00:00','A',4),(58,'Lição de Casa','1','4','0000-00-00 00:00:00','A',4),(59,'Trabalho','1','4','0000-00-00 00:00:00','A',4),(60,'Participação','1','4','0000-00-00 00:00:00','A',4),(61,'Prova Trimestral','1','1','0000-00-00 00:00:00','A',3),(62,'Lição de Casa','1','1','0000-00-00 00:00:00','A',3),(63,'Trabalho','1','1','0000-00-00 00:00:00','A',3),(64,'Participação','1','1','0000-00-00 00:00:00','A',3),(65,'Prova Trimestral','1','2','0000-00-00 00:00:00','A',3),(66,'Lição de Casa','1','2','0000-00-00 00:00:00','A',3),(67,'Trabalho','1','2','0000-00-00 00:00:00','A',3),(68,'Participação','1','2','0000-00-00 00:00:00','A',3),(69,'Prova Trimestral','1','3','0000-00-00 00:00:00','A',3),(70,'Lição de Casa','1','3','0000-00-00 00:00:00','A',3),(71,'Trabalho','1','3','0000-00-00 00:00:00','A',3),(72,'Participação','1','3','0000-00-00 00:00:00','A',3),(73,'Prova Trimestral','1','1','0000-00-00 00:00:00','A',2),(74,'Lição de Casa','1','1','0000-00-00 00:00:00','A',2),(75,'Trabalho','1','1','0000-00-00 00:00:00','A',2),(76,'Participação','1','1','0000-00-00 00:00:00','A',2),(77,'Prova Trimestral','1','2','0000-00-00 00:00:00','A',2),(78,'Lição de Casa','1','2','0000-00-00 00:00:00','A',2),(79,'Trabalho','1','2','0000-00-00 00:00:00','A',2),(80,'Participação','1','2','0000-00-00 00:00:00','A',2),(81,'Prova Trimestral','1','3','0000-00-00 00:00:00','A',2),(82,'Lição de Casa','1','3','0000-00-00 00:00:00','A',2),(83,'Trabalho','1','3','0000-00-00 00:00:00','A',2),(84,'Participação','1','3','0000-00-00 00:00:00','A',2),(85,'Prova Trimestral','1','1','0000-00-00 00:00:00','A',7),(86,'Lição de Casa','1','1','0000-00-00 00:00:00','A',7),(87,'Trabalho','1','1','0000-00-00 00:00:00','A',7),(88,'Participação','1','1','0000-00-00 00:00:00','A',7),(89,'Prova Trimestral','1','2','0000-00-00 00:00:00','A',7),(90,'Lição de Casa','1','2','0000-00-00 00:00:00','A',7),(91,'Trabalho','1','2','0000-00-00 00:00:00','A',7),(92,'Participação','1','2','0000-00-00 00:00:00','A',7),(93,'Prova Trimestral','1','3','0000-00-00 00:00:00','A',7),(94,'Lição de Casa','1','3','0000-00-00 00:00:00','A',7),(95,'Trabalho','1','3','0000-00-00 00:00:00','A',7),(96,'Participação','1','3','0000-00-00 00:00:00','A',7),(97,'Prova Trimestral','1','1','0000-00-00 00:00:00','A',8),(98,'Lição de Casa','1','1','0000-00-00 00:00:00','A',8),(99,'Trabalho','1','1','0000-00-00 00:00:00','A',8),(100,'Participação','1','1','0000-00-00 00:00:00','A',8),(101,'Prova Trimestral','1','2','0000-00-00 00:00:00','A',8),(102,'Lição de Casa','1','2','0000-00-00 00:00:00','A',8),(103,'Trabalho','1','2','0000-00-00 00:00:00','A',8),(104,'Participação','1','2','0000-00-00 00:00:00','A',8),(105,'Prova Trimestral','1','3','0000-00-00 00:00:00','A',8),(106,'Lição de Casa','1','3','0000-00-00 00:00:00','A',8),(107,'Trabalho','1','3','0000-00-00 00:00:00','A',8),(108,'Participação','1','3','0000-00-00 00:00:00','A',8),(109,'Prova Trimestral','1','1','0000-00-00 00:00:00','A',9),(110,'Lição de Casa','1','1','0000-00-00 00:00:00','A',9),(111,'Trabalho','1','1','0000-00-00 00:00:00','A',9),(112,'Participação','1','1','0000-00-00 00:00:00','A',9),(113,'Prova Trimestral','1','2','0000-00-00 00:00:00','A',9),(114,'Lição de Casa','1','2','0000-00-00 00:00:00','A',9),(115,'Trabalho','1','2','0000-00-00 00:00:00','A',9),(116,'Participação','1','2','0000-00-00 00:00:00','A',9),(117,'Prova Trimestral','1','3','0000-00-00 00:00:00','A',9),(118,'Lição de Casa','1','3','0000-00-00 00:00:00','A',9),(119,'Trabalho','1','3','0000-00-00 00:00:00','A',9),(120,'Participação','1','3','0000-00-00 00:00:00','A',9),(121,'Prova Trimestral','1','3','0000-00-00 00:00:00','A',13),(122,'Lição de Casa','1','3','0000-00-00 00:00:00','A',13),(123,'Trabalho','1','3','0000-00-00 00:00:00','A',13),(124,'Participação','1','3','0000-00-00 00:00:00','A',13),(125,'Prova Trimestral','1','1','0000-00-00 00:00:00','A',14),(126,'Lição de Casa','1','1','0000-00-00 00:00:00','A',14),(127,'Trabalho','1','1','0000-00-00 00:00:00','A',14),(128,'Participação','1','1','0000-00-00 00:00:00','A',14),(129,'Prova Trimestral','1','2','0000-00-00 00:00:00','A',14),(130,'Lição de Casa','1','2','0000-00-00 00:00:00','A',14),(131,'Trabalho','1','2','0000-00-00 00:00:00','A',14),(132,'Participação','1','2','0000-00-00 00:00:00','A',14),(133,'Prova Trimestral','1','3','0000-00-00 00:00:00','A',14),(134,'Lição de Casa','1','3','0000-00-00 00:00:00','A',14),(135,'Trabalho','1','3','0000-00-00 00:00:00','A',14),(136,'Participação','1','3','0000-00-00 00:00:00','A',14),(137,'Prova Trimestral','1','1','0000-00-00 00:00:00','A',15),(138,'Lição de Casa','1','1','0000-00-00 00:00:00','A',15),(139,'Trabalho','1','1','0000-00-00 00:00:00','A',15),(140,'Participação','1','1','0000-00-00 00:00:00','A',15),(141,'Prova Trimestral','1','2','0000-00-00 00:00:00','A',15),(142,'Lição de Casa','1','2','0000-00-00 00:00:00','A',15),(143,'Trabalho','1','2','0000-00-00 00:00:00','A',15),(144,'Participação','1','2','0000-00-00 00:00:00','A',15),(145,'Prova Trimestral','1','3','0000-00-00 00:00:00','A',15),(146,'Lição de Casa','1','3','0000-00-00 00:00:00','A',15),(147,'Trabalho','1','3','0000-00-00 00:00:00','A',15),(148,'Participação','1','3','0000-00-00 00:00:00','A',15),(149,'Prova Trimestral','1','4','0000-00-00 00:00:00','A',15),(150,'Lição de Casa','1','4','0000-00-00 00:00:00','A',15),(151,'Trabalho','1','4','0000-00-00 00:00:00','A',15),(152,'Participação','1','4','0000-00-00 00:00:00','A',15),(153,'Prova Bimestral','1','1','0000-00-00 00:00:00','A',16),(154,'Lição de Casa','1','1','0000-00-00 00:00:00','A',16),(155,'Trabalho','1','1','0000-00-00 00:00:00','A',16),(156,'Participação','1','1','0000-00-00 00:00:00','A',16),(157,'Prova Bimestral','1','2','0000-00-00 00:00:00','A',16),(158,'Lição de Casa','1','2','0000-00-00 00:00:00','A',16),(159,'Trabalho','1','2','0000-00-00 00:00:00','A',16),(160,'Participação','1','2','0000-00-00 00:00:00','A',16),(161,'Prova Bimestral','1','3','0000-00-00 00:00:00','A',16),(162,'Lição de Casa','1','3','0000-00-00 00:00:00','A',16),(163,'Trabalho','1','3','0000-00-00 00:00:00','A',16),(164,'Participação','1','3','0000-00-00 00:00:00','A',16),(165,'Prova Bimestral','1','4','0000-00-00 00:00:00','A',16),(166,'Lição de Casa','1','4','0000-00-00 00:00:00','A',16),(167,'Trabalho','1','4','0000-00-00 00:00:00','A',16),(168,'Participação','1','4','0000-00-00 00:00:00','A',16);
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
INSERT INTO `disciplina_responsavel` VALUES (35,'A',1,1),(36,'A',2,1),(37,'A',1,2),(38,'A',2,3),(39,'A',3,4),(40,'A',3,5),(41,'A',5,5),(42,'A',5,6),(43,'A',6,7);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (1,'2019-03-01 01:40:12','I',1,1),(2,'2019-03-01 01:40:12','A',1,2),(3,'2019-03-01 01:40:12','A',1,3),(4,'2019-03-01 01:40:12','A',6,4),(5,'2019-03-01 01:40:12','A',6,5),(6,'2019-03-01 01:40:12','A',6,7),(7,'2019-03-01 01:40:12','A',2,8),(8,'2019-03-01 01:40:12','A',2,9),(9,'2019-03-01 01:40:12','A',2,10),(10,'2019-03-01 01:40:12','A',3,11),(11,'2019-03-01 01:40:12','A',3,12),(12,'2019-03-01 01:40:12','A',3,13),(13,'2019-03-01 01:40:12','A',4,14),(14,'2019-03-01 01:40:12','A',4,15),(15,'2019-03-01 01:40:12','A',4,16),(16,'2019-03-01 01:40:12','A',5,17),(17,'2019-03-01 01:40:12','A',5,18),(18,'2019-03-01 01:40:12','A',5,19);
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
) ENGINE=InnoDB AUTO_INCREMENT=509 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,'6.5',1,1),(2,'4',1,2),(3,'6',1,3),(4,'8',1,4),(5,'5',1,5),(6,'2',1,6),(7,'0',1,7),(8,'4',1,8),(9,'9',1,9),(10,'8',1,10),(11,'10',1,11),(12,'5',1,12),(29,'10',3,1),(30,'0',3,2),(31,'0',3,3),(32,'0',3,4),(33,'9',3,5),(34,'8.5',3,6),(35,'4',3,7),(36,'9',3,8),(37,'4.5',3,9),(38,'9',3,10),(39,'2.4',3,11),(40,'10',3,12),(45,'8',2,1),(46,'6',2,2),(47,'9',2,3),(48,'2',2,4),(49,'10',2,5),(50,'10',2,6),(51,'6',2,7),(52,'7',2,8),(53,'7',2,9),(54,'6',2,10),(55,'7',2,11),(56,'5',2,12),(57,'10',4,1),(58,'5',4,2),(59,'6',4,3),(60,'7',4,4),(61,'3',4,5),(62,'6',4,6),(63,'9',4,7),(64,'0',4,8),(65,'4',3,13),(66,'5',3,14),(67,'7',3,15),(68,'10',3,16),(69,'5',2,13),(70,'6',2,14),(71,'5',2,15),(72,'10',2,16),(73,'5',2,17),(74,'6',2,18),(75,'8',2,19),(76,'7',2,20),(77,'10',6,21),(78,'10',6,22),(79,'10',6,23),(80,'10',6,24),(81,'10',6,25),(82,'10',6,26),(83,'10',6,27),(84,'10',6,28),(85,'9',13,53),(86,'4',13,54),(87,'6',13,55),(88,'5',13,56),(89,'9',13,49),(90,'4',13,50),(91,'5',13,51),(92,'6',13,52),(93,'10',13,45),(94,'4',13,46),(95,'5',13,47),(96,'6',13,48),(97,'8',11,61),(98,'5',11,62),(99,'8',11,63),(100,'4',11,64),(101,'10',9,73),(102,'8.2',9,74),(103,'8',9,75),(104,'10',9,76),(105,'10',3,85),(106,'0',3,86),(107,'5',3,87),(108,'10',3,88),(109,'10',4,25),(110,'10',4,26),(111,'5',4,27),(112,'6',4,28),(113,'8',5,25),(114,'4',5,26),(115,'9',5,27),(116,'5',5,28),(117,'10',2,85),(118,'9',2,86),(119,'8',2,87),(120,'6',2,88),(121,'10',9,97),(122,'5',9,98),(123,'5',9,99),(124,'10',9,100),(125,'5',7,97),(126,'2',7,98),(127,'10',7,99),(128,'10',7,100),(129,'10',11,109),(130,'10',11,110),(131,'10',11,111),(132,'5',11,112),(133,'10',9,125),(134,'10',9,126),(135,'10',9,127),(136,'10',9,128),(137,'5',13,137),(138,'10',13,138),(139,'5',13,139),(140,'9',13,140),(141,'8.5',18,153),(142,'9.5',18,154),(143,'7',18,155),(144,'10',18,156),(145,'5',3,17),(146,'7.5',3,18),(147,'5',3,19),(148,'6',3,20),(149,'10',4,21),(150,'10',4,22),(151,'0',4,23),(152,'10',4,24),(153,'10',3,89),(154,'5',3,90),(155,'10',3,91),(156,'10',3,92),(157,'7',3,93),(158,'10',3,94),(159,'5',3,95),(160,'6',3,96),(161,'10',2,93),(162,'6',2,94),(163,'7',2,95),(164,'5',2,96),(165,'5',2,89),(166,'6',2,90),(167,'6',2,91),(168,'6',2,92),(169,'6',3,121),(170,'7',3,122),(171,'6',3,123),(172,'8',3,124),(173,'10',2,121),(174,'8',2,122),(175,'6',2,123),(176,'10',2,124),(177,'10',18,157),(178,'10',18,158),(179,'10',18,159),(180,'10',18,160),(181,'5',18,161),(182,'6',18,162),(183,'6',18,163),(184,'7.5',18,164),(185,'5',18,165),(186,'7',18,166),(187,'6',18,167),(188,'8',18,168),(189,'8',17,165),(190,'7',17,166),(191,'9',17,167),(192,'6',17,168),(193,'10',17,161),(194,'6',17,162),(195,'5',17,163),(196,'8',17,164),(197,'4',17,157),(198,'6',17,158),(199,'5',17,159),(200,'6',17,160),(201,'10',17,153),(202,'4',17,154),(203,'10',17,155),(204,'5',17,156),(205,'3',16,153),(206,'6',16,154),(207,'7',16,155),(208,'7',16,156),(209,'2',16,157),(210,'6',16,158),(211,'6',16,159),(212,'5',16,160),(213,'8',16,161),(214,'8',16,162),(215,'9',16,163),(216,'9',16,164),(217,'10',16,165),(218,'10',16,166),(219,'8',16,167),(220,'10',16,168),(221,'5',13,141),(222,'5',13,142),(223,'6',13,143),(224,'10',13,144),(225,'7',13,145),(226,'8',13,146),(227,'8',13,147),(228,'10',13,148),(229,'8',13,149),(230,'6',13,150),(231,'6',13,151),(232,'10',13,152),(233,'10',15,149),(234,'6',15,150),(235,'5',15,151),(236,'7',15,152),(237,'5',15,137),(238,'6',15,138),(239,'4',15,139),(240,'5',15,140),(241,'6',15,141),(242,'10',15,142),(243,'8',15,143),(244,'10',15,144),(245,'7',15,145),(246,'10',15,146),(247,'10',15,147),(248,'10',15,148),(249,'5',14,145),(250,'4',14,146),(251,'6',14,147),(252,'10',14,148),(253,'10',14,141),(254,'6',14,142),(255,'5',14,143),(256,'6',14,144),(257,'8',14,149),(258,'1',14,150),(259,'5',14,151),(260,'10',14,152),(261,'10',14,137),(262,'6',14,138),(263,'5',14,139),(264,'10',14,140),(265,'10',9,133),(266,'10',9,134),(267,'10',9,135),(268,'10',9,136),(269,'10',9,129),(270,'10',9,130),(271,'10',9,131),(272,'10',9,132),(273,'8',8,125),(274,'10',8,126),(275,'1',8,127),(276,'9',8,128),(277,'10',8,129),(278,'9',8,130),(279,'8',8,131),(280,'10',8,132),(281,'10',8,133),(282,'10',8,134),(283,'10',8,135),(284,'10',8,136),(285,'5',7,133),(286,'10',7,134),(287,'6',7,135),(288,'10',7,136),(289,'10',7,129),(290,'5',7,130),(291,'10',7,131),(292,'5',7,132),(293,'6',7,125),(294,'8',7,126),(295,'10',7,127),(296,'8',7,128),(297,'0',5,21),(298,'10',5,22),(299,'5',5,23),(300,'10',5,24),(301,'8',18,29),(302,'4',18,30),(303,'6',18,31),(304,'0',18,32),(305,'10',18,33),(306,'4',18,34),(307,'5',18,35),(308,'10',18,36),(309,'7',18,37),(310,'10',18,38),(311,'5',18,39),(312,'5',18,40),(313,'8',18,41),(314,'10',18,42),(315,'7',18,43),(316,'8',18,44),(317,'10',17,29),(318,'5',17,30),(319,'5',17,31),(320,'10',17,32),(321,'5',17,33),(322,'6',17,34),(323,'6',17,35),(324,'8',17,36),(325,'5',17,37),(326,'10',17,38),(327,'6',17,39),(328,'6',17,40),(329,'10',17,41),(330,'7',17,42),(331,'8',17,43),(332,'10',17,44),(333,'1',16,29),(334,'5',16,30),(335,'3',16,31),(336,'6',16,32),(337,'5',16,33),(338,'4',16,34),(339,'6',16,35),(340,'4',16,36),(341,'4',16,37),(342,'5',16,38),(343,'6',16,39),(344,'6',16,40),(345,'5',16,41),(346,'7',16,42),(347,'6',16,43),(348,'7',16,44),(349,'7',13,57),(350,'8',13,58),(351,'8',13,59),(352,'8',13,60),(353,'10',15,49),(354,'9',15,50),(355,'10',15,51),(356,'10',15,52),(357,'10',15,53),(358,'9',15,54),(359,'9',15,55),(360,'9',15,56),(361,'9',15,57),(362,'9',15,58),(363,'9',15,59),(364,'5',15,60),(365,'10',15,45),(366,'9.5',15,46),(367,'10',15,47),(368,'10',15,48),(369,'10',14,45),(370,'10',14,46),(371,'10',14,47),(372,'10',14,48),(373,'8',14,49),(374,'7',14,50),(375,'9',14,51),(376,'10',14,52),(377,'10',14,53),(378,'9',14,54),(379,'10',14,55),(380,'8',14,56),(381,'8',14,57),(382,'8',14,58),(383,'9',14,59),(384,'8',14,60),(385,'3',11,65),(386,'6',11,66),(387,'7',11,67),(388,'8',11,68),(389,'4',11,69),(390,'8',11,70),(391,'6',11,71),(392,'8',11,72),(393,'8',10,69),(394,'7',10,70),(395,'9',10,71),(396,'8',10,72),(397,'7',10,65),(398,'3',10,66),(399,'1',10,67),(400,'5',10,68),(401,'10',10,61),(402,'9',10,62),(403,'8',10,63),(404,'10',10,64),(405,'8',12,61),(406,'7',12,62),(407,'7',12,63),(408,'4',12,64),(409,'4',12,65),(410,'5.5',12,66),(411,'4',12,67),(412,'5',12,68),(413,'8',12,69),(414,'9',12,70),(415,'9',12,71),(416,'8',12,72),(417,'5',7,73),(418,'8',7,74),(419,'6',7,75),(420,'8',7,76),(421,'8',7,77),(422,'10',7,78),(423,'9',7,79),(424,'5',7,80),(425,'8',7,81),(426,'9',7,82),(427,'8',7,83),(428,'10',7,84),(429,'8',8,81),(430,'10',8,82),(431,'5',8,83),(432,'4',8,84),(433,'5.5',8,77),(434,'6.4',8,78),(435,'5',8,79),(436,'10',8,80),(437,'10',8,73),(438,'5',8,74),(439,'10',8,75),(440,'5',8,76),(441,'8',9,77),(442,'7.5',9,78),(443,'9',9,79),(444,'8',9,80),(445,'7',9,81),(446,'8',9,82),(447,'8',9,83),(448,'9',9,84),(449,'7',9,101),(450,'8',9,102),(451,'8',9,103),(452,'8',9,104),(453,'9',9,105),(454,'7',9,106),(455,'7',9,107),(456,'8',9,108),(457,'10',8,105),(458,'5',8,106),(459,'4',8,107),(460,'10',8,108),(461,'10',8,101),(462,'10',8,102),(463,'10',8,103),(464,'10',8,104),(465,'4',8,97),(466,'8',8,98),(467,'5',8,99),(468,'8',8,100),(469,'8',7,101),(470,'8',7,102),(471,'8',7,103),(472,'7',7,104),(473,'10',7,105),(474,'5',7,106),(475,'4',7,107),(476,'10',7,108),(477,'10',11,113),(478,'9',11,114),(479,'10',11,115),(480,'10',11,116),(481,'10',11,117),(482,'9',11,118),(483,'9',11,119),(484,'9.5',11,120),(485,'8',10,109),(486,'8',10,110),(487,'8',10,111),(488,'8',10,112),(489,'10',10,113),(490,'5',10,114),(491,'7',10,115),(492,'10',10,116),(493,'10',10,117),(494,'8',10,118),(495,'7',10,119),(496,'10',10,120),(497,'10',12,117),(498,'4',12,118),(499,'6',12,119),(500,'5',12,120),(501,'10',12,113),(502,'6',12,114),(503,'5',12,115),(504,'10',12,116),(505,'10',12,109),(506,'10',12,110),(507,'10',12,111),(508,'5',12,112);
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
INSERT INTO `periodo` VALUES (1,'A','Semestre'),(2,'A','Bimestre'),(3,'A','Trimestre');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma_disciplina`
--

LOCK TABLES `turma_disciplina` WRITE;
/*!40000 ALTER TABLE `turma_disciplina` DISABLE KEYS */;
INSERT INTO `turma_disciplina` VALUES (1,'A',35,1),(2,'A',35,2),(3,'A',35,3),(4,'A',35,4),(5,'A',35,5),(6,'A',35,6),(7,'A',37,1),(8,'A',37,2),(9,'A',37,3),(10,'A',43,4),(11,'A',43,5),(13,'A',38,1),(14,'A',38,2),(15,'A',38,4),(16,'A',38,5);
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
INSERT INTO `usuario` VALUES (1,'123.123.123-40','$2y$12$hnoJTARiH6gyz9ZAK3J.GO3vuI4nDaTPtwxXMMwydboxmiZPjGdPW','2019-03-01 01:18:33','Aldo',NULL,'A',1),(2,'123.123.124-45','$2y$12$hnoJTARiH6gyz9ZAK3J.GO3vuI4nDaTPtwxXMMwydboxmiZPjGdPW','2019-03-01 01:18:33','Junior',NULL,'A',1),(3,'123.123.124-46','$2y$12$hnoJTARiH6gyz9ZAK3J.GO3vuI4nDaTPtwxXMMwydboxmiZPjGdPW','2019-03-01 01:18:33','Maria',NULL,'A',1),(5,'123.123.124-47','$2y$12$hnoJTARiH6gyz9ZAK3J.GO3vuI4nDaTPtwxXMMwydboxmiZPjGdPW','2019-03-01 01:18:33','Marina',NULL,'A',1),(6,'123.123.124-48','$2y$12$hnoJTARiH6gyz9ZAK3J.GO3vuI4nDaTPtwxXMMwydboxmiZPjGdPW','2019-03-01 01:18:33','Nathalia',NULL,'A',1),(7,'123.123.124-49','$2y$12$hnoJTARiH6gyz9ZAK3J.GO3vuI4nDaTPtwxXMMwydboxmiZPjGdPW','2019-03-01 01:18:33','Carlos',NULL,'A',1),(9,'123.123.124-50','$2y$12$hnoJTARiH6gyz9ZAK3J.GO3vuI4nDaTPtwxXMMwydboxmiZPjGdPW','2019-03-01 01:18:33','Guilherme',NULL,'A',1),(10,'123.123.124-51','$2y$12$hnoJTARiH6gyz9ZAK3J.GO3vuI4nDaTPtwxXMMwydboxmiZPjGdPW','2019-03-01 01:18:33','Janaina',NULL,'A',3);
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

-- Dump completed on 2019-03-04  1:25:39

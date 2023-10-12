-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bienesraices_crud
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `propiedades`
--

DROP TABLE IF EXISTS `propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `descripcion` longtext,
  `habitaciones` int DEFAULT NULL,
  `wc` int DEFAULT NULL,
  `estacionamiento` int DEFAULT NULL,
  `creado` date DEFAULT NULL,
  `vendedorId` int NOT NULL,
  PRIMARY KEY (`id`,`vendedorId`),
  KEY `fk_propiedades_vendedores_idx` (`vendedorId`),
  CONSTRAINT `fk_propiedades_vendedores` FOREIGN KEY (`vendedorId`) REFERENCES `vendedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades`
--

LOCK TABLES `propiedades` WRITE;
/*!40000 ALTER TABLE `propiedades` DISABLE KEYS */;
INSERT INTO `propiedades` VALUES (5,'Casa en la montaña (IMG x2)',1200000.00,'9a89405685695e8143fedac3a4ce9238.jpg','Casa en la montaña con excelente vista y paisajes Casa en la montaña con excelente vista y paisajes Casa en la montaña con excelente vista y paisajes Casa en la montaña con excelente vista y paisajes Casa en la montaña con excelente vista y paisajes',3,2,1,'2023-06-09',1),(6,'Casa en el campo de flores ',1200000.00,'32b77b991e58ae16a37cef829fad4a77.jpg','Hermosa casa en el campo muy bonita Hermosa casa en el campo muy bonita Hermosa casa en el campo muy bonita Hermosa casa en el campo muy bonita',5,2,2,'2023-06-09',2),(11,'Cabaña en el bosque  (ACTUALIZADO)',1900000.00,'27ddff297b5817bd467e2c4169ce119b.jpg','Cabaña en el bosque  Cabaña en el bosque  Cabaña en el bosque  Cabaña en el bosque  Cabaña en el bosque  Cabaña en el bosque  Cabaña en el bosque  Cabaña en el bosque (ACTUALIZADO)',5,3,2,'2023-06-16',2),(12,'Casa en el centro de la ciudad (ACTUALIZADO)',2500000.00,'c57782844ba9515c7ccae3cf51ea26d6.jpg','Casa en el centro de la ciudad Casa en el centro de la ciudad Casa en el centro de la ciudad Casa en el centro de la ciudad Casa en el centro de la ciudad Casa en el centro de la ciudad Casa en el centro de la ciudad (ACTUALIZADO)',4,2,1,'2023-06-16',1),(13,'Casa nueva en el campo',100000.00,'d0c0134f4471c45cbdb793288936758a.jpg','Casa nueva en el campoCasa nueva en el campoCasa nueva en el campoCasa nueva en el campoCasa nueva en el campoCasa nueva en el campoCasa nueva en el campoCasa nueva en el campo',2,2,1,'2023-08-26',1),(16,' Casa en la playa animee',1200000.00,'5770d0b6581a8873c1fcc9a57e30caa2.jpg','Casa en la playa animeeCasa en la playa animeeCasa en la playa animeeCasa en la playa animeeCasa en la playa animeeCasa en la playa animeeCasa en la playa animeeCasa en la playa animee',5,2,1,'2023-08-29',2),(17,' Casa rustica nueva',990000.00,'ebb97c4fd594a5fa11b4be9a3fa4c582.jpg','Casa rustica nuevaCasa rustica nuevaCasa rustica nuevaCasa rustica nuevaCasa rustica nuevaCasa rustica nuevaCasa rustica nuevaCasa rustica nuevaCasa rustica nuevaCasa rustica nueva',4,2,1,'2023-08-31',1),(19,' Casa futurista en la ciudad',2000000.00,'338b86f444a94bd50d4e9c597fe9c659.jpg','Casa futuristaCasa futuristaCasa futuristaCasa futuristaCasa futuristaCasa futuristaCasa futuristaCasa futurista',6,4,3,'2023-09-09',1),(20,' Casa del futuro en el bosque',5000000.00,'506a0f561b3db34cdb548d0e21a0e3ce.jpg','Casa del futuro en el bosqueCasa del futuro en el bosqueCasa del futuro en el bosqueCasa del futuro en el bosqueCasa del futuro en el bosque',8,5,3,'2023-09-13',1),(21,' Casa con alberca MVC',1000000.00,'8109698e6e70c80606424884632f0a8b.jpg','Casa con alberca MVCCasa con alberca MVCCasa con alberca MVCCasa con alberca MVCCasa con alberca MVCCasa con alberca MVCCasa con alberca MVCCasa con alberca MVC',2,2,2,'2023-10-02',3),(26,' Casa flotante  ACTUALIZADO CON MVC1',123000.00,'4e42b08135ec9e19237d1de6b808f606.jpg','Casa flotante MVC Casa flotante MVC Casa flotante MVC Casa flotante MVC Casa flotante MVC Casa flotante MVC Casa flotante MVC ',3,2,2,'2023-10-02',4),(28,' OTRA CASA ACTUALIZADA MVC',1234667.00,'2b7e53347b13c956d2f1d3853242caf1.jpg','OTRA CASA MVCOTRA CASA MVCOTRA CASA MVCOTRA CASA MVCOTRA CASA MVCOTRA CASA MVC',2,2,2,'2023-10-02',2),(30,' CASA MVC  ACTx3',999000.00,'b3bf829c34680ed6369f0bae59fe7585.jpg','CASA MVC CASA MVC CASA MVC CASA MVC CASA MVC CASA MVC CASA MVC CASA MVC CASA MVC CASA MVC CASA MVC CASA MVC CASA MVC ',3,3,3,'2023-10-03',4);
/*!40000 ALTER TABLE `propiedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` char(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'correo@correo.com','$2y$10$M66g2vLaoA4h7KkilUzBbubcJ02oifN5bnGSqVYkgXu.sGEd029pS');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'Roger D.','Olivera','9513338438'),(2,'Gerardo','Ruiz','9511234567'),(3,'PEDRO','RAMOS','9511234567'),(4,'LEON','FUENTES','9511234567');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-12 16:03:24

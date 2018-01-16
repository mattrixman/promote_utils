-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: test_meta
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `app_metered_event`
--

DROP TABLE IF EXISTS `app_metered_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_metered_event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(13) CHARACTER SET latin1 NOT NULL,
  `merchant_app_id` bigint(20) unsigned NOT NULL,
  `app_metered_id` bigint(20) unsigned NOT NULL,
  `count` bigint(20) unsigned NOT NULL,
  `charge_id` bigint(20) unsigned DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `merchant_app_id` (`merchant_app_id`),
  KEY `app_metered_id` (`app_metered_id`),
  KEY `app_line_item_id` (`charge_id`),
  CONSTRAINT `app_metered_event_ibfk_1` FOREIGN KEY (`merchant_app_id`) REFERENCES `merchant_app` (`id`),
  CONSTRAINT `app_metered_event_ibfk_2` FOREIGN KEY (`app_metered_id`) REFERENCES `app_metered` (`id`),
  CONSTRAINT `app_metered_event_ibfk_3` FOREIGN KEY (`charge_id`) REFERENCES `charge` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_metered_event`
--

LOCK TABLES `app_metered_event` WRITE;
/*!40000 ALTER TABLE `app_metered_event` DISABLE KEYS */;
INSERT INTO `app_metered_event` VALUES (56,'83PC5E8J1878C',449,108,1,NULL,'2017-10-01 00:00:00','2018-01-16 19:14:48');
/*!40000 ALTER TABLE `app_metered_event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-16 19:30:23

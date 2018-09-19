-- MySQL dump 10.16  Distrib 10.3.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: que-udh
-- ------------------------------------------------------
-- Server version	10.3.9-MariaDB-1:10.3.9+maria~bionic

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
-- Current Database: `que-udh`
--

-- CREATE DATABASE /*!32312 IF NOT EXISTS*/ `que-udh` /*!40100 DEFAULT CHARACTER SET utf8 */;

-- USE `que-udh`;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`) USING BTREE,
  KEY `auth_assignment_user_id_idx` (`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('Admin','1',1533308475),('App','1',1533348532),('แก้ไขข้อมูลส่วนตัว','1',1534942904);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  KEY `rule_name` (`rule_name`) USING BTREE,
  KEY `idx-auth_item-type` (`type`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('/*',2,NULL,NULL,NULL,1533308310,1533308310),('/site/*',2,NULL,NULL,NULL,1533308319,1533308319),('/user/recovery/*',2,NULL,NULL,NULL,1533308338,1533308338),('/user/registration/*',2,NULL,NULL,NULL,1533308334,1533308334),('/user/security/*',2,NULL,NULL,NULL,1533308331,1533308331),('/user/settings/*',2,NULL,NULL,NULL,1533308327,1533308327),('Admin',1,NULL,NULL,NULL,1533308302,1533308302),('App',2,NULL,NULL,NULL,1533348018,1533348018),('User',1,NULL,NULL,NULL,1533308368,1533308368),('แก้ไขข้อมูลส่วนตัว',2,NULL,NULL,NULL,1533308443,1533308443);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`) USING BTREE,
  KEY `child` (`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('Admin','/*'),('App','/site/*'),('User','/site/*'),('User','/user/recovery/*'),('User','/user/registration/*'),('User','แก้ไขข้อมูลส่วนตัว'),('แก้ไขข้อมูลส่วนตัว','/user/settings/*');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_storage_item`
--

DROP TABLE IF EXISTS `file_storage_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_storage_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) NOT NULL,
  `base_url` varchar(1024) NOT NULL,
  `path` varchar(1024) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `upload_ip` varchar(15) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_storage_item`
--

LOCK TABLES `file_storage_item` WRITE;
/*!40000 ALTER TABLE `file_storage_item` DISABLE KEYS */;
INSERT INTO `file_storage_item` VALUES (1,'fileStorage','/uploads','1/_sNoCbHa4UWyoO8-SNU4O-cWjuPHXrv_.jpg','image/jpeg',135820,'_sNoCbHa4UWyoO8-SNU4O-cWjuPHXrv_','127.0.0.1',1533309163),(2,'fileStorage','/uploads','1/cEKpvlVn2FZt4pU5vcvblsDy3NmTglGr.jpg','image/jpeg',135820,'cEKpvlVn2FZt4pU5vcvblsDy3NmTglGr','127.0.0.1',1533309282),(3,'fileStorage','/uploads','1/4tO0GKNDnATccbJZXuv-mEVwFcBJm28F.jpg','image/jpeg',135820,'4tO0GKNDnATccbJZXuv-mEVwFcBJm28F','127.0.0.1',1533309293),(4,'fileStorage','/uploads','1/kbvSEXTPxEpGYXSwOdxzbW9LP0VOidb_.png','image/png',64092,'kbvSEXTPxEpGYXSwOdxzbW9LP0VOidb_','127.0.0.1',1534913374),(5,'fileStorage','/uploads','1/XhTxgx7eMKQpIKpqvbA9h7XD9WTt8IbO.png','image/png',64092,'XhTxgx7eMKQpIKpqvbA9h7XD9WTt8IbO','127.0.0.1',1534913678),(6,'fileStorage','/uploads','1/JFvKwmC0PqFEmwB1MGHgI4yEOkZxgvJ3.png','image/png',64092,'JFvKwmC0PqFEmwB1MGHgI4yEOkZxgvJ3','127.0.0.1',1534913877),(7,'fileStorage','/uploads','1/fcfSM-Cscw2wblEJwrxD25cqpYR8XbNr.png','image/png',64092,'fcfSM-Cscw2wblEJwrxD25cqpYR8XbNr','127.0.0.1',1534914027);
/*!40000 ALTER TABLE `file_storage_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icons`
--

DROP TABLE IF EXISTS `icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=676 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icons`
--

LOCK TABLES `icons` WRITE;
/*!40000 ALTER TABLE `icons` DISABLE KEYS */;
INSERT INTO `icons` VALUES (1,'glass','fa'),(2,'music','fa'),(3,'search','fa'),(4,'envelope-o','fa'),(5,'heart','fa'),(6,'star','fa'),(7,'star-o','fa'),(8,'user','fa'),(9,'film','fa'),(10,'th-large','fa'),(11,'th','fa'),(12,'th-list','fa'),(13,'check','fa'),(14,'times','fa'),(15,'search-plus','fa'),(16,'search-minus','fa'),(17,'power-off','fa'),(18,'signal','fa'),(19,'cog','fa'),(20,'trash-o','fa'),(21,'home','fa'),(22,'file-o','fa'),(23,'clock-o','fa'),(24,'road','fa'),(25,'download','fa'),(26,'arrow-circle-o-down','fa'),(27,'arrow-circle-o-up','fa'),(28,'inbox','fa'),(29,'play-circle-o','fa'),(30,'repeat','fa'),(31,'refresh','fa'),(32,'list-alt','fa'),(33,'lock','fa'),(34,'flag','fa'),(35,'headphones','fa'),(36,'volume-off','fa'),(37,'volume-down','fa'),(38,'volume-up','fa'),(39,'qrcode','fa'),(40,'barcode','fa'),(41,'tag','fa'),(42,'tags','fa'),(43,'book','fa'),(44,'bookmark','fa'),(45,'print','fa'),(46,'camera','fa'),(47,'font','fa'),(48,'bold','fa'),(49,'italic','fa'),(50,'text-height','fa'),(51,'text-width','fa'),(52,'align-left','fa'),(53,'align-center','fa'),(54,'align-right','fa'),(55,'align-justify','fa'),(56,'list','fa'),(57,'outdent','fa'),(58,'indent','fa'),(59,'video-camera','fa'),(60,'picture-o','fa'),(61,'pencil','fa'),(62,'map-marker','fa'),(63,'adjust','fa'),(64,'tint','fa'),(65,'pencil-square-o','fa'),(66,'share-square-o','fa'),(67,'check-square-o','fa'),(68,'arrows','fa'),(69,'step-backward','fa'),(70,'fast-backward','fa'),(71,'backward','fa'),(72,'play','fa'),(73,'pause','fa'),(74,'stop','fa'),(75,'forward','fa'),(76,'fast-forward','fa'),(77,'step-forward','fa'),(78,'eject','fa'),(79,'chevron-left','fa'),(80,'chevron-right','fa'),(81,'plus-circle','fa'),(82,'minus-circle','fa'),(83,'times-circle','fa'),(84,'check-circle','fa'),(85,'question-circle','fa'),(86,'info-circle','fa'),(87,'crosshairs','fa'),(88,'times-circle-o','fa'),(89,'check-circle-o','fa'),(90,'ban','fa'),(91,'arrow-left','fa'),(92,'arrow-right','fa'),(93,'arrow-up','fa'),(94,'arrow-down','fa'),(95,'share','fa'),(96,'expand','fa'),(97,'compress','fa'),(98,'plus','fa'),(99,'minus','fa'),(100,'asterisk','fa'),(101,'exclamation-circle','fa'),(102,'gift','fa'),(103,'leaf','fa'),(104,'fire','fa'),(105,'eye','fa'),(106,'eye-slash','fa'),(107,'exclamation-triangle','fa'),(108,'plane','fa'),(109,'calendar','fa'),(110,'random','fa'),(111,'comment','fa'),(112,'magnet','fa'),(113,'chevron-up','fa'),(114,'chevron-down','fa'),(115,'retweet','fa'),(116,'shopping-cart','fa'),(117,'folder','fa'),(118,'folder-open','fa'),(119,'arrows-v','fa'),(120,'arrows-h','fa'),(121,'bar-chart','fa'),(122,'twitter-square','fa'),(123,'facebook-square','fa'),(124,'camera-retro','fa'),(125,'key','fa'),(126,'cogs','fa'),(127,'comments','fa'),(128,'thumbs-o-up','fa'),(129,'thumbs-o-down','fa'),(130,'star-half','fa'),(131,'heart-o','fa'),(132,'sign-out','fa'),(133,'linkedin-square','fa'),(134,'thumb-tack','fa'),(135,'external-link','fa'),(136,'sign-in','fa'),(137,'trophy','fa'),(138,'github-square','fa'),(139,'upload','fa'),(140,'lemon-o','fa'),(141,'phone','fa'),(142,'square-o','fa'),(143,'bookmark-o','fa'),(144,'phone-square','fa'),(145,'twitter','fa'),(146,'facebook','fa'),(147,'github','fa'),(148,'unlock','fa'),(149,'credit-card','fa'),(150,'rss','fa'),(151,'hdd-o','fa'),(152,'bullhorn','fa'),(153,'bell','fa'),(154,'certificate','fa'),(155,'hand-o-right','fa'),(156,'hand-o-left','fa'),(157,'hand-o-up','fa'),(158,'hand-o-down','fa'),(159,'arrow-circle-left','fa'),(160,'arrow-circle-right','fa'),(161,'arrow-circle-up','fa'),(162,'arrow-circle-down','fa'),(163,'globe','fa'),(164,'wrench','fa'),(165,'tasks','fa'),(166,'filter','fa'),(167,'briefcase','fa'),(168,'arrows-alt','fa'),(169,'users','fa'),(170,'link','fa'),(171,'cloud','fa'),(172,'flask','fa'),(173,'scissors','fa'),(174,'files-o','fa'),(175,'paperclip','fa'),(176,'floppy-o','fa'),(177,'square','fa'),(178,'bars','fa'),(179,'list-ul','fa'),(180,'list-ol','fa'),(181,'strikethrough','fa'),(182,'underline','fa'),(183,'table','fa'),(184,'magic','fa'),(185,'truck','fa'),(186,'pinterest','fa'),(187,'pinterest-square','fa'),(188,'google-plus-square','fa'),(189,'google-plus','fa'),(190,'money','fa'),(191,'caret-down','fa'),(192,'caret-up','fa'),(193,'caret-left','fa'),(194,'caret-right','fa'),(195,'columns','fa'),(196,'sort','fa'),(197,'sort-desc','fa'),(198,'sort-asc','fa'),(199,'envelope','fa'),(200,'linkedin','fa'),(201,'undo','fa'),(202,'gavel','fa'),(203,'tachometer','fa'),(204,'comment-o','fa'),(205,'comments-o','fa'),(206,'bolt','fa'),(207,'sitemap','fa'),(208,'umbrella','fa'),(209,'clipboard','fa'),(210,'lightbulb-o','fa'),(211,'exchange','fa'),(212,'cloud-download','fa'),(213,'cloud-upload','fa'),(214,'user-md','fa'),(215,'stethoscope','fa'),(216,'suitcase','fa'),(217,'bell-o','fa'),(218,'coffee','fa'),(219,'cutlery','fa'),(220,'file-text-o','fa'),(221,'building-o','fa'),(222,'hospital-o','fa'),(223,'ambulance','fa'),(224,'medkit','fa'),(225,'fighter-jet','fa'),(226,'beer','fa'),(227,'h-square','fa'),(228,'plus-square','fa'),(229,'angle-double-left','fa'),(230,'angle-double-right','fa'),(231,'angle-double-up','fa'),(232,'angle-double-down','fa'),(233,'angle-left','fa'),(234,'angle-right','fa'),(235,'angle-up','fa'),(236,'angle-down','fa'),(237,'desktop','fa'),(238,'laptop','fa'),(239,'tablet','fa'),(240,'mobile','fa'),(241,'circle-o','fa'),(242,'quote-left','fa'),(243,'quote-right','fa'),(244,'spinner','fa'),(245,'circle','fa'),(246,'reply','fa'),(247,'github-alt','fa'),(248,'folder-o','fa'),(249,'folder-open-o','fa'),(250,'smile-o','fa'),(251,'frown-o','fa'),(252,'meh-o','fa'),(253,'gamepad','fa'),(254,'keyboard-o','fa'),(255,'flag-o','fa'),(256,'flag-checkered','fa'),(257,'terminal','fa'),(258,'code','fa'),(259,'reply-all','fa'),(260,'star-half-o','fa'),(261,'location-arrow','fa'),(262,'crop','fa'),(263,'code-fork','fa'),(264,'chain-broken','fa'),(265,'question','fa'),(266,'info','fa'),(267,'exclamation','fa'),(268,'superscript','fa'),(269,'subscript','fa'),(270,'eraser','fa'),(271,'puzzle-piece','fa'),(272,'microphone','fa'),(273,'microphone-slash','fa'),(274,'shield','fa'),(275,'calendar-o','fa'),(276,'fire-extinguisher','fa'),(277,'rocket','fa'),(278,'maxcdn','fa'),(279,'chevron-circle-left','fa'),(280,'chevron-circle-right','fa'),(281,'chevron-circle-up','fa'),(282,'chevron-circle-down','fa'),(283,'html5','fa'),(284,'css3','fa'),(285,'anchor','fa'),(286,'unlock-alt','fa'),(287,'bullseye','fa'),(288,'ellipsis-h','fa'),(289,'ellipsis-v','fa'),(290,'rss-square','fa'),(291,'play-circle','fa'),(292,'ticket','fa'),(293,'minus-square','fa'),(294,'minus-square-o','fa'),(295,'level-up','fa'),(296,'level-down','fa'),(297,'check-square','fa'),(298,'pencil-square','fa'),(299,'external-link-square','fa'),(300,'share-square','fa'),(301,'compass','fa'),(302,'caret-square-o-down','fa'),(303,'caret-square-o-up','fa'),(304,'caret-square-o-right','fa'),(305,'eur','fa'),(306,'gbp','fa'),(307,'usd','fa'),(308,'inr','fa'),(309,'jpy','fa'),(310,'rub','fa'),(311,'krw','fa'),(312,'btc','fa'),(313,'file','fa'),(314,'file-text','fa'),(315,'sort-alpha-asc','fa'),(316,'sort-alpha-desc','fa'),(317,'sort-amount-asc','fa'),(318,'sort-amount-desc','fa'),(319,'sort-numeric-asc','fa'),(320,'sort-numeric-desc','fa'),(321,'thumbs-up','fa'),(322,'thumbs-down','fa'),(323,'youtube-square','fa'),(324,'youtube','fa'),(325,'xing','fa'),(326,'xing-square','fa'),(327,'youtube-play','fa'),(328,'dropbox','fa'),(329,'stack-overflow','fa'),(330,'instagram','fa'),(331,'flickr','fa'),(332,'adn','fa'),(333,'bitbucket','fa'),(334,'bitbucket-square','fa'),(335,'tumblr','fa'),(336,'tumblr-square','fa'),(337,'long-arrow-down','fa'),(338,'long-arrow-up','fa'),(339,'long-arrow-left','fa'),(340,'long-arrow-right','fa'),(341,'apple','fa'),(342,'windows','fa'),(343,'android','fa'),(344,'linux','fa'),(345,'dribbble','fa'),(346,'skype','fa'),(347,'foursquare','fa'),(348,'trello','fa'),(349,'female','fa'),(350,'male','fa'),(351,'gratipay','fa'),(352,'sun-o','fa'),(353,'moon-o','fa'),(354,'archive','fa'),(355,'bug','fa'),(356,'vk','fa'),(357,'weibo','fa'),(358,'renren','fa'),(359,'pagelines','fa'),(360,'stack-exchange','fa'),(361,'arrow-circle-o-right','fa'),(362,'arrow-circle-o-left','fa'),(363,'caret-square-o-left','fa'),(364,'dot-circle-o','fa'),(365,'wheelchair','fa'),(366,'vimeo-square','fa'),(367,'try','fa'),(368,'plus-square-o','fa'),(369,'space-shuttle','fa'),(370,'slack','fa'),(371,'envelope-square','fa'),(372,'wordpress','fa'),(373,'openid','fa'),(374,'university','fa'),(375,'graduation-cap','fa'),(376,'yahoo','fa'),(377,'google','fa'),(378,'reddit','fa'),(379,'reddit-square','fa'),(380,'stumbleupon-circle','fa'),(381,'stumbleupon','fa'),(382,'delicious','fa'),(383,'digg','fa'),(384,'pied-piper-pp','fa'),(385,'pied-piper-alt','fa'),(386,'drupal','fa'),(387,'joomla','fa'),(388,'language','fa'),(389,'fax','fa'),(390,'building','fa'),(391,'child','fa'),(392,'paw','fa'),(393,'spoon','fa'),(394,'cube','fa'),(395,'cubes','fa'),(396,'behance','fa'),(397,'behance-square','fa'),(398,'steam','fa'),(399,'steam-square','fa'),(400,'recycle','fa'),(401,'car','fa'),(402,'taxi','fa'),(403,'tree','fa'),(404,'spotify','fa'),(405,'deviantart','fa'),(406,'soundcloud','fa'),(407,'database','fa'),(408,'file-pdf-o','fa'),(409,'file-word-o','fa'),(410,'file-excel-o','fa'),(411,'file-powerpoint-o','fa'),(412,'file-image-o','fa'),(413,'file-archive-o','fa'),(414,'file-audio-o','fa'),(415,'file-video-o','fa'),(416,'file-code-o','fa'),(417,'vine','fa'),(418,'codepen','fa'),(419,'jsfiddle','fa'),(420,'life-ring','fa'),(421,'circle-o-notch','fa'),(422,'rebel','fa'),(423,'empire','fa'),(424,'git-square','fa'),(425,'git','fa'),(426,'hacker-news','fa'),(427,'tencent-weibo','fa'),(428,'qq','fa'),(429,'weixin','fa'),(430,'paper-plane','fa'),(431,'paper-plane-o','fa'),(432,'history','fa'),(433,'circle-thin','fa'),(434,'header','fa'),(435,'paragraph','fa'),(436,'sliders','fa'),(437,'share-alt','fa'),(438,'share-alt-square','fa'),(439,'bomb','fa'),(440,'futbol-o','fa'),(441,'tty','fa'),(442,'binoculars','fa'),(443,'plug','fa'),(444,'slideshare','fa'),(445,'twitch','fa'),(446,'yelp','fa'),(447,'newspaper-o','fa'),(448,'wifi','fa'),(449,'calculator','fa'),(450,'paypal','fa'),(451,'google-wallet','fa'),(452,'cc-visa','fa'),(453,'cc-mastercard','fa'),(454,'cc-discover','fa'),(455,'cc-amex','fa'),(456,'cc-paypal','fa'),(457,'cc-stripe','fa'),(458,'bell-slash','fa'),(459,'bell-slash-o','fa'),(460,'trash','fa'),(461,'copyright','fa'),(462,'at','fa'),(463,'eyedropper','fa'),(464,'paint-brush','fa'),(465,'birthday-cake','fa'),(466,'area-chart','fa'),(467,'pie-chart','fa'),(468,'line-chart','fa'),(469,'lastfm','fa'),(470,'lastfm-square','fa'),(471,'toggle-off','fa'),(472,'toggle-on','fa'),(473,'bicycle','fa'),(474,'bus','fa'),(475,'ioxhost','fa'),(476,'angellist','fa'),(477,'cc','fa'),(478,'ils','fa'),(479,'meanpath','fa'),(480,'buysellads','fa'),(481,'connectdevelop','fa'),(482,'dashcube','fa'),(483,'forumbee','fa'),(484,'leanpub','fa'),(485,'sellsy','fa'),(486,'shirtsinbulk','fa'),(487,'simplybuilt','fa'),(488,'skyatlas','fa'),(489,'cart-plus','fa'),(490,'cart-arrow-down','fa'),(491,'diamond','fa'),(492,'ship','fa'),(493,'user-secret','fa'),(494,'motorcycle','fa'),(495,'street-view','fa'),(496,'heartbeat','fa'),(497,'venus','fa'),(498,'mars','fa'),(499,'mercury','fa'),(500,'transgender','fa'),(501,'transgender-alt','fa'),(502,'venus-double','fa'),(503,'mars-double','fa'),(504,'venus-mars','fa'),(505,'mars-stroke','fa'),(506,'mars-stroke-v','fa'),(507,'mars-stroke-h','fa'),(508,'neuter','fa'),(509,'genderless','fa'),(510,'facebook-official','fa'),(511,'pinterest-p','fa'),(512,'whatsapp','fa'),(513,'server','fa'),(514,'user-plus','fa'),(515,'user-times','fa'),(516,'bed','fa'),(517,'viacoin','fa'),(518,'train','fa'),(519,'subway','fa'),(520,'medium','fa'),(521,'y-combinator','fa'),(522,'optin-monster','fa'),(523,'opencart','fa'),(524,'expeditedssl','fa'),(525,'battery-full','fa'),(526,'battery-three-quarters','fa'),(527,'battery-half','fa'),(528,'battery-quarter','fa'),(529,'battery-empty','fa'),(530,'mouse-pointer','fa'),(531,'i-cursor','fa'),(532,'object-group','fa'),(533,'object-ungroup','fa'),(534,'sticky-note','fa'),(535,'sticky-note-o','fa'),(536,'cc-jcb','fa'),(537,'cc-diners-club','fa'),(538,'clone','fa'),(539,'balance-scale','fa'),(540,'hourglass-o','fa'),(541,'hourglass-start','fa'),(542,'hourglass-half','fa'),(543,'hourglass-end','fa'),(544,'hourglass','fa'),(545,'hand-rock-o','fa'),(546,'hand-paper-o','fa'),(547,'hand-scissors-o','fa'),(548,'hand-lizard-o','fa'),(549,'hand-spock-o','fa'),(550,'hand-pointer-o','fa'),(551,'hand-peace-o','fa'),(552,'trademark','fa'),(553,'registered','fa'),(554,'creative-commons','fa'),(555,'gg','fa'),(556,'gg-circle','fa'),(557,'tripadvisor','fa'),(558,'odnoklassniki','fa'),(559,'odnoklassniki-square','fa'),(560,'get-pocket','fa'),(561,'wikipedia-w','fa'),(562,'safari','fa'),(563,'chrome','fa'),(564,'firefox','fa'),(565,'opera','fa'),(566,'internet-explorer','fa'),(567,'television','fa'),(568,'contao','fa'),(569,'500px','fa'),(570,'amazon','fa'),(571,'calendar-plus-o','fa'),(572,'calendar-minus-o','fa'),(573,'calendar-times-o','fa'),(574,'calendar-check-o','fa'),(575,'industry','fa'),(576,'map-pin','fa'),(577,'map-signs','fa'),(578,'map-o','fa'),(579,'map','fa'),(580,'commenting','fa'),(581,'commenting-o','fa'),(582,'houzz','fa'),(583,'vimeo','fa'),(584,'black-tie','fa'),(585,'fonticons','fa'),(586,'reddit-alien','fa'),(587,'edge','fa'),(588,'credit-card-alt','fa'),(589,'codiepie','fa'),(590,'modx','fa'),(591,'fort-awesome','fa'),(592,'usb','fa'),(593,'product-hunt','fa'),(594,'mixcloud','fa'),(595,'scribd','fa'),(596,'pause-circle','fa'),(597,'pause-circle-o','fa'),(598,'stop-circle','fa'),(599,'stop-circle-o','fa'),(600,'shopping-bag','fa'),(601,'shopping-basket','fa'),(602,'hashtag','fa'),(603,'bluetooth','fa'),(604,'bluetooth-b','fa'),(605,'percent','fa'),(606,'gitlab','fa'),(607,'wpbeginner','fa'),(608,'wpforms','fa'),(609,'envira','fa'),(610,'universal-access','fa'),(611,'wheelchair-alt','fa'),(612,'question-circle-o','fa'),(613,'blind','fa'),(614,'audio-description','fa'),(615,'volume-control-phone','fa'),(616,'braille','fa'),(617,'assistive-listening-systems','fa'),(618,'american-sign-language-interpreting','fa'),(619,'deaf','fa'),(620,'glide','fa'),(621,'glide-g','fa'),(622,'sign-language','fa'),(623,'low-vision','fa'),(624,'viadeo','fa'),(625,'viadeo-square','fa'),(626,'snapchat','fa'),(627,'snapchat-ghost','fa'),(628,'snapchat-square','fa'),(629,'pied-piper','fa'),(630,'first-order','fa'),(631,'yoast','fa'),(632,'themeisle','fa'),(633,'google-plus-official','fa'),(634,'font-awesome','fa'),(635,'handshake-o','fa'),(636,'envelope-open','fa'),(637,'envelope-open-o','fa'),(638,'linode','fa'),(639,'address-book','fa'),(640,'address-book-o','fa'),(641,'address-card','fa'),(642,'address-card-o','fa'),(643,'user-circle','fa'),(644,'user-circle-o','fa'),(645,'user-o','fa'),(646,'id-badge','fa'),(647,'id-card','fa'),(648,'id-card-o','fa'),(649,'quora','fa'),(650,'free-code-camp','fa'),(651,'telegram','fa'),(652,'thermometer-full','fa'),(653,'thermometer-three-quarters','fa'),(654,'thermometer-half','fa'),(655,'thermometer-quarter','fa'),(656,'thermometer-empty','fa'),(657,'shower','fa'),(658,'bath','fa'),(659,'podcast','fa'),(660,'window-maximize','fa'),(661,'window-minimize','fa'),(662,'window-restore','fa'),(663,'window-close','fa'),(664,'window-close-o','fa'),(665,'bandcamp','fa'),(666,'grav','fa'),(667,'etsy','fa'),(668,'imdb','fa'),(669,'ravelry','fa'),(670,'eercast','fa'),(671,'microchip','fa'),(672,'snowflake-o','fa'),(673,'superpowers','fa'),(674,'wpexplorer','fa'),(675,'meetup','fa');
/*!40000 ALTER TABLE `icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `key_storage_item`
--

DROP TABLE IF EXISTS `key_storage_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `key_storage_item` (
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `comment` text DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`key`) USING BTREE,
  UNIQUE KEY `idx_key_storage_item_key` (`key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `key_storage_item`
--

LOCK TABLES `key_storage_item` WRITE;
/*!40000 ALTER TABLE `key_storage_item` DISABLE KEYS */;
INSERT INTO `key_storage_item` VALUES ('app-name','ระบบคิวโรงพยาบาลอุดรธานี','',1533350945,1518009214),('copy-right','โรงพยาบาลอุดรธานี','',1533350952,1527783992),('dynamic-limit','20','',1519362612,1519362612),('frontend.body.class','fixed-sidebar fixed-navbar','',1518010225,NULL),('frontend.navbar','navbar-fixed-top','fix navbar header',1515767197,NULL),('frontend.page-breadcrumbs','0','breadcrumbs-fixed',1515767838,NULL),('frontend.page-header','0','page-header-fixed',1515767908,NULL),('frontend.page-sidebar','sidebar-fixed menu-compact','sidebar-fixed , menu-compact',1516690802,NULL),('hospital-email','app@banbunghospital.com','',1527784016,1527784016),('hospital-name','โรงพยาบาลอุดรธานี','',1533351896,1533351896),('logo-url','/imgs/udh-logo.png','',1533350304,1533350304),('text-marquee-kiosk','<i class=\"fa fa-hospital-o\"></i> โรงพยาบาลบ้านบึงยินดีให้บริการ','ข้อความวิ่งหน้าจอ Kiosk',1531472785,1531471602);
/*!40000 ALTER TABLE `key_storage_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_category_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `router` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `parameter` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('2','1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `item_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `protocol` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `sort` int(3) DEFAULT NULL,
  `language` varchar(7) COLLATE utf8_unicode_ci DEFAULT '*',
  `params` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `assoc` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_items` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_menu_category_id_5207_00` (`menu_category_id`) USING BTREE,
  KEY `idx_parent_id_5207_01` (`parent_id`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`menu_category_id`) REFERENCES `menu_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,NULL,'หน้าหลัก','/site/index','','home','1',NULL,'','','1',1,'*','',NULL,1523348061,2,NULL,NULL,'',NULL,NULL,'[\"App\"]'),(2,1,NULL,'Gii','/gii','','newspaper-o','1',NULL,'','','1',2,'*',NULL,NULL,1534903801,1,NULL,NULL,'',NULL,NULL,'[\"App\"]'),(3,1,NULL,'ข้อมูลส่วนตัว','/user/settings/profile','','user','1',NULL,'','','1',12,'*',NULL,NULL,1534944136,1,NULL,NULL,'',NULL,NULL,'[\"แก้ไขข้อมูลส่วนตัว\"]'),(4,1,NULL,'ตั้งค่า','#','','cogs','1',NULL,'','','1',13,'*',NULL,NULL,1524041211,2,NULL,NULL,'',NULL,NULL,'[\"App\"]'),(5,1,4,'ผู้ใช้งาน','/user/admin/index','','users','1',NULL,'','','1',15,'*','',NULL,1523348294,2,NULL,NULL,'',NULL,NULL,'[\"App\"]'),(6,1,4,'สิทธิ์การใช้งาน','/rbac/assignment','','unlock-alt','1',NULL,'','','1',16,'*',NULL,NULL,1533348930,1,NULL,NULL,'',NULL,NULL,'[\"App\"]'),(7,1,4,'AppConfig','/key-storage/index','','circle-thin','1',NULL,'','','1',17,'*',NULL,NULL,1523348494,2,NULL,NULL,'',NULL,NULL,'[\"App\"]'),(8,1,NULL,'โปรแกรมเสียง','/app/calling/play-sound','','bullhorn','1',NULL,'','','1',9,'*',NULL,NULL,1535030589,1,NULL,NULL,'',NULL,NULL,'[\"App\"]'),(9,1,NULL,'จอแสดงผล','/app/display/index','','desktop','1',NULL,'','','1',10,'*',NULL,NULL,1535032803,1,NULL,NULL,'',NULL,NULL,'[\"App\"]'),(10,1,4,'เมนู','/menu/default/menu-order','','list','1',NULL,'','','1',18,'*','',NULL,1523349768,2,NULL,NULL,'',NULL,NULL,'[\"App\"]'),(11,1,4,'ระบบคิว','/app/settings/service-group','','cogs','1',NULL,'','','1',14,'*',NULL,NULL,1534942271,1,NULL,NULL,'',NULL,NULL,'[\"App\"]'),(12,1,NULL,'ออกบัตรคิว','/app/kiosk/index','','credit-card','1',NULL,'','','1',3,'*',NULL,NULL,1528878594,2,NULL,NULL,'',NULL,NULL,'[\"App\",\"หน้าออกบัตรคิว\"]'),(13,1,15,'จุดลงทะเบียน','/app/calling/medical','','bullhorn','1',NULL,'','','1',6,'*',NULL,NULL,1528870557,2,NULL,NULL,'',NULL,NULL,'[\"App\",\"จุดลงทะเบียน\"]'),(14,1,15,'ห้องตรวจ','/app/calling/examination-room','','bullhorn','1',NULL,'','','1',8,'*',NULL,NULL,1528870591,2,NULL,NULL,'',NULL,NULL,'[\"App\",\"ห้องตรวจโรค\"]'),(15,1,NULL,'เรียกคิว','#','','bullhorn','2',NULL,'','','1',5,'*',NULL,NULL,1534994871,1,NULL,NULL,'',NULL,NULL,'[\"App\"]'),(16,1,15,'จุดซักประวัติ','/app/calling/index','','bullhorn','1',NULL,'','','1',7,'*',NULL,NULL,1528874462,2,NULL,NULL,'',NULL,NULL,'[\"App\",\"จุดซักประวัติ\"]'),(17,1,NULL,'รายงาน','/app/report/index','','file-text-o','1',NULL,'','','1',11,'*',NULL,NULL,1535084784,1,NULL,NULL,'',NULL,NULL,'[\"App\"]'),(18,1,NULL,'เรียกคิว','/app/calling/index','','volume-up','1',NULL,'','','1',4,'*','',NULL,1534994919,1,NULL,NULL,'',NULL,NULL,'[\"App\"]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_auth`
--

DROP TABLE IF EXISTS `menu_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_auth` (
  `menu_id` int(11) NOT NULL,
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE,
  KEY `item_name` (`item_name`) USING BTREE,
  CONSTRAINT `menu_auth_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_auth`
--

LOCK TABLES `menu_auth` WRITE;
/*!40000 ALTER TABLE `menu_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_category`
--

DROP TABLE IF EXISTS `menu_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `discription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_id_5487_02` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_category`
--

LOCK TABLES `menu_category` WRITE;
/*!40000 ALTER TABLE `menu_category` DISABLE KEYS */;
INSERT INTO `menu_category` VALUES (1,'app-frontend','เมนู frontend','1'),(2,'app-backend','backend','1');
/*!40000 ALTER TABLE `menu_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1533306750),('m140209_132017_init',1533306755),('m140403_174025_create_account_table',1533306756),('m140504_113157_update_tables',1533306758),('m140504_130429_create_token_table',1533306759),('m140506_102106_rbac_init',1533308129),('m140830_171933_fix_ip_field',1533306760),('m140830_172703_change_account_table_name',1533306760),('m141222_110026_update_ip_field',1533306762),('m141222_135246_alter_username_length',1533306763),('m150614_103145_update_social_account_table',1533306765),('m150623_212711_fix_username_notnull',1533306765),('m151218_234654_add_timezone_to_profile',1533306766),('m160929_103127_add_last_login_at_to_user_table',1533306766),('m170907_052038_rbac_add_index_on_auth_assignment_user_id',1533308129);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_path` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `avatar_base_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'','','','d41d8cd98f00b204e9800998ecf8427e','','','','Asia/Bangkok',NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_account`
--

DROP TABLE IF EXISTS `social_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_unique` (`provider`,`client_id`) USING BTREE,
  UNIQUE KEY `account_unique_code` (`code`) USING BTREE,
  KEY `fk_user_account` (`user_id`) USING BTREE,
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_account`
--

LOCK TABLES `social_account` WRITE;
/*!40000 ALTER TABLE `social_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_caller`
--

DROP TABLE IF EXISTS `tb_caller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_caller` (
  `caller_ids` int(11) NOT NULL AUTO_INCREMENT COMMENT 'running',
  `que_ids` int(11) NOT NULL COMMENT 'รหัสคิว',
  `service_profile_id` int(11) NOT NULL COMMENT 'เซอร์วิสโปรไฟล์',
  `counter_service_id` int(11) NOT NULL COMMENT 'เคาท์เตอร์',
  `call_timestp` datetime NOT NULL COMMENT 'เวลาเรียก',
  `created_by` int(11) DEFAULT NULL COMMENT 'ผู้เรียก',
  `created_at` datetime NOT NULL COMMENT 'เวลาบันทึก',
  `updated_by` int(11) DEFAULT NULL COMMENT 'ผู้แก้ไข',
  `updated_at` datetime NOT NULL COMMENT 'เวลาแก้ไข',
  `call_status_id` int(11) NOT NULL COMMENT 'สถานะ',
  PRIMARY KEY (`caller_ids`) USING BTREE,
  KEY `call_timestp` (`call_timestp`) USING BTREE,
  KEY `que_ids` (`que_ids`) USING BTREE,
  KEY `counter_service_id` (`counter_service_id`) USING BTREE,
  KEY `call_status_id` (`call_status_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_caller`
--

LOCK TABLES `tb_caller` WRITE;
/*!40000 ALTER TABLE `tb_caller` DISABLE KEYS */;
INSERT INTO `tb_caller` VALUES (4,1,1,1,'2018-08-23 15:27:01',1,'2018-08-23 14:07:15',1,'2018-08-23 20:50:31',4),(5,2,1,1,'2018-08-23 15:13:59',1,'2018-08-23 15:13:59',1,'2018-08-23 20:50:23',4),(6,3,1,1,'2018-08-23 15:26:57',1,'2018-08-23 15:21:48',1,'2018-08-23 15:27:10',2),(7,4,1,1,'2018-08-23 16:35:28',1,'2018-08-23 16:23:09',1,'2018-08-23 20:50:39',3),(8,5,1,1,'2018-08-23 16:23:38',1,'2018-08-23 16:23:38',1,'2018-08-23 16:35:35',2),(9,9,1,1,'2018-08-24 09:22:01',1,'2018-08-23 16:38:45',1,'2018-08-24 09:24:25',4),(10,8,1,1,'2018-08-24 09:45:30',1,'2018-08-23 19:29:22',1,'2018-08-24 11:50:29',4),(11,7,1,1,'2018-08-24 09:21:56',1,'2018-08-23 20:52:29',1,'2018-08-24 09:24:03',4),(12,6,1,1,'2018-08-24 07:11:07',1,'2018-08-24 07:11:07',1,'2018-08-24 11:50:32',4),(13,10,1,1,'2018-08-24 10:15:15',1,'2018-08-24 09:27:21',1,'2018-08-24 11:50:26',4);
/*!40000 ALTER TABLE `tb_caller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_caller_data`
--

DROP TABLE IF EXISTS `tb_caller_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_caller_data` (
  `ids` int(11) NOT NULL AUTO_INCREMENT,
  `caller_ids` int(11) NOT NULL COMMENT 'running',
  `que_ids` int(11) NOT NULL COMMENT 'รหัสคิว',
  `service_profile_id` int(11) NOT NULL COMMENT 'เซอร์วิสโปรไฟล์',
  `counter_service_id` int(11) NOT NULL COMMENT 'เคาท์เตอร์',
  `call_timestp` datetime NOT NULL COMMENT 'เวลาเรียก',
  `created_by` int(11) DEFAULT NULL COMMENT 'ผู้เรียก',
  `created_at` datetime NOT NULL COMMENT 'เวลาบันทึก',
  `updated_by` int(11) DEFAULT NULL COMMENT 'ผู้แก้ไข',
  `updated_at` datetime NOT NULL COMMENT 'เวลาแก้ไข',
  `call_status_id` int(11) NOT NULL COMMENT 'สถานะ',
  PRIMARY KEY (`ids`) USING BTREE,
  KEY `call_timestp` (`call_timestp`) USING BTREE,
  KEY `que_ids` (`que_ids`) USING BTREE,
  KEY `counter_service_id` (`counter_service_id`) USING BTREE,
  KEY `call_status_id` (`call_status_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_caller_data`
--

LOCK TABLES `tb_caller_data` WRITE;
/*!40000 ALTER TABLE `tb_caller_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_caller_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_caller_status`
--

DROP TABLE IF EXISTS `tb_caller_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_caller_status` (
  `caller_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `caller_status_name` varchar(255) NOT NULL,
  PRIMARY KEY (`caller_status_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_caller_status`
--

LOCK TABLES `tb_caller_status` WRITE;
/*!40000 ALTER TABLE `tb_caller_status` DISABLE KEYS */;
INSERT INTO `tb_caller_status` VALUES (1,'กำลังเรียก'),(2,'พักคิว'),(3,'เรียกเสร็จ'),(4,'เสร็จสิ้น');
/*!40000 ALTER TABLE `tb_caller_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_counter_service`
--

DROP TABLE IF EXISTS `tb_counter_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_counter_service` (
  `counter_service_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'เลขที่บริการ',
  `counter_service_name` varchar(100) NOT NULL COMMENT 'ชื่อจุดบริการ',
  `counter_service_call_number` int(10) NOT NULL COMMENT 'หมายเลข',
  `counter_service_type_id` int(11) NOT NULL COMMENT 'ประเภทบริการ',
  `service_group_id` varchar(20) DEFAULT NULL COMMENT 'กลุ่มบริการ',
  `sound_station_id` int(11) DEFAULT NULL COMMENT 'เครื่องเล่นเสียงที่',
  `sound_id` int(11) DEFAULT NULL COMMENT 'เสียงเรียกหมายเลข',
  `sound_service_id` int(11) NOT NULL COMMENT 'เสียงเรียกบริการ',
  `counter_service_order` int(11) DEFAULT NULL COMMENT 'จัดเรียง',
  `counter_service_status` varchar(10) NOT NULL COMMENT 'สถานะ',
  PRIMARY KEY (`counter_service_id`) USING BTREE,
  KEY `counter_service_id` (`counter_service_id`) USING BTREE,
  KEY `counterservice_type_id` (`counter_service_type_id`) USING BTREE,
  KEY `service_group_id` (`service_group_id`) USING BTREE,
  KEY `sound_id` (`sound_id`) USING BTREE,
  KEY `sound_service_id` (`sound_service_id`) USING BTREE,
  KEY `counter_service_status` (`counter_service_status`) USING BTREE,
  CONSTRAINT `tb_counter_service_ibfk_1` FOREIGN KEY (`counter_service_type_id`) REFERENCES `tb_counter_service_type` (`counter_service_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_counter_service`
--

LOCK TABLES `tb_counter_service` WRITE;
/*!40000 ALTER TABLE `tb_counter_service` DISABLE KEYS */;
INSERT INTO `tb_counter_service` VALUES (1,'ช่องบริการ 1',1,1,'1',1,3,64,NULL,'1'),(2,'ช่องบริการ 2',2,1,'1',1,15,64,NULL,'1'),(3,'ช่องบริการ 3',3,1,'1',1,25,64,NULL,'1'),(4,'ช่องบริการ 1',1,2,'1',1,3,64,NULL,'1'),(5,'ช่องบริการ 2',2,2,'1',1,15,64,NULL,'1'),(6,'ช่องบริการ 3',3,2,'1',1,25,64,NULL,'1'),(7,'ช่องบริการ 4',4,2,'1',1,36,64,NULL,'1'),(8,'ช่องบริการ 5',5,2,'1',1,38,64,NULL,'1'),(9,'ช่องบริการ 1',1,3,'1',1,3,64,NULL,'1'),(10,'ช่องบริการ 2',2,3,'1',1,15,64,NULL,'1'),(11,'ช่องบริการ 3',3,3,'1',1,25,64,NULL,'1'),(12,'ช่องบริการ 4',4,3,'1',1,36,64,NULL,'1');
/*!40000 ALTER TABLE `tb_counter_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_counter_service_type`
--

DROP TABLE IF EXISTS `tb_counter_service_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_counter_service_type` (
  `counter_service_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `counter_service_type_name` varchar(50) NOT NULL COMMENT 'ประเภทบริการ',
  PRIMARY KEY (`counter_service_type_id`) USING BTREE,
  KEY `counterservice_type_id` (`counter_service_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_counter_service_type`
--

LOCK TABLES `tb_counter_service_type` WRITE;
/*!40000 ALTER TABLE `tb_counter_service_type` DISABLE KEYS */;
INSERT INTO `tb_counter_service_type` VALUES (1,'ห้องจ่ายยา'),(2,'ห้องการเงิน'),(3,'ห้องรับยา');
/*!40000 ALTER TABLE `tb_counter_service_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_display`
--

DROP TABLE IF EXISTS `tb_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_display` (
  `display_ids` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(255) NOT NULL COMMENT 'ชื่อจอแสดงผล',
  `page_length` int(11) NOT NULL COMMENT 'จำนวนแถวที่แสดง',
  `text_th_left` varchar(255) DEFAULT NULL COMMENT 'ข้อความส่วนหัวตาราง 1',
  `text_th_right` varchar(255) DEFAULT NULL COMMENT 'ข้อความส่วนหัวตาราง 2',
  `text_hold` varchar(100) DEFAULT NULL COMMENT 'ข้อความตารางพักคิว',
  `color_th_left` varchar(100) DEFAULT NULL,
  `color_th_right` varchar(100) DEFAULT NULL,
  `display_css` text DEFAULT NULL,
  `background_color` varchar(100) DEFAULT NULL COMMENT 'สีพื้นหลัง',
  `display_status` int(11) NOT NULL COMMENT 'สถานะ',
  `counter_service_id` varchar(255) NOT NULL COMMENT 'เคาท์เตอร์',
  `service_id` varchar(255) NOT NULL COMMENT 'ประเภทบริการ',
  `que_column_length` int(11) NOT NULL COMMENT 'จำนวนเลขคิวที่แสดง/แถว',
  `show_que_hold` int(11) DEFAULT NULL COMMENT 'แสดงคิวที่เรียกไปแล้ว',
  `text_top_left` text NOT NULL COMMENT 'ข้อความ 1',
  `text_top_center` text NOT NULL COMMENT 'ข้อความ 2',
  `text_top_right` text NOT NULL COMMENT 'ข้อความ 3',
  `text_th_lastq_left` varchar(100) DEFAULT NULL COMMENT 'ข้อความคิวล่าสุด 1',
  `text_th_lastq_right` varchar(100) DEFAULT NULL COMMENT 'ข้อความคิวล่าสุด 2',
  PRIMARY KEY (`display_ids`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_display`
--

LOCK TABLES `tb_display` WRITE;
/*!40000 ALTER TABLE `tb_display` DISABLE KEYS */;
INSERT INTO `tb_display` VALUES (1,'แผนกรับยา',3,'หมายเลขคิว','ช่อง','คิวที่เรียกไปแล้ว','#ffffff','#ffffff','<pre class=\" css\" data-pbcklang=\"css\" data-pbcktabsize=\"4\">\r\n        /*สีพื้นหลัง*/\r\n        body {\r\n            background-color: #204d74;\r\n        }\r\n        table#tb-display thead tr th.th-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-display thead tr th.th-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-display tbody tr td.td-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-display tbody tr td.td-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        /*background-color = สีพื้นหลังตารางส่วนหัว*/\r\n        /*color = สีตัวอักษร*/\r\n        table#tb-display thead tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #000000;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }\r\n        /*background-color = สีพื้นหลังแถว*/\r\n        /*color = สีตัวอักษร*/\r\n        table#tb-display tbody tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #666666;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }\r\n        table#tb-hold tbody tr td.td-left{\r\n            width: 50%;\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            background-color: #666666;\r\n            color: #ffffff;\r\n            vertical-align: middle;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-hold tbody tr td.td-right{\r\n            width: 50%;\r\n            border-top: 0px solid white !important;\r\n            color: yellow;\r\n            font-weight: bold;\r\n            vertical-align: middle;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        /* คิวล่าสุด */\r\n        table#tb-lastque thead tr th.th-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-lastque thead tr th.th-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        table#tb-lastque tbody tr td.td-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-lastque tbody tr td.td-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        /*color = สีตัวอักษร*/\r\n        table#tb-lastque thead tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #000000;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }\r\n        table#tb-lastque tbody tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #666666;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }\r\n        /* คิวล่าสุด */\r\n        table#tb-lastq thead tr th.th-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-lastq thead tr th.th-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-lastq tbody tr td.td-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-lastq tbody tr td.td-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        /*color = สีตัวอักษร*/\r\n        table#tb-lastq thead tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #000000;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }\r\n        /*background-color = สีพื้นหลังแถว*/\r\n        /*color = สีตัวอักษร*/\r\n        table#tb-lastq tbody tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #666666;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }</pre>\r\n','#204d74',1,'a:1:{i:0;s:1:\"3\";}','a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}',1,1,'<h1><span style=\"color:#62cb31\"><strong>เรียกคิวห้องยา</strong></span></h1>\r\n','<h1><span style=\"color:#62cb31\"><strong>แผนกห้องยา</strong></span></h1>\r\n','<h1><span style=\"color:#62cb31\"><strong>คิวล่าสุด</strong></span></h1>\r\n','#','คิว'),(2,'แผนกการเงิน',3,'หมายเลขคิว','ช่อง','คิวที่เรียกไปแล้ว','#ffffff','#ffffff','<pre class=\" css\" data-pbcklang=\"css\" data-pbcktabsize=\"4\">\r\n        /*สีพื้นหลัง*/\r\n        body {\r\n            background-color: #204d74;\r\n        }\r\n        table#tb-display thead tr th.th-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-display thead tr th.th-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-display tbody tr td.td-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-display tbody tr td.td-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        /*background-color = สีพื้นหลังตารางส่วนหัว*/\r\n        /*color = สีตัวอักษร*/\r\n        table#tb-display thead tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #000000;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }\r\n        /*background-color = สีพื้นหลังแถว*/\r\n        /*color = สีตัวอักษร*/\r\n        table#tb-display tbody tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #666666;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }\r\n        table#tb-hold tbody tr td.td-left{\r\n            width: 50%;\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            background-color: #666666;\r\n            color: #ffffff;\r\n            vertical-align: middle;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-hold tbody tr td.td-right{\r\n            width: 50%;\r\n            border-top: 0px solid white !important;\r\n            color: yellow;\r\n            font-weight: bold;\r\n            vertical-align: middle;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        /* คิวล่าสุด */\r\n        table#tb-lastque thead tr th.th-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-lastque thead tr th.th-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        table#tb-lastque tbody tr td.td-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-lastque tbody tr td.td-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        /*color = สีตัวอักษร*/\r\n        table#tb-lastque thead tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #000000;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }\r\n        table#tb-lastque tbody tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #666666;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }\r\n        /* คิวล่าสุด */\r\n        table#tb-lastq thead tr th.th-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-lastq thead tr th.th-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-lastq tbody tr td.td-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-lastq tbody tr td.td-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        /*color = สีตัวอักษร*/\r\n        table#tb-lastq thead tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #000000;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }\r\n        /*background-color = สีพื้นหลังแถว*/\r\n        /*color = สีตัวอักษร*/\r\n        table#tb-lastq tbody tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #666666;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }</pre>\r\n','#204d74',1,'a:1:{i:0;s:1:\"2\";}','a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}',3,1,'<h1><span style=\"color:#62cb31\"><strong>เรียกคิวการเงิน</strong></span></h1>\r\n','<h1><span style=\"color:#62cb31\"><strong>แผนกการเงิน</strong></span></h1>\r\n','<h1><span style=\"color:#62cb31\"><strong>คิวล่าสุด</strong></span></h1>\r\n','#','คิว'),(3,'ทดสอบ',3,'หมายเลขคิว','ช่อง','คิวที่เรียกไปแล้ว','','','<pre class=\" css\" data-pbcklang=\"css\" data-pbcktabsize=\"4\">\r\n        /*สีพื้นหลัง*/\r\n        body {\r\n            background-color: #204d74;\r\n        }\r\n        table#tb-display thead tr th.th-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-display thead tr th.th-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-display tbody tr td.td-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-display tbody tr td.td-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        /*background-color = สีพื้นหลังตารางส่วนหัว*/\r\n        /*color = สีตัวอักษร*/\r\n        table#tb-display thead tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #000000;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }\r\n        /*background-color = สีพื้นหลังแถว*/\r\n        /*color = สีตัวอักษร*/\r\n        table#tb-display tbody tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #666666;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }\r\n        table#tb-hold tbody tr td.td-left{\r\n            width: 50%;\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            background-color: #666666;\r\n            color: #ffffff;\r\n            vertical-align: middle;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-hold tbody tr td.td-right{\r\n            width: 50%;\r\n            border-top: 0px solid white !important;\r\n            color: yellow;\r\n            font-weight: bold;\r\n            vertical-align: middle;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        /* คิวล่าสุด */\r\n        table#tb-lastque thead tr th.th-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-lastque thead tr th.th-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        table#tb-lastque tbody tr td.td-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-lastque tbody tr td.td-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        /*color = สีตัวอักษร*/\r\n        table#tb-lastque thead tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #000000;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }\r\n        table#tb-lastque tbody tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #666666;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }\r\n        /* คิวล่าสุด */\r\n        table#tb-lastq thead tr th.th-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-lastq thead tr th.th-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-lastq tbody tr td.td-left {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-left: 5px solid #ffffff !important;\r\n            border-top-left-radius: 10px;\r\n            border-bottom-left-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        table#tb-lastq tbody tr td.td-right {\r\n            border-top: 5px solid #ffffff !important;\r\n            border-bottom: 5px solid #ffffff !important;\r\n            border-right: 5px solid #ffffff !important;\r\n            border-top-right-radius: 10px;\r\n            border-bottom-right-radius: 10px;\r\n            /*font-size: 40px !important;*/\r\n        }\r\n        \r\n        /*color = สีตัวอักษร*/\r\n        table#tb-lastq thead tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #000000;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }\r\n        /*background-color = สีพื้นหลังแถว*/\r\n        /*color = สีตัวอักษร*/\r\n        table#tb-lastq tbody tr {\r\n            width: 50%;\r\n            border-radius: 15px;\r\n            border: 5px solid white;\r\n            background-color: #666666;\r\n            color: #ffffff;\r\n            font-weight: bold;\r\n        }</pre>\r\n','#204d74',1,'a:1:{i:0;s:1:\"1\";}','a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"4\";}',1,1,'<h1><span style=\"color:#62cb31\"><strong>เรียกคิวห้องยา</strong></span></h1>\r\n','<h1><span style=\"color:#62cb31\"><strong>ห้องยา</strong></span></h1>\r\n','<h1><strong><span style=\"color:#62cb31\">คิวล่าสุด</span></strong></h1>\r\n','#','หมายเลข');
/*!40000 ALTER TABLE `tb_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_que`
--

DROP TABLE IF EXISTS `tb_que`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_que` (
  `que_ids` int(11) NOT NULL AUTO_INCREMENT,
  `que_num` varchar(100) NOT NULL COMMENT 'หมายเลขคิว',
  `que_hn` varchar(100) NOT NULL COMMENT 'HN',
  `pt_name` varchar(255) NOT NULL COMMENT 'ชื่อ-สกุล ผู้ป่วย',
  `service_id` int(11) NOT NULL COMMENT 'ประเภทบริการ',
  `service_group_id` int(11) NOT NULL COMMENT 'กลุ่มบริการ',
  `created_at` datetime NOT NULL COMMENT 'วันที่บันทึก',
  `updated_at` datetime DEFAULT NULL COMMENT 'วันที่แก้ไข',
  `created_by` int(11) NOT NULL COMMENT 'ผู้บันทึก',
  `updated_by` int(11) DEFAULT NULL COMMENT 'ผู้แก้ไข',
  `que_status_id` int(11) NOT NULL COMMENT 'สถานะ',
  PRIMARY KEY (`que_ids`) USING BTREE,
  KEY `que_ids` (`que_ids`) USING BTREE,
  KEY `que_num` (`que_num`) USING BTREE,
  KEY `que_hn` (`que_hn`) USING BTREE,
  KEY `que_status` (`que_status_id`) USING BTREE,
  CONSTRAINT `tb_que_ibfk_1` FOREIGN KEY (`que_status_id`) REFERENCES `tb_que_status` (`que_status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_que`
--

LOCK TABLES `tb_que` WRITE;
/*!40000 ALTER TABLE `tb_que` DISABLE KEYS */;
INSERT INTO `tb_que` VALUES (1,'A001','11122444555','Test Name',1,1,'2018-08-23 09:58:12','2018-08-23 15:27:06',1,1,4),(2,'A002','','',1,1,'2018-08-23 15:09:49','2018-08-23 15:16:47',1,1,4),(3,'B001','','',2,1,'2018-08-23 15:10:20','2018-08-23 15:27:15',1,1,4),(4,'B002','','',2,1,'2018-08-23 15:11:59','2018-08-23 16:35:50',1,1,4),(5,'A003','','',1,1,'2018-08-23 15:12:08','2018-08-23 16:35:44',1,1,4),(6,'A004','','',1,1,'2018-08-23 16:11:23','2018-08-24 11:50:32',1,1,4),(7,'B003','','',2,1,'2018-08-23 16:15:00','2018-08-24 09:24:02',1,1,4),(8,'B004','','',2,1,'2018-08-23 16:19:17','2018-08-24 11:50:29',1,1,4),(9,'A005','','',1,1,'2018-08-23 16:20:36','2018-08-24 09:24:25',1,1,4),(10,'A006','','',1,1,'2018-08-24 09:27:16','2018-08-24 11:50:25',1,1,4),(11,'A001','','',4,2,'2018-08-24 11:12:00','2018-08-24 11:12:00',1,1,1);
/*!40000 ALTER TABLE `tb_que` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_que_data`
--

DROP TABLE IF EXISTS `tb_que_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_que_data` (
  `ids` int(11) NOT NULL AUTO_INCREMENT,
  `que_ids` int(11) NOT NULL,
  `que_num` varchar(100) NOT NULL COMMENT 'หมายเลขคิว',
  `que_hn` varchar(100) NOT NULL COMMENT 'HN',
  `pt_name` varchar(255) NOT NULL COMMENT 'ชื่อ-สกุล ผู้ป่วย',
  `service_id` int(11) NOT NULL COMMENT 'ประเภทบริการ',
  `service_group_id` int(11) NOT NULL COMMENT 'กลุ่มบริการ',
  `created_at` datetime NOT NULL COMMENT 'วันที่บันทึก',
  `updated_at` datetime DEFAULT NULL COMMENT 'วันที่แก้ไข',
  `created_by` int(11) NOT NULL COMMENT 'ผู้บันทึก',
  `updated_by` int(11) DEFAULT NULL COMMENT 'ผู้แก้ไข',
  `que_status_id` int(11) NOT NULL COMMENT 'สถานะ',
  PRIMARY KEY (`ids`) USING BTREE,
  KEY `que_ids` (`que_ids`) USING BTREE,
  KEY `que_num` (`que_num`) USING BTREE,
  KEY `que_hn` (`que_hn`) USING BTREE,
  KEY `que_status` (`que_status_id`) USING BTREE,
  CONSTRAINT `tb_que_data_ibfk_1` FOREIGN KEY (`que_status_id`) REFERENCES `tb_que_status` (`que_status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_que_data`
--

LOCK TABLES `tb_que_data` WRITE;
/*!40000 ALTER TABLE `tb_que_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_que_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_que_status`
--

DROP TABLE IF EXISTS `tb_que_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_que_status` (
  `que_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `que_status_name` varchar(255) NOT NULL COMMENT 'ชื่อสถานะ',
  PRIMARY KEY (`que_status_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_que_status`
--

LOCK TABLES `tb_que_status` WRITE;
/*!40000 ALTER TABLE `tb_que_status` DISABLE KEYS */;
INSERT INTO `tb_que_status` VALUES (1,'รอเรียก'),(2,'กำลังเรียก'),(3,'พักคิว'),(4,'เสร็จสิ้น');
/*!40000 ALTER TABLE `tb_que_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_service`
--

DROP TABLE IF EXISTS `tb_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) NOT NULL COMMENT 'ชื่อบริการ',
  `service_group_id` int(11) NOT NULL COMMENT 'รหัสกลุ่มบริการ',
  `print_template_id` int(11) NOT NULL COMMENT 'แบบการพิมพ์บัตรคิว',
  `print_copy_qty` int(11) DEFAULT NULL COMMENT 'จำนวนพิมพ์/ครั้ง',
  `service_prefix` varchar(10) NOT NULL COMMENT 'ตัวอักษร/ตัวเลข นำหน้าคิว',
  `service_numdigit` int(10) NOT NULL COMMENT 'จำนวนหลักหมายเลขคิว',
  `service_status` varchar(10) DEFAULT NULL COMMENT 'สถานะคิว',
  PRIMARY KEY (`service_id`) USING BTREE,
  KEY `service_id` (`service_id`) USING BTREE,
  KEY `service_status` (`service_status`) USING BTREE,
  KEY `service_group_id` (`service_group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_service`
--

LOCK TABLES `tb_service` WRITE;
/*!40000 ALTER TABLE `tb_service` DISABLE KEYS */;
INSERT INTO `tb_service` VALUES (1,'เด็ก',1,13,1,'A',3,'1'),(2,'อายุรกรรม',1,13,1,'B',3,'1'),(4,'ทดสอบ',2,1,2,'A',3,'1');
/*!40000 ALTER TABLE `tb_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_service_group`
--

DROP TABLE IF EXISTS `tb_service_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_service_group` (
  `service_group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสกลุ่มบริการ',
  `service_group_name` varchar(255) NOT NULL COMMENT 'ชื่อกลุ่มบริการ',
  `service_group_status` int(11) NOT NULL COMMENT 'สถานะ',
  PRIMARY KEY (`service_group_id`) USING BTREE,
  KEY `service_group_id` (`service_group_id`) USING BTREE,
  KEY `service_group_status` (`service_group_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_service_group`
--

LOCK TABLES `tb_service_group` WRITE;
/*!40000 ALTER TABLE `tb_service_group` DISABLE KEYS */;
INSERT INTO `tb_service_group` VALUES (1,'ห้องยา',1),(2,'ห้องตรวจ',1);
/*!40000 ALTER TABLE `tb_service_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_service_profile`
--

DROP TABLE IF EXISTS `tb_service_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_service_profile` (
  `service_profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_profile_name` varchar(100) NOT NULL COMMENT 'ชื่อโปรไฟล์',
  `counter_service_type_id` int(11) NOT NULL COMMENT 'เคาท์เตอร์',
  `service_id` text NOT NULL COMMENT 'เซอร์วิสบริการ',
  `service_profile_status` int(11) NOT NULL COMMENT 'สถานะ',
  PRIMARY KEY (`service_profile_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_service_profile`
--

LOCK TABLES `tb_service_profile` WRITE;
/*!40000 ALTER TABLE `tb_service_profile` DISABLE KEYS */;
INSERT INTO `tb_service_profile` VALUES (1,'ห้องยา 1',1,'a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}',1),(2,'ห้องยา 2',1,'a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}',1),(3,'รับยา',3,'a:2:{i:0;s:1:\"2\";i:1;s:1:\"4\";}',1);
/*!40000 ALTER TABLE `tb_service_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sound`
--

DROP TABLE IF EXISTS `tb_sound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_sound` (
  `sound_id` int(11) NOT NULL AUTO_INCREMENT,
  `sound_name` varchar(255) NOT NULL COMMENT 'ชื่อไฟล์',
  `sound_path_name` varchar(255) NOT NULL COMMENT 'โฟรเดอร์ไฟล์',
  `sound_th` varchar(255) DEFAULT NULL COMMENT 'เสียงเรียก',
  `sound_type` int(11) DEFAULT NULL COMMENT 'ประเภทเสียง',
  PRIMARY KEY (`sound_id`) USING BTREE,
  KEY `sound_id` (`sound_id`) USING BTREE,
  KEY `sound_name` (`sound_name`) USING BTREE,
  KEY `sound_path_name` (`sound_path_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sound`
--

LOCK TABLES `tb_sound` WRITE;
/*!40000 ALTER TABLE `tb_sound` DISABLE KEYS */;
INSERT INTO `tb_sound` VALUES (1,'BLIP.wav','Prompt1','บี๊บ',1),(2,'Prompt1_0.wav','Prompt1','ศูนย์',1),(3,'Prompt1_1.wav','Prompt1','หนึ่ง',1),(4,'Prompt1_10.wav','Prompt1','สิบ',1),(5,'Prompt1_100.wav','Prompt1','ร้อย',1),(6,'Prompt1_1000.wav','Prompt1','พัน',1),(7,'Prompt1_11.wav','Prompt1','สิบเอ็ด',1),(8,'Prompt1_13.wav','Prompt1','สิบสาม',1),(9,'Prompt1_14.wav','Prompt1','สิบสี่',1),(10,'Prompt1_15.wav','Prompt1','สิบห้า',1),(11,'Prompt1_16.wav','Prompt1','สิบหก',1),(12,'Prompt1_17.wav','Prompt1','สิบเจ็ด',1),(13,'Prompt1_18.wav','Prompt1','สิบแปด',1),(14,'Prompt1_19.wav','Prompt1','สิบเก้า',1),(15,'Prompt1_2.wav','Prompt1','สอง',1),(16,'Prompt1_20.wav','Prompt1','ยี่สิบ',1),(17,'Prompt1_21.wav','Prompt1','ยี่สิบเอ็ด',1),(18,'Prompt1_22.wav','Prompt1','ยี่สิบสอง',1),(19,'Prompt1_23.wav','Prompt1','ยี่สิบสาม',1),(20,'Prompt1_24.wav','Prompt1','ยี่สิบสี่',1),(21,'Prompt1_25.wav','Prompt1','ยี่สิบห้า',1),(22,'Prompt1_26.wav','Prompt1','ยี่สิบหก',1),(23,'Prompt1_27.wav','Prompt1','ยี่สิบเจ็ด',1),(24,'Prompt1_29.wav','Prompt1','ยี่สิบเก้า',1),(25,'Prompt1_3.wav','Prompt1','สาม',1),(26,'Prompt1_30.wav','Prompt1','สามสิบ',1),(27,'Prompt1_31.wav','Prompt1','สามสิบเอ็ด',1),(28,'Prompt1_32.wav','Prompt1','สามสิบสอง',1),(29,'Prompt1_33.wav','Prompt1','สามสิบสาม',1),(30,'Prompt1_34.wav','Prompt1','สามสิบสี่',1),(31,'Prompt1_35.wav','Prompt1','สามสิบห้า',1),(32,'Prompt1_36.wav','Prompt1','สามสิบหก',1),(33,'Prompt1_37.wav','Prompt1','สามสิบเจ็ด',1),(34,'Prompt1_38.wav','Prompt1','สามสิบแปด',1),(35,'Prompt1_39.wav','Prompt1','สามสิบเก้า',1),(36,'Prompt1_4.wav','Prompt1','สี่',1),(37,'Prompt1_40.wav','Prompt1','สี่สิบ',1),(38,'Prompt1_5.wav','Prompt1','ห้า',1),(39,'Prompt1_6.wav','Prompt1','หก',1),(40,'Prompt1_7.wav','Prompt1','เจ็ด',1),(41,'Prompt1_8.wav','Prompt1','แปด',1),(42,'Prompt1_9.wav','Prompt1','เก้า',1),(43,'Prompt1_A.wav','Prompt1','เอ',1),(44,'Prompt1_B.wav','Prompt1','บี',1),(45,'Prompt1_C.wav','Prompt1','ซี',1),(46,'Prompt1_D.wav','Prompt1','ดี',1),(47,'Prompt1_E.wav','Prompt1','อี',1),(48,'Prompt1_F.wav','Prompt1','เอฟ',1),(49,'Prompt1_G.wav','Prompt1','จี',1),(50,'Prompt1_H.wav','Prompt1','เอช',1),(51,'Prompt1_I.wav','Prompt1','ไอ',1),(52,'Prompt1_J.wav','Prompt1','เจ',1),(53,'Prompt1_K.wav','Prompt1','เค',1),(54,'Prompt1_L.wav','Prompt1','แอล',1),(55,'Prompt1_M.wav','Prompt1','เอ็ม',1),(56,'Prompt1_N.wav','Prompt1','เอ็น',1),(57,'Prompt1_Number.wav','Prompt1','หมายเลข',1),(58,'Prompt1_O.wav','Prompt1','โอ',1),(59,'Prompt1_P.wav','Prompt1','พี',1),(60,'Prompt1_Q.wav','Prompt1','คิว',1),(61,'Prompt1_R.wav','Prompt1','อาร์',1),(62,'Prompt1_S.wav','Prompt1','เอส',1),(63,'Prompt1_Service.wav','Prompt1','ที่ช่อง',1),(64,'Prompt1_Service0.wav','Prompt1','ที่ช่อง',1),(65,'Prompt1_Service1.wav','Prompt1','ที่ช่องการเงิน',1),(66,'Prompt1_Service2.wav','Prompt1','ที่ห้องตรวจ',1),(67,'Prompt1_Service3.wav','Prompt1','ที่ช่องรับยา',1),(68,'Prompt1_Service4.wav','Prompt1','ที่โต๊ะอายุรกรรม',1),(69,'Prompt1_Service5.wav','Prompt1','ที่โต๊ะเบาหวาน',1),(70,'Prompt1_Service6.wav','Prompt1','ที่โต๊ะ',1),(71,'Prompt1_Service7.wav','Prompt1','ที่ห้องแพทย์',1),(72,'Prompt1_Service8.wav','Prompt1','ที่โต๊ะซักประวัติ',1),(73,'Prompt1_Sir.wav','Prompt1','ค่ะ',1),(74,'Prompt1_T.wav','Prompt1','ที',1),(75,'Prompt1_U.wav','Prompt1','ยู',1),(76,'Prompt1_V.wav','Prompt1','วี',1),(77,'Prompt1_W.wav','Prompt1','ดับเบิลยู',1),(78,'Prompt1_X.wav','Prompt1','เอกซ์',1),(79,'Prompt1_Y.wav','Prompt1','วาย',1),(80,'Prompt1_Z.wav','Prompt1','แซด',1),(81,'Prompt1_to.wav','Prompt1','ถึง',1),(82,'please.wav','Prompt1','เชิญหมายเลข',1),(83,'BLIP.WAV','Prompt2','บี๊บ',2),(84,'Prompt2_0.wav','Prompt2','ศูนย์',2),(85,'Prompt2_1.wav','Prompt2','หนึ่ง',2),(86,'Prompt2_10.wav','Prompt2','สิบ',2),(87,'Prompt2_100.wav','Prompt2','ร้อย',2),(88,'Prompt2_1000.wav','Prompt2','พัน',2),(89,'Prompt2_11.wav','Prompt2','สิบเอ็ด',2),(90,'Prompt2_2.wav','Prompt2','สอง',2),(91,'Prompt2_20.wav','Prompt2','ยี่สิบ',2),(92,'Prompt2_3.wav','Prompt2','สาม',2),(93,'Prompt2_4.wav','Prompt2','สี่',2),(94,'Prompt2_5.wav','Prompt2','ห้า',2),(95,'Prompt2_6.wav','Prompt2','หก',2),(96,'Prompt2_7.wav','Prompt2','เจ็ด',2),(97,'Prompt2_8.wav','Prompt2','แปด',2),(98,'Prompt2_9.wav','Prompt2','เก้า',2),(99,'Prompt2_A.wav','Prompt2','เอ',2),(100,'Prompt2_B.wav','Prompt2','บี',2),(101,'Prompt2_C.wav','Prompt2','ซี',2),(102,'Prompt2_D.wav','Prompt2','ดี',2),(103,'Prompt2_E.wav','Prompt2','อี',2),(104,'Prompt2_F.wav','Prompt2','เอฟ',2),(105,'Prompt2_G.wav','Prompt2','จี',2),(106,'Prompt2_Number.wav','Prompt2','หมายเลข',2),(107,'Prompt2_Q.wav','Prompt2','คิว',2),(108,'Prompt2_Service.wav','Prompt2','ที่ช่อง',2),(109,'Prompt2_Service0.wav','Prompt2','ที่ช่อง',2),(110,'Prompt2_Service1.wav','Prompt2','ที่ช่องการเงิน',2),(111,'Prompt2_Service2.wav','Prompt2','ที่ห้องตรวจ',2),(112,'Prompt2_Service3.wav','Prompt2','ที่ช่องรับยา',2),(113,'Prompt2_Service4.wav','Prompt2','ที่โต๊ะอายุรกรรม',2),(114,'Prompt2_Service5.wav','Prompt2','ที่โต๊ะเบาหวาน',2),(115,'Prompt2_Service6.wav','Prompt2','ที่โต๊ะ',2),(116,'Prompt2_Sir.wav','Prompt2','ครับ',2),(117,'Prompt1_12.wav','Prompt1','สิบสอง',1);
/*!40000 ALTER TABLE `tb_sound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sound_station`
--

DROP TABLE IF EXISTS `tb_sound_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_sound_station` (
  `sound_station_id` int(11) NOT NULL AUTO_INCREMENT,
  `sound_station_name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `counter_service_id` text NOT NULL COMMENT 'จุดบริการ',
  `sound_station_status` int(11) NOT NULL COMMENT 'สถานะ',
  PRIMARY KEY (`sound_station_id`) USING BTREE,
  KEY `sound_station_id` (`sound_station_id`) USING BTREE,
  KEY `sound_station_status` (`sound_station_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sound_station`
--

LOCK TABLES `tb_sound_station` WRITE;
/*!40000 ALTER TABLE `tb_sound_station` DISABLE KEYS */;
INSERT INTO `tb_sound_station` VALUES (5,'โปรแกรมเสียง (ห้องรับยา)','a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";}',1);
/*!40000 ALTER TABLE `tb_sound_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ticket`
--

DROP TABLE IF EXISTS `tb_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ticket` (
  `ticket_ids` int(1) NOT NULL AUTO_INCREMENT,
  `hos_name_th` varchar(255) NOT NULL COMMENT 'ชื่อ รพ. ไทย',
  `hos_name_en` varchar(255) DEFAULT NULL COMMENT 'ชื่อ รพ. อังกฤษ',
  `template` text NOT NULL COMMENT 'แบบบัตรคิว',
  `default_template` text DEFAULT NULL COMMENT 'ต้นฉบับบัตรคิว',
  `logo_path` varchar(255) DEFAULT NULL,
  `logo_base_url` varchar(255) DEFAULT NULL,
  `barcode_type` varchar(255) NOT NULL COMMENT 'รหัสโค้ด',
  `ticket_status` int(255) NOT NULL COMMENT 'สถานะการใช้งาน',
  PRIMARY KEY (`ticket_ids`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ticket`
--

LOCK TABLES `tb_ticket` WRITE;
/*!40000 ALTER TABLE `tb_ticket` DISABLE KEYS */;
INSERT INTO `tb_ticket` VALUES (1,'โรงพยาบาลอุดรธานี','','<div class=\"x_content\">\r\n<div class=\"row\" style=\"margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; width:80mm\">\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:1cm 21px 0px 21px\">\r\n<div class=\"col-xs-12\" style=\"padding:0\"><span style=\"font-size:16px\"><img alt=\"\" class=\"center-block\" src=\"/imgs/udh-logo.png\" style=\"width:100px\" /> </span></div>\r\n\r\n<div class=\"col-xs-12\" style=\"padding:0\">\r\n<h4 style=\"text-align:center\"><span style=\"font-size:16px\"><strong>{hos_name_th}</strong> </span></h4>\r\n\r\n<h6 style=\"text-align:center\"><span style=\"font-size:16px\"><strong>งานบริการผู้ป่วยนอก</strong> </span></h6>\r\n</div>\r\n\r\n<div class=\"col-xs-12\" style=\"padding:3px 0px 10px 0px; text-align:left\">\r\n<h6 style=\"margin-left:1px; margin-right:1px\"><span style=\"font-size:22px\"><strong>HN</strong> : <strong>{q_hn}</strong> </span></h6>\r\n\r\n<h6 style=\"margin-left:1px; margin-right:1px\"><strong>ชื่อ-นามสกุล</strong> : <strong>{pt_name}</strong></h6>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:0px 21px 0px 21px\">\r\n<div class=\"col-xs-12\" style=\"padding:0\">\r\n<h1 style=\"text-align:center\"><span style=\"font-size:72px\"><strong>{q_num}</strong> </span></h1>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:0px 21px 0px 21px\">\r\n<div class=\"col-xs-6\" style=\"padding:0\">\r\n<h5 style=\"text-align:center\"><strong>{pt_visit_type}</strong></h5>\r\n</div>\r\n\r\n<div class=\"col-xs-6\" style=\"padding:0\">\r\n<h5 style=\"text-align:center\"><strong>{sec_name}</strong></h5>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:5px 20px 0px 20px\">\r\n<div class=\"col-xs-12\" style=\"padding:0; text-align:left\">\r\n<div class=\"col-xs-12\" style=\"border-top:dashed 1px #404040; padding:4px 0px 3px 0px\">\r\n<div class=\"col-xs-12\" dir=\"rtl\" style=\"padding:1px\">\r\n<h6 style=\"margin-left:0px; margin-right:0px; text-align:center\"><strong>&nbsp;</strong></h6>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:0px 21px 0px 21px\">\r\n<div class=\"col-xs-6\" style=\"padding:0; text-align:center\">\r\n<div id=\"qrcode\" style=\"text-align:left\"><span style=\"color:#000000\"><img alt=\"\" src=\"/imgs/qrcode.png\" /> </span></div>\r\n</div>\r\n\r\n<div class=\"col-xs-6\" style=\"padding:0; text-align:center\">\r\n<div><span style=\"color:#000000\"><strong><u>** จุดบริการต่อไป**</u> </strong> </span>\r\n\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:80%\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:left\"><span style=\"color:#000000\">จุดซักประวัติ</span></td>\r\n			<td><input type=\"checkbox\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:left\"><span style=\"color:#000000\">หน้าห้องตรวจ</span></td>\r\n			<td><input type=\"checkbox\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:left\"><span style=\"color:#000000\">ห้อง LAB</span></td>\r\n			<td><input type=\"checkbox\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:left\"><span style=\"color:#000000\">ห้อง X-RAY</span></td>\r\n			<td><input type=\"checkbox\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:left\"><span style=\"color:#000000\">ห้องการเงิน</span></td>\r\n			<td><input style=\"border:solid #ff0000 1px\" type=\"checkbox\" /></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12 qwaiting\" style=\"padding:10px 0px 0px 0px\">\r\n<h4 style=\"text-align:left\"><strong>คิวรอ {qwaiting}</strong></h4>\r\n\r\n<p style=\"text-align:center\"><strong>ท่านสามารถ Scan QR Code เพื่อดูสถานะการรอคิว</strong></p>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:0px 21px 0px 21px\">\r\n<div class=\"col-xs-6\" style=\"padding:0; text-align:left\">\r\n<h6 style=\"text-align:left\"><strong>{time}</strong></h6>\r\n</div>\r\n\r\n<div class=\"col-xs-6\" style=\"padding:0; text-align:right\">\r\n<h6 style=\"text-align:right\"><strong>{user_print}</strong></h6>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n','<center>\r\n            <div class=\"x_content\">\r\n                <div class=\"row\" style=\"width: 80mm;margin: auto;\">\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 1cm 21px 0px 21px;\">\r\n                        <div class=\"col-xs-12\" style=\"padding: 0;\">\r\n                            <img src=\"/imgs/udh-logo.png\" alt=\"\" class=\"center-block\" style=\"width: 100px\">\r\n                        </div>\r\n                        <div class=\"col-xs-12\" style=\"padding: 0;\">\r\n                            <h4 class=\"color\" style=\"margin-top: 0px;margin-bottom: 0px;text-align: center;\"><b style=\"font-weight: bold;\">{hos_name_th}</b></h4>\r\n                            <h6 class=\"color\" style=\"margin-top: 4px;margin-bottom: 0px;text-align: center;\"><b>งานบริการผู้ป่วยนอก</b></h6>\r\n                        </div>\r\n                        <div class=\"col-xs-12\" style=\"padding: 3px 0px 10px 0px;;text-align: left;\">\r\n                            <h6 style=\"margin: 4px 1px;\" class=\"color\">\r\n                                <b style=\"font-size: 14px; font-weight: 600;\">HN</b>  :  <b style=\"font-size: 13px;\">{q_hn}</b>\r\n                            </h6>\r\n                            <h6 style=\"margin: 4px 1px;\" class=\"color\">\r\n                                <b style=\"font-size: 14px; font-weight: 600;\">ชื่อ-นามสกุล</b>  :  <b style=\"font-size: 13px;\">{pt_name}</b>\r\n                            </h6>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 0px 21px 0px 21px;\">\r\n                        <div class=\"col-xs-12\" style=\"padding: 0;\">\r\n                            <h1 style=\"text-align: center;\"><b style=\"font-weight: 600;text-align: center;\">{q_num}</b></h1>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 0px 21px 0px 21px;\">\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;\">\r\n                            <h5 style=\"text-align: center;\"><b style=\"font-weight: 600;\">{pt_visit_type}</b></h5>\r\n                        </div>\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;\">\r\n                            <h5 style=\"text-align: center;\"><b style=\"font-weight: 600;\">{sec_name}</b></h5>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 5px 20px 0px 20px;\">\r\n                        <div class=\"col-xs-12\" style=\"text-align: left;padding: 0;\">\r\n                            <div class=\"col-xs-12\" style=\"padding: 4px 0px 3px 0px;border-top: dashed 1px #404040;\">\r\n                                <div class=\"col-xs-12\" style=\"padding: 1px;\">\r\n                                    <h6 class=\"color\" style=\"margin: 0px;\"><b>Scan QR Code เพื่อดูสถานะการรอคิว</b></h6>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 0px 21px 0px 21px;\">\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;\">\r\n                            <div id=\"qrcode\"><img alt=\"\" src=\"/imgs/qrcode.png\" /></div>\r\n                        </div>\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;\">\r\n                            <div id=\"bcTarget\" style=\"overflow: auto; padding: 0px; width: 143px;\"><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 10px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 3px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 3px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 3px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 4px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 4px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 4px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 3px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 10px\"></div><div style=\"clear:both; width: 100%; background-color: #FFFFFF; color: #000000; text-align: center; font-size: 10px; margin-top: 5px;\">1234567890128</div></div>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12 qwaiting\" style=\"padding: 10px 0px 0px 0px;\">\r\n                        <h4 class=\"color qwaiting\" style=\"margin-top: 0px;margin-bottom: 0px;text-align: center;\"><b>คิวรอ</b></h4>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12 qwaiting\" style=\"padding: 10px 0px 0px 0px;\">\r\n                        <h4 class=\"color qwaiting\" style=\"margin-top: 0px;margin-bottom: 0px;text-align: center;\"><b>{qwaiting}</b></h4>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 10px 0px 0px 0px;\">\r\n                        <h4 class=\"color\" style=\"margin-top: 0px;margin-bottom: 0px;text-align: center;\"><b>ขอบคุณที่ใช้บริการ</b></h4>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 0px 21px 0px 21px;\">\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;text-align: left;\">\r\n                            <h6 class=\"color\" style=\"margin-top: 4px;margin-bottom: 0px;text-align: left;\"><b>{time}</b></h6>\r\n                        </div>\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;text-align: right;\">\r\n                            <h6 class=\"color\" style=\"margin-top: 4px;margin-bottom: 0px;text-align: right;\"><b>{user_print}</b></h6>\r\n                        </div>\r\n                    </div>\r\n\r\n                </div>\r\n            </div>\r\n        </center>','1/JFvKwmC0PqFEmwB1MGHgI4yEOkZxgvJ3.png','/uploads','code128',1),(13,'ห้องยา 2','','<div class=\"x_content\">\r\n<div class=\"row\" style=\"margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; width:80mm\">\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:1cm 21px 0px 21px\">\r\n<div class=\"col-xs-12\" style=\"padding:0\"><img alt=\"\" class=\"center-block\" src=\"/imgs/udh-logo.png\" style=\"width:100px\" /></div>\r\n\r\n<div class=\"col-xs-12\" style=\"padding:0\">\r\n<h4 style=\"text-align:center\"><strong>{hos_name_th}</strong></h4>\r\n\r\n<h6 style=\"text-align:center\"><strong>งานบริการผู้ป่วยนอก</strong></h6>\r\n</div>\r\n\r\n<div class=\"col-xs-12\" style=\"padding:3px 0px 10px 0px; text-align:left\">\r\n<h6 style=\"margin-left:1px; margin-right:1px\"><strong>HN</strong> : <strong>{q_hn}</strong></h6>\r\n\r\n<h6 style=\"margin-left:1px; margin-right:1px\"><strong>ชื่อ-นามสกุล</strong> : <strong>{pt_name}</strong></h6>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:0px 21px 0px 21px\">\r\n<div class=\"col-xs-12\" style=\"padding:0\">\r\n<h1 style=\"text-align:center\"><strong>{q_num}</strong></h1>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:0px 21px 0px 21px\">\r\n<div class=\"col-xs-6\" style=\"padding:0\">\r\n<h5 style=\"text-align:center\"><strong>{pt_visit_type}</strong></h5>\r\n</div>\r\n\r\n<div class=\"col-xs-6\" style=\"padding:0\">\r\n<h5 style=\"text-align:center\"><strong>{sec_name}</strong></h5>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:5px 20px 0px 20px\">\r\n<div class=\"col-xs-12\" style=\"padding:0; text-align:left\">\r\n<div class=\"col-xs-12\" style=\"border-top:dashed 1px #404040; padding:4px 0px 3px 0px\">\r\n<div class=\"col-xs-12\" style=\"padding:1px\">\r\n<h6 style=\"margin-left:0px; margin-right:0px\"><strong>Scan QR Code เพื่อดูสถานะการรอคิว</strong></h6>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:0px\">\r\n<div class=\"col-xs-4\" style=\"padding:0\">\r\n<div class=\"qrcode\" id=\"qrcode\"><img alt=\"\" src=\"/imgs/qrcode.png\" /></div>\r\n</div>\r\n\r\n<div class=\"col-xs-8\" style=\"padding:0\">\r\n<div class=\"bcTarget\" id=\"bcTarget\" style=\"overflow:auto; padding-top:10px\">\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:10px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:3px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:3px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:3px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:3px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:3px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:3px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:4px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:4px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:3px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:4px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:3px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:3px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:3px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:3px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:3px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:10px\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; clear:both; color:#000000; font-size:10px; margin-top:5px; text-align:center; width:100%\">1234567890128</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12 qwaiting\" style=\"padding:10px 0px 0px 0px\">\r\n<h4 style=\"text-align:center\"><strong>คิวรอ</strong></h4>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12 qwaiting\" style=\"padding:10px 0px 0px 0px\">\r\n<h4 style=\"text-align:center\"><strong>{qwaiting}</strong></h4>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:10px 0px 0px 0px\">\r\n<h4 style=\"text-align:center\"><strong>ขอบคุณที่ใช้บริการ</strong></h4>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:0px 21px 0px 21px\">\r\n<div class=\"col-xs-6\" style=\"padding:0; text-align:left\">\r\n<h6 style=\"text-align:left\"><strong>{time}</strong></h6>\r\n</div>\r\n\r\n<div class=\"col-xs-6\" style=\"padding:0; text-align:right\">\r\n<h6 style=\"text-align:right\"><strong>{user_print}</strong></h6>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n','<center>\r\n            <div class=\"x_content\">\r\n                <div class=\"row\" style=\"width: 80mm;margin: auto;\">\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 1cm 21px 0px 21px;\">\r\n                        <div class=\"col-xs-12\" style=\"padding: 0;\">\r\n                            <img src=\"/imgs/udh-logo.png\" alt=\"\" class=\"center-block\" style=\"width: 100px\">\r\n                        </div>\r\n                        <div class=\"col-xs-12\" style=\"padding: 0;\">\r\n                            <h4 class=\"color\" style=\"margin-top: 0px;margin-bottom: 0px;text-align: center;\"><b style=\"font-weight: bold;\">{hos_name_th}</b></h4>\r\n                            <h6 class=\"color\" style=\"margin-top: 4px;margin-bottom: 0px;text-align: center;\"><b>งานบริการผู้ป่วยนอก</b></h6>\r\n                        </div>\r\n                        <div class=\"col-xs-12\" style=\"padding: 3px 0px 10px 0px;;text-align: left;\">\r\n                            <h6 style=\"margin: 4px 1px;\" class=\"color\">\r\n                                <b style=\"font-size: 14px; font-weight: 600;\">HN</b>  :  <b style=\"font-size: 13px;\">{q_hn}</b>\r\n                            </h6>\r\n                            <h6 style=\"margin: 4px 1px;\" class=\"color\">\r\n                                <b style=\"font-size: 14px; font-weight: 600;\">ชื่อ-นามสกุล</b>  :  <b style=\"font-size: 13px;\">{pt_name}</b>\r\n                            </h6>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 0px 21px 0px 21px;\">\r\n                        <div class=\"col-xs-12\" style=\"padding: 0;\">\r\n                            <h1 style=\"text-align: center;\"><b style=\"font-weight: 600;text-align: center;\">{q_num}</b></h1>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 0px 21px 0px 21px;\">\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;\">\r\n                            <h5 style=\"text-align: center;\"><b style=\"font-weight: 600;\">{pt_visit_type}</b></h5>\r\n                        </div>\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;\">\r\n                            <h5 style=\"text-align: center;\"><b style=\"font-weight: 600;\">{sec_name}</b></h5>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 5px 20px 0px 20px;\">\r\n                        <div class=\"col-xs-12\" style=\"text-align: left;padding: 0;\">\r\n                            <div class=\"col-xs-12\" style=\"padding: 4px 0px 3px 0px;border-top: dashed 1px #404040;\">\r\n                                <div class=\"col-xs-12\" style=\"padding: 1px;\">\r\n                                    <h6 class=\"color\" style=\"margin: 0px;\"><b>Scan QR Code เพื่อดูสถานะการรอคิว</b></h6>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 0px 21px 0px 21px;\">\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;\">\r\n                            <div id=\"qrcode\"><img alt=\"\" src=\"/imgs/qrcode.png\" /></div>\r\n                        </div>\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;\">\r\n                            <div id=\"bcTarget\" style=\"overflow: auto; padding: 0px; width: 143px;\"><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 10px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 3px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 3px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 3px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 4px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 4px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 4px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 3px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 10px\"></div><div style=\"clear:both; width: 100%; background-color: #FFFFFF; color: #000000; text-align: center; font-size: 10px; margin-top: 5px;\">1234567890128</div></div>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12 qwaiting\" style=\"padding: 10px 0px 0px 0px;\">\r\n                        <h4 class=\"color qwaiting\" style=\"margin-top: 0px;margin-bottom: 0px;text-align: center;\"><b>คิวรอ</b></h4>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12 qwaiting\" style=\"padding: 10px 0px 0px 0px;\">\r\n                        <h4 class=\"color qwaiting\" style=\"margin-top: 0px;margin-bottom: 0px;text-align: center;\"><b>{qwaiting}</b></h4>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 10px 0px 0px 0px;\">\r\n                        <h4 class=\"color\" style=\"margin-top: 0px;margin-bottom: 0px;text-align: center;\"><b>ขอบคุณที่ใช้บริการ</b></h4>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 0px 21px 0px 21px;\">\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;text-align: left;\">\r\n                            <h6 class=\"color\" style=\"margin-top: 4px;margin-bottom: 0px;text-align: left;\"><b>{time}</b></h6>\r\n                        </div>\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;text-align: right;\">\r\n                            <h6 class=\"color\" style=\"margin-top: 4px;margin-bottom: 0px;text-align: right;\"><b>{user_print}</b></h6>\r\n                        </div>\r\n                    </div>\r\n\r\n                </div>\r\n            </div>\r\n        </center>','1/XhTxgx7eMKQpIKpqvbA9h7XD9WTt8IbO.png','/uploads','code128',1),(6,'ห้องยา','','<div class=\"x_content\">\r\n<div class=\"row\" style=\"margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; width:80mm\">\r\n<div class=\"col-xs-12\" style=\"padding:0\"><img alt=\"\" class=\"center-block\" src=\"/imgs/udh-logo.png\" style=\"width:100px\" /></div>\r\n\r\n<div class=\"col-xs-12\" style=\"padding:0\">\r\n<h4 style=\"text-align:center\"><strong>โรงพยาบาลพิมาย</strong></h4>\r\n\r\n<h4 style=\"text-align:center\"><span style=\"font-size:20px\"><strong>{hos_name_th}</strong> </span></h4>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:0px 21px 0px 21px\">\r\n<div class=\"col-xs-12\" style=\"padding:0\">\r\n<h1 style=\"text-align:center\"><span style=\"font-size:72px\"><strong>{q_num}</strong> </span></h1>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12 qwaiting\" style=\"padding:10px 0px 0px 0px\">\r\n<h4 style=\"text-align:center\"><strong>คิวรอ</strong></h4>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12 qwaiting\" style=\"padding:10px 0px 0px 0px\">\r\n<h4 style=\"text-align:center\"><strong>{qwaiting}</strong></h4>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:5px 20px 0px 20px\">\r\n<div class=\"col-xs-12\" style=\"padding:0; text-align:left\">\r\n<div class=\"col-xs-12\" style=\"border-top:dashed 1px #404040; padding:4px 0px 3px 0px\">\r\n<div class=\"col-xs-12\" style=\"padding:1px\">\r\n<p style=\"text-align:center\"><strong>ขอบคุณที่ใช้บริการ</strong></p>\r\n\r\n<p style=\"text-align:center\"><strong>{time}</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n','<center>\r\n            <div class=\"x_content\">\r\n                <div class=\"row\" style=\"width: 80mm;margin: auto;\">\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 1cm 21px 0px 21px;\">\r\n                        <div class=\"col-xs-12\" style=\"padding: 0;\">\r\n                            <img src=\"/imgs/udh-logo.png\" alt=\"\" class=\"center-block\" style=\"width: 100px\">\r\n                        </div>\r\n                        <div class=\"col-xs-12\" style=\"padding: 0;\">\r\n                            <h4 class=\"color\" style=\"margin-top: 0px;margin-bottom: 0px;text-align: center;\"><b style=\"font-weight: bold;\">{hos_name_th}</b></h4>\r\n                            <h6 class=\"color\" style=\"margin-top: 4px;margin-bottom: 0px;text-align: center;\"><b>งานบริการผู้ป่วยนอก</b></h6>\r\n                        </div>\r\n                        <div class=\"col-xs-12\" style=\"padding: 3px 0px 10px 0px;;text-align: left;\">\r\n                            <h6 style=\"margin: 4px 1px;\" class=\"color\">\r\n                                <b style=\"font-size: 14px; font-weight: 600;\">HN</b>  :  <b style=\"font-size: 13px;\">{q_hn}</b>\r\n                            </h6>\r\n                            <h6 style=\"margin: 4px 1px;\" class=\"color\">\r\n                                <b style=\"font-size: 14px; font-weight: 600;\">ชื่อ-นามสกุล</b>  :  <b style=\"font-size: 13px;\">{pt_name}</b>\r\n                            </h6>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 0px 21px 0px 21px;\">\r\n                        <div class=\"col-xs-12\" style=\"padding: 0;\">\r\n                            <h1 style=\"text-align: center;\"><b style=\"font-weight: 600;text-align: center;\">{q_num}</b></h1>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 0px 21px 0px 21px;\">\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;\">\r\n                            <h5 style=\"text-align: center;\"><b style=\"font-weight: 600;\">{pt_visit_type}</b></h5>\r\n                        </div>\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;\">\r\n                            <h5 style=\"text-align: center;\"><b style=\"font-weight: 600;\">{sec_name}</b></h5>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 5px 20px 0px 20px;\">\r\n                        <div class=\"col-xs-12\" style=\"text-align: left;padding: 0;\">\r\n                            <div class=\"col-xs-12\" style=\"padding: 4px 0px 3px 0px;border-top: dashed 1px #404040;\">\r\n                                <div class=\"col-xs-12\" style=\"padding: 1px;\">\r\n                                    <h6 class=\"color\" style=\"margin: 0px;\"><b>Scan QR Code เพื่อดูสถานะการรอคิว</b></h6>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 0px 21px 0px 21px;\">\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;\">\r\n                            <div id=\"qrcode\"><img alt=\"\" src=\"/imgs/qrcode.png\" /></div>\r\n                        </div>\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;\">\r\n                            <div id=\"bcTarget\" style=\"overflow: auto; padding: 0px; width: 143px;\"><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 10px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 3px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 3px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 3px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 4px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 4px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 4px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 3px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 10px\"></div><div style=\"clear:both; width: 100%; background-color: #FFFFFF; color: #000000; text-align: center; font-size: 10px; margin-top: 5px;\">1234567890128</div></div>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12 qwaiting\" style=\"padding: 10px 0px 0px 0px;\">\r\n                        <h4 class=\"color qwaiting\" style=\"margin-top: 0px;margin-bottom: 0px;text-align: center;\"><b>คิวรอ</b></h4>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12 qwaiting\" style=\"padding: 10px 0px 0px 0px;\">\r\n                        <h4 class=\"color qwaiting\" style=\"margin-top: 0px;margin-bottom: 0px;text-align: center;\"><b>{qwaiting}</b></h4>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 10px 0px 0px 0px;\">\r\n                        <h4 class=\"color\" style=\"margin-top: 0px;margin-bottom: 0px;text-align: center;\"><b>ขอบคุณที่ใช้บริการ</b></h4>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 0px 21px 0px 21px;\">\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;text-align: left;\">\r\n                            <h6 class=\"color\" style=\"margin-top: 4px;margin-bottom: 0px;text-align: left;\"><b>{time}</b></h6>\r\n                        </div>\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;text-align: right;\">\r\n                            <h6 class=\"color\" style=\"margin-top: 4px;margin-bottom: 0px;text-align: right;\"><b>{user_print}</b></h6>\r\n                        </div>\r\n                    </div>\r\n\r\n                </div>\r\n            </div>\r\n        </center>','1/fcfSM-Cscw2wblEJwrxD25cqpYR8XbNr.png','/uploads','code128',1),(14,'โรงพยาบาลอุดรธานี','','<div class=\"x_content\">\r\n<div class=\"row\" style=\"margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; width:80mm\">\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:1cm 21px 0px 21px\">\r\n<div class=\"col-xs-12\" style=\"padding:0\"><img alt=\"\" class=\"center-block\" src=\"/imgs/udh-logo.png\" style=\"width:100px\" /></div>\r\n\r\n<div class=\"col-xs-12\" style=\"padding:0\">\r\n<h4 style=\"text-align:center\"><strong>{hos_name_th}</strong></h4>\r\n\r\n<h6 style=\"text-align:center\"><strong>งานบริการผู้ป่วยนอก</strong></h6>\r\n</div>\r\n\r\n<div class=\"col-xs-12\" style=\"padding:3px 0px 10px 0px; text-align:left\">\r\n<h6 style=\"margin-left:1px; margin-right:1px\"><strong>HN</strong> : <strong>{q_hn}</strong></h6>\r\n\r\n<h6 style=\"margin-left:1px; margin-right:1px\"><strong>ชื่อ-นามสกุล</strong> : <strong>{pt_name}</strong></h6>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:0px 21px 0px 21px\">\r\n<div class=\"col-xs-12\" style=\"padding:0\">\r\n<h1 style=\"text-align:center\"><strong>{q_num}</strong></h1>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:0px 21px 0px 21px\">\r\n<div class=\"col-xs-6\" style=\"padding:0\">\r\n<h5 style=\"text-align:center\"><strong>{pt_visit_type}</strong></h5>\r\n</div>\r\n\r\n<div class=\"col-xs-6\" style=\"padding:0\">\r\n<h5 style=\"text-align:center\"><strong>{sec_name}</strong></h5>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:5px 20px 0px 20px\">\r\n<div class=\"col-xs-12\" style=\"padding:0; text-align:left\">\r\n<div class=\"col-xs-12\" style=\"border-top:dashed 1px #404040; padding:4px 0px 3px 0px\">\r\n<div class=\"col-xs-12\" style=\"padding:1px\">\r\n<h6 style=\"margin-left:0px; margin-right:0px\"><strong>Scan QR Code เพื่อดูสถานะการรอคิว</strong></h6>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:0px 21px 0px 21px\">\r\n<div class=\"col-xs-6\" style=\"padding:0\">\r\n<div id=\"qrcode\"><img alt=\"\" src=\"/imgs/qrcode.png\" /></div>\r\n</div>\r\n\r\n<div class=\"col-xs-6\" style=\"padding:0\">\r\n<div id=\"bcTarget\" style=\"overflow:auto; padding:0px; width:143px\">\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:10px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:3px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:3px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:3px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:3px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:3px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:3px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:4px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:4px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:3px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:4px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:3px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:3px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:3px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:2px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:3px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:3px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:1px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:1px\">&nbsp;</div>\r\n\r\n<div style=\"border-left:2px solid #000000; float:left; font-size:0px; height:50px; width:0\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; float:left; font-size:0px; height:50px; width:10px\">&nbsp;</div>\r\n\r\n<div style=\"background-color:#ffffff; clear:both; color:#000000; font-size:10px; margin-top:5px; text-align:center; width:100%\">1234567890128</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12 qwaiting\" style=\"padding:10px 0px 0px 0px\">\r\n<h4 style=\"text-align:center\"><strong>คิวรอ</strong></h4>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12 qwaiting\" style=\"padding:10px 0px 0px 0px\">\r\n<h4 style=\"text-align:center\"><strong>{qwaiting}</strong></h4>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:10px 0px 0px 0px\">\r\n<h4 style=\"text-align:center\"><strong>ขอบคุณที่ใช้บริการ</strong></h4>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding:0px 21px 0px 21px\">\r\n<div class=\"col-xs-6\" style=\"padding:0; text-align:left\">\r\n<h6 style=\"text-align:left\"><strong>{time}</strong></h6>\r\n</div>\r\n\r\n<div class=\"col-xs-6\" style=\"padding:0; text-align:right\">\r\n<h6 style=\"text-align:right\"><strong>{user_print}</strong></h6>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n','<center>\r\n            <div class=\"x_content\">\r\n                <div class=\"row\" style=\"width: 80mm;margin: auto;\">\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 1cm 21px 0px 21px;\">\r\n                        <div class=\"col-xs-12\" style=\"padding: 0;\">\r\n                            <img src=\"/imgs/udh-logo.png\" alt=\"\" class=\"center-block\" style=\"width: 100px\">\r\n                        </div>\r\n                        <div class=\"col-xs-12\" style=\"padding: 0;\">\r\n                            <h4 class=\"color\" style=\"margin-top: 0px;margin-bottom: 0px;text-align: center;\"><b style=\"font-weight: bold;\">{hos_name_th}</b></h4>\r\n                            <h6 class=\"color\" style=\"margin-top: 4px;margin-bottom: 0px;text-align: center;\"><b>งานบริการผู้ป่วยนอก</b></h6>\r\n                        </div>\r\n                        <div class=\"col-xs-12\" style=\"padding: 3px 0px 10px 0px;;text-align: left;\">\r\n                            <h6 style=\"margin: 4px 1px;\" class=\"color\">\r\n                                <b style=\"font-size: 14px; font-weight: 600;\">HN</b>  :  <b style=\"font-size: 13px;\">{q_hn}</b>\r\n                            </h6>\r\n                            <h6 style=\"margin: 4px 1px;\" class=\"color\">\r\n                                <b style=\"font-size: 14px; font-weight: 600;\">ชื่อ-นามสกุล</b>  :  <b style=\"font-size: 13px;\">{pt_name}</b>\r\n                            </h6>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 0px 21px 0px 21px;\">\r\n                        <div class=\"col-xs-12\" style=\"padding: 0;\">\r\n                            <h1 style=\"text-align: center;\"><b style=\"font-weight: 600;text-align: center;\">{q_num}</b></h1>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 0px 21px 0px 21px;\">\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;\">\r\n                            <h5 style=\"text-align: center;\"><b style=\"font-weight: 600;\">{pt_visit_type}</b></h5>\r\n                        </div>\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;\">\r\n                            <h5 style=\"text-align: center;\"><b style=\"font-weight: 600;\">{sec_name}</b></h5>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 5px 20px 0px 20px;\">\r\n                        <div class=\"col-xs-12\" style=\"text-align: left;padding: 0;\">\r\n                            <div class=\"col-xs-12\" style=\"padding: 4px 0px 3px 0px;border-top: dashed 1px #404040;\">\r\n                                <div class=\"col-xs-12\" style=\"padding: 1px;\">\r\n                                    <h6 class=\"color\" style=\"margin: 0px;\"><b>Scan QR Code เพื่อดูสถานะการรอคิว</b></h6>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 0px 21px 0px 21px;\">\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;\">\r\n                            <div id=\"qrcode\"><img alt=\"\" src=\"/imgs/qrcode.png\" /></div>\r\n                        </div>\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;\">\r\n                            <div id=\"bcTarget\" style=\"overflow: auto; padding: 0px; width: 143px;\"><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 10px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 3px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 3px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 3px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 4px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 4px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 4px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 2px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 3px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 3px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 1px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 1px\"></div><div style=\"float: left; font-size: 0px; width:0; border-left: 2px solid #000000; height: 50px;\"></div><div style=\"float: left; font-size: 0px; background-color: #FFFFFF; height: 50px; width: 10px\"></div><div style=\"clear:both; width: 100%; background-color: #FFFFFF; color: #000000; text-align: center; font-size: 10px; margin-top: 5px;\">1234567890128</div></div>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12 qwaiting\" style=\"padding: 10px 0px 0px 0px;\">\r\n                        <h4 class=\"color qwaiting\" style=\"margin-top: 0px;margin-bottom: 0px;text-align: center;\"><b>คิวรอ</b></h4>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12 qwaiting\" style=\"padding: 10px 0px 0px 0px;\">\r\n                        <h4 class=\"color qwaiting\" style=\"margin-top: 0px;margin-bottom: 0px;text-align: center;\"><b>{qwaiting}</b></h4>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 10px 0px 0px 0px;\">\r\n                        <h4 class=\"color\" style=\"margin-top: 0px;margin-bottom: 0px;text-align: center;\"><b>ขอบคุณที่ใช้บริการ</b></h4>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"padding: 0px 21px 0px 21px;\">\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;text-align: left;\">\r\n                            <h6 class=\"color\" style=\"margin-top: 4px;margin-bottom: 0px;text-align: left;\"><b>{time}</b></h6>\r\n                        </div>\r\n                        <div class=\"col-xs-6\" style=\"padding: 0;text-align: right;\">\r\n                            <h6 class=\"color\" style=\"margin-top: 4px;margin-bottom: 0px;text-align: right;\"><b>{user_print}</b></h6>\r\n                        </div>\r\n                    </div>\r\n\r\n                </div>\r\n            </div>\r\n        </center>','1/kbvSEXTPxEpGYXSwOdxzbW9LP0VOidb_.png','/uploads','code128',1);
/*!40000 ALTER TABLE `tb_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`) USING BTREE,
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `last_login_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_unique_username` (`username`) USING BTREE,
  UNIQUE KEY `user_unique_email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin-que-udh@gmail.com','$2y$10$xq2doXp1zP4oYFWSgUcfvurHIJF5erVeNA8tpmsUNNZ91NrYbM6RW','bkRlEq7YF8NtsmpRm1FzmF3o0eulIJzj',1533307841,NULL,NULL,NULL,1533307841,1533307841,0,1535088546),(2,'test','test@test.com','$2y$10$GFxqP3qRPor2tIvLS.dYzu7DXfAP5qkBPZAv5e6AuIe37feeBmbBq','Y9it4sHfcZ2GJxBbU1yIHSGgnf_xEPPb',1533308199,NULL,NULL,'127.0.0.1',1533308199,1533308199,0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-19 19:06:44

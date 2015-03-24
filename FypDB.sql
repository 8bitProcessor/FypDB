-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: FypDB
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.10.1

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `catID` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) DEFAULT NULL,
  `subsNo` bigint(20) NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `defaultCat` tinyint(4) NOT NULL,
  PRIMARY KEY (`catID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Anything about books! Post what you want about books you are reading or are thinking about reading',0,'books',1),(2,'Anything art related. Modern day, Classical Art or something you have created yourself. ',0,'art',1),(3,'All things food related. From good recipes you have to good food from good restaurants. All things delicious! ',0,'food',1),(4,'Things that you find funny be that an image or a story. Link it here.',0,'funny',1),(5,'Whether it be an interesting/educational/funny video post them here to discuss. ',0,'videos',1),(6,'All things Politics in Ireland. Discuss recent news and other various political related moves. ',0,'politics',1),(7,'Be it PC or Console gaming everything about the gaming world. News/Review/Playthroughs.',0,'gaming',1),(8,'Post anything that is TV show related from GOT to BB anything goes in relation to your shows. ',0,'tv',1),(9,'All things movie related. From reviews to suggestions, indie movies to blockbusters. Anything that you think is worth discussing. ',0,'movies',1),(10,'From inspiring images to beautiful scenery anything that you have take that you would like to share. ',0,'pictures',1),(11,'Programming in all aspects from questions to queries all the way up to most recent changes in languages. Post your programming questions here. Only queries on ideas not questions in relation to debugging code!  ',0,'programming',1),(12,'All things kernel related. Post anything in relation to your favorite distribution down to latest security notifications. ',0,'linux',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threadsAll`
--

DROP TABLE IF EXISTS `threadsAll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threadsAll` (
  `threadID` int(11) NOT NULL AUTO_INCREMENT,
  `typeNo` tinyint(1) NOT NULL,
  `userID` int(11) NOT NULL,
  `whencreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(300) NOT NULL,
  `infoOrL` varchar(15000) NOT NULL,
  `score` bigint(20) NOT NULL,
  `categoryID` int(11) NOT NULL,
  PRIMARY KEY (`threadID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threadsAll`
--

LOCK TABLES `threadsAll` WRITE;
/*!40000 ALTER TABLE `threadsAll` DISABLE KEYS */;
INSERT INTO `threadsAll` VALUES (2,1,23,'2015-03-24 00:23:54','Just Wile E. Coyote doing his thing ','http://36.media.tumblr.com/0c6c8236de5828bee63c5f16774a27aa/tumblr_nbebqw8xgs1rig09go1_1280.jpg',1,4),(3,1,23,'2015-03-24 00:25:26','Sorry book readers. HBO\'s \'Game Of Thrones\' Will Spoil The Ending Of George R.R. Martin\'s Books','http://www.huffingtonpost.com/2015/03/23/game-of-thrones-ending-books_n_6922748.html?ncid=txtlnkusaolp00000592',1,1),(4,1,23,'2015-03-24 00:28:53','Circus, AquaSixio, Digital Art, 2014','http://aquasixio.deviantart.com/art/Circus-433810637',1,2),(5,1,23,'2015-03-24 00:28:53','First time in Austin, here is the pit at Salt Lick BBQ','http://i.imgur.com/m187nC0.jpg',1,3),(6,1,23,'2015-03-24 00:33:40','I found a baby bird in a PVC pipe in a parking lot near my work. His parents were happy to have him back.','https://youtu.be/lbbuxF4mCiQ',1,5),(7,1,23,'2015-03-24 00:33:40','NYC official wants Comcast to offer $10, 10Mbps Internet after merger: One-third in city have no broadband; it\'s too expensive, public advocate says.','http://arstechnica.com/business/2015/03/nyc-official-wants-comcast-to-offer-10-10mbps-internet-after-merger/',1,6),(8,1,23,'2015-03-24 00:36:44','Garry\'s Mod is truly a beautiful game','http://i.imgur.com/wv9GOY3.jpg',1,7),(9,1,23,'2015-03-24 00:36:44','New season of The X-Files could begin shooting this summer - David Duchovny and Gillian Anderson are on board for a new six-to-eight episode season','http://consequenceofsound.net/2015/03/new-season-of-the-x-files-could-begin-shooting-this-summer/',1,8),(10,1,23,'2015-03-24 00:41:34','New poster for Armenian genocide film \"1915\"','http://i.imgur.com/KoXfMjn.jpg',1,9),(11,1,23,'2015-03-24 00:41:34','Cactus in Oaxaca','http://i.imgur.com/kVXqnhR.jpg',1,10),(12,1,23,'2015-03-24 00:43:46','The .NET Core is now open-source.','http://blogs.msdn.com/b/dotnet/archive/2014/11/12/net-core-is-open-source.aspx',1,11),(13,1,23,'2015-03-24 00:43:46','Netflix offers to work with Ubuntu to bring native playback to all','http://www.omgubuntu.co.uk/2014/09/netflix-linux-html5-nss-change-request',1,12);
/*!40000 ALTER TABLE `threadsAll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userAcc`
--

DROP TABLE IF EXISTS `userAcc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userAcc` (
  `userID` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `emailAdd` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userAcc`
--

LOCK TABLES `userAcc` WRITE;
/*!40000 ALTER TABLE `userAcc` DISABLE KEYS */;
INSERT INTO `userAcc` VALUES (1,'8bitProcessor','derp1234',NULL),(3,'Conor','password',NULL),(23,'qbit','derp123',NULL),(24,'Qwerty','derp123',NULL),(25,'Derp','qwert',NULL),(26,'Ddfgcg','kjjjjk',NULL),(27,'Qwe','derp',NULL),(28,'Sksk','jsjsjs',NULL);
/*!40000 ALTER TABLE `userAcc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userSubs`
--

DROP TABLE IF EXISTS `userSubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userSubs` (
  `userID` bigint(20) NOT NULL,
  `catID` int(11) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userSubs`
--

LOCK TABLES `userSubs` WRITE;
/*!40000 ALTER TABLE `userSubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `userSubs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-24  0:49:43

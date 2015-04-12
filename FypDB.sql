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
-- Table structure for table `commentVote`
--

DROP TABLE IF EXISTS `commentVote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentVote` (
  `commentID` bigint(20) NOT NULL,
  `userID` bigint(20) NOT NULL,
  `scored` tinyint(1) NOT NULL,
  `commentVoteID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`commentVoteID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentVote`
--

LOCK TABLES `commentVote` WRITE;
/*!40000 ALTER TABLE `commentVote` DISABLE KEYS */;
INSERT INTO `commentVote` VALUES (2,23,0,6),(1,23,1,7),(3,23,0,8),(26,38,1,9),(4,38,0,10),(3,38,0,11);
/*!40000 ALTER TABLE `commentVote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `commentID` bigint(20) NOT NULL AUTO_INCREMENT,
  `threadID` bigint(20) NOT NULL,
  `userID` bigint(20) NOT NULL,
  `score` bigint(20) NOT NULL,
  `whencommeted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(10000) NOT NULL,
  PRIMARY KEY (`commentID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,10,23,4,'2015-04-10 00:32:37','Looks like a really good movie. '),(2,10,25,1,'2015-04-10 00:32:37','I can\'t wait to see this. '),(3,10,24,-1,'2015-04-10 00:34:15','Not too excited for this movie'),(4,10,1,0,'2015-04-10 00:34:15','This movie looks quite dark!'),(12,10,23,1,'2015-04-10 18:04:27','Testing the posting mechanism '),(13,10,23,1,'2015-04-10 18:16:33','Testing the posting mechanism '),(14,10,37,1,'2015-04-10 21:05:48','Interesting'),(16,9,23,1,'2015-04-11 00:02:30','Test comment '),(17,19,23,1,'2015-04-11 00:03:38','Test'),(18,20,23,1,'2015-04-11 00:04:00','Wut'),(19,20,23,1,'2015-04-11 00:04:13','Thus movie sacked '),(20,20,23,1,'2015-04-11 10:32:49','Shit movie '),(21,8,23,1,'2015-04-11 14:59:33','Beautiful '),(22,21,23,1,'2015-04-11 15:59:26','Testin'),(23,4,23,1,'2015-04-11 15:59:36','Nice post '),(24,20,23,1,'2015-04-11 16:38:15','Bad movie '),(26,10,38,2,'2015-04-12 16:21:29','I like the look of this movie ');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
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
  `userID` bigint(11) NOT NULL,
  `whencreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(300) NOT NULL,
  `infoOrL` varchar(15000) NOT NULL,
  `score` bigint(20) NOT NULL,
  `categoryID` int(11) NOT NULL,
  PRIMARY KEY (`threadID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threadsAll`
--

LOCK TABLES `threadsAll` WRITE;
/*!40000 ALTER TABLE `threadsAll` DISABLE KEYS */;
INSERT INTO `threadsAll` VALUES (2,1,23,'2015-03-24 00:23:54','Just Wile E. Coyote doing his thing ','http://36.media.tumblr.com/0c6c8236de5828bee63c5f16774a27aa/tumblr_nbebqw8xgs1rig09go1_1280.jpg',85,4),(3,1,23,'2015-03-24 00:25:26','Sorry book readers. HBO\'s \'Game Of Thrones\' Will Spoil The Ending Of George R.R. Martin\'s Books','http://www.huffingtonpost.com/2015/03/23/game-of-thrones-ending-books_n_6922748.html?ncid=txtlnkusaolp00000592',11,1),(4,1,23,'2015-03-24 00:28:53','Circus, AquaSixio, Digital Art, 2014','http://aquasixio.deviantart.com/art/Circus-433810637',153,2),(5,1,23,'2015-03-24 00:28:53','First time in Austin, here is the pit at Salt Lick BBQ','http://i.imgur.com/m187nC0.jpg',33,3),(6,1,23,'2015-03-24 00:33:40','I found a baby bird in a PVC pipe in a parking lot near my work. His parents were happy to have him back.','https://youtu.be/lbbuxF4mCiQ',67,5),(7,1,23,'2015-03-24 00:33:40','NYC official wants Comcast to offer $10, 10Mbps Internet after merger: One-third in city have no broadband; it\'s too expensive, public advocate says.','http://arstechnica.com/business/2015/03/nyc-official-wants-comcast-to-offer-10-10mbps-internet-after-merger/',100,6),(8,1,23,'2015-03-24 00:36:44','Garry\'s Mod is truly a beautiful game','http://i.imgur.com/wv9GOY3.jpg',88,7),(9,1,23,'2015-03-24 00:36:44','New season of The X-Files could begin shooting this summer - David Duchovny and Gillian Anderson are on board for a new six-to-eight episode season','http://consequenceofsound.net/2015/03/new-season-of-the-x-files-could-begin-shooting-this-summer/',127,8),(10,1,23,'2015-03-24 00:41:34','New poster for Armenian genocide film \"1915\"','http://i.imgur.com/KoXfMjn.jpg',265,9),(11,1,23,'2015-03-24 00:41:34','Cactus in Oaxaca','http://i.imgur.com/kVXqnhR.jpg',91,10),(12,1,23,'2015-03-24 00:43:46','The .NET Core is now open-source.','http://blogs.msdn.com/b/dotnet/archive/2014/11/12/net-core-is-open-source.aspx',22,11),(13,1,23,'2015-03-24 00:43:46','Netflix offers to work with Ubuntu to bring native playback to all','http://www.omgubuntu.co.uk/2014/09/netflix-linux-html5-nss-change-request',25,12),(18,0,23,'2015-04-09 14:12:20','Testing the type of like ','Test post ',4,12),(19,0,23,'2015-04-09 23:30:14','This is an example post','I have a question about linux',2,12),(20,0,37,'2015-04-10 21:08:07','Fast &  Furious 7 ','Loved this film -  more of the same ',2,9),(21,0,23,'2015-04-11 15:00:38','Testing this thread ','Going to try and post a comment ',1,1),(22,0,23,'2015-04-11 23:40:48','','',1,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userAcc`
--

LOCK TABLES `userAcc` WRITE;
/*!40000 ALTER TABLE `userAcc` DISABLE KEYS */;
INSERT INTO `userAcc` VALUES (1,'8bitProcessor','derp1234',NULL),(3,'Conor','password',NULL),(23,'qbit','derp123',NULL),(24,'Qwerty','derp123',NULL),(25,'Derp','qwert',NULL),(26,'Ddfgcg','kjjjjk',NULL),(27,'Qwe','derp',NULL),(28,'Sksk','jsjsjs',NULL),(29,'tesagt','dfasdafsd',NULL),(30,'Gegscs','Gegscs',NULL),(31,'1','1',NULL),(32,'A','a',NULL),(33,'qbit1','derp123',NULL),(35,'Hhgfd','vvxzc',NULL),(36,'Login','aisling',NULL),(37,'Aisling','aisling01',NULL),(38,'Conor1','derp123',NULL);
/*!40000 ALTER TABLE `userAcc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voted`
--

DROP TABLE IF EXISTS `voted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voted` (
  `threadID` int(11) NOT NULL,
  `userID` bigint(20) NOT NULL,
  `scored` tinyint(1) NOT NULL,
  `voteID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`voteID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voted`
--

LOCK TABLES `voted` WRITE;
/*!40000 ALTER TABLE `voted` DISABLE KEYS */;
INSERT INTO `voted` VALUES (9,23,1,10),(10,23,0,11),(10,36,1,12),(9,36,1,13),(18,36,1,14),(16,36,1,15),(17,36,1,16),(17,23,1,17),(18,23,1,18),(16,23,1,19),(12,23,0,20),(19,23,1,21),(2,37,1,22),(20,37,1,23),(4,23,1,24);
/*!40000 ALTER TABLE `voted` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-12 17:35:25

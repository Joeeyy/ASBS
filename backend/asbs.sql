-- MySQL dump 10.13  Distrib 5.7.18, for macos10.12 (x86_64)
--
-- Host: localhost    Database: my_space
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `blog_title` varchar(32) NOT NULL,
  `blog_content` mediumtext NOT NULL,
  `blog_type_id` int(11) NOT NULL,
  `release_time` datetime DEFAULT NULL,
  `authentic` enum('0','1') NOT NULL,
  `read_count` int(11) NOT NULL DEFAULT '0',
  `tags` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`blog_id`),
  KEY `user_id` (`user_id`),
  KEY `blog_type_id` (`blog_type_id`),
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `blog_ibfk_2` FOREIGN KEY (`blog_type_id`) REFERENCES `blog_types` (`blog_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,3,'mac-pip-install','test',1,'2018-02-13 22:51:37','0',4,NULL),(2,3,'mac-pip-install','#test',1,'2018-02-13 22:51:37','0',6,NULL),(3,3,'mac-pip-install','MacOS系统中pip install 时常出现`Permission Denied`的情况，可以采用以下方式解决问题。\r\n```bash\n $ pip install --user <package name>\n```\r\n',1,'2018-02-13 22:51:37','0',133,'MacOS;Python;pip install'),(4,3,'test','test',1,'2018-02-15 00:00:00','1',20,NULL),(5,3,'Test','This is a test.',1,'2017-01-22 22:22:22','0',1,NULL),(12,3,'今天天气不错的','# 今天天气不错的\r\n\r\n是的天气不错。',4,'2018-02-20 09:12:28','0',15,'天气'),(13,3,'博客增加了检索功能','# 博客增加了检索功能\r\n\r\n## 基于\r\n基于xml\r\n\r\n## 如何\r\n在插入文章时同时插入xml，在xml进行实时检索',5,'2018-02-21 08:25:06','0',17,'博客;检索;功能'),(14,3,'测试检索功能','*测试*\r\n**检索**\r\n***功能***',1,'2018-02-21 08:27:36','0',31,'测试;检索功能'),(15,3,'111','111',1,'2018-02-21 08:28:35','0',18,'1;2;3'),(16,3,'aaa','aaa',1,'2018-02-27 07:54:42','0',116,''),(17,8,'这是我的第一篇博客','> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet\r\n> consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.\r\n> Vestibulum enim wisi viverra nec fringilla in laoreet vitae risus.\r\n> \r\n> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse\r\n> id sem consectetuer libero luctus adipiscing.',4,'2018-02-27 09:21:41','0',7,'第一篇博客'),(18,9,'信息系统必过','明天信息系统肯定过',4,'2018-02-27 07:03:44','0',0,'');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_added`
--

DROP TABLE IF EXISTS `blog_added`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_added` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `added_content` mediumtext NOT NULL,
  `added_time` datetime DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `blog_added_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_added`
--

LOCK TABLES `blog_added` WRITE;
/*!40000 ALTER TABLE `blog_added` DISABLE KEYS */;
INSERT INTO `blog_added` VALUES (1,16,'追加测试。','2018-02-28 00:38:46'),(2,16,'abc','2018-02-28 00:41:09');
/*!40000 ALTER TABLE `blog_added` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_types`
--

DROP TABLE IF EXISTS `blog_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_types` (
  `blog_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_type_name` varchar(20) NOT NULL,
  `blog_type_info` varchar(100) NOT NULL,
  PRIMARY KEY (`blog_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_types`
--

LOCK TABLES `blog_types` WRITE;
/*!40000 ALTER TABLE `blog_types` DISABLE KEYS */;
INSERT INTO `blog_types` VALUES (1,'test','For test.'),(2,'未分类','没有分类'),(3,'技术',''),(4,'生活',''),(5,'吐槽','');
/*!40000 ALTER TABLE `blog_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `comment_uid` int(11) NOT NULL,
  `comment_time` datetime DEFAULT NULL,
  `comment_content` mediumtext NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `blog_id` (`blog_id`),
  KEY `comment_uid` (`comment_uid`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`blog_id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`comment_uid`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,3,3,'2018-02-11 23:59:00','this is a test comment...'),(2,3,3,'2018-02-11 23:59:00','this is a another test comment...'),(13,3,1,'2018-02-15 09:16:44','test'),(14,3,1,'2018-02-15 09:17:01','test2'),(15,3,1,'2018-02-15 09:28:01',''),(16,3,1,'2018-02-15 09:34:03','@Guest, '),(17,3,1,'2018-02-15 09:34:03','@Guest, '),(18,3,1,'2018-02-15 09:34:11','@Guest, '),(19,3,1,'2018-02-15 09:34:14',''),(20,3,1,'2018-02-15 09:34:16',''),(21,3,1,'2018-02-15 09:34:18',''),(22,3,1,'2018-02-15 09:38:26','@Ainassine, '),(23,3,1,'2018-02-15 09:38:30',''),(24,3,3,'2018-02-16 02:51:44','说点什么'),(25,3,3,'2018-02-16 02:51:59','@Ainassine, 说点什么'),(26,12,1,'2018-02-20 09:36:36','不想说什么'),(27,12,1,'2018-02-20 09:36:47',''),(28,12,3,'2018-02-20 09:38:43',''),(29,12,3,'2018-02-20 09:40:07',''),(30,14,3,'2018-02-24 03:05:46','1'),(31,14,3,'2018-02-24 03:07:28','2'),(32,14,3,'2018-02-24 03:08:16','3'),(33,14,3,'2018-02-24 03:09:50','4'),(34,14,3,'2018-02-24 03:10:11','5'),(35,14,3,'2018-02-24 03:21:31','6'),(36,14,3,'2018-02-24 03:22:35','a'),(37,14,3,'2018-02-24 03:24:06','1'),(38,14,3,'2018-02-24 03:25:21','1'),(39,15,3,'2018-02-24 03:28:17','111'),(40,15,3,'2018-02-24 03:28:55','111'),(41,15,3,'2018-02-24 03:32:18','bb'),(42,15,3,'2018-02-24 03:33:30','a'),(43,3,1,'2018-02-27 06:18:17','1'),(44,3,1,'2018-02-27 06:20:44','1'),(45,3,1,'2018-02-27 06:21:17','1'),(46,16,1,'2018-02-27 08:04:05','aa'),(47,14,1,'2018-02-27 08:19:44','><script>alert(111)</script><'),(48,14,1,'2018-02-27 09:14:17','><sc<x>ript>alert(test)</sc<x>ript><'),(49,17,9,'2018-02-27 07:00:52','好');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment2comment`
--

DROP TABLE IF EXISTS `comment2comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment2comment` (
  `comment2comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `comment2comment_uid` int(11) NOT NULL,
  `comment2comment_time` datetime DEFAULT NULL,
  `comment2comment_content` mediumtext NOT NULL,
  PRIMARY KEY (`comment2comment_id`),
  KEY `comment_id` (`comment_id`),
  KEY `comment2comment_uid` (`comment2comment_uid`),
  CONSTRAINT `comment2comment_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`),
  CONSTRAINT `comment2comment_ibfk_2` FOREIGN KEY (`comment2comment_uid`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment2comment`
--

LOCK TABLES `comment2comment` WRITE;
/*!40000 ALTER TABLE `comment2comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment2comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draft`
--

DROP TABLE IF EXISTS `draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draft` (
  `draft_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `draft_content` mediumtext NOT NULL,
  `draft_time` datetime DEFAULT NULL,
  PRIMARY KEY (`draft_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `draft_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draft`
--

LOCK TABLES `draft` WRITE;
/*!40000 ALTER TABLE `draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followship`
--

DROP TABLE IF EXISTS `followship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followship` (
  `befollowed_user_id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `befollowed_user_id` (`befollowed_user_id`),
  KEY `follower_id` (`follower_id`),
  CONSTRAINT `followship_ibfk_1` FOREIGN KEY (`befollowed_user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `followship_ibfk_2` FOREIGN KEY (`follower_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followship`
--

LOCK TABLES `followship` WRITE;
/*!40000 ALTER TABLE `followship` DISABLE KEYS */;
INSERT INTO `followship` VALUES (3,8,3),(8,3,4);
/*!40000 ALTER TABLE `followship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_type_id` int(11) NOT NULL,
  `msg_content` mediumtext NOT NULL,
  `msg_time` datetime DEFAULT NULL,
  `msg_sender` int(11) NOT NULL,
  `msg_receiver` int(11) NOT NULL,
  PRIMARY KEY (`msg_id`),
  KEY `msg_type_id` (`msg_type_id`),
  KEY `msg_receiver` (`msg_receiver`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`msg_type_id`) REFERENCES `msg_type` (`msg_type_id`),
  CONSTRAINT `message_ibfk_3` FOREIGN KEY (`msg_receiver`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (5,1,'评论了您。','2018-02-24 03:10:11',3,3),(6,1,'评论了您。','2018-02-24 03:21:31',3,3),(7,1,'评论了您。','2018-02-24 03:22:35',3,3),(8,1,'评论了您。','2018-02-24 03:24:06',3,3),(9,1,'Ainassine评论了您。','2018-02-24 03:25:21',3,3),(10,1,'<span href=\'./index.php\'>Ainassine评论了您。</span>','2018-02-24 03:28:55',3,3),(11,1,'<a href=\'./index.php\'>Ainassine评论了您。</a>','2018-02-24 03:32:18',3,3),(12,1,'<a href=\'./article.php?blog_id=15\'>Ainassine评论了您。</a>','2018-02-24 03:33:30',3,3),(15,2,'<a href=\'./news_platform_articles.php?news_platform_id=11\'>新华社</a>有了新的文章。','2018-02-25 22:45:16',11,3),(16,2,'<a href=\'./news_platform_articles.php?news_platform_id=11\'>新华社</a>有了新的文章。','2018-02-25 22:45:16',11,3),(17,2,'<a href=\'./news_platform_articles.php?news_platform_id=12\'>看雪学院</a>有了新的文章。','2018-02-25 22:45:16',12,3),(18,2,'<a href=\'./news_platform_articles.php?news_platform_id=12\'>看雪学院</a>有了新的文章。','2018-02-25 22:45:16',12,3),(19,2,'<a href=\'./news_platform_articles.php?news_platform_id=13\'>Python编程</a>有了新的文章。','2018-02-25 22:45:16',13,3),(20,2,'<a href=\'./news_platform_articles.php?news_platform_id=13\'>Python编程</a>有了新的文章。','2018-02-25 22:45:16',13,3),(21,2,'<a href=\'./news_platform_articles.php?news_platform_id=14\'>大数据技术</a>有了新的文章。','2018-02-25 22:45:17',14,3),(22,2,'<a href=\'./news_platform_articles.php?news_platform_id=14\'>大数据技术</a>有了新的文章。','2018-02-25 22:45:17',14,3),(23,2,'<a href=\'./news_platform_articles.php?news_platform_id=11\'>《新华社》</a>有了新的文章。','2018-02-27 13:18:54',11,3),(24,2,'<a href=\'./news_platform_articles.php?news_platform_id=11\'>《新华社》</a>有了新的文章。','2018-02-27 13:18:54',11,3),(25,2,'<a href=\'./news_platform_articles.php?news_platform_id=12\'>《看雪学院》</a>有了新的文章。','2018-02-27 13:18:55',12,3),(26,2,'<a href=\'./news_platform_articles.php?news_platform_id=12\'>《看雪学院》</a>有了新的文章。','2018-02-27 13:18:55',12,3),(27,2,'<a href=\'./news_platform_articles.php?news_platform_id=13\'>《Python编程》</a>有了新的文章。','2018-02-27 13:18:55',13,3),(28,2,'<a href=\'./news_platform_articles.php?news_platform_id=13\'>《Python编程》</a>有了新的文章。','2018-02-27 13:18:55',13,3),(29,2,'<a href=\'./news_platform_articles.php?news_platform_id=14\'>《大数据技术》</a>有了新的文章。','2018-02-27 13:18:55',14,3),(30,2,'<a href=\'./news_platform_articles.php?news_platform_id=14\'>《大数据技术》</a>有了新的文章。','2018-02-27 13:18:55',14,3),(31,2,'<a href=\'./news_platform_articles.php?news_platform_id=15\'>《阿里技术》</a>有了新的文章。','2018-02-27 13:18:56',15,3),(32,2,'<a href=\'./news_platform_articles.php?news_platform_id=15\'>《阿里技术》</a>有了新的文章。','2018-02-27 13:18:56',15,3),(33,2,'<a href=\'./news_platform_articles.php?news_platform_id=16\'>《人工智能头条》</a>有了新的文章。','2018-02-27 13:19:03',16,3),(34,2,'<a href=\'./news_platform_articles.php?news_platform_id=16\'>《人工智能头条》</a>有了新的文章。','2018-02-27 13:19:03',16,3),(35,1,'<a href=\'./article.php?blog_id=3\'>Guest评论了您。</a>','2018-02-27 06:18:17',1,3),(36,1,'<a href=\'./article.php?blog_id=3\'>Guest评论了您。</a>','2018-02-27 06:20:44',1,3),(37,1,'<a href=\'./article.php?blog_id=3\'>Guest评论了您。</a>','2018-02-27 06:21:17',1,3),(38,1,'<a href=\'./article.php?blog_id=16\'>Guest评论了您。</a>','2018-02-27 08:04:05',1,3),(39,1,'<a href=\'./article.php?blog_id=16\'>Guest评论了您。</a>','2018-02-27 08:04:31',1,3),(40,1,'<a href=\'./article.php?blog_id=14\'>Guest评论了您。</a>','2018-02-27 08:15:08',1,3),(41,1,'<a href=\'./article.php?blog_id=14\'>Guest评论了您。</a>','2018-02-27 08:19:44',1,3),(42,1,'<a href=\'./article.php?blog_id=14\'>Guest评论了您。</a>','2018-02-27 09:14:17',1,3),(43,1,'<a href=\'./user.php?user_id=\'>Bobisgood</a>关注了您。','2018-02-27 06:23:23',8,3),(44,1,'<a href=\'./user.php?user_id=\'>Bobisgood</a>关注了您。','2018-02-27 06:33:09',8,3),(45,1,'<a href=\'./user.php?user_id=\'>Bobisgood</a>关注了您。','2018-02-27 06:33:25',8,3),(46,1,'<a href=\'./user.php?user_id=\'>Bobisgood</a>关注了您。','2018-02-27 06:45:49',8,3),(47,1,'<a href=\'./user.php?user_id=\'>Ainassine</a>关注了您。','2018-02-27 06:49:42',3,8),(48,1,'<a href=\'./article.php?blog_id=17\'>chenyang评论了您。</a>','2018-02-27 07:00:52',9,8);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_type`
--

DROP TABLE IF EXISTS `msg_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_type` (
  `msg_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_type_name` varchar(20) NOT NULL,
  `msg_type_info` varchar(100) NOT NULL,
  PRIMARY KEY (`msg_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_type`
--

LOCK TABLES `msg_type` WRITE;
/*!40000 ALTER TABLE `msg_type` DISABLE KEYS */;
INSERT INTO `msg_type` VALUES (1,'test','For test'),(2,'公众号推送','公众号推送');
/*!40000 ALTER TABLE `msg_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_time` datetime DEFAULT NULL,
  `news_content` text,
  `news_platform_id` int(11) NOT NULL,
  `news_title` varchar(100) NOT NULL,
  `news_url` varchar(255) NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=419 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (252,'2018-02-19 16:52:07','必看！',11,'厉害！这个男孩考上了&quot;世界录取率最低&quot;的大学，还有200万奖学金','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CB-5Bs-2fHXKho03ArWSEWFFcMVTLsmoeu2pM6hsHGhwwEmrGuEIA*lD45ZPoTPCxqUm6vFG5S-kLxNyvooQub0k='),(253,'2018-02-19 16:52:07','必看！',11,'一男一女大年初一放鞭炮遭&quot;悬赏追捕&quot;，官方回应来了','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CB-5Bs-2fHXKho03ArWSEWFHfr6jhhQKi7TMuvT3ryaks7Ga6S-3-cTLivN4gBlMDY36x7Ty7OMikQ5TMj4i52sc='),(254,'2018-02-19 16:52:07','必看！',11,'过个年，南方人又一次看懵了！就因为北方人的这个动作…','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CB-5Bs-2fHXKho03ArWSEWFHRjfWXR3BWsFDCjeexyXftFzpZ*eF8KYkOKYxz-M5SiXHuNJjoJaCt1aYa9SNIi1M='),(255,'2018-02-19 16:52:07','必看！',11,'晒衣夹竟然有这么多妙用，看完准备买5打了！','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CB-5Bs-2fHXKho03ArWSEWFEnzwsUGJ7VypZNOk9FPthnyJEkDlGhL6rpDnDL219uoXe-hgxgcmrMzpUPmsZYFYw='),(256,'2018-02-19 13:09:01','我们近来，都好；你们能来，真好',11,'一封信的约定','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CB*sbxPNqJTpHpMysMAKoOx*KYiaHsLZeDFyjpNLIXxs6qMc0hA-Q8XH16pUJ7IHoUA9oMvLoRo-z-Yahia16Wdw='),(257,'2018-02-19 13:09:01','必看！',11,'没想到！我们祖先的启蒙读物，唱出来这么好听！','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CB*sbxPNqJTpHpMysMAKoOx-NN-F7GqerIyfz7LbjDExxlZgFC04--Uuo8aT05FGOeR5yBRl1RHCjVITdWePbsTw='),(258,'2018-02-19 13:09:01','一路走好！',11,'人美心善！除夕这位热心的女孩走了，但她把爱留在了人间','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CB*sbxPNqJTpHpMysMAKoOx8qnvBLPA5nt*VVEihjDfmL03Sqi2qW*0i3eIcXozw2yM8MOknhQC7pH-16mTf9GLM='),(259,'2018-02-19 13:09:01','最怕空气突然安静，最怕七大姑八大姨突然的关心。',11,'春节最可怕的，不是抢票，不是春运，而是走！亲！戚！','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CB*sbxPNqJTpHpMysMAKoOx83HDQm5pzQksI-jQyoyscWhf1LkKCPtfHdghF2nkHaA6xZ2qYWMQnhHkJcN4wKVL0='),(260,'2018-02-19 10:37:36','旨在创建加速媒体融合的新型强劲引擎和广泛覆盖的传媒业战略基础设施',11,'新华社为媒体研发了一款“神器”，新闻生产将出现“未来场景”','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CB05645JQvVOTisCO-tX1iYTG-fhrsbff0d6P7gWUt9L-B7tktcgoxsPHv2BfjKAlCsI0d05*6am3hLmyEF1r6lE='),(261,'2018-02-19 09:30:51','北京时间今日1时18分，迎来农历狗年的第一个节气——“雨水”。',11,'今日雨水 | 春雨贵如油！','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CByc-XOLEzyAmReZzNt3rik5EDKpJhQ7yQJKyvDx*48Oz7C9*amYHr7bquonsF825kNHmL79qEIgu-2mw*3k-HyU='),(262,'2018-02-19 09:30:51','依法打击违法活动！',11,'国家林业局通报网传野生动物年夜饭：发布者已受调查','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CByc-XOLEzyAmReZzNt3rik6NxtBhjHpiWRqFEwlOvgGnXLCo4eOwmmsQIHVXdL-f6IfBOr57Xi1pdHkF59NEheY='),(263,'2018-02-19 09:30:51','告别泡面，吃上年夜饭。',11,'还记得&quot;杀马特创始人&quot;吗？他现在成了发廊小哥，流浪多年终于回家吃上年夜饭','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CByc-XOLEzyAmReZzNt3rik7P3YF6otd9bbu*hD7mSqOTOBUSbK7iA6cKkMj7ZY7OvIbxkejjcq-q2IDIP0uq2bk='),(264,'2018-02-19 09:30:51','平平安安过年！',11,'14岁男孩被炸伤手指！过年做这件事最伤&quot;手&quot;，医生提醒要记牢','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CByc-XOLEzyAmReZzNt3rik6JXZ3D74aQXUIdj7bwSzj0risNwF5qlIdRhn3Qmshk4LOCzpsrPhGV2xcUzatYWvk='),(265,'2018-02-19 07:27:48','新青年第8期：18岁，我准备好了！',11,'“00后”成年：成长是一个又遗憾又惊喜的过程｜新青年·王源','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CB65ArBuyET-nLsr6al7Y48okfvhM7ihVyIQLZ12wxfF65F4NeXyMLbJP7KUenHTzo7Fy-ybx0U5wBHipnueIi6Q='),(266,'2018-02-19 05:30:00','○我国5年累计减贫6853万人。\n○伊朗一架载有66人的客机坠毁。\n○平昌冬奥会中国选手再夺一银。',11,'早知天下事','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CB3iYaL7gpXSSQU75JoklP0m5frFDP3h2mLe8mHgk8AihP2Vh24*Wf-u9Zfeg8tm7Mcn3y48B6MLst*TZL9YXmhA='),(267,'2018-02-19 05:30:00','必看！',11,'大年初四，迎接灶王爷','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CB3iYaL7gpXSSQU75JoklP0lT36DR24b-Fqcnho8EmrAHZMoEC63KMuaaqqI9K9YjbRVrri7x3GtuN4RHI7w9Bmw='),(268,'2018-02-18 22:45:06','前半生儿子是父亲的影子，后半生父亲是儿子的影子。',11,'名人领读 | 杨立新为你读贾平凹《关于父子》','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CB2UepVrZ07gv8z8J0BoeLUPL3gIL8ygGykZz8bDI7PYg82WEq5sANAQ5aMojZv9pDWD492X4lpzC59dlFGqUYIo='),(269,'2018-02-18 21:43:04','新华社“寻找中国之美·味道”每日精选第四期。',11,'陪你徜徉天际，看细风吹舞柳，春水满城花。| 中国之美','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CB10*sbLlfnkSnpgSs2TA4BrZZj8jaLw1QKyaH1nXN*WxAM-qMqlzl3T08w5-jocluVhWcJqT*vgNCrmq3mkBdOI='),(270,'2018-02-18 18:30:55','每天都有抽奖机会！',11,'福利来了！关注新华社微信公号，最高领取1G全国流量！','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CB6tuW2Wv50xYy*kFTh8iFORRarC5YcncpKyqlkloLQyBLDRuePsU3kh2sBjPEfuN*UigLNK3kYVExNZIWk*MX1w='),(271,'2018-02-18 16:34:40','持续关注！',11,'伊朗一架载有66人的客机坠毁','http://mp.weixin.qq.com/s?timestamp=1519034158&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVfFAnOglf*x1IbI9tbsa1ImUrkNgoLcQjejrF5cI0SbXXfavUtoOIyKVKp4R5v8CByPD5v7JWIqyXCd5mgw4QnEelaqlnYj1*D*L0*9aseNSDSEILR14CZyI1MGaBCDcXXa6QSp70w0PjaVpaQdWRJQ='),(272,'2018-02-18 18:00:00','虽然还没有被微软官方确认，但是signature Alladin Information公司研究员Anato',12,'通过MITMf利用$MFT漏洞锁定局域网电脑','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWE0kSX9tvVfYbgdQbyuThsLQEgmNcPeC9lCL73-6WmYaBLcB-FGtMCVz4upUuoTtszoTDa7*DmXF68k031uVMBs='),(273,'2018-02-18 18:00:00','伊朗可能正借助苹果和谷歌应用商城中一些由政府秘密赞助的应用',12,'外媒：伊朗秘密监视用户，苹果安卓应用皆中招','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWE0kSX9tvVfYbgdQbyuThsKqo8QoJgG8spqdb*ZrxuChUTd8wywHuPCBV5ZFDxvSvetZ2kWhTbQSnYVQDmNQaWc='),(274,'2018-02-17 18:00:00','在32系统下，例如我们要HOOK SSDT表，那么直接讲CR0的内存保护属性去掉，直接讲表的地址修改即可。',12,'x64内核中的HOOK技术｜拦截进程、拦截线程、拦截模块(思路)','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWEMYd-IqMP1nmKjsDasiNQ0IBDyjPx-GVDduM4zC2e6BYpVZ-hWQi94gSWUNA6-VYfzsb8S9t1Kr0AdZMQ4eOs4='),(275,'2018-02-17 18:00:00','近年来，SWIFT系统（环球同业银行金融电讯协会）的全球银行客户不断被爆出遭黑客袭击、账户存款被窃取事件。俄罗斯央行近日披露，该国银行的SWIFT系统去年也被黑。',12,'SWIFT再爆黑客袭击 俄罗斯银行被盗600万美元','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWEMYd-IqMP1nmKjsDasiNQ2o-V*1W02rcY1DaduPGRcllMin4hrONmICVfsjLTlnch1RJDMzVUSHleoQdyKDCS4='),(276,'2018-02-17 18:00:00','尽管全行业软硬件厂商在努力制作补丁，有关这两个安全漏洞的新变种攻击还是不断涌现。',12,'研究人员发现SpectrePrime和MeltdownPrime新变种','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWEMYd-IqMP1nmKjsDasiNQ1eYzYnW3ge29SdWa32Kh743*nYv8hZVMnlnMYDQfUE7SppV7RaAeroR9myrz4Q*-E='),(277,'2018-02-16 18:00:00','看雪论坛精华集 新春巨献！',12,'2018狗年大吉，看雪精华第17辑大放送！','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWFBlJqc1ld*RAiMOxg8Tzg9zyLnsA4hfTptr2glljhrDcxqoNM6iFLiuebyAt6k7du9h4YCshOd8sQdYkqtORKM='),(278,'2018-02-15 18:00:00','除夕快乐，新年快乐~',12,'除夕大团圆','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWNjPixgsqymzAz1ijjW2-jBuns64spWakuaDMEAFoMylqDVF6YbangZJ27UA3AQo3IhazpsXxlImypAl3*XE8Sg='),(279,'2018-02-15 18:00:00','最近报出的flash 0day，自己闲暇之余，看看究竟。拿到sample以后，上FFDEC，看看decomp',12,'Flash 0day(CVE-2018-4878)分析记录','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWNjPixgsqymzAz1ijjW2-jDYANDvzwylNB3n7GvNjiumDTjj6Ul*3AUdOCbbuLAPQADyBDyfYogt3H0k4Q26qtI='),(280,'2018-02-14 18:00:00','',12,'Unicorn引擎教程（二）','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWO1nGteFN8HTbGn23s2hCz48D6*pHrJS5-5sinBA5xYuiJz5TsPBhfXYb5T2j5f6ubNaTsd93*x50Jtei2BMEcY='),(281,'2018-02-14 18:00:00','Linux 4.16 RC1 如约包含了面向非 x86 架构的 Meltdown 和 Spectre 补丁（比如 ARM）',12,'Linux Kernel 4.16 RC1开放公测 带来更全面的处理器安全漏洞修复','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWO1nGteFN8HTbGn23s2hCz6TVIDwRP5evx1pwvMQCSHQPE9FZ7zm-8qkPwxxsBYMrF8FJR8REgo*oTHAiYLfaIw='),(282,'2018-02-14 18:00:00','攻击者只需发一条消息就可以完整克隆受害者的微信账号及其聊天记录，并实现微信钱包支付和窃取隐私信息的操控',12,'阿里安全实验室发现“微信克隆漏洞”：一条消息可盗刷你的微信钱包','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWO1nGteFN8HTbGn23s2hCz7xRyj*cnSCFj7LiuMZbShpeqsscFdKbJj88plWO5mcBCBm*dolcgfOAS71vdON2RU='),(283,'2018-02-13 18:00:00','Unicorn引擎教程在该篇教程中，你将通过实际操作来学习Unicorn引擎。接下来将会有4个练习，我会解决',12,'Unicorn引擎教程（一）','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWBqNvWD8lHrTZXWJ8sl7wrGi-PxwH*gG-PO31MS3BlkS5za1q5rSs*yKr7ELQeAcZNOtKMqYw8ejfwUBPk91HZA='),(284,'2018-02-13 18:00:00','安全专家近年来发现加密挖矿脚本的数量不断增加，尤其是那些通过在线黑客服务器非法部署的脚本',12,'调查显示 49％ 的加密挖矿脚本部署在色情网站上','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWBqNvWD8lHrTZXWJ8sl7wrE80gnxWIAOtuIN4MrnLsbSEttR-ilVqS86MCLEEZGsyKlSiscUyFEEfacKReFWymI='),(285,'2018-02-13 18:00:00','The Register称，共有4200多个网站感染了该恶意软件，这款恶意软件是英国软件公司Texthelp公司开发的Browsealoud工具的恶意版本，这款工具原本的目的是为有视觉问题的人朗读网页内容。',12,'英美政府网站被植入恶意软件 电脑被迫挖掘加密货币','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWBqNvWD8lHrTZXWJ8sl7wrFLHfDai*nT-QaMldFxekQZ9wY6p0-*BYuxBtYpxYuUlgmXlyRZjKmziHKX21HK008='),(286,'2018-02-12 18:00:00','第二部分：ReadProcessMemory的实现，说了这么多关于表的格式和查表的方法，在实践中我们该如何利用',12,'利用内核知识，自己实现ReadProcessMemory（二）','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWFwOrAN4El8phcMSzJ6kIUsMiTyeGzVb-6tI6bR6OSszo794P5iYKdSUq3ueNfITrE-QMIvC8vJc*lrR8pjK-8I='),(287,'2018-02-12 18:00:00','俄罗斯联邦核心中心的科学家因“未经批准将电脑设备用于私人目的，包括进行所谓的‘挖矿’行为”而被捕。',12,'俄罗斯联邦核子中心科学家因使用超算进行“挖矿”而被捕','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWFwOrAN4El8phcMSzJ6kIUthvrhM7mNf*h-f3QnLP*lccbRp74b-7eubKh9g7FAhqyj3BOgpSKrYM5CWpKUE2rY='),(288,'2018-02-12 18:00:00','fail0verflow表示，任天堂Switch出现了一个bug，无法通过固件更新修复，而且随时都可能被滥用来安装Linux。',12,'任天堂Switch遭黑客破解 成功运行Linux','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWFwOrAN4El8phcMSzJ6kIUss*d63kRT9SRLJsIHq51*wLKjw0s9FcSv01TGNOrX715x1EBjWoCC*215HBJTu2EM='),(289,'2018-02-11 18:00:00','前言转眼来到科锐学习已经超过一年的时间了，眼看三阶段已经进入尾声，内核的学习也快要结束，记录一下笔记和心得，',12,'利用内核知识，自己实现ReadProcessMemory（一）','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWCe95jMfi4OuHWW5QpzNPvx-eHEo3UlC*F5do2KwRdyULKlVUx8V-eVeqddump4neo9Vi9paFHyB3MC9Y4uduGY='),(290,'2018-02-11 18:00:00','这波网络攻击导致新闻中心的IPTV突然黑屏，正在通过观看开幕式直播进行新闻报道的各国记者们一开始以为是停电，但很快意识到是网络电视信号中断。',12,'黑客攻击致平昌官网瘫痪！开幕式直播信号中断','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWCe95jMfi4OuHWW5QpzNPvz1FRHBIw60TWPBwTk6WleMziBTiYrnhyY0pP1aOl1aHVY2hhEM3Xba7Z*8jJ71k0A='),(291,'2018-02-11 18:00:00','该漏洞存在于Adobe Flash Player 28.0.0.161之前的版本中，能让攻击者通过网络或邮件传播包含恶意Flash内容的Office文档，获得系统控制权、执行任意代码。',12,'Adobe Flash曝出零日漏洞 微软紧急发补丁','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWCe95jMfi4OuHWW5QpzNPvwG2mY2DR56ubJekXlKAESwXGM2pssnrqGlkyAIt4yQh151y4rHXuvFgIqGaFoELbQ='),(292,'2018-02-10 16:41:35','‍https://bbs.pediy.com/thread-224351.htm',12,'汇编指令级混淆器的实现','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWOkZ*iMs06H-KlgkZ1gGCWsgK3nam*jC8c*ffM9uPr*TXE5R3xRFMsMFrzJfDLnsuSppdAgwDO1IaLs0SOyhZ5k='),(293,'2018-02-10 16:41:35','在 IT 行业，“ 技术支持诈骗 ” 是一种相当令人不齿的行为。通常情况下，当受害者访问到某个受影响的网站的',12,'Hotspot Shield VPN 产品被曝安全漏洞，或泄漏用户敏感信息','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWOkZ*iMs06H-KlgkZ1gGCWuwgzACEs5SKZqoCEiH*VBxDNSZi*25khx8XzzBUAZ0qfgNxoRLkJ7q0XQVxMxoNgQ='),(294,'2018-02-10 16:41:35','研究人员最近的研究已经表明，即使手机的定位服务已经被关闭，手机也能够追踪用户的位置。',12,'手机能秘密泄漏你的行踪 关闭定位也不管用','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWOkZ*iMs06H-KlgkZ1gGCWtblaJiphs1gJQfEouOv85Vcn3WxTT3pQW6lzBW26JhzLMplZaFjw*8DhAjD69S6SI='),(295,'2018-02-09 17:59:41','最近在学习ARM汇编和逆向方面的基础知识，抽空跟着“无名”大神的逆',12,'登录抓包逆向分析学习笔记','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWGSFVB5WF2Rf3u-MsLHRKPTA6xfVfBebY8mCb3SWOC2Mgac2hjeTOFSSPNFkBDuQJmG3qfL3RhZcLKAjavpSmm0='),(296,'2018-02-09 17:59:41','在 IT 行业，“ 技术支持诈骗 ” 是一种相当令人不齿的行为。通常情况下，当受害者访问到某个受影响的网站的时候，其浏览器就会被无法轻易消除的 “ 弹窗警告 ” 给遮挡。',12,'Chrome 难抵恶意下载攻击 数秒内耗尽资源失去响应','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWGSFVB5WF2Rf3u-MsLHRKPTzyAM20ZZ7vsOxUjcj-HkabH0OWZcu0vE5LH2bXADaGJG5ZqSbwQyh8tgO9bXSp0k='),(297,'2018-02-09 17:59:41','人们在分析后发现，这部分源码似乎与 iBoot 有关（确保 iOS 操作系统受信任引导的这部分）',12,'iPhone iOS 9系统源码已被泄露至GitHub 越狱者或可找到新方法','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO7TSg0x7W7oHNJ7ZID0JxVOiqe*g0dhiZ*58sZLaAPkWGSFVB5WF2Rf3u-MsLHRKPT2ZORdkNxyRjADmHz1xnexaYbgoZRFdb1vuFm8uQd4pmm-yTi02RDkdIc8cW328Uw='),(298,'2018-02-14 11:11:59','为了通俗易懂，我决定不惜自毁清誉，用充满荷尔蒙的比喻。',13,'区块链与裸照：一个去中心化的色情网站是什么样的？','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4M2qO3Bi3gmPuOj9bIDuZgmSxyooS4gLxVWP5QVnmmMcnKSX3Ugr2*A7Tvq4NSHz7KAvlkNlzEffJlprMUkshE-M1wXgsRC7bj7P75HHjeWhaNNz8arfxM5yyLSiEnn9c='),(299,'2018-02-12 10:53:16','无论在哪个榜单中 Python 都是保持着非同寻常的增长速度，在去年11月份超越C#后，仍保持快速增长，按照本月的成绩，与排名第三的差距很小，而且值得注意的是Python的增长速度几乎是C++的4倍。',13,'TIOBE 2月编程语言排行榜：Python 有望赶超 C++','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4M2qO3Bi3gmPuOj9bIDuZgmSxyooS4gLxVWP5QVnmmMQXr*6qfEOduPsz1vxJ*mjvLMQdJkyvs97kqLnyxkp2tEz34m1z8OmO-9XB1cgHAlJ6E8dtnS0luT0U3c9UIwc0='),(300,'2018-02-09 14:53:09','本文，通过几个小例子简述 python 对 csv、json、mysql 的简单操作。',13,'实战：从Python分析17-18赛季NBA胜率超70%球队数据开始…','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4M2qO3Bi3gmPuOj9bIDuZgmSxyooS4gLxVWP5QVnmmMQfpq3VJh8A-xb8mpKrwB4qS9wzQpDyNmgJvmx90d2Yp3fSLpDBK69bfj*gvgLhv7a8JgeDzdTLRgZi7lz4vH3g='),(301,'2018-02-08 10:43:55','原来这些编程语言都是这样子诞生出来的！',13,'编程语言简史：因为讨厌花括号，于是他发明了Python','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4M2qO3Bi3gmPuOj9bIDuZgmSxyooS4gLxVWP5QVnmmMRQGdS5SnO1Rw75bvMMA49hoeco7IwQonkUKUjfhvcw*5v4217kMmooZqyx4RbFAUdWFnQ5E7a8NVhyFqmuedb8='),(302,'2018-02-07 08:30:00','年底了，你一年下来有多少努力已经完成，你心心念念的大数据开发，都学会了吗？想跳槽的你，想就业开发工程师的你，资料已经帮你准备好啦！含项目源码！！',13,'【限免|含源码】大数据资深开发必须掌握的实战项目！助你涨薪！','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4M2qO3Bi3gmPuOj9bIDuZgmSxyooS4gLxVWP5QVnmmMQ7v7yBD1EFHHC*MkBMK*JoEEKs3ughyZCB0lQ1y*rsq0rkD83oso*wqfgJqGe0YybxKTxOVl36vQjvg1gsegu8='),(303,'2018-02-07 08:30:00','DBA、运维工程师、PHP工程师、前端开发 ... 招聘会',13,'趣图：PHP、前端、DBA、运维工程师招聘会','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4M2qO3Bi3gmPuOj9bIDuZgmSxyooS4gLxVWP5QVnmmMQ7v7yBD1EFHHC*MkBMK*Jq0cDRMzMqhrQFUr29y9X1bCxJNGtP5UJ**iG4GY8WZSJm7Y2EFl6KD97qnRDmT5Z4='),(304,'2018-02-06 10:35:26','博主本人 2015 年毕业于郫县某 985 大学通信工程系，因为大学期间一直自己创业所以错过了大四秋招春招，毕业后又在北京继续创业一年，于是从16年年底开始通过社招找工作。在此总结一篇文章给各位参考。',13,'2017 后端面试经历分享','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4M2qO3Bi3gmPuOj9bIDuZgmSxyooS4gLxVWP5QVnmmMcPh8wrlU1NI9NJBPSyDdDxa7jX8S2TZCL7PGD9q0LJI2qta2FDWfhL1e5iwRQZSCuj*d4z3ndfzlB-jHq8VxNI='),(305,'2018-02-05 11:06:55','Python 科学栈中的所有主要项目都同时支持 Python 3.x 和 Python 2.7 的情况很快即将结束。',13,'Python 2.7 即将停止支持，请收下这份 3.x 迁移指南','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4M2qO3Bi3gmPuOj9bIDuZgmSxyooS4gLxVWP5QVnmmMRD1BahGzHmIAwRBav*Huvv5BupLRzDJPnMtQMVDkNTG8cYD-F2u9oC44462fikZsSD1QoFIfACrUb76zKdql3o='),(306,'2018-02-03 09:21:25','最近“全民答题”类节目爆火，各大平台火药味十足！程序员到底应该如何玩呢？',13,'程序员给“冲顶大会”做了个外挂，轻松瓜分100万奖金！','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4M2qO3Bi3gmPuOj9bIDuZgmSxyooS4gLxVWP5QVnmmMXauXhihtdtE3mZPWNNyxlGR*NJJ2oyANmt4aziuBm3N61QnRZQzI0-sejy0iAKo29COXen9QlO5stazYyr79Co='),(307,'2018-02-02 14:00:00','人工智能正以前所未有的速度，渗透、改造着各行各业。而加速这场变革的力量之一，正是 深度学习 技术。',13,'给你深度学习的10个实战机会','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4M2qO3Bi3gmPuOj9bIDuZgmSxyooS4gLxVWP5QVnmmMYKfAgRGckQ-n-8r6ZHAZoQpRygFtt18fucn2gwiUqSRbF5iQGnuSxxQoaKmyFn2Jea6FyBTBqH-y32tcFlYmLU='),(308,'2018-02-02 14:00:00','建议放弃这个想法。\n工具只是工具，学习靠的是人。\n为了打消这个念头，本文详细解释一下原因。',13,'用树莓派学习Linux及Python真的高效吗？','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4M2qO3Bi3gmPuOj9bIDuZgmSxyooS4gLxVWP5QVnmmMYKfAgRGckQ-n-8r6ZHAZoSokbMgJNM2jJdT20SCpOQa8lXXJUJW4D3rcy5MbsiUgH8-42lmSyQ4PhLCHecSlaM='),(309,'2018-02-01 11:02:45','有超过四分之一的开发人员在他们16岁之前就写下了第一个代码。JavaScript可能是雇主最需求的语言，但是Python赢得了所有年龄段开发者的心。Python也是开发者想要学习的最流行的语言。',13,'2018全球开发者技能调查：编程始于少年，Python 成开发者最爱','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4M2qO3Bi3gmPuOj9bIDuZgmSxyooS4gLxVWP5QVnmmMcCmsL*F0IK-SG4aFmREK2GTTEtNDa0Jip9RprUwNvltHLz94izeMvBMpTz1AmIoIBm4XAxAzC3V9U*UnLPto*Y='),(310,'2018-02-14 09:00:00','ServiceComb 在 2017 年 12 月 4 日全票通过进入 Apache 孵化器。但在 13 天前，Asim Aslam 在 GitHub 上觉得有人将他开发的 go-micro 代码拿来改头换面后，做成了一个新的微服务框架。',14,'华为云ServiceComb代码抄袭！已致歉','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4fy9ZYgFl1lU0-MjiloHJaxv-Unj3Y0yUYQ1fSkiIvMUilyT4oJDh*AVOfJMf*tJKjUpnbsOq9fgm6qBzx1v*IEek7RF8OU0IV7bAJr8YSp2-V4D48RyThEK1oqD*ai4g='),(311,'2018-02-13 09:40:23','一次机器学习探索之旅！',14,'机器学习实例','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4fy9ZYgFl1lU0-MjiloHJaxv-Unj3Y0yUYQ1fSkiIvMYcyHyeMFJD*UOdUIxOyD5Ws3TsDTV0IFK-4ndSAo-kmjdoI1kMaY7yCwrsAq*92layebjB*AQyKLKlqi*LT6pE='),(312,'2018-02-12 10:08:29','女神们都下海“拍片”了？AI毛片横空出世，岛国老师们要失业？',14,'开源 AI 技术潜在危机爆发，被大肆用于色情方向','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4fy9ZYgFl1lU0-MjiloHJaxv-Unj3Y0yUYQ1fSkiIvMcbq-FOiB-vBjfyVVo6*0D3phSsowO73RJDrHTyEwyAmlSzyWTxZ4jxpwv7R9z9RZaPlYyYoC7UBOdw6f851GTc='),(313,'2018-02-09 14:12:52','最近，微信小游戏跳一跳可以说是火遍了全国，从小孩子到大孩子仿佛每一个人都在刷跳一跳，作为无（zhi）所（hui）不（ban）能（zhuan）的AI程序员，我们在想，能不能用人工智能（AI）和计算机视觉（CV）的方法来玩一玩这个游戏？',14,'AI 玩跳一跳的正确姿势，Auto-Jump 算法详解','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4fy9ZYgFl1lU0-MjiloHJaxv-Unj3Y0yUYQ1fSkiIvMUsmE0lJ0liaXmj5c54Y6qn97vfHVEs9CHoGWhMLdTTebbkhfCt2xkmvXgTRGEZGq70kdYB8shvgUr7b1qKUULQ='),(314,'2018-02-08 11:16:32','对于数据仓库、ELT、Hive、Teradata的简单介绍。',14,'漫画：什么是数据仓库？','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4fy9ZYgFl1lU0-MjiloHJaxv-Unj3Y0yUYQ1fSkiIvMe62bPf8zE9SruEtU-5hgUmsUbO3JEBw0D97spQP88JMrpwZ0OrX-mtYxmk4GB3RB5tZf5THWYYj2CoKpAMgsyA='),(315,'2018-02-07 10:29:53','2017年哪些机器学习项目最受人关注？',14,'2017年GitHub中最为流行的30个开源机器学习项目','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4fy9ZYgFl1lU0-MjiloHJaxv-Unj3Y0yUYQ1fSkiIvMXG7m-arSjI5MTp08GxSrrnkIrhJ9qjLnt3M96VpkaDqS*zlVuFoEp95pCfPAVJ2B-M7-SuOpiY1SPyPZbKuQxk='),(316,'2018-02-06 10:17:06','这真是一个充满不确定性的时代。',14,'重磅！谷歌突然宣布！百度、滴滴懵了','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4fy9ZYgFl1lU0-MjiloHJaxv-Unj3Y0yUYQ1fSkiIvMX7ZyCs2cho12HLhVzEjcYVEijF2WxfQDVg3BRLMJ0V8kwPyGPnTpVE1uGKTHP1jQPJOpgpisbC642x*EIzgXFY='),(317,'2018-02-05 10:55:48','Hbase是最适合于非结构化数据存储的数据库！',14,'一文读懂大数据时代的结构化存储数据库——HBase','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4fy9ZYgFl1lU0-MjiloHJaxv-Unj3Y0yUYQ1fSkiIvMajMpwrKeQv0tT*0tztnEiOQfEV6kWQeZKCBSkF-7nFC-Waxc28Dr9Vk78n*tEQHX2hT-Ps4sIbk*UrvhEQpIPE='),(318,'2018-02-02 10:47:46','区块链（blockchain）是眼下的大热门，新闻媒体大量报道，宣称它将创造未来。',14,'火爆全球的区块链到底是怎么一回事？一文带你看懂','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4fy9ZYgFl1lU0-MjiloHJaxv-Unj3Y0yUYQ1fSkiIvMfJwpGv4imanDqF4lRChuyCnHWThIiri7cnfCVRT3q9enyGDHXVuOmh8Btr7FmzJK8w8-cWWqjsjZiTY6KZL21Y='),(319,'2018-02-01 07:40:00','人工智能正以前所未有的速度，渗透、改造着各行各业。而加速这场变革的力量之一，正是 深度学习 技术。',14,'搞定这10个实战项目，让你击败80%的深度学习面试者','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4fy9ZYgFl1lU0-MjiloHJaxv-Unj3Y0yUYQ1fSkiIvMQYEK*1m3Awe-3VJADj7zlOaQTFYwFRBXxbvRsPX8AyWZ5W*PkwqBy9I-bzjpSaE*irVjSkPm-xK4uzpE5cGIAc='),(320,'2018-02-01 07:40:00','1、英国首个超市机器人上岗一周惨遭“解雇”\n2、斯坦福大学用 AI 预测病人何时死亡，准确率达到 90%\n3、阿里巴巴创全球首个 AI 中文字库 可增强展示效果\n4、教育部：AI、算法、开源硬件等进入全国高中新课标',14,'英国首个超市机器人上岗一周惨遭“解雇”；斯坦福大学用 AI 预测病人何时死亡，准确率达到 90%；全球首个 AI 中文字库','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO4fy9ZYgFl1lU0-MjiloHJaxv-Unj3Y0yUYQ1fSkiIvMQYEK*1m3Awe-3VJADj7zlOU8rAqIkec--wyjkSt3mzuFC-Z0j4SybA1DDm6JjPRkEux5kWKJgWp4uoTjXhBpEU='),(321,'2018-02-15 09:00:00','嘿嘿，过年技术人就要玩点不一样的！ ≖‿≖✧',15,'机智的技术童鞋，你能解开这个贺岁彩蛋吗？','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO752Wn1iJTciNZeBX84iFpuO7lQhSzvIt15EEyV6QAlpdg6ZAdD7Rcnukl5oBvafKPWIez1aT6ePm1llOqL77etfAOoC1Pku3I6w0nFopCmhoVy8JAnYXBqCKGq2my3Y6A='),(322,'2018-02-13 12:00:00','嘘～千万保密！',15,'快要过年了，阿里妹想和你说些悄悄话','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO752Wn1iJTciNZeBX84iFpuO7lQhSzvIt15EEyV6QAlpajHzTGY78byXzYAf58niOAqYF5ArnDbW0eyVdFVevZgWnglKVBboqZfDDovx8c2qL0Yo9VV3leOOnJzj6BoNJw='),(323,'2018-02-12 08:08:00','这是阿里巴巴未来数据中心建设的标准技术。',15,'揭秘！阿里数据中心大幅降低成本的核心技术：混部技术','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO752Wn1iJTciNZeBX84iFpuO7lQhSzvIt15EEyV6QAlpUMcM9X2KTVTchzEpGXY4P38LwtcU31-3gso0CC8G5j9llmY149af64IvuMbc*WWYbg7wYfea-X2z6BkjbxKfYM='),(324,'2018-02-09 08:08:00','今天是手册发布一周年的日子，我们想和你说说心里的话。',15,'你不知道的《阿里巴巴Java开发手册》背后故事','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO752Wn1iJTciNZeBX84iFpuO7lQhSzvIt15EEyV6QAlpczwCDdmT1XEx*c0LjSiqJaXAtBXyAVrrHL1UGdhWqUzkzOGKcr1yNoffeBTH-5RnX8B9*uA6BhDJFqqzcbWEYI='),(325,'2018-02-08 08:08:00','IoT、量子计算、边缘计算、自然语言处理、区块链、自动驾驶等前沿技术，未来会如何发展？',15,'2018科技将如何改变世界？12位阿里科学家发布年度科技趋势预测','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO752Wn1iJTciNZeBX84iFpuO7lQhSzvIt15EEyV6QAlpaaU7n806nnBNmDPDRI0BL-ohCofhvupH*3zqiX9sbZTS0TI7BsHOEbxwVqGMk8Yrl-kQWTwtriBXDBO0Oq9Sao='),(326,'2018-02-08 08:08:00','Tengine，轻量级Web服务器，基于Nginx进行开发，针对大访问量网站的需求，新增了很多高级功能和特性。',15,'Tengine开源新特性：如何让HTTPS处理能力轻松翻倍？','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO752Wn1iJTciNZeBX84iFpuO7lQhSzvIt15EEyV6QAlpaaU7n806nnBNmDPDRI0BL*RZLdbLt2sOKPhFB*5143yKcxpEEQi33YCRsAc821udMM9aBoqD7mBF2zi0u6Y*fA='),(327,'2018-02-07 08:08:00','冬日尚严寒，咱们不妨围炉煮酒，一起打开这份独特的“知识年货”。',15,'重磅下载！业界首本强化学习应用宝典，阿里核心算法团队联袂打造','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO752Wn1iJTciNZeBX84iFpuO7lQhSzvIt15EEyV6QAlpVqUA8Tc0hveUYStiQhEzXVDOwC-8KIRxfkz32buggvUGy10**J6KOYNNEJjjybqi6Vx6V21*jBf-Owmpmq35A4='),(328,'2018-02-06 08:08:00','前端、客户端各个突破，无限接近完美。',15,'为什么你做的H5开屏那么慢？H5首屏秒开方案探讨','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO752Wn1iJTciNZeBX84iFpuO7lQhSzvIt15EEyV6QAlpWL**FBUN7vBgWFIpAOH3i81lBKlIPXmAYa0WTPt-pzO8lstal0oR1QYls3Izg2*u6VKDZJkxaSaqUCZCJZ0IyQ='),(329,'2018-02-05 08:08:00','阿里资深算法专家海青，为你盘点小蜜背后的技术。',15,'阿里小蜜这一年，经历了哪些技术变迁？','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO752Wn1iJTciNZeBX84iFpuO7lQhSzvIt15EEyV6QAlpW3KlIgIQtOqJvxW7*XEti*pBu18bsZoONjT14pkEdrjJP4rJ*fMK0Mv9v6ME2XBonT9bfbHp62HI7EIaIXZhtE='),(330,'2018-02-02 12:31:28','敏捷开发就是快？NO！',15,'敏捷开发，你真的做对了吗？阿里文娱广告团队敏捷实践总结','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO752Wn1iJTciNZeBX84iFpuO7lQhSzvIt15EEyV6QAlpZqtAJEXcfaEmQ9dPyOTyx42uraMLq2tcWDs8RhTy-dkU9oThJZr*ouBLmw*eHcRWmUJqFCUAcjdt81Xek4JEGs='),(331,'2018-02-01 08:08:00','跨店凑单，没那么简单。',15,'阿里凑单算法首次公开！基于Graph Embedding的打包购商品挖掘系统解析','http://mp.weixin.qq.com/s?timestamp=1519034159&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYVRIdzXgOMEBqxU3F27XO752Wn1iJTciNZeBX84iFpuO7lQhSzvIt15EEyV6QAlpdOD1tl3rl4aZ0Gc1aJzem04JT*KpDTZGR5dRFNanjMiAb8V6SFCDrjAOAfjxZM1kzvBjLdkIMaRvgYuLurX9Eg='),(332,'2018-02-10 19:26:54','神经网络和量子处理器会擦出什么样的火花？',16,'量子计算机的首要任务是加速机器学习','http://mp.weixin.qq.com/s?timestamp=1519034160&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYF8wCYmHRsEC7u2P2TyE*zCzC6HLcGoi-1ZqtLZovK-Lo8QaOCQAKihoVvNr*CLb1N9PM1i3KDJH4*NNPfp5Y0rkQjSL8z18e2meM3KQsXxYwGEtPhUArCRGF*kJR5XqveXov-rPgLuzSeS8Ht7dic='),(333,'2018-02-09 17:57:53','入门必读，深度学习三巨头科普力作',16,'深度学习综述：Hinton、Yann LeCun和Bengio经典重读','http://mp.weixin.qq.com/s?timestamp=1519034160&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYF8wCYmHRsEC7u2P2TyE*zCzC6HLcGoi-1ZqtLZovK-Lo8QaOCQAKihoVvNr*CLb7NzwMNGkCTpPY3UbUB1*vNTL3nJFhyuxlqMiZL47mAj7VO-crW342fFRogYgkG2pDfzSDI4E9TWwekjO3dSRL8='),(334,'2018-02-09 17:57:53','我究竟该如何转型人工智能工程师？',16,'AI浪潮下的技能转型，你准备好了吗？','http://mp.weixin.qq.com/s?timestamp=1519034160&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYF8wCYmHRsEC7u2P2TyE*zCzC6HLcGoi-1ZqtLZovK-Lo8QaOCQAKihoVvNr*CLb7NzwMNGkCTpPY3UbUB1*vMVrg-EZPK83CsCq3*4yNOBWcLrWkC*9bXsQJQSUypVVJ4Uf6jvgBlXlPxEl1dHl4o='),(335,'2018-02-08 17:03:00','值得收藏',16,'AI速查表：神经网络、机器学习、深度学习与数据科学一览','http://mp.weixin.qq.com/s?timestamp=1519034160&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYF8wCYmHRsEC7u2P2TyE*zCzC6HLcGoi-1ZqtLZovK-Lo8QaOCQAKihoVvNr*CLb0funzMhGaSKBTjMqIuvaPpqtyFHVEu2khY4fkmKHDzMZKNueux3FMabmsija7fljf86noRnxW3ydrzRTxV0mMM='),(336,'2018-02-07 19:15:21','聚类能力全面测试，你过关吗？',16,'40个问题测试你的机器学习聚类技术（内含答案与解读）','http://mp.weixin.qq.com/s?timestamp=1519034160&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYF8wCYmHRsEC7u2P2TyE*zCzC6HLcGoi-1ZqtLZovK-Lo8QaOCQAKihoVvNr*CLbz9vAAzomx2aLkZHlVoSVkkK1pTytWxBwYk1w3mOAFEAWEJT3WQfN46nagIowXyJCCi2h2VaDTtVVRu4qlGnRCM='),(337,'2018-02-07 19:15:21','成功运行Apollo环境需要购买多少钱的设备？',16,'仅需5000元，即可配置Apollo计算平台！','http://mp.weixin.qq.com/s?timestamp=1519034160&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYF8wCYmHRsEC7u2P2TyE*zCzC6HLcGoi-1ZqtLZovK-Lo8QaOCQAKihoVvNr*CLbz9vAAzomx2aLkZHlVoSVkkADx2LZxPvYmVW*9Kp6DEkWTjCsMmE83GTQlhLp8vB6RQZdSyKcfqGbX6m1YMsKek='),(338,'2018-02-06 18:54:17','商汤研发总监林倞谈后深度学习时代的挑战',16,'后深度学习时代：弱监督学习、自主学习与自适应学习如何用于视觉理解','http://mp.weixin.qq.com/s?timestamp=1519034160&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYF8wCYmHRsEC7u2P2TyE*zCzC6HLcGoi-1ZqtLZovK-Lo8QaOCQAKihoVvNr*CLb-sZlC4mf2q0Em2pcDYLcm0cRftZ9sReuyXiogjrByiFQ85CR6JUfl4*fFzVFOXPYxoBKbCejQXugKc7Ofn0ddU='),(339,'2018-02-05 13:08:13','前提是，深度学习要像光学理论一样进行层次化抽象',16,'像教光学一样在高中教深度学习？怼过LeCun的Google大牛认为这事有出路','http://mp.weixin.qq.com/s?timestamp=1519034160&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYF8wCYmHRsEC7u2P2TyE*zCzC6HLcGoi-1ZqtLZovK-Lo8QaOCQAKihoVvNr*CLb0wlNLzW-2QaV556W4NakkWBhVcDvu5gZEcXP3NguFILEK3D2bGJ4bYfItHQpE4IbRw25xXFzy2beM2mEZRV38A='),(340,'2018-02-01 18:35:50','一文看尽LSTM',16,'详解LSTM：神经网络的记忆机制是这样炼成的','http://mp.weixin.qq.com/s?timestamp=1519034160&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYF8wCYmHRsEC7u2P2TyE*zCzC6HLcGoi-1ZqtLZovK-Lo8QaOCQAKihoVvNr*CLb10ITbAOGDBwy8UiK02yQChFpUg*4KQAMoQrzlomZ8NUDUWDKOA7EgUvgS7rQHyJqicjdY4ADeiJFGPMM4W4mmM='),(341,'2018-02-01 18:35:50','Telepath推荐模型——京东智能广告实验室的最新成果',16,'AAAI 2018 | 京东公布基于计算机视觉的电商推荐技术','http://mp.weixin.qq.com/s?timestamp=1519034160&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYF8wCYmHRsEC7u2P2TyE*zCzC6HLcGoi-1ZqtLZovK-Lo8QaOCQAKihoVvNr*CLb10ITbAOGDBwy8UiK02yQCis6NjIC0MozZzTycKKzlPZmtcci51H8hxegu7yXD*k84RKVZo*vj8PnbsSoxdEifA='),(342,'2018-01-31 19:59:09','最精彩的Python合集',16,'Python &amp; 机器学习项目集锦 | GitHub Top 45','http://mp.weixin.qq.com/s?timestamp=1519034160&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYF8wCYmHRsEC7u2P2TyE*zCzC6HLcGoi-1ZqtLZovK-Lo8QaOCQAKihoVvNr*CLb8lqxz7sNhFaWvMXgzfE5DxVZFS0vBP-0TR*eSHxuEwcsa09GjobmjDWGOHcwxh3dHepAz0B4Tfyz2VBhu3EGCo='),(343,'2018-01-30 19:35:46','如何从2017年热门文章中学会应用机器学习',16,'Top 50机器学习项目实战总结','http://mp.weixin.qq.com/s?timestamp=1519034160&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYF8wCYmHRsEC7u2P2TyE*zCzC6HLcGoi-1ZqtLZovK-Lo8QaOCQAKihoVvNr*CLb62fqlfkZkIcBVwPYROeTo628pWYWgWQh8HnAtDoRRBUuNJhh*EGUQtEn2JhoKQYUpmQ0qmaEw0SlCUngjpqvAg='),(344,'2018-01-29 20:40:14','机器学习Python 3.x升级指南',16,'机器学习如何从Python 2迁移到Python 3','http://mp.weixin.qq.com/s?timestamp=1519034160&src=3&ver=1&signature=XBzt0iCkS72ieZPQgHiZVYF8wCYmHRsEC7u2P2TyE*zCzC6HLcGoi-1ZqtLZovK-Lo8QaOCQAKihoVvNr*CLb3Bi93c0ILBRS4DU5bxBySMnj-oSi3im7*Ke274ZOeetk1kbZ7VmIBTI4Gv1YbVXCq4kAb75ogYYLS9b5lZRqWY='),(345,'2018-02-25 21:59:52','高清大图+现场视频',11,'刚刚，平昌冬奥会闭幕，北京8分钟惊艳了全世界！','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFVmw4*JdGNNNDrz8IR5MNlsmjwlTPYqNHTFLE9RbcdS64bxCj6Mq-QSctLhqzrKEr-rcUh6GhY2XVCld6T3hNJMVsOM5HXEMbWkGrtK203i-6SVP-SY8RT6VXvohYmPQ='),(346,'2018-02-25 19:01:30','北京欢迎你！',11,'平昌冬奥今晚闭幕，揭秘“北京八分钟”','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFVmw4*JdGNNNDrz8IR5MNlsmjwlTPYqNHTFLE9RbcdUCtOlfc5N5*I00yf*U-o61syI*gxH3ZKg3ZUWGr0DKmymW5j5Ky0f3l-TkRRSgm7AsdPCl0J3Ais579Ix7nW7c='),(347,'2018-02-25 17:39:06','',11,'中国共产党中央委员会关于修改宪法部分内容的建议','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFVmw4*JdGNNNDrz8IR5MNlsmjwlTPYqNHTFLE9RbcdXoleEFvBIaGp9mwdoq3m17F8-TQrXST*VxzzeqMr-6ReRBk*HQ0orAkW72dYhc02q0yhnChayk*qG5TQTTVbTw='),(348,'2018-02-25 16:37:12','',11,'2022，属于每一个中国人！','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFVmw4*JdGNNNDrz8IR5MNlsmjwlTPYqNHTFLE9RbcdSlmCy3bgnFTXA-Aqimjfjpl5pt7Cupl7auN0bwiaJ0JKZ*-Lwn*lSXMaqRBgRMpD-srrBeHFL0nidOzn*hroQs='),(349,'2018-02-25 13:30:55','',11,'习近平：任何组织或者个人都不得有超越宪法法律的特权','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFVmw4*JdGNNNDrz8IR5MNlsmjwlTPYqNHTFLE9RbcdWdAebzdUshLT2ErXCdiTlL-Gf*YaOrIwzGO-Hle2LtcPKuL1FUCpHsBjC6InasmYW0bP4etD8-1GO9PjZOB6bI='),(350,'2018-02-25 12:15:42','中国军人，关键时刻是你最坚实可靠的臂膀！',11,'&quot;现实中会为救一位公民牺牲几名军人吗？&quot;答案来了……','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFVmw4*JdGNNNDrz8IR5MNlsmjwlTPYqNHTFLE9RbcdRXK5brc3vcBfR6YrUmaJspVBn6NGmHIurohp*ySqUEtolO2sdzQIAxdBssXVoJKu-zrfu6JAVvXOfLozuIeTbM='),(351,'2018-02-25 12:15:42','被称为吃货指南的《舌尖上的中国》昨晚安利了几道中式糕点，颜值甚高，看了赏心悦目。 一组动图先来感受一下～',11,'每一个都是艺术品！能把点心做得如此&quot;有文化&quot;的可能只有咱了','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFVmw4*JdGNNNDrz8IR5MNlsmjwlTPYqNHTFLE9RbcdRXK5brc3vcBfR6YrUmaJsq3G-WrIkEIe63YMEqB*MMnZsN6-c3*WmkSJU6gVFwsW6tFUB*rLEnJRFCCXhzHuG8='),(352,'2018-02-25 12:15:42','一旦爸妈学会使用智能手机特别是会使用微信之后，你的噩梦就来了......',11,'你家的微信群也叫这名字？网友狂点头：同一个世界同一个爸妈','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFVmw4*JdGNNNDrz8IR5MNlsmjwlTPYqNHTFLE9RbcdRXK5brc3vcBfR6YrUmaJsoGMRFy9bhyTXYWHYKXQ9xY*tSLSrSklZysu*JaBRmUXSSgMARtJSJiVLgLzMs3Bqs='),(353,'2018-02-25 12:15:42','近期有消息称某地邓女士“微信付款码截图被不法分子盗刷”。',11,'一张微信截图就能让你倾家荡产？真相是......','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFVmw4*JdGNNNDrz8IR5MNlsmjwlTPYqNHTFLE9RbcdRXK5brc3vcBfR6YrUmaJsoQKbF*wrtMjtHOxpQZIYV91XDDHFHaR2tzkPCOWzeQTqFX77P-Zw0eUNI4lwlmOWM='),(354,'2018-02-25 08:17:56','必看！',11,'只为赚钱，不爱惜麦田？官方却回应：没在农村待过吧？','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFVmw4*JdGNNNDrz8IR5MNlsmjwlTPYqNHTFLE9RbcdXQSHp4eKh*25VKGVFYFGOuQP8p1a-U5LAfGjD*LlL2zB8LO1jJchgb-k7aWZkTHXyMQK4dEYVE-K3C0dmmEyt8='),(355,'2018-02-25 08:17:56','必看！',11,'又一批非法社会组织被曝光！很多冠以“国字号”（附名单）','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFVmw4*JdGNNNDrz8IR5MNlsmjwlTPYqNHTFLE9RbcdXQSHp4eKh*25VKGVFYFGOsyC-Ef-rcTXqoRWKCUewBu9zI7CibpnTU3ShLjBebKZsJEQBoyrwF2oPC1FJjeKIw='),(356,'2018-02-25 08:17:56','必看！',11,'“我们其实是东北那疙瘩的…”匈牙利冬奥冠军一张嘴就亮了→','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFVmw4*JdGNNNDrz8IR5MNlsmjwlTPYqNHTFLE9RbcdXQSHp4eKh*25VKGVFYFGOs9fx1CvJu4M-u-xyHJsVWGk-JzIQ-k1uhIn5NqLzSA3WuFyhDekRVoqaBObY8GKGg='),(357,'2018-02-25 08:17:56','必看！',11,'容易致癌的 7 种做菜习惯，每个中国家庭都很常见','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFVmw4*JdGNNNDrz8IR5MNlsmjwlTPYqNHTFLE9RbcdXQSHp4eKh*25VKGVFYFGOsvRPKOKegAmArZ*uC*1MkvcM1jwRrad6ISzKbSuF5*vLhkoV-QvTUJ0kP*FMlsXF0='),(358,'2018-02-25 00:24:20','必看！',11,'这次中央政治局会议，决定了这些大事！','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFVmw4*JdGNNNDrz8IR5MNlsmjwlTPYqNHTFLE9RbcdetISU4h-hYrrcDNAcizODRFqMF-JJK6YGeCYi-JfDRsRkm2SazFMwJFFFlWZDRmbPfDwWrN08lur7Ro0U4di8A='),(359,'2018-02-25 00:24:20','共2980名',11,'中华人民共和国第十三届全国人民代表大会代表名单','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFVmw4*JdGNNNDrz8IR5MNlsmjwlTPYqNHTFLE9RbcdetISU4h-hYrrcDNAcizODRiSrJrm-knoKbRbG2QMasfZbE4fgVhl01amfLegfdCIq35BNQKsX9ntcZZ1QHI8Ng='),(360,'2018-02-24 21:50:37','每个人头上都有不一样的天空，各有各的绚烂。',11,'夜读 | 幸福的家庭，从不会被这三个字束缚','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFVmw4*JdGNNNDrz8IR5MNlsmjwlTPYqNHTFLE9RbcdeMbzbL3q9SJ0LxXcIe0zxmcBM14YQUopMuCMxOnDx-ledNvnf8GGC0KhKMPzycGk0OW7Azq29RUGI8vxMjmun4='),(361,'2018-02-25 18:00:00','最近做了一道pwn题，挺有意思的，是利用协程切换时临界区控制不当而导致的U',12,'协程切换的临界区块控制不当而引发的UAF血案','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFXgsT57cnVjqkXu8Q8x166HEyMakfdXIP22LTj6wtCAJGGjX0*pjF-A8dsp3JGsAiLvEIQHlR*kd2DiUWEBdM75SYqc4zJmtMuYQI3z4IQNvsOW6zHGM1Xz2VNYZkliw='),(362,'2018-02-25 18:00:00','黑客正在销售合法的代码签名证书去签名恶意代码绕过恶意程序检测。',12,'黑客正在销售合法的代码签名证书','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFXgsT57cnVjqkXu8Q8x166HEyMakfdXIP22LTj6wtCAJGGjX0*pjF-A8dsp3JGsAjW71-kpEoqag84eJOffaeuFjfAMx3WdLNadJQuOmlh3bpbfCm*-jwfsBxVNcvMuw='),(363,'2018-02-24 18:00:32','何为JNIJNI全称为Java Native Interface，是使Java方法与CC++函数互通的一座',12,'Android逆向新手答疑解惑篇——JNI与动态注册','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFXgsT57cnVjqkXu8Q8x166HEyMakfdXIP22LTj6wtCKo82G9CXqvm4gmRIy0WhtjR9kJeI0nD4HRiHcC*zP4HnxKxaDFkN6rt1YMO*5*y*S7ywX7-eIaR2VoYY15hMmk='),(364,'2018-02-24 18:00:32','据The Verge北京时间2月23日报道，当谈论人工智能带来的危险时，我们通常强调的是意料之外的副作用。我',12,'全球 14 家机构专家发百页报告：警惕人工智能','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFXgsT57cnVjqkXu8Q8x166HEyMakfdXIP22LTj6wtCKo82G9CXqvm4gmRIy0WhtjZGsTltrsxe6IaoMPbEsVZr3JY5fLX7sniG11E4uro8BfYdR5eAQz4AkHKL4I84-8='),(365,'2018-02-24 18:00:32','快来报名吧！',12,'招募｜看雪 2018 线下沙龙，年后约起来～','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFXgsT57cnVjqkXu8Q8x166HEyMakfdXIP22LTj6wtCKo82G9CXqvm4gmRIy0WhthjqjLcL-wdEabwSe4PU7M2uPlwnj6IleUsY5Vm8*EmCPM66uZtZ73q0ga-W52XYGE='),(366,'2018-02-23 18:06:14','本文做了个Demo测试小程序来体现masm32开发包的库与VC6.0存在的一些不兼容的问题，如下即为所',12,'masm32开发包与VC6.0之间存在的Bug的体现及解决办法','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFXgsT57cnVjqkXu8Q8x166HEyMakfdXIP22LTj6wtCPdUqnQoJfATpDYcXuClCwTmtH1T1tqJ-bDADder*kNpjd7DAxO88kaJsvoxziaQDbwYnJbUqkJN0Cz1ontCaq4='),(367,'2018-02-23 18:06:14','英特尔已经开发稳定的新微代码，它可以修复 Skylake、 Kaby Lake、Coffee Lake 处理',12,'英特尔发布新微代码 有望修复部分芯片“ 幽灵 ”漏洞','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFXgsT57cnVjqkXu8Q8x166HEyMakfdXIP22LTj6wtCPdUqnQoJfATpDYcXuClCwTyi1IOrzXfhXdVJfUCCe*MHmavwstnK*baXvnvKWmyyuevWsapRi8PgTmIjiMGl5U='),(368,'2018-02-23 18:06:14','不要着急，在即将到来的3月份，就要出版啦！',12,'《加密与解密》（第四版）签名版，赠书名单','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFXgsT57cnVjqkXu8Q8x166HEyMakfdXIP22LTj6wtCPdUqnQoJfATpDYcXuClCwRmCrnq5yFtYPCPdCzgyJLulUdyjtpoQI06J4f4Hbkp-XwsHM4*-j*DXd*CEycAk*s='),(369,'2018-02-22 18:00:00','',12,'浅谈XP下最小PE','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFXgsT57cnVjqkXu8Q8x166HEyMakfdXIP22LTj6wtCEJZiMq*UDw7Jo9CUdYiktjnfl74Q3SkyDmLFwCT5FducSNqM5kKGoFU3bMx54hxbw9-691ilSeWkoPmuAD9luI='),(370,'2018-02-22 18:00:00','该漏洞存在于Web界面中，允许用户远程控制BitTorrent客户端，如果被利用，它可能使攻击者能够控制易受攻击的计算机。',12,'Google公布一个uTorrent的安全漏洞 官方发布了一个无用补丁','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFXgsT57cnVjqkXu8Q8x166HEyMakfdXIP22LTj6wtCEJZiMq*UDw7Jo9CUdYiktghXGbjQu--sboNM4QXNWH*7pRsRZ0MPTf9pUBP8aoDLGKzwb3ujHCPpT8GosV7PoY='),(371,'2018-02-21 18:00:00','最近一直在搞文档类漏洞的自动化挖掘分析（污点分析）。测试那个污点分析工具的时候用的是word2003，测试过',12,'利用污点分析工具发现word2003的bug——word2003转换wps文件时堆溢出（20180129）','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFXgsT57cnVjqkXu8Q8x166HEyMakfdXIP22LTj6wtCLVDsii5vC*bV0wj4qSdG3cl6t9Ic4beZFckVYywRuqwKEgHYyDO9zuIGRg2GyZU5qRP6a8J75c52bjJXxPXSHQ='),(372,'2018-02-21 18:00:00','B 站在公开信称，至今并未发现 B 站的用户账号信息被泄露的证据。对于未经授权盗搬 UP 主内容信息、侵犯 UP 主权益的行为。B 站将坚决支持和帮助 UP 主维权。',12,'B 站发布关于快视频调查结果：称无信息泄露证据','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFXgsT57cnVjqkXu8Q8x166HEyMakfdXIP22LTj6wtCLVDsii5vC*bV0wj4qSdG3cQkxuc0u5zplnpllA8ezuKcMNj-K75zaJBcR1CPK8OmKjdsBR53I7B6UgklpW0nVI='),(373,'2018-02-20 18:10:41','不管是加固，还是脱壳（我讲的是高级壳），熟悉android虚拟机的原理都是很重要的（个人感觉）。所以......',12,'dalvik虚拟机启动及运行原理的研究','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFXgsT57cnVjqkXu8Q8x166HEyMakfdXIP22LTj6wtCIqyIRXtOHOoajXjeiJQPqY2K9uDTCndeL5a3wzM0RwAnd4zysbTCOqcVv1dkyyMETtSl6txy5NFh96f6KBfzUc='),(374,'2018-02-20 18:10:41','​黑客组织 fail0verflow 此前发布了推文及图片，利用漏洞黑客组织成功在任天堂 Switch 上运行了 Linux GUI 系统。',12,'黑客组织释出任天堂 Switch 主机运行完整 Linux 系统视频','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFXgsT57cnVjqkXu8Q8x166HEyMakfdXIP22LTj6wtCIqyIRXtOHOoajXjeiJQPqalhQbFckESNw1E8JMV-0owGyb7qs2TYlvphDJsdA1DmD-Rzy8gOaQOgNOtS9266CA='),(375,'2018-02-19 18:00:00','准备刷漏洞战争中的堆溢出部分，但是对于堆的了解较少，在这里记录一下关于堆的学习记录，有错误请各位大大拍砖。',12,'win32下的堆管理系统','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFXgsT57cnVjqkXu8Q8x166HEyMakfdXIP22LTj6wtCJ7PUmbIyaSm9*MFJkHZdTmf6sX8ix165OmNf-84AelytyJTAAI-awSjaGU4tgrBQ8nnXHPc33cU0FQ7adulaYY='),(376,'2018-02-19 18:00:00','该漏洞可以绕过Arbitrary Code Guard来破坏Windows 10系统。',12,'Google公布了一个微软Edge浏览器的安全漏洞','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmzFXgsT57cnVjqkXu8Q8x166HEyMakfdXIP22LTj6wtCJ7PUmbIyaSm9*MFJkHZdTm9DmcPBmfUre93LlePJpPmOP6eKAzW*nsMdEt70RqWBamoTVBqcyMj2NHievHCCMs='),(377,'2018-02-24 09:51:48','请查收！',13,'2018年1月份GitHub上最火的Python项目','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmxwAmJWWDAmO1LFTNPPb9d5kAB3ey33a-R7WCdhVXq7A18mbu9GhGfFIqowNXeez-AfOuMHlMmLt-R*QXHB8iEn7AFZkCy*785j7LKi96IlGPKeiOEoCPyhpnII0ti-sZA='),(378,'2018-02-23 10:07:07','7215 个职缺要求求职者有编写程序的能力，其中有 6334 个职缺提到最好具备 Python 知识，是雇主最需求的热门编程语言技能。',13,'成为抢手的数据科学家最应具备的技能？先学Python准没错','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmxwAmJWWDAmO1LFTNPPb9d5kAB3ey33a-R7WCdhVXq7A-JWwSaTfu8nmElfnVlxgvWjsU4*tSXkSihPUKaFsEzs*kC57LCbQCzx9NE7U3codto6TL6grnr0X0hyiPs6urA='),(379,'2018-02-22 10:30:06','微软宣布，其免费和跨平台代码编辑器 Visual Studio Code 已默认被包含在 Anaconda 发行版中。Python 用户现在可以在安装 Anaconda 的同时轻松安装 Visual Studio Code',13,'微软再发力Python ，VS Code与Anaconda达成合作','http://mp.weixin.qq.com/s?timestamp=1519569916&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z*UHK7eAueg6hJ5yCCPXlmxwAmJWWDAmO1LFTNPPb9d5kAB3ey33a-R7WCdhVXq7A8uX-eYwPyFYoCPhjfWKTz6jhkPFEsE*Vb*-4yOY*XwTrTsinM17O7ReeNjMc6QZS6pW3d5uBMBLtOZR41RrISs='),(380,'2018-02-24 09:44:22','充电半小时，可以跑跨省',14,'没买车的注意了！华为百度腾讯联手搞了个大事！太出人意料了......','http://mp.weixin.qq.com/s?timestamp=1519569917&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z2PMCTEoew95sjpqOret52FBWHrs1gf5C9mutocwhcwtNMZ3DI4*gL2dme1xgihzWKF182MLzLtmOlUpMhakyjP0tuWtCL-yfF8G0mGCYVxhUaxufdmYAdGTVpU3hcSqiHFQo-Ot8QwNfY3HQfnUS4Q='),(381,'2018-02-23 10:27:28','本文章介绍大数据平台 Hadoop 的分布式环境搭建',14,'大数据平台 Hadoop 的分布式集群环境搭建','http://mp.weixin.qq.com/s?timestamp=1519569917&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z2PMCTEoew95sjpqOret52FBWHrs1gf5C9mutocwhcwtNMZ3DI4*gL2dme1xgihzWKk6b799WDVc4rxHyQWylooEPfN3*MGytojTNm4f0C4M2i5uSDmgefe2vIXXnJTz-ouAM8OlY4nkoyHhv37KVwk='),(382,'2018-02-22 11:45:04','MapReduce是一种编程模型，其理论来自Google公司发表的三篇论文之一。',14,'漫画：什么是MapReduce？','http://mp.weixin.qq.com/s?timestamp=1519569917&src=3&ver=1&signature=nKdWWP9DvsfVeziG4We6Z2PMCTEoew95sjpqOret52FBWHrs1gf5C9mutocwhcwtNMZ3DI4*gL2dme1xgihzWDce2cTG7YkjiiCFAV19yFL3P4nTphZOiIDi9NJTSiyJmzg6EPNyy6KxoavX8vL2SKxU457GY*kuy3uylB8q6kc='),(383,'2018-02-27 11:38:37','',11,'群众反映强烈！四部门对校外培训重拳出击了','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If0GV1CL8yJnja9tA75XwUeCUvVmK9rjKD4vnklhjMOj5AI5446AXjNaPBcICL*DZzZ1pwljvtVCZ8O1964Ga*2c='),(384,'2018-02-27 11:38:37','真是大胆！',11,'假茅台现做，200块就能买到？制假贩子想赚钱想疯了！','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If0GV1CL8yJnja9tA75XwUeD*aT9hu2xBDJ7esObiM8J63rlHUSngLTNpacqfbN-HiV6vMopUrJ*psHSGy9Rh1-w='),(385,'2018-02-27 11:38:37','你怎么看？',11,'小伙带漂亮女友回老家过年，之后剧情急转直下……','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If0GV1CL8yJnja9tA75XwUeAOVrBUDHQwhVrLT79XqC1BA8f7j7jeGJ*csNVB8NWI4-Ysgck2FD-T43hK*UELLak='),(386,'2018-02-27 11:38:37','必看！',11,'看似卫生却不健康的8大习惯，第一个就可能致癌！','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If0GV1CL8yJnja9tA75XwUeCaABoVipv1mgFvJFIZxlP*dxsApNNh9VVkTQy9iUx2KnUYUqSGKQJvY2w-XUeEX9c='),(387,'2018-02-27 08:00:18','贫穷限制了想象力！家里没个上学的，根本不知道补课有多贵！',11,'课外班花掉全家一半收入！补课老师年收入200多万，家长陪课连奶茶都舍不得喝……','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If-hcibuulupu8-4niJBPLXIabn6PpqJPEa9E01d0X3nblSImHapwE0drbn*PXH79LbogUxRnDl62FLKtdilt3xc='),(388,'2018-02-27 08:00:18','红包里藏着亲人的爱！',11,'男子找回丢失的包，东西没少，还多了6000元！背后的故事让人动容','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If-hcibuulupu8-4niJBPLXJ-wtbmHJOpeJvaE6EG0IbaFqks39TaMYnC5FgjltOajP22hTm0i4hWq2YiFdT2VQg='),(389,'2018-02-27 08:00:18','刚认识3个月的女友，要借8万块给父母买房！借不借？送命题啊……',11,'刚认识3个月的女友，要借8万块给父母买房！借不借？送命题啊……','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If-hcibuulupu8-4niJBPLXJkXfAxYurnvj3q8PZN*VYGL7S1S05T04*h9nTwjMB965gmGqvaJqAQglz*dAa0Yds='),(390,'2018-02-27 08:00:18','必看！',11,'透明胶这么好用，很多人都不知道的生活小技巧','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If-hcibuulupu8-4niJBPLXJ7dUeANRxNIv0d9FdMpZO*1r5UtvUlNeB6dPYkBWZW1jIUR9n6f*yLijMWpzMWYvk='),(391,'2018-02-26 21:30:11','我只是偶尔怀念，那些无忧无虑天真无邪的时光。',11,'夜读 | 以前希望快点长大，现在希望时光倒流','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If6oZrdDedKDCZHwtcAQz521ynC*i0p7Q*94po-VX2xelBltOAp6KsVahd3lEfiV6YAy0bYw6zMUeUbiUgV6rfqY='),(392,'2018-02-26 18:54:20','必看！',11,'注意！中小学生早上上学时间要推后，你怎么看？','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If*Vgf5XzyEvKeMrCKz2mcaXHez3Z6qDpQdK79cyWXFE7MZUpaoF9W42Q10GU4Glx9*RCWVIGq2pNRZdvvP0oUJc='),(393,'2018-02-26 18:54:20','这就是正确操作',11,'飞机行李架起火，空姐用矿泉水灭火，网友吵翻了......','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If*Vgf5XzyEvKeMrCKz2mcaXbzjp6vg1fckWw3DGSKsFMZ1zPsiXARoV9f0mfn1Ymh9xvilr3UhMoXzWLlufvQh4='),(394,'2018-02-26 18:54:20','必看！',11,'这几种食物，降火特别管用！堪称人体&quot;灭火器&quot;','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If*Vgf5XzyEvKeMrCKz2mcaWzf5CkTdcEcpeV4oNFXOd53bY3sxfpEZKsslkS-dX-PMzDs8C8emQFQZMSbJAgGm4='),(395,'2018-02-26 15:56:51','坚决防止“假精神病”和“被精神病”！',11,'还有人想假冒精神病人逃脱法律制裁？最高检发话了！','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If9fkJTxM-pOBTMcMMtOvjs3VdeAcD4e67TOXBaDwaKgcgmaZ1KumwnM21waJHLqP1DgX9-vd8RbwYMK7hPY*jqs='),(396,'2018-02-26 15:56:51','必看！',11,'正常操作！国乒横扫日本队包揽双冠，解说刘国梁根本没有担心的机会......','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If9fkJTxM-pOBTMcMMtOvjs3Val*5lEJX6ey1r25UIMsPrcn1GKunuVvkDoJAJSYwsPimjIgUEkCtDkBHRChPLA0='),(397,'2018-02-26 15:56:51','必看！',11,'熊孩子VS电梯，电梯赢了......','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If9fkJTxM-pOBTMcMMtOvjs3CYkoxoAA1g2BAlXp2oBqWagQfhenpe3iKotrLkzG6nvilfOGsvH-lyUBUh0tXaEQ='),(398,'2018-02-26 15:56:51','必看！',11,'车窗上的这些小黑点到底是干什么用的？','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If9fkJTxM-pOBTMcMMtOvjs2uDrdDO8Dtx1AA*TMiIvbneTYapR8NVN2jNm9zb8SkeOCsLurGpuhqfGXaBXNMIvM='),(399,'2018-02-26 12:41:21','持续关注！',11,'愤怒！这家日企官网把大半个中国在地图上抹去，道歉后却依然……','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If-VlvNlf82Bc5PttuBm8-RxdMXidHrdmR-nGtVE4pdFwpKzDN82i5R5mG9iTz01C2GH5-wBtWECTFFuU08TH3io='),(400,'2018-02-26 12:41:21','必看！',11,'兴趣班教的一个动作，让5岁女童双下肢瘫痪！孩子几岁学这些才合适？','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If-VlvNlf82Bc5PttuBm8-RyWVqRlzUrk8HZO2sVnQ6SZUh6hA-EkB-Dy1z-uABFleHip9ePSv7LqfqNsf0ilrOE='),(401,'2018-02-26 12:41:21','主要看图，66666……',11,'原来……医生都是被工作耽误了的段子手啊！','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If-VlvNlf82Bc5PttuBm8-RzJh-f-Gmg6eDDBKTZ3pAIgacxNFqt7zKz8ZJJSwTmRJle*qzmxtlJSVwPD-kgtUG4='),(402,'2018-02-26 12:41:21','必看！',11,'假期长胖了想要挽救？做到这些，你不瘦算我输......','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If-VlvNlf82Bc5PttuBm8-RySWYPERH--8YA-eiaj*wdx4GV*pBJl2kJKnyyAuwvd*O8MBDYLVBUPuKkfkYTZ3ew='),(403,'2018-02-26 10:01:31','必看！',11,'最新！70城房价涨跌排行榜出炉：这些城市跌最&quot;狠&quot;，你在那有房吗？','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If4IWWFzm7PhINEqQs4gFAl-wbWnnV0RHxID*OGye8T0NnzgUBCMNfRLTtualVo4xSmbDtedwCaS5ckMYXBh*7DI='),(404,'2018-02-26 10:01:31','必看！',11,'担心吗？这些&quot;杜蕾斯&quot;竟是黑作坊生产的假货！','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If4IWWFzm7PhINEqQs4gFAl*5GHKigV9MllqkHaTvHM5P3M8hUfMatUWcwYYZVvzFwTnyTlGTtbkpy3-BD-HNSn4='),(405,'2018-02-26 10:01:31','必看！',11,'在抗战遗址穿日本军服拍照的两个人被拘留了，但这事儿还没完……','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If4IWWFzm7PhINEqQs4gFAl9fsSKHjybDqEDwOr0PljZPC41pOKfkJPEcc*2-dXXgXBbR5Hs7yGqJh0u4ld39Ro4='),(406,'2018-02-26 10:01:31','必看！',11,'每天靠墙站5分钟，两个月后身体竟会变成这样……','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If4IWWFzm7PhINEqQs4gFAl*nZnby6vQ5tWRHOUv9D3FniZlMLS7d1MpPCvP5V5vD6FGovGNoIwMcB96pAcSIMJk='),(407,'2018-02-26 08:30:00','新青年第9期：航天员陈冬讲述飞天背后的故事。',11,'出发！我们的征途是星辰大海！ | 新青年·陈冬','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If6fDGIs-yqiqR9RlCifC5Nq4DkHhP94ISadg4kqTfnQafsMBRUCMoYnLc9ezvTgmyd2cLg50WrYYQTnlogpkCh0='),(408,'2018-02-26 07:03:43','时代是出卷人，我们是答卷人，人民是阅卷人。',11,'新华社推出重磅微视频《答卷》','http://mp.weixin.qq.com/s?timestamp=1519708734&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCPodCgStA9Mry3q5l2n0kGXHWMP3oyiPkvfB7*XQm8p2q3x6gYyNOXMHvnpDND0If2roBwuNoYVAbGN9HJYIMXZiH-vXP8wAVeZrtILUV7wrEw2GTkSrDu3qYD2rNqa2qi6trhwo5aFTqxEK2ltV*vk='),(409,'2018-02-26 18:00:43','玩vmp的笔记吧，祝大家新年快乐。先谈谈爆破，这个比起其他的方面的话，应该很多人喜欢，比较直截了当。当然，也会提一些vmp其他的东西。',12,'谈谈vmp的爆破','http://mp.weixin.qq.com/s?timestamp=1519708735&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCGbY6E9bnaSUAMeS*dSVzGAWEOjPUl1nspkqpjtrHMoBJeUYMDvNA0ddIIkKSP5KZASQEhfTKRSPQNSqPdHHAl4bo*eiH6JjSxuZ9g4wTCby740EjIwjmN1Y*VrflXDNrQ9IQ9juZvK7kJvnZfgGYsQ='),(410,'2018-02-26 18:00:43','安全研究人员报告，黑客正在销售合法的代码签名证书去签名恶意代码绕过恶意程序检测。流行的操作系统如 Mac 默',12,'Windows 10公布新版本 修复多个漏洞','http://mp.weixin.qq.com/s?timestamp=1519708735&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCGbY6E9bnaSUAMeS*dSVzGAWEOjPUl1nspkqpjtrHMoBJeUYMDvNA0ddIIkKSP5KZASQEhfTKRSPQNSqPdHHAl46HPrgBB-73iDYET*H5fPS32rrV50rg8obzxtZEDhdDJi9XOMUbLd1OpIok2rsuYg='),(411,'2018-02-26 18:00:43','比特大陆与美国半导体巨头英伟达去年的经营利润30亿美元相当。',12,'中国挖矿公司比特大陆利润超190亿 堪比英伟达','http://mp.weixin.qq.com/s?timestamp=1519708735&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCGbY6E9bnaSUAMeS*dSVzGAWEOjPUl1nspkqpjtrHMoBJeUYMDvNA0ddIIkKSP5KZASQEhfTKRSPQNSqPdHHAl7PnpYmRqfyhYTCHeDVIAnJ9R7SYeqoLKEupZAfkssEGPNGrAGeBS-xW8Kd6cfffuE='),(412,'2018-02-27 10:48:19','计算机历史博物馆从 1987 年起每年颁发会员奖，授予其创意改变世界和影响今天所有人类的人。',13,'Python 之父获得计算机历史博物馆的会员奖','http://mp.weixin.qq.com/s?timestamp=1519708735&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCGbY6E9bnaSUAMeS*dSVzGBbUiIR-DF6GQp1IF7gz5IjsRNoHLR-geyQ9koyLkdQUoB3jfTxNfYAq74B7YPM2*-1g863jW1aJVOhBb7g2DArMr98W2w3ZYl-ba5h726K7i-mJxVysKjSD*pmb1HMlxc='),(413,'2018-02-26 10:30:57','一些 Python 编写的用来解析和操作特殊文本格式的库',13,'实用又好用，6 款 Python 特殊文本格式处理库推荐','http://mp.weixin.qq.com/s?timestamp=1519708735&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCGbY6E9bnaSUAMeS*dSVzGBbUiIR-DF6GQp1IF7gz5IjsRNoHLR-geyQ9koyLkdQUpn4UA2XdXLT39Vqlnb9Jtt51URColGVA70kkQf0E5ozRAQ*JwMc7MfAg4uDLn7Mn2XTgJ16nXYqhf0hsGfg93c='),(414,'2018-02-27 11:19:47','1、输给小学生？11 岁男孩写了一本关于比特币的书\n2、全球 14 家机构专家发百页报告：警惕人工智能\n3、FBI 逮捕中国机器人专家 指控诈骗 42 万美元\n4、美媒评 2018 年全球十大突破性技术：AI 上榜',14,'输给小学生？11 岁男孩写了一本关于比特币的书；美媒评 2018 年全球十大突破性技术：AI 上榜','http://mp.weixin.qq.com/s?timestamp=1519708735&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCGbY6E9bnaSUAMeS*dSVzGBb1*E*NE1ojG-E0ADA7pXRcga4hIkiwsM-1pA1QlnETfOq19JYjw7ZkgCodoLlVixnchsGUsxYtLxYDvnUZIL**j3RzwMFA5g5cISkAgg8RazLGe673fs1QhcbJbJskfw='),(415,'2018-02-26 11:28:31','近日，一份由26名专家联合撰写的报告，对人工智能技术的潜在威胁发出警告。他们认为，这项技术可能在未来5到10年催生新型网络犯罪、实体攻击和政治颠覆。',14,'AI能干什么坏事？全球14家机构专家发百页报告：警惕人工智能（附全文下载）','http://mp.weixin.qq.com/s?timestamp=1519708735&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCGbY6E9bnaSUAMeS*dSVzGBb1*E*NE1ojG-E0ADA7pXRcga4hIkiwsM-1pA1QlnETe6O2P4jwdDinq2q5*9nL1c9oMcMT7vvMFly*ac6dTN5C4jQfUSuycqPyzj0Vv3ZV16JEipz2kcB1r8LrGBaR4Q='),(416,'2018-02-27 08:08:00','用一杯咖啡的时间，带你走进全球第一家带AR体验的咖啡工坊。',15,'如何用AR升级星巴克体验？阿里工程师祭出了“三板斧”','http://mp.weixin.qq.com/s?timestamp=1519708736&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCJiYVV4JYFiwD*lfDgyz7dR2aUJzla7fuFMUKSif3-ihVaqrl708rw0bJUdbkC7sa2-KyQMM5b*saW8uw1ekvSL4nXF9-JDrC*M2WpECL2ppHOruA-PJXHtFGG8qQAsY-wj1-rseB13HexcQtDhF9FA='),(417,'2018-02-26 08:08:00','“在代码中创造世界，在失控中享受自由。”',15,'敏捷开发的根本矛盾是什么？从业十余年的工程师在思考','http://mp.weixin.qq.com/s?timestamp=1519708736&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCJiYVV4JYFiwD*lfDgyz7dR2aUJzla7fuFMUKSif3-ihVaqrl708rw0bJUdbkC7sa7Z61DNzhWpvSNwUOo6qSF9JNimSHAKVubk80Z1Lm5o9uHmRimK0VwbJCEKNatblnc5MU3yKEpi1VKprGBcwBmE='),(418,'2018-02-26 14:02:07','做AI终究躲不掉学术论文的江湖',16,'比特币、盗版、黑客技术：深度揭秘Sci-Hub背后的论文出版江湖','http://mp.weixin.qq.com/s?timestamp=1519708743&src=3&ver=1&signature=Zf4f6xN--*Sjc49ufdtrCMm4wH8n13fXPPQsw1xV5F5epSxkFDXd5ymYNhfYLWyrK6VCBt9oeo3KRJAVxZT*i8-zujKuzpD2fDj8oxVrHGw-k4oy2n5T2AHORs9YMcZaso4DkL1YKWQm0MR7svgbHZWegrA7h02biWyR76B7bTU=');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_platform`
--

DROP TABLE IF EXISTS `news_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_platform` (
  `news_platform_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_platform_name` varchar(20) NOT NULL,
  `news_platform_info` varchar(100) NOT NULL,
  `news_platform_url` varchar(255) NOT NULL,
  `news_platform_image` varchar(100) DEFAULT NULL,
  `open_id` varchar(255) DEFAULT NULL,
  `wechat_id` varchar(255) DEFAULT NULL,
  `authentication` varchar(255) DEFAULT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`news_platform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_platform`
--

LOCK TABLES `news_platform` WRITE;
/*!40000 ALTER TABLE `news_platform` DISABLE KEYS */;
INSERT INTO `news_platform` VALUES (11,'新华社','新华通讯社官方账号.新华社是中国国家通讯社,现场新闻、原创新闻报道的大本营.','http://mp.weixin.qq.com/profile?src=3&timestamp=1518978065&ver=1&signature=ORJFHpC7fJwYHXfYiDRWDGE5BGmRrWLNtF4TG5MYY9JtvkAXxMoPfJZeyYD3EdMV5PaQauq19DG61Dh2SqGFew==','./images/platform/新华社.jpg','oIWsFt24IbHmZjoV7rk_pJdQ3xmU','xinhuashefabu1','新华新媒文化传播有限公司','http://mp.weixin.qq.com/rr?src=3&timestamp=1518978065&ver=1&signature=TJwudYWt1xtW07*s*04C6EHWgfXQ0DgKZjrqMF5HEhpJA2FXXUbNgjVhrcDIdBxb2-nr*dnaRRM-8Bf*2BFGzZUswrR4b2yrb60utavR0nU='),(12,'看雪学院','致力于移动与安全研究的开发者社区,看雪学院(kanxue.com)官方微信公众帐号.','http://mp.weixin.qq.com/profile?src=3&timestamp=1518978065&ver=1&signature=6BEUvRGjKWMWrUGOwlxtaJpJNmrqkbU-vwCzQFun2LRSXZgAp9YVqo7q-IB6VjvYZNGJPSv6mo58W1AeJOL5bw==','./images/platform/看雪学院.jpg','oIWsFt_CbfrI-DWYYzfOxqdQY39s','ikanxue','上海看雪科技有限公司','http://mp.weixin.qq.com/rr?src=3&timestamp=1518978065&ver=1&signature=s5rogNHKuzX95kGwHZmixt9uEc3Evqe92TX5e6r8zk5LOvk2uSSW4lPp818BEovePrBvcDQaGrD6qzExOT2Z4T9tHwqmdXiAk69eO2awAkk='),(13,'Python编程','关注Python编程技术和运用','http://mp.weixin.qq.com/profile?src=3&timestamp=1518978065&ver=1&signature=2HV0CG9KfoX5-Drzid6gJou-0QkGSfu*cY2rAnUL6i1vcXFvCDAEBrmAQp9JACQwVt8iYCQ2pgbGg7O-Xa11Iw==','./images/platform/Python编程.jpg','oIWsFt_vgnaA8THw-n1vZo9tCftA','LovePython','\n','http://mp.weixin.qq.com/rr?src=3&timestamp=1518978065&ver=1&signature=gAPhn7q9-KnPH-YYKQU5yak6Nn4N5-csSIFsZ4KH3F-fvzycBYMT3N8mETtacBCxZeoWzt4sEZkKPHffjTy*fzTjnobPgecGcZn4fr12yvQ='),(14,'大数据技术','分享大数据、云计算、人工智能等高科技先进技术','http://mp.weixin.qq.com/profile?src=3&timestamp=1518978065&ver=1&signature=6gbdd3VjLtGV4VwXeS2dGuAupcbE3LFCnX*OWmiyMIJqXZXrB8Ct84C2P9O8tWijzZ-TesUvAN7W2mWEOd344A==','./images/platform/大数据技术.jpg','oIWsFt53kEY8vWq9V-_2KigE3wds','TheBigData1024','\n','http://mp.weixin.qq.com/rr?src=3&timestamp=1518978065&ver=1&signature=ZvbbtoHfOtrm8lHQ1r4QLmCp3qHcFJ0bF3FGtnsHh9Q0k96yYjPnoFPe3gYSRe2w5*Wk6I9j3rYeyZDAf6uMyUvUIWtnQd-3uTTaDV2Pc3E='),(15,'阿里技术','阿里巴巴官方技术号,关于阿里的技术创新均呈现于此.','http://mp.weixin.qq.com/profile?src=3&timestamp=1518978065&ver=1&signature=rBz-*KEGOrDfXtcvg1xUwHhNc151*beLswqHCSKpAYnSCGBaWkQb-hw-Qk*-pGqb6jZZjAofx7rDuKI8RzI-uQ==','./images/platform/阿里技术.jpg','oIWsFt6FaqqKmwd7d7rXthlIW070','ali_tech','阿里巴巴(中国)有限公司','http://mp.weixin.qq.com/rr?src=3&timestamp=1518978065&ver=1&signature=yneta05zs67fy13jZvPQqWWBf7-DJLXt0gTUr-yjr42JEbtCZn6-bxCeNqDeR8bb0WzEWQGSaO6cXkuljknSv51o4p9rgr8W-yH6u2b3quY='),(16,'人工智能头条','专注人工智能技术前沿、实战技巧及大牛心得.','http://mp.weixin.qq.com/profile?src=3&timestamp=1518978066&ver=1&signature=5bJAhTOTL*j3efQkNvI5I0ad-H6p1jTL5Edqm8*Ly65iZ0CkTRDRIMQLTVIzkYIMCi4-DLWcgk8qEuDVdEBLaA==','./images/platform/人工智能头条.jpg','oIWsFtyJmSw80AxC5wFWs2Vh-bt8','AI_Thinker','北京创新乐知信息技术有限公司','http://mp.weixin.qq.com/rr?src=3&timestamp=1518978066&ver=1&signature=PBmXTYrk*UlcSbSOwkHTjBTBHSkdm8RHbjAkI0bDkWlfu7mDbJzirFExPiy4*KqYYZSnRnI7mK*XztE*AkyK1F9-Bx94rXMYxLdTSetFKOI=');
/*!40000 ALTER TABLE `news_platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_subscribtion`
--

DROP TABLE IF EXISTS `news_subscribtion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_subscribtion` (
  `iterm_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `news_platform_id` int(11) NOT NULL,
  PRIMARY KEY (`iterm_id`),
  KEY `user_id` (`user_id`),
  KEY `news_platform_id` (`news_platform_id`),
  CONSTRAINT `news_subscribtion_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `news_subscribtion_ibfk_2` FOREIGN KEY (`news_platform_id`) REFERENCES `news_platform` (`news_platform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_subscribtion`
--

LOCK TABLES `news_subscribtion` WRITE;
/*!40000 ALTER TABLE `news_subscribtion` DISABLE KEYS */;
INSERT INTO `news_subscribtion` VALUES (2,3,11),(3,3,12),(5,8,15);
/*!40000 ALTER TABLE `news_subscribtion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(20) NOT NULL,
  `tag_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'EPEL repo',1),(2,'MACOS',15),(3,'Markdown',2),(4,'My blog',2),(5,'Python',2),(6,'Ubuntu Server',5),(7,'U盘分区',7),(8,'centOS',4),(9,'pip install',3),(10,'分辨率调整',3),(17,'天气',1),(18,'博客',1),(19,'检索',1),(20,'功能',1),(21,'测试',1),(22,'检索功能',1),(23,'1',1),(24,'2',1),(25,'3',1),(26,'',5),(27,'第一篇博客',1);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(12) NOT NULL,
  `user_pwd` varchar(32) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_phone_number` varchar(16) DEFAULT NULL,
  `user_gender` enum('0','1') NOT NULL,
  `user_type` enum('0','1','2','3') NOT NULL,
  `user_info` varchar(144) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Guest','test',NULL,NULL,'0','0',NULL,NULL,NULL),(2,'testuser','5d9c68c6c50ed3d02a2fcf54f63993b6',' ','','0','1',NULL,NULL,NULL),(3,'Ainassine','c5e9ce63db751d5f6cee0f1082bbb6ab','joeeeee@foxmail.com','15863196566','0','1','跨越长城，我们可以到达世界的任何角落。','2018-02-27 09:17:13','0.0.0.0'),(4,'testuser','testuser',NULL,NULL,'0','0',NULL,NULL,NULL),(5,'testset','','','','0','1',NULL,NULL,NULL),(6,'testtest','e10adc3949ba59abbe56e057f20f883e','','','0','1',NULL,NULL,NULL),(7,'qq568012180','e10adc3949ba59abbe56e057f20f883e','','15900611628','0','1',NULL,NULL,NULL),(8,'Bobisgood','05a671c66aefea124cc08b76ea6d30bb','Bob@163.com','13888888888','0','1','我是一名新用户！','2018-02-27 09:18:16','0.0.0.0'),(9,'chenyang','4607e782c4d86fd5364d7e4508bb10d9','','13253681286','0','1',NULL,'2018-02-27 07:00:26','192.168.1.8');
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

-- Dump completed on 2018-02-28  9:18:10

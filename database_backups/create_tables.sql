-- --------------------------------------------------------
/*Drop the existing csespn databse and create new database
DROP DATABASE csespn;
CREATE DATABASE csespn;
USE csespn;
*/

--
-- Table structure for table `project_batches`
--
DROP TABLE IF EXISTS `technologies`;
DROP TABLE IF EXISTS `settings`;
DROP TABLE IF EXISTS `projects`;
DROP TABLE IF EXISTS `session_batches`;
DROP TABLE IF EXISTS `endorsements`;
DROP TABLE IF EXISTS `students`;
DROP TABLE IF EXISTS `sponsorships`;
DROP TABLE IF EXISTS `events`;
DROP TABLE IF EXISTS `sessions`;
DROP TABLE IF EXISTS `project_batches`;
DROP TABLE IF EXISTS `batches`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `companies`;
DROP TABLE IF EXISTS `uni_score`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_batches` (
  `project_id` int(11) NOT NULL,
  `batch_id` varchar(45) NOT NULL,
  PRIMARY KEY (`project_id`,`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `batches`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(45) DEFAULT NULL,
  `course` varchar(255) NOT NULL,
  `year` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `year_UNIQUE` (`year`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `linkedin_id` varchar(255) NOT NULL,
  `pic_url` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  `profile_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `companies`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `access_level` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(256) NOT NULL,
  `date` datetime DEFAULT NULL,
  `start_time` char(10) DEFAULT NULL,
  `duration` int(5) DEFAULT NULL,
  `resp_name` varchar(50) DEFAULT NULL,
  `resp_contact` varchar(10) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pic_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session_org_idx` (`org_id`),
  CONSTRAINT `session_org` FOREIGN KEY (`org_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `events`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text,
  `date` date DEFAULT NULL,
  `date_confirmed` tinyint(1) NOT NULL,
  `time` time DEFAULT NULL,
  `venue` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT 'url of event fb page/web page',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sponsorships`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsorships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text,
  `taken_by` int(11) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `taken_by` (`taken_by`),
  CONSTRAINT `taken_by` FOREIGN KEY (`taken_by`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(255) DEFAULT NULL,
  `batch` int(11) NOT NULL,
  `linkedin_id` varchar(255) NOT NULL,
  `profile_url` varchar(255) NOT NULL,
  `oauth_token` varchar(255) NOT NULL,
  `oauth_token_secret` varchar(255) NOT NULL,
  `gpa` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `endorsements`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endorsements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `technology_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4109 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `session_batches`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_batches` (
  `session_id` int(11) NOT NULL,
  `batch_id` varchar(45) NOT NULL,
  PRIMARY KEY (`session_id`,`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `technologies`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technologies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=563 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `resp_name` varchar(50) DEFAULT NULL,
  `resp_contact` varchar(10) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(45) DEFAULT 'Active',
  PRIMARY KEY (`id`),
  KEY `session_org_idx` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE TABLE `uni_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(45) NOT NULL,
  `event_organizing` varchar(45) DEFAULT NULL,
  `tech_contribution` varchar(45) DEFAULT NULL,
  `mentoring_program` varchar(45) DEFAULT NULL,
  `lecture_attendence` varchar(45) DEFAULT NULL,
  `social_engagement` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
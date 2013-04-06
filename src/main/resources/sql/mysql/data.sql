-- MySQL dump 10.11
--
-- Host: localhost    Database: ila
-- ------------------------------------------------------
-- Server version	5.0.95

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
-- Table structure for table `ila_action`
--

DROP TABLE IF EXISTS `ila_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_action` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `BRIEF` varchar(100) default NULL,
  `CUSTOMER_PARTICIPANTS` varchar(100) default NULL,
  `DETAIL` varchar(2000) default NULL,
  `MILESTONE` tinyint(1) NOT NULL,
  `OCCUR_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `SELF_PARTICIPANTS` varchar(100) default NULL,
  `ACTION_TYPE_ID` varchar(50) default NULL,
  `LEADS_ID` varchar(50) default NULL,
  `USER_ID` varchar(50) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ACTION_TYPE_ID` (`ACTION_TYPE_ID`),
  KEY `LEADS_ID` (`LEADS_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `ila_action_ibfk_1` FOREIGN KEY (`ACTION_TYPE_ID`) REFERENCES `ila_action_type` (`ID`),
  CONSTRAINT `ila_action_ibfk_2` FOREIGN KEY (`LEADS_ID`) REFERENCES `ila_leads` (`ID`),
  CONSTRAINT `ila_action_ibfk_3` FOREIGN KEY (`USER_ID`) REFERENCES `ila_user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_action`
--

LOCK TABLES `ila_action` WRITE;
/*!40000 ALTER TABLE `ila_action` DISABLE KEYS */;
INSERT INTO `ila_action` VALUES ('40288c5e3cf7471f013cfaa95be00003','2013-02-21 02:51:08','2013-02-21 02:51:08','创建',NULL,NULL,0,'2013-02-21 02:51:08',NULL,'system','40288c5e3cf7471f013cfaa95bd10002','8a53b7823cf1edfd013cf1eface40000');
/*!40000 ALTER TABLE `ila_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_action_type`
--

DROP TABLE IF EXISTS `ila_action_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_action_type` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `NAME` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_action_type`
--

LOCK TABLES `ila_action_type` WRITE;
/*!40000 ALTER TABLE `ila_action_type` DISABLE KEYS */;
INSERT INTO `ila_action_type` VALUES ('mail','2012-12-14 16:00:00','2012-12-14 16:00:00','邮件'),('meeting','2012-12-14 16:00:00','2012-12-14 16:00:00','会议'),('message','2012-12-14 16:00:00','2012-12-14 16:00:00','聊天工具'),('other','2012-12-14 16:00:00','2012-12-14 16:00:00','其它'),('system','2012-12-14 16:00:00','2012-12-14 16:00:00','聊天工具'),('telephone','2012-12-14 16:00:00','2012-12-14 16:00:00','电话沟通'),('visit','2012-12-14 16:00:00','2012-12-14 16:00:00','上门拜访');
/*!40000 ALTER TABLE `ila_action_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_closed_reason`
--

DROP TABLE IF EXISTS `ila_closed_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_closed_reason` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `NAME` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_closed_reason`
--

LOCK TABLES `ila_closed_reason` WRITE;
/*!40000 ALTER TABLE `ila_closed_reason` DISABLE KEYS */;
INSERT INTO `ila_closed_reason` VALUES ('1','2012-12-14 16:00:00','2012-12-14 16:00:00','客户取消'),('2','2012-12-14 16:00:00','2012-12-14 16:00:00','转成销售机会'),('3','2012-12-14 16:00:00','2012-12-14 16:00:00','其它厂商成交'),('4','2012-12-14 16:00:00','2012-12-14 16:00:00','成交');
/*!40000 ALTER TABLE `ila_closed_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_company`
--

DROP TABLE IF EXISTS `ila_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_company` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `NAME` varchar(30) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_company`
--

LOCK TABLES `ila_company` WRITE;
/*!40000 ALTER TABLE `ila_company` DISABLE KEYS */;
INSERT INTO `ila_company` VALUES ('1','2012-12-14 16:00:00','2012-12-14 16:00:00','上海新致');
/*!40000 ALTER TABLE `ila_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_contact`
--

DROP TABLE IF EXISTS `ila_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_contact` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `DES` varchar(200) default NULL,
  `MAIL` varchar(50) default NULL,
  `NAME` varchar(50) default NULL,
  `TEL` varchar(50) default NULL,
  `TITLE` varchar(50) default NULL,
  `CUSTOMER_ID` varchar(50) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  CONSTRAINT `ila_contact_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `ila_customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_contact`
--

LOCK TABLES `ila_contact` WRITE;
/*!40000 ALTER TABLE `ila_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `ila_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_customer`
--

DROP TABLE IF EXISTS `ila_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_customer` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `DES` varchar(500) default NULL,
  `NAME` varchar(50) default NULL,
  `DEVELOP` tinyint(1) NOT NULL,
  `INDUSTRY_ID` varchar(50) default NULL,
  `OWNERSHIP_ID` varchar(50) default NULL,
  `SCALE_ID` varchar(50) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `INDUSTRY_ID` (`INDUSTRY_ID`),
  KEY `OWNERSHIP_ID` (`OWNERSHIP_ID`),
  KEY `SCALE_ID` (`SCALE_ID`),
  CONSTRAINT `ila_customer_ibfk_1` FOREIGN KEY (`INDUSTRY_ID`) REFERENCES `ila_industry` (`ID`),
  CONSTRAINT `ila_customer_ibfk_2` FOREIGN KEY (`OWNERSHIP_ID`) REFERENCES `ila_ownership` (`ID`),
  CONSTRAINT `ila_customer_ibfk_3` FOREIGN KEY (`SCALE_ID`) REFERENCES `ila_scale` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_customer`
--

LOCK TABLES `ila_customer` WRITE;
/*!40000 ALTER TABLE `ila_customer` DISABLE KEYS */;
INSERT INTO `ila_customer` VALUES ('100','2012-12-14 16:00:00','2012-12-14 16:00:00','中国电信集团公司','电信集团',0,'1','1','1'),('101','2012-12-14 16:00:00','2012-12-14 16:00:00','中国电信股份有限公司四川分公司','四川电信',0,'1','1','1'),('102','2012-12-14 16:00:00','2012-12-14 16:00:00','中国电信股份有限公司湖南分公司','湖南电信',0,'1','1','1'),('103','2012-12-14 16:00:00','2012-12-14 16:00:00','中国电信股份有限公司重庆分公司','重庆电信',0,'1','1','1'),('104','2012-12-14 16:00:00','2012-12-14 16:00:00','中国电信股份有限公司陕西分公司','陕西电信',0,'1','1','1'),('105','2012-12-14 16:00:00','2012-12-14 16:00:00','中国电信股份有限公司新疆分公司','新疆电信',0,'1','1','1'),('106','2012-12-14 16:00:00','2012-12-14 16:00:00','中国电信股份有限公司广西分公司','广西电信',0,'1','1','1'),('107','2012-12-14 16:00:00','2012-12-14 16:00:00','中国电信股份有限公司贵州分公司','贵州电信',0,'1','1','1'),('108','2012-12-14 16:00:00','2012-12-14 16:00:00','东方有线网络有限公司','东方有线',0,'1','1','1'),('109','2012-12-14 16:00:00','2012-12-14 16:00:00','中国银联股份有限公司','中国银联',0,'1','1','1'),('110','2012-12-14 16:00:00','2012-12-14 16:00:00','天翼视讯传媒有限公司','天翼视讯',0,'1','1','1'),('111','2012-12-14 16:00:00','2012-12-14 16:00:00','中国移动通信集团上海有限公司','上海移动',0,'1','1','1'),('112','2012-12-14 16:00:00','2012-12-14 16:00:00','中国联合网络通信有限公司上海市分公司','上海联通',0,'1','1','1'),('113','2012-12-14 16:00:00','2012-12-14 16:00:00','中国联合网络通信股份有限公司','联通A股',0,'1','1','1'),('114','2012-12-14 16:00:00','2012-12-14 16:00:00','上海市信产通信服务有限公司','上通服',0,'1','1','1'),('115','2012-12-14 16:00:00','2012-12-14 16:00:00','号百信息服务有限公司','号百集团',0,'1','1','1'),('116','2012-12-14 16:00:00','2012-12-14 16:00:00','中国电信股份有限公司福建分公司','福建电信',0,'1','1','1'),('117','2012-12-14 16:00:00','2012-12-14 16:00:00','中国电信股份有限公司江西分公司','江西电信',0,'1','1','1'),('118','2012-12-14 16:00:00','2012-12-14 16:00:00','中国电信股份有限公司安徽分公司','安徽电信',0,'1','1','1'),('119','2012-12-14 16:00:00','2012-12-14 16:00:00','中国电信股份有限公司香港分公司','香港电信',0,'1','1','1'),('120','2012-12-14 16:00:00','2012-12-14 16:00:00','中国电信股份有限公司浙江分公司','浙江电信',0,'1','1','1'),('121','2012-12-14 16:00:00','2012-12-14 16:00:00','中国电信股份有限公司上海分公司','上海电信',0,'1','1','1'),('122','2012-12-14 16:00:00','2012-12-14 16:00:00','上海锦江国际电子商务有限公司','锦江国际',0,'1','1','1'),('123','2012-12-14 16:00:00','2012-12-14 16:00:00','号百商旅电子商务有限公司','号百商旅',0,'1','1','1'),('2','2013-02-21 04:10:29','2013-02-21 04:10:29','中国电信四川分公司','四川电信',0,'1','1','1'),('40288c5e3cf7471f013cf748a9630000','2013-02-21 04:10:40','2013-02-21 04:10:40','','上海电信',0,'1','3','1'),('40288c5e3cf7471f013cfaa6d17c0001','2013-02-21 04:10:53','2013-02-21 04:10:53','中国移动通信集团上海有限公司','上海移动',0,'1','3','1'),('40288c5e3cf7471f013cfaf1c3180004','2013-02-21 04:10:13','2013-02-21 04:10:13','天翼视讯传媒有限公司','天翼视讯',1,'1','3','1');
/*!40000 ALTER TABLE `ila_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_department`
--

DROP TABLE IF EXISTS `ila_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_department` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `NAME` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_department`
--

LOCK TABLES `ila_department` WRITE;
/*!40000 ALTER TABLE `ila_department` DISABLE KEYS */;
INSERT INTO `ila_department` VALUES ('10','2012-12-14 16:00:00','2012-12-14 16:00:00','中西部交付中心'),('11','2012-12-14 16:00:00','2012-12-14 16:00:00','电信行业'),('12','2012-12-14 16:00:00','2012-12-14 16:00:00','互联网行业'),('13','2012-12-14 16:00:00','2012-12-14 16:00:00','四川VIP'),('14','2012-12-14 16:00:00','2012-12-14 16:00:00','重庆VIP'),('15','2012-12-14 16:00:00','2012-12-14 16:00:00','湖南VIP'),('16','2012-12-14 16:00:00','2012-12-14 16:00:00','陕西VIP'),('2','2012-12-14 16:00:00','2012-12-14 16:00:00','欧美及国内行业'),('4','2012-12-14 16:00:00','2012-12-14 16:00:00','电信互联网事业部'),('5','2012-12-14 16:00:00','2012-12-14 16:00:00','国内事业部'),('6','2012-12-14 16:00:00','2012-12-14 16:00:00','欧美事业部'),('7','2012-12-14 16:00:00','2012-12-14 16:00:00','金融保险行业'),('8','2012-12-14 16:00:00','2012-12-14 16:00:00','市场部'),('9','2012-12-14 16:00:00','2012-12-14 16:00:00','开发部');
/*!40000 ALTER TABLE `ila_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_domain`
--

DROP TABLE IF EXISTS `ila_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_domain` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `NAME` varchar(50) default NULL,
  `DETAIL` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_domain`
--

LOCK TABLES `ila_domain` WRITE;
/*!40000 ALTER TABLE `ila_domain` DISABLE KEYS */;
INSERT INTO `ila_domain` VALUES ('1','2012-12-14 16:00:00','2012-12-14 16:00:00','market_action','市场活动'),('3','2012-12-14 16:00:00','2012-12-14 16:00:00','leads','销售线索');
/*!40000 ALTER TABLE `ila_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_industry`
--

DROP TABLE IF EXISTS `ila_industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_industry` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `NAME` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_industry`
--

LOCK TABLES `ila_industry` WRITE;
/*!40000 ALTER TABLE `ila_industry` DISABLE KEYS */;
INSERT INTO `ila_industry` VALUES ('1','2012-12-14 16:00:00','2012-12-14 16:00:00','电信行业'),('2','2012-12-14 16:00:00','2012-12-14 16:00:00','互联网行业'),('3','2012-12-14 16:00:00','2012-12-14 16:00:00','零售行业');
/*!40000 ALTER TABLE `ila_industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_leads`
--

DROP TABLE IF EXISTS `ila_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_leads` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `CLOSE_REASON_DETAIL` varchar(50) default NULL,
  `DES` varchar(2000) default NULL,
  `HIGH_AMOUNT` double NOT NULL,
  `LOW_AMOUNT` double NOT NULL,
  `DEAL_AMOUNT` double default NULL,
  `NAME` varchar(100) default NULL,
  `OPPORTUNITY` tinyint(1) NOT NULL,
  `STATUS` int(11) default NULL,
  `CLOSED_REASON_ID` varchar(50) default NULL,
  `CUSTOMER_ID` varchar(50) default NULL,
  `USER_ID` varchar(50) default NULL,
  `SOURCE_ID` varchar(50) default NULL,
  `DEPARTMENT_ID` varchar(50) default NULL,
  `LAST_INFO` varchar(200) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `CLOSED_REASON_ID` (`CLOSED_REASON_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `SOURCE_ID` (`SOURCE_ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `ila_leads_ibfk_1` (`DEPARTMENT_ID`),
  CONSTRAINT `ila_leads_ibfk_1` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `ila_department` (`ID`),
  CONSTRAINT `ila_leads_ibfk_2` FOREIGN KEY (`CLOSED_REASON_ID`) REFERENCES `ila_closed_reason` (`ID`),
  CONSTRAINT `ila_leads_ibfk_3` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `ila_customer` (`ID`),
  CONSTRAINT `ila_leads_ibfk_4` FOREIGN KEY (`SOURCE_ID`) REFERENCES `ila_source` (`ID`),
  CONSTRAINT `ila_leads_ibfk_5` FOREIGN KEY (`USER_ID`) REFERENCES `ila_user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_leads`
--

LOCK TABLES `ila_leads` WRITE;
/*!40000 ALTER TABLE `ila_leads` DISABLE KEYS */;
INSERT INTO `ila_leads` VALUES ('40288c5e3cf7471f013cfaa95bd10002','2013-02-21 02:48:52','2013-02-21 02:51:08',NULL,'从2010年开始与客户每年签订框架合同,以工单方式进行结算,预计3月份启动商务谈判.',2000000,1600000,0,'上海移动2013年框架业务',0,0,NULL,'40288c5e3cf7471f013cfaa6d17c0001','8a53b7823cf1edfd013cf1eface40000','1','8','2013-02-21:创建');
/*!40000 ALTER TABLE `ila_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_market_action`
--

DROP TABLE IF EXISTS `ila_market_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_market_action` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `BRIEF` varchar(50) NOT NULL,
  `DETAIL` varchar(2000) NOT NULL,
  `CUSTOMER_ID` varchar(50) NOT NULL,
  `ACTION_TYPE_ID` varchar(50) default NULL,
  `USER_ID` varchar(50) default NULL,
  `EVENT_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `IMPORTANT` tinyint(1) NOT NULL,
  `DEPARTMENT_ID` varchar(50) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `ACTION_TYPE_ID` (`ACTION_TYPE_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `DEPARTMENT_ID` (`DEPARTMENT_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `ila_market_action_ibfk_1` FOREIGN KEY (`ACTION_TYPE_ID`) REFERENCES `ila_action_type` (`ID`),
  CONSTRAINT `ila_market_action_ibfk_2` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `ila_customer` (`ID`),
  CONSTRAINT `ila_market_action_ibfk_3` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `ila_department` (`ID`),
  CONSTRAINT `ila_market_action_ibfk_4` FOREIGN KEY (`USER_ID`) REFERENCES `ila_user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_market_action`
--

LOCK TABLES `ila_market_action` WRITE;
/*!40000 ALTER TABLE `ila_market_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `ila_market_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_operation`
--

DROP TABLE IF EXISTS `ila_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_operation` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `NAME` varchar(100) default NULL,
  `BRIEF` varchar(100) default NULL,
  `DOMAIN_ID` varchar(50) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `DOMAIN_ID` (`DOMAIN_ID`),
  CONSTRAINT `ila_operation_ibfk_1` FOREIGN KEY (`DOMAIN_ID`) REFERENCES `ila_domain` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_operation`
--

LOCK TABLES `ila_operation` WRITE;
/*!40000 ALTER TABLE `ila_operation` DISABLE KEYS */;
INSERT INTO `ila_operation` VALUES ('1','2012-12-14 16:00:00','2012-12-14 16:00:00','create','创建','1'),('2','2012-12-13 16:00:00','2012-12-14 16:00:00','edit','修改','1'),('21','2012-12-14 16:00:00','2012-12-14 16:00:00','create','创建','3'),('22','2012-12-14 16:00:00','2012-12-14 16:00:00','edit','修改','3'),('23','2012-12-14 16:00:00','2012-12-14 16:00:00','remove','删除','3'),('24','2012-12-14 16:00:00','2012-12-14 16:00:00','view','查看','3'),('25','2012-12-14 16:00:00','2012-12-14 16:00:00','list','列表','3'),('3','2012-12-14 16:00:00','2012-12-14 16:00:00','remove','删除','1'),('4','2012-12-12 16:00:00','2012-12-14 16:00:00','view','查看','1'),('5','2012-12-14 16:00:00','2012-12-14 16:00:00','list','列表','1');
/*!40000 ALTER TABLE `ila_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_org_accountability`
--

DROP TABLE IF EXISTS `ila_org_accountability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_org_accountability` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `CHILD_ID` varchar(50) default NULL,
  `ACCOUNTABILITY_TYPE_ID` varchar(50) default NULL,
  `PARENT_ID` varchar(50) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ACCOUNTABILITY_TYPE_ID` (`ACCOUNTABILITY_TYPE_ID`),
  CONSTRAINT `ila_org_accountability_ibfk_1` FOREIGN KEY (`ACCOUNTABILITY_TYPE_ID`) REFERENCES `ila_org_accountability_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_org_accountability`
--

LOCK TABLES `ila_org_accountability` WRITE;
/*!40000 ALTER TABLE `ila_org_accountability` DISABLE KEYS */;
INSERT INTO `ila_org_accountability` VALUES ('1','2012-12-14 16:00:00','2012-12-14 16:00:00','1','SALE','1'),('10','2012-12-14 16:00:00','2012-12-14 16:00:00','10','SALE','4'),('11','2012-12-14 16:00:00','2012-12-14 16:00:00','21','SALE','4'),('110','2012-12-14 16:00:00','2012-12-14 16:00:00','29','SALE','4'),('119','2012-12-14 16:00:00','2012-12-14 16:00:00','30','SALE','6'),('12','2012-12-14 16:00:00','2012-12-14 16:00:00','11','SALE','8'),('13','2012-12-14 16:00:00','2012-12-14 16:00:00','12','SALE','8'),('14','2012-12-14 16:00:00','2012-12-14 16:00:00','22','SALE','8'),('15','2012-12-14 16:00:00','2012-12-14 16:00:00','26','SALE','8'),('16','2012-12-14 16:00:00','2012-12-14 16:00:00','23','SALE','12'),('17','2012-12-14 16:00:00','2012-12-14 16:00:00','25','SALE','23'),('18','2012-12-14 16:00:00','2012-12-14 16:00:00','24','SALE','11'),('19','2012-12-14 16:00:00','2012-12-14 16:00:00','28','SALE','10'),('2','2012-12-14 16:00:00','2012-12-14 16:00:00','2','SALE','1'),('20','2012-12-14 16:00:00','2012-12-14 16:00:00','13','SALE','10'),('21','2012-12-14 16:00:00','2012-12-14 16:00:00','14','SALE','10'),('22','2012-12-14 16:00:00','2012-12-14 16:00:00','15','SALE','10'),('23','2012-12-14 16:00:00','2012-12-14 16:00:00','16','SALE','10'),('24','2012-12-14 16:00:00','2012-12-14 16:00:00','31','SALE','13'),('25','2012-12-14 16:00:00','2012-12-14 16:00:00','34','SALE','14'),('26','2012-12-14 16:00:00','2012-12-14 16:00:00','33','SALE','15'),('27','2012-12-14 16:00:00','2012-12-14 16:00:00','32','SALE','16'),('3','2012-12-14 16:00:00','2012-12-14 16:00:00','7','SALE','1'),('4','2012-12-14 16:00:00','2012-12-14 16:00:00','4','SALE','2'),('5','2012-12-14 16:00:00','2012-12-14 16:00:00','5','SALE','2'),('6','2012-12-14 16:00:00','2012-12-14 16:00:00','6','SALE','2'),('7','2012-12-14 16:00:00','2012-12-14 16:00:00','27','SALE','2'),('8','2012-12-14 16:00:00','2012-12-14 16:00:00','8','SALE','4'),('9','2012-12-14 16:00:00','2012-12-14 16:00:00','9','SALE','4');
/*!40000 ALTER TABLE `ila_org_accountability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_org_accountability_type`
--

DROP TABLE IF EXISTS `ila_org_accountability_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_org_accountability_type` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `DESCRIPTION` varchar(100) default NULL,
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_org_accountability_type`
--

LOCK TABLES `ila_org_accountability_type` WRITE;
/*!40000 ALTER TABLE `ila_org_accountability_type` DISABLE KEYS */;
INSERT INTO `ila_org_accountability_type` VALUES ('ADMIN','2012-12-14 16:00:00','2012-12-14 16:00:00',NULL,'行政结构'),('SALE','2012-12-14 16:00:00','2012-12-14 16:00:00',NULL,'销售结构');
/*!40000 ALTER TABLE `ila_org_accountability_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_ownership`
--

DROP TABLE IF EXISTS `ila_ownership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_ownership` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `NAME` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_ownership`
--

LOCK TABLES `ila_ownership` WRITE;
/*!40000 ALTER TABLE `ila_ownership` DISABLE KEYS */;
INSERT INTO `ila_ownership` VALUES ('1','2012-12-14 16:00:00','2012-12-14 16:00:00','私营'),('2','2012-12-14 16:00:00','2012-12-14 16:00:00','外企'),('3','2012-12-14 16:00:00','2012-12-14 16:00:00','国企');
/*!40000 ALTER TABLE `ila_ownership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_permission`
--

DROP TABLE IF EXISTS `ila_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_permission` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `SCOPE` varchar(50) NOT NULL,
  `OPERATION_ID` varchar(50) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `OPERATION_ID` (`OPERATION_ID`),
  CONSTRAINT `ila_permission_ibfk_1` FOREIGN KEY (`OPERATION_ID`) REFERENCES `ila_operation` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_permission`
--

LOCK TABLES `ila_permission` WRITE;
/*!40000 ALTER TABLE `ila_permission` DISABLE KEYS */;
INSERT INTO `ila_permission` VALUES ('1','2012-12-14 16:00:00','2012-12-14 16:00:00','SELF','5'),('10','2012-12-14 16:00:00','2012-12-14 16:00:00','BELONGANDLOW','4'),('11','2012-12-14 16:00:00','2012-12-14 16:00:00','WHOLE','4'),('12','2012-12-14 16:00:00','2012-12-14 16:00:00','SELF','2'),('2','2012-12-14 16:00:00','2012-12-14 16:00:00','SELFANDLOW','5'),('201','2012-12-14 16:00:00','2012-12-14 16:00:00','SELF','25'),('202','2012-12-14 16:00:00','2012-12-14 16:00:00','SELFANDLOW','25'),('203','2012-12-14 16:00:00','2012-12-14 16:00:00','BELONG','25'),('204','2012-12-14 16:00:00','2012-12-14 16:00:00','BELONGANDLOW','25'),('205','2012-12-14 16:00:00','2012-12-14 16:00:00','WHOLE','25'),('206','2012-12-14 16:00:00','2012-12-14 16:00:00','SELF','21'),('207','2012-12-14 16:00:00','2012-12-14 16:00:00','SELF','24'),('208','2012-12-14 16:00:00','2012-12-14 16:00:00','SELFANDLOW','24'),('209','2012-12-14 16:00:00','2012-12-14 16:00:00','BELONG','24'),('210','2012-12-14 16:00:00','2012-12-14 16:00:00','BELONGANDLOW','24'),('211','2012-12-14 16:00:00','2012-12-14 16:00:00','WHOLE','24'),('212','2012-12-14 16:00:00','2012-12-14 16:00:00','SELF','22'),('3','2012-12-14 16:00:00','2012-12-14 16:00:00','BELONG','5'),('4','2012-12-14 16:00:00','2012-12-14 16:00:00','BELONGANDLOW','5'),('5','2012-12-14 16:00:00','2012-12-14 16:00:00','WHOLE','5'),('6','2012-12-14 16:00:00','2012-12-14 16:00:00','SELF','1'),('7','2012-12-14 16:00:00','2012-12-14 16:00:00','SELF','4'),('8','2012-12-14 16:00:00','2012-12-14 16:00:00','SELFANDLOW','4'),('9','2012-12-14 16:00:00','2012-12-14 16:00:00','BELONG','4');
/*!40000 ALTER TABLE `ila_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_role`
--

DROP TABLE IF EXISTS `ila_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_role` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_role`
--

LOCK TABLES `ila_role` WRITE;
/*!40000 ALTER TABLE `ila_role` DISABLE KEYS */;
INSERT INTO `ila_role` VALUES ('1','2013-02-20 10:32:26','2013-02-20 10:32:26','sales','客户经理'),('2','2013-02-20 10:26:32','2013-02-20 10:26:32','tradeManager','行业总监'),('3','2013-02-20 10:10:41','2013-02-20 10:10:41','saleManager','市场部经理'),('4','2013-02-19 10:16:44','2013-02-19 10:16:44','salessistant','部门助理'),('5','2013-02-20 10:03:03','2013-02-20 10:03:03','divisionManager','事业部总经理'),('administrator','2012-12-14 16:00:00','2012-12-14 16:00:00','administrator','系统管理员');
/*!40000 ALTER TABLE `ila_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_role_permission`
--

DROP TABLE IF EXISTS `ila_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_role_permission` (
  `ROLE_ID` varchar(50) NOT NULL,
  `PERMISSION_ID` varchar(50) NOT NULL,
  PRIMARY KEY  (`ROLE_ID`,`PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_role_permission`
--

LOCK TABLES `ila_role_permission` WRITE;
/*!40000 ALTER TABLE `ila_role_permission` DISABLE KEYS */;
INSERT INTO `ila_role_permission` VALUES ('1','1'),('1','12'),('1','201'),('1','206'),('1','207'),('1','212'),('1','6'),('1','7'),('2','10'),('2','12'),('2','204'),('2','206'),('2','210'),('2','212'),('2','4'),('2','6'),('3','10'),('3','12'),('3','204'),('3','206'),('3','210'),('3','212'),('3','4'),('3','6'),('4','203'),('4','3'),('5','12'),('5','204'),('5','206'),('5','210'),('5','212'),('5','4'),('5','6'),('5','7');
/*!40000 ALTER TABLE `ila_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_scale`
--

DROP TABLE IF EXISTS `ila_scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_scale` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `NAME` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_scale`
--

LOCK TABLES `ila_scale` WRITE;
/*!40000 ALTER TABLE `ila_scale` DISABLE KEYS */;
INSERT INTO `ila_scale` VALUES ('1','2012-12-14 16:00:00','2012-12-14 16:00:00','大型'),('2','2012-12-14 16:00:00','2012-12-14 16:00:00','中型'),('3','2012-12-14 16:00:00','2012-12-14 16:00:00','小型');
/*!40000 ALTER TABLE `ila_scale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_source`
--

DROP TABLE IF EXISTS `ila_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_source` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `NAME` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_source`
--

LOCK TABLES `ila_source` WRITE;
/*!40000 ALTER TABLE `ila_source` DISABLE KEYS */;
INSERT INTO `ila_source` VALUES ('1','2012-12-14 16:00:00','2012-12-14 16:00:00','客户介绍'),('2','2012-12-14 16:00:00','2012-12-14 16:00:00','公司市场部介绍');
/*!40000 ALTER TABLE `ila_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_staff`
--

DROP TABLE IF EXISTS `ila_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_staff` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `NAME` varchar(10) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_staff`
--

LOCK TABLES `ila_staff` WRITE;
/*!40000 ALTER TABLE `ila_staff` DISABLE KEYS */;
INSERT INTO `ila_staff` VALUES ('21','2012-12-14 16:00:00','2012-12-14 16:00:00','时宝旭'),('22','2012-12-14 16:00:00','2012-12-14 16:00:00','王浩'),('23','2012-12-14 16:00:00','2012-12-14 16:00:00','丁耸立'),('24','2012-12-14 16:00:00','2012-12-14 16:00:00','商建华'),('25','2012-12-14 16:00:00','2012-12-14 16:00:00','王树坤'),('26','2012-12-14 16:00:00','2012-12-14 16:00:00','王华生'),('27','2012-12-14 16:00:00','2012-12-14 16:00:00','隋卫东'),('28','2012-12-14 16:00:00','2012-12-14 16:00:00','杜聪'),('29','2012-12-14 16:00:00','2012-12-14 16:00:00','徐路'),('30','2012-12-14 16:00:00','2012-12-14 16:00:00','黄苑斌'),('31','2012-12-14 16:00:00','2012-12-14 16:00:00','刘天军'),('32','2012-12-14 16:00:00','2012-12-14 16:00:00','龚斌'),('33','2012-12-14 16:00:00','2012-12-14 16:00:00','鹿国强'),('34','2012-12-14 16:00:00','2012-12-14 16:00:00','王磊');
/*!40000 ALTER TABLE `ila_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_user`
--

DROP TABLE IF EXISTS `ila_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_user` (
  `ID` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MODIFIED_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `JOB_NUMBER` varchar(10) NOT NULL,
  `STATUS` varchar(10) NOT NULL,
  `NAME` varchar(10) NOT NULL,
  `MAIL` varchar(30) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `SALT` varchar(200) NOT NULL,
  `STAFF_ID` varchar(50) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `STAFF_ID` (`STAFF_ID`),
  CONSTRAINT `ila_user_ibfk_1` FOREIGN KEY (`STAFF_ID`) REFERENCES `ila_staff` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_user`
--

LOCK TABLES `ila_user` WRITE;
/*!40000 ALTER TABLE `ila_user` DISABLE KEYS */;
INSERT INTO `ila_user` VALUES ('0','2012-12-14 16:00:00','2012-12-14 16:00:00','admin','正常','系统管理员','shibaoxu@mail.com','96efa9d9f68bed33881b9dc21586ae52d6e25400','bd73eb58fc11b3b8','21'),('8a53b7823cf1e831013cf1e8e7ba0000','2013-02-19 10:03:58','2013-02-19 10:03:58','12039','未激活','时宝旭','baoxu.shi@newtouch.cn','0cd8d2f6c6fdd1040cf14cf69b37918c07cd7ec2','6d258b14fe08c270','21'),('8a53b7823cf1edfd013cf1eface40000','2013-02-19 10:11:21','2013-02-19 10:11:21','12007','未激活','王浩','hao.wang@newtouch.cn','000cad3dc932383cc8c0e83dc21886354419ff1f','0e2efd3c0e4bc622','22'),('8a53b7823cf1edfd013cf1f06c420001','2013-02-19 10:12:10','2013-02-19 10:12:10','01070','未激活','丁耸立','songli.ding@newtouch.cn','2af3129d7771cf7d8596b90c08ebc0a0aa0ef2c4','45668fa479fdd7c4','23'),('8a53b7823cf1edfd013cf1f2271a0002','2013-02-19 10:14:04','2013-02-19 10:14:04','12395','未激活','商建华','jianhua.shang@newtouch.cn','9cb1dc3bee6bae8fc890bfa7550d44d7b6f628a2','43e5511c5233895b','24'),('8a53b7823cf1edfd013cf1f2e96a0003','2013-02-19 10:14:54','2013-02-19 10:14:54','11320','未激活','王树坤','shukun.wang@newtouch.cn','26279f1bf478f725b1182109e0c378a91f506a20','04946d8e50621368','25'),('8a53b7823cf1edfd013cf1f3ad050004','2013-02-19 10:15:44','2013-02-19 10:15:44','12232','未激活','徐路','lu.xu@newtouch.cn','c804017d6a90e13b9941fa3a9b1ffd145973d58b','0b8b1d4bf916a6c8','29'),('8a53b7823cf6d775013cf6d943410000','2013-02-20 09:04:59','2013-02-20 09:04:59','12159','未激活','杜聪','cong.du@newtouch.cn','12e688a85f211ddf8d688a8abe736855a9aa03b1','537a3fdc687ebb7b','28'),('8a53b7823cf6d775013cf6d9d7a60001','2013-02-20 09:05:37','2013-02-20 09:05:37','12158','未激活','刘天军','tianjun.liu@newtouch.cn','878821d4cb8f25c27d8454e8196d3f828ff111b0','a22ed4d56e0eb246','31'),('8a53b7823cf6d775013cf6da8b750002','2013-02-20 09:06:23','2013-02-20 09:06:23','12185','未激活','龚斌','bin.gong@newtouch.cn','2083924e31f958467627a9be0deffc0b4f409f3c','ad1f0389824f63c7','32'),('8a53b7823cf6d775013cf6db26ad0003','2013-02-20 09:07:02','2013-02-20 09:07:02','12175','未激活','鹿国强','guoqiang.lu@newtouch.cn','d3dd6c78db6fbddbc75328c366b63d1fd9d6ef4b','eee50dffc0c2bf65','33'),('8a53b7823cf6d775013cf6dbe57e0004','2013-02-20 09:07:51','2013-02-20 09:07:51','12173','未激活','王磊','lei.wang3@newtouch.cn','079bfa9fa15c23ae9608cdc8ab9577d2c181b730','f39c8cdd022d826e','34');
/*!40000 ALTER TABLE `ila_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ila_user_role`
--

DROP TABLE IF EXISTS `ila_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ila_user_role` (
  `ROLE_ID` varchar(50) NOT NULL,
  `USER_ID` varchar(50) NOT NULL,
  PRIMARY KEY  (`ROLE_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ila_user_role`
--

LOCK TABLES `ila_user_role` WRITE;
/*!40000 ALTER TABLE `ila_user_role` DISABLE KEYS */;
INSERT INTO `ila_user_role` VALUES ('1','8a53b7823cf1edfd013cf1f2271a0002'),('1','8a53b7823cf1edfd013cf1f2e96a0003'),('1','8a53b7823cf6d775013cf6d9d7a60001'),('1','8a53b7823cf6d775013cf6da8b750002'),('1','8a53b7823cf6d775013cf6db26ad0003'),('1','8a53b7823cf6d775013cf6dbe57e0004'),('2','8a53b7823cf1edfd013cf1f06c420001'),('3','8a53b7823cf1edfd013cf1eface40000'),('3','8a53b7823cf6d775013cf6d943410000'),('4','8a53b7823cf1edfd013cf1f3ad050004'),('5','8a53b7823cf1e831013cf1e8e7ba0000'),('administrator','0');
/*!40000 ALTER TABLE `ila_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-28 21:35:20

/*
SQLyog Ultimate v8.32 
MySQL - 5.7.20-log : Database - redrain
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`redrain` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `redrain`;

/*Table structure for table `award` */

DROP TABLE IF EXISTS `award`;

CREATE TABLE `award` (
  `awardid` int(11) NOT NULL AUTO_INCREMENT,
  `awardname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `awardtype` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `awardchance` int(11) DEFAULT NULL,
  PRIMARY KEY (`awardid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `award` */

insert  into `award`(`awardid`,`awardname`,`awardtype`,`awardchance`) values (1,'现金筹码8元','奖品',600),(2,'现金筹码18元','奖品',200),(3,'现金筹码28元','奖品',100),(4,'现金筹码58元','奖品',50),(5,'现金筹码88元','奖品',20),(6,'现金筹码188元','奖品',15),(7,'现金筹码588元','奖品',10),(8,'存500元送200元','奖品',2),(9,'iPhone8','奖品',2),(10,'奥迪A4','奖品',1);

/*Table structure for table `gain` */

DROP TABLE IF EXISTS `gain`;

CREATE TABLE `gain` (
  `gainid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `awardid` int(11) DEFAULT NULL,
  `gaintime` datetime DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`gainid`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `gain` */

insert  into `gain`(`gainid`,`userid`,`awardid`,`gaintime`,`status`) values (56,770,15,'2018-04-21 13:25:44','0'),(57,770,17,'2018-04-21 13:25:51','0'),(58,770,15,'2018-04-21 13:26:39','0'),(59,770,20,'2018-04-21 13:26:45','0'),(60,770,13,'2018-04-21 13:26:51','0'),(61,770,13,'2018-04-21 13:32:38','0'),(62,770,14,'2018-04-21 13:32:55','0'),(63,770,11,'2018-04-21 13:36:25','0'),(64,770,20,'2018-04-21 13:37:29','0'),(65,771,14,'2018-04-21 20:06:11','0'),(66,771,20,'2018-04-21 20:09:27','0'),(67,771,15,'2018-04-21 20:11:56','0'),(68,771,12,'2018-04-21 20:18:29','0'),(69,771,10,'2018-04-21 20:38:37','0'),(70,771,10,'2018-04-21 20:38:44','0'),(71,771,10,'2018-04-21 20:38:53','0'),(72,771,10,'2018-04-21 20:39:51','0'),(73,771,10,'2018-04-21 20:39:58','0'),(74,771,10,'2018-04-21 20:40:05','0'),(75,771,14,'2018-04-21 20:40:10','0'),(76,772,20,'2018-04-21 20:53:05','0'),(77,772,10,'2018-04-21 20:53:11','0'),(78,772,17,'2018-04-21 20:53:16','0'),(79,772,11,'2018-04-21 20:53:22','0'),(80,772,1,'2018-04-21 20:55:45','0'),(81,773,1,'2018-04-21 20:55:51','0'),(82,773,1,'2018-04-21 20:58:42','0'),(83,773,1,'2018-04-21 21:00:22','0'),(84,773,1,'2018-04-21 21:02:09','0'),(85,773,1,'2018-04-21 21:02:16','0'),(86,773,1,'2018-04-21 21:05:31','0'),(87,773,1,'2018-04-21 21:05:50','0'),(88,773,1,'2018-04-21 21:10:46','0'),(89,773,1,'2018-04-21 21:10:52','0'),(90,773,1,'2018-04-21 21:13:02','0'),(91,773,1,'2018-04-21 21:13:07','0'),(92,773,1,'2018-04-21 21:13:49','0'),(93,773,1,'2018-04-21 21:13:55','0'),(94,773,1,'2018-04-21 21:14:00','0'),(95,773,1,'2018-04-21 21:14:05','0'),(96,773,1,'2018-04-21 21:14:10','0'),(97,773,1,'2018-04-21 21:14:15','0'),(98,773,1,'2018-04-21 21:14:20','0'),(99,773,1,'2018-04-21 21:14:24','0'),(100,773,12,'2018-04-21 21:14:29','0'),(101,774,16,'2018-04-21 21:14:34','0'),(102,774,19,'2018-04-21 21:14:40','0'),(103,774,14,'2018-04-21 21:15:09','0'),(104,774,12,'2018-04-21 21:46:04','0'),(105,774,12,'2018-04-21 21:46:10','0'),(106,774,12,'2018-09-12 04:18:41','1'),(107,775,8,'2018-09-12 23:42:15','0'),(108,775,10,'2018-09-12 23:46:11','0'),(109,775,10,'2018-09-12 23:47:44','0'),(110,775,10,'2018-09-12 23:48:01','0'),(111,775,10,'2018-09-12 23:48:31','0'),(112,769,10,'2018-09-12 23:49:45','0'),(113,769,15,'2018-09-12 23:49:52','0');

/*Table structure for table `info` */

DROP TABLE IF EXISTS `info`;

CREATE TABLE `info` (
  `infoid` varchar(50) COLLATE utf8_bin NOT NULL,
  `infocontent` text COLLATE utf8_bin,
  `infotime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`infoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `info` */

insert  into `info`(`infoid`,`infocontent`,`infotime`,`updatetime`) values ('1111','12312wqeqwewqeqweqweqeqweeqweqwewqeqweqweqwewqqeqweqweqweqweqweqweqweqweeqweqweqwqewqweqwewq','2018-04-07 22:54:00','2018-04-10 19:12:52'),('7dcbcdf4-b0aa-4359-a95e-3f2858413c5b','测试三下','2018-04-10 00:02:42','2018-04-10 00:02:42'),('b5b4e43d-946e-419e-abb7-348fd2344d77','让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗让我一次挨个狗','2018-04-11 08:51:14','2018-04-11 08:51:14');

/*Table structure for table `lb` */

DROP TABLE IF EXISTS `lb`;

CREATE TABLE `lb` (
  `lbid` int(11) NOT NULL AUTO_INCREMENT,
  `lbname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `lbmoney` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`lbid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `lb` */

insert  into `lb`(`lbid`,`lbname`,`lbmoney`) values (1,'ceshi','10'),(2,'ceshi2','12'),(3,'ceshi','10'),(4,'ceshi2','12'),(5,'ceshi','10'),(6,'ceshi2','12'),(7,'ceshi','10'),(8,'ceshi2','12');

/*Table structure for table `rule` */

DROP TABLE IF EXISTS `rule`;

CREATE TABLE `rule` (
  `ruleid` varchar(50) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin,
  `categories` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `rule` */

insert  into `rule`(`ruleid`,`content`,`categories`) values ('0b533afb-1b8a-43e9-aa7c-524981f10a5f','<p>领红包活动于2018年3月10日上线，3月11日达到要求的会员可参与领红包活动！</p>','3'),('14bfefa7-05d1-423a-87d9-2fa95bbd6177','<p>注意事项</p>','4'),('18bdcecc-3681-4e7c-a969-238d9efecd66','<ol class=\"wenziol list-paddingleft-2\" style=\"padding: 0px 0px 0px 20px; font-size: 14px; line-height: 24px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Simsun,sans-self&quot;; color: rgb(254, 252, 168); white-space: normal; background-color: rgb(255, 255, 255);\"><li><p>达到活动要求的所有会员均可参与领红包活动；</p></li><li><p>新注册会员注册时需填写真实信息,并绑定银行卡等方可参与领红包活动；</p></li><li><p>达到条件后未参与领红包的会员，逾期视为自动放弃；</p></li><li><p>会员有效投注额（存款金额）数据均由系统自动统计，若有任何异议，以澳门新葡京核定为准不得争议。</p></li><li><p>当日的有效投注额（存款金额）记录计算方式采用的是美东时间，即北京时间每天中午12点至次日中午11:59:59；</p></li><li><p>如当天未进行结算或国际线路延迟数据，将在隔天进行计算，对此有异议将以系统数据为准。</p></li><li><p>每台电脑，每位会员，每个IP当日最多仅限10次参与机会，如发现会员同一个IP下注册多个账号进行投注领红包，公司 有权拒绝赠送其彩金并做账号冻结处理，保证正常玩家的利益。</p></li><li><p>所领到红包金额系统自动派发，无需申请,1-10分钟内到账。</p></li><li><p>此红包活动为【澳门新葡京】系统程序自动运行，红包的概率完全遵循力学及自然概率，不涉及任何人工操作，抽奖 结果以系统判定为准，不得争议。</p></li><li><p>参与该优惠，即表示您同意《优惠规则与条款》。</p></li></ol><p><br/></p>','2'),('54068c9a-56b8-4b14-952b-6cc49eb87697','<p>领红包活动一：</p><p>新人福利专场</p><p>即日起成功注册成为澳门新葡京会员，即可在次日参与领红包活动，最高可领10次，单个红包最高888元，快快邀请您的朋友注册参与领红包活动！</p><table class=\"biao\" width=\"889\"><tbody><tr class=\"biaotou firstRow\"><td width=\"17%\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(255, 255, 108); background: rgb(154, 23, 21); border-color: rgb(220, 45, 40);\" height=\"40\">参与会员</td><td width=\"22%\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(255, 255, 108); background: rgb(154, 23, 21); border-color: rgb(220, 45, 40);\" height=\"40\">当日存款金额</td><td width=\"17%\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(255, 255, 108); background: rgb(154, 23, 21); border-color: rgb(220, 45, 40);\" height=\"40\">可领次数</td><td width=\"19%\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(255, 255, 108); background: rgb(154, 23, 21); border-color: rgb(220, 45, 40);\" height=\"40\">红包随机金额</td><td width=\"13%\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(255, 255, 108); background: rgb(154, 23, 21); border-color: rgb(220, 45, 40);\" height=\"40\">领红包时间</td><td width=\"12%\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(255, 255, 108); background: rgb(154, 23, 21); border-color: rgb(220, 45, 40);\" height=\"40\">派送方式</td></tr><tr><td rowspan=\"6\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">新注册会员</td><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">存款10元+</td><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">1次</td><td rowspan=\"9\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">1-888元</td><td rowspan=\"9\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">北京时间14:00可参与领红包</td><td rowspan=\"9\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\"><p style=\"text-align:center;font-size: 14px; line-height: 24px;\">自动派发&nbsp;<br/>1-10分钟</p>内到账</td></tr><tr><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">存款200元+</td><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">2次</td></tr><tr><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">存款800元+</td><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">3次</td></tr><tr><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">存款3000元+</td><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">5次</td></tr><tr><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">存款20000元+</td><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">8次</td></tr><tr><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">存款50000元+</td><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">10次</td></tr><tr><td><br/></td><td><br/></td><td><br/></td></tr><tr><td><br/></td><td><br/></td><td><br/></td></tr><tr><td><br/></td><td><br/></td><td><br/></td></tr></tbody></table><p>例如：美东时间3月10日（北京时间12:00-次日中午12:00）新注册的会员，北京时间3月11日14:00-17:00限时领红包活动，逾期则视为放弃！</p><p>领红包活动二：</p><p>新老会员同享</p><p>凡是在澳门新葡京进行游戏投注，当日有效总投注达到200元的会员皆可在次日参与千万现金领红包活动，千万现金红包将于北京 时间19:00开始领取。 单个红包金额最高1888元。</p><table class=\"biao\" width=\"889\"><tbody><tr class=\"biaotou firstRow\"><td width=\"17%\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(255, 255, 108); background: rgb(154, 23, 21); border-color: rgb(220, 45, 40);\" height=\"40\">参与会员</td><td width=\"22%\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(255, 255, 108); background: rgb(154, 23, 21); border-color: rgb(220, 45, 40);\" height=\"40\">前日累计有效投注</td><td width=\"17%\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(255, 255, 108); background: rgb(154, 23, 21); border-color: rgb(220, 45, 40);\" height=\"40\">可领次数</td><td width=\"19%\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(255, 255, 108); background: rgb(154, 23, 21); border-color: rgb(220, 45, 40);\" height=\"40\">红包随机金额</td><td width=\"13%\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(255, 255, 108); background: rgb(154, 23, 21); border-color: rgb(220, 45, 40);\" height=\"40\">领红包时间</td><td width=\"12%\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(255, 255, 108); background: rgb(154, 23, 21); border-color: rgb(220, 45, 40);\" height=\"40\">派送方式</td></tr><tr><td rowspan=\"6\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">所有会员</td><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">200元+</td><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">1次</td><td rowspan=\"9\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">1-1888元</td><td rowspan=\"9\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">北京时间19:00-23：59可参与领红包</td><td rowspan=\"9\" style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\"><p style=\"text-align:center;font-size: 14px; line-height: 24px;\">自动派发&nbsp;<br/>1-10分钟</p>内到账</td></tr><tr><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">1000元+</td><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">2次</td></tr><tr><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">10000元+</td><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">3次</td></tr><tr><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">50000元+</td><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">5次</td></tr><tr><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">200000元+</td><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">8次</td></tr><tr><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">1000000元+</td><td style=\"margin: 0px; padding: 0px; font-size: 15px; line-height: 24px; text-align: center; color: rgb(254, 252, 168); background: rgb(168, 30, 26); border-color: rgb(220, 45, 40);\" height=\"40\">10次</td></tr><tr><td><br/></td><td><br/></td><td><br/></td></tr><tr><td><br/></td><td><br/></td><td><br/></td></tr><tr><td><br/></td><td><br/></td><td><br/></td></tr></tbody></table><p>例如：美东时间3月10日（北京时间12:00-次日中午12:00）计算有效投注，北京时间3月11日19:00:00-23:59:59即可登录参与领红包活动； 逾期则视为放弃！</p><p><br/></p>','1'),('6ba4e77a-d3bc-4265-baf1-65a1b43681a1','<p>221312321</p>',NULL),('d4aff478-6bfd-4f30-b6ea-6c81da532d33','<p>游戏规则是这样的</p>',NULL);

/*Table structure for table `setting` */

DROP TABLE IF EXISTS `setting`;

CREATE TABLE `setting` (
  `settingid` int(11) NOT NULL AUTO_INCREMENT,
  `webname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `keyword` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `hasevent` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `min` int(11) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `fbtime` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `sbtime` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `totalnum` int(11) DEFAULT NULL,
  `totalmoney` int(11) DEFAULT NULL,
  PRIMARY KEY (`settingid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `setting` */

insert  into `setting`(`settingid`,`webname`,`keyword`,`description`,`hasevent`,`max`,`min`,`starttime`,`duration`,`endtime`,`fbtime`,`sbtime`,`totalnum`,`totalmoney`) values (1,'红包','测试','测试','1',20,10,'2018-09-11 13:00:00',60,'2018-09-14 01:00:00','11:00:00','24:00:00',5,15);

/*Table structure for table `throw` */

DROP TABLE IF EXISTS `throw`;

CREATE TABLE `throw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `throwtime` datetime DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `throw` */

insert  into `throw`(`id`,`userid`,`message`,`throwtime`,`status`) values (4,769,'再扔一个试试呢','2018-04-10 22:46:18','1'),(5,769,'再扔一个试试呢','2018-04-10 22:46:22','1'),(6,769,'再扔一个试试呢','2018-04-10 22:56:54','1'),(7,769,'再扔一个试试呢','2018-04-10 22:56:56','1'),(8,769,'测试一下','2018-04-11 02:06:46','0'),(9,769,'测试哦','2018-04-11 02:07:28','0'),(10,NULL,'123123131','2018-04-11 11:45:17','0'),(11,770,'cehi','2018-04-11 22:15:18','0'),(12,770,'cehi','2018-04-11 22:15:25','0'),(13,770,'cehi','2018-04-11 22:15:31','0'),(14,770,'cehi','2018-04-11 22:15:37','0'),(15,770,'cehi','2018-04-11 22:15:43','0'),(16,770,'cehi','2018-04-11 22:15:49','0'),(17,770,'cehi','2018-04-11 22:15:54','0'),(18,770,'cehi','2018-04-11 22:16:00','0'),(19,770,'cehi','2018-04-11 22:16:06','0'),(20,770,'cehi','2018-04-11 22:16:11','0'),(21,770,'cehi','2018-04-11 22:16:17','0'),(22,770,'cehi','2018-04-11 22:16:23','0'),(23,770,'cehi','2018-04-11 22:16:28','0'),(24,770,'cehi','2018-04-11 22:16:34','0'),(25,770,'cehi','2018-04-11 22:16:40','0'),(26,770,'cehi','2018-04-11 22:16:46','0'),(27,770,'cehi','2018-04-11 22:16:52','0'),(28,770,'cehi','2018-04-11 22:16:58','0'),(29,770,'cehi','2018-04-11 22:17:04','0'),(30,769,'ceshi1','2018-04-11 22:43:12','0'),(31,NULL,'ceshi','2018-04-11 22:44:11','0'),(32,NULL,'ceshi','2018-04-11 22:44:23','0'),(33,NULL,'ceshi','2018-04-11 22:44:35','0'),(34,NULL,'ceshi','2018-04-11 22:54:17','0'),(35,NULL,'3123213','2018-04-11 22:58:33','0'),(36,NULL,'123123','2018-04-11 23:10:25','0'),(37,NULL,'23213','2018-04-11 23:17:15','0'),(38,770,'123213123','2018-04-11 23:21:58','0');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `floatercount` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `role` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `fixedmoney` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=777 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `user` */

insert  into `user`(`userid`,`username`,`password`,`floatercount`,`name`,`role`,`fixedmoney`) values (1,'admin','123456',NULL,'admin','admin',NULL),(769,'wbq',NULL,10,'wbq',NULL,0),(770,'luyh',NULL,0,'luyh',NULL,NULL),(771,'luyh',NULL,0,NULL,NULL,10),(772,'luyh',NULL,0,NULL,NULL,0),(773,'luyh',NULL,0,NULL,NULL,1),(774,'luyh',NULL,3,NULL,NULL,12),(775,'ceshi',NULL,0,NULL,NULL,10),(776,'ceshi2',NULL,2,NULL,NULL,12);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*
Navicat MySQL Data Transfer

Source Server         : VC_Cube
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : my_library

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2022-05-18 17:28:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(20) DEFAULT NULL,
  `password` char(40) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(64) DEFAULT NULL,
  `author` char(64) DEFAULT NULL,
  `isbn` char(64) DEFAULT NULL,
  `language` char(64) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('34', 'JavaScript开发实战', '约翰·拉尔森', '9787111586715', 'Chinese', '1', '1');
INSERT INTO `book` VALUES ('35', 'JavaScript开发实战', '约翰·拉尔森', '9787111586715', 'Chinese', '1', '1');
INSERT INTO `book` VALUES ('47', 'JavaScript开发实战', '约翰·拉尔森', '9787111586715', 'Chinese', '1', '1');
INSERT INTO `book` VALUES ('48', 'JavaScript开发实战', '约翰·拉尔森', '9787111586715', 'Chinese', '1', '1');
INSERT INTO `book` VALUES ('49', 'JavaScript开发实战', '约翰·拉尔森', '9787111586715', 'Chinese', '1', '1');
INSERT INTO `book` VALUES ('50', 'JavaScript开发实战', '约翰·拉尔森', '9787111586715', 'Chinese', '1', '1');
INSERT INTO `book` VALUES ('51', 'JavaScript开发实战', '约翰·拉尔森', '9787111586715', 'Chinese', '1', '1');
INSERT INTO `book` VALUES ('52', 'JavaScript开发实战', '约翰·拉尔森', '9787111586715', 'Chinese', '1', '1');
INSERT INTO `book` VALUES ('53', 'JavaScript开发实战', '约翰·拉尔森', '9787111586715', 'Chinese', '1', '1');
INSERT INTO `book` VALUES ('54', 'JavaScript开发实战', '约翰·拉尔森', '9787111586715', 'Chinese', '2', '1');
INSERT INTO `book` VALUES ('57', '西游记（全彩绘画版）', '吴承恩', '9787302521426', 'Chinese', '2', '2');
INSERT INTO `book` VALUES ('58', '西游记（全彩绘画版）', '吴承恩', '9787302521426', 'Chinese', '2', '2');
INSERT INTO `book` VALUES ('59', 'JavaScript', '约翰·拉尔森', '9787111586715', 'Chinese', '1', '1');

-- ----------------------------
-- Table structure for `borrow`
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL COMMENT '开始借阅时间',
  `end_time` datetime DEFAULT NULL COMMENT '还书时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `bookid` (`book_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES ('82', '34', '10001', '2022-04-11 13:26:23', '2022-04-24 13:26:36');
INSERT INTO `borrow` VALUES ('83', '34', '10001', '2022-05-18 14:44:52', null);

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '计算机');
INSERT INTO `category` VALUES ('2', '文学');
INSERT INTO `category` VALUES ('3', '科幻');

-- ----------------------------
-- Table structure for `location`
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES ('1', 'A-1');
INSERT INTO `location` VALUES ('2', 'A-2');
INSERT INTO `location` VALUES ('3', 'A-3');

-- ----------------------------
-- Table structure for `pay`
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `done` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay
-- ----------------------------
INSERT INTO `pay` VALUES ('1', '10001', '4', '1');

-- ----------------------------
-- Table structure for `reserve`
-- ----------------------------
DROP TABLE IF EXISTS `reserve`;
CREATE TABLE `reserve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reserve
-- ----------------------------
INSERT INTO `reserve` VALUES ('1', '34', '10001', '2022-05-04 19:27:07', '2022-05-18 14:24:33');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(20) DEFAULT NULL,
  `password` char(40) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL COMMENT '系统通知用户预定借书',
  `debt` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10001', 'lwt', 'asd', '386401059@qq.com', '0');

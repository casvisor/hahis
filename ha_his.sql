/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : ha_his

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 29/03/2024 17:34:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `areaId` int(11) NOT NULL AUTO_INCREMENT,
  `areaName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`areaId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (4, '广东省A有限公司 ');

-- ----------------------------
-- Table structure for ban
-- ----------------------------
DROP TABLE IF EXISTS `ban`;
CREATE TABLE `ban`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ban
-- ----------------------------
INSERT INTO `ban` VALUES (1, '有班');
INSERT INTO `ban` VALUES (2, '无班');

-- ----------------------------
-- Table structure for baoque
-- ----------------------------
DROP TABLE IF EXISTS `baoque`;
CREATE TABLE `baoque`  (
  `baoqueid` int(11) NOT NULL AUTO_INCREMENT,
  `baoqueName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `baoqueNum` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`baoqueid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of baoque
-- ----------------------------

-- ----------------------------
-- Table structure for bed
-- ----------------------------
DROP TABLE IF EXISTS `bed`;
CREATE TABLE `bed`  (
  `bedId` int(11) NOT NULL AUTO_INCREMENT,
  `bedname` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `departmentId` int(11) NOT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `Price` double NULL DEFAULT NULL,
  PRIMARY KEY (`bedId`) USING BTREE,
  INDEX `fk_bedDepartmentid`(`departmentId`) USING BTREE,
  CONSTRAINT `fk_bedDepartmentid` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`departmentid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bed
-- ----------------------------
INSERT INTO `bed` VALUES (8, '外科1', 8, 0, 10);
INSERT INTO `bed` VALUES (9, '内科一', 7, 1, 10);

-- ----------------------------
-- Table structure for caigou
-- ----------------------------
DROP TABLE IF EXISTS `caigou`;
CREATE TABLE `caigou`  (
  `caigouid` int(11) NOT NULL AUTO_INCREMENT,
  `caigouname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gonghuoshang` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `danwei` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `candi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leixing` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shuliang` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`caigouid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of caigou
-- ----------------------------
INSERT INTO `caigou` VALUES (16, '阿莫西林', '春天大药房 ', '盒', '河南省a有限公司 ', '西药', 20);

-- ----------------------------
-- Table structure for cashier
-- ----------------------------
DROP TABLE IF EXISTS `cashier`;
CREATE TABLE `cashier`  (
  `cashier` int(11) NOT NULL AUTO_INCREMENT,
  `reportId` int(11) NOT NULL,
  `durgname` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `durgnum` int(11) NOT NULL,
  `repiceprice` double NOT NULL,
  `repicetotal` double NOT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `ctime` date NULL DEFAULT NULL,
  `ostate` int(11) NULL DEFAULT NULL,
  `jie` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mstate` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cashier`) USING BTREE,
  INDEX `fk_reportId`(`reportId`) USING BTREE,
  CONSTRAINT `fk_reportId` FOREIGN KEY (`reportId`) REFERENCES `report` (`reportid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cashier
-- ----------------------------
INSERT INTO `cashier` VALUES (34, 28, '板蓝根', 1, 30, 30, 0, '2023-11-21', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (35, 28, '阿莫西林', 1, 30, 30, 0, '2023-11-21', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (36, 28, '挂号费', 1, 30, 30, 2, '2023-11-21', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (37, 29, 'ct', 1, 100, 100, 1, '2023-11-21', 1, '脑部肿瘤', 1);
INSERT INTO `cashier` VALUES (38, 29, '打针', 1, 20, 20, 1, '2023-11-21', 0, NULL, 1);
INSERT INTO `cashier` VALUES (39, 30, '阿莫西林', 1, 30, 30, 0, '2023-11-21', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (40, 30, 'ct', 1, 100, 100, 1, '2023-11-21', 1, '良好', 1);
INSERT INTO `cashier` VALUES (41, 30, '挂号费', 1, 30, 30, 2, '2023-11-21', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (43, 31, 'ct', 1, 100, 100, 1, '2023-11-26', 1, '良好', 1);
INSERT INTO `cashier` VALUES (44, 31, '打针', 1, 20, 20, 1, '2023-11-26', 0, NULL, 1);

-- ----------------------------
-- Table structure for checkup
-- ----------------------------
DROP TABLE IF EXISTS `checkup`;
CREATE TABLE `checkup`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `registerid` int(11) NULL DEFAULT NULL,
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ctime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `fk_rid`(`registerid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checkup
-- ----------------------------

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`  (
  `departmentId` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`departmentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES (7, '内科');
INSERT INTO `departments` VALUES (8, '外科');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `doctorId` int(11) NOT NULL AUTO_INCREMENT,
  `doctorName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `departmentId` int(11) NOT NULL,
  `registeredId` int(11) NOT NULL,
  `dstate` int(11) NULL DEFAULT NULL,
  `amStartTime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '8:00',
  `amEndTime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '12:00',
  `pmStartTime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '14:00',
  `pmEndTime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '18:00',
  PRIMARY KEY (`doctorId`) USING BTREE,
  INDEX `fk_department`(`departmentId`) USING BTREE,
  INDEX `fk_registeredtype`(`registeredId`) USING BTREE,
  CONSTRAINT `fk_department` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`departmentId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_registeredtype` FOREIGN KEY (`registeredId`) REFERENCES `registeredtype` (`registeredid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (13, '刘正和', 7, 5, 0, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (14, '王金龙', 7, 6, 0, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (15, '张春梅', 7, 5, 1, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (16, '李建坤', 8, 5, 1, '8:00', '12:00', '14:00', '18:00');

-- ----------------------------
-- Table structure for drugdictionary
-- ----------------------------
DROP TABLE IF EXISTS `drugdictionary`;
CREATE TABLE `drugdictionary`  (
  `drugId` int(11) NOT NULL AUTO_INCREMENT,
  `drugName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unitId` int(11) NOT NULL,
  `sellingPrice` double NOT NULL,
  `areaId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  PRIMARY KEY (`drugId`) USING BTREE,
  INDEX `fk_unitid`(`unitId`) USING BTREE,
  INDEX `fk_areaId`(`areaId`) USING BTREE,
  INDEX `fk_typeId`(`typeId`) USING BTREE,
  CONSTRAINT `fk_areaId` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_typeId` FOREIGN KEY (`typeId`) REFERENCES `type` (`typeid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_unitid` FOREIGN KEY (`unitId`) REFERENCES `unit` (`unitid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of drugdictionary
-- ----------------------------
INSERT INTO `drugdictionary` VALUES (9, '阿莫西林', 7, 30, 4, 5);
INSERT INTO `drugdictionary` VALUES (10, '板蓝根', 9, 30, 4, 5);

-- ----------------------------
-- Table structure for drugstore
-- ----------------------------
DROP TABLE IF EXISTS `drugstore`;
CREATE TABLE `drugstore`  (
  `rugstoreId` int(11) NOT NULL AUTO_INCREMENT,
  `drugstoreName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplierId` int(11) NULL DEFAULT NULL,
  `skullId` int(11) NULL DEFAULT NULL,
  `warehouseId` int(11) NULL DEFAULT NULL,
  `unit` int(11) NOT NULL,
  `tradePrice` double NOT NULL,
  `sellingPrice` double NOT NULL,
  `area` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `produceDate` date NOT NULL,
  `validDate` date NOT NULL,
  `drugstorenum` int(11) NOT NULL,
  `batch` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`rugstoreId`) USING BTREE,
  INDEX `fk_supplierId`(`supplierId`) USING BTREE,
  INDEX `fk_skullId`(`skullId`) USING BTREE,
  INDEX `fk_warehouseId`(`warehouseId`) USING BTREE,
  INDEX `fk_dgarea`(`area`) USING BTREE,
  INDEX `fk_dgunit`(`unit`) USING BTREE,
  INDEX `fk_dtype`(`type`) USING BTREE,
  CONSTRAINT `fk_dgarea` FOREIGN KEY (`area`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_dgunit` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_dtype` FOREIGN KEY (`type`) REFERENCES `type` (`typeid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_skullId` FOREIGN KEY (`skullId`) REFERENCES `skull` (`skullid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_supplierId` FOREIGN KEY (`supplierId`) REFERENCES `upplier` (`supplierid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_warehouseId` FOREIGN KEY (`warehouseId`) REFERENCES `warehuose` (`warehouseid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of drugstore
-- ----------------------------
INSERT INTO `drugstore` VALUES (12, '板蓝根', 5, 4, 2, 9, 10, 30, 4, 5, '2023-10-30', '2025-01-04', 40, '20231030');

-- ----------------------------
-- Table structure for home
-- ----------------------------
DROP TABLE IF EXISTS `home`;
CREATE TABLE `home`  (
  `homeId` int(11) NOT NULL AUTO_INCREMENT,
  `homeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `carId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`homeId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of home
-- ----------------------------
INSERT INTO `home` VALUES (73, '李兰吉', '男', 19, NULL, NULL);
INSERT INTO `home` VALUES (74, '吴建虎', '男', 19, '412823199912242414', '17634525258');

-- ----------------------------
-- Table structure for hospitalprice
-- ----------------------------
DROP TABLE IF EXISTS `hospitalprice`;
CREATE TABLE `hospitalprice`  (
  `hospitalpriceid` int(11) NOT NULL AUTO_INCREMENT,
  `registerId` int(11) NOT NULL,
  `durgname` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `durgnum` int(11) NOT NULL,
  `repiceprice` double NOT NULL,
  `repicetotal` double NOT NULL,
  `htime` datetime(0) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`hospitalpriceid`) USING BTREE,
  INDEX `fk_registerId`(`registerId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hospitalprice
-- ----------------------------
INSERT INTO `hospitalprice` VALUES (104, 12, '开颅手术', 1, 500, 500, '2023-11-21 15:12:26', 1);
INSERT INTO `hospitalprice` VALUES (105, 12, '阿莫西林', 2, 30, 60, '2023-11-21 15:13:47', 2);
INSERT INTO `hospitalprice` VALUES (106, 13, '板蓝根', 1, 30, 30, '2023-11-26 19:11:44', 0);

-- ----------------------------
-- Table structure for huishou
-- ----------------------------
DROP TABLE IF EXISTS `huishou`;
CREATE TABLE `huishou`  (
  `huishouid` int(11) NOT NULL AUTO_INCREMENT,
  `huishouname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `huishounumber` int(11) NOT NULL,
  `huishoupihao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jbr` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `beizhu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`huishouid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of huishou
-- ----------------------------
INSERT INTO `huishou` VALUES (5, '阿莫西林', 17, '20191121', '门诊', '有问题，请更换 20盒');

-- ----------------------------
-- Table structure for inhospitaltype
-- ----------------------------
DROP TABLE IF EXISTS `inhospitaltype`;
CREATE TABLE `inhospitaltype`  (
  `inhospitalId` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit` int(11) NOT NULL,
  `price` double NOT NULL,
  `bigprojectId` int(11) NOT NULL,
  PRIMARY KEY (`inhospitalId`) USING BTREE,
  INDEX `fk_inhospitaltype`(`bigprojectId`) USING BTREE,
  INDEX `fk_inhunit`(`unit`) USING BTREE,
  CONSTRAINT `fk_inhospitaltype` FOREIGN KEY (`bigprojectId`) REFERENCES `projecttype` (`projectid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_inhunit` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inhospitaltype
-- ----------------------------

-- ----------------------------
-- Table structure for inoutpatienttype
-- ----------------------------
DROP TABLE IF EXISTS `inoutpatienttype`;
CREATE TABLE `inoutpatienttype`  (
  `inoutpatientId` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit` int(11) NOT NULL,
  `bigproJectId` int(11) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`inoutpatientId`) USING BTREE,
  INDEX `fk_inoutpatienttype`(`bigproJectId`) USING BTREE,
  INDEX `fk_intunit`(`unit`) USING BTREE,
  CONSTRAINT `fk_inoutpatienttype` FOREIGN KEY (`bigproJectId`) REFERENCES `projecttype` (`projectid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_intunit` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inoutpatienttype
-- ----------------------------
INSERT INTO `inoutpatienttype` VALUES (5, '开颅手术', 8, 1, 500);

-- ----------------------------
-- Table structure for jilu
-- ----------------------------
DROP TABLE IF EXISTS `jilu`;
CREATE TABLE `jilu`  (
  `jiluid` int(11) NOT NULL AUTO_INCREMENT,
  `jiluname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jilutime` datetime(0) NOT NULL,
  `jilutype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jilupeople` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jilunumber` int(11) NULL DEFAULT NULL,
  `jilupihao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`jiluid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 193 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jilu
-- ----------------------------
INSERT INTO `jilu` VALUES (187, '板蓝根', '2023-11-21 14:58:00', '常规入库', '门诊', 100, '20231121');
INSERT INTO `jilu` VALUES (188, '阿莫西林', '2023-11-21 14:58:46', '常规入库', '门诊', 30, '20231121');
INSERT INTO `jilu` VALUES (189, '阿莫西林', '2023-11-21 14:59:42', '正常出库', '门诊', 20, '20231121');
INSERT INTO `jilu` VALUES (190, '板蓝根', '2023-11-21 14:59:49', '正常出库', '门诊', 50, '20231121');
INSERT INTO `jilu` VALUES (191, '板蓝根', '2023-11-21 15:17:48', '紧急补给药房', '门诊', 10, '20231121');
INSERT INTO `jilu` VALUES (192, '阿莫西林', '2023-11-21 15:24:55', '正常出库', '门诊', 10, '20231121');

-- ----------------------------
-- Table structure for moneytype
-- ----------------------------
DROP TABLE IF EXISTS `moneytype`;
CREATE TABLE `moneytype`  (
  `MoneyId` int(11) NOT NULL AUTO_INCREMENT,
  `Moneytype` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Percent` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`MoneyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of moneytype
-- ----------------------------
INSERT INTO `moneytype` VALUES (10, '无', '0%');
INSERT INTO `moneytype` VALUES (11, '城镇社保', '30%');
INSERT INTO `moneytype` VALUES (12, '农村医疗合作社', '35%');

-- ----------------------------
-- Table structure for outpatienttype
-- ----------------------------
DROP TABLE IF EXISTS `outpatienttype`;
CREATE TABLE `outpatienttype`  (
  `outpatientId` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit` int(11) NOT NULL,
  `bigprojectId` int(11) NOT NULL,
  `price` double NOT NULL,
  `ostate` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`outpatientId`) USING BTREE,
  INDEX `fk_outpatienttype`(`bigprojectId`) USING BTREE,
  INDEX `fk_outunit`(`unit`) USING BTREE,
  CONSTRAINT `fk_outpatienttype` FOREIGN KEY (`bigprojectId`) REFERENCES `projecttype` (`projectid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_outunit` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of outpatienttype
-- ----------------------------
INSERT INTO `outpatienttype` VALUES (7, 'ct', 8, 2, 100, 1);
INSERT INTO `outpatienttype` VALUES (8, '打针', 8, 2, 20, 0);

-- ----------------------------
-- Table structure for paiban
-- ----------------------------
DROP TABLE IF EXISTS `paiban`;
CREATE TABLE `paiban`  (
  `paiId` int(11) NOT NULL AUTO_INCREMENT,
  `one` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无班',
  `two` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无班',
  `three` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无班',
  `four` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无班',
  `five` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无班',
  `six` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无班',
  `seven` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无班',
  `doctorId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`paiId`) USING BTREE,
  INDEX `fk_paiId`(`doctorId`) USING BTREE,
  CONSTRAINT `fk_paiId` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of paiban
-- ----------------------------
INSERT INTO `paiban` VALUES (12, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 16);
INSERT INTO `paiban` VALUES (13, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 15);
INSERT INTO `paiban` VALUES (14, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 14);
INSERT INTO `paiban` VALUES (15, '有班', '有班', '有班', '无班', '有班', '有班', '有班', 13);

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay`  (
  `payid` int(11) NOT NULL AUTO_INCREMENT,
  `registerid` int(11) NULL DEFAULT NULL,
  `money` double NULL DEFAULT NULL,
  `payDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`payid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pay
-- ----------------------------
INSERT INTO `pay` VALUES (9, 12, 10, '2023-11-21 15:13:09');
INSERT INTO `pay` VALUES (10, 13, 10, '2023-11-26 09:44:56');

-- ----------------------------
-- Table structure for pharmacy
-- ----------------------------
DROP TABLE IF EXISTS `pharmacy`;
CREATE TABLE `pharmacy`  (
  `pharmacyId` int(11) NOT NULL AUTO_INCREMENT,
  `pharmacyName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `drugstoreId` int(11) NULL DEFAULT NULL,
  `skullId` int(11) NULL DEFAULT NULL,
  `warehouseId` int(11) NULL DEFAULT NULL,
  `unit` int(11) NOT NULL,
  `sellingPrice` double NOT NULL,
  `area` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `produceDate` date NOT NULL,
  `validDate` date NOT NULL,
  `drugstorenum` int(11) NOT NULL,
  `skullbatch` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pharmacyId`) USING BTREE,
  INDEX `fk_drugstoreIdp`(`drugstoreId`) USING BTREE,
  INDEX `fk_skullIdp`(`skullId`) USING BTREE,
  INDEX `fk_warehouseIdp`(`warehouseId`) USING BTREE,
  INDEX `fk_dgareap`(`area`) USING BTREE,
  INDEX `fk_unitp`(`unit`) USING BTREE,
  INDEX `fk_typep`(`type`) USING BTREE,
  CONSTRAINT `fk_dgareap` FOREIGN KEY (`area`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_drugstoreIdp` FOREIGN KEY (`drugstoreId`) REFERENCES `drugstore` (`rugstoreId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_skullIdp` FOREIGN KEY (`skullId`) REFERENCES `skull` (`skullid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_typep` FOREIGN KEY (`type`) REFERENCES `type` (`typeid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_unitp` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_warehouseIdp` FOREIGN KEY (`warehouseId`) REFERENCES `warehuose` (`warehouseid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pharmacy
-- ----------------------------
INSERT INTO `pharmacy` VALUES (11, '板蓝根', NULL, 4, 2, 9, 30, 4, 5, '2023-10-30', '2025-01-04', 58, '20191121');
INSERT INTO `pharmacy` VALUES (12, '阿莫西林', NULL, 4, 2, 7, 30, 4, 5, '2023-10-25', '2025-02-01', 9, '20191121');

-- ----------------------------
-- Table structure for projecttype
-- ----------------------------
DROP TABLE IF EXISTS `projecttype`;
CREATE TABLE `projecttype`  (
  `projectId` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`projectId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of projecttype
-- ----------------------------
INSERT INTO `projecttype` VALUES (1, '住院医疗综合服务类');
INSERT INTO `projecttype` VALUES (2, '门诊医疗综合服务类');

-- ----------------------------
-- Table structure for register
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register`  (
  `registerid` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `department` int(11) NOT NULL,
  `doctor` int(11) NOT NULL,
  `diagnose` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Idcard` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registerDate` datetime(0) NULL DEFAULT NULL,
  `bedNum` int(11) NULL DEFAULT NULL,
  `Operator` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` double NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `endDate` datetime(0) NULL DEFAULT NULL,
  `price` double UNSIGNED NULL DEFAULT NULL,
  `discount` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zhuan` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`registerid`) USING BTREE,
  INDEX `fk_regdepartment`(`department`) USING BTREE,
  INDEX `fk_regdoctor`(`doctor`) USING BTREE,
  CONSTRAINT `fk_regdepartment` FOREIGN KEY (`department`) REFERENCES `departments` (`departmentId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_regdoctor` FOREIGN KEY (`doctor`) REFERENCES `doctor` (`doctorId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of register
-- ----------------------------
INSERT INTO `register` VALUES (12, '李福州', 20, '男', 7, 15, '脑部肿瘤', '河南', '15565792390', '412827199605062586', '2023-11-21 15:11:17', 9, '门诊', 10010, 1, '2023-11-21 15:14:05', 392, '30%', NULL);
INSERT INTO `register` VALUES (13, '王虎', 12, '男', 7, 15, '良好', '河南', '13271678052', '412702199902080557', '2023-11-26 09:39:50', 9, '超级管理员', 1010, 0, NULL, NULL, '35%', NULL);

-- ----------------------------
-- Table structure for registeredtype
-- ----------------------------
DROP TABLE IF EXISTS `registeredtype`;
CREATE TABLE `registeredtype`  (
  `registeredId` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`registeredId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of registeredtype
-- ----------------------------
INSERT INTO `registeredtype` VALUES (5, '普通挂号', 20);
INSERT INTO `registeredtype` VALUES (6, '专家号', 30);

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `reportId` int(11) NOT NULL AUTO_INCREMENT,
  `reportName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `department` int(11) NULL DEFAULT NULL,
  `doctor` int(11) NULL DEFAULT NULL,
  `reportType` int(11) NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  `users` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `carid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zhuan` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`reportId`) USING BTREE,
  INDEX `fk_departmentr`(`department`) USING BTREE,
  INDEX `fk_doctor`(`doctor`) USING BTREE,
  INDEX `fk_reportType`(`reportType`) USING BTREE,
  CONSTRAINT `fk_departmentr` FOREIGN KEY (`department`) REFERENCES `departments` (`departmentId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_doctor` FOREIGN KEY (`doctor`) REFERENCES `doctor` (`doctorId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_reportType` FOREIGN KEY (`reportType`) REFERENCES `registeredtype` (`registeredId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES (28, '刘建喜', '男', 20, 7, 14, 6, 30, '2023-11-21 14:00:00', NULL, 3, '13183380740', '412827199807156595', '头痛，发烧');
INSERT INTO `report` VALUES (29, '李福州', '男', 20, 7, 14, 6, 30, '2023-11-21 15:04:50', '门诊', 5, '15565792390', '412827199605062586', '脑部肿瘤');
INSERT INTO `report` VALUES (30, '杨帅', '男', 20, 7, 14, 6, 30, '2023-11-21 14:00:00', NULL, 3, '13183380740', '412369199512023695', '头痛');
INSERT INTO `report` VALUES (31, '宋辉', '男', 12, 7, 13, 5, 20, '2023-11-26 09:16:47', '超级管理员', 5, '13271678052', '412702199902080557', '良好');
INSERT INTO `report` VALUES (32, '王建康', '男', 10, 7, 14, 6, 30, '2023-06-27 19:53:37', '最代码管理员', 0, '13520109202', '232323188201202718', NULL);

-- ----------------------------
-- Table structure for skull
-- ----------------------------
DROP TABLE IF EXISTS `skull`;
CREATE TABLE `skull`  (
  `skullId` int(11) NOT NULL AUTO_INCREMENT,
  `skullName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`skullId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of skull
-- ----------------------------
INSERT INTO `skull` VALUES (4, '张山');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spread` int(255) NULL DEFAULT NULL COMMENT '0不展开1展开',
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(255) NULL DEFAULT NULL COMMENT '0不可用1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '医院管理系统', '', 1, NULL, '&#xe68e;', 1);
INSERT INTO `sys_menu` VALUES (2, 1, '门诊管理', '', 0, NULL, '&#xe653;', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '住院管理', '', 0, NULL, '&#xe663;', 1);
INSERT INTO `sys_menu` VALUES (4, 1, '系统管理', '', 0, '', '&#xe716;', 1);
INSERT INTO `sys_menu` VALUES (5, 1, '统计管理', '', 0, NULL, '&#xe629;', 1);
INSERT INTO `sys_menu` VALUES (6, 2, '用户挂号', '../cao/index', 0, NULL, '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (7, 2, '处方划价', '../caocc/cc', 0, NULL, '&#xe657;', 1);
INSERT INTO `sys_menu` VALUES (8, 3, '入院登记', '../liao/admin', 0, NULL, '&#xe65b;', 1);
INSERT INTO `sys_menu` VALUES (9, 3, '缴费管理', '../liao/pay', 0, NULL, '&#xe6b2;', 1);
INSERT INTO `sys_menu` VALUES (11, 3, '药品记账', '../liao/drug', 0, NULL, '&#xe705;', 1);
INSERT INTO `sys_menu` VALUES (12, 4, '菜单管理', '../toMenuManager', 0, NULL, '&#xe60f;', 1);
INSERT INTO `sys_menu` VALUES (13, 4, '角色管理', '../toLoadAllRole', 0, '', '&#xe66f;', 1);
INSERT INTO `sys_menu` VALUES (14, 4, '用户管理', '../toLoadAllUser', 0, NULL, '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (15, 4, '图标管理', '../icon', 0, NULL, '&#xe655;', 1);
INSERT INTO `sys_menu` VALUES (17, 4, '数据源监控', '../druid', 0, NULL, '&#xe857;', 1);
INSERT INTO `sys_menu` VALUES (18, 5, '门诊月度统计', '../toReportFinance', 0, NULL, '&#xe63c;', 1);
INSERT INTO `sys_menu` VALUES (19, 5, '住院月度统计', '../toZhuYaunManage', 0, NULL, '&#xe62c;', 1);
INSERT INTO `sys_menu` VALUES (20, 5, '门诊年度统计', '../toBingYear', 0, NULL, '&#xe62d;', 1);
INSERT INTO `sys_menu` VALUES (27, 2, '项目划价', '../caoout/xiang', 0, NULL, '&#xe60a;', 1);
INSERT INTO `sys_menu` VALUES (28, 2, '项目缴费', '../xpay/xiangpay', 0, NULL, '&#xe65e;', 1);
INSERT INTO `sys_menu` VALUES (30, 1, '数据中心', '', 0, NULL, '&#xe60a;', 1);
INSERT INTO `sys_menu` VALUES (31, 30, '科室中心', '../toDepartments', 0, NULL, '&#xe68e;', 1);
INSERT INTO `sys_menu` VALUES (32, 30, '医生列表', '../toDoctor', 0, NULL, '&#xe66f;', 1);
INSERT INTO `sys_menu` VALUES (33, 30, '药品产地', '../toArea', 0, NULL, '&#xe630;', 1);
INSERT INTO `sys_menu` VALUES (36, 30, '项目大类', '../toProjectTypeManage', 0, NULL, '&#xe620;', 1);
INSERT INTO `sys_menu` VALUES (37, 30, '挂号类型', '../toRegisteredType', 0, NULL, '&#xe672;', 1);
INSERT INTO `sys_menu` VALUES (40, 30, '仓库', '../toWarehuose', 0, NULL, '&#xe60a;', 1);
INSERT INTO `sys_menu` VALUES (41, 30, '经办人', '../toSkull', 0, NULL, '&#xe612;', 1);
INSERT INTO `sys_menu` VALUES (42, 30, '计量单位', '../toUnit', 0, NULL, '&#xe62a;', 1);
INSERT INTO `sys_menu` VALUES (43, 30, '供货商', '../toSupply', 0, NULL, '&#xe613;', 1);
INSERT INTO `sys_menu` VALUES (44, 30, '药品分类', '../toType', 0, NULL, '&#xe656;', 1);
INSERT INTO `sys_menu` VALUES (46, 1, '排班管理', '1', 0, NULL, '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (47, 46, '医生排班', '../toPaiban', 0, NULL, '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (48, 30, '药品字典', '../toDrugdictionary', 0, NULL, '&#xe64d;', 1);
INSERT INTO `sys_menu` VALUES (49, 3, '项目记账', '../liao/item', 0, NULL, '&#xe705;', 1);
INSERT INTO `sys_menu` VALUES (52, 5, '住院年度统计', '../toBing2', 0, NULL, '&#xe630;', 1);
INSERT INTO `sys_menu` VALUES (53, 2, '项目检查', '../xpay/seljian', 0, NULL, '&#xe674;', 1);
INSERT INTO `sys_menu` VALUES (54, 1, '仓库管理', '', 0, NULL, '&#xe61c;', 1);
INSERT INTO `sys_menu` VALUES (55, 54, '入库单', '../dsnavigation/beputinstorage', 0, NULL, '&#xe657;', 1);
INSERT INTO `sys_menu` VALUES (56, 5, '医生统计对比', '../toDoctorDuibi', 0, NULL, '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (57, 54, '库存查询', '../dsnavigation/selectdurg', 0, NULL, '&#xe62a;', 1);
INSERT INTO `sys_menu` VALUES (58, 54, '出库单', '../dsnavigation/selectchuku', 0, NULL, '&#xe621;', 1);
INSERT INTO `sys_menu` VALUES (59, 54, '库存不足', '../dsnavigation/selectless', 0, NULL, '&#xe6b2;', 1);
INSERT INTO `sys_menu` VALUES (60, 54, '过期提醒', '../dsnavigation/seldrugDate', 0, NULL, '&#xe702;', 1);
INSERT INTO `sys_menu` VALUES (61, 1, '药房管理', '', 0, NULL, '&#xe705;', 1);
INSERT INTO `sys_menu` VALUES (62, 61, '药房详情', '../dsnavigation/pharymacyhtml', 0, NULL, '&#xe632;', 1);
INSERT INTO `sys_menu` VALUES (64, 2, '药品缴费', '../caoout/out', 0, NULL, '&#xe65e;', 1);
INSERT INTO `sys_menu` VALUES (65, 5, '门诊当天统计', '../toCurrent', 0, NULL, '&#xe60e;', 1);
INSERT INTO `sys_menu` VALUES (69, 2, '门诊患者库', '../caotake/haun', 0, NULL, '&#xe66f;', 1);
INSERT INTO `sys_menu` VALUES (70, 54, '操作记录', '../dsnavigation/record', 0, NULL, '&#xe6b2;', 1);
INSERT INTO `sys_menu` VALUES (71, 54, '药品回收', '../dsnavigation/recycle', 0, NULL, '&#xe669;', 1);
INSERT INTO `sys_menu` VALUES (72, 61, '门诊取药', '../caotake/seltake', 0, NULL, '&#xe857;', 1);
INSERT INTO `sys_menu` VALUES (73, 61, '住院取药', '../liao/pharmacy', 0, NULL, '&#xe63c;', 1);
INSERT INTO `sys_menu` VALUES (86, 3, '出院结算', '../liao/leave', 0, NULL, '&#xe65a;', 1);
INSERT INTO `sys_menu` VALUES (90, 2, 'test', '', 0, NULL, '&#xe678;', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roledesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', '拥有所有菜单权限', 1);
INSERT INTO `sys_role` VALUES (4, '门诊管理', '拥有门诊管理的权限', 1);
INSERT INTO `sys_role` VALUES (5, '最代码管理员', 'zuidaima.com的管理员', 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `rid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`rid`, `mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (1, 27);
INSERT INTO `sys_role_menu` VALUES (1, 28);
INSERT INTO `sys_role_menu` VALUES (1, 30);
INSERT INTO `sys_role_menu` VALUES (1, 31);
INSERT INTO `sys_role_menu` VALUES (1, 32);
INSERT INTO `sys_role_menu` VALUES (1, 33);
INSERT INTO `sys_role_menu` VALUES (1, 36);
INSERT INTO `sys_role_menu` VALUES (1, 37);
INSERT INTO `sys_role_menu` VALUES (1, 40);
INSERT INTO `sys_role_menu` VALUES (1, 41);
INSERT INTO `sys_role_menu` VALUES (1, 42);
INSERT INTO `sys_role_menu` VALUES (1, 43);
INSERT INTO `sys_role_menu` VALUES (1, 44);
INSERT INTO `sys_role_menu` VALUES (1, 46);
INSERT INTO `sys_role_menu` VALUES (1, 47);
INSERT INTO `sys_role_menu` VALUES (1, 48);
INSERT INTO `sys_role_menu` VALUES (1, 49);
INSERT INTO `sys_role_menu` VALUES (1, 52);
INSERT INTO `sys_role_menu` VALUES (1, 53);
INSERT INTO `sys_role_menu` VALUES (1, 54);
INSERT INTO `sys_role_menu` VALUES (1, 55);
INSERT INTO `sys_role_menu` VALUES (1, 56);
INSERT INTO `sys_role_menu` VALUES (1, 57);
INSERT INTO `sys_role_menu` VALUES (1, 58);
INSERT INTO `sys_role_menu` VALUES (1, 59);
INSERT INTO `sys_role_menu` VALUES (1, 60);
INSERT INTO `sys_role_menu` VALUES (1, 61);
INSERT INTO `sys_role_menu` VALUES (1, 62);
INSERT INTO `sys_role_menu` VALUES (1, 64);
INSERT INTO `sys_role_menu` VALUES (1, 65);
INSERT INTO `sys_role_menu` VALUES (1, 69);
INSERT INTO `sys_role_menu` VALUES (1, 70);
INSERT INTO `sys_role_menu` VALUES (1, 71);
INSERT INTO `sys_role_menu` VALUES (1, 72);
INSERT INTO `sys_role_menu` VALUES (1, 73);
INSERT INTO `sys_role_menu` VALUES (1, 86);
INSERT INTO `sys_role_menu` VALUES (1, 88);
INSERT INTO `sys_role_menu` VALUES (4, 1);
INSERT INTO `sys_role_menu` VALUES (4, 2);
INSERT INTO `sys_role_menu` VALUES (4, 6);
INSERT INTO `sys_role_menu` VALUES (4, 7);
INSERT INTO `sys_role_menu` VALUES (4, 27);
INSERT INTO `sys_role_menu` VALUES (4, 28);
INSERT INTO `sys_role_menu` VALUES (4, 53);
INSERT INTO `sys_role_menu` VALUES (4, 64);
INSERT INTO `sys_role_menu` VALUES (4, 69);
INSERT INTO `sys_role_menu` VALUES (4, 90);
INSERT INTO `sys_role_menu` VALUES (5, 1);
INSERT INTO `sys_role_menu` VALUES (5, 2);
INSERT INTO `sys_role_menu` VALUES (5, 3);
INSERT INTO `sys_role_menu` VALUES (5, 4);
INSERT INTO `sys_role_menu` VALUES (5, 5);
INSERT INTO `sys_role_menu` VALUES (5, 6);
INSERT INTO `sys_role_menu` VALUES (5, 7);
INSERT INTO `sys_role_menu` VALUES (5, 8);
INSERT INTO `sys_role_menu` VALUES (5, 9);
INSERT INTO `sys_role_menu` VALUES (5, 11);
INSERT INTO `sys_role_menu` VALUES (5, 12);
INSERT INTO `sys_role_menu` VALUES (5, 13);
INSERT INTO `sys_role_menu` VALUES (5, 14);
INSERT INTO `sys_role_menu` VALUES (5, 15);
INSERT INTO `sys_role_menu` VALUES (5, 17);
INSERT INTO `sys_role_menu` VALUES (5, 18);
INSERT INTO `sys_role_menu` VALUES (5, 19);
INSERT INTO `sys_role_menu` VALUES (5, 20);
INSERT INTO `sys_role_menu` VALUES (5, 27);
INSERT INTO `sys_role_menu` VALUES (5, 28);
INSERT INTO `sys_role_menu` VALUES (5, 30);
INSERT INTO `sys_role_menu` VALUES (5, 31);
INSERT INTO `sys_role_menu` VALUES (5, 32);
INSERT INTO `sys_role_menu` VALUES (5, 33);
INSERT INTO `sys_role_menu` VALUES (5, 36);
INSERT INTO `sys_role_menu` VALUES (5, 37);
INSERT INTO `sys_role_menu` VALUES (5, 40);
INSERT INTO `sys_role_menu` VALUES (5, 41);
INSERT INTO `sys_role_menu` VALUES (5, 42);
INSERT INTO `sys_role_menu` VALUES (5, 43);
INSERT INTO `sys_role_menu` VALUES (5, 44);
INSERT INTO `sys_role_menu` VALUES (5, 46);
INSERT INTO `sys_role_menu` VALUES (5, 47);
INSERT INTO `sys_role_menu` VALUES (5, 48);
INSERT INTO `sys_role_menu` VALUES (5, 49);
INSERT INTO `sys_role_menu` VALUES (5, 52);
INSERT INTO `sys_role_menu` VALUES (5, 53);
INSERT INTO `sys_role_menu` VALUES (5, 54);
INSERT INTO `sys_role_menu` VALUES (5, 55);
INSERT INTO `sys_role_menu` VALUES (5, 56);
INSERT INTO `sys_role_menu` VALUES (5, 57);
INSERT INTO `sys_role_menu` VALUES (5, 58);
INSERT INTO `sys_role_menu` VALUES (5, 59);
INSERT INTO `sys_role_menu` VALUES (5, 60);
INSERT INTO `sys_role_menu` VALUES (5, 61);
INSERT INTO `sys_role_menu` VALUES (5, 62);
INSERT INTO `sys_role_menu` VALUES (5, 64);
INSERT INTO `sys_role_menu` VALUES (5, 65);
INSERT INTO `sys_role_menu` VALUES (5, 69);
INSERT INTO `sys_role_menu` VALUES (5, 70);
INSERT INTO `sys_role_menu` VALUES (5, 71);
INSERT INTO `sys_role_menu` VALUES (5, 72);
INSERT INTO `sys_role_menu` VALUES (5, 73);
INSERT INTO `sys_role_menu` VALUES (5, 86);
INSERT INTO `sys_role_menu` VALUES (5, 90);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`uid`, `rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (1, 1);
INSERT INTO `sys_role_user` VALUES (2, 1);
INSERT INTO `sys_role_user` VALUES (9, 1);
INSERT INTO `sys_role_user` VALUES (10, 1);
INSERT INTO `sys_role_user` VALUES (11, 1);
INSERT INTO `sys_role_user` VALUES (12, 1);
INSERT INTO `sys_role_user` VALUES (13, 1);
INSERT INTO `sys_role_user` VALUES (28, 4);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(255) NULL DEFAULT NULL COMMENT '0女1男',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(255) NULL DEFAULT 2 COMMENT '1，超级管理员,2，系统用户',
  `available` int(255) NULL DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '430223199012143211', '超级管理员', 1, '武汉', '17817189499', '6af4d08340b548cbcce38353d9bcaab4', 'CEO', 1, 1, 'd21fd4');
INSERT INTO `sys_user` VALUES (2, 'ha', '412365199601236545', '华安管理员', 1, '北京', '13381019822', '6af4d08340b548cbcce38353d9bcaab4', '华安码管理员', 1, 1, 'd21fd4');
INSERT INTO `sys_user` VALUES (28, 'mz', '412827199807156565', '门诊', 1, '河南', '13183365365', '6af4d08340b548cbcce38353d9bcaab4', '门诊管理员', 2, 1, 'd21fd4');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`typeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (5, '西药');
INSERT INTO `type` VALUES (6, '中药');

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit`  (
  `unitId` int(11) NOT NULL AUTO_INCREMENT,
  `unitName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`unitId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES (7, '盒');
INSERT INTO `unit` VALUES (8, '次');
INSERT INTO `unit` VALUES (9, '袋');

-- ----------------------------
-- Table structure for upplier
-- ----------------------------
DROP TABLE IF EXISTS `upplier`;
CREATE TABLE `upplier`  (
  `supplierId` int(11) NOT NULL AUTO_INCREMENT,
  `supplierName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplierPhone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplierAddress` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`supplierId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of upplier
-- ----------------------------
INSERT INTO `upplier` VALUES (5, '春天大药房 ', NULL, NULL, 0);

-- ----------------------------
-- Table structure for warehuose
-- ----------------------------
DROP TABLE IF EXISTS `warehuose`;
CREATE TABLE `warehuose`  (
  `warehouseId` int(11) NOT NULL AUTO_INCREMENT,
  `supplierName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`warehouseId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of warehuose
-- ----------------------------
INSERT INTO `warehuose` VALUES (2, '仓库');

SET FOREIGN_KEY_CHECKS = 1;

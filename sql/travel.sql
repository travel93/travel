/*
 Navicat Premium Data Transfer

 Source Server         : LL
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : travel

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 16/06/2021 21:45:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int(11) NULL DEFAULT NULL,
  `cname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `cid`(`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '国内游');
INSERT INTO `category` VALUES (2, '境外游');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `itemid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `rid` int(11) NULL DEFAULT NULL,
  `oid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  INDEX `fk_0001`(`rid`) USING BTREE,
  INDEX `fk_0002`(`oid`) USING BTREE,
  CONSTRAINT `fk_0001` FOREIGN KEY (`rid`) REFERENCES `product` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_0002` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('27241799797964800', 0, 1791, 3, 'e6bf70b21ca2469f871152582a6f05c0');
INSERT INTO `orderitem` VALUES ('27241799797964801', 0, 809.1, 2, 'f75e60abae3e484697856fb296c54cac');
INSERT INTO `orderitem` VALUES ('27241799797964802', 0, 809.1, 2, '9132c319517748ff82c777c594999a61');
INSERT INTO `orderitem` VALUES ('27241799797964803', 0, 719.1, 4, 'a7a13a73f4bd4633bfcb2f937cbe399e');
INSERT INTO `orderitem` VALUES ('27241799797964804', 0, 809.1, 2, 'db30ae9fccfd40588ca6bdabef2f0622');
INSERT INTO `orderitem` VALUES ('27241799797964805', 0, 31500, 10, 'bdad3b22b9bb4a53ad261fbb107c4e5a');
INSERT INTO `orderitem` VALUES ('27241799797964806', 0, 719.1, 4, 'a17ab4ed828a45248c9bdbb14f06963d');
INSERT INTO `orderitem` VALUES ('27241799797964807', 0, 1170, 1, '1f46a66d14d645688599be335b911f0e');
INSERT INTO `orderitem` VALUES ('27241799797964808', 0, 1791, 3, 'e995e48073bf47bf9e9bd736388f467d');
INSERT INTO `orderitem` VALUES ('27241799797964809', 0, 1791, 3, '5d97b6ac3c0f4735a0614459a265bb1b');
INSERT INTO `orderitem` VALUES ('27241799797964810', 0, 1791, 3, '295ea831b2264df8acef6872fd4c1e09');
INSERT INTO `orderitem` VALUES ('27241799797964811', 0, 1791, 3, '3eb974d166eb497ea38e5efcb8123056');
INSERT INTO `orderitem` VALUES ('27241799797964812', 0, 809.1, 2, '53e424a5dd614613aefcbb7cfce468df');
INSERT INTO `orderitem` VALUES ('27241799797964813', 0, 809.1, 2, '414c6560175249088c9a19140794413d');
INSERT INTO `orderitem` VALUES ('27241799797964814', 0, 1170, 1, '91e50bd5c97e41909c09ff6f75c6d191');
INSERT INTO `orderitem` VALUES ('27241799797964815', 0, 1170, 1, '77d8858379c943efae574ec01632f288');
INSERT INTO `orderitem` VALUES ('27241799797964816', 0, 1170, 1, '6c7ce2ce12c74843bf04b5009138cc59');
INSERT INTO `orderitem` VALUES ('27241799797964817', 0, 1170, 1, 'dd0ac67028544e8c918ebf9e24d87c08');
INSERT INTO `orderitem` VALUES ('27241799797964818', 0, 1170, 1, '34f34f35b43e4a2b93de38138db8f446');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ordertime` datetime(0) NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `fk_001`(`uid`) USING BTREE,
  CONSTRAINT `fk_001` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1f46a66d14d645688599be335b911f0e', '2021-06-15 23:12:16', 1170, 0, NULL, NULL, 2);
INSERT INTO `orders` VALUES ('295ea831b2264df8acef6872fd4c1e09', '2021-06-15 23:26:15', 1791, 0, '李思思', '123123', 2);
INSERT INTO `orders` VALUES ('34f34f35b43e4a2b93de38138db8f446', '2021-06-16 00:09:17', 1170, 0, '李四sna', '123123', 2);
INSERT INTO `orders` VALUES ('3eb974d166eb497ea38e5efcb8123056', '2021-06-15 23:32:02', 1791, 0, '李猛', '123456', 2);
INSERT INTO `orders` VALUES ('414c6560175249088c9a19140794413d', '2021-06-15 23:38:29', 809.1, 0, '李航', '123213', 2);
INSERT INTO `orders` VALUES ('53e424a5dd614613aefcbb7cfce468df', '2021-06-15 23:35:24', 809.1, 0, '李韩', '123123', 2);
INSERT INTO `orders` VALUES ('5d97b6ac3c0f4735a0614459a265bb1b', '2021-06-15 23:23:19', 1791, 0, NULL, NULL, 2);
INSERT INTO `orders` VALUES ('6c7ce2ce12c74843bf04b5009138cc59', '2021-06-15 23:50:44', 1170, 1, '李韩', '123123', 2);
INSERT INTO `orders` VALUES ('77d8858379c943efae574ec01632f288', '2021-06-15 23:47:11', 1170, 1, '李杭晗', '123123', 2);
INSERT INTO `orders` VALUES ('9132c319517748ff82c777c594999a61', '2021-06-15 21:27:58', 809.1, 0, NULL, NULL, 2);
INSERT INTO `orders` VALUES ('91e50bd5c97e41909c09ff6f75c6d191', '2021-06-15 23:42:28', 1170, 0, '李悠悠', '123123', 2);
INSERT INTO `orders` VALUES ('9c8abd095b634470971aa5f8bccbe37a', '2021-06-15 21:23:56', 809.1, 0, NULL, NULL, 2);
INSERT INTO `orders` VALUES ('a17ab4ed828a45248c9bdbb14f06963d', '2021-06-15 22:18:28', 719.1, 0, NULL, NULL, 2);
INSERT INTO `orders` VALUES ('a7a13a73f4bd4633bfcb2f937cbe399e', '2021-06-15 21:28:45', 719.1, 0, NULL, NULL, 2);
INSERT INTO `orders` VALUES ('bdad3b22b9bb4a53ad261fbb107c4e5a', '2021-06-15 22:01:47', 31500, 0, NULL, NULL, 9);
INSERT INTO `orders` VALUES ('db30ae9fccfd40588ca6bdabef2f0622', '2021-06-15 21:30:07', 809.1, 0, NULL, NULL, 2);
INSERT INTO `orders` VALUES ('dd0ac67028544e8c918ebf9e24d87c08', '2021-06-15 23:55:19', 1170, 0, '李四san', '123123', 2);
INSERT INTO `orders` VALUES ('e6bf70b21ca2469f871152582a6f05c0', '2021-06-15 21:15:43', 1791, 0, NULL, NULL, 2);
INSERT INTO `orders` VALUES ('e995e48073bf47bf9e9bd736388f467d', '2021-06-15 23:18:16', 1791, 0, NULL, NULL, 2);
INSERT INTO `orders` VALUES ('f75e60abae3e484697856fb296c54cac', '2021-06-15 21:27:02', 809.1, 0, NULL, NULL, 2);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `rid` int(11) NOT NULL,
  `rname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `introduce` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_hot` int(11) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `rimage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`rid`) USING BTREE,
  INDEX `product`(`cid`) USING BTREE,
  CONSTRAINT `product` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '上海', 1300, '直飞上海5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-06-01', 50, 'resources/images/data2-8.jpg', 1);
INSERT INTO `product` VALUES (2, '江苏', 899, '直飞江苏5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-05-11', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (3, '杭州', 1990, '直飞杭州5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-05-17', 50, 'resources/images/sea.jpg', 1);
INSERT INTO `product` VALUES (4, '苏州', 799, '直飞苏州5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-03-08', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (5, '美国', 10000, '直飞美国5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2014-06-04', 50, 'resources/images/sea2.jpg', 2);
INSERT INTO `product` VALUES (6, '俄罗斯', 10000, '直飞俄罗斯5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2003-02-05', 50, 'resources/images/data3-3.jpg', 2);
INSERT INTO `product` VALUES (7, '重庆', 3000, '直飞重庆5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2018-05-07', 50, 'resources/images/data5.jpg', 2);
INSERT INTO `product` VALUES (8, '成都', 2000, '直飞俄罗斯5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-09-07', 50, 'resources/images/bg.jpg', 2);
INSERT INTO `product` VALUES (9, '山西', 35000, '直飞山西5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-03-05', 50, 'resources/images/data2-7.jpg', 1);
INSERT INTO `product` VALUES (10, '阿尔代父', 35000, '直飞阿尔代父5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/data9.jpg', 1);
INSERT INTO `product` VALUES (11, '印度尼西亚', 35000, '直飞印度尼西亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/sea.jpg', 2);
INSERT INTO `product` VALUES (12, '青岛', 35000, '直飞青岛5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/data3-7.jpg', 1);
INSERT INTO `product` VALUES (13, '法国', 35000, '直飞法国5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (14, '四川', 35000, '直飞四川5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (15, '西藏', 35000, '直飞西藏5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/sea2.jpg', 2);
INSERT INTO `product` VALUES (16, '杭州', 35000, '直飞杭州5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (17, '天目湖', 5000, '直飞天目湖5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (18, '九寨沟', 8000, '直飞九寨沟5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/sea2.jpg', 1);
INSERT INTO `product` VALUES (19, '丽江', 4000, '直飞丽江5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/data9.jpg', 2);
INSERT INTO `product` VALUES (20, '乌镇', 6800, '直飞乌镇5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/data3-4.jpg', 1);
INSERT INTO `product` VALUES (21, '周庄', 7000, '直飞周庄5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/sea2.jpg', 2);
INSERT INTO `product` VALUES (22, '兴化', 3500, '直飞兴化5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (23, '夫子庙', 3500, '直飞夫子庙5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/sea2.jpg', 1);
INSERT INTO `product` VALUES (24, '玄武湖', 5000, '直飞玄武湖5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/bg.jpg', 2);
INSERT INTO `product` VALUES (25, '中山陵', 8000, '直飞中山陵5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/sea.jpg', 1);
INSERT INTO `product` VALUES (26, '苏州园林', 4000, '直飞苏州园林5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/bg.jpg', 2);
INSERT INTO `product` VALUES (27, '常州嬉戏谷', 6800, '直飞常州嬉戏谷5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/sea.jpg', 1);
INSERT INTO `product` VALUES (28, '恐龙园', 7000, '直飞恐龙园5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-03', 50, 'resources/images/bg.jpg', 2);
INSERT INTO `product` VALUES (29, '春秋淹城', 3500, '直飞春秋淹城5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (30, '灵山大佛', 5000, '直飞灵山大佛5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/sea.jpg', 2);
INSERT INTO `product` VALUES (31, '融创乐园', 8000, '直飞融创乐园5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (32, '大理', 4000, '直飞大理5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/sea.jpg', 2);
INSERT INTO `product` VALUES (33, '布达拉宫', 6800, '直飞布达拉宫5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (34, '昆明', 7000, '直飞昆明5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/sea2.jpg', 2);
INSERT INTO `product` VALUES (35, '荡口古镇', 3500, '直飞荡口古镇5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (36, '东方明珠', 5000, '直飞东方明珠5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (37, '宜兴竹海', 8000, '直飞宜兴竹海5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (38, '花果山', 4000, '直飞花果山5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (39, '善卷洞', 6800, '直飞善卷洞5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (40, '墨西哥', 27000, '直飞墨西哥5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (41, '东京', 13500, '直飞东京5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (42, '巴黎', 35000, '直飞巴黎5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (43, '巴西', 8000, '直飞巴西5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (44, '苏州水上乐园', 14000, '直飞苏州水上乐园5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (45, '方特水世界', 6800, '直飞方特水世界5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (46, '张家界', 27000, '直飞张家界5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/sea2.jpg', 2);
INSERT INTO `product` VALUES (47, '大沙漠', 8000, '直飞大沙漠5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (48, '洱海', 4000, '直飞洱海5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (49, '玉龙雪山', 16800, '直飞玉龙雪山5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (50, '梵净山', 7000, '直飞梵净山5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-06-05', 50, 'resources/images/sea2.jpg', 2);
INSERT INTO `product` VALUES (51, '上海', 1299, '直飞上海5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-06-01', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (52, '江苏', 899, '直飞江苏5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-05-11', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (53, '杭州', 1990, '直飞杭州5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-05-17', 50, 'resources/images/sea.jpg', 1);
INSERT INTO `product` VALUES (54, '苏州', 799, '直飞苏州5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-03-08', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (59, '山西', 35000, '直飞山西5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-03-05', 50, 'resources/images/sea2.jpg', 1);
INSERT INTO `product` VALUES (60, '阿尔代父', 35000, '直飞阿尔代父5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/freat.jpg', 1);
INSERT INTO `product` VALUES (61, '上海', 1299, '直飞上海5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-06-01', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (63, '杭州', 1990, '直飞杭州5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-05-17', 50, 'resources/images/sea.jpg', 1);
INSERT INTO `product` VALUES (64, '苏州', 799, '直飞苏州5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-03-08', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (65, '美国', 10000, '直飞美国5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2014-06-04', 50, 'resources/images/sea2.jpg', 2);
INSERT INTO `product` VALUES (66, '俄罗斯', 10000, '直飞俄罗斯5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2003-02-05', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (67, '重庆', 3000, '直飞重庆5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2018-05-07', 50, 'resources/images/sea2.jpg', 2);
INSERT INTO `product` VALUES (68, '成都', 2000, '直飞俄罗斯5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-09-07', 50, 'resources/images/bg.jpg', 2);
INSERT INTO `product` VALUES (69, '山西', 35000, '直飞山西5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-03-05', 50, 'resources/images/sea2.jpg', 1);
INSERT INTO `product` VALUES (70, '阿尔代父', 35000, '直飞阿尔代父5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/freat.jpg', 1);
INSERT INTO `product` VALUES (71, '上海', 1299, '直飞上海5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-06-01', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (72, '江苏', 899, '直飞江苏5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-05-11', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (73, '杭州', 1990, '直飞杭州5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-05-17', 50, 'resources/images/sea.jpg', 1);
INSERT INTO `product` VALUES (74, '苏州', 799, '直飞苏州5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-03-08', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (75, '美国', 10000, '直飞美国5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2014-06-04', 50, 'resources/images/sea2.jpg', 2);
INSERT INTO `product` VALUES (76, '俄罗斯', 10000, '直飞俄罗斯5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2003-02-05', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (77, '重庆', 3000, '直飞重庆5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2018-05-07', 50, 'resources/images/sea2.jpg', 2);
INSERT INTO `product` VALUES (78, '成都', 2000, '直飞俄罗斯5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-09-07', 50, 'resources/images/bg.jpg', 2);
INSERT INTO `product` VALUES (79, '山西', 35000, '直飞山西5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-03-05', 50, 'resources/images/sea2.jpg', 1);
INSERT INTO `product` VALUES (80, '阿尔代父', 35000, '直飞阿尔代父5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/freat.jpg', 1);
INSERT INTO `product` VALUES (81, '上海', 1299, '直飞上海5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-06-01', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (82, '江苏', 899, '直飞江苏5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-05-11', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (83, '杭州', 1990, '直飞杭州5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-05-17', 50, 'resources/images/sea.jpg', 1);
INSERT INTO `product` VALUES (84, '苏州', 799, '直飞苏州5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-03-08', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (85, '美国', 10000, '直飞美国5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2014-06-04', 50, 'resources/images/sea2.jpg', 2);
INSERT INTO `product` VALUES (86, '俄罗斯', 10000, '直飞俄罗斯5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2003-02-05', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (87, '重庆', 3000, '直飞重庆5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2018-05-07', 50, 'resources/images/sea2.jpg', 2);
INSERT INTO `product` VALUES (88, '成都', 2000, '直飞俄罗斯5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-09-07', 50, 'resources/images/bg.jpg', 2);
INSERT INTO `product` VALUES (89, '山西', 35000, '直飞山西5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-03-05', 50, 'resources/images/sea2.jpg', 1);
INSERT INTO `product` VALUES (90, '阿尔代父', 35000, '直飞阿尔代父5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/freat.jpg', 1);
INSERT INTO `product` VALUES (91, '上海', 1299, '直飞上海5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-06-01', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (92, '江苏', 899, '直飞江苏5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-05-11', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (93, '杭州', 1990, '直飞杭州5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-05-17', 50, 'resources/images/sea.jpg', 1);
INSERT INTO `product` VALUES (94, '苏州', 799, '直飞苏州5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2021-03-08', 50, 'resources/images/bg.jpg', 1);
INSERT INTO `product` VALUES (95, '美国', 10000, '直飞美国5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2014-06-04', 50, 'resources/images/sea2.jpg', 2);
INSERT INTO `product` VALUES (96, '俄罗斯', 10000, '直飞俄罗斯5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2003-02-05', 50, 'resources/images/freat.jpg', 2);
INSERT INTO `product` VALUES (97, '重庆', 3000, '直飞重庆5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2018-05-07', 50, 'resources/images/sea2.jpg', 2);
INSERT INTO `product` VALUES (98, '成都', 2000, '直飞俄罗斯5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-09-07', 50, 'resources/images/bg.jpg', 2);
INSERT INTO `product` VALUES (99, '山西', 35000, '直飞山西5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 1, '2020-03-05', 50, 'resources/images/sea2.jpg', 1);
INSERT INTO `product` VALUES (100, '阿尔代父', 35000, '直飞阿尔代父5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)', 2, '2020-06-05', 50, 'resources/images/freat.jpg', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `state` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `uname`(`uname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zhang', '123456', '张三', '2021-05-05 18:48:22', '男', '12345678911', '123456@qq.com', '0', '1');
INSERT INTO `user` VALUES (2, 'lisi', '123456', '李四', '1998-12-10 00:00:00', '男', '12345678912', '123457@qq.com', '1', '2');
INSERT INTO `user` VALUES (3, 'wang', '123456', '王五', '2021-05-10 00:00:00', '男', '1234567891', '928287517@qq.com', '1', '0');
INSERT INTO `user` VALUES (9, 'liu', '123456', '刘', '2021-05-06 00:00:00', '男', '123456', '123456@qq.com', '0', '0');
INSERT INTO `user` VALUES (11, 'luo', '123', '李四', '2021-06-01 00:00:00', '男', '156899', '2606511650@qq.com', '0', '0');

SET FOREIGN_KEY_CHECKS = 1;

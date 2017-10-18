/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : shzjtx

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2017-10-18 22:53:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(200) DEFAULT NULL COMMENT '客户名称',
  `cust_code` varchar(50) DEFAULT NULL COMMENT '客户CODE',
  `cust_scale` int(11) DEFAULT NULL COMMENT '客户规模 1：大 2：中 3：小 4：未知 5：不使用',
  `national_standard_id` int(11) DEFAULT NULL COMMENT '国标行业ID',
  `industry_sasac_id` int(11) DEFAULT NULL COMMENT '国资委行业ID',
  `enterprise attribute` int(11) DEFAULT NULL COMMENT '企业属性  1：国有企业 2：上市企业 3：民营大企业 4：民营中小企业',
  `active` int(2) DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_user_id` int(11) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for industry_sasac
-- ----------------------------
DROP TABLE IF EXISTS `industry_sasac`;
CREATE TABLE `industry_sasac` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `industry_name` varchar(126) DEFAULT NULL COMMENT '行业名称',
  `industry_code` varchar(45) DEFAULT NULL COMMENT '行业代码',
  `parent_id` int(11) DEFAULT '0' COMMENT '父类ID',
  `computing_coefficient` decimal(15,5) DEFAULT NULL COMMENT '计算系数',
  `order_no` int(11) DEFAULT NULL COMMENT '排列序号',
  `active` int(11) DEFAULT NULL COMMENT '状态（0：失效；1：有效）',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of industry_sasac
-- ----------------------------
INSERT INTO `industry_sasac` VALUES ('2', '采矿业', 'caikuang', '0', '1.00000', '2', '1', '2017-09-28 17:47:51', '2017-09-28 17:47:51');
INSERT INTO `industry_sasac` VALUES ('3', '金矿', '1', '2', '1.00000', '1', '1', '2017-10-18 19:51:04', null);

-- ----------------------------
-- Table structure for national_standard
-- ----------------------------
DROP TABLE IF EXISTS `national_standard`;
CREATE TABLE `national_standard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `industry_name` varchar(126) DEFAULT NULL,
  `industry_code` varchar(45) DEFAULT NULL COMMENT '行业代码',
  `parent_id` int(11) DEFAULT '0' COMMENT '父类ID',
  `computing_coefficient` decimal(15,5) DEFAULT NULL COMMENT '计算系数',
  `order_no` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of national_standard
-- ----------------------------
INSERT INTO `national_standard` VALUES ('1', '事业单位', '1', '0', '1.00000', '1', '1', '2017-10-18 19:51:18', null);
INSERT INTO `national_standard` VALUES ('2', '事业单位1', '2', '1', '2.00000', '1', '1', '2017-10-18 19:51:27', null);

-- ----------------------------
-- Table structure for t_b_login_user
-- ----------------------------
DROP TABLE IF EXISTS `t_b_login_user`;
CREATE TABLE `t_b_login_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) DEFAULT NULL COMMENT '用户姓名',
  `login_name` varchar(64) DEFAULT NULL COMMENT '登录名',
  `login_pwd` varchar(128) DEFAULT NULL,
  `user_status` int(11) DEFAULT NULL COMMENT '用户状态(0:初始化，1：正常，2：冻结，3：过期 4:删除)',
  `login_invalid` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最近登录时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `last_login_ip` varchar(45) DEFAULT NULL COMMENT '最后一次登录的IP',
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_b_login_user
-- ----------------------------
INSERT INTO `t_b_login_user` VALUES ('1', 'myron', 'myron', '0ffb3fbc9dfb49dc93e84845b238616298dc42adc72d417e8174af6765fd76f1', '1', null, null, '2017-09-29 19:10:37', null, null, '2017-09-29 19:10:37');
INSERT INTO `t_b_login_user` VALUES ('2', 'admin', 'admin', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '1', null, null, '2017-10-18 21:49:37', null, null, '2017-10-18 21:49:37');
INSERT INTO `t_b_login_user` VALUES ('11', '王五', '王五', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1', null, '2', null, '2017-10-14 17:32:18', null, '2017-10-14 17:53:58');
INSERT INTO `t_b_login_user` VALUES ('12', '李四', '李四', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1', null, '2', null, '2017-10-14 17:32:21', null, '2017-10-14 17:53:50');
INSERT INTO `t_b_login_user` VALUES ('13', '张三', '张三', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1', null, '2', null, '2017-10-14 17:32:24', null, '2017-10-14 17:53:41');
INSERT INTO `t_b_login_user` VALUES ('14', '李吉弘', 'Lee', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1', null, '2', null, '2017-10-14 17:32:29', null, '2017-10-14 17:53:27');
INSERT INTO `t_b_login_user` VALUES ('15', '陈彪', 'bill', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1', null, '2', null, '2017-10-14 17:32:33', null, '2017-10-14 17:53:10');
INSERT INTO `t_b_login_user` VALUES ('17', '毛', 'myron1', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1', null, '2', '2017-10-18 21:48:59', '2017-10-14 17:32:38', null, '2017-10-18 21:48:59');
INSERT INTO `t_b_login_user` VALUES ('24', '小毛', 'xiaomao', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1', '2017-10-28 23:59:59', '17', '2017-10-18 21:48:32', '2017-10-18 21:47:45', null, '2017-10-18 21:48:32');
INSERT INTO `t_b_login_user` VALUES ('25', '小小毛', 'xiaoxiaomao', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1', '2017-11-04 23:59:59', '24', null, '2017-10-18 21:48:46', null, null);

-- ----------------------------
-- Table structure for t_b_resources
-- ----------------------------
DROP TABLE IF EXISTS `t_b_resources`;
CREATE TABLE `t_b_resources` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(64) DEFAULT NULL COMMENT '资源名称',
  `resource_code` varchar(64) DEFAULT NULL COMMENT '资源代码',
  `resource_url` varchar(256) DEFAULT NULL COMMENT '资源链接',
  `resource_desc` varchar(512) DEFAULT NULL,
  `css_cls` varchar(45) DEFAULT NULL COMMENT '资源样式',
  `order_no` int(11) DEFAULT NULL COMMENT '排序号',
  `parent_id` int(11) DEFAULT NULL COMMENT '父资源ID',
  `resource_type` int(11) DEFAULT '0' COMMENT '资源类型：0：菜单；1：按钮',
  `active` int(11) DEFAULT '1' COMMENT '可用状态(0:不可用，1：可用)',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_b_resources
-- ----------------------------
INSERT INTO `t_b_resources` VALUES ('2', '系统管理', 'menu_sys', '', '系统管理', 'menu-icon fa fa-desktop', '5', '0', '0', '1', null, null);
INSERT INTO `t_b_resources` VALUES ('3', '资源配置', 'menu_sys_resource', '/system/resource/list.html', null, null, '2', '2', '0', '1', null, null);
INSERT INTO `t_b_resources` VALUES ('4', '客户管理', 'menu_customer_list', '/customer/list.html', '546586', 'menu-icon fa fa-tachometer', '3', '0', '0', '1', null, '2017-10-17 23:57:41');
INSERT INTO `t_b_resources` VALUES ('5', '国资委行业', 'menu_sasac_industry_list', '/system/sasacIndustry/list.html', '', '', '4', '2', '0', '1', null, '2017-10-17 23:57:05');
INSERT INTO `t_b_resources` VALUES ('6', '用户管理', 'user_manage', '/system/user/list.html', '456', '123', '3', '2', '0', '1', '2017-10-11 21:07:04', '2017-10-13 01:42:36');
INSERT INTO `t_b_resources` VALUES ('7', '风险分析', '12121', '/export/riskAnalysis/page.html', '', 'menu-icon fa fa-signal', '2', '0', '0', '1', '2017-10-15 15:32:25', '2017-10-17 23:03:54');
INSERT INTO `t_b_resources` VALUES ('8', '国标行业', '', '/system/nationalStandard/list.html', '', '', '6', '2', '0', '1', '2017-10-17 23:57:24', null);

-- ----------------------------
-- Table structure for t_b_user_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_b_user_resource`;
CREATE TABLE `t_b_user_resource` (
  `user_resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT '1' COMMENT '可用状态(0:不要用，1：可用)',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_resource_id`),
  KEY `idx_user_resource_1` (`user_id`,`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_b_user_resource
-- ----------------------------
INSERT INTO `t_b_user_resource` VALUES ('1', '1', '1', '1', null, null);
INSERT INTO `t_b_user_resource` VALUES ('2', '1', '2', '1', null, null);
INSERT INTO `t_b_user_resource` VALUES ('3', '1', '3', '1', null, null);
INSERT INTO `t_b_user_resource` VALUES ('4', '1', '4', '1', null, null);
INSERT INTO `t_b_user_resource` VALUES ('5', '1', '5', '1', null, null);
INSERT INTO `t_b_user_resource` VALUES ('6', '2', '1', '1', null, null);
INSERT INTO `t_b_user_resource` VALUES ('7', '2', '2', '1', null, null);
INSERT INTO `t_b_user_resource` VALUES ('8', '2', '3', '1', null, null);
INSERT INTO `t_b_user_resource` VALUES ('9', '2', '4', '1', null, null);
INSERT INTO `t_b_user_resource` VALUES ('10', '2', '5', '1', null, null);
INSERT INTO `t_b_user_resource` VALUES ('11', '2', '6', '1', '2017-10-11 21:07:40', '2017-10-11 21:07:43');
INSERT INTO `t_b_user_resource` VALUES ('12', '6', '4', '0', '2017-10-14 16:39:58', null);
INSERT INTO `t_b_user_resource` VALUES ('13', '6', '2', '0', '2017-10-14 16:57:08', null);
INSERT INTO `t_b_user_resource` VALUES ('14', '6', '6', '0', '2017-10-14 16:57:08', null);
INSERT INTO `t_b_user_resource` VALUES ('15', '6', '4', '0', '2017-10-14 16:57:08', null);
INSERT INTO `t_b_user_resource` VALUES ('16', '6', '2', '0', '2017-10-14 16:58:07', null);
INSERT INTO `t_b_user_resource` VALUES ('17', '6', '3', '0', '2017-10-14 16:58:07', null);
INSERT INTO `t_b_user_resource` VALUES ('18', '6', '6', '0', '2017-10-14 16:58:07', null);
INSERT INTO `t_b_user_resource` VALUES ('19', '6', '4', '0', '2017-10-14 16:58:07', null);
INSERT INTO `t_b_user_resource` VALUES ('20', '6', '2', '0', '2017-10-14 16:58:15', null);
INSERT INTO `t_b_user_resource` VALUES ('21', '6', '3', '0', '2017-10-14 16:58:15', null);
INSERT INTO `t_b_user_resource` VALUES ('22', '6', '5', '0', '2017-10-14 16:58:15', null);
INSERT INTO `t_b_user_resource` VALUES ('23', '6', '6', '0', '2017-10-14 16:58:15', null);
INSERT INTO `t_b_user_resource` VALUES ('24', '6', '4', '0', '2017-10-14 16:58:15', null);
INSERT INTO `t_b_user_resource` VALUES ('25', '6', '2', '1', '2017-10-14 16:58:21', null);
INSERT INTO `t_b_user_resource` VALUES ('26', '6', '3', '1', '2017-10-14 16:58:21', null);
INSERT INTO `t_b_user_resource` VALUES ('27', '6', '5', '1', '2017-10-14 16:58:21', null);
INSERT INTO `t_b_user_resource` VALUES ('28', '6', '6', '1', '2017-10-14 16:58:21', null);
INSERT INTO `t_b_user_resource` VALUES ('29', '7', '2', '0', '2017-10-14 16:59:41', null);
INSERT INTO `t_b_user_resource` VALUES ('30', '7', '3', '0', '2017-10-14 16:59:41', null);
INSERT INTO `t_b_user_resource` VALUES ('31', '7', '5', '0', '2017-10-14 16:59:41', null);
INSERT INTO `t_b_user_resource` VALUES ('32', '7', '6', '0', '2017-10-14 16:59:41', null);
INSERT INTO `t_b_user_resource` VALUES ('33', '7', '2', '1', '2017-10-14 16:59:49', null);
INSERT INTO `t_b_user_resource` VALUES ('34', '7', '6', '1', '2017-10-14 16:59:49', null);
INSERT INTO `t_b_user_resource` VALUES ('35', '17', '2', '0', '2017-10-14 17:35:26', null);
INSERT INTO `t_b_user_resource` VALUES ('36', '17', '5', '0', '2017-10-14 17:35:26', null);
INSERT INTO `t_b_user_resource` VALUES ('37', '17', '2', '1', '2017-10-18 21:47:15', null);
INSERT INTO `t_b_user_resource` VALUES ('38', '17', '6', '1', '2017-10-18 21:47:15', null);
INSERT INTO `t_b_user_resource` VALUES ('39', '17', '5', '1', '2017-10-18 21:47:15', null);
INSERT INTO `t_b_user_resource` VALUES ('40', '24', '2', '1', '2017-10-18 21:48:26', null);
INSERT INTO `t_b_user_resource` VALUES ('41', '24', '6', '1', '2017-10-18 21:48:26', null);

-- ----------------------------
-- Function structure for getChildList
-- ----------------------------
DROP FUNCTION IF EXISTS `getChildList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getChildList`(rootId int) RETURNS varchar(2000) CHARSET utf8
BEGIN   
DECLARE str varchar(2000);  
DECLARE cid varchar(100);   
SET str = '';   
SET cid = rootId;   
WHILE cid is not null DO   
    SET str = concat(str, ',', cid);   
    SELECT group_concat(user_id) INTO cid FROM t_b_login_user where FIND_IN_SET(parent_id, cid) > 0;   
END WHILE;   
RETURN substring(str,4); 
END
;;
DELIMITER ;

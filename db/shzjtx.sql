/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : shzjtx

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2017-10-22 23:16:27
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
  `enterprise_attribute` int(11) DEFAULT NULL COMMENT '企业属性  1：国有企业 2：上市企业 3：民营大企业 4：民营中小企业',
  `active` int(2) DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_user_id` int(11) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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

/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50628
Source Host           : localhost:3306
Source Database       : pmgo

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2017-06-01 17:09:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', 'JFinal Demo Title here', 'JFinal Demo Content here');
INSERT INTO `blog` VALUES ('2', 'test 1', 'test 1');
INSERT INTO `blog` VALUES ('3', 'test 2', 'test 2');
INSERT INTO `blog` VALUES ('6', '洞房洞房环佩冷', '打发第三方第三方是的');

-- ----------------------------
-- Table structure for t_pm_project
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_project`;
CREATE TABLE `t_pm_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) DEFAULT NULL COMMENT '项目名称',
  `begin` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `eng` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pm_project
-- ----------------------------

-- ----------------------------
-- Table structure for t_pm_requirement
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_requirement`;
CREATE TABLE `t_pm_requirement` (
  `id` int(11) NOT NULL COMMENT '主键',
  `code` varchar(30) NOT NULL COMMENT '需求编号',
  `module` varchar(30) DEFAULT NULL COMMENT '模块',
  `child_module` varchar(30) DEFAULT NULL COMMENT '子模块',
  `function` varchar(100) DEFAULT NULL COMMENT '功能',
  `desc_assignment` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `desc_value` varchar(255) DEFAULT NULL COMMENT '价值描述',
  `requirement_level` varchar(10) DEFAULT NULL COMMENT '需求层次',
  `requirement_class` varchar(10) DEFAULT NULL COMMENT '需求分类',
  `priority` varchar(10) DEFAULT NULL COMMENT '优先级',
  `time_commit` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '提交时间',
  `time_input` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '录入时间',
  `time_publish` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `person_commit` char(5) DEFAULT NULL COMMENT '提交人',
  `person_director` char(5) DEFAULT NULL COMMENT '需求负责人',
  `person_tester` char(5) DEFAULT NULL COMMENT '测试负责人',
  `person_operate` char(5) DEFAULT NULL COMMENT '运营负责人',
  `count_develop` char(5) DEFAULT NULL COMMENT '开发量',
  `cost_performance` char(5) DEFAULT NULL COMMENT '性价比',
  `state` char(2) DEFAULT NULL COMMENT '状态',
  `mem` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pm_requirement
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_logs
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_logs`;
CREATE TABLE `t_sys_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_logs
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_system
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_system`;
CREATE TABLE `t_sys_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_system
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `age` int(3) DEFAULT NULL COMMENT '年龄',
  `phone` varchar(15) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` char(2) DEFAULT '' COMMENT '性别',
  `qq` varchar(20) DEFAULT NULL COMMENT 'qq号码',
  `wechat` varchar(50) DEFAULT '' COMMENT '微信号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------

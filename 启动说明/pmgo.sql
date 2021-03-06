/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50628
Source Host           : localhost:3306
Source Database       : pmgo

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2017-06-12 13:10:43
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', 'JFinal Demo Title here', 'JFinal Demo Content here');
INSERT INTO `blog` VALUES ('2', 'test 1', 'test 1');
INSERT INTO `blog` VALUES ('3', 'test 2', 'test 2');

-- ----------------------------
-- Table structure for t_pm_project
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_project`;
CREATE TABLE `t_pm_project` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(30) NOT NULL COMMENT '项目名称',
  `no` varchar(30) DEFAULT NULL COMMENT '项目编号',
  `time_create` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '项目创建时间',
  `time_plan_begin` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '计划开始时间',
  `time_plan_end` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '计划结束时间',
  `time_end` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '实际结束时间',
  `team_id` varchar(32) DEFAULT NULL COMMENT '团队表主键ID',
  `team_size` int(5) DEFAULT NULL COMMENT '项目人数',
  `person_lead` char(5) DEFAULT NULL COMMENT '项目领导人',
  `person_create` varchar(32) DEFAULT NULL COMMENT '项目创建者ID',
  `budget` decimal(16,4) DEFAULT NULL COMMENT '预算',
  `intro` varchar(300) DEFAULT NULL COMMENT '项目简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pm_project
-- ----------------------------
INSERT INTO `t_pm_project` VALUES ('059af6f0b35243c9b4796b538e781421', '测试赛hjkhkj', '45645646-456465', '2017-06-06 00:00:00', '2017-06-01 00:00:00', '2017-08-26 00:00:00', null, null, null, '方洋', '1f8885311e274f3e94bb2f34f7e250b9', '5555.0000', '好几款很快就会看见');
INSERT INTO `t_pm_project` VALUES ('b6cd2bc0b80d4866b8af25f9776df806', '就会尽快还款计划', '76868', '2017-06-06 00:00:00', '2017-06-01 00:00:00', '2017-06-30 00:00:00', null, null, null, 'fly', '1f8885311e274f3e94bb2f34f7e250b9', '98889.0000', '会尽快回家客户即可');
INSERT INTO `t_pm_project` VALUES ('d4e010a4731e4588acdb53aee1425f29', '奥特曼', '67868', '2017-06-06 20:43:33', '2017-06-06 20:43:33', '2017-06-06 20:43:33', '2017-06-06 20:43:33', null, null, '方洋', '3fd09b589a264e439e855dadf2ba73f8', '9999.0000', 'hjkhjkhjkhjkhkhjkhk');
INSERT INTO `t_pm_project` VALUES ('ffe82e2050f1440bbe79c3b6fa381976', '火影忍者', '11111', '2017-06-06 00:00:00', '2017-06-01 00:00:00', '2017-08-11 00:00:00', null, null, null, '啦啦啦啦', 'fc875378374e415e89f01b44d18aa299', '9999.0000', 'hjkhjkhjkhjk');

-- ----------------------------
-- Table structure for t_pm_requirement
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_requirement`;
CREATE TABLE `t_pm_requirement` (
  `id` varchar(32) NOT NULL COMMENT '主键',
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
-- Table structure for t_relation_project_user
-- ----------------------------
DROP TABLE IF EXISTS `t_relation_project_user`;
CREATE TABLE `t_relation_project_user` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `project_id` varchar(32) NOT NULL COMMENT '项目表主键Id',
  `user_id` varchar(32) NOT NULL COMMENT '用户表主键Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_relation_project_user
-- ----------------------------
INSERT INTO `t_relation_project_user` VALUES ('207db7211bef49abbf0fbcf37dc5d256', 'd4e010a4731e4588acdb53aee1425f29', '1f8885311e274f3e94bb2f34f7e250b9');
INSERT INTO `t_relation_project_user` VALUES ('399db7211bef49abbf0fbcf37dc5d256', 'd4e010a4731e4588acdb53aee1425f29', '3fd09b589a264e439e855dadf2ba73f8');
INSERT INTO `t_relation_project_user` VALUES ('666db7211bef49abbf0fbcf37dc5d256', 'ffe82e2050f1440bbe79c3b6fa381976', '1f8885311e274f3e94bb2f34f7e250b9');

-- ----------------------------
-- Table structure for t_relation_task_user
-- ----------------------------
DROP TABLE IF EXISTS `t_relation_task_user`;
CREATE TABLE `t_relation_task_user` (
  `id` varchar(32) NOT NULL COMMENT '主键Id',
  `task_id` varchar(32) NOT NULL COMMENT '任务Id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_relation_task_user
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
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `age` int(3) DEFAULT NULL COMMENT '年龄',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` char(2) DEFAULT '' COMMENT '性别',
  `qq` varchar(20) DEFAULT NULL COMMENT 'qq号码',
  `wechat` varchar(50) DEFAULT '' COMMENT '微信号',
  `task_id` varchar(32) DEFAULT NULL COMMENT '任务表主键Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('1f8885311e274f3e94bb2f34f7e250b9', '方洋', '1a746099ff2e44881ccf4cd4bedbac48', null, '18326551239', null, '', null, '', null);
INSERT INTO `t_sys_user` VALUES ('207db7211bef49abbf0fbcf37dc5d256', 'fly3', '202cb962ac59075b964b07152d234b70', null, '7756675675', null, '', null, '', null);
INSERT INTO `t_sys_user` VALUES ('3fd09b589a264e439e855dadf2ba73f8', 'fly1', '202cb962ac59075b964b07152d234b70', null, '123456', null, '', null, '', null);
INSERT INTO `t_sys_user` VALUES ('acafa0565a4f49d7822a95eb0bfa21e2', 'fly6', '202cb962ac59075b964b07152d234b70', null, '79858587', null, '', null, '', null);
INSERT INTO `t_sys_user` VALUES ('d9bfdba97db64ecb8e9fd486bdfcd129', 'fly4', '202cb962ac59075b964b07152d234b70', null, '67876876', null, '', null, '', null);
INSERT INTO `t_sys_user` VALUES ('fc875378374e415e89f01b44d18aa299', 'fly2', '202cb962ac59075b964b07152d234b70', null, '456789', null, '', null, '', null);

-- ----------------------------
-- Table structure for t_tester_bugs
-- ----------------------------
DROP TABLE IF EXISTS `t_tester_bugs`;
CREATE TABLE `t_tester_bugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(30) DEFAULT NULL COMMENT 'bug编号',
  `platform` varchar(30) DEFAULT NULL COMMENT '平台',
  `precodition` varchar(255) DEFAULT '' COMMENT '前置条件',
  `describe` varchar(255) DEFAULT NULL COMMENT '详细描述',
  `degree` char(2) DEFAULT NULL COMMENT '严重程度',
  `state` varchar(10) DEFAULT NULL COMMENT '修复状态',
  `person_commit` varchar(5) DEFAULT '' COMMENT '提交人',
  `person_solve` varchar(5) DEFAULT NULL COMMENT '解决人',
  `mem` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tester_bugs
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_task
-- ----------------------------
DROP TABLE IF EXISTS `t_user_task`;
CREATE TABLE `t_user_task` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '任务名称',
  `time_begin` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `time_end` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  `time_alarm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '提醒时间',
  `level` char(2) NOT NULL COMMENT '优先级\r\n01 \r\n02 \r\n03 \r\n04 \r\n05',
  `mem` varchar(255) DEFAULT '' COMMENT '备注',
  `state` char(2) NOT NULL COMMENT '任务状态：\r\n01 待处理\r\n02 进行中\r\n03 已完成',
  `project_id` varchar(32) NOT NULL COMMENT '所属项目Id',
  `user_id` varchar(32) NOT NULL COMMENT '创建者用户Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_task
-- ----------------------------
INSERT INTO `t_user_task` VALUES ('0ad09d0df01746859485811a9c641193', '测试', '2017-06-10 00:00:00', null, null, '01', '', '01', '059af6f0b35243c9b4796b538e781421', '1f8885311e274f3e94bb2f34f7e250b9');
INSERT INTO `t_user_task` VALUES ('256356ea5cdc40a580a223242e69063d', '测试3', '2017-06-10 00:00:00', null, null, '01', '', '01', '059af6f0b35243c9b4796b538e781421', '1f8885311e274f3e94bb2f34f7e250b9');
INSERT INTO `t_user_task` VALUES ('3af40d62754e44a28c024aba83f63927', '策划死或斤斤计较机', '2017-06-11 21:41:15', '2017-06-11 21:41:15', '2017-06-11 21:41:15', '01', '', '02', 'd4e010a4731e4588acdb53aee1425f29', '1f8885311e274f3e94bb2f34f7e250b9');
INSERT INTO `t_user_task` VALUES ('40336358c06640d0986219cf53798a87', '测试', '2017-06-11 21:44:07', '2017-06-11 21:44:07', '2017-06-11 21:44:07', '01', '', '01', 'd4e010a4731e4588acdb53aee1425f29', '3fd09b589a264e439e855dadf2ba73f8');
INSERT INTO `t_user_task` VALUES ('59b21ef0c5414e139bb4e1068fa8a0ad', '方洋测试', '2017-06-11 18:03:40', '2017-06-11 18:03:40', '2017-06-11 18:03:40', '02', '', '03', 'd4e010a4731e4588acdb53aee1425f29', '1f8885311e274f3e94bb2f34f7e250b9');
INSERT INTO `t_user_task` VALUES ('70f32e181a2b478e81bb992aeb24abf4', '测试2', '2017-06-11 21:44:10', '2017-06-11 21:44:10', '2017-06-11 21:44:10', '03', '', '01', 'd4e010a4731e4588acdb53aee1425f29', '3fd09b589a264e439e855dadf2ba73f8');
INSERT INTO `t_user_task` VALUES ('c133355fa0224330aede3dc279d8d403', '测试2', '2017-06-10 00:00:00', null, null, '01', '', '01', '059af6f0b35243c9b4796b538e781421', '1f8885311e274f3e94bb2f34f7e250b9');
INSERT INTO `t_user_task` VALUES ('d093179a5ba0472ea1bff62ac74ed2fb', '方洋测试2', '2017-06-11 21:40:30', '2017-06-11 21:40:30', '2017-06-11 21:40:30', '04', '', '03', 'd4e010a4731e4588acdb53aee1425f29', '1f8885311e274f3e94bb2f34f7e250b9');
INSERT INTO `t_user_task` VALUES ('d1476a2ae0cb47cfab157117aad43b29', '测试1111', '2017-06-11 21:43:55', '2017-06-11 21:43:55', '2017-06-11 21:43:55', '01', '', '02', 'd4e010a4731e4588acdb53aee1425f29', '1f8885311e274f3e94bb2f34f7e250b9');

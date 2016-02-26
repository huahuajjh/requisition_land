/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.7_3306
Source Server Version : 50627
Source Host           : 192.168.1.7:3306
Source Database       : db_requisition_land

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-01-22 01:55:43
*/
use db_requisition_land;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_account`
-- ----------------------------
DROP TABLE IF EXISTS `tb_account`;
CREATE TABLE `tb_account` (
  `id` varchar(70) NOT NULL,
  `account` varchar(50) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `state` varchar(30) NOT NULL,
  `org_id` varchar(70) DEFAULT NULL,
  `dept_id` varchar(70) DEFAULT NULL,
  `role_id` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_account
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_account_state`
-- ----------------------------
DROP TABLE IF EXISTS `tb_account_state`;
CREATE TABLE `tb_account_state` (
  `id` varchar(70) NOT NULL,
  `state_code` int(11) NOT NULL,
  `state_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `state_code` (`state_code`),
  UNIQUE KEY `state_name` (`state_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_account_state
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_address`
-- ----------------------------
DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address` (
  `id` varchar(70) NOT NULL,
  `title` varchar(50) NOT NULL,
  `pid` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_address
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_announcement`
-- ----------------------------
DROP TABLE IF EXISTS `tb_announcement`;
CREATE TABLE `tb_announcement` (
  `id` varchar(70) NOT NULL,
  `announce_date` date NOT NULL,
  `announce_number` varchar(50) DEFAULT NULL,
  `file_path` varchar(120) DEFAULT NULL,
  `pro_id` varchar(70) NOT NULL,
  `sequence` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_path` (`file_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_announcement
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_archive_file`
-- ----------------------------
DROP TABLE IF EXISTS `tb_archive_file`;
CREATE TABLE `tb_archive_file` (
  `id` varchar(70) NOT NULL,
  `file_path` varchar(50) NOT NULL,
  `file_type_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_archive_file
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_archive_file_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_archive_file_type`;
CREATE TABLE `tb_archive_file_type` (
  `id` varchar(70) NOT NULL,
  `type_code` int(11) NOT NULL,
  `type_name` varchar(30) NOT NULL,
  `parent_file_id` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_archive_file_type
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_dept`
-- ----------------------------
DROP TABLE IF EXISTS `tb_dept`;
CREATE TABLE `tb_dept` (
  `id` varchar(70) NOT NULL,
  `dept_name` varchar(30) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  `org_id` varchar(70) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_dept
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_family`
-- ----------------------------
DROP TABLE IF EXISTS `tb_family`;
CREATE TABLE `tb_family` (
  `id` varchar(70) NOT NULL,
  `head_name` varchar(30) NOT NULL,
  `pro_id` varchar(70) NOT NULL,
  `head_id` varchar(70) NOT NULL,
  `community_id` varchar(70) DEFAULT NULL,
  `address` varchar(120) DEFAULT NULL,
  `street_id` varchar(70) DEFAULT NULL,
  `family_number` int(11) NOT NULL,
  `house_legal_area` float DEFAULT NULL,
  `house_illegal_area` float DEFAULT NULL,
  `situation_desc` varchar(255) DEFAULT NULL,
  `deal_solution` varchar(255) DEFAULT NULL,
  `union_suggestion` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `house_img_path` varchar(250) DEFAULT NULL,
  `pro_name` varchar(70) DEFAULT NULL,
  `group_id` varchar(70) DEFAULT NULL,
  `union_suggestion_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_family
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_family_familyitem`
-- ----------------------------
DROP TABLE IF EXISTS `tb_family_familyitem`;
CREATE TABLE `tb_family_familyitem` (
  `id` varchar(70) NOT NULL,
  `family_id` varchar(70) NOT NULL,
  `family_item_id` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_family_familyitem
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_family_item`
-- ----------------------------
DROP TABLE IF EXISTS `tb_family_item`;
CREATE TABLE `tb_family_item` (
  `id` varchar(70) NOT NULL,
  `address` varchar(70) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `id_number` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `relationship` varchar(70) NOT NULL,
  `household_type` varchar(70) NOT NULL,
  `only_child_number` varchar(70) DEFAULT NULL,
  `is_half` tinyint(1) NOT NULL,
  `relationship_id` varchar(70) DEFAULT NULL,
  `household_type_Id` varchar(70) DEFAULT NULL,
  `street_id` varchar(70) DEFAULT NULL,
  `community_id` varchar(70) DEFAULT NULL,
  `pro_id` varchar(70) NOT NULL,
  `fml_id` varchar(70) NOT NULL,
  `pro_name` varchar(70) DEFAULT NULL,
  `is_removed` tinyint(1) NOT NULL,
  `is_transferd` tinyint(1) NOT NULL,
  `is_socialsecurity` tinyint(1) NOT NULL,
  `socialsecurity_str` varchar(50) DEFAULT NULL,
  `education_level` varchar(30) DEFAULT NULL,
  `current_education_situation` varchar(30) DEFAULT NULL,
  `farming_time` varchar(30) DEFAULT NULL,
  `serve_army_situation` varchar(120) DEFAULT NULL,
  `group_id` varchar(70) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `used_socialsecurity` tinyint(1) DEFAULT NULL,
  `remark` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_number` (`id_number`),
  UNIQUE KEY `id_number_2` (`id_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_family_item
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_household_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_household_type`;
CREATE TABLE `tb_household_type` (
  `id` varchar(70) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_household_type
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_housepurchase_ticket`
-- ----------------------------
DROP TABLE IF EXISTS `tb_housepurchase_ticket`;
CREATE TABLE `tb_housepurchase_ticket` (
  `id` varchar(70) NOT NULL,
  `bonus` float NOT NULL,
  `make_date` date NOT NULL,
  `ticket_state_id` varchar(70) NOT NULL,
  `ticket_number` varchar(50) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fml_item_id` varchar(70) NOT NULL,
  `id_number` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_housepurchase_ticket
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_operation_record`
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_record`;
CREATE TABLE `tb_operation_record` (
  `id` varchar(70) NOT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `moudle` varchar(20) DEFAULT NULL,
  `action` varchar(20) DEFAULT NULL,
  `content` varchar(20) DEFAULT NULL,
  `mac` varchar(70) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `moudle_id` varchar(70) DEFAULT NULL,
  `account_id` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_operation_record
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_org`
-- ----------------------------
DROP TABLE IF EXISTS `tb_org`;
CREATE TABLE `tb_org` (
  `id` varchar(70) NOT NULL,
  `org_name` varchar(30) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  `org_number` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_name` (`org_name`),
  UNIQUE KEY `org_number` (`org_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_org
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_permission`
-- ----------------------------
DROP TABLE IF EXISTS `tb_permission`;
CREATE TABLE `tb_permission` (
  `id` varchar(70) NOT NULL,
  `res_id` varchar(70) NOT NULL,
  `role_id` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_policy_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_policy_type`;
CREATE TABLE `tb_policy_type` (
  `id` varchar(70) NOT NULL,
  `type_code` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_code` (`type_code`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_policy_type
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_project`
-- ----------------------------
DROP TABLE IF EXISTS `tb_project`;
CREATE TABLE `tb_project` (
  `id` varchar(70) NOT NULL,
  `pro_name` varchar(50) NOT NULL,
  `approval_number` varchar(50) NOT NULL,
  `requisition_area` float NOT NULL,
  `should_remove_buildings` int(11) NOT NULL,
  `should_remove_houses` int(11) NOT NULL,
  `should_remove_legal_area` float NOT NULL,
  `should_remove_Illegal_area` float NOT NULL,
  `should_remove_population` int(11) NOT NULL,
  `should_pay_money` decimal(20,6) DEFAULT NULL,
  `total_paid_money` decimal(20,6) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `pro_type` varchar(70) NOT NULL,
  `street_id` varchar(210) DEFAULT NULL,
  `community_id` varchar(210) DEFAULT NULL,
  `total_address` varchar(100) DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL,
  `sequence` int(1) DEFAULT NULL,
  `requisition_land_area_total` float DEFAULT NULL,
  `requisition_land_area_year` float DEFAULT NULL,
  `removed_buildings_legal_total` int(5) DEFAULT NULL,
  `removed_buildings_legal_year` int(5) DEFAULT NULL,
  `removed_houses_legal_total` int(5) DEFAULT NULL,
  `removed_houses_legal_year` int(5) DEFAULT NULL,
  `removed_area_legal_total` float DEFAULT NULL,
  `removed_area_legal_year` float DEFAULT NULL,
  `removed_area_illegal_total` float DEFAULT NULL,
  `removed_area_illegal_year` float DEFAULT NULL,
  `removed_population_total` int(7) DEFAULT NULL,
  `removed_population_year` int(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `approval_number` (`approval_number`),
  UNIQUE KEY `pro_name` (`pro_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_project
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_project_item`
-- ----------------------------
DROP TABLE IF EXISTS `tb_project_item`;
CREATE TABLE `tb_project_item` (
  `id` varchar(70) NOT NULL,
  `item_date` date NOT NULL,
  `removed_buildings` int(11) DEFAULT NULL,
  `removed_houses` int(11) DEFAULT NULL,
  `removed_legal_area` float DEFAULT NULL,
  `removed_illegal_area` float DEFAULT NULL,
  `moved_populations` int(11) DEFAULT NULL,
  `paid_money` decimal(20,6) DEFAULT NULL,
  `year_deadline_file` int(11) DEFAULT NULL,
  `year_court_execute` int(11) DEFAULT NULL,
  `year_legal_removed` int(11) DEFAULT NULL,
  `is_new_start` tinyint(1) NOT NULL,
  `removed_land_area` float NOT NULL,
  `pro_id` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_project_item
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_registed_argc_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_registed_argc_info`;
CREATE TABLE `tb_registed_argc_info` (
  `id` varchar(70) NOT NULL,
  `name` varchar(50) NOT NULL,
  `id_number` varchar(30) NOT NULL,
  `address` varchar(120) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  `is_settled` tinyint(1) NOT NULL,
  `is_transferd` tinyint(1) NOT NULL,
  `is_socialsecurity` tinyint(1) NOT NULL,
  `policy_state_id` varchar(70) NOT NULL,
  `user_state_id` varchar(70) NOT NULL,
  `policy_str` varchar(50) DEFAULT NULL,
  `user_state_str` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_number` (`id_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_registed_argc_info
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_relationship_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_relationship_type`;
CREATE TABLE `tb_relationship_type` (
  `id` varchar(70) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_relationship_type
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_removed_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_removed_info`;
CREATE TABLE `tb_removed_info` (
  `id` varchar(70) NOT NULL,
  `name` varchar(50) NOT NULL,
  `id_number` varchar(30) NOT NULL,
  `address` varchar(70) NOT NULL,
  `birthday` date NOT NULL,
  `removed_date` date NOT NULL,
  `street_id` varchar(70) DEFAULT NULL,
  `community_id` varchar(70) DEFAULT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_number` (`id_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_removed_info
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_report_of_loss`
-- ----------------------------
DROP TABLE IF EXISTS `tb_report_of_loss`;
CREATE TABLE `tb_report_of_loss` (
  `id` varchar(70) NOT NULL,
  `opr_user` varchar(70) NOT NULL,
  `opr_date` date NOT NULL,
  `owner` varchar(70) NOT NULL,
  `ticket_id` varchar(70) NOT NULL,
  `loss_date` date NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_report_of_loss
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_resource`
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource`;
CREATE TABLE `tb_resource` (
  `id` varchar(70) NOT NULL,
  `res_type` int(2) NOT NULL,
  `resource_order` int(11) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  `icon` varchar(70) DEFAULT NULL,
  `link` varchar(70) DEFAULT NULL,
  `parent_res_id` varchar(70) DEFAULT NULL,
  `path` varchar(1000) DEFAULT NULL,
  `has_children` tinyint(1) DEFAULT NULL,
  `html_id` varchar(30) DEFAULT NULL,
  `html` varchar(250) DEFAULT NULL,
  `hierarchy` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `moudle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_resource
-- ----------------------------
INSERT INTO `tb_resource` VALUES ('0e3827d5-fa84-4aed-983a-b290da99052f', '0', '4', '0', 'icon', '#housePurchaseMansgement/hptUseAndCash', '6b3dac14-8116-4aad-8643-c54821ebf93c', '', '1', '', '', '0', '购房券的使用与兑现', '');
INSERT INTO `tb_resource` VALUES ('1024d946-439f-4c31-9f95-d975091ef84a', '0', '2', '0', 'icon', '#management/registedAgrcInfoQuery', '1ba39037-689f-4bd8-8d0d-446c376567a3', '', '1', '', '', '0', '在籍农业人口回收站', 'admin');
INSERT INTO `tb_resource` VALUES ('1151395a-7d71-40ce-9435-a24167186175', '0', '8', '0', 'icon', '', null, '', '1', '', '', '0', '在籍农业人口管理管理', '');
INSERT INTO `tb_resource` VALUES ('15633e32-a4cc-4c43-9a92-e2089467d423', '0', '3', '0', 'icon', '#housePurchaseMansgement/hptSet', '6b3dac14-8116-4aad-8643-c54821ebf93c', '', '1', '', '', '0', '购房券户发放', '');
INSERT INTO `tb_resource` VALUES ('1ba39037-689f-4bd8-8d0d-446c376567a3', '0', '16', '0', 'icon', '', null, '', '1', '', '', '0', '回收站', 'admin');
INSERT INTO `tb_resource` VALUES ('24761d7a-3b15-49ff-adb1-0bf1ad9e7c05', '0', '1', '0', 'icon', '#housePurchaseMansgement/hptAdd', '6b3dac14-8116-4aad-8643-c54821ebf93c', '', '1', '', '', '0', '录入购房券信息', '');
INSERT INTO `tb_resource` VALUES ('291ddf56-70b7-4917-97c1-85e2a032e362', '0', '2', '0', 'icon', '#removedDocManagement/removedInfoQuery', 'bac2388a-3e8c-494f-8525-62c2a3370229', '', '1', '', '', '0', '维护已迁户信息', '');
INSERT INTO `tb_resource` VALUES ('2e27e9cc-b43c-4c3a-8134-cc2d3631b7ef', '0', '2', '0', 'icon', '#socialSecurityMansgement/solmInfoBatch', '8502199d-390e-49e1-a37a-43b5677bc705', '', '1', '', '', '0', '批量处理社保信息', '');
INSERT INTO `tb_resource` VALUES ('30513a9c-e72b-4dfb-b765-e4b4e9392e74', '0', '1', '0', 'icon', '#management/sysCreateAccount', '3b42ceb2-890e-4ce7-b996-7f5227be4c44', '', '1', '', '', '0', '新增人员信息', 'admin');
INSERT INTO `tb_resource` VALUES ('31444c7b-38bf-4f77-9f26-528ef4cd292e', '0', '12', '0', 'icon', '', null, '', '1', '', '', '0', '查询统计', '');
INSERT INTO `tb_resource` VALUES ('32f581e4-a47e-444b-bfd8-371d09972061', '0', '11', '0', 'icon', '', null, '', '1', '', '', '0', '单位管理', 'admin');
INSERT INTO `tb_resource` VALUES ('3b42ceb2-890e-4ce7-b996-7f5227be4c44', '0', '9', '0', 'icon', '', null, '', '1', '', '', '0', '人员信息管理', 'admin');
INSERT INTO `tb_resource` VALUES ('3c2f65ad-a8e8-4978-a5c5-b83b5b3afccf', '0', '3', '0', 'icon', '#projectManagement/pmQueryPro', 'a538004f-b6b2-48e3-8fcb-8ba000a3019a', '', '1', '', '', '0', '查询项目台账', '');
INSERT INTO `tb_resource` VALUES ('42e3806c-47d2-4e7b-aff9-b32f1180c63f', '0', '10', '0', 'icon', '', null, '', '1', '', '', '0', '角色/权限管理', 'admin');
INSERT INTO `tb_resource` VALUES ('44fb3f75-3a7b-468c-a28f-1b162d2ba5e7', '0', '1', '0', 'icon', '#management/sysLog', '61cdf89c-7ab4-4bd1-8356-37ef33801980', '', '1', '', '', '0', '维护系统日志', 'admin');
INSERT INTO `tb_resource` VALUES ('4b1ee9ed-f9dc-4372-96ab-ea976a585cd7', '0', '2', '0', 'icon', '#management/sysAccountQuery', '3b42ceb2-890e-4ce7-b996-7f5227be4c44', '', '1', '', '', '0', '维护人员信息', 'admin');
INSERT INTO `tb_resource` VALUES ('53907546-4c20-4277-8022-5113c62e0d29', '0', '1', '0', 'icon', '#management/sysPermission', '42e3806c-47d2-4e7b-aff9-b32f1180c63f', '', '1', '', '', '0', '分配权限', 'admin');
INSERT INTO `tb_resource` VALUES ('584358c1-0e68-46ee-a099-10e654ca3191', '0', '2', '0', 'icon', '#docFileManagement/fileMListAdd', '9349a42d-2b03-4370-8b77-04a39f2caa5d', '', '1', '', '', '0', ' 添加政策法规文件', '');
INSERT INTO `tb_resource` VALUES ('591d7a48-3d07-4072-8f75-bc8bf8bd7d88', '0', '1', '0', 'icon', '#supervisionManagement/infoSummary', 'ef7420c3-0a6f-4667-827d-cb4aa55f0efc', '', '1', '', '', '0', '综合浏览', '');
INSERT INTO `tb_resource` VALUES ('598a9f57-4d74-4dca-b63f-b879b4436fae', '0', '1', '0', 'icon', '#projectManagement/pmAddPro', 'a538004f-b6b2-48e3-8fcb-8ba000a3019a', '', '1', '', '', '0', '录入项目信息', '');
INSERT INTO `tb_resource` VALUES ('59a89bdc-7b88-4bd9-a593-1dae0d49dc16', '0', '1', '0', 'icon', '#management/sysDataDict', 'b3f9ca24-2786-4253-8d70-faf8db7744eb', '', '1', '', '', '0', '维护数据字典', 'admin');
INSERT INTO `tb_resource` VALUES ('611cb245-07af-4c20-9712-9e74ce22ccd1', '0', '1', '0', 'icon', '#onekeyQuery/onekeyQuery', 'ef7420c3-0a6f-4667-827d-cb4aa55f0efc', null, '1', null, null, '0', '一键查询', '');
INSERT INTO `tb_resource` VALUES ('61a1dfdb-8a3f-4df5-94ce-aa1b848a1608', '0', '2', '0', 'icon', '#management/sysRoleManage', '42e3806c-47d2-4e7b-aff9-b32f1180c63f', '', '1', '', '', '0', '角色管理', 'admin');
INSERT INTO `tb_resource` VALUES ('61cdf89c-7ab4-4bd1-8356-37ef33801980', '0', '15', '0', 'icon', '', null, '', '1', '', '', '0', '系统日志管理', 'admin');
INSERT INTO `tb_resource` VALUES ('635a3873-75b5-4725-8391-2cecfc448714', '0', '2', '0', 'icon', '#registedInfoManagement/queryRegistedInfo', '1151395a-7d71-40ce-9435-a24167186175', '', '1', '', '', '0', '维护在籍农业人口信息', '');
INSERT INTO `tb_resource` VALUES ('64d6e9fc-b4aa-4a12-90ef-59f077b6c073', '0', '3', '0', 'icon', '#transferAccountManagement/taQuery', 'd78b0a7a-3014-4f20-8fe6-b4b86441995e', '', '1', '', '', '0', '查询转户台账', '');
INSERT INTO `tb_resource` VALUES ('66a87ece-4473-4db4-97df-97cfded49049', '0', '8', '0', 'icon', '#housePurchaseMansgement/hptIssue', '6b3dac14-8116-4aad-8643-c54821ebf93c', '', '1', '', '', '0', '购房券户发放台账', '');
INSERT INTO `tb_resource` VALUES ('66b23947-9c39-48a2-817e-0791a93a5ccf', '0', '1', '0', 'icon', '#statistics/statistics', '31444c7b-38bf-4f77-9f26-528ef4cd292e', '', '1', '', '', '0', '查询统计', '');
INSERT INTO `tb_resource` VALUES ('6b3dac14-8116-4aad-8643-c54821ebf93c', '0', '4', '0', 'icon', '', null, '', '1', '', '', '0', '购房券管理', '');
INSERT INTO `tb_resource` VALUES ('6c95c954-584f-4bbc-a583-04d2420b8174', '0', '3', '0', 'icon', '#docFileManagement/fileMListMsg', '9349a42d-2b03-4370-8b77-04a39f2caa5d', '', '1', '', '', '0', ' 政策法规文件维护', '');
INSERT INTO `tb_resource` VALUES ('6f706e28-face-42ee-8978-89ba36751d78', '0', '1', '0', 'icon', '#docFileManagement/fileMList', '9349a42d-2b03-4370-8b77-04a39f2caa5d', '', '1', '', '', '0', ' 在线浏览政策法规', '');
INSERT INTO `tb_resource` VALUES ('7ec96129-09ab-413c-924f-6c25aa32d25e', '0', '2', '0', 'icon', '#projectManagement/listRemoved', 'be769d24-1b19-472a-9f68-fc82c800ad29', '', '1', '', '', '0', '拆迁户人员信息台账', '');
INSERT INTO `tb_resource` VALUES ('8502199d-390e-49e1-a37a-43b5677bc705', '0', '3', '0', 'icon', '', null, '', '1', '', '', '0', '社保管理', '');
INSERT INTO `tb_resource` VALUES ('87428992-c17a-4e50-bb12-d325e7e428e3', '0', '2', '0', 'icon', '#housePurchaseMansgement/hptSetPerson', '6b3dac14-8116-4aad-8643-c54821ebf93c', '', '1', '', '', '0', '购房券个人发放', '');
INSERT INTO `tb_resource` VALUES ('8748319a-7534-4449-8148-1a216b585cb0', '0', '1', '0', 'icon', '#registedInfoManagement/addRegistedInfo', '1151395a-7d71-40ce-9435-a24167186175', '', '1', '', '', '0', '录入在籍农业人口信息', '');
INSERT INTO `tb_resource` VALUES ('8b774553-e40a-48e6-858e-c37a8d7751f3', '0', '5', '0', 'icon', '#housePurchaseMansgement/hptExchange', '6b3dac14-8116-4aad-8643-c54821ebf93c', '', '1', '', '', '0', '购房券换发', '');
INSERT INTO `tb_resource` VALUES ('9349a42d-2b03-4370-8b77-04a39f2caa5d', '0', '13', '0', 'icon', '', null, '', '1', '', '', '0', '档案文件管理', '');
INSERT INTO `tb_resource` VALUES ('99a49750-a414-4e06-be6a-dc7aa15c3c12', '0', '4', '0', 'icon', '#socialSecurityMansgement/solmQuery', '8502199d-390e-49e1-a37a-43b5677bc705', '', '1', '', '', '0', '查询社保台账', '');
INSERT INTO `tb_resource` VALUES ('9deeaa35-124a-42e2-87d3-cdcd57fbb9ad', '0', '1', '0', 'icon', '#management/sysOrgManagement', '32f581e4-a47e-444b-bfd8-371d09972061', '', '1', '', '', '0', '维护单位信息', 'admin');
INSERT INTO `tb_resource` VALUES ('9ea4e2e6-21c1-4f72-962b-5faae74252b3', '0', '2', '0', 'icon', '#transferAccountManagement/taInfoBatch', 'd78b0a7a-3014-4f20-8fe6-b4b86441995e', '', '1', '', '', '0', '批量新增转户信息', '');
INSERT INTO `tb_resource` VALUES ('a538004f-b6b2-48e3-8fcb-8ba000a3019a', '0', '0', '0', 'icon', '', null, '', '1', '', '', '0', '项目管理', '');
INSERT INTO `tb_resource` VALUES ('a594059d-f3bf-42c7-bb8d-5654c999e1af', '0', '2', '0', 'icon', '#messageManagement/visitQuery', 'e746da4a-c40f-409b-9130-270e372efb04', '', '1', '', '', '0', '维护信访信息', '');
INSERT INTO `tb_resource` VALUES ('af147a27-2b7e-4c62-bb3c-b9dbffe97c14', '0', '1', '0', 'icon', '#removedDocManagement/removedInfoAdd', 'bac2388a-3e8c-494f-8525-62c2a3370229', '', '1', '', '', '0', '录入已迁户人员信息', '');
INSERT INTO `tb_resource` VALUES ('b3f9ca24-2786-4253-8d70-faf8db7744eb', '0', '14', '0', 'icon', '', null, '', '1', '', '', '0', '数据字典管理', 'admin');
INSERT INTO `tb_resource` VALUES ('b9229f63-b658-4280-a609-16da8bcce156', '0', '1', '0', 'icon', '#projectManagement/uploadRemoveInfo', 'be769d24-1b19-472a-9f68-fc82c800ad29', null, '1', null, null, '0', '录入拆迁户信息', '');
INSERT INTO `tb_resource` VALUES ('bac2388a-3e8c-494f-8525-62c2a3370229', '0', '7', '0', 'icon', '', null, '', '1', '', '', '0', '已迁户信息管理', '');
INSERT INTO `tb_resource` VALUES ('be5d84dc-cc75-42fc-9269-dfba2e3f9504', '0', '1', '0', 'icon', '#management/accountQuery', '1ba39037-689f-4bd8-8d0d-446c376567a3', '', '1', '', '', '0', '账户回收站', 'admin');
INSERT INTO `tb_resource` VALUES ('be769d24-1b19-472a-9f68-fc82c800ad29', '0', '1', '0', 'icon', '', null, '', '1', '', '', '0', '拆迁户管理', '');
INSERT INTO `tb_resource` VALUES ('cb027978-ae93-4c48-a88b-91d3b67766e0', '0', '1', '0', 'icon', '#transferAccountManagement/taImportFile', 'd78b0a7a-3014-4f20-8fe6-b4b86441995e', '', '1', '', '', '0', '录入转户信息', '');
INSERT INTO `tb_resource` VALUES ('cb7d46b0-25f2-4a2d-b021-4032d209951b', '0', '7', '0', 'icon', '#housePurchaseMansgement/hptExchangeBill', '6b3dac14-8116-4aad-8643-c54821ebf93c', '', '1', '', '', '0', '购房卷的兑付台账', '');
INSERT INTO `tb_resource` VALUES ('d78127f1-4573-434e-bbce-95cbb6e27b37', '0', '2', '0', 'icon', '#projectManagement/pmProgress', 'a538004f-b6b2-48e3-8fcb-8ba000a3019a', '', '1', '', '', '0', '项目进度管理', '');
INSERT INTO `tb_resource` VALUES ('d78b0a7a-3014-4f20-8fe6-b4b86441995e', '0', '2', '0', 'icon', '', null, '', '1', '', '', '0', '转户管理', '');
INSERT INTO `tb_resource` VALUES ('e746da4a-c40f-409b-9130-270e372efb04', '0', '6', '0', 'icon', '', null, '', '1', '', '', '0', '信访管理', '');
INSERT INTO `tb_resource` VALUES ('eb106090-a2d1-462c-a371-bb935a93ed2d', '0', '6', '0', 'icon', '#housePurchaseMansgement/hptLossAndMend', '6b3dac14-8116-4aad-8643-c54821ebf93c', '', '1', '', '', '0', '购房卷挂失/补券', '');
INSERT INTO `tb_resource` VALUES ('ef7420c3-0a6f-4667-827d-cb4aa55f0efc', '0', '5', '0', 'icon', '', null, '', '1', '', '', '0', '查询浏览', '');
INSERT INTO `tb_resource` VALUES ('f71cb280-3108-4013-9ac2-2d00ed56abac', '0', '3', '0', 'icon', '#management/removePInfoQuery', '1ba39037-689f-4bd8-8d0d-446c376567a3', '', '1', '', '', '0', '已迁户回收站', 'admin');
INSERT INTO `tb_resource` VALUES ('fabf3a8a-153b-421f-9ba4-d531807f8c6a', '0', '3', '0', 'icon', '#projectManagement/queryRemoveInfo', 'be769d24-1b19-472a-9f68-fc82c800ad29', '', '1', '', '', '0', '拆迁户户信息台账', '');
INSERT INTO `tb_resource` VALUES ('fc50914f-aa91-4bf8-b196-f889ddf34784', '0', '1', '0', 'icon', '#messageManagement/visitAdd', 'e746da4a-c40f-409b-9130-270e372efb04', '', '1', '', '', '0', '录入信访信息', '');
INSERT INTO `tb_resource` VALUES ('fd190a39-295f-4491-a020-f4f2cf5f58a4', '0', '1', '0', 'icon', '#socialSecurityMansgement/solmImportFile', '8502199d-390e-49e1-a37a-43b5677bc705', '', '1', '', '', '0', '录入社保信息', '');

-- ----------------------------
-- Table structure for `tb_role`
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` varchar(70) NOT NULL,
  `role_name` varchar(30) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_role_account`
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_account`;
CREATE TABLE `tb_role_account` (
  `id` varchar(70) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  `account_id` varchar(70) NOT NULL,
  `role_id` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role_account
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_socialsecurity_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_socialsecurity_info`;
CREATE TABLE `tb_socialsecurity_info` (
  `id` varchar(70) NOT NULL,
  `opr_user_id` varchar(70) NOT NULL,
  `opr_date` date NOT NULL,
  `socialsecurity_date` date NOT NULL,
  `socialsecurity_type_id` varchar(70) NOT NULL,
  `fml_item_id` varchar(70) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  `serve_army_time` int(5) DEFAULT NULL,
  `endowment_insurance_year` int(2) DEFAULT NULL,
  `medical_insurance_month` int(5) DEFAULT NULL,
  `join_which_medical_insurance` varchar(60) DEFAULT NULL,
  `community` varchar(11) DEFAULT NULL,
  `prison_time` int(5) DEFAULT NULL,
  `is_join_socialsecurity` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_socialsecurity_info
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_socialsecurity_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_socialsecurity_type`;
CREATE TABLE `tb_socialsecurity_type` (
  `id` varchar(70) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_socialsecurity_type
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_ticket_exchange`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ticket_exchange`;
CREATE TABLE `tb_ticket_exchange` (
  `id` varchar(70) NOT NULL,
  `opr_user` varchar(70) NOT NULL,
  `opr_date` date NOT NULL,
  `exchange_date` date NOT NULL,
  `owner` varchar(70) NOT NULL,
  `evidence_path` varchar(250) DEFAULT NULL,
  `getting_user` varchar(70) NOT NULL,
  `current_ticket_id` varchar(70) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  `old_ticket_id` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ticket_exchange
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_ticket_mend`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ticket_mend`;
CREATE TABLE `tb_ticket_mend` (
  `id` varchar(70) NOT NULL,
  `opr_user` varchar(70) DEFAULT NULL,
  `mend_date` date NOT NULL,
  `opr_date` date NOT NULL,
  `owner` varchar(70) NOT NULL,
  `ticket_id` varchar(70) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ticket_mend
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_ticket_provider`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ticket_provider`;
CREATE TABLE `tb_ticket_provider` (
  `id` varchar(70) NOT NULL,
  `ticket_id` varchar(70) NOT NULL,
  `owner_id` varchar(70) NOT NULL,
  `name` varchar(50) NOT NULL,
  `id_number` varchar(20) NOT NULL,
  `opr_date` date NOT NULL,
  `evidence_path` varchar(250) DEFAULT NULL,
  `getting_date` date NOT NULL,
  `opr_user_id` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ticket_provider
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_ticket_state`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ticket_state`;
CREATE TABLE `tb_ticket_state` (
  `id` varchar(70) NOT NULL,
  `type_code` int(11) NOT NULL,
  `type_name` varchar(70) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_code` (`type_code`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ticket_state
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_ticket_use_cash`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ticket_use_cash`;
CREATE TABLE `tb_ticket_use_cash` (
  `id` varchar(70) NOT NULL,
  `opr_user_id` varchar(70) NOT NULL,
  `opr_date` date NOT NULL,
  `using_to_where` varchar(70) DEFAULT NULL,
  `using_type_id` varchar(70) NOT NULL,
  `owner` varchar(70) NOT NULL,
  `ticket_id` varchar(70) NOT NULL,
  `using_date` date NOT NULL,
  `situation_explain` varchar(70) DEFAULT NULL,
  `evidence_path` varchar(250) DEFAULT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ticket_use_cash
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_ticket_use_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ticket_use_type`;
CREATE TABLE `tb_ticket_use_type` (
  `id` varchar(70) NOT NULL,
  `type_code` int(11) NOT NULL,
  `type_name` varchar(70) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_code` (`type_code`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ticket_use_type
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_transfer_household_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_transfer_household_info`;
CREATE TABLE `tb_transfer_household_info` (
  `id` varchar(70) NOT NULL,
  `opr_user_id` varchar(70) NOT NULL,
  `opr_date` date NOT NULL,
  `address` varchar(120) NOT NULL,
  `transfer_date` date NOT NULL,
  `household_type_id` varchar(70) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  `fml_item_id` varchar(70) NOT NULL,
  `street_id` varchar(70) NOT NULL,
  `community_id` varchar(70) NOT NULL,
  `group_id` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_transfer_household_info
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_user_state`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_state`;
CREATE TABLE `tb_user_state` (
  `id` varchar(70) NOT NULL,
  `type_code` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_code` (`type_code`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_state
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_visit_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_visit_info`;
CREATE TABLE `tb_visit_info` (
  `id` varchar(70) NOT NULL,
  `name` varchar(50) NOT NULL,
  `tel` varchar(30) NOT NULL,
  `address` varchar(70) NOT NULL,
  `other_msg` varchar(70) NOT NULL,
  `visit_pro_id` varchar(70) NOT NULL,
  `visit_reason` varchar(70) NOT NULL,
  `visit_date` date NOT NULL,
  `visit_material_path` varchar(70) DEFAULT NULL,
  `is_del` tinyint(1) NOT NULL,
  `visit_pro_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_visit_info
-- ----------------------------

/*
SQLyog Professional v12.08 (64 bit)
MySQL - 5.6.27 : Database - db_requisition_land
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_requisition_land` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_requisition_land`;

/*Table structure for table `tb_account` */

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

/*Data for the table `tb_account` */

insert  into `tb_account`(`id`,`account`,`pwd`,`name`,`state`,`org_id`,`dept_id`,`role_id`) values ('1cc25d76-2ecc-4fc5-8246-a5cd7c619c02','administrator','1234567','admin','3','62412b8e-5613-423c-9f1c-ceb4c2c0fcae',NULL,'98bab46f-ee49-4827-9470-ae1c6ab28f76'),('a90caf25-86fe-4543-83a5-a272add1a95f','test123','1234567','test','3','3465302d-94ca-4da1-a860-b28581b70a1b',NULL,'98bab46f-ee49-4827-9470-ae1c6ab28f76'),('e47733da-e575-4f74-be58-48d3f27aa6c9','test234','1234567','test','3','62412b8e-5613-423c-9f1c-ceb4c2c0fcae',NULL,'98bab46f-ee49-4827-9470-ae1c6ab28f76');

/*Table structure for table `tb_account_state` */

DROP TABLE IF EXISTS `tb_account_state`;

CREATE TABLE `tb_account_state` (
  `id` varchar(70) NOT NULL,
  `state_code` int(11) NOT NULL,
  `state_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `state_code` (`state_code`),
  UNIQUE KEY `state_name` (`state_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_account_state` */

/*Table structure for table `tb_address` */

DROP TABLE IF EXISTS `tb_address`;

CREATE TABLE `tb_address` (
  `id` varchar(70) NOT NULL,
  `title` varchar(50) NOT NULL,
  `pid` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_address` */

insert  into `tb_address`(`id`,`title`,`pid`) values ('61b01e3c-0940-4341-8462-91e158cd11ec','双流','7ab503ac-971d-4336-8f10-48898d45d450'),('63d05937-03c2-4e35-86f1-6686180df4fe','广东省',NULL),('69b726f0-26d0-43ef-b7b3-482d45270227','乐山市','72c43fd2-fadb-44bd-ada4-bc8dc07ab938'),('72c43fd2-fadb-44bd-ada4-bc8dc07ab938','四川省',NULL),('7ab503ac-971d-4336-8f10-48898d45d450','成都市','72c43fd2-fadb-44bd-ada4-bc8dc07ab938'),('9e251682-d0b9-467f-94d2-0368c46c28e4','江门市','63d05937-03c2-4e35-86f1-6686180df4fe'),('b5ec754c-7c8a-4689-8276-35384f4453a1','广州市','63d05937-03c2-4e35-86f1-6686180df4fe');

/*Table structure for table `tb_announcement` */

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

/*Data for the table `tb_announcement` */

insert  into `tb_announcement`(`id`,`announce_date`,`announce_number`,`file_path`,`pro_id`,`sequence`) values ('025be0f1-29b9-4168-83fd-9a1d0cadc274','2015-01-01',NULL,NULL,'a79a7c6f-1173-4416-9d7c-56802cfe4acf',2),('05de304e-45d0-49ac-aa91-afe514723c69','2015-01-02',NULL,NULL,'558c0d78-707c-44e1-ade0-671b58a79393',1),('0ad1fe55-84c7-45fc-a2c9-06cda080ef2a','2015-01-01',NULL,NULL,'7165662f-04f7-454c-8c09-4b75b685f866',2),('180b5939-c995-4a24-8c10-a37824d242c9','2016-01-17','002','nini.txt/uploadFile/policy_files/ac13006c-b76f-4b60-af27-aa9e096a3869.txt','15848f75-3141-45eb-aa2b-7fa1f1efd472',1),('1d4f8ffc-b516-44d9-bbd9-851b50f30559','2015-01-01',NULL,NULL,'7165662f-04f7-454c-8c09-4b75b685f866',3),('1e1642ad-1a54-4f22-8ef0-859b8be0a7be','2015-01-01',NULL,NULL,'8414eabd-4ca1-4d75-8dcf-4ffcd78f6633',3),('2e645b96-5c79-494e-902c-e716ada17dae','2015-01-01',NULL,NULL,'a79a7c6f-1173-4416-9d7c-56802cfe4acf',3),('32f05ae1-c627-49ad-b3c0-448c01776529','2015-01-01',NULL,NULL,'8414eabd-4ca1-4d75-8dcf-4ffcd78f6633',2),('37f4b3b4-3aff-479b-95c9-46a10302b1a2','2015-01-01',NULL,NULL,'7165662f-04f7-454c-8c09-4b75b685f866',1),('5508884a-2a91-44d6-8d99-5c482ff6e09f','2015-01-01',NULL,NULL,'5b73520e-bd28-439b-a0dd-fe8a3841891e',2),('552c540c-3344-413f-8fe3-b127222232e2','2015-01-01',NULL,NULL,'a79a7c6f-1173-4416-9d7c-56802cfe4acf',1),('5b973a01-cb95-4c72-b5f2-60c7b45f1f0f','2016-01-17','002',NULL,'0f24893f-beba-4010-8c58-5e30455a377b',1),('7b660d09-b247-44d9-8ef1-1209d677ecbd','2015-01-02',NULL,NULL,'c29daf49-5acf-49ec-9b1e-6d081d286d6c',1),('8731ca71-d293-4d14-9e0d-1c3871626f14','2015-01-02',NULL,NULL,'73d2eb24-07be-47a3-83a6-2775fef45521',1),('946dbf97-cb0e-4e65-8fbf-83987aea0c76','2015-01-01',NULL,NULL,'5b73520e-bd28-439b-a0dd-fe8a3841891e',3),('982d6487-fb64-471f-9b58-0e5af4625360','2015-01-02',NULL,NULL,'73d2eb24-07be-47a3-83a6-2775fef45521',2),('a1a0b9b7-1da6-4108-825b-d89a985ec3dc','2015-01-01',NULL,NULL,'5b73520e-bd28-439b-a0dd-fe8a3841891e',1),('a268654d-4c63-41c5-b51c-e2616fb48eee','2016-01-17','003',NULL,'98e56918-9f8f-4f88-9153-7c642d61f014',1),('a35fdfee-7732-4058-a11c-0f792790731e','2015-01-02',NULL,NULL,'558c0d78-707c-44e1-ade0-671b58a79393',3),('a6d43c74-e5ad-48f0-891b-ea0d5faee140','2015-01-02',NULL,NULL,'558c0d78-707c-44e1-ade0-671b58a79393',2),('b15f3ab4-7d79-4af3-a34a-541ee3b5e471','2015-01-02',NULL,NULL,'73d2eb24-07be-47a3-83a6-2775fef45521',3),('c6fb7f45-9956-4f0f-b8e4-df95b4187107','2015-01-02',NULL,NULL,'c29daf49-5acf-49ec-9b1e-6d081d286d6c',3),('cdda137b-224c-43cc-ac46-3e08ddd121fd','2015-01-02',NULL,NULL,'c29daf49-5acf-49ec-9b1e-6d081d286d6c',2),('e5c808d6-7b66-4ec9-9cb1-2bcf0799b759','2016-01-17','012',NULL,'0f24893f-beba-4010-8c58-5e30455a377b',2),('ea0b0868-8ed5-4464-a8e6-37c6f3e041b0','2015-01-01',NULL,NULL,'8414eabd-4ca1-4d75-8dcf-4ffcd78f6633',1);

/*Table structure for table `tb_archive_file` */

DROP TABLE IF EXISTS `tb_archive_file`;

CREATE TABLE `tb_archive_file` (
  `id` varchar(70) NOT NULL,
  `file_path` varchar(50) NOT NULL,
  `file_type_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_archive_file` */

/*Table structure for table `tb_archive_file_type` */

DROP TABLE IF EXISTS `tb_archive_file_type`;

CREATE TABLE `tb_archive_file_type` (
  `id` varchar(70) NOT NULL,
  `type_code` int(11) NOT NULL,
  `type_name` varchar(30) NOT NULL,
  `parent_file_id` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_archive_file_type` */

/*Table structure for table `tb_dept` */

DROP TABLE IF EXISTS `tb_dept`;

CREATE TABLE `tb_dept` (
  `id` varchar(70) NOT NULL,
  `dept_name` varchar(30) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  `org_id` varchar(70) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_dept` */

/*Table structure for table `tb_family` */

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

/*Data for the table `tb_family` */

insert  into `tb_family`(`id`,`head_name`,`pro_id`,`head_id`,`community_id`,`address`,`street_id`,`family_number`,`house_legal_area`,`house_illegal_area`,`situation_desc`,`deal_solution`,`union_suggestion`,`remark`,`house_img_path`,`pro_name`,`group_id`,`union_suggestion_path`) values ('037b2591-96fa-4ba6-8753-2ec4f1a0039e','小明','0f24893f-beba-4010-8c58-5e30455a377b','add64ea4-2ed0-4912-adf5-1fc79e629421','7ab503ac-971d-4336-8f10-48898d45d450','四川省成都市双流','72c43fd2-fadb-44bd-ada4-bc8dc07ab938',2,0,0,'批证及其他情况说明','拟定处理方案','联合会审意见','备注','','火星拆迁计划','61b01e3c-0940-4341-8462-91e158cd11ec',''),('08c785aa-2db4-4a5c-96e4-48e4e57078a8','张三','0f24893f-beba-4010-8c58-5e30455a377b','e8444b8a-df1e-409b-83e0-9c9547d8c3c3','7ab503ac-971d-4336-8f10-48898d45d450','四川省成都市双流','72c43fd2-fadb-44bd-ada4-bc8dc07ab938',4,125,0,NULL,'','','',NULL,'火星拆迁计划',NULL,NULL),('268304e4-c9e8-4812-9f07-728cb05481d3','head name','186fb4bc-1002-461c-b9ab-f2421efdb162','6ff10b8f-9c68-4f20-9f01-56f9cdf24207','7ab503ac-971d-4336-8f10-48898d45d450','四川省成都市双流','72c43fd2-fadb-44bd-ada4-bc8dc07ab938',5,126,0,'description','deal','union suggest','remark','img path','proname','7050b298-243f-4bc2-95c0-0c2782211f06','union path'),('2b082e0e-c875-4fc6-a56a-c2edfb5eb3e0','test','15848f75-3141-45eb-aa2b-7fa1f1efd472','d149e270-27bc-4e96-a93a-43e6edfc9f22','7ab503ac-971d-4336-8f10-48898d45d450','四川省成都市双流','72c43fd2-fadb-44bd-ada4-bc8dc07ab938',1,120,0,'','','','','','地球迁移计划','61b01e3c-0940-4341-8462-91e158cd11ec',''),('787531b0-b2c7-4888-97b6-6fca1754f5a5','贾建华','0f24893f-beba-4010-8c58-5e30455a377b','e56a5436-b243-4e36-b7e6-064accc166a1','7ab503ac-971d-4336-8f10-48898d45d450','四川省成都市双流','72c43fd2-fadb-44bd-ada4-bc8dc07ab938',0,3,3,'批证及其他情况说明','拟定处理方案','联合会审意见','备注','logo2.jpg/uploadFile/house_imgs/b01e6a26-37f6-4abf-b4fb-877c568a5d8f.jpg','火星拆迁计划',NULL,NULL),('a2b50b8d-215d-4847-ab5b-b46a79443ec5','习近平','0f24893f-beba-4010-8c58-5e30455a377b','db6225b7-5806-48e3-83b8-17cd498bfc6f','7ab503ac-971d-4336-8f10-48898d45d450','四川省成都市双流','72c43fd2-fadb-44bd-ada4-bc8dc07ab938',1,120,0,'','','','','','火星拆迁计划','61b01e3c-0940-4341-8462-91e158cd11ec',''),('d7bb918a-e5b4-472a-bf50-cba7b291ea4d','head name','40c9a003-7547-4d31-973f-a230ad459ff3','68514fa1-8ea3-47db-9d1b-bcf4b4b27911','7ab503ac-971d-4336-8f10-48898d45d450','四川省成都市双流','72c43fd2-fadb-44bd-ada4-bc8dc07ab938',5,111,0,'description','deal','union suggest','remark','img path','proname','16736dcc-92a8-4dd9-a4da-c33fb0a39b16','union path');

/*Table structure for table `tb_family_familyitem` */

DROP TABLE IF EXISTS `tb_family_familyitem`;

CREATE TABLE `tb_family_familyitem` (
  `id` varchar(70) NOT NULL,
  `family_id` varchar(70) NOT NULL,
  `family_item_id` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_family_familyitem` */

/*Table structure for table `tb_family_item` */

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

/*Data for the table `tb_family_item` */

insert  into `tb_family_item`(`id`,`address`,`name`,`id_number`,`birthday`,`gender`,`relationship`,`household_type`,`only_child_number`,`is_half`,`relationship_id`,`household_type_Id`,`street_id`,`community_id`,`pro_id`,`fml_id`,`pro_name`,`is_removed`,`is_transferd`,`is_socialsecurity`,`socialsecurity_str`,`education_level`,`current_education_situation`,`farming_time`,`serve_army_situation`,`group_id`,`tel`,`used_socialsecurity`,`remark`) values ('4da544da-1c64-427c-a3f5-4a7d26bd228b','四川省成都市双流','张琳','511524151214521451','2016-01-02',0,'女儿','城镇户口',NULL,1,NULL,'5da70074-f9d4-477d-b1f1-d687601a1e03','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','0f24893f-beba-4010-8c58-5e30455a377b','08c785aa-2db4-4a5c-96e4-48e4e57078a8','火星拆迁计划',0,0,0,NULL,'博士','在读','6年','2015-12至2018-13',NULL,'19999999699',1,NULL),('87518576-9f0c-4002-8ed4-ca390d90390e','四川省成都市双流','白万才','55555555555555555555','2016-01-18',0,'儿子','城镇户口','100101041',0,'be11c8fe-3c4c-4caa-9cbc-e97b00cb8822','5da70074-f9d4-477d-b1f1-d687601a1e03','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','0f24893f-beba-4010-8c58-5e30455a377b','787531b0-b2c7-4888-97b6-6fca1754f5a5','火星拆迁计划',0,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('8ad0c658-7ef7-4a83-b9fd-cdb1f5513975','四川省成都市双流','name','21512451445','2016-01-18',0,'relationship str','城镇户口','12255',0,'4a16f689-3ada-4e9f-9879-783d34b3b9eb','5da70074-f9d4-477d-b1f1-d687601a1e03','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','10f711f7-fae3-49a0-9203-5cd83c1524da','d7bb918a-e5b4-472a-bf50-cba7b291ea4d','pro name',0,0,0,NULL,'受教育程度','受教育情况','20','v','64ddffae-6f98-489a-973c-66039cde2909','tel',1,NULL),('adc3ab14-8ddc-49c2-bf46-de0d79f03a40','四川省成都市双流','张武','511524151214521452','2016-01-01',0,'儿子','城镇户口',NULL,0,'be11c8fe-3c4c-4caa-9cbc-e97b00cb8822','5da70074-f9d4-477d-b1f1-d687601a1e03','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','0f24893f-beba-4010-8c58-5e30455a377b','08c785aa-2db4-4a5c-96e4-48e4e57078a8','火星拆迁计划',0,1,1,NULL,'博士','在读','5年','2015-12至2018-12',NULL,'19999999699',1,NULL),('add64ea4-2ed0-4912-adf5-1fc79e629421','四川省成都市双流','小明','58774747777777777777','2016-01-22',1,'户主','农业户口','2263564',1,'fcd8df9a-c001-4ca6-bc4a-dee7d219335a','b65e5365-1acb-4f82-b858-3d9d54ed27fc','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','0f24893f-beba-4010-8c58-5e30455a377b','037b2591-96fa-4ba6-8753-2ec4f1a0039e','火星拆迁计划',0,1,1,NULL,'小学','不读','9年','2011/11/11至2012','61b01e3c-0940-4341-8462-91e158cd11ec','2554223545',1,'备注'),('b653da3e-f4dc-4d94-9065-7a4870dbe266','四川省成都市双流','小东','12545299999999999999','2016-01-22',0,'儿子','农业户口','4525641',0,'be11c8fe-3c4c-4caa-9cbc-e97b00cb8822','b65e5365-1acb-4f82-b858-3d9d54ed27fc','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','0f24893f-beba-4010-8c58-5e30455a377b','037b2591-96fa-4ba6-8753-2ec4f1a0039e','火星拆迁计划',0,0,0,NULL,'大学','在读','1年','2010/12/1至2013/8/9','61b01e3c-0940-4341-8462-91e158cd11ec','2685485855',1,'备注'),('b86c81ee-e89f-4d67-89fb-138ab7169b53','四川省成都市双流','李倩','511524151214521453','2016-01-03',0,'妻子','城镇户口',NULL,0,'26da7b11-cfd4-401c-b34d-692c051845d5','5da70074-f9d4-477d-b1f1-d687601a1e03','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','0f24893f-beba-4010-8c58-5e30455a377b','08c785aa-2db4-4a5c-96e4-48e4e57078a8','火星拆迁计划',0,1,1,NULL,'博士','在读','7年','2015-12至2018-14',NULL,'19999996999',1,NULL),('d149e270-27bc-4e96-a93a-43e6edfc9f22','四川省成都市双流','test','123456789011001011','2016-01-21',0,'户主','农业户口','0012',0,'fcd8df9a-c001-4ca6-bc4a-dee7d219335a','b65e5365-1acb-4f82-b858-3d9d54ed27fc','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','15848f75-3141-45eb-aa2b-7fa1f1efd472','2b082e0e-c875-4fc6-a56a-c2edfb5eb3e0','地球迁移计划',0,0,0,NULL,'本科','毕业','10','2015-2016','61b01e3c-0940-4341-8462-91e158cd11ec','15202525252',1,''),('db6225b7-5806-48e3-83b8-17cd498bfc6f','四川省成都市双流','习近平','88888888888888888888','2016-01-20',0,'户主','城镇户口','',1,'fcd8df9a-c001-4ca6-bc4a-dee7d219335a','5da70074-f9d4-477d-b1f1-d687601a1e03','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','0f24893f-beba-4010-8c58-5e30455a377b','a2b50b8d-215d-4847-ab5b-b46a79443ec5','火星拆迁计划',0,1,1,NULL,'研究生','毕业','10','0','61b01e3c-0940-4341-8462-91e158cd11ec','18888888888',0,'习近平的信息'),('e56a5436-b243-4e36-b7e6-064accc166a1','四川省成都市双流','贾建华','51152455555555555555','2016-01-18',0,'户主','城镇户口','',0,'fcd8df9a-c001-4ca6-bc4a-dee7d219335a','5da70074-f9d4-477d-b1f1-d687601a1e03','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','0f24893f-beba-4010-8c58-5e30455a377b','787531b0-b2c7-4888-97b6-6fca1754f5a5','火星拆迁计划',0,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('e8444b8a-df1e-409b-83e0-9c9547d8c3c3','四川省成都市双流','张三','511524151214521459','2016-01-03',0,'户主','城镇户口',NULL,0,'fcd8df9a-c001-4ca6-bc4a-dee7d219335a','5da70074-f9d4-477d-b1f1-d687601a1e03','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','0f24893f-beba-4010-8c58-5e30455a377b','08c785aa-2db4-4a5c-96e4-48e4e57078a8','火星拆迁计划',0,1,1,NULL,'博士','在读','7年','2015-12至2018-14',NULL,'19999996999',1,NULL);

/*Table structure for table `tb_household_type` */

DROP TABLE IF EXISTS `tb_household_type`;

CREATE TABLE `tb_household_type` (
  `id` varchar(70) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_household_type` */

insert  into `tb_household_type`(`id`,`type_name`) values ('b65e5365-1acb-4f82-b858-3d9d54ed27fc','农业户口'),('5da70074-f9d4-477d-b1f1-d687601a1e03','城镇户口');

/*Table structure for table `tb_housepurchase_ticket` */

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

/*Data for the table `tb_housepurchase_ticket` */

insert  into `tb_housepurchase_ticket`(`id`,`bonus`,`make_date`,`ticket_state_id`,`ticket_number`,`is_del`,`name`,`fml_item_id`,`id_number`) values ('67304c57-14c5-4cfb-9b18-8588cfb2b178',12,'2016-01-22','6','10',0,'小明','add64ea4-2ed0-4912-adf5-1fc79e629421','58774747777777777777'),('786bcc2a-8436-41a9-bfe8-f68d54d6c62b',1011.22,'2016-01-20','6','解决',0,'张琳','4da544da-1c64-427c-a3f5-4a7d26bd228b','511524151214521451'),('90dc4200-dc64-40dc-b0f3-01613942db6b',120,'2016-01-20','6','#001',0,'白万才','787531b0-b2c7-4888-97b6-6fca1754f5a5','55555555555555555555'),('a2c99d1e-e605-4ff8-ba45-d5c08a274d16',20,'2016-01-20','6','#002',0,'张武','08c785aa-2db4-4a5c-96e4-48e4e57078a8','511524151214521452'),('b09bd99c-3a08-4978-a7a2-e4f57a597e10',200,'2016-01-20','5','#003',0,'贾建华','e56a5436-b243-4e36-b7e6-064accc166a1','51152455555555555555'),('b9968d00-1828-4b8b-b025-ea8e8008750f',1200,'2016-01-21','6','#023121',0,'习近平','db6225b7-5806-48e3-83b8-17cd498bfc6f','88888888888888888888');

/*Table structure for table `tb_operation_record` */

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

/*Data for the table `tb_operation_record` */

insert  into `tb_operation_record`(`id`,`ip`,`time`,`moudle`,`action`,`content`,`mac`,`name`,`moudle_id`,`account_id`) values ('2d237ef7-2dd4-409a-a24b-2b36ebfc510c','192.168.1.4','2016-01-15','??','?','Admin?',NULL,'Admin','51d4ebf1-e491-41eb-92a9-a5274f7df831','51d4ebf1-e491-41eb-92a9-a5274f7df831'),('511793ca-ae18-4e71-b50b-cd917957f323','192.168.1.4','2016-01-15','????','????','??Admin??',NULL,'Admin','51d4ebf1-e491-41eb-92a9-a5274f7df831','51d4ebf1-e491-41eb-92a9-a5274f7df831'),('5d3589bc-5736-4ebc-a4a1-e1232203bf35','192.168.1.4','2016-01-15','??','?','Admin?',NULL,'Admin','51d4ebf1-e491-41eb-92a9-a5274f7df831','51d4ebf1-e491-41eb-92a9-a5274f7df831'),('74de8141-850f-4aa8-b375-2607ce980378','192.168.1.4','2016-01-15','??','?','Admin?',NULL,'Admin','51d4ebf1-e491-41eb-92a9-a5274f7df831','51d4ebf1-e491-41eb-92a9-a5274f7df831'),('9e7a5ea1-547e-45d3-be18-838a2476f9cd','192.168.1.4','2016-01-15','�˺Ź���','�����˺�','����Admin�˺�',NULL,'Admin','51d4ebf1-e491-41eb-92a9-a5274f7df831','51d4ebf1-e491-41eb-92a9-a5274f7df831'),('abc2c38b-7484-495b-b16f-fd25c012432b','192.168.1.4','2016-01-15','??','?','Admin?',NULL,'Admin','51d4ebf1-e491-41eb-92a9-a5274f7df831','51d4ebf1-e491-41eb-92a9-a5274f7df831'),('f5cf3fa7-5d6a-44cc-af57-268cd826f59e','192.168.1.4','2016-01-15','????','????','??Admin??',NULL,'Admin','51d4ebf1-e491-41eb-92a9-a5274f7df831','51d4ebf1-e491-41eb-92a9-a5274f7df831'),('fbccbc80-5d31-45f1-8b4a-3a44a620d71b','192.168.1.4','2016-01-15','??','?','Admin?',NULL,'Admin','51d4ebf1-e491-41eb-92a9-a5274f7df831','51d4ebf1-e491-41eb-92a9-a5274f7df831'),('fce76747-2aac-441f-9471-1e4b4d02da87','192.168.1.4','2016-01-15','账号管理','新增账号','新增Admin账号',NULL,'Admin','51d4ebf1-e491-41eb-92a9-a5274f7df831','51d4ebf1-e491-41eb-92a9-a5274f7df831');

/*Table structure for table `tb_org` */

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

/*Data for the table `tb_org` */

insert  into `tb_org`(`id`,`org_name`,`is_del`,`org_number`) values ('62412b8e-5613-423c-9f1c-ceb4c2c0fcae','FBI',0,'001');

/*Table structure for table `tb_permission` */

DROP TABLE IF EXISTS `tb_permission`;

CREATE TABLE `tb_permission` (
  `id` varchar(70) NOT NULL,
  `res_id` varchar(70) NOT NULL,
  `role_id` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_permission` */

insert  into `tb_permission`(`id`,`res_id`,`role_id`) values ('07c26c29-c214-450f-a4d4-bf110f8e4da2','584358c1-0e68-46ee-a099-10e654ca3191','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('0a4c59f6-a52c-4d65-bdb1-69a72faa2c1e','598a9f57-4d74-4dca-b63f-b879b4436fae','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('11d1d7ef-a9d6-4a80-9e19-af51787154f5','b9229f63-b658-4280-a609-16da8bcce156','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('16d9764e-6acf-4d5a-b4ad-46f065ab7c2a','9ea4e2e6-21c1-4f72-962b-5faae74252b3','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('18b912ad-8b3e-42d7-8887-cd8e2d51943d','eb106090-a2d1-462c-a371-bb935a93ed2d','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('1aa0da8c-5629-4d15-8342-a050b794cdbd','99a49750-a414-4e06-be6a-dc7aa15c3c12','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('1ea9f36a-e59e-42b1-afc7-9fcf21d4ce7f','ef7420c3-0a6f-4667-827d-cb4aa55f0efc','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('1f859c81-3868-46f9-88ee-6ae78fe61dcf','64d6e9fc-b4aa-4a12-90ef-59f077b6c073','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('20d1d0e6-55e0-4c92-a426-b139acd090d4','bac2388a-3e8c-494f-8525-62c2a3370229','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('279913d6-872e-4aad-a5e8-a1b02d0b9ba0','a538004f-b6b2-48e3-8fcb-8ba000a3019a','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('27b3b980-faf2-4676-b4a3-c03d4a5239f3','31444c7b-38bf-4f77-9f26-528ef4cd292e','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('2cb2ab29-bf15-4d2f-9077-7d5a2a47db20','3c2f65ad-a8e8-4978-a5c5-b83b5b3afccf','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('347c8633-711b-4287-82c5-a5d2308c28e2','be769d24-1b19-472a-9f68-fc82c800ad29','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('3b90777f-8853-4b10-b0b3-4767e7cfaf42','1151395a-7d71-40ce-9435-a24167186175','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('3ecfd88f-2cd5-4647-86f9-dffca2015c99','611cb245-07af-4c20-9712-9e74ce22ccd1','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('43266007-8b69-48a1-81eb-4efab41d8c8d','7ec96129-09ab-413c-924f-6c25aa32d25e','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('4861c82c-b82d-4090-a94b-5511c9032d6d','6f706e28-face-42ee-8978-89ba36751d78','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('4b5a5b48-3a81-4922-b13c-0ea0046409cd','d78b0a7a-3014-4f20-8fe6-b4b86441995e','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('5c8cb7da-764d-414d-999d-1c7a0269a0fc','9349a42d-2b03-4370-8b77-04a39f2caa5d','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('66ce3e11-0579-4932-bb41-8972fd2041ea','15633e32-a4cc-4c43-9a92-e2089467d423','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('6ef48072-e302-42f6-ba43-623127308c1b','591d7a48-3d07-4072-8f75-bc8bf8bd7d88','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('78146455-0af0-42c3-864f-f3a7e3d134b6','e746da4a-c40f-409b-9130-270e372efb04','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('792344a1-a434-4041-b501-ca0b89a4bb4d','cb7d46b0-25f2-4a2d-b021-4032d209951b','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('7ad1a44d-1218-425e-8b5f-1b1a8dceb83d','6b3dac14-8116-4aad-8643-c54821ebf93c','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('84888662-2e1b-4661-aaa2-af7b05c103c6','8b774553-e40a-48e6-858e-c37a8d7751f3','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('89120fa6-db7d-4503-9f0d-483fed742b96','2e27e9cc-b43c-4c3a-8134-cc2d3631b7ef','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('8a9a6a70-0ec6-43f7-a8a8-4390dca915fd','d78127f1-4573-434e-bbce-95cbb6e27b37','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('9174c588-0cf7-4493-ae27-c583f1b2b3cb','fabf3a8a-153b-421f-9ba4-d531807f8c6a','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('953fe9ef-b5c0-4e38-9d88-e72c2089ea52','8502199d-390e-49e1-a37a-43b5677bc705','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('a34307ec-1e29-4e5f-a666-e76a3ab774b0','66b23947-9c39-48a2-817e-0791a93a5ccf','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('a7358728-8fee-4239-9bae-74d4f4e2aa2d','66a87ece-4473-4db4-97df-97cfded49049','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('ab3ab251-c61d-43bc-855f-491727885c7f','291ddf56-70b7-4917-97c1-85e2a032e362','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('ae744470-8f1c-4e47-bd58-71968d9a704f','635a3873-75b5-4725-8391-2cecfc448714','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('b1587995-c936-487f-901f-17a83282ff5c','af147a27-2b7e-4c62-bb3c-b9dbffe97c14','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('c0dc5b42-cdae-4dcb-8621-117c7606332f','0e3827d5-fa84-4aed-983a-b290da99052f','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('d44b27bd-506c-4978-9584-922e890f8cac','6c95c954-584f-4bbc-a583-04d2420b8174','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('d592ab50-6715-49e2-a06c-feab630825a1','8748319a-7534-4449-8148-1a216b585cb0','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('d960bdd1-6f2c-44fc-871d-284918a73dd9','fc50914f-aa91-4bf8-b196-f889ddf34784','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('dc2e0a18-51ab-48b4-b5e3-a8c51f760487','24761d7a-3b15-49ff-adb1-0bf1ad9e7c05','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('e1923d46-3dbe-43b9-80b1-0dcfdc6117e0','87428992-c17a-4e50-bb12-d325e7e428e3','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('e6bc8cfd-ff72-4fd8-9944-f792d408870b','fd190a39-295f-4491-a020-f4f2cf5f58a4','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('ed2f6845-f09b-4cb9-90e1-5bcddc6bb403','a594059d-f3bf-42c7-bb8d-5654c999e1af','98bab46f-ee49-4827-9470-ae1c6ab28f76'),('f13028bc-0623-43de-886a-7a68d7250d01','cb027978-ae93-4c48-a88b-91d3b67766e0','98bab46f-ee49-4827-9470-ae1c6ab28f76');

/*Table structure for table `tb_policy_type` */

DROP TABLE IF EXISTS `tb_policy_type`;

CREATE TABLE `tb_policy_type` (
  `id` varchar(70) NOT NULL,
  `type_code` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_code` (`type_code`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_policy_type` */

/*Table structure for table `tb_project` */

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

/*Data for the table `tb_project` */

insert  into `tb_project`(`id`,`pro_name`,`approval_number`,`requisition_area`,`should_remove_buildings`,`should_remove_houses`,`should_remove_legal_area`,`should_remove_Illegal_area`,`should_remove_population`,`should_pay_money`,`total_paid_money`,`start_date`,`pro_type`,`street_id`,`community_id`,`total_address`,`is_new`,`sequence`,`requisition_land_area_total`,`requisition_land_area_year`,`removed_buildings_legal_total`,`removed_buildings_legal_year`,`removed_houses_legal_total`,`removed_houses_legal_year`,`removed_area_legal_total`,`removed_area_legal_year`,`removed_area_illegal_total`,`removed_area_illegal_year`,`removed_population_total`,`removed_population_year`) values ('0f24893f-beba-4010-8c58-5e30455a377b','火星拆迁计划','#001',10,10,10,10,10,10,'100.000000','0.000000',NULL,'2','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','四川省成都市',0,2,1,1,1,1,1,1,1,1,1,1,1,1),('15848f75-3141-45eb-aa2b-7fa1f1efd472','地球迁移计划','#002',12,12,12,12,12,12,'12.000000','1.000000','2016-01-03','1','63d05937-03c2-4e35-86f1-6686180df4fe','b5ec754c-7c8a-4689-8276-35384f4453a1','广东省广州市,天河区10号',0,1,9.9996,9.9996,10,10,9,9,9.9996,9.9996,9.9996,9.9996,9,9),('558c0d78-707c-44e1-ade0-671b58a79393','导入-项目名称3','#006',21,21,21,21,21,21,'21.000000','0.000000','2015-01-02','2',NULL,NULL,'用地位置',0,3,21,21,21,21,21,21,21,21,21,21,21,21),('5b73520e-bd28-439b-a0dd-fe8a3841891e','导入-项目名称1','#004',20,20,20,20,20,20,'20.000000','20.000000','2015-01-01','1',NULL,NULL,'用地位置',0,3,50,50,50,50,50,50,50,50,50,50,50,50),('7165662f-04f7-454c-8c09-4b75b685f866','导入-项目名称4','#007',20,20,20,20,20,20,'20.000000','7.000000','2015-01-01','1',NULL,NULL,'用地位置',0,3,51,51,51,51,51,51,51,51,51,51,51,51),('73d2eb24-07be-47a3-83a6-2775fef45521','导入-项目名称7','#010',21,21,21,21,21,21,'21.000000','0.000000','2015-01-02','2',NULL,NULL,'用地位置',0,3,42,42,42,42,42,42,42,42,42,42,42,42),('8414eabd-4ca1-4d75-8dcf-4ffcd78f6633','导入-项目名称6','#009',20,20,20,20,20,20,'20.000000','0.000000','2015-01-01','1',NULL,NULL,'用地位置',0,3,30,30,40,40,40,40,40,40,40,40,40,40),('98e56918-9f8f-4f88-9153-7c642d61f014','金星拆迁计划','#003',50,50,50,50,50,50,'50.000000','0.000000',NULL,'1','63d05937-03c2-4e35-86f1-6686180df4fe','b5ec754c-7c8a-4689-8276-35384f4453a1','广东省广州市',0,1,0,0,0,0,0,0,0,0,0,0,0,0),('a79a7c6f-1173-4416-9d7c-56802cfe4acf','导入-项目名称2','#005',20,20,20,20,20,20,'20.000000','0.000000','2015-01-01','1',NULL,NULL,'用地位置',0,3,40,40,40,40,40,40,40,40,40,40,40,40),('c29daf49-5acf-49ec-9b1e-6d081d286d6c','导入-项目名称5','#008',21,21,21,21,21,21,'21.000000','0.000000','2015-01-02','2',NULL,NULL,'用地位置',0,3,42,42,42,42,42,42,42,42,42,42,42,42);

/*Table structure for table `tb_project_item` */

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

/*Data for the table `tb_project_item` */

insert  into `tb_project_item`(`id`,`item_date`,`removed_buildings`,`removed_houses`,`removed_legal_area`,`removed_illegal_area`,`moved_populations`,`paid_money`,`year_deadline_file`,`year_court_execute`,`year_legal_removed`,`is_new_start`,`removed_land_area`,`pro_id`) values ('06d5418b-400f-410e-b1d4-3fad4e2321d8','2016-02-01',1,1,1,1,1,'4.000000',1,1,1,0,1,'7165662f-04f7-454c-8c09-4b75b685f866'),('16ee0089-733c-4e4b-a4d8-65aa242eb5e8','2015-01-01',20,20,20,20,20,'3.000000',20,20,20,0,20,'7165662f-04f7-454c-8c09-4b75b685f866'),('5600f118-122a-4eca-9520-4751ec4f0a7a','2016-01-01',10,9,9.9996,9.9996,9,'1.000000',1,1,1,0,9.9996,'15848f75-3141-45eb-aa2b-7fa1f1efd472'),('7e73e023-f870-4ab7-8d82-22b3d41bea77','2015-01-01',20,20,20,20,20,'0.000000',20,20,20,0,10,'8414eabd-4ca1-4d75-8dcf-4ffcd78f6633'),('81f580a2-9a10-4a3e-abe9-e180b0a0b40a','2016-01-01',1,1,1,1,1,'1.000000',1,1,3,0,1,'0f24893f-beba-4010-8c58-5e30455a377b'),('9ac05d37-1197-4191-980c-8c4e15f05721','2016-01-01',10,10,10,10,10,'3.000000',1,1,1,0,10,'7165662f-04f7-454c-8c09-4b75b685f866'),('9b829377-a85e-4a7c-b7bd-930ec7473a7b','2015-01-01',20,20,20,20,20,NULL,20,20,20,0,20,'5b73520e-bd28-439b-a0dd-fe8a3841891e'),('a0c61d4b-7d62-408d-b3c7-5e89adcaf1fe','2016-01-01',10,10,10,10,10,'0.000000',3,3,3,0,10,'5b73520e-bd28-439b-a0dd-fe8a3841891e'),('a65ee10c-04af-4608-a90f-c5200308d153','2015-02-01',20,20,20,20,20,'7.000000',20,20,201,0,20,'a79a7c6f-1173-4416-9d7c-56802cfe4acf'),('d874b2e1-e808-4800-89f4-fde1a6e7e1a6','2015-01-01',21,21,21,21,21,'0.000000',21,21,21,0,21,'73d2eb24-07be-47a3-83a6-2775fef45521'),('ea905e0f-c2f6-46f9-9523-f4960b8850c9','2015-01-01',21,21,21,21,21,'7.000000',21,21,21,0,21,'c29daf49-5acf-49ec-9b1e-6d081d286d6c');

/*Table structure for table `tb_registed_argc_info` */

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

/*Data for the table `tb_registed_argc_info` */

/*Table structure for table `tb_relationship_type` */

DROP TABLE IF EXISTS `tb_relationship_type`;

CREATE TABLE `tb_relationship_type` (
  `id` varchar(70) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_relationship_type` */

insert  into `tb_relationship_type`(`id`,`type_name`) values ('be11c8fe-3c4c-4caa-9cbc-e97b00cb8822','儿子'),('26da7b11-cfd4-401c-b34d-692c051845d5','妻子'),('fcd8df9a-c001-4ca6-bc4a-dee7d219335a','户主');

/*Table structure for table `tb_removed_info` */

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

/*Data for the table `tb_removed_info` */

/*Table structure for table `tb_report_of_loss` */

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

/*Data for the table `tb_report_of_loss` */

/*Table structure for table `tb_resource` */

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

/*Data for the table `tb_resource` */

insert  into `tb_resource`(`id`,`res_type`,`resource_order`,`is_del`,`icon`,`link`,`parent_res_id`,`path`,`has_children`,`html_id`,`html`,`hierarchy`,`title`,`moudle`) values ('0e3827d5-fa84-4aed-983a-b290da99052f',0,4,0,'icon','#housePurchaseMansgement/hptUseAndCash','6b3dac14-8116-4aad-8643-c54821ebf93c','',1,'','',0,'购房券的使用与兑现',''),('1024d946-439f-4c31-9f95-d975091ef84a',0,2,0,'icon','#management/registedAgrcInfoQuery','1ba39037-689f-4bd8-8d0d-446c376567a3','',1,'','',0,'在籍农业人口回收站','admin'),('1151395a-7d71-40ce-9435-a24167186175',0,8,0,'icon','',NULL,'',1,'','',0,'在籍农业人口管理管理',''),('15633e32-a4cc-4c43-9a92-e2089467d423',0,3,0,'icon','#housePurchaseMansgement/hptSet','6b3dac14-8116-4aad-8643-c54821ebf93c','',1,'','',0,'购房券户发放',''),('1ba39037-689f-4bd8-8d0d-446c376567a3',0,16,0,'icon','',NULL,'',1,'','',0,'回收站','admin'),('24761d7a-3b15-49ff-adb1-0bf1ad9e7c05',0,1,0,'icon','#housePurchaseMansgement/hptAdd','6b3dac14-8116-4aad-8643-c54821ebf93c','',1,'','',0,'录入购房券信息',''),('291ddf56-70b7-4917-97c1-85e2a032e362',0,2,0,'icon','#removedDocManagement/removedInfoQuery','bac2388a-3e8c-494f-8525-62c2a3370229','',1,'','',0,'维护已迁户信息',''),('2e27e9cc-b43c-4c3a-8134-cc2d3631b7ef',0,2,0,'icon','#socialSecurityMansgement/solmInfoBatch','8502199d-390e-49e1-a37a-43b5677bc705','',1,'','',0,'批量处理社保信息',''),('30513a9c-e72b-4dfb-b765-e4b4e9392e74',0,1,0,'icon','#management/sysCreateAccount','3b42ceb2-890e-4ce7-b996-7f5227be4c44','',1,'','',0,'新增人员信息','admin'),('31444c7b-38bf-4f77-9f26-528ef4cd292e',0,12,0,'icon','',NULL,'',1,'','',0,'查询统计',''),('32f581e4-a47e-444b-bfd8-371d09972061',0,11,0,'icon','',NULL,'',1,'','',0,'单位管理','admin'),('3b42ceb2-890e-4ce7-b996-7f5227be4c44',0,9,0,'icon','',NULL,'',1,'','',0,'人员信息管理','admin'),('3c2f65ad-a8e8-4978-a5c5-b83b5b3afccf',0,3,0,'icon','#projectManagement/pmQueryPro','a538004f-b6b2-48e3-8fcb-8ba000a3019a','',1,'','',0,'查询项目台账',''),('42e3806c-47d2-4e7b-aff9-b32f1180c63f',0,10,0,'icon','',NULL,'',1,'','',0,'角色/权限管理','admin'),('44fb3f75-3a7b-468c-a28f-1b162d2ba5e7',0,1,0,'icon','#management/sysLog','61cdf89c-7ab4-4bd1-8356-37ef33801980','',1,'','',0,'维护系统日志','admin'),('4b1ee9ed-f9dc-4372-96ab-ea976a585cd7',0,2,0,'icon','#management/sysAccountQuery','3b42ceb2-890e-4ce7-b996-7f5227be4c44','',1,'','',0,'维护人员信息','admin'),('53907546-4c20-4277-8022-5113c62e0d29',0,1,0,'icon','#management/sysPermission','42e3806c-47d2-4e7b-aff9-b32f1180c63f','',1,'','',0,'分配权限','admin'),('584358c1-0e68-46ee-a099-10e654ca3191',0,2,0,'icon','#docFileManagement/fileMListAdd','9349a42d-2b03-4370-8b77-04a39f2caa5d','',1,'','',0,' 添加政策法规文件',''),('591d7a48-3d07-4072-8f75-bc8bf8bd7d88',0,1,0,'icon','#supervisionManagement/infoSummary','ef7420c3-0a6f-4667-827d-cb4aa55f0efc','',1,'','',0,'综合浏览',''),('598a9f57-4d74-4dca-b63f-b879b4436fae',0,1,0,'icon','#projectManagement/pmAddPro','a538004f-b6b2-48e3-8fcb-8ba000a3019a','',1,'','',0,'录入项目信息',''),('59a89bdc-7b88-4bd9-a593-1dae0d49dc16',0,1,0,'icon','#management/sysDataDict','b3f9ca24-2786-4253-8d70-faf8db7744eb','',1,'','',0,'维护数据字典','admin'),('611cb245-07af-4c20-9712-9e74ce22ccd1',0,1,0,'icon','#onekeyQuery/onekeyQuery','ef7420c3-0a6f-4667-827d-cb4aa55f0efc',NULL,1,NULL,NULL,0,'一键查询',''),('61a1dfdb-8a3f-4df5-94ce-aa1b848a1608',0,2,0,'icon','#management/sysRoleManage','42e3806c-47d2-4e7b-aff9-b32f1180c63f','',1,'','',0,'角色管理','admin'),('61cdf89c-7ab4-4bd1-8356-37ef33801980',0,15,0,'icon','',NULL,'',1,'','',0,'系统日志管理','admin'),('635a3873-75b5-4725-8391-2cecfc448714',0,2,0,'icon','#registedInfoManagement/queryRegistedInfo','1151395a-7d71-40ce-9435-a24167186175','',1,'','',0,'维护在籍农业人口信息',''),('64d6e9fc-b4aa-4a12-90ef-59f077b6c073',0,3,0,'icon','#transferAccountManagement/taQuery','d78b0a7a-3014-4f20-8fe6-b4b86441995e','',1,'','',0,'查询转户台账',''),('66a87ece-4473-4db4-97df-97cfded49049',0,8,0,'icon','#housePurchaseMansgement/hptIssue','6b3dac14-8116-4aad-8643-c54821ebf93c','',1,'','',0,'购房券户发放台账',''),('66b23947-9c39-48a2-817e-0791a93a5ccf',0,1,0,'icon','#statistics/statistics','31444c7b-38bf-4f77-9f26-528ef4cd292e','',1,'','',0,'查询统计',''),('6b3dac14-8116-4aad-8643-c54821ebf93c',0,4,0,'icon','',NULL,'',1,'','',0,'购房券管理',''),('6c95c954-584f-4bbc-a583-04d2420b8174',0,3,0,'icon','#docFileManagement/fileMListMsg','9349a42d-2b03-4370-8b77-04a39f2caa5d','',1,'','',0,' 政策法规文件维护',''),('6f706e28-face-42ee-8978-89ba36751d78',0,1,0,'icon','#docFileManagement/fileMList','9349a42d-2b03-4370-8b77-04a39f2caa5d','',1,'','',0,' 在线浏览政策法规',''),('7ec96129-09ab-413c-924f-6c25aa32d25e',0,2,0,'icon','#projectManagement/listRemoved','be769d24-1b19-472a-9f68-fc82c800ad29','',1,'','',0,'拆迁户人员信息台账',''),('8502199d-390e-49e1-a37a-43b5677bc705',0,3,0,'icon','',NULL,'',1,'','',0,'社保管理',''),('87428992-c17a-4e50-bb12-d325e7e428e3',0,2,0,'icon','#housePurchaseMansgement/hptSetPerson','6b3dac14-8116-4aad-8643-c54821ebf93c','',1,'','',0,'购房券个人发放',''),('8748319a-7534-4449-8148-1a216b585cb0',0,1,0,'icon','#registedInfoManagement/addRegistedInfo','1151395a-7d71-40ce-9435-a24167186175','',1,'','',0,'录入在籍农业人口信息',''),('8b774553-e40a-48e6-858e-c37a8d7751f3',0,5,0,'icon','#housePurchaseMansgement/hptExchange','6b3dac14-8116-4aad-8643-c54821ebf93c','',1,'','',0,'购房券换发',''),('9349a42d-2b03-4370-8b77-04a39f2caa5d',0,13,0,'icon','',NULL,'',1,'','',0,'档案文件管理',''),('99a49750-a414-4e06-be6a-dc7aa15c3c12',0,4,0,'icon','#socialSecurityMansgement/solmQuery','8502199d-390e-49e1-a37a-43b5677bc705','',1,'','',0,'查询社保台账',''),('9deeaa35-124a-42e2-87d3-cdcd57fbb9ad',0,1,0,'icon','#management/sysOrgManagement','32f581e4-a47e-444b-bfd8-371d09972061','',1,'','',0,'维护单位信息','admin'),('9ea4e2e6-21c1-4f72-962b-5faae74252b3',0,2,0,'icon','#transferAccountManagement/taInfoBatch','d78b0a7a-3014-4f20-8fe6-b4b86441995e','',1,'','',0,'批量新增转户信息',''),('a538004f-b6b2-48e3-8fcb-8ba000a3019a',0,0,0,'icon','',NULL,'',1,'','',0,'项目管理',''),('a594059d-f3bf-42c7-bb8d-5654c999e1af',0,2,0,'icon','#messageManagement/visitQuery','e746da4a-c40f-409b-9130-270e372efb04','',1,'','',0,'维护信访信息',''),('af147a27-2b7e-4c62-bb3c-b9dbffe97c14',0,1,0,'icon','#removedDocManagement/removedInfoAdd','bac2388a-3e8c-494f-8525-62c2a3370229','',1,'','',0,'录入已迁户人员信息',''),('b3f9ca24-2786-4253-8d70-faf8db7744eb',0,14,0,'icon','',NULL,'',1,'','',0,'数据字典管理','admin'),('b9229f63-b658-4280-a609-16da8bcce156',0,1,0,'icon','#projectManagement/uploadRemoveInfo','be769d24-1b19-472a-9f68-fc82c800ad29',NULL,1,NULL,NULL,0,'录入拆迁户信息',''),('bac2388a-3e8c-494f-8525-62c2a3370229',0,7,0,'icon','',NULL,'',1,'','',0,'已迁户信息管理',''),('be5d84dc-cc75-42fc-9269-dfba2e3f9504',0,1,0,'icon','#management/accountQuery','1ba39037-689f-4bd8-8d0d-446c376567a3','',1,'','',0,'账户回收站','admin'),('be769d24-1b19-472a-9f68-fc82c800ad29',0,1,0,'icon','',NULL,'',1,'','',0,'拆迁户管理',''),('cb027978-ae93-4c48-a88b-91d3b67766e0',0,1,0,'icon','#transferAccountManagement/taImportFile','d78b0a7a-3014-4f20-8fe6-b4b86441995e','',1,'','',0,'录入转户信息',''),('cb7d46b0-25f2-4a2d-b021-4032d209951b',0,7,0,'icon','#housePurchaseMansgement/hptExchangeBill','6b3dac14-8116-4aad-8643-c54821ebf93c','',1,'','',0,'购房卷的兑付台账',''),('d78127f1-4573-434e-bbce-95cbb6e27b37',0,2,0,'icon','#projectManagement/pmProgress','a538004f-b6b2-48e3-8fcb-8ba000a3019a','',1,'','',0,'项目进度管理',''),('d78b0a7a-3014-4f20-8fe6-b4b86441995e',0,2,0,'icon','',NULL,'',1,'','',0,'转户管理',''),('e746da4a-c40f-409b-9130-270e372efb04',0,6,0,'icon','',NULL,'',1,'','',0,'信访管理',''),('eb106090-a2d1-462c-a371-bb935a93ed2d',0,6,0,'icon','#housePurchaseMansgement/hptLossAndMend','6b3dac14-8116-4aad-8643-c54821ebf93c','',1,'','',0,'购房卷挂失/补券',''),('ef7420c3-0a6f-4667-827d-cb4aa55f0efc',0,5,0,'icon','',NULL,'',1,'','',0,'查询浏览',''),('f71cb280-3108-4013-9ac2-2d00ed56abac',0,3,0,'icon','#management/removePInfoQuery','1ba39037-689f-4bd8-8d0d-446c376567a3','',1,'','',0,'已迁户回收站','admin'),('fabf3a8a-153b-421f-9ba4-d531807f8c6a',0,3,0,'icon','#projectManagement/queryRemoveInfo','be769d24-1b19-472a-9f68-fc82c800ad29','',1,'','',0,'拆迁户户信息台账',''),('fc50914f-aa91-4bf8-b196-f889ddf34784',0,1,0,'icon','#messageManagement/visitAdd','e746da4a-c40f-409b-9130-270e372efb04','',1,'','',0,'录入信访信息',''),('fd190a39-295f-4491-a020-f4f2cf5f58a4',0,1,0,'icon','#socialSecurityMansgement/solmImportFile','8502199d-390e-49e1-a37a-43b5677bc705','',1,'','',0,'录入社保信息','');

/*Table structure for table `tb_role` */

DROP TABLE IF EXISTS `tb_role`;

CREATE TABLE `tb_role` (
  `id` varchar(70) NOT NULL,
  `role_name` varchar(30) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_role` */

insert  into `tb_role`(`id`,`role_name`,`is_del`) values ('98bab46f-ee49-4827-9470-ae1c6ab28f76','Admin',0);

/*Table structure for table `tb_role_account` */

DROP TABLE IF EXISTS `tb_role_account`;

CREATE TABLE `tb_role_account` (
  `id` varchar(70) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  `account_id` varchar(70) NOT NULL,
  `role_id` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_role_account` */

/*Table structure for table `tb_socialsecurity_info` */

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

/*Data for the table `tb_socialsecurity_info` */

insert  into `tb_socialsecurity_info`(`id`,`opr_user_id`,`opr_date`,`socialsecurity_date`,`socialsecurity_type_id`,`fml_item_id`,`is_del`,`serve_army_time`,`endowment_insurance_year`,`medical_insurance_month`,`join_which_medical_insurance`,`community`,`prison_time`,`is_join_socialsecurity`) values ('0a7d66f7-4a84-4817-bd2b-a042a24ea65c','c58e3d3a-bf66-11e5-b532-089e01cfdd5a','2016-01-21','2016-01-06','56e34e35-8a45-4df9-8721-42647b125f4f','e56a5436-b243-4e36-b7e6-064accc166a1',0,2,2,2,'医疗保险2','社区2',2,NULL),('1d3d3299-e045-43b4-b6fc-edffdb94cdc5','a90caf25-86fe-4543-83a5-a272add1a95f','2016-01-19','2016-01-19','56e34e35-8a45-4df9-8721-42647b125f4f','87518576-9f0c-4002-8ed4-ca390d90390e',0,0,0,0,NULL,NULL,0,1),('4625d3c4-277c-4841-9327-bd1dfaadbf93','c58e3d3a-bf66-11e5-b532-089e01cfdd5a','2016-01-21','2016-01-06','56e34e35-8a45-4df9-8721-42647b125f4f','b86c81ee-e89f-4d67-89fb-138ab7169b53',0,1,1,1,'医疗保险1','社区1',1,NULL),('5c3a0374-b9fc-491c-a783-64aef7418aff','c58e3d3a-bf66-11e5-b532-089e01cfdd5a','2016-01-21','2016-01-06','56e34e35-8a45-4df9-8721-42647b125f4f','e8444b8a-df1e-409b-83e0-9c9547d8c3c3',0,3,3,3,'医疗保险3','社区3',3,NULL),('6f97efc6-ba00-47d1-a1ee-49cdcde3325d','a90caf25-86fe-4543-83a5-a272add1a95f','2016-01-21','2016-01-18','56e34e35-8a45-4df9-8721-42647b125f4f','8ad0c658-7ef7-4a83-b9fd-cdb1f5513975',0,2,2,2,'参加何种医疗保险','所属社区',2,NULL),('b859ad75-8421-4c41-ab74-de9c03298681','a90caf25-86fe-4543-83a5-a272add1a95f','2016-01-19','2016-01-18','56e34e35-8a45-4df9-8721-42647b125f4f','adc3ab14-8ddc-49c2-bf46-de0d79f03a40',0,1,1,1,'jjh','jjh',1,NULL),('be6c0312-b80b-4232-9b68-1b4ebecee3d5','a8312572-daac-44eb-bab6-85bca8f8fe34','2016-01-19','2016-01-19','2a3dd234-d80d-4ca8-98cc-26f1c9eec207','4da544da-1c64-427c-a3f5-4a7d26bd228b',0,10,1,10,'joinWhichMed',NULL,10,0),('fff55a49-e383-4f77-9892-f9afcf0c473a','a90caf25-86fe-4543-83a5-a272add1a95f','2016-01-22','2016-01-01','5036c631-708c-462a-a1cd-e932d7a64a86','add64ea4-2ed0-4912-adf5-1fc79e629421',0,4,1,2,'参加何种医疗保险','所属社区',3,NULL);

/*Table structure for table `tb_socialsecurity_type` */

DROP TABLE IF EXISTS `tb_socialsecurity_type`;

CREATE TABLE `tb_socialsecurity_type` (
  `id` varchar(70) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_socialsecurity_type` */

insert  into `tb_socialsecurity_type`(`id`,`type_name`) values ('5036c631-708c-462a-a1cd-e932d7a64a86','40+20'),('56e34e35-8a45-4df9-8721-42647b125f4f','60+20');

/*Table structure for table `tb_ticket_exchange` */

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

/*Data for the table `tb_ticket_exchange` */

/*Table structure for table `tb_ticket_mend` */

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

/*Data for the table `tb_ticket_mend` */

/*Table structure for table `tb_ticket_provider` */

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

/*Data for the table `tb_ticket_provider` */

insert  into `tb_ticket_provider`(`id`,`ticket_id`,`owner_id`,`name`,`id_number`,`opr_date`,`evidence_path`,`getting_date`,`opr_user_id`) values ('50cdb421-9b34-4726-903d-97d45f22ca79','b09bd99c-3a08-4978-a7a2-e4f57a597e10','e56a5436-b243-4e36-b7e6-064accc166a1','贾建华','511527198909130638','2016-01-21',NULL,'2016-01-21','a90caf25-86fe-4543-83a5-a272add1a95f');

/*Table structure for table `tb_ticket_state` */

DROP TABLE IF EXISTS `tb_ticket_state`;

CREATE TABLE `tb_ticket_state` (
  `id` varchar(70) NOT NULL,
  `type_code` int(11) NOT NULL,
  `type_name` varchar(70) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_code` (`type_code`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_ticket_state` */

/*Table structure for table `tb_ticket_use_cash` */

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

/*Data for the table `tb_ticket_use_cash` */

insert  into `tb_ticket_use_cash`(`id`,`opr_user_id`,`opr_date`,`using_to_where`,`using_type_id`,`owner`,`ticket_id`,`using_date`,`situation_explain`,`evidence_path`,`is_del`) values ('e8352d47-7bcf-44c9-b72b-2c36744d8a4f','a90caf25-86fe-4543-83a5-a272add1a95f','2016-01-21','','1','e56a5436-b243-4e36-b7e6-064accc166a1','b09bd99c-3a08-4978-a7a2-e4f57a597e10','2016-01-21','','',0);

/*Table structure for table `tb_ticket_use_type` */

DROP TABLE IF EXISTS `tb_ticket_use_type`;

CREATE TABLE `tb_ticket_use_type` (
  `id` varchar(70) NOT NULL,
  `type_code` int(11) NOT NULL,
  `type_name` varchar(70) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_code` (`type_code`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_ticket_use_type` */

/*Table structure for table `tb_transfer_household_info` */

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

/*Data for the table `tb_transfer_household_info` */

insert  into `tb_transfer_household_info`(`id`,`opr_user_id`,`opr_date`,`address`,`transfer_date`,`household_type_id`,`is_del`,`fml_item_id`,`street_id`,`community_id`,`group_id`) values ('1be80b21-bd9e-4112-9012-4d6b04a10cdc','c58e3d3a-bf66-11e5-b532-089e01cfdd5a','2016-01-21','四川省成都市双流','2016-01-21','5da70074-f9d4-477d-b1f1-d687601a1e03',0,'4da544da-1c64-427c-a3f5-4a7d26bd228b','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','61b01e3c-0940-4341-8462-91e158cd11ec'),('24d65057-236e-4f13-8d3b-adaeb8a44ec1','c58e3d3a-bf66-11e5-b532-089e01cfdd5a','2016-01-21','四川省成都市双流','2016-01-21','5da70074-f9d4-477d-b1f1-d687601a1e03',0,'e8444b8a-df1e-409b-83e0-9c9547d8c3c3','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','61b01e3c-0940-4341-8462-91e158cd11ec'),('366fbcdf-b5d6-4300-b525-61ef057503d6','a90caf25-86fe-4543-83a5-a272add1a95f','2016-01-22','四川省成都市双流12','2014-06-10','b65e5365-1acb-4f82-b858-3d9d54ed27fc',0,'add64ea4-2ed0-4912-adf5-1fc79e629421','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','61b01e3c-0940-4341-8462-91e158cd11ec'),('3e6ba86c-e49d-4078-84e8-e1ca4fc8a603','c58e3d3a-bf66-11e5-b532-089e01cfdd5a','2016-01-21','四川省成都市双流','2016-01-21','5da70074-f9d4-477d-b1f1-d687601a1e03',0,'b86c81ee-e89f-4d67-89fb-138ab7169b53','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','61b01e3c-0940-4341-8462-91e158cd11ec'),('5a147851-8c7b-43c7-a6ca-4ca4b3137ad6','c58e3d3a-bf66-11e5-b532-089e01cfdd5a','2016-01-21','四川省成都市双流','2016-01-21','5da70074-f9d4-477d-b1f1-d687601a1e03',0,'8ad0c658-7ef7-4a83-b9fd-cdb1f5513975','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','61b01e3c-0940-4341-8462-91e158cd11ec'),('8db218c0-a561-464a-bde5-667c48e82bf5','c58e3d3a-bf66-11e5-b532-089e01cfdd5a','2016-01-21','四川省成都市双流','2016-01-21','5da70074-f9d4-477d-b1f1-d687601a1e03',0,'adc3ab14-8ddc-49c2-bf46-de0d79f03a40','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','61b01e3c-0940-4341-8462-91e158cd11ec'),('b7284f92-c8dd-475a-a9df-959055997fed','c58e3d3a-bf66-11e5-b532-089e01cfdd5a','2016-01-21','四川省成都市双流','2016-01-21','5da70074-f9d4-477d-b1f1-d687601a1e03',0,'e56a5436-b243-4e36-b7e6-064accc166a1','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','61b01e3c-0940-4341-8462-91e158cd11ec'),('c3465f14-fcd9-48c9-9c05-911517c008b4','c58e3d3a-bf66-11e5-b532-089e01cfdd5a','2016-01-21','四川省成都市双流','2016-01-21','5da70074-f9d4-477d-b1f1-d687601a1e03',0,'db6225b7-5806-48e3-83b8-17cd498bfc6f','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','61b01e3c-0940-4341-8462-91e158cd11ec'),('cacc8503-c352-43ae-9e3e-406fff74d003','c58e3d3a-bf66-11e5-b532-089e01cfdd5a','2016-01-21','四川省成都市双流','2016-01-21','5da70074-f9d4-477d-b1f1-d687601a1e03',0,'87518576-9f0c-4002-8ed4-ca390d90390e','72c43fd2-fadb-44bd-ada4-bc8dc07ab938','7ab503ac-971d-4336-8f10-48898d45d450','61b01e3c-0940-4341-8462-91e158cd11ec');

/*Table structure for table `tb_user_state` */

DROP TABLE IF EXISTS `tb_user_state`;

CREATE TABLE `tb_user_state` (
  `id` varchar(70) NOT NULL,
  `type_code` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_code` (`type_code`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_user_state` */

/*Table structure for table `tb_visit_info` */

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

/*Data for the table `tb_visit_info` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

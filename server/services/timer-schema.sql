# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.22)
# Database: timer
# Generation Time: 2019-11-08 09:44:36 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clients`;

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `country` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `photo` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table companies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=>Inactive, 1=>Active',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(500) DEFAULT NULL,
  `public_key` varchar(500) DEFAULT NULL,
  `private_key` varchar(500) DEFAULT NULL,
  `test_public_key` varchar(500) DEFAULT NULL,
  `test_private_key` varchar(500) DEFAULT NULL,
  `api_key` varchar(500) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table designations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `designations`;

CREATE TABLE `designations` (
  `designation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'designation_id',
  `name` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  `enable_report_to` int(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=>false, 1=>true',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`designation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table email_queues
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_queues`;

CREATE TABLE `email_queues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to` varchar(255) NOT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `subject` varchar(128) DEFAULT NULL,
  `body_html` longtext,
  `body_text` longtext,
  `created` datetime NOT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `attachment` longtext,
  `response` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table email_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_templates`;

CREATE TABLE `email_templates` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `html_content` text NOT NULL,
  `template_name` text NOT NULL,
  `from_mail` text NOT NULL,
  `to_mail` text NOT NULL,
  `send_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `host` text NOT NULL,
  `subject` text NOT NULL,
  `type` text NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table histories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `histories`;

CREATE TABLE `histories` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `referal_id` int(11) NOT NULL,
  `data` varchar(512) NOT NULL,
  `history_type` enum('user','project','timesheet') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=>false, 1=>true',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `request_type` enum('create','update','delete') DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `module_id` int(5) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=>Inactive, 1=>Active',
  `is_coming_soon` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(5) DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;

INSERT INTO `modules` (`module_id`, `module_name`, `status`, `is_coming_soon`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`)
VALUES
	(1,'Users',1,0,'2018-10-06 05:05:53',NULL,'2018-10-06 05:05:53',NULL,0,NULL,NULL),
	(2,'Projects',1,0,'2018-10-06 05:07:24',NULL,'2018-10-06 05:07:24',NULL,0,NULL,NULL),
	(3,'Timesheet',1,0,'2018-10-06 05:07:36',NULL,'2018-10-06 05:07:36',NULL,0,NULL,NULL),
	(4,'Designation',1,0,'2018-10-06 05:08:04',NULL,'2018-10-06 05:08:04',NULL,0,NULL,NULL),
	(5,'Roles',1,0,'2019-01-31 16:04:03',NULL,'2019-01-31 16:04:03',NULL,0,NULL,NULL),
	(6,'Clients',1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0);

/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_logo` varchar(255) NOT NULL,
  `project_lead_id` int(11) NOT NULL,
  `project_type` enum('billable','unbillable') NOT NULL DEFAULT 'billable' COMMENT '1 => billable, 2 => unbillable',
  `status` enum('Approved','Hold','In-Progress','Pending','Completed','Pipeline') NOT NULL DEFAULT 'Pipeline' COMMENT '1=>Approved, 2=>Hold, 3=>In-progress, 4=>Pending, 5=>Completed, 6=>Pipeline',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=>false, 1=>true',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `color_code` varchar(7) DEFAULT '#641CFF',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table role_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_permissions`;

CREATE TABLE `role_permissions` (
  `role_permission_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `is_accessible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - no access, 1 - view only, 2 - view + modify',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by_val` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=>false, 1=>true',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_permission_id`),
  UNIQUE KEY `role_module_ref` (`role_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=>false, 1=>true',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`role_id`, `role_name`, `company_id`, `created_at`, `created_by`, `is_deleted`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`)
VALUES
	(1,'Super Admin',1,'2018-10-06 07:17:28',0,0,'2019-03-27 14:37:21',220,NULL,NULL),
	(2,'Admin',1,'2018-10-06 07:17:36',0,0,'2019-03-08 04:34:25',173,NULL,NULL),
	(3,'Employee',1,'2018-10-06 10:41:37',0,0,'2019-03-14 07:20:38',219,NULL,NULL),
	(50,'Test Super Admin',2,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),
	(51,'Test Admin',2,'2019-03-13 06:09:31',50,1,'2019-03-13 07:07:21',50,'2019-03-25 10:01:28',50),
	(52,'Test employee',2,'2019-03-13 06:10:05',50,1,'2019-03-21 11:32:42',50,'2019-03-25 10:01:38',50),
	(53,'hr manager',2,'2019-03-13 07:15:31',50,1,NULL,NULL,'2019-03-25 10:01:34',50),
	(55,'Admin',2,'2019-03-25 10:12:21',242,0,NULL,NULL,NULL,NULL),
	(56,'employee',2,'2019-03-25 10:12:49',242,0,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `last_active_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table timesheets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `timesheets`;

CREATE TABLE `timesheets` (
  `timesheet_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL DEFAULT '0',
  `task_title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `hours_spent` time NOT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('pending','approved','request change','reject') NOT NULL DEFAULT 'pending',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=>false, 1=>true',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `reason` varchar(250) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`timesheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table user_projects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_projects`;

CREATE TABLE `user_projects` (
  `user_projects_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_projects_id`),
  UNIQUE KEY `user_project_ref` (`user_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL COMMENT 'mapped to company table',
  `emp_id` varchar(255) NOT NULL COMMENT 'company employee id',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `des_id` int(11) NOT NULL COMMENT 'mapped to designation table',
  `photo` varchar(512) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `report_to` int(11) NOT NULL COMMENT 'user id',
  `status` enum('inactive','active','suspend') NOT NULL DEFAULT 'active' COMMENT '0=>inactive, 1=>active, 2=>suspend',
  `last_logged_in` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=>false, 1=>true',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `invalid_login_count` int(10) NOT NULL DEFAULT '0',
  `login_type` enum('Email',' Google','Facebook','LinkedIn') DEFAULT 'Email',
  `account_id` varchar(255) DEFAULT NULL,
  `is_reset_password_used` tinyint(1) NOT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_date` datetime DEFAULT NULL,
  `invalid_login_time` datetime DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `gender` enum('Male',' Female') DEFAULT NULL COMMENT '0=>male,1=>female',
  `salt` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

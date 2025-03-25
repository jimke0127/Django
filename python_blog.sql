/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.41-0ubuntu0.22.04.1 : Database - python_blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`python_blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `python_blog`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add captcha model',7,'add_captchamodel'),
(26,'Can change captcha model',7,'change_captchamodel'),
(27,'Can delete captcha model',7,'delete_captchamodel'),
(28,'Can view captcha model',7,'view_captchamodel'),
(29,'Can add blog comment',8,'add_blogcomment'),
(30,'Can change blog comment',8,'change_blogcomment'),
(31,'Can delete blog comment',8,'delete_blogcomment'),
(32,'Can view blog comment',8,'view_blogcomment'),
(33,'Can add blog category',9,'add_blogcategory'),
(34,'Can change blog category',9,'change_blogcategory'),
(35,'Can delete blog category',9,'delete_blogcategory'),
(36,'Can view blog category',9,'view_blogcategory'),
(37,'Can add blog',10,'add_blog'),
(38,'Can change blog',10,'change_blog'),
(39,'Can delete blog',10,'delete_blog'),
(40,'Can view blog',10,'view_blog');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$870000$gZynmnolZYDPLoVWuB4t18$anW/l5smCp7V9oZ9EichEVdAS7fEkw9o8Eacrv6s5/4=','2025-03-25 11:50:21.302625',1,'jack','','','jimke127@126.com',1,1,'2025-03-24 12:49:21.405866'),
(2,'pbkdf2_sha256$870000$U58IoPLOXT0aqX2pnHP6nk$Ut/HFLWem0/dn4AXhGpOIMLB4nJOXg0iG9n5ZSGccaQ=','2025-03-25 11:49:59.468276',0,'jack1','','','jack1@126.com',0,0,'2025-03-25 11:16:06.216281');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values 
(1,'2025-03-25 11:16:06.711512','2','jack1',1,'[{\"added\": {}}]',4,1),
(2,'2025-03-25 11:33:54.719083','1','BlogCategory object (1)',1,'[{\"added\": {}}]',9,1),
(3,'2025-03-25 11:33:58.785857','2','BlogCategory object (2)',1,'[{\"added\": {}}]',9,1),
(4,'2025-03-25 11:34:06.396251','3','BlogCategory object (3)',1,'[{\"added\": {}}]',9,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(10,'myblog','blog'),
(9,'myblog','blogcategory'),
(8,'myblog','blogcomment'),
(6,'sessions','session'),
(7,'zlauth','captchamodel');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2025-03-24 10:58:19.550191'),
(2,'auth','0001_initial','2025-03-24 10:58:20.784745'),
(3,'admin','0001_initial','2025-03-24 10:58:21.019104'),
(4,'admin','0002_logentry_remove_auto_add','2025-03-24 10:58:21.028244'),
(5,'admin','0003_logentry_add_action_flag_choices','2025-03-24 10:58:21.044904'),
(6,'contenttypes','0002_remove_content_type_name','2025-03-24 10:58:21.275381'),
(7,'auth','0002_alter_permission_name_max_length','2025-03-24 10:58:21.395553'),
(8,'auth','0003_alter_user_email_max_length','2025-03-24 10:58:21.491004'),
(9,'auth','0004_alter_user_username_opts','2025-03-24 10:58:21.500828'),
(10,'auth','0005_alter_user_last_login_null','2025-03-24 10:58:21.633478'),
(11,'auth','0006_require_contenttypes_0002','2025-03-24 10:58:21.639663'),
(12,'auth','0007_alter_validators_add_error_messages','2025-03-24 10:58:21.662785'),
(13,'auth','0008_alter_user_username_max_length','2025-03-24 10:58:21.798270'),
(14,'auth','0009_alter_user_last_name_max_length','2025-03-24 10:58:21.948725'),
(15,'auth','0010_alter_group_name_max_length','2025-03-24 10:58:21.995284'),
(16,'auth','0011_update_proxy_permissions','2025-03-24 10:58:22.020152'),
(17,'auth','0012_alter_user_first_name_max_length','2025-03-24 10:58:22.145156'),
(18,'sessions','0001_initial','2025-03-24 10:58:22.209723'),
(19,'zlauth','0001_initial','2025-03-24 10:58:22.245951'),
(20,'zlauth','0002_alter_captchamodel_email','2025-03-24 11:06:21.534841'),
(21,'myblog','0001_initial','2025-03-25 03:06:25.328135');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('h3dsglk1cr4mwshityaglkp9t7934bv4','.eJxVjEEOwiAQRe_C2pChBUq7dO8ZyDBMLWrAlDbRGO-uTbrQ7X_vv5fwuC6TXyvPPkUxCCUOv1tAunLeQLxgPhdJJS9zCnJT5E6rPJXIt-Pu_gUmrNP3bZA7E0aKEDuF0FsFY0ONUaQh2Nah0yqAi9Zo6sEa4BZHdtB2rCIF3KKVa00le37c0_wUA7w_iQs_Ig:1twvIz:68fNKF0OiFy6AQaiVH9EvKhinjT5OKBMPbQ32whzyHk','2025-04-08 11:50:21.309246');

/*Table structure for table `myblog_blog` */

DROP TABLE IF EXISTS `myblog_blog`;

CREATE TABLE `myblog_blog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `pub_time` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myblog_blog_author_id_35bc10f7_fk_auth_user_id` (`author_id`),
  KEY `myblog_blog_category_id_1e968d17_fk_myblog_blogcategory_id` (`category_id`),
  CONSTRAINT `myblog_blog_author_id_35bc10f7_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `myblog_blog_category_id_1e968d17_fk_myblog_blogcategory_id` FOREIGN KEY (`category_id`) REFERENCES `myblog_blogcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myblog_blog` */

insert  into `myblog_blog`(`id`,`title`,`content`,`pub_time`,`author_id`,`category_id`) values 
(1,'123123','<p>111</p><p>222</p>','2025-03-25 12:20:39.743582',1,2),
(2,'明天就要离开了','<p>是的</p><p>很好</p>','2025-03-25 12:26:25.108202',1,3),
(3,'明天就要离开了','<p>是的</p><p>很懵逼</p>','2025-03-25 12:26:57.870722',1,3),
(4,'wqeqwe','<p>是的</p>','2025-03-25 12:27:37.834416',1,1),
(5,'走了走了','<p>是的是的</p><p>很好</p>','2025-03-25 12:28:30.654953',1,1);

/*Table structure for table `myblog_blogcategory` */

DROP TABLE IF EXISTS `myblog_blogcategory`;

CREATE TABLE `myblog_blogcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myblog_blogcategory` */

insert  into `myblog_blogcategory`(`id`,`name`) values 
(1,'PHP'),
(2,'Java'),
(3,'C++');

/*Table structure for table `myblog_blogcomment` */

DROP TABLE IF EXISTS `myblog_blogcomment`;

CREATE TABLE `myblog_blogcomment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `pub_time` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  `blog_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myblog_blogcomment_author_id_235c61c5_fk_auth_user_id` (`author_id`),
  KEY `myblog_blogcomment_bog_id_fa93f9a6_fk_myblog_blog_id` (`blog_id`),
  CONSTRAINT `myblog_blogcomment_author_id_235c61c5_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `myblog_blogcomment_bog_id_fa93f9a6_fk_myblog_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `myblog_blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myblog_blogcomment` */

insert  into `myblog_blogcomment`(`id`,`content`,`pub_time`,`author_id`,`blog_id`) values 
(1,'123','2025-03-25 13:21:45.380487',1,5),
(3,'轻轻的我走了','2025-03-25 13:24:47.017863',1,5);

/*Table structure for table `zlauth_captchamodel` */

DROP TABLE IF EXISTS `zlauth_captchamodel`;

CREATE TABLE `zlauth_captchamodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `captcha` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `zlauth_captchamodel_email_bad993ac_uniq` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `zlauth_captchamodel` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

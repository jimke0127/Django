/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.41-0ubuntu0.22.04.1 : Database - python_demo1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`python_demo1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `python_demo1`;

/*Table structure for table `article_article` */

DROP TABLE IF EXISTS `article_article`;

CREATE TABLE `article_article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `author_id` bigint NOT NULL,
  `pub_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_article_author_id_e6b479f8_fk_article_user_id` (`author_id`),
  CONSTRAINT `article_article_author_id_e6b479f8_fk_article_user_id` FOREIGN KEY (`author_id`) REFERENCES `article_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `article_article` */

insert  into `article_article`(`id`,`title`,`content`,`author_id`,`pub_time`) values 
(1,'chatGpt5已经发布啦!','xxx',1,'2025-03-23 10:05:55.788249'),
(3,'狗日的，李嘉诚买港口','xxx',3,'2025-03-21 10:05:55.000000'),
(4,'狗日的，司马南逃税','assdfsdf',3,'2025-03-23 10:05:55.788249'),
(5,'我是一个兵','aaaa',3,'2025-03-20 10:05:55.000000'),
(6,'chatGpt5已经发布啦!','xxx',4,'2025-03-23 10:05:55.788249'),
(7,'chatGpt5已经发布啦!','xxx',5,'2025-03-23 10:05:55.788249'),
(8,'chatGpt5已经发布啦!','xxx',6,'2025-03-23 10:05:55.788249');

/*Table structure for table `article_article_tags` */

DROP TABLE IF EXISTS `article_article_tags`;

CREATE TABLE `article_article_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `article_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_article_tags_article_id_tag_id_d45ad9d9_uniq` (`article_id`,`tag_id`),
  KEY `article_article_tags_tag_id_61af53b5_fk_article_tag_id` (`tag_id`),
  CONSTRAINT `article_article_tags_article_id_85c8d0ac_fk_article_article_id` FOREIGN KEY (`article_id`) REFERENCES `article_article` (`id`),
  CONSTRAINT `article_article_tags_tag_id_61af53b5_fk_article_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `article_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `article_article_tags` */

/*Table structure for table `article_comment` */

DROP TABLE IF EXISTS `article_comment`;

CREATE TABLE `article_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `origin_comment_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_comment_origin_comment_id_efa3d7fe_fk_article_comment_id` (`origin_comment_id`),
  CONSTRAINT `article_comment_origin_comment_id_efa3d7fe_fk_article_comment_id` FOREIGN KEY (`origin_comment_id`) REFERENCES `article_comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `article_comment` */

/*Table structure for table `article_tag` */

DROP TABLE IF EXISTS `article_tag`;

CREATE TABLE `article_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `article_tag` */

/*Table structure for table `article_user` */

DROP TABLE IF EXISTS `article_user`;

CREATE TABLE `article_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `article_user` */

insert  into `article_user`(`id`,`username`,`password`) values 
(1,'知了1','111111'),
(3,'知了2','111111'),
(4,'知了3','111111'),
(5,'知了4','111111'),
(6,'知了5','111111');

/*Table structure for table `article_userextension` */

DROP TABLE IF EXISTS `article_userextension`;

CREATE TABLE `article_userextension` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `birthday` datetime(6) NOT NULL,
  `university` varchar(200) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `article_userextension_user_id_a5a3c2b3_fk_article_user_id` FOREIGN KEY (`user_id`) REFERENCES `article_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `article_userextension` */

insert  into `article_userextension`(`id`,`birthday`,`university`,`user_id`) values 
(1,'2025-03-23 09:30:49.762297','人民大学',6);

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(25,'Can add book',7,'add_book'),
(26,'Can change book',7,'change_book'),
(27,'Can delete book',7,'delete_book'),
(28,'Can view book',7,'view_book'),
(29,'Can add article',8,'add_article'),
(30,'Can change article',8,'change_article'),
(31,'Can delete article',8,'delete_article'),
(32,'Can view article',8,'view_article'),
(33,'Can add user',9,'add_user'),
(34,'Can change user',9,'change_user'),
(35,'Can delete user',9,'delete_user'),
(36,'Can view user',9,'view_user'),
(37,'Can add comment',10,'add_comment'),
(38,'Can change comment',10,'change_comment'),
(39,'Can delete comment',10,'delete_comment'),
(40,'Can view comment',10,'view_comment'),
(41,'Can add user extension',11,'add_userextension'),
(42,'Can change user extension',11,'change_userextension'),
(43,'Can delete user extension',11,'delete_userextension'),
(44,'Can view user extension',11,'view_userextension'),
(45,'Can add tag',12,'add_tag'),
(46,'Can change tag',12,'change_tag'),
(47,'Can delete tag',12,'delete_tag'),
(48,'Can view tag',12,'view_tag'),
(49,'Can add book order',13,'add_bookorder'),
(50,'Can change book order',13,'change_bookorder'),
(51,'Can delete book order',13,'delete_bookorder'),
(52,'Can view book order',13,'view_bookorder'),
(53,'Can add publisher',14,'add_publisher'),
(54,'Can change publisher',14,'change_publisher'),
(55,'Can delete publisher',14,'delete_publisher'),
(56,'Can view publisher',14,'view_publisher'),
(57,'Can add author',15,'add_author'),
(58,'Can change author',15,'change_author'),
(59,'Can delete author',15,'delete_author'),
(60,'Can view author',15,'view_author'),
(61,'Can add book',16,'add_book'),
(62,'Can change book',16,'change_book'),
(63,'Can delete book',16,'delete_book'),
(64,'Can view book',16,'view_book');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `pub_time` datetime(6) NOT NULL,
  `price` double NOT NULL,
  `company` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `books` */

insert  into `books`(`id`,`name`,`author`,`pub_time`,`price`,`company`) values 
(1,'西游记1','罗贯中','2025-03-23 07:10:34.079681',100,'aaa'),
(2,'西游记2','小明2','2025-03-23 07:20:01.516155',100,'aaa'),
(3,'三国','吴承恩','2025-03-23 15:26:32.000000',200,'aaa'),
(4,'三国','111','2025-03-23 15:35:07.000000',122,'aaa'),
(5,'西游记','罗贯中','2025-03-23 08:24:49.846708',100,'aaa');

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(8,'article','article'),
(10,'article','comment'),
(12,'article','tag'),
(9,'article','user'),
(11,'article','userextension'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(7,'book','book'),
(5,'contenttypes','contenttype'),
(15,'front','author'),
(16,'front','book'),
(13,'front','bookorder'),
(14,'front','publisher'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2025-03-23 06:42:05.761543'),
(2,'auth','0001_initial','2025-03-23 06:42:06.450005'),
(3,'admin','0001_initial','2025-03-23 06:42:06.620110'),
(4,'admin','0002_logentry_remove_auto_add','2025-03-23 06:42:06.631439'),
(5,'admin','0003_logentry_add_action_flag_choices','2025-03-23 06:42:06.641306'),
(6,'contenttypes','0002_remove_content_type_name','2025-03-23 06:42:06.730288'),
(7,'auth','0002_alter_permission_name_max_length','2025-03-23 06:42:06.798522'),
(8,'auth','0003_alter_user_email_max_length','2025-03-23 06:42:06.827372'),
(9,'auth','0004_alter_user_username_opts','2025-03-23 06:42:06.834912'),
(10,'auth','0005_alter_user_last_login_null','2025-03-23 06:42:06.891817'),
(11,'auth','0006_require_contenttypes_0002','2025-03-23 06:42:06.896166'),
(12,'auth','0007_alter_validators_add_error_messages','2025-03-23 06:42:06.903900'),
(13,'auth','0008_alter_user_username_max_length','2025-03-23 06:42:06.973313'),
(14,'auth','0009_alter_user_last_name_max_length','2025-03-23 06:42:07.045067'),
(15,'auth','0010_alter_group_name_max_length','2025-03-23 06:42:07.065366'),
(16,'auth','0011_update_proxy_permissions','2025-03-23 06:42:07.074127'),
(17,'auth','0012_alter_user_first_name_max_length','2025-03-23 06:42:07.141753'),
(18,'book','0001_initial','2025-03-23 06:42:07.161544'),
(19,'sessions','0001_initial','2025-03-23 06:42:07.198392'),
(20,'book','0002_book_company','2025-03-23 08:06:12.644988'),
(21,'book','0003_alter_book_options_alter_book_table','2025-03-23 08:12:11.913683'),
(22,'article','0001_initial','2025-03-23 08:42:28.581515'),
(23,'article','0002_comment','2025-03-23 08:59:34.411945'),
(24,'article','0003_userextension','2025-03-23 09:22:53.828419'),
(25,'article','0004_tag_article_tags','2025-03-23 09:44:10.726981'),
(26,'article','0005_article_pub_time','2025-03-23 10:05:55.821278'),
(27,'article','0006_alter_article_author','2025-03-23 10:50:27.670790'),
(28,'front','0001_initial','2025-03-23 10:50:27.923430');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('qtivqmhyspml7flnn90on4fmcg1m8i4t','eyJ1c2VyX2lkIjoiemhpIGxlIHpoaSBsZSJ9:1twaDs:hHtaDnwT23EZyF-MZ5mewP27jt5ovxJsHRvHZOGEH3M','2025-04-07 13:19:40.202925');

/*Table structure for table `front_author` */

DROP TABLE IF EXISTS `front_author`;

CREATE TABLE `front_author` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` int NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `front_author` */

insert  into `front_author`(`id`,`name`,`age`,`email`) values 
(1,'张珊',40,'zhangshan@qq.com'),
(2,'李四',25,'lisi@qq.com'),
(3,'王五',30,'wangwu@qq.com');

/*Table structure for table `front_book` */

DROP TABLE IF EXISTS `front_book`;

CREATE TABLE `front_book` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `pages` int NOT NULL,
  `price` double NOT NULL,
  `rating` double NOT NULL,
  `author_id` bigint NOT NULL,
  `publisher_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `front_book_author_id_14d42029_fk_front_author_id` (`author_id`),
  KEY `front_book_publisher_id_2bf63fea_fk_front_publisher_id` (`publisher_id`),
  CONSTRAINT `front_book_author_id_14d42029_fk_front_author_id` FOREIGN KEY (`author_id`) REFERENCES `front_author` (`id`),
  CONSTRAINT `front_book_publisher_id_2bf63fea_fk_front_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `front_publisher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `front_book` */

insert  into `front_book`(`id`,`name`,`pages`,`price`,`rating`,`author_id`,`publisher_id`) values 
(1,'PHP基础教程',200,55,5,1,2),
(2,'JAVA高级编程',150,60,4,1,3),
(3,'CSS3入门到跑路',85,25,3,2,1),
(4,'数据库设计',206,60,4,3,2),
(5,'Python入门教程',300,70,2,3,3);

/*Table structure for table `front_book_order` */

DROP TABLE IF EXISTS `front_book_order`;

CREATE TABLE `front_book_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `book_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `front_book_order_book_id_83c02d6c_fk_front_book_id` (`book_id`),
  CONSTRAINT `front_book_order_book_id_83c02d6c_fk_front_book_id` FOREIGN KEY (`book_id`) REFERENCES `front_book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `front_book_order` */

insert  into `front_book_order`(`id`,`price`,`book_id`) values 
(1,200,1),
(2,50,2),
(3,60,3),
(4,80,4),
(5,55,5),
(6,60,2),
(7,25,3),
(8,10,3);

/*Table structure for table `front_publisher` */

DROP TABLE IF EXISTS `front_publisher`;

CREATE TABLE `front_publisher` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `front_publisher` */

insert  into `front_publisher`(`id`,`name`) values 
(1,'广西科技大学出版社'),
(2,'人民出版社'),
(3,'湖南出版社'),
(4,'北京出版社');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

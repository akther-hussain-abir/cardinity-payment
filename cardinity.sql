/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 5.7.23 : Database - cardinity
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cardinity` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cardinity`;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2020_08_27_130142_create_products_table',1),
(8,'2020_08_27_131233_create_payments_table',2),
(7,'2020_08_27_131139_create_orders_table',2);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `payment_status` tinyint(4) NOT NULL DEFAULT '0',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `order_items` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `orders` */

insert  into `orders`(`id`,`amount`,`payment_status`,`status`,`order_items`,`created_at`,`updated_at`) values 
(1,800.00,0,'active','[{\"product\": {\"id\": 2, \"name\": \"Medicine 2\", \"slug\": \"medicine-2\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 2, \"created_at\": null, \"totalPrice\": 400, \"updated_at\": null}, \"quantity\": 2}, {\"product\": {\"id\": 1, \"name\": \"Medicine 1\", \"slug\": \"medicine-1\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 2, \"created_at\": null, \"totalPrice\": 400, \"updated_at\": null}, \"quantity\": 2}]','2020-09-03 10:41:06','2020-09-03 10:41:06'),
(2,400.00,0,'active','[{\"product\": {\"id\": 1, \"name\": \"Medicine 1\", \"slug\": \"medicine-1\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"200.00\", \"updated_at\": null}, \"quantity\": 1}, {\"product\": {\"id\": 2, \"name\": \"Medicine 2\", \"slug\": \"medicine-2\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"200.00\", \"updated_at\": null}, \"quantity\": 1}]','2020-09-03 10:46:28','2020-09-03 10:46:28'),
(3,400.00,0,'active','[{\"product\": {\"id\": 2, \"name\": \"Medicine 2\", \"slug\": \"medicine-2\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"200.00\", \"updated_at\": null}, \"quantity\": 1}, {\"product\": {\"id\": 1, \"name\": \"Medicine 1\", \"slug\": \"medicine-1\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"200.00\", \"updated_at\": null}, \"quantity\": 1}]','2020-09-03 10:47:15','2020-09-03 10:47:15'),
(4,400.00,0,'active','[{\"product\": {\"id\": 2, \"name\": \"Medicine 2\", \"slug\": \"medicine-2\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"200.00\", \"updated_at\": null}, \"quantity\": 1}, {\"product\": {\"id\": 1, \"name\": \"Medicine 1\", \"slug\": \"medicine-1\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"200.00\", \"updated_at\": null}, \"quantity\": 1}]','2020-09-03 10:47:55','2020-09-03 10:47:55'),
(5,800.00,0,'active','[{\"product\": {\"id\": 2, \"name\": \"Medicine 2\", \"slug\": \"medicine-2\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 2, \"created_at\": null, \"totalPrice\": 400, \"updated_at\": null}, \"quantity\": 2}, {\"product\": {\"id\": 1, \"name\": \"Medicine 1\", \"slug\": \"medicine-1\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 2, \"created_at\": null, \"totalPrice\": 400, \"updated_at\": null}, \"quantity\": 2}]','2020-09-03 10:48:10','2020-09-03 10:48:10'),
(6,800.00,0,'active','[{\"product\": {\"id\": 2, \"name\": \"Medicine 2\", \"slug\": \"medicine-2\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 2, \"created_at\": null, \"totalPrice\": 400, \"updated_at\": null}, \"quantity\": 2}, {\"product\": {\"id\": 1, \"name\": \"Medicine 1\", \"slug\": \"medicine-1\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 2, \"created_at\": null, \"totalPrice\": 400, \"updated_at\": null}, \"quantity\": 2}]','2020-09-03 10:53:26','2020-09-03 10:53:26'),
(7,400.00,0,'active','[{\"product\": {\"id\": 1, \"name\": \"Medicine 1\", \"slug\": \"medicine-1\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"200.00\", \"updated_at\": null}, \"quantity\": 1}, {\"product\": {\"id\": 2, \"name\": \"Medicine 2\", \"slug\": \"medicine-2\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"200.00\", \"updated_at\": null}, \"quantity\": 1}]','2020-09-03 10:53:49','2020-09-03 10:53:49'),
(8,400.00,0,'active','[{\"product\": {\"id\": 1, \"name\": \"Medicine 1\", \"slug\": \"medicine-1\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"200.00\", \"updated_at\": null}, \"quantity\": 1}, {\"product\": {\"id\": 2, \"name\": \"Medicine 2\", \"slug\": \"medicine-2\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"200.00\", \"updated_at\": null}, \"quantity\": 1}]','2020-09-03 10:55:08','2020-09-03 10:55:08'),
(9,200.00,0,'active','[{\"product\": {\"id\": 1, \"name\": \"Medicine 1\", \"slug\": \"medicine-1\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"200.00\", \"updated_at\": null}, \"quantity\": 1}]','2020-09-03 11:18:44','2020-09-03 11:18:44'),
(10,200.00,0,'active','[{\"product\": {\"id\": 1, \"name\": \"Medicine 1\", \"slug\": \"medicine-1\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"200.00\", \"updated_at\": null}, \"quantity\": 1}]','2020-09-03 13:31:16','2020-09-03 13:31:16'),
(11,400.00,0,'active','[{\"product\": {\"id\": 1, \"name\": \"Medicine 1\", \"slug\": \"medicine-1\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"200.00\", \"updated_at\": null}, \"quantity\": 1}, {\"product\": {\"id\": 2, \"name\": \"Medicine 2\", \"slug\": \"medicine-2\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"200.00\", \"updated_at\": null}, \"quantity\": 1}]','2020-09-03 13:31:31','2020-09-03 13:31:31'),
(12,400.00,0,'active','[{\"product\": {\"id\": 1, \"name\": \"Medicine 1\", \"slug\": \"medicine-1\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"200.00\", \"updated_at\": null}, \"quantity\": 1}, {\"product\": {\"id\": 2, \"name\": \"Medicine 2\", \"slug\": \"medicine-2\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"200.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"200.00\", \"updated_at\": null}, \"quantity\": 1}]','2020-09-03 15:52:19','2020-09-03 15:52:19'),
(13,35.52,0,'active','[{\"product\": {\"id\": 1, \"name\": \"Saffron Gel\", \"slug\": \"saffron-gel\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"20.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"20.00\", \"updated_at\": null}, \"quantity\": 1}, {\"product\": {\"id\": 2, \"name\": \"Paracitamol 500mg\", \"slug\": \"paracitamol-500mg\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"15.52\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"15.52\", \"updated_at\": null}, \"quantity\": 1}]','2020-09-03 15:54:35','2020-09-03 15:54:35'),
(14,35.52,0,'active','[{\"product\": {\"id\": 2, \"name\": \"Paracitamol 500mg\", \"slug\": \"paracitamol-500mg\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"15.52\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"15.52\", \"updated_at\": null}, \"quantity\": 1}, {\"product\": {\"id\": 1, \"name\": \"Saffron Gel\", \"slug\": \"saffron-gel\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"20.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"20.00\", \"updated_at\": null}, \"quantity\": 1}]','2020-09-03 15:56:55','2020-09-03 15:56:55'),
(15,35.52,0,'active','[{\"product\": {\"id\": 2, \"name\": \"Paracitamol 500mg\", \"slug\": \"paracitamol-500mg\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"15.52\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"15.52\", \"updated_at\": null}, \"quantity\": 1}, {\"product\": {\"id\": 1, \"name\": \"Saffron Gel\", \"slug\": \"saffron-gel\", \"image\": \"https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=\", \"price\": \"20.00\", \"quantity\": 1, \"created_at\": null, \"totalPrice\": \"20.00\", \"updated_at\": null}, \"quantity\": 1}]','2020-09-03 16:00:05','2020-09-03 16:00:05');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `payments` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_urls` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_price` decimal(8,2) NOT NULL,
  `min_price` decimal(8,2) NOT NULL,
  `min_discounted_price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`name`,`slug`,`image_urls`,`price_type`,`max_price`,`min_price`,`min_discounted_price`,`created_at`,`updated_at`) values 
(1,'Saffron Gel','saffron-gel','https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=','Fixed',20.00,20.00,200.00,NULL,NULL),
(2,'Paracitamol 500mg','paracitamol-500mg','https://df17fp68uwcso.cloudfront.net/eyJidWNrZXQiOiAibWVkaWEuZXZhbHkuY29tLmJkIiwgImtleSI6ICJtZWRpYS9pbWFnZXMvODZkYjc1YzBiZjU4LWNvbG1pLXA4LWlweDctd2F0ZXJwcm9vZi1zbWFydHdhdGNoLXNvcC0zLmpwZyIsICJlZGl0cyI6IHsicmVzaXplIjogeyJ3aWR0aCI6IDI1MCwgImhlaWdodCI6IDI1MCwgImZpdCI6ICJjb250YWluIn0sICJiYWNrZ3JvdW5kIjogeyJyIjogMjU1LCAiZyI6IDI1NSwgImIiOiAyNTUsICJhbHBoYSI6IDF9LCAiZmxhdHRlbiI6IHRydWUsICJqcGVnIjogeyJxdWFsaXR5IjogNzV9fX0=','Fixed',15.52,15.52,200.00,NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

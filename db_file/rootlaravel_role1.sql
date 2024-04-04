-- Adminer 4.8.1 MySQL 8.0.36-0ubuntu0.20.04.1 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1,	'default',	'created',	'App\\Models\\Admin',	'created',	7,	NULL,	NULL,	'[]',	NULL,	'2024-03-21 13:06:59',	'2024-03-21 13:06:59'),
(2,	'default',	'updated',	'App\\Models\\Admin',	'updated',	4,	NULL,	NULL,	'[]',	NULL,	'2024-03-21 13:10:24',	'2024-03-21 13:10:24'),
(3,	'default',	'created',	'App\\Models\\Admin',	'created',	8,	NULL,	NULL,	'[]',	NULL,	'2024-03-21 13:12:34',	'2024-03-21 13:12:34'),
(4,	'default',	'updated',	'App\\Models\\Admin',	'updated',	4,	NULL,	NULL,	'[]',	NULL,	'2024-03-21 13:13:33',	'2024-03-21 13:13:33'),
(5,	'default',	'updated',	'App\\Models\\Admin',	'updated',	4,	NULL,	NULL,	'[]',	NULL,	'2024-03-21 13:14:03',	'2024-03-21 13:14:03'),
(6,	'default',	'updated',	'App\\Models\\Admin',	'updated',	4,	NULL,	NULL,	'[]',	NULL,	'2024-03-21 13:15:11',	'2024-03-21 13:15:11'),
(7,	'default',	'created',	'App\\Models\\Admin',	'created',	9,	NULL,	NULL,	'[]',	NULL,	'2024-03-21 13:16:32',	'2024-03-21 13:16:32'),
(8,	'default',	'updated',	'App\\Models\\Admin',	'updated',	9,	NULL,	NULL,	'[]',	NULL,	'2024-03-21 13:21:12',	'2024-03-21 13:21:12'),
(9,	'default',	'updated',	'App\\Models\\Admin',	'updated',	6,	NULL,	NULL,	'[]',	NULL,	'2024-03-26 10:40:00',	'2024-03-26 10:40:00'),
(10,	'default',	'created',	'App\\Models\\Admin',	'created',	10,	NULL,	NULL,	'[]',	NULL,	'2024-03-26 11:19:01',	'2024-03-26 11:19:01'),
(11,	'default',	'updated',	'App\\Models\\Admin',	'updated',	6,	NULL,	NULL,	'[]',	NULL,	'2024-03-26 11:19:31',	'2024-03-26 11:19:31'),
(12,	'default',	'updated',	'App\\Models\\Admin',	'updated',	4,	NULL,	NULL,	'[]',	NULL,	'2024-03-28 11:05:23',	'2024-03-28 11:05:23'),
(13,	'default',	'updated',	'App\\Models\\Admin',	'updated',	6,	NULL,	NULL,	'[]',	NULL,	'2024-03-28 11:06:16',	'2024-03-28 11:06:16'),
(14,	'default',	'updated',	'App\\Models\\Admin',	'updated',	8,	NULL,	NULL,	'[]',	NULL,	'2024-03-28 11:22:58',	'2024-03-28 11:22:58'),
(15,	'default',	'updated',	'App\\Models\\Admin',	'updated',	4,	NULL,	NULL,	'[]',	NULL,	'2024-03-28 11:23:39',	'2024-03-28 11:23:39');

DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_username_unique` (`username`),
  UNIQUE KEY `admins_session_id_unique` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `session_id`) VALUES
(4,	'Admin',	'admin@mailinator.com',	'admin',	NULL,	'$2y$10$TZ.jG76.GTs6GSnV4WGF7OVY75oQrU1jC4K0C6dn7iDTH/GBx1k1O',	'nYDunE7YfymwnPAHMocRKomzPExDIQDxW1cZQSRh3QYDplOdN6wcK2TVAX9q',	'2024-03-05 13:14:15',	'2024-03-19 11:42:33',	NULL),
(6,	'Vanna Morse3',	'raso@mailinator.com',	'raso@mailinator.com',	NULL,	'$2y$10$lMyy.ejrrEUnv7ZYZn7/ueELAzIiD/BwI.z4qB7UZTNcLfm8RlAPm',	NULL,	'2024-03-21 12:15:03',	'2024-03-28 11:06:16',	NULL),
(7,	'Quin Strong',	'vofocihofu@mailinator.com',	'vodaci',	NULL,	'$2y$10$R9Xp3LTyXekPbGeamRxugulOQApwP10YpgmUhQeKvgqxwUIq06mHC',	NULL,	'2024-03-21 13:06:59',	'2024-03-21 13:06:59',	NULL),
(8,	'Quon Vega1',	'pisab@mailinator.com',	'pufaci',	NULL,	'$2y$10$nOEkjDKgbtJLq2zVgTHUzeYpQmzU.g3cZDl/qzTg7vazJk6urSfqG',	NULL,	'2024-03-21 13:12:34',	'2024-03-28 11:22:58',	NULL),
(9,	'Donna Sosa',	'delaruvym@mailinator.com',	'pofyrabyk',	NULL,	'$2y$10$1aPr2/fnnAkUjugVCV.jtuuzF1TC9.8ubNsUrQRdDxdbsin7ucyDK',	NULL,	'2024-03-21 13:16:32',	'2024-03-21 13:21:12',	NULL),
(10,	'Test1',	'test@gmail.com',	'test1',	NULL,	'$2y$10$osAdr1exCJhM/sa5Cg5A6eT4XKQPPyqpawuBOxZ9oOdz6l6MK1YIu',	NULL,	'2024-03-26 11:19:01',	'2024-03-26 11:19:01',	NULL);

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2019_08_19_000000_create_failed_jobs_table',	1),
(4,	'2020_07_24_184706_create_permission_tables',	1),
(5,	'2020_09_12_043205_create_admins_table',	1),
(6,	'2024_03_05_185704_create_sessions_table',	2),
(7,	'2024_03_16_174936_add_session_id_to_users_table',	3),
(8,	'2024_03_16_180617_add_session_id_to_admins_table',	4),
(9,	'2024_03_21_174136_create_activity_log_table',	5),
(10,	'2024_03_21_174137_add_event_column_to_activity_log_table',	5),
(11,	'2024_03_21_174138_add_batch_uuid_column_to_activity_log_table',	5);

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2,	'App\\Models\\Admin',	4),
(2,	'App\\Models\\Admin',	6),
(2,	'App\\Models\\Admin',	8),
(2,	'App\\Models\\Admin',	9),
(4,	'App\\Models\\Admin',	10);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(1,	'dashboard.view',	'admin',	'dashboard',	'2024-03-05 13:06:37',	'2024-03-05 13:06:37'),
(2,	'dashboard.edit',	'admin',	'dashboard',	'2024-03-05 13:06:37',	'2024-03-05 13:06:37'),
(3,	'blog.create',	'admin',	'blog',	'2024-03-05 13:06:37',	'2024-03-05 13:06:37'),
(4,	'blog.view',	'admin',	'blog',	'2024-03-05 13:06:37',	'2024-03-05 13:06:37'),
(5,	'blog.edit',	'admin',	'blog',	'2024-03-05 13:06:37',	'2024-03-05 13:06:37'),
(6,	'blog.delete',	'admin',	'blog',	'2024-03-05 13:06:37',	'2024-03-05 13:06:37'),
(7,	'blog.approve',	'admin',	'blog',	'2024-03-05 13:06:37',	'2024-03-05 13:06:37'),
(8,	'admin.create',	'admin',	'admin',	'2024-03-05 13:06:38',	'2024-03-05 13:06:38'),
(9,	'admin.view',	'admin',	'admin',	'2024-03-05 13:06:38',	'2024-03-05 13:06:38'),
(10,	'admin.edit',	'admin',	'admin',	'2024-03-05 13:06:38',	'2024-03-05 13:06:38'),
(11,	'admin.delete',	'admin',	'admin',	'2024-03-05 13:06:38',	'2024-03-05 13:06:38'),
(12,	'admin.approve',	'admin',	'admin',	'2024-03-05 13:06:38',	'2024-03-05 13:06:38'),
(13,	'role.create',	'admin',	'role',	'2024-03-05 13:06:38',	'2024-03-05 13:06:38'),
(14,	'role.view',	'admin',	'role',	'2024-03-05 13:06:38',	'2024-03-05 13:06:38'),
(15,	'role.edit',	'admin',	'role',	'2024-03-05 13:06:39',	'2024-03-05 13:06:39'),
(16,	'role.delete',	'admin',	'role',	'2024-03-05 13:06:39',	'2024-03-05 13:06:39'),
(17,	'role.approve',	'admin',	'role',	'2024-03-05 13:06:39',	'2024-03-05 13:06:39'),
(18,	'profile.view',	'admin',	'profile',	'2024-03-05 13:06:39',	'2024-03-05 13:06:39'),
(19,	'profile.edit',	'admin',	'profile',	'2024-03-05 13:06:39',	'2024-03-05 13:06:39');

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1,	1),
(2,	1),
(3,	1),
(4,	1),
(5,	1),
(6,	1),
(7,	1),
(8,	1),
(9,	1),
(10,	1),
(11,	1),
(12,	1),
(13,	1),
(14,	1),
(15,	1),
(16,	1),
(17,	1),
(18,	1),
(19,	1),
(1,	2),
(2,	2),
(3,	2),
(4,	2),
(5,	2),
(6,	2),
(7,	2),
(8,	2),
(9,	2),
(10,	2),
(11,	2),
(12,	2),
(13,	2),
(14,	2),
(15,	2),
(16,	2),
(17,	2),
(18,	2),
(19,	2),
(1,	4),
(3,	4),
(4,	4),
(18,	4),
(19,	4),
(1,	5),
(2,	5),
(1,	6),
(2,	6),
(3,	6),
(4,	6),
(5,	6),
(6,	6),
(7,	6),
(8,	6),
(9,	6),
(10,	6),
(11,	6),
(12,	6),
(13,	6),
(14,	6),
(15,	6),
(16,	6),
(17,	6),
(18,	6),
(19,	6),
(1,	7),
(2,	7),
(3,	7),
(4,	7),
(5,	7),
(6,	7),
(7,	7);

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1,	'superadmin',	'admin',	'2024-03-05 13:06:37',	'2024-03-05 13:06:37'),
(2,	'Admin',	'admin',	'2024-03-05 13:11:18',	'2024-03-05 13:11:18'),
(4,	'vendor',	'admin',	'2024-03-18 11:22:40',	'2024-03-18 11:24:37'),
(5,	'testrole',	'admin',	'2024-03-21 12:56:04',	'2024-03-21 12:56:04'),
(6,	'User1',	'admin',	'2024-03-26 10:39:28',	'2024-03-26 10:39:28'),
(7,	'Sub Admin1',	'admin',	'2024-03-28 11:24:11',	'2024-03-28 11:24:11');

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_session_id_unique` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `session_id`) VALUES
(2,	'test',	'test@gmail.com',	'2024-03-21 18:49:30',	'$2y$10$TZ.jG76.GTs6GSnV4WGF7OVY75oQrU1jC4K0C6dn7iDTH/GBx1k1O',	NULL,	'2024-03-21 18:49:30',	'2024-03-21 18:49:30',	NULL);

-- 2024-04-04 16:34:43

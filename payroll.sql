-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 30, 2024 at 11:54 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payroll`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assign_leaves`
--

CREATE TABLE `tbl_assign_leaves` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `leave_id` int NOT NULL,
  `year` year NOT NULL,
  `assign_leave` decimal(8,2) NOT NULL,
  `leave_balance` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_assign_leaves`
--

INSERT INTO `tbl_assign_leaves` (`id`, `user_id`, `leave_id`, `year`, `assign_leave`, `leave_balance`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 2024, '1.00', '0.00', '2024-09-24 05:16:05', '2024-09-24 06:36:54'),
(2, 4, 2, 2024, '2.00', '-1.50', '2024-09-24 05:16:05', '2024-09-25 05:39:22'),
(3, 4, 3, 2024, '1.00', '1.00', '2024-09-24 05:16:05', '2024-09-24 05:16:05'),
(4, 4, 1, 2024, '1.00', '1.00', '2024-09-24 09:13:45', '2024-09-24 09:13:45'),
(5, 4, 2, 2024, '2.00', '2.00', '2024-09-24 09:13:45', '2024-09-24 09:13:45'),
(6, 4, 3, 2024, '1.00', '1.00', '2024-09-24 09:13:45', '2024-09-24 09:13:45'),
(7, 5, 1, 2024, '1.00', '1.00', '2024-09-24 09:13:45', '2024-09-24 09:13:45'),
(8, 5, 2, 2024, '2.00', '2.00', '2024-09-24 09:13:45', '2024-09-24 09:13:45'),
(9, 5, 3, 2024, '1.00', '1.00', '2024-09-24 09:13:45', '2024-09-24 09:13:45'),
(10, 4, 1, 2024, '1.00', '1.00', '2024-09-24 09:14:00', '2024-09-24 09:14:00'),
(11, 4, 2, 2024, '2.00', '2.00', '2024-09-24 09:14:00', '2024-09-24 09:14:00'),
(12, 4, 3, 2024, '1.00', '1.00', '2024-09-24 09:14:00', '2024-09-24 09:14:00'),
(16, 2, 1, 2024, '1.00', '1.00', '2024-09-25 08:57:58', '2024-09-25 08:57:58'),
(17, 2, 2, 2024, '2.00', '2.00', '2024-09-25 08:57:58', '2024-09-25 08:57:58'),
(18, 2, 3, 2024, '1.00', '1.00', '2024-09-25 08:57:58', '2024-09-25 08:57:58');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_departments`
--

CREATE TABLE `tbl_departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '1 for active, 0 for inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_departments`
--

INSERT INTO `tbl_departments` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Development', 1, '2024-08-09 09:38:10', '2024-08-09 09:39:20'),
(2, 'Marketing', 1, '2024-08-09 09:39:43', '2024-08-09 09:39:43'),
(3, 'Other', 1, '2024-08-20 04:49:08', '2024-08-20 04:49:08'),
(4, 'Testing', 1, '2024-09-10 11:56:58', '2024-09-16 04:17:45'),
(5, 'Quality Analyst', 1, '2024-09-11 08:46:15', '2024-09-11 08:46:15'),
(6, 'Management', 1, '2024-09-18 05:12:03', '2024-09-18 05:21:33'),
(7, 'TEST', 1, '2024-09-18 05:44:33', '2024-09-18 05:44:33'),
(8, 'Test123', 1, '2024-09-18 12:34:20', '2024-09-18 12:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_designations`
--

CREATE TABLE `tbl_designations` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '1 for active, 0 for inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_designations`
--

INSERT INTO `tbl_designations` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 1, '2024-08-07 04:16:35', '2024-08-07 04:16:35'),
(2, 'Ui-Ux Designer', 1, '2024-08-07 04:23:03', '2024-08-07 04:23:03'),
(3, 'Web Designer', 1, '2024-08-07 04:23:15', '2024-08-07 04:23:15'),
(4, 'Business Development', 1, '2024-08-07 04:23:33', '2024-08-07 04:23:33'),
(5, 'Degital Marketing', 1, '2024-08-07 04:23:46', '2024-08-07 04:23:46'),
(6, 'Accountant', 1, '2024-08-07 04:23:56', '2024-08-07 04:23:56'),
(7, 'Project Manager', 1, '2024-08-07 04:24:06', '2024-08-07 05:08:12'),
(8, 'Piun', 1, '2024-08-07 05:18:40', '2024-09-24 08:25:49'),
(9, 'PHP Developer', 1, NULL, NULL),
(10, 'HR', 1, NULL, NULL),
(11, 'Quality Analyst', 1, '2024-09-10 06:24:53', '2024-09-10 06:25:27'),
(12, 'Dotnet Devloper', 1, '2024-09-10 23:18:16', '2024-09-11 22:39:50'),
(13, 'Python Devlopers', 1, '2024-09-10 23:18:17', '2024-09-15 22:40:58'),
(14, 'Dotnet', 1, '2024-09-10 23:18:18', '2024-09-11 22:39:46'),
(15, 'Laravel Devlopers', 1, '2024-09-10 23:59:39', '2024-09-18 05:10:26'),
(16, 'TEST', 1, '2024-09-18 05:44:01', '2024-09-18 05:44:01'),
(17, 'TEST11', 1, '2024-09-18 12:34:46', '2024-09-18 12:34:46');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_failed_jobs`
--

CREATE TABLE `tbl_failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_holiday_leaves`
--

CREATE TABLE `tbl_holiday_leaves` (
  `id` bigint UNSIGNED NOT NULL,
  `holiday_date` date DEFAULT NULL,
  `holiday_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '1 for active, 0 for inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_holiday_leaves`
--

INSERT INTO `tbl_holiday_leaves` (`id`, `holiday_date`, `holiday_name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2024-08-15', 'Independence Day', 1, '2024-06-11 04:51:51', '2024-06-11 08:49:51', NULL),
(2, '2024-08-19', 'Raksha Bandhan', 1, '2024-06-11 04:52:57', '2024-06-11 07:31:07', NULL),
(3, '2024-08-26', 'Janmashtmi', 1, '2024-08-24 04:20:00', '2024-08-24 04:20:00', NULL),
(4, '2024-10-02', 'Gandhi Jayanti', 1, '2024-09-10 12:13:15', '2024-09-10 12:13:47', '2024-09-10 12:13:47'),
(5, '2024-09-11', 'Diwali', 0, '2024-09-10 12:24:55', '2024-09-10 12:25:06', NULL),
(6, '2024-10-02', 'Gandhi Jayanti', 1, '2024-09-16 05:31:05', '2024-09-16 05:31:05', NULL),
(7, '2024-10-30', 'Diwali', 1, '2024-09-16 05:31:30', '2024-09-16 05:31:30', NULL),
(8, '2024-12-25', 'christmas', 1, '2024-09-16 05:32:37', '2024-09-16 05:32:37', NULL),
(9, '2025-01-14', 'Uttarayan', 0, '2024-09-16 05:33:11', '2024-09-16 05:33:23', NULL),
(10, '2025-03-11', 'holi', 1, '2024-09-17 05:41:09', '2024-09-17 05:41:19', '2024-09-17 05:41:19'),
(18, '2024-09-23', 'test', 1, '2024-09-19 06:59:14', '2024-09-19 07:04:05', NULL),
(19, '2024-09-22', 'test2', 1, '2024-09-19 07:06:43', '2024-09-19 07:06:51', NULL),
(20, '2024-09-19', 'leave', 1, '2024-09-19 07:07:37', '2024-09-19 07:07:37', NULL),
(21, '2024-09-19', NULL, 1, '2024-09-19 07:07:47', '2024-09-19 08:18:40', '2024-09-19 08:18:40'),
(22, '2024-09-19', NULL, 1, '2024-09-19 07:07:47', '2024-09-19 08:19:07', '2024-09-19 08:19:07'),
(23, '2024-09-27', 'test5', 1, '2024-09-19 07:09:01', '2024-09-19 07:09:01', NULL),
(24, '2024-09-19', NULL, 1, '2024-09-19 07:09:36', '2024-09-19 08:18:48', '2024-09-19 08:18:48'),
(25, '2024-09-19', NULL, 1, '2024-09-19 07:10:15', '2024-09-19 08:18:54', '2024-09-19 08:18:54'),
(26, '2024-09-19', NULL, 1, '2024-09-19 07:11:27', '2024-09-19 08:19:01', '2024-09-19 08:19:01'),
(27, '2024-09-19', NULL, 1, '2024-09-19 07:12:02', '2024-09-19 08:19:14', '2024-09-19 08:19:14'),
(28, '2024-09-19', NULL, 1, '2024-09-19 07:12:21', '2024-09-19 08:19:19', '2024-09-19 08:19:19'),
(29, '2024-09-19', NULL, 1, '2024-09-19 07:12:38', '2024-09-19 08:19:26', '2024-09-19 08:19:26'),
(30, '2024-09-19', NULL, 1, '2024-09-19 07:17:29', '2024-09-19 08:18:34', '2024-09-19 08:18:34'),
(31, '2024-09-19', NULL, 1, '2024-09-19 07:20:13', '2024-09-19 08:18:24', '2024-09-19 08:18:24'),
(32, '2024-09-19', NULL, 1, '2024-09-19 07:20:41', '2024-09-19 08:18:15', '2024-09-19 08:18:15'),
(33, '2024-09-19', NULL, 1, '2024-09-19 08:19:52', '2024-09-19 08:20:37', '2024-09-19 08:20:37'),
(34, '2024-09-19', NULL, 1, '2024-09-19 08:20:29', '2024-09-19 08:20:29', NULL),
(35, '2024-09-19', NULL, 1, '2024-09-19 08:20:30', '2024-09-19 08:20:30', NULL),
(36, '2024-10-02', 'Gandhi Jayanti', 1, '2024-09-24 07:02:49', '2024-09-24 07:02:57', '2024-09-24 07:02:57'),
(37, '2024-10-11', 'dassehra', 1, '2024-09-25 06:58:10', '2024-09-25 06:58:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_leaves`
--

CREATE TABLE `tbl_leaves` (
  `id` bigint UNSIGNED NOT NULL,
  `leave_type_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_leaves` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_leaves`
--

INSERT INTO `tbl_leaves` (`id`, `leave_type_name`, `number_of_leaves`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Privilege Leave', 10, '2024-06-10 06:41:00', '2024-09-18 06:34:58', NULL),
(2, 'Sick Leave', 7, '2024-06-10 06:47:44', '2024-06-11 04:31:03', NULL),
(3, 'Casual Leave', 4, '2024-06-10 06:49:59', '2024-08-20 05:48:26', NULL),
(6, 'cl', 2, '2024-09-24 07:02:27', '2024-09-24 07:02:35', '2024-09-24 07:02:35');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_leave_applies`
--

CREATE TABLE `tbl_leave_applies` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `leave_id` int DEFAULT NULL,
  `leave_mode` int DEFAULT NULL COMMENT '1 for Full Day, 2 for Half Day - 1st, 3 for Half Day - 2nd',
  `is_leave_cancle` int DEFAULT '1' COMMENT '1 for No, 2 for Yes',
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_approved` int DEFAULT '0' COMMENT '0 for pending, 1 for Approved, 2 for Rejected',
  `number_of_days` double(8,2) DEFAULT NULL,
  `deleted_by` int DEFAULT NULL COMMENT 'This is User Id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_leave_applies`
--

INSERT INTO `tbl_leave_applies` (`id`, `user_id`, `from_date`, `to_date`, `leave_id`, `leave_mode`, `is_leave_cancle`, `reason`, `is_approved`, `number_of_days`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, '2024-09-25', '2024-09-25', 2, 2, 2, 'TEST', 0, 0.50, NULL, '2024-09-24 05:17:23', '2024-09-24 05:18:19', '2024-09-24 05:18:19'),
(2, 4, '2024-09-25', '2024-09-25', 2, 2, 1, 'TEST', 0, 0.50, 1, '2024-09-24 05:31:18', '2024-09-24 06:49:31', '2024-09-24 06:49:31'),
(3, 4, '2024-09-25', '2024-09-25', 2, 2, 1, 'TEST', 1, 0.50, NULL, '2024-09-24 06:04:05', '2024-09-25 05:39:22', NULL),
(4, 4, '2024-09-28', '2024-09-28', 1, 1, 1, 'test', 1, 1.00, NULL, '2024-09-24 06:32:50', '2024-09-24 06:36:54', NULL),
(5, 4, '2024-09-26', '2024-09-27', 2, 1, 1, 'test', 1, 2.00, 1, '2024-09-24 06:44:41', '2024-09-24 06:51:39', '2024-09-24 06:51:39'),
(6, 2, '2024-09-26', '2024-09-26', 1, 1, 1, 'test', 0, 1.00, NULL, '2024-09-25 09:02:11', '2024-09-25 09:02:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_migrations`
--

CREATE TABLE `tbl_migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_migrations`
--

INSERT INTO `tbl_migrations` (`id`, `migration`, `batch`) VALUES
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2024_06_05_100657_create_permission_tables', 3),
(10, '2024_06_07_053657_create_settings_table', 5),
(15, '2014_10_12_100000_create_password_reset_tokens_table', 7),
(18, '2024_06_10_173831_create_leaves_table', 8),
(19, '2024_06_11_100253_create_holiday_leaves_table', 9),
(31, '2024_06_12_154834_create_leave_applies_table', 14),
(40, '2024_06_10_163914_create_user_details_table', 19),
(42, '2024_06_14_123623_create_punch_in_outs_table', 21),
(46, '2024_08_07_145317_create_designations_table', 23),
(47, '2014_10_12_000000_create_users_table', 24),
(48, '2024_08_06_121818_create_salaries_table', 25),
(49, '2024_08_09_145849_create_departments_table', 26),
(50, '2024_06_11_155155_create_assign_leaves_table', 27),
(52, '2024_08_24_153505_create_salary_histories_table', 28),
(54, '2024_08_30_173548_create_projects_table', 29),
(56, '2024_08_31_165813_create_user_documents_table', 30),
(59, '2024_09_02_111141_add_address_and_gender_to_users_table', 31),
(60, '2024_09_18_161839_add_confirmation_date_to_users_table', 32);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_model_has_permissions`
--

CREATE TABLE `tbl_model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_model_has_roles`
--

CREATE TABLE `tbl_model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_model_has_roles`
--

INSERT INTO `tbl_model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(4, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(7, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 6),
(4, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 8),
(4, 'App\\Models\\User', 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_password_reset_tokens`
--

CREATE TABLE `tbl_password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_password_reset_tokens`
--

INSERT INTO `tbl_password_reset_tokens` (`email`, `token`, `created_at`, `updated_at`) VALUES
('rahulpatil2163@gmail.com', '1fJzl4xu1GsvX0p1FhYLnFEsb1EssQF1RienqN1dZ1i5xlfpB7SlCGyex04NIxlJ', '2024-06-10 05:05:10', '2024-06-10 05:05:10'),
('rahulpatil2163@gmail.com', 'nHx1r0lbIHjJx3wdhTYqz6NWvNzKDp9e3KOIOmDs5gquqVDXd7QzxaYjh2js6dVb', '2024-06-10 05:21:09', '2024-06-10 05:21:09'),
('admin@example.com', 'IxiZuWPFsi4573uPs2LCo0TP07PSmufMjF6Xj6TgqpqHZPVClMt5BDww7qsHb9Bc', '2024-06-26 07:15:19', '2024-06-26 07:15:19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permissions`
--

CREATE TABLE `tbl_permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_permissions`
--

INSERT INTO `tbl_permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'view-role', 'web', 'Role', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(2, 'create-role', 'web', 'Role', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(3, 'edit-role', 'web', 'Role', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(4, 'delete-role', 'web', 'Role', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(5, 'view-employee', 'web', 'Employee', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(6, 'create-employee', 'web', 'Employee', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(7, 'edit-employee', 'web', 'Employee', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(8, 'delete-employee', 'web', 'Employee', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(9, 'leave-history', 'web', 'Employee', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(10, 'view-designation', 'web', 'Designation', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(11, 'create-designation', 'web', 'Designation', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(12, 'edit-designation', 'web', 'Designation', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(13, 'delete-designation', 'web', 'Designation', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(14, 'view-department', 'web', 'Department', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(15, 'create-department', 'web', 'Department', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(16, 'edit-department', 'web', 'Department', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(17, 'delete-department', 'web', 'Department', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(18, 'view-leave', 'web', 'Leave', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(19, 'create-leave', 'web', 'Leave', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(20, 'edit-leave', 'web', 'Leave', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(21, 'delete-leave', 'web', 'Leave', '2024-08-31 10:24:07', '2024-08-31 10:24:07'),
(22, 'view-holiday-leave', 'web', 'HolidayLeave', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(23, 'create-holiday-leave', 'web', 'HolidayLeave', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(24, 'edit-holiday-leave', 'web', 'HolidayLeave', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(25, 'delete-holiday-leave', 'web', 'HolidayLeave', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(26, 'view-leave-apply', 'web', 'LeaveApply', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(27, 'create-leave-apply', 'web', 'LeaveApply', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(28, 'edit-leave-apply', 'web', 'LeaveApply', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(29, 'delete-leave-apply', 'web', 'LeaveApply', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(30, 'view-applied-leave', 'web', 'AppliedLeave', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(31, 'edit-applied-leave', 'web', 'AppliedLeave', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(32, 'delete-applied-leave', 'web', 'AppliedLeave', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(33, 'view-location', 'web', 'PunchInOut', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(34, 'employee-list-attendance-correction', 'web', 'AttendanceCorrection', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(35, 'attendance-list-attendancecorrection', 'web', 'AttendanceCorrection', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(36, 'edit-attendance-correction', 'web', 'AttendanceCorrection', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(37, 'employee-list-attendancereport', 'web', 'AttendanceReport', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(38, 'attendance-report', 'web', 'AttendanceReport', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(39, 'view-salary', 'web', 'Salary', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(40, 'create-salary', 'web', 'Salary', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(41, 'edit-salary', 'web', 'Salary', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(42, 'show-salary', 'web', 'Salary', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(43, 'employee-list-salary', 'web', 'Salary', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(44, 'view-project', 'web', 'Project', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(45, 'create-project', 'web', 'Project', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(46, 'edit-project', 'web', 'Project', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(47, 'delete-project', 'web', 'Project', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(48, 'show-deleted-project', 'web', 'Project', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(49, 'restore-deleted-project', 'web', 'Project', '2024-08-31 10:24:08', '2024-08-31 10:24:08'),
(50, 'edit-setting', 'web', 'Setting', '2024-08-31 10:24:08', '2024-08-31 10:24:08');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_personal_access_tokens`
--

CREATE TABLE `tbl_personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projects`
--

CREATE TABLE `tbl_projects` (
  `id` bigint UNSIGNED NOT NULL,
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expected_end_date` date DEFAULT NULL,
  `project_domain_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `running_status` int DEFAULT NULL,
  `client_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` bigint DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `project_team` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_projects`
--

INSERT INTO `tbl_projects` (`id`, `project_name`, `start_date`, `expected_end_date`, `project_domain_name`, `running_status`, `client_name`, `email`, `mobile_no`, `address`, `project_team`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Checkeeper', NULL, NULL, NULL, 1, 'Client123', NULL, NULL, NULL, 'null', '2024-08-31 06:58:56', '2024-09-16 08:54:29', NULL),
(2, 'Payroll', '2024-09-11', '2024-09-30', NULL, 1, NULL, NULL, NULL, NULL, 'null', '2024-09-12 12:31:51', '2024-09-12 12:31:51', NULL),
(3, 'Payroll', '2024-09-11', '2024-09-30', NULL, 1, NULL, NULL, NULL, NULL, 'null', '2024-09-12 12:31:51', '2024-09-12 12:31:51', NULL),
(4, 'Payroll', '2024-09-11', '2024-09-30', NULL, 1, NULL, NULL, NULL, NULL, 'null', '2024-09-12 12:35:36', '2024-09-26 12:06:29', '2024-09-26 12:06:29'),
(5, 'pay', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'null', '2024-09-12 12:36:02', '2024-09-12 12:36:02', NULL),
(6, 'Payroll', '2024-09-16', '2024-09-17', NULL, 1, NULL, NULL, NULL, NULL, 'null', '2024-09-16 07:14:24', '2024-09-16 07:14:24', NULL),
(7, 'Attandance', '2024-09-16', '2024-09-20', NULL, 3, NULL, NULL, NULL, NULL, 'null', '2024-09-16 07:16:12', '2024-09-26 12:07:27', '2024-09-26 12:07:27');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_punch_in_outs`
--

CREATE TABLE `tbl_punch_in_outs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `date` date NOT NULL,
  `punch_in` time DEFAULT NULL,
  `punch_in_lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `punch_in_long` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `punch_out` time DEFAULT NULL,
  `punch_out_lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `punch_out_long` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `punch_in_out_status` int NOT NULL COMMENT '1 for Punch In, 0 for Punch Out',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_punch_in_outs`
--

INSERT INTO `tbl_punch_in_outs` (`id`, `user_id`, `date`, `punch_in`, `punch_in_lat`, `punch_in_long`, `punch_out`, `punch_out_lat`, `punch_out_long`, `punch_in_out_status`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-09-24', '12:24:00', NULL, NULL, '18:28:00', NULL, NULL, 0, '2024-09-24 06:54:19', '2024-09-24 12:58:27'),
(2, 4, '2024-09-24', '12:28:00', NULL, NULL, '18:28:00', NULL, NULL, 0, '2024-09-24 06:58:41', '2024-09-24 12:58:07'),
(3, 6, '2024-09-24', '15:36:00', NULL, NULL, '18:27:00', NULL, NULL, 0, '2024-09-24 10:06:05', '2024-09-24 12:57:25'),
(4, 2, '2024-09-25', '11:05:00', NULL, NULL, '18:30:00', NULL, NULL, 0, '2024-09-25 05:35:34', '2024-09-26 03:57:34'),
(5, 1, '2024-09-25', '11:18:00', NULL, NULL, NULL, NULL, NULL, 1, '2024-09-25 05:48:25', '2024-09-25 05:48:25'),
(6, 6, '2024-09-25', '11:18:00', NULL, NULL, NULL, NULL, NULL, 1, '2024-09-25 05:48:54', '2024-09-25 05:48:54'),
(7, 1, '2024-09-26', '10:26:00', NULL, NULL, NULL, NULL, NULL, 1, '2024-09-26 04:56:19', '2024-09-26 04:56:19'),
(8, 4, '2024-09-26', '10:35:00', NULL, NULL, NULL, NULL, NULL, 1, '2024-09-26 05:05:24', '2024-09-26 05:05:24'),
(9, 1, '2024-09-30', '10:11:00', NULL, NULL, NULL, NULL, NULL, 1, '2024-09-30 04:41:48', '2024-09-30 04:41:48'),
(10, 4, '2024-09-30', '10:20:00', NULL, NULL, NULL, NULL, NULL, 1, '2024-09-30 04:50:36', '2024-09-30 04:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2024-06-06 01:39:00', '2024-06-06 01:39:00'),
(2, 'HR', 'web', '2024-06-06 01:40:19', '2024-06-06 01:40:19'),
(3, 'Account', 'web', '2024-06-06 01:51:26', '2024-06-06 01:51:26'),
(4, 'Employee', 'web', '2024-06-06 05:05:16', '2024-06-06 05:05:16'),
(5, 'Project Manager', 'web', '2024-09-10 12:03:14', '2024-09-10 12:03:14'),
(6, 'HOD', 'web', '2024-09-10 12:07:04', '2024-09-18 05:33:02'),
(7, 'CEO', 'web', '2024-09-18 12:43:48', '2024-09-24 09:08:58'),
(8, 'pqr', 'web', '2024-09-18 12:45:48', '2024-09-18 12:45:48'),
(9, 'ABC', 'web', '2024-09-18 12:48:06', '2024-09-18 12:48:06');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role_has_permissions`
--

CREATE TABLE `tbl_role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_role_has_permissions`
--

INSERT INTO `tbl_role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(10, 3),
(14, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(18, 4),
(26, 4),
(27, 4),
(28, 4),
(10, 5),
(14, 5),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(1, 7),
(5, 7),
(10, 7),
(18, 7),
(26, 7),
(1, 8),
(1, 9),
(5, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salaries`
--

CREATE TABLE `tbl_salaries` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `month_year` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_days` decimal(8,2) DEFAULT NULL,
  `total_week_off` int DEFAULT NULL,
  `paid_holiday` int DEFAULT NULL,
  `number_of_paid_leaves` decimal(8,2) DEFAULT NULL,
  `absent_days` decimal(8,2) DEFAULT NULL,
  `total_days` int DEFAULT NULL,
  `number_of_days_work` decimal(8,2) DEFAULT NULL,
  `per_day_salary` decimal(8,2) DEFAULT NULL,
  `overtime_work_hr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ot_per_hr_rs` decimal(8,2) DEFAULT NULL,
  `basic` decimal(8,2) DEFAULT NULL,
  `hra` decimal(8,2) DEFAULT NULL,
  `medical` decimal(8,2) DEFAULT NULL,
  `education` decimal(8,2) DEFAULT NULL,
  `conveyance` decimal(8,2) DEFAULT NULL,
  `special_allowance` decimal(8,2) DEFAULT NULL,
  `gross_salary_A` decimal(8,2) DEFAULT NULL,
  `is_pf_deduct` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_contribution` decimal(8,2) DEFAULT NULL,
  `esi_employee_contribution` decimal(8,2) DEFAULT NULL,
  `labour_welfare_employee` decimal(8,2) DEFAULT NULL,
  `professional_tax` decimal(8,2) DEFAULT NULL,
  `employee_contri_B` decimal(8,2) DEFAULT NULL,
  `net_salary_C` decimal(8,2) DEFAULT NULL,
  `employer_contribution` decimal(8,2) DEFAULT NULL,
  `esi_employer_contribution` decimal(8,2) DEFAULT NULL,
  `labour_welfare_employer` decimal(8,2) DEFAULT NULL,
  `employee_contri_D` decimal(8,2) DEFAULT NULL,
  `ctc_BCD` decimal(8,2) DEFAULT NULL,
  `final_amount` decimal(8,2) DEFAULT NULL,
  `payment_mode` int DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_salary_slip_generate` int NOT NULL DEFAULT '0' COMMENT '1 for Yes, 0 for No',
  `salary_slip_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_salaries`
--

INSERT INTO `tbl_salaries` (`id`, `user_id`, `month_year`, `present_days`, `total_week_off`, `paid_holiday`, `number_of_paid_leaves`, `absent_days`, `total_days`, `number_of_days_work`, `per_day_salary`, `overtime_work_hr`, `ot_per_hr_rs`, `basic`, `hra`, `medical`, `education`, `conveyance`, `special_allowance`, `gross_salary_A`, `is_pf_deduct`, `employee_contribution`, `esi_employee_contribution`, `labour_welfare_employee`, `professional_tax`, `employee_contri_B`, `net_salary_C`, `employer_contribution`, `esi_employer_contribution`, `labour_welfare_employer`, `employee_contri_D`, `ctc_BCD`, `final_amount`, `payment_mode`, `remark`, `is_salary_slip_generate`, `salary_slip_path`, `created_at`, `updated_at`) VALUES
(1, 4, '2024-09', '2.00', 9, 6, NULL, '13.00', 30, '17.00', '500.00', NULL, NULL, '5666.67', '566.67', '566.67', '566.67', '566.67', '566.67', '8500.00', 'No', '0.00', '120.00', '1.00', '200.00', '321.00', '8179.00', '0.00', NULL, NULL, '0.00', '8500.00', '8500.00', 2, NULL, 1, 'salary-slip/emp-103-2024-09.pdf', '2024-09-30 06:25:00', '2024-09-30 06:25:03');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salary_histories`
--

CREATE TABLE `tbl_salary_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `year` year DEFAULT NULL,
  `job_type` int DEFAULT NULL COMMENT '1 for Job, 2 for Internship',
  `user_id` int DEFAULT NULL,
  `gross_salary_yearly` decimal(8,2) DEFAULT NULL,
  `gross_salary_monthly` decimal(8,2) DEFAULT NULL,
  `basic_yearly` decimal(8,2) DEFAULT NULL,
  `basic_monthly` decimal(8,2) DEFAULT NULL,
  `hra_yearly` decimal(8,2) DEFAULT NULL,
  `hra_monthly` decimal(8,2) DEFAULT NULL,
  `medical_yearly` decimal(8,2) DEFAULT NULL,
  `medical_monthly` decimal(8,2) DEFAULT NULL,
  `education_yearly` decimal(8,2) DEFAULT NULL,
  `education_monthly` decimal(8,2) DEFAULT NULL,
  `conveyance_yearly` decimal(8,2) DEFAULT NULL,
  `conveyance_monthly` decimal(8,2) DEFAULT NULL,
  `special_allowance_yearly` decimal(8,2) DEFAULT NULL,
  `special_allowance_monthly` decimal(8,2) DEFAULT NULL,
  `gross_salary_A_yearly` decimal(8,2) DEFAULT NULL COMMENT 'addition basic+hra+medical+education+conveyance+special_allowance',
  `gross_salary_A_monthly` decimal(8,2) DEFAULT NULL COMMENT 'addition basic+hra+medical+education+conveyance+special_allowance',
  `is_pf_deduct_yearly` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_pf_deduct_monthly` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_contribution_yearly` decimal(8,2) DEFAULT NULL,
  `employee_contribution_monthly` decimal(8,2) DEFAULT NULL,
  `esi_employee_contribution_yearly` decimal(8,2) DEFAULT NULL,
  `esi_employee_contribution_monthly` decimal(8,2) DEFAULT NULL,
  `labour_welfare_employee_yearly` decimal(8,2) DEFAULT NULL,
  `labour_welfare_employee_monthly` decimal(8,2) DEFAULT NULL,
  `professional_tax_yearly` decimal(8,2) DEFAULT NULL,
  `professional_tax_monthly` decimal(8,2) DEFAULT NULL,
  `employee_contribution_B_yearly` decimal(8,2) DEFAULT NULL COMMENT 'addition employee_contribution_yearly+labour_welfare_employee_yearly+professional_tax_yearly',
  `employee_contribution_B_monthly` decimal(8,2) DEFAULT NULL COMMENT 'addition employee_contribution_monthly+labour_welfare_employee_monthly+professional_tax_monthly',
  `net_salary_C_yearly` decimal(8,2) DEFAULT NULL COMMENT 'gross_salary_yearly-employee_contribution_B_yearly',
  `net_salary_C_monthly` decimal(8,2) DEFAULT NULL COMMENT 'gross_salary_monthly-employee_contribution_B_monthly',
  `employer_contribution_yearly` decimal(8,2) DEFAULT NULL,
  `employer_contribution_monthly` decimal(8,2) DEFAULT NULL,
  `esi_employer_contribution_yearly` decimal(8,2) DEFAULT NULL,
  `esi_employer_contribution_monthly` decimal(8,2) DEFAULT NULL,
  `labour_welfare_employer_yearly` decimal(8,2) DEFAULT NULL,
  `labour_welfare_employer_monthly` decimal(8,2) DEFAULT NULL,
  `employer_contri_D_yearly` decimal(8,2) DEFAULT NULL,
  `employer_contri_D_monthly` decimal(8,2) DEFAULT NULL,
  `ctc_bcd_yearly` decimal(8,2) DEFAULT NULL COMMENT 'addition = employee_contribution_B_yearly + net_salary_C_yearly + employer_contri_D_yearly',
  `ctc_bcd_monthly` decimal(8,2) DEFAULT NULL COMMENT 'addition = employee_contribution_B_monthly + net_salary_C_yearly + employer_contri_D_monthly',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_salary_histories`
--

INSERT INTO `tbl_salary_histories` (`id`, `year`, `job_type`, `user_id`, `gross_salary_yearly`, `gross_salary_monthly`, `basic_yearly`, `basic_monthly`, `hra_yearly`, `hra_monthly`, `medical_yearly`, `medical_monthly`, `education_yearly`, `education_monthly`, `conveyance_yearly`, `conveyance_monthly`, `special_allowance_yearly`, `special_allowance_monthly`, `gross_salary_A_yearly`, `gross_salary_A_monthly`, `is_pf_deduct_yearly`, `is_pf_deduct_monthly`, `employee_contribution_yearly`, `employee_contribution_monthly`, `esi_employee_contribution_yearly`, `esi_employee_contribution_monthly`, `labour_welfare_employee_yearly`, `labour_welfare_employee_monthly`, `professional_tax_yearly`, `professional_tax_monthly`, `employee_contribution_B_yearly`, `employee_contribution_B_monthly`, `net_salary_C_yearly`, `net_salary_C_monthly`, `employer_contribution_yearly`, `employer_contribution_monthly`, `esi_employer_contribution_yearly`, `esi_employer_contribution_monthly`, `labour_welfare_employer_yearly`, `labour_welfare_employer_monthly`, `employer_contri_D_yearly`, `employer_contri_D_monthly`, `ctc_bcd_yearly`, `ctc_bcd_monthly`, `created_at`, `updated_at`) VALUES
(1, 2024, 1, 2, '200000.00', '15000.00', '180000.00', '5000.00', '4000.00', '2000.00', '4000.00', '2000.00', '4000.00', '2000.00', '4000.00', '2000.00', '4000.00', '2000.00', '200000.00', '15000.00', 'No', 'No', '0.00', '0.00', '1200.00', '120.00', '12.00', '1.00', '2400.00', '200.00', '3612.00', '321.00', '196388.00', '14679.00', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '200000.00', '15000.00', '2024-09-19 04:12:27', '2024-09-25 08:55:28'),
(2, 2024, 1, 2, '200000.00', '15000.00', '180000.00', '5000.00', '4000.00', '2000.00', '4000.00', '2000.00', '4000.00', '2000.00', '4000.00', '2000.00', '4000.00', '2000.00', '200000.00', '15000.00', 'No', 'No', '0.00', '0.00', '1200.00', '120.00', '12.00', '1.00', '2400.00', '200.00', '3612.00', '321.00', '196388.00', '14679.00', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '200000.00', '15000.00', '2024-09-19 06:26:54', '2024-09-19 06:26:54'),
(3, 2024, 1, 3, '324000.00', '27000.00', '129600.00', '10800.00', '51840.00', '4320.00', '15000.00', '1250.00', '12000.00', '1000.00', '19200.00', '1600.00', '96360.00', '8030.00', '324000.00', '27000.00', 'Yes', 'Yes', '15552.00', '1296.00', '0.00', '0.00', '12.00', '1.00', '2400.00', '200.00', '17964.00', '1497.00', '306036.00', '25503.00', '0.00', '0.00', '0.00', '0.00', '24.00', '2.00', '24.00', '2.00', '324024.00', '27002.00', '2024-09-19 06:27:09', '2024-09-19 06:27:09'),
(4, 2024, 1, 4, '200000.00', '15000.00', '180000.00', '10000.00', '4000.00', '1000.00', '4000.00', '1000.00', '4000.00', '1000.00', '4000.00', '1000.00', '4000.00', '1000.00', '200000.00', '15000.00', 'No', 'No', '0.00', '0.00', '1200.00', '120.00', '12.00', '1.00', '2400.00', '200.00', '3612.00', '321.00', '196388.00', '14679.00', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '200000.00', '15000.00', '2024-09-24 05:15:05', '2024-09-24 05:51:02'),
(5, 2024, 1, 5, '250000.00', '20000.00', '200000.00', '15000.00', '10000.00', '1000.00', '10000.00', '1000.00', '10000.00', '1000.00', '10000.00', '1000.00', '10000.00', '1000.00', '250000.00', '20000.00', 'Yes', 'Yes', '24000.00', '1800.00', '20000.00', '1200.00', '12.00', '1.00', '2400.00', '200.00', '46412.00', '3201.00', '203588.00', '16799.00', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '250000.00', '20000.00', '2024-09-24 08:35:28', '2024-09-24 09:12:39'),
(6, 2024, 1, 6, '240000.00', '20000.00', '200000.00', '15000.00', '8000.00', '1000.00', '8000.00', '1000.00', '8000.00', '1000.00', '8000.00', '1000.00', '8000.00', '1000.00', '240000.00', '20000.00', 'No', 'No', '0.00', '0.00', '12000.00', '1200.00', '120.00', '10.00', '2400.00', '200.00', '14520.00', '1410.00', '225480.00', '18590.00', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '240000.00', '20000.00', '2024-09-24 09:55:02', '2024-09-24 11:22:19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `master_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `config_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `master_key`, `config_key`, `config_value`, `created_at`, `updated_at`) VALUES
(1, 'config', 'config_company_name', 'Inbox Infotech Pvt. Ltd.', NULL, '2024-09-16 09:26:28'),
(2, 'config', 'config_company_email', 'inbox-infotech@gmail.com', NULL, '2024-09-16 09:26:28'),
(3, 'config', 'config_company_mobile_no', '1234567890', NULL, '2024-09-16 09:26:28'),
(4, 'config', 'config_company_address', 'address123', NULL, '2024-09-16 09:26:28'),
(5, 'config', 'config_company_logo', 'setting/inbox-logo.png', NULL, '2024-09-16 09:26:28'),
(6, 'config', 'config_fav_icon', 'setting/fav-icon.png', NULL, '2024-09-16 09:26:28'),
(7, 'config', 'config_start_financial_year', '8', NULL, '2024-08-24 10:45:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` bigint UNSIGNED NOT NULL,
  `designation_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `emp_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_type` int DEFAULT NULL COMMENT '1 for Job, 2 for Internship',
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `mobile_no` bigint DEFAULT NULL,
  `personal_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int DEFAULT NULL COMMENT '1 for Male, 2 for Female',
  `dob` date DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `releaving_date` date DEFAULT NULL,
  `probation_end_date` date DEFAULT NULL,
  `confirmation_date` date DEFAULT NULL,
  `profile_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temporary_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `permanent_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1' COMMENT '1 for active, 0 for inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `designation_id`, `department_id`, `emp_id`, `job_type`, `first_name`, `middle_name`, `last_name`, `email`, `email_verified_at`, `mobile_no`, `personal_email`, `password`, `gender`, `dob`, `joining_date`, `releaving_date`, `probation_end_date`, `confirmation_date`, `profile_image`, `temporary_address`, `permanent_address`, `remember_token`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, 'emp-101', NULL, 'Admin', NULL, 'Admin', 'admin@example.com', NULL, 1234567890, NULL, '$2y$10$.yA3BEYGU6ySCHVN9ffCWOjKT0JGkunXs2SN5fAQnt7wqK7REUusO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BiiLKuTfiueuuFfP65xczenOujGtRCyCcXUBZjSGga18Kkvc7GGALkt0kCGq', 1, '2024-06-11 16:57:20', '2024-09-17 12:21:31', NULL),
(2, 9, 1, 'emp-102', 1, 'Payal', NULL, 'Khanvilkar', 'payal.khanvilkar@inbox-infotech.com', NULL, 9874563210, NULL, '$2y$10$7j.3W2U9cfmcbdcAAs3h6Ov7ONNkULuGwN3yxXmG8L6OV7TOAJah6', 2, '2016-04-22', '2024-01-01', NULL, '2024-02-29', '2024-09-25', NULL, NULL, NULL, NULL, 1, '2024-09-19 06:26:54', '2024-09-25 08:55:27', NULL),
(3, 9, 1, 'emp-102', 1, 'Rahul', NULL, 'Patil', 'rahul.patil@inbox-infotech.com', NULL, 9545276255, 'rahulpatil2163@gmail.com', '$2y$10$r8VjKU9yqIch1AsKyru9celbFrQurzbSyGzK1Rn/yxvs6rZRepa8y', 1, '2024-09-01', '2024-06-03', NULL, '2024-08-31', NULL, NULL, 'Vadodara', 'Vadodara', NULL, 1, '2024-09-19 06:27:09', '2024-09-19 06:27:09', NULL),
(4, 6, 6, 'emp-103', 1, 'Rhythm', NULL, 'Patel', 'Rhythm@gmail.com', NULL, 1236412300, NULL, '$2y$10$0K9XQXf3oP/9y1rXuDVUW.RdOuCa5BzGfWlUCYtZqcw5jUiJEwnLG', 1, '2016-02-02', '2024-01-01', NULL, '2024-06-30', '2024-09-24', 'profile_image/24092024335.jpg', NULL, NULL, NULL, 1, '2024-09-24 05:15:05', '2024-09-24 07:10:28', NULL),
(5, 1, 6, 'emp-104', 1, 'Pratham', NULL, 'P', 'Pratham@gmail.com', NULL, 1236541235, NULL, '$2y$10$80qlIRCEvwlNMT2Vx80zquMD2gbwjK4ZVJ6jWAoUOK/JQbkNiBw5u', 1, '2015-01-01', '2023-01-16', NULL, '2024-01-31', '2024-09-24', NULL, NULL, NULL, NULL, 1, '2024-09-24 08:35:28', '2024-09-24 09:36:47', '2024-09-24 09:36:47'),
(6, 10, 6, 'emp-105', 1, 'Pihu', NULL, 'Patel', 'pihu@gmail.com', NULL, 4563214560, NULL, '$2y$10$9BisahFYuR8DmX6Pr57lm.K3ndhGTLNUC6qgfqt99/nMyU3GFYlby', 2, '2013-02-06', '2024-03-01', NULL, '2024-05-29', '2024-09-24', NULL, NULL, NULL, NULL, 1, '2024-09-24 09:55:02', '2024-09-27 06:57:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_details`
--

CREATE TABLE `tbl_user_details` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ac_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ifsc_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uan_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gross_salary_yearly` decimal(8,2) DEFAULT NULL,
  `gross_salary_monthly` decimal(8,2) DEFAULT NULL,
  `basic_yearly` decimal(8,2) DEFAULT NULL,
  `basic_monthly` decimal(8,2) DEFAULT NULL,
  `hra_yearly` decimal(8,2) DEFAULT NULL,
  `hra_monthly` decimal(8,2) DEFAULT NULL,
  `medical_yearly` decimal(8,2) DEFAULT NULL,
  `medical_monthly` decimal(8,2) DEFAULT NULL,
  `education_yearly` decimal(8,2) DEFAULT NULL,
  `education_monthly` decimal(8,2) DEFAULT NULL,
  `conveyance_yearly` decimal(8,2) DEFAULT NULL,
  `conveyance_monthly` decimal(8,2) DEFAULT NULL,
  `special_allowance_yearly` decimal(8,2) DEFAULT NULL,
  `special_allowance_monthly` decimal(8,2) DEFAULT NULL,
  `gross_salary_A_yearly` decimal(8,2) DEFAULT NULL COMMENT 'addition basic+hra+medical+education+conveyance+special_allowance',
  `gross_salary_A_monthly` decimal(8,2) DEFAULT NULL COMMENT 'addition basic+hra+medical+education+conveyance+special_allowance',
  `is_pf_deduct_yearly` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_pf_deduct_monthly` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_contribution_yearly` decimal(8,2) DEFAULT NULL,
  `employee_contribution_monthly` decimal(8,2) DEFAULT NULL,
  `esi_employee_contribution_yearly` decimal(8,2) DEFAULT NULL,
  `esi_employee_contribution_monthly` decimal(8,2) DEFAULT NULL,
  `labour_welfare_employee_yearly` decimal(8,2) DEFAULT NULL,
  `labour_welfare_employee_monthly` decimal(8,2) DEFAULT NULL,
  `professional_tax_yearly` decimal(8,2) DEFAULT NULL,
  `professional_tax_monthly` decimal(8,2) DEFAULT NULL,
  `employee_contribution_B_yearly` decimal(8,2) DEFAULT NULL COMMENT 'addition employee_contribution_yearly+labour_welfare_employee_yearly+professional_tax_yearly',
  `employee_contribution_B_monthly` decimal(8,2) DEFAULT NULL COMMENT 'addition employee_contribution_monthly+labour_welfare_employee_monthly+professional_tax_monthly',
  `net_salary_C_yearly` decimal(8,2) DEFAULT NULL COMMENT 'gross_salary_yearly-employee_contribution_B_yearly',
  `net_salary_C_monthly` decimal(8,2) DEFAULT NULL COMMENT 'gross_salary_monthly-employee_contribution_B_monthly',
  `employer_contribution_yearly` decimal(8,2) DEFAULT NULL,
  `employer_contribution_monthly` decimal(8,2) DEFAULT NULL,
  `esi_employer_contribution_yearly` decimal(8,2) DEFAULT NULL,
  `esi_employer_contribution_monthly` decimal(8,2) DEFAULT NULL,
  `labour_welfare_employer_yearly` decimal(8,2) DEFAULT NULL,
  `labour_welfare_employer_monthly` decimal(8,2) DEFAULT NULL,
  `employer_contri_D_yearly` decimal(8,2) DEFAULT NULL,
  `employer_contri_D_monthly` decimal(8,2) DEFAULT NULL,
  `ctc_bcd_yearly` decimal(8,2) DEFAULT NULL COMMENT 'addition = employee_contribution_B_yearly + net_salary_C_yearly + employer_contri_D_yearly',
  `ctc_bcd_monthly` decimal(8,2) DEFAULT NULL COMMENT 'addition = employee_contribution_B_monthly + net_salary_C_yearly + employer_contri_D_monthly',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_user_details`
--

INSERT INTO `tbl_user_details` (`id`, `user_id`, `bank_name`, `bank_branch_name`, `ac_no`, `ifsc_code`, `uan_number`, `gross_salary_yearly`, `gross_salary_monthly`, `basic_yearly`, `basic_monthly`, `hra_yearly`, `hra_monthly`, `medical_yearly`, `medical_monthly`, `education_yearly`, `education_monthly`, `conveyance_yearly`, `conveyance_monthly`, `special_allowance_yearly`, `special_allowance_monthly`, `gross_salary_A_yearly`, `gross_salary_A_monthly`, `is_pf_deduct_yearly`, `is_pf_deduct_monthly`, `employee_contribution_yearly`, `employee_contribution_monthly`, `esi_employee_contribution_yearly`, `esi_employee_contribution_monthly`, `labour_welfare_employee_yearly`, `labour_welfare_employee_monthly`, `professional_tax_yearly`, `professional_tax_monthly`, `employee_contribution_B_yearly`, `employee_contribution_B_monthly`, `net_salary_C_yearly`, `net_salary_C_monthly`, `employer_contribution_yearly`, `employer_contribution_monthly`, `esi_employer_contribution_yearly`, `esi_employer_contribution_monthly`, `labour_welfare_employer_yearly`, `labour_welfare_employer_monthly`, `employer_contri_D_yearly`, `employer_contri_D_monthly`, `ctc_bcd_yearly`, `ctc_bcd_monthly`, `created_at`, `updated_at`) VALUES
(1, 2, 'eyJpdiI6IlB6OHJpMnE2WDRFRDZ4UmxVZzN6R1E9PSIsInZhbHVlIjoiZCtXaUUyQlVCbGJqME5vNVQ4eXBpZz09IiwibWFjIjoiYjFjYmMxOTYxNTViNTQ3M2JkMzA2NDkwYmRjODk0ZGUzMThhYzcxMGY3YWVjOTZlOTEyYTFkOWI0OWQxYzQ4NCIsInRhZyI6IiJ9', 'eyJpdiI6InJoeVhvMFZZZVFSY3ZrYmx2cDdxekE9PSIsInZhbHVlIjoiQlZSemFDL2JiaUtuaW5WUU1iWmlwQT09IiwibWFjIjoiNGRkMDRjOTZiZDc1ODA5ZDYxNDg1Y2UyYjMzOTllNDg4Y2ZhMmJhZjhhYWEyNDA2MTI0MDFkMjM5NGJjNDk4MiIsInRhZyI6IiJ9', 'eyJpdiI6Ik1SWndWVzJ6L1EreFhTd3Jrb2ljOHc9PSIsInZhbHVlIjoiWlZBZ0hIUk1xMnBicEFQR2M4NzFiQT09IiwibWFjIjoiOGJiYzllNGUyNzg0N2YxYmZkYzQyYTZjNjQxY2QwMmI3YWNmNTdiNTdkYTA4ZTQ2ZTA2M2YyNzhiNGQ4NjA0OSIsInRhZyI6IiJ9', 'eyJpdiI6Ik8yNjRFMzlkbW9neklOVENja0FxbUE9PSIsInZhbHVlIjoicTZtTVk5YVdVUlAxTlVkaXEydG1OQT09IiwibWFjIjoiOGZlMTM3ZmNiNWE1NjZmMGQ3ZDNmZTdkM2Q4MTNiNmY5NTE0NDE2OTMyNDg5ZDc0ZjJiYzM0ODU2MjU4NGFmMyIsInRhZyI6IiJ9', '123654123', '200000.00', '15000.00', '180000.00', '5000.00', '4000.00', '2000.00', '4000.00', '2000.00', '4000.00', '2000.00', '4000.00', '2000.00', '4000.00', '2000.00', '200000.00', '15000.00', 'No', 'No', '0.00', '0.00', '1200.00', '120.00', '12.00', '1.00', '2400.00', '200.00', '3612.00', '321.00', '196388.00', '14679.00', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '200000.00', '15000.00', '2024-09-19 06:26:54', '2024-09-25 08:55:27'),
(2, 3, 'eyJpdiI6InFtVGd0aGZLZlYxVDd3QldpTGFDVlE9PSIsInZhbHVlIjoiSTFOdnlibTJXdzg4dGFhaUJPL0dXRGtURGdZZmRVNEw0dzFjMXhNb0RSYz0iLCJtYWMiOiJjYThlZjY2NTE1NDgyZmUyMTEzNmFmOGQ1MDVmMDA5ZDY1YTZiYTU2MjM2Zjg1NzI1ZjQ2YWVkNDYxZTQ2OWQyIiwidGFnIjoiIn0=', 'eyJpdiI6IithQkcrSGcrbCtDakpmMUo3d1RVN1E9PSIsInZhbHVlIjoid3UwVHpBNElwckYyN1E4eTM3QmNEZz09IiwibWFjIjoiYTkwZDRjYjMxNGI0ODYzZTRiZjRmYTQ4M2IwMWM3N2MwNTRjZmY2MGE0YTg3NWZiYWViODZjZDkwYWE0ODUxNyIsInRhZyI6IiJ9', 'eyJpdiI6IllvTVoyRk12R3dGb0Z2QXlvZFU5RkE9PSIsInZhbHVlIjoiWk5laGtMTFZESmFlQ0xZOE5jWGtNeTJrZUVqWTN1c1JvZ2txcVB4MzZpZz0iLCJtYWMiOiJiY2I2N2U3NTY0MTM1MGY4MTk3ZTEyZTFkOGIzYmJmODdhNTI3MWYxYWYxMWJjNjQ2MjM4YWQ3ZTlmMzA2YTI1IiwidGFnIjoiIn0=', 'eyJpdiI6ImFXVUoyeUNUSkFUZ0krdDZWRVBQZmc9PSIsInZhbHVlIjoiSjBMMWxUckpEVXRaRllnZ0R6VVAySHFUTG1PYTFNL3dEK2c1b0xnV2dGbz0iLCJtYWMiOiJkMTQyOTkyODdiNjIxNzhkMWU0YTIwMmI3YmNmMWE3YTY0NTdkYmI0OTQ1NmM5ZTNjODIwOGNhYjExZjgzMTFhIiwidGFnIjoiIn0=', NULL, '324000.00', '27000.00', '129600.00', '10800.00', '51840.00', '4320.00', '15000.00', '1250.00', '12000.00', '1000.00', '19200.00', '1600.00', '96360.00', '8030.00', '324000.00', '27000.00', 'Yes', 'Yes', '15552.00', '1296.00', '0.00', '0.00', '12.00', '1.00', '2400.00', '200.00', '17964.00', '1497.00', '306036.00', '25503.00', '0.00', '0.00', '0.00', '0.00', '24.00', '2.00', '24.00', '2.00', '324024.00', '27002.00', '2024-09-19 06:27:09', '2024-09-19 06:27:09'),
(3, 4, 'eyJpdiI6IjVvaCsrbjJUL1p6UitpRmRvNmFVL2c9PSIsInZhbHVlIjoiWGVzNStpd3lwZ0RQQ2xzTExQYjdmZz09IiwibWFjIjoiM2E5N2RiN2NhNzI2NTBlYTc0M2U0YWRlOTNiZGM3NjkxZjI1YjRjOGYyMTY5ZTQ5Y2VkYzA1NGUxZTFhNTIxNyIsInRhZyI6IiJ9', 'eyJpdiI6IkU0Mm1SUVdZNXhNdU5IaXlOZXZ0OEE9PSIsInZhbHVlIjoiL0pmdldhb1VvbGZWenRVcFhBc2ZjQT09IiwibWFjIjoiYjU4ODRiY2FlNDM3YjA2MTczZjI3ZGYwNTdiYjBhMTBlZGRjMGQ0MDBiYWU5ZWRjZWVhYmE5M2Q3N2NjZTBiYiIsInRhZyI6IiJ9', 'eyJpdiI6InVCWkR6Z1FvQ1BqNTVacERrbGwwTnc9PSIsInZhbHVlIjoiZmV0R0Qyaks1ejNXLy9hUTBZQkZldz09IiwibWFjIjoiZjI3OWZhM2M1ZDgxZDI5Y2ZiN2U4YTliMTNmYWMyYmFiYmUzNmRiMTg0MWU3ZjIxODdjZDE0OTA4MGZhOGUxZiIsInRhZyI6IiJ9', 'eyJpdiI6ImdYQ3BFdjdOOEF1WEQ1bjh1NzErZmc9PSIsInZhbHVlIjoidDNraXBoTzlmaVMxa2NiYTJBeldFUT09IiwibWFjIjoiOTNkZmNjOGU3NmMwOTQzNzdlMGE5M2IxOThmZWFmNWY4YjlhYjNjMTFiODQ4MzUyYjdlOTI4NWU5YjM4YmFlZCIsInRhZyI6IiJ9', NULL, '200000.00', '15000.00', '180000.00', '10000.00', '4000.00', '1000.00', '4000.00', '1000.00', '4000.00', '1000.00', '4000.00', '1000.00', '4000.00', '1000.00', '200000.00', '15000.00', 'No', 'No', '0.00', '0.00', '1200.00', '120.00', '12.00', '1.00', '2400.00', '200.00', '3612.00', '321.00', '196388.00', '14679.00', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '200000.00', '15000.00', '2024-09-24 05:15:05', '2024-09-24 05:51:02'),
(4, 5, 'eyJpdiI6IkxhS2txVThnQmhWNHdFaTdhSDlWOHc9PSIsInZhbHVlIjoiUEtwL1BTYWtveWV3alQ2UzlaeDdlQT09IiwibWFjIjoiZWRiYTc5YjZkMmFiYzdlM2M3ZGJhM2UzODgxMTU0NjQ5MDhiZGYzNmFmZjFhODEzZjcyZmNiNzQ0MWUwYTk0NSIsInRhZyI6IiJ9', 'eyJpdiI6InJlUThJMGw3NzNTb2RIT01NNW43cmc9PSIsInZhbHVlIjoiTXkxMjljM1lpM3lhNXV5K2Z4TW5xdz09IiwibWFjIjoiYjU4MGQ1MDZmZjljM2QwOTdiYTc5OWVlNDIzOGRlMzY2NDdmMDNkY2NlNGU4NDNkYTA1OTU4ZWU5NjliNTkzOSIsInRhZyI6IiJ9', 'eyJpdiI6Ik10UXlsRzNlYnZLMG1CU0xjMGIyNXc9PSIsInZhbHVlIjoiMzZtTGJYSmJISWtZZ0Q0MUUyTjQyUT09IiwibWFjIjoiYTE4ZjU2YjlhZTc5MjU2MjI2NTk3YmVmNWNiZTY2MjBkYzQzNWZjZTYwNDEwMjUzMDlhMDM3MjY0NWNjOWIzYiIsInRhZyI6IiJ9', 'eyJpdiI6InpRYjlUVEwrUm1Wcm5VR0pvaFlHTUE9PSIsInZhbHVlIjoiRTlmS2pJZWRHZTJlaUUrK240a1NZdz09IiwibWFjIjoiNzYzMmE0MjA4NGVkMzlkNjdhNTM2ODYzYzlhYmNjNTkzM2FhNjJmNWVhZmY3YjEwNmE0ZTFmYThlYzQzYzNkMCIsInRhZyI6IiJ9', NULL, '250000.00', '20000.00', '200000.00', '15000.00', '10000.00', '1000.00', '10000.00', '1000.00', '10000.00', '1000.00', '10000.00', '1000.00', '10000.00', '1000.00', '250000.00', '20000.00', 'Yes', 'Yes', '24000.00', '1800.00', '20000.00', '1200.00', '12.00', '1.00', '2400.00', '200.00', '46412.00', '3201.00', '203588.00', '16799.00', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '250000.00', '20000.00', '2024-09-24 08:35:28', '2024-09-24 09:12:39'),
(5, 6, 'eyJpdiI6IjJyRm9SeEpmcHl3RlU1b0VGb2Q0Rnc9PSIsInZhbHVlIjoiYVdJV1JFVHBzUmlVNmZWOStyMkR4QT09IiwibWFjIjoiZjU3YzFkOGUzMDc1NDdlZmNlZGMxZmE5MGVjZWY1ZmZhZTQ4Y2RhODA2YjRmMWUzNTk0ZmI0NTkxOTVkODQyYyIsInRhZyI6IiJ9', 'eyJpdiI6Ikx5Umg5NDY5dlNidnF6MklBUzQ5dXc9PSIsInZhbHVlIjoiWDV6Ly83UmVaR1JvWHUzWms1ckZ1Zz09IiwibWFjIjoiZjkxNWUxZTE1M2NlZjAzNWQ4NGU3NTExZTJlNmQ4YTJiNDA2OWJkMWRlNzBkOTkxMDA2NzlhM2Y1YjMwMGQ2MiIsInRhZyI6IiJ9', 'eyJpdiI6IkQxZmtSQnQ5cm90U0VtcGhSd21uMVE9PSIsInZhbHVlIjoibmdwNVBUUEh6VUVGb05UWFJmdStyZz09IiwibWFjIjoiMzMwNWI0N2MzMzUxMTI4YTVhZTE0ODgxMjQ1N2VhM2MyYzhlYzg2YjY4MWIxZjE5M2Q0YzkwYWE1NzJiYzdjNyIsInRhZyI6IiJ9', 'eyJpdiI6ImpTeUdnc1ExdjdSSXdCT2lxc0ZiTXc9PSIsInZhbHVlIjoiNDNUV3doY2srMkFHZ1pLcXJJeUVHdz09IiwibWFjIjoiMDAyMDFjZWVhY2NlODRhMjIzZmNjN2IzYzI1YzhhZGYyNzU1OWIwOWJkOGM4NDUwY2RjNjBlNGM5YjdmNmJiNyIsInRhZyI6IiJ9', '14566122', '240000.00', '20000.00', '200000.00', '15000.00', '8000.00', '1000.00', '8000.00', '1000.00', '8000.00', '1000.00', '8000.00', '1000.00', '8000.00', '1000.00', '240000.00', '20000.00', 'No', 'No', '0.00', '0.00', '12000.00', '1200.00', '120.00', '10.00', '2400.00', '200.00', '14520.00', '1410.00', '225480.00', '18590.00', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '240000.00', '20000.00', '2024-09-24 09:55:02', '2024-09-24 11:22:19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_documents`
--

CREATE TABLE `tbl_user_documents` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `document_type` int NOT NULL COMMENT '1 for Internship Offer Letter, 2 for Confirmation Letter, 3 Offer Letter, 4 Appoitment Offer, 5 Experience Letter',
  `document_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_assign_leaves`
--
ALTER TABLE `tbl_assign_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_departments`
--
ALTER TABLE `tbl_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_designations`
--
ALTER TABLE `tbl_designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_failed_jobs`
--
ALTER TABLE `tbl_failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tbl_failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `tbl_holiday_leaves`
--
ALTER TABLE `tbl_holiday_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_leaves`
--
ALTER TABLE `tbl_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_leave_applies`
--
ALTER TABLE `tbl_leave_applies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_migrations`
--
ALTER TABLE `tbl_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_model_has_permissions`
--
ALTER TABLE `tbl_model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `tbl_model_has_roles`
--
ALTER TABLE `tbl_model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `tbl_permissions`
--
ALTER TABLE `tbl_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tbl_permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `tbl_personal_access_tokens`
--
ALTER TABLE `tbl_personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tbl_personal_access_tokens_token_unique` (`token`),
  ADD KEY `tbl_personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tbl_projects`
--
ALTER TABLE `tbl_projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_punch_in_outs`
--
ALTER TABLE `tbl_punch_in_outs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tbl_roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `tbl_role_has_permissions`
--
ALTER TABLE `tbl_role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `tbl_role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `tbl_salaries`
--
ALTER TABLE `tbl_salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_salary_histories`
--
ALTER TABLE `tbl_salary_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tbl_users_email_unique` (`email`),
  ADD UNIQUE KEY `tbl_users_personal_email_unique` (`personal_email`);

--
-- Indexes for table `tbl_user_details`
--
ALTER TABLE `tbl_user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_documents`
--
ALTER TABLE `tbl_user_documents`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_assign_leaves`
--
ALTER TABLE `tbl_assign_leaves`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_departments`
--
ALTER TABLE `tbl_departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_designations`
--
ALTER TABLE `tbl_designations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_failed_jobs`
--
ALTER TABLE `tbl_failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_holiday_leaves`
--
ALTER TABLE `tbl_holiday_leaves`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tbl_leaves`
--
ALTER TABLE `tbl_leaves`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_leave_applies`
--
ALTER TABLE `tbl_leave_applies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_migrations`
--
ALTER TABLE `tbl_migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `tbl_permissions`
--
ALTER TABLE `tbl_permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tbl_personal_access_tokens`
--
ALTER TABLE `tbl_personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_projects`
--
ALTER TABLE `tbl_projects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_punch_in_outs`
--
ALTER TABLE `tbl_punch_in_outs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_salaries`
--
ALTER TABLE `tbl_salaries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_salary_histories`
--
ALTER TABLE `tbl_salary_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_user_details`
--
ALTER TABLE `tbl_user_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_user_documents`
--
ALTER TABLE `tbl_user_documents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_model_has_permissions`
--
ALTER TABLE `tbl_model_has_permissions`
  ADD CONSTRAINT `tbl_model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `tbl_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_model_has_roles`
--
ALTER TABLE `tbl_model_has_roles`
  ADD CONSTRAINT `tbl_model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `tbl_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_role_has_permissions`
--
ALTER TABLE `tbl_role_has_permissions`
  ADD CONSTRAINT `tbl_role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `tbl_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `tbl_roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

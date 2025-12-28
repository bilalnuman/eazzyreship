-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 10, 2025 at 10:26 PM
-- Server version: 10.6.20-MariaDB-cll-lve
-- PHP Version: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eazzy_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `state_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `responsible_mobile` varchar(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `is_archived` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `email`, `responsible_mobile`, `country_id`, `state_id`, `area_id`, `address`, `type`, `is_archived`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Sint Maarten - Pondfill', 'jcarlosflores_@hotmail.com', '+1 721-580-9212', 250, 4902, NULL, 'Pondfill', 1, 0, NULL, NULL, '2024-12-05 20:27:57', '2025-01-12 20:03:17'),
(2, 'Anguilla', 'jcarlosflores_@hotmaill.com', '+1 721-580-9900', 8, 4906, NULL, 'The Valley', 1, 0, NULL, NULL, '2024-12-11 20:59:27', '2025-01-04 08:53:03'),
(3, 'Saint Barth', 'sbarth@miami.com', '+1600689504', 189, 4905, NULL, 'Gustavia', 1, 0, NULL, NULL, '2024-12-15 20:20:01', '2025-01-04 05:35:45'),
(4, 'Saint Kitts and Nevis', 'skn@admin.com', '+1600689504', 185, 4904, NULL, 'Basseterre', 1, 0, NULL, NULL, '2024-12-15 20:20:01', '2025-01-04 05:35:23'),
(5, 'Saint Martin - Marigot', 'smf@admin.com', '+590689504', 190, 4903, NULL, 'Marigot', 1, 0, NULL, NULL, '2024-12-15 20:20:01', '2025-01-12 20:02:57'),
(6, 'Miami', 'info@eazzyreship.com', '+1 786-824-6549', 233, 1436, NULL, '8069 NW 67th Street, Miami FL 33166', 1, 0, NULL, NULL, '2024-12-15 20:20:01', '2025-01-09 06:40:59'),
(7, 'Saba', 'a@a.COM', NULL, 250, 4907, NULL, 'MAKANA FERRY TERMINAL', 1, 0, NULL, NULL, '2025-01-04 09:03:18', '2025-01-04 09:03:18'),
(8, 'Sint Eustatius', 'A@a.COM', NULL, 250, 4907, NULL, 'MAKANA FERRY TERMINAL', 1, 0, NULL, NULL, '2025-01-04 09:05:14', '2025-01-04 09:05:14');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(200) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `national_id` varchar(255) DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `branch_id` int(10) UNSIGNED DEFAULT NULL,
  `is_archived` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `code`, `user_id`, `name`, `email`, `mobile`, `national_id`, `picture`, `address`, `branch_id`, `is_archived`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'SX1', 1, 'Vmeasure', 'jcarlosfv3@gmail.com', '+1715809210', '6866895', NULL, 'por alli', 1, 0, NULL, NULL, '2024-12-14 03:11:21', '2024-12-24 15:25:40'),
(5, 'SX5', 5, 'juan', 'jcarlosfv1@gmail.com', '+1 721 5809210', NULL, NULL, NULL, 1, 0, NULL, NULL, '2024-12-21 21:26:38', '2024-12-22 03:43:17'),
(6, 'SX6', 6, 'carl', 'jcarlosfv2@gmail.com', '+1 721-580-9210', NULL, NULL, NULL, 1, 0, NULL, NULL, '2024-12-23 00:11:41', '2024-12-23 00:11:41'),
(7, 'SX7', 7, 'charliee', 'jcarlosfv4@gmail.com', '+1 721-550-9210', NULL, NULL, NULL, 1, 0, NULL, NULL, '2024-12-24 14:26:13', '2024-12-24 14:57:49'),
(8, 'SX8', 8, 'ARTI BHAGIA', 'artibhagia@gmail.com', '+17215884262', NULL, NULL, NULL, 1, 0, NULL, NULL, '2024-12-31 07:26:13', '2024-12-31 07:26:13'),
(9, 'SX9', 9, 'jcarlos', 'jcarlosfv33@gmail.com', '+1 721-580-9210', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-01 15:51:45', '2025-01-01 15:51:45'),
(10, 'SX10', 10, 'Eazzyreship', 'eazzyreship@gmail.com', '+17215545297', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-01 22:37:42', '2025-01-01 22:37:42'),
(11, 'SX11', 11, 'NARESH BHAGIA', 'nashbhagia@gmail.com', '+1 721-554-5297', NULL, 'customers/15BCKMV1RUOWQuVyATcMGMRMPEXzbJ7fWOP4uBY1.pdf', NULL, 1, 0, NULL, NULL, '2025-01-01 23:12:45', '2025-01-07 22:18:41'),
(12, 'SX12', 12, 'Kimberly Williams', 'kcwilliams87@gmail.com', '+17215502875', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-03 00:56:48', '2025-01-03 00:56:48'),
(14, 'SX14', 15, 'VIHAAN BHAGIA', 'vihaanbhagia@gmail.com', '+17215811158', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-05 22:16:15', '2025-01-05 22:16:15'),
(16, 'SX16', 17, 'SHOPNTAKE', 'info@shopandtake.com', '+1 721-543-1222', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-05 23:12:28', '2025-01-05 23:12:28'),
(18, 'SX18', 19, 'TEST1234', 'artibhagia@gmail.com', '+17215545297', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-07 04:46:11', '2025-01-07 04:46:11'),
(19, 'SX19', 20, 'Nash Bhagia', 'nashbhagia@yahoo.com', '+17215541234', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-07 04:50:39', '2025-01-07 04:50:39'),
(21, 'SX21', 22, 'Victor Perez', 'victor.sxm@gmail.com', '+17215809900', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-07 05:39:17', '2025-01-07 05:39:17'),
(22, 'SX22', 23, 'TEST1234ARTI', 'nashbhagia@hotmail.com', '+1 721-554-5297', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-09 15:14:25', '2025-01-09 15:14:25'),
(23, 'SX23', 24, 'BRANDON BARTLEY', 'bartley241@hotmail.com', '+17215592494', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-09 18:40:30', '2025-01-09 18:40:30'),
(24, 'SX24', 25, 'Naresh Bhagia', 'nash@shopandtake.com', '+1(305) 280-1457', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-10 14:16:21', '2025-01-10 14:16:21'),
(25, 'SX25', 26, 'John Prescot', 'wilconfab@gmail.com', '+17215815858', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-11 16:28:53', '2025-01-11 16:28:53'),
(26, 'SX26', 27, 'K. W.', 'kimberlychengwilliams@gmail.com', '+1 721-550-2875', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-11 23:51:54', '2025-01-12 00:02:06'),
(27, 'SX27', 28, 'IS', 'islandshawarmasxm@gmail.com', '+1 721-550-2875', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-12 05:40:18', '2025-01-12 05:40:18'),
(28, 'SX28', 29, 'TW', 'techworldsxm@gmail.com', '+1 721-580-0001', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-12 22:10:05', '2025-01-12 22:12:02'),
(29, 'SX29', 30, 'TEST12345', 'artibhagia@mail.com', '+1 721-554-5297', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-13 03:01:24', '2025-01-13 03:01:24'),
(30, 'SX30', 31, 'Glen Alexander', 'mistro34@gmail.com', '+17672458810', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-25 01:16:12', '2025-01-25 01:16:12'),
(31, 'SX31', 32, 'ASHOK SADHWANI', 'ashokmni@yahoo.com', '16644963226', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-03-02 19:33:59', '2025-03-02 19:33:59'),
(32, 'SX32', 33, 'mustak shaikh', 'mustak_007@hotmail.com', '+15545299', NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-03-06 08:04:42', '2025-03-06 08:04:42');

-- --------------------------------------------------------

--
-- Table structure for table `client_addresses`
--

CREATE TABLE `client_addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `address` text DEFAULT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `state_id` int(10) UNSIGNED NOT NULL,
  `area_id` int(10) UNSIGNED DEFAULT NULL,
  `client_street_address_map` text DEFAULT NULL,
  `client_lat` text DEFAULT NULL,
  `client_lng` text DEFAULT NULL,
  `client_url` text DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_archived` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_addresses`
--

INSERT INTO `client_addresses` (`id`, `client_id`, `address`, `country_id`, `state_id`, `area_id`, `client_street_address_map`, `client_lat`, `client_lng`, `client_url`, `is_default`, `is_archived`, `created_at`, `updated_at`) VALUES
(8, 1, 'calle lejos 3', 250, 4902, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-12-14 03:11:21', '2024-12-14 03:11:21'),
(10, 7, 'prueba2', 250, 4902, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-12-24 14:57:49', '2024-12-24 14:57:49'),
(14, 13, 'GROUND DOVE ROAD # 22 ATP # 4, POINTE BLANCHE', 250, 4907, NULL, NULL, NULL, NULL, NULL, 0, 0, '2025-01-05 21:47:36', '2025-01-05 21:47:36'),
(15, 14, '22 Ground Dove Road', 250, 4907, NULL, NULL, NULL, NULL, NULL, 0, 0, '2025-01-05 22:16:16', '2025-01-05 22:16:16'),
(17, 17, 'TEST 1234', 250, 4907, NULL, NULL, NULL, NULL, NULL, 0, 0, '2025-01-07 04:42:50', '2025-01-07 04:42:50'),
(18, 18, 'nisbeth road', 250, 4907, NULL, NULL, NULL, NULL, NULL, 0, 0, '2025-01-07 04:46:11', '2025-01-07 04:46:11'),
(19, 19, 'test 1234', 250, 4907, NULL, NULL, NULL, NULL, NULL, 0, 0, '2025-01-07 04:50:39', '2025-01-07 04:50:39'),
(20, 20, 'hhhhhhhh', 27, 3380, NULL, NULL, NULL, NULL, NULL, 0, 0, '2025-01-07 08:04:26', '2025-01-07 08:04:26'),
(21, 11, 'W.J.A NISBETH ROAD # 73', 250, 4902, NULL, NULL, NULL, NULL, NULL, 0, 0, '2025-01-07 22:18:41', '2025-01-07 22:18:41'),
(22, 26, 'Philipsburg, St. Maarten', 250, 4907, NULL, NULL, NULL, NULL, NULL, 0, 0, '2025-01-12 00:02:06', '2025-01-12 00:02:06'),
(23, 28, NULL, 250, 4907, NULL, NULL, NULL, NULL, NULL, 0, 0, '2025-01-12 22:12:02', '2025-01-12 22:12:02'),
(24, 31, 'Plymouth, Montserrat', 250, 4907, NULL, NULL, NULL, NULL, NULL, 0, 0, '2025-03-02 19:33:59', '2025-03-02 19:33:59');

-- --------------------------------------------------------

--
-- Table structure for table `client_packages`
--

CREATE TABLE `client_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `cost` double NOT NULL DEFAULT 0,
  `name` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_preferences`
--

CREATE TABLE `client_preferences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `pickup_cost` double NOT NULL DEFAULT 0,
  `supply_cost` double NOT NULL DEFAULT 0,
  `def_mile_cost` double DEFAULT NULL,
  `def_shipping_cost` double DEFAULT NULL,
  `def_tax` double DEFAULT NULL,
  `def_insurance` double DEFAULT NULL,
  `def_return_mile_cost` double DEFAULT NULL,
  `def_return_cost` double DEFAULT NULL,
  `def_shipping_cost_gram` double NOT NULL DEFAULT 0,
  `def_mile_cost_gram` double NOT NULL DEFAULT 0,
  `def_tax_gram` double NOT NULL DEFAULT 0,
  `def_insurance_gram` double NOT NULL DEFAULT 0,
  `def_return_cost_gram` double NOT NULL DEFAULT 0,
  `def_return_mile_cost_gram` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_shipment_logs`
--

CREATE TABLE `client_shipment_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from` int(11) NOT NULL DEFAULT 0,
  `to` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_shipment_logs`
--

INSERT INTO `client_shipment_logs` (`id`, `from`, `to`, `created_by`, `shipment_id`, `created_at`, `updated_at`) VALUES
(8, 1, 1, 1, 13, '2024-12-16 08:16:16', '2024-12-16 08:16:16'),
(9, 1, 1, 1, 14, '2024-12-22 19:40:31', '2024-12-22 19:40:31'),
(10, 1, 1, 1, 15, '2024-12-22 19:46:52', '2024-12-22 19:46:52'),
(11, 1, 1, 1, 16, '2024-12-26 22:04:39', '2024-12-26 22:04:39'),
(12, 1, 2, 1, 15, '2024-12-29 22:04:39', '2024-12-29 22:04:39'),
(13, 2, 3, 1, 15, '2024-12-30 22:04:39', '2024-12-30 22:04:39'),
(14, 1, 1, 1, 17, '2024-12-31 07:15:41', '2024-12-31 07:15:41'),
(15, 1, 1, 1, 24, '2025-01-01 01:59:44', '2025-01-01 01:59:44'),
(16, 1, 1, 1, 25, '2025-01-01 03:16:02', '2025-01-01 03:16:02'),
(17, 1, 1, 1, 26, '2025-01-01 03:20:53', '2025-01-01 03:20:53'),
(18, 1, 1, 10, 27, '2025-01-02 00:21:51', '2025-01-02 00:21:51'),
(19, 1, 1, 10, 28, '2025-01-03 20:26:58', '2025-01-03 20:26:58'),
(20, 1, 1, 1, 29, '2025-01-04 04:05:48', '2025-01-04 04:05:48'),
(21, 1, 1, 1, 30, '2025-01-04 04:28:07', '2025-01-04 04:28:07'),
(22, 1, 1, 10, 31, '2025-01-04 08:38:19', '2025-01-04 08:38:19'),
(25, 1, 1, 10, 34, '2025-01-06 12:24:42', '2025-01-06 12:24:42'),
(26, 1, 1, 1, 35, '2025-01-06 20:57:28', '2025-01-06 20:57:28'),
(27, 1, 1, 1, 36, '2025-01-06 20:58:03', '2025-01-06 20:58:03'),
(28, 1, 1, 1, 37, '2025-01-06 21:00:33', '2025-01-06 21:00:33'),
(29, 1, 1, 1, 38, '2025-01-06 21:01:08', '2025-01-06 21:01:08'),
(30, 1, 1, 1, 39, '2025-01-06 22:11:52', '2025-01-06 22:11:52'),
(31, 1, 1, 1, 40, '2025-01-06 23:04:21', '2025-01-06 23:04:21'),
(32, 1, 1, 1, 41, '2025-01-06 23:06:01', '2025-01-06 23:06:01'),
(33, 1, 1, 1, 42, '2025-01-06 23:07:23', '2025-01-06 23:07:23'),
(34, 1, 1, 1, 43, '2025-01-06 23:08:46', '2025-01-06 23:08:46'),
(35, 1, 1, 1, 44, '2025-01-06 23:10:00', '2025-01-06 23:10:00'),
(36, 1, 1, 1, 45, '2025-01-06 23:11:16', '2025-01-06 23:11:16'),
(37, 1, 1, 1, 46, '2025-01-07 20:54:22', '2025-01-07 20:54:22'),
(38, 1, 1, 1, 47, '2025-01-07 20:55:51', '2025-01-07 20:55:51'),
(39, 1, 1, 1, 48, '2025-01-07 20:57:17', '2025-01-07 20:57:17'),
(40, 1, 1, 1, 49, '2025-01-07 20:58:06', '2025-01-07 20:58:06'),
(41, 1, 1, 10, 51, '2025-01-12 14:34:47', '2025-01-12 14:34:47'),
(42, 1, 1, 1, 52, '2025-01-14 20:53:57', '2025-01-14 20:53:57'),
(43, 1, 1, 1, 53, '2025-01-14 21:26:30', '2025-01-14 21:26:30'),
(44, 1, 1, 1, 54, '2025-01-14 21:27:12', '2025-01-14 21:27:12'),
(45, 1, 1, 1, 55, '2025-01-14 21:28:13', '2025-01-14 21:28:13'),
(46, 1, 1, 1, 56, '2025-01-14 21:29:05', '2025-01-14 21:29:05'),
(47, 1, 1, 1, 57, '2025-01-14 21:30:05', '2025-01-14 21:30:05'),
(48, 1, 1, 1, 58, '2025-01-15 20:02:30', '2025-01-15 20:02:30'),
(49, 1, 1, 1, 59, '2025-01-15 22:35:42', '2025-01-15 22:35:42'),
(50, 1, 1, 1, 60, '2025-01-15 22:36:33', '2025-01-15 22:36:33'),
(51, 1, 1, 1, 61, '2025-01-15 22:37:17', '2025-01-15 22:37:17'),
(52, 1, 1, 1, 62, '2025-01-15 22:37:52', '2025-01-15 22:37:52'),
(53, 1, 1, 1, 63, '2025-01-15 22:38:34', '2025-01-15 22:38:34'),
(54, 1, 1, 1, 64, '2025-01-17 19:41:07', '2025-01-17 19:41:07'),
(55, 1, 1, 1, 65, '2025-01-17 19:43:19', '2025-01-17 19:43:19'),
(56, 1, 1, 1, 66, '2025-01-17 19:46:26', '2025-01-17 19:46:26'),
(57, 1, 1, 1, 67, '2025-01-17 21:46:44', '2025-01-17 21:46:44'),
(58, 1, 1, 1, 68, '2025-01-17 22:32:36', '2025-01-17 22:32:36'),
(59, 1, 1, 1, 69, '2025-01-17 22:33:04', '2025-01-17 22:33:04'),
(60, 1, 1, 1, 70, '2025-01-20 23:48:52', '2025-01-20 23:48:52'),
(61, 1, 1, 1, 71, '2025-01-22 20:09:36', '2025-01-22 20:09:36'),
(62, 1, 1, 1, 72, '2025-01-22 20:11:13', '2025-01-22 20:11:13'),
(63, 1, 1, 1, 73, '2025-01-22 20:11:54', '2025-01-22 20:11:54'),
(64, 1, 1, 1, 74, '2025-01-22 20:12:42', '2025-01-22 20:12:42'),
(65, 1, 1, 1, 75, '2025-01-22 20:14:29', '2025-01-22 20:14:29'),
(66, 1, 1, 1, 76, '2025-01-22 20:15:33', '2025-01-22 20:15:33'),
(67, 1, 1, 1, 77, '2025-01-22 20:16:25', '2025-01-22 20:16:25'),
(68, 1, 1, 1, 78, '2025-01-22 20:17:34', '2025-01-22 20:17:34'),
(69, 1, 1, 1, 79, '2025-01-22 21:18:23', '2025-01-22 21:18:23'),
(70, 1, 1, 1, 80, '2025-01-22 21:52:37', '2025-01-22 21:52:37'),
(71, 1, 1, 1, 81, '2025-01-22 21:53:09', '2025-01-22 21:53:09'),
(72, 1, 1, 1, 82, '2025-01-22 21:54:08', '2025-01-22 21:54:08'),
(73, 1, 1, 1, 83, '2025-01-22 21:55:24', '2025-01-22 21:55:24'),
(74, 1, 1, 1, 84, '2025-01-22 22:00:17', '2025-01-22 22:00:17'),
(75, 1, 1, 1, 85, '2025-01-23 20:29:28', '2025-01-23 20:29:28'),
(76, 1, 1, 1, 86, '2025-01-23 21:05:41', '2025-01-23 21:05:41'),
(77, 1, 1, 1, 87, '2025-01-23 23:00:48', '2025-01-23 23:00:48'),
(78, 1, 1, 1, 88, '2025-01-23 23:03:03', '2025-01-23 23:03:03'),
(79, 1, 1, 1, 89, '2025-01-24 21:51:49', '2025-01-24 21:51:49'),
(80, 1, 1, 1, 90, '2025-01-24 23:14:13', '2025-01-24 23:14:13'),
(81, 1, 1, 1, 91, '2025-01-24 23:15:33', '2025-01-24 23:15:33'),
(82, 1, 1, 1, 92, '2025-01-24 23:16:18', '2025-01-24 23:16:18'),
(83, 1, 1, 1, 93, '2025-01-24 23:17:15', '2025-01-24 23:17:15'),
(88, 1, 2, 1, 17, '2025-01-25 22:20:34', '2025-01-25 22:20:34'),
(89, 1, 2, 1, 16, '2025-01-27 04:40:49', '2025-01-27 04:40:49'),
(90, 2, 3, 1, 17, '2025-01-27 05:06:47', '2025-01-27 05:06:47'),
(91, 3, 4, 1, 17, '2025-01-27 05:07:30', '2025-01-27 05:07:30'),
(92, 4, 5, 1, 17, '2025-01-27 06:36:41', '2025-01-27 06:36:41'),
(94, 1, 2, 1, 24, '2025-01-31 02:36:49', '2025-01-31 02:36:49'),
(95, 1, 2, 1, 25, '2025-01-31 02:42:37', '2025-01-31 02:42:37'),
(96, 1, 2, 11, 26, '2025-01-31 02:42:57', '2025-01-31 02:42:57'),
(97, 1, 2, 11, 29, '2025-01-31 02:53:48', '2025-01-31 02:53:48'),
(98, 3, 4, 20, 70, '2025-01-31 05:02:48', '2025-01-31 05:02:48'),
(99, 3, 4, 1, 25, '2025-01-31 05:22:20', '2025-01-31 05:22:20'),
(100, 3, 4, 20, 70, '2025-01-31 05:24:05', '2025-01-31 05:24:05'),
(101, 3, 4, 1, 25, '2025-01-31 07:02:29', '2025-01-31 07:02:29'),
(102, 1, 2, 1, 1, '2025-02-02 18:00:32', '2025-02-02 18:00:32'),
(105, 1, 2, 1, 35, '2025-02-02 22:52:44', '2025-02-02 22:52:44'),
(106, 1, 2, 1, 36, '2025-02-02 22:59:30', '2025-02-02 22:59:30'),
(107, 3, 4, 1, 13, '2025-02-03 03:29:42', '2025-02-03 03:29:42'),
(108, 3, 4, 1, 13, '2025-02-03 03:29:48', '2025-02-03 03:29:48'),
(109, 3, 4, 1, 13, '2025-02-03 09:42:27', '2025-02-03 09:42:27'),
(110, 1, 2, 1, 37, '2025-02-03 20:48:06', '2025-02-03 20:48:06'),
(111, 1, 1, 1, 94, '2025-02-03 22:27:58', '2025-02-03 22:27:58'),
(112, 1, 1, 1, 95, '2025-02-03 22:28:43', '2025-02-03 22:28:43'),
(113, 1, 1, 1, 96, '2025-02-03 22:29:45', '2025-02-03 22:29:45'),
(114, 1, 1, 1, 97, '2025-02-03 22:35:25', '2025-02-03 22:35:25'),
(115, 1, 1, 1, 98, '2025-02-03 22:55:26', '2025-02-03 22:55:26'),
(116, 1, 1, 1, 99, '2025-02-03 22:56:27', '2025-02-03 22:56:27'),
(117, 1, 1, 1, 100, '2025-02-03 22:57:15', '2025-02-03 22:57:15'),
(118, 3, 4, 1, 1, '2025-02-04 17:55:15', '2025-02-04 17:55:15'),
(119, 1, 1, 1, 101, '2025-02-04 20:25:04', '2025-02-04 20:25:04'),
(120, 1, 2, 1, 38, '2025-02-04 21:09:57', '2025-02-04 21:09:57'),
(121, 1, 1, 1, 102, '2025-02-04 22:22:07', '2025-02-04 22:22:07'),
(122, 1, 1, 1, 103, '2025-02-04 22:22:48', '2025-02-04 22:22:48'),
(123, 1, 1, 1, 104, '2025-02-04 23:02:49', '2025-02-04 23:02:49'),
(124, 1, 1, 1, 105, '2025-02-04 23:03:31', '2025-02-04 23:03:31'),
(125, 1, 1, 1, 106, '2025-02-04 23:04:16', '2025-02-04 23:04:16'),
(126, 1, 1, 1, 109, '2025-02-05 06:33:16', '2025-02-05 06:33:16'),
(127, 1, 1, 1, 110, '2025-02-06 01:17:36', '2025-02-06 01:17:36'),
(128, 1, 1, 1, 111, '2025-02-06 21:06:29', '2025-02-06 21:06:29'),
(129, 1, 1, 1, 112, '2025-02-06 21:07:53', '2025-02-06 21:07:53'),
(130, 1, 1, 1, 113, '2025-02-06 21:09:40', '2025-02-06 21:09:40'),
(131, 1, 1, 1, 114, '2025-02-06 21:41:38', '2025-02-06 21:41:38'),
(132, 1, 1, 1, 115, '2025-02-06 22:05:40', '2025-02-06 22:05:40'),
(133, 1, 1, 1, 116, '2025-02-07 20:07:34', '2025-02-07 20:07:34'),
(134, 1, 1, 1, 117, '2025-02-07 20:08:56', '2025-02-07 20:08:56'),
(135, 1, 1, 1, 118, '2025-02-07 21:08:36', '2025-02-07 21:08:36'),
(136, 1, 1, 1, 119, '2025-02-07 21:09:47', '2025-02-07 21:09:47'),
(137, 1, 1, 1, 120, '2025-02-10 20:00:23', '2025-02-10 20:00:23'),
(138, 1, 1, 1, 121, '2025-02-10 21:26:01', '2025-02-10 21:26:01'),
(139, 1, 1, 1, 122, '2025-02-10 21:27:02', '2025-02-10 21:27:02'),
(140, 1, 1, 1, 123, '2025-02-11 21:18:51', '2025-02-11 21:18:51'),
(141, 1, 1, 1, 124, '2025-02-12 21:13:20', '2025-02-12 21:13:20'),
(142, 1, 1, 1, 125, '2025-02-12 21:23:45', '2025-02-12 21:23:45'),
(143, 1, 1, 1, 126, '2025-02-13 20:43:33', '2025-02-13 20:43:33'),
(144, 1, 1, 1, 127, '2025-02-14 21:16:51', '2025-02-14 21:16:51'),
(145, 1, 1, 1, 128, '2025-02-14 21:51:33', '2025-02-14 21:51:33'),
(146, 1, 1, 1, 129, '2025-02-14 21:52:07', '2025-02-14 21:52:07'),
(147, 1, 1, 1, 130, '2025-02-17 21:27:23', '2025-02-17 21:27:23'),
(148, 1, 1, 1, 131, '2025-02-17 21:31:16', '2025-02-17 21:31:16'),
(149, 1, 1, 1, 132, '2025-02-17 21:32:03', '2025-02-17 21:32:03'),
(150, 1, 1, 1, 133, '2025-02-18 20:03:44', '2025-02-18 20:03:44'),
(151, 1, 1, 1, 134, '2025-02-18 20:04:55', '2025-02-18 20:04:55'),
(152, 1, 1, 1, 135, '2025-02-18 20:43:49', '2025-02-18 20:43:49'),
(153, 1, 1, 1, 136, '2025-02-19 23:21:07', '2025-02-19 23:21:07'),
(154, 1, 1, 1, 137, '2025-02-19 23:21:46', '2025-02-19 23:21:46'),
(155, 1, 1, 1, 138, '2025-02-19 23:24:05', '2025-02-19 23:24:05'),
(156, 1, 1, 1, 139, '2025-02-19 23:24:48', '2025-02-19 23:24:48'),
(157, 1, 1, 1, 140, '2025-02-20 19:24:38', '2025-02-20 19:24:38'),
(158, 1, 1, 1, 141, '2025-02-20 19:26:47', '2025-02-20 19:26:47'),
(159, 1, 1, 1, 142, '2025-02-20 19:27:55', '2025-02-20 19:27:55'),
(160, 1, 1, 1, 143, '2025-02-20 19:33:01', '2025-02-20 19:33:01'),
(161, 1, 1, 1, 144, '2025-02-20 19:36:32', '2025-02-20 19:36:32'),
(162, 1, 1, 1, 145, '2025-02-20 19:37:31', '2025-02-20 19:37:31'),
(163, 1, 1, 1, 146, '2025-02-20 19:41:21', '2025-02-20 19:41:21'),
(164, 1, 1, 1, 147, '2025-02-20 19:42:51', '2025-02-20 19:42:51'),
(165, 1, 1, 1, 148, '2025-02-20 19:54:33', '2025-02-20 19:54:33'),
(166, 1, 1, 1, 149, '2025-02-20 19:55:21', '2025-02-20 19:55:21'),
(167, 1, 1, 1, 150, '2025-02-20 19:56:37', '2025-02-20 19:56:37'),
(168, 1, 1, 1, 151, '2025-02-20 19:57:33', '2025-02-20 19:57:33'),
(169, 1, 1, 1, 152, '2025-02-20 20:02:21', '2025-02-20 20:02:21'),
(170, 1, 1, 1, 153, '2025-02-20 20:04:12', '2025-02-20 20:04:12'),
(171, 1, 1, 1, 154, '2025-02-20 20:05:46', '2025-02-20 20:05:46'),
(172, 1, 1, 1, 155, '2025-02-20 20:06:51', '2025-02-20 20:06:51'),
(173, 1, 1, 1, 156, '2025-02-20 20:50:04', '2025-02-20 20:50:04'),
(174, 1, 1, 1, 157, '2025-02-20 20:51:32', '2025-02-20 20:51:32'),
(175, 1, 1, 1, 158, '2025-02-20 20:58:40', '2025-02-20 20:58:40'),
(176, 1, 1, 1, 159, '2025-02-20 20:59:45', '2025-02-20 20:59:45'),
(177, 1, 1, 1, 160, '2025-02-21 19:41:26', '2025-02-21 19:41:26'),
(178, 1, 1, 1, 161, '2025-02-21 19:44:14', '2025-02-21 19:44:14'),
(179, 1, 1, 1, 162, '2025-02-21 19:45:19', '2025-02-21 19:45:19'),
(180, 1, 1, 1, 163, '2025-02-21 19:46:06', '2025-02-21 19:46:06'),
(181, 1, 1, 1, 164, '2025-02-21 19:46:46', '2025-02-21 19:46:46'),
(182, 1, 1, 1, 165, '2025-02-24 22:08:52', '2025-02-24 22:08:52'),
(183, 1, 1, 1, 166, '2025-02-27 18:25:23', '2025-02-27 18:25:23'),
(184, 1, 1, 1, 167, '2025-02-27 18:26:08', '2025-02-27 18:26:08'),
(185, 1, 1, 1, 168, '2025-02-27 18:26:47', '2025-02-27 18:26:47'),
(186, 1, 1, 1, 169, '2025-02-27 19:55:28', '2025-02-27 19:55:28'),
(187, 1, 1, 1, 170, '2025-02-27 20:00:53', '2025-02-27 20:00:53'),
(188, 1, 1, 1, 171, '2025-02-27 20:02:06', '2025-02-27 20:02:06'),
(189, 1, 1, 1, 172, '2025-02-27 20:03:08', '2025-02-27 20:03:08'),
(190, 1, 1, 1, 173, '2025-02-27 20:04:54', '2025-02-27 20:04:54'),
(191, 1, 1, 1, 174, '2025-02-27 20:06:06', '2025-02-27 20:06:06'),
(192, 1, 1, 1, 175, '2025-02-27 20:07:10', '2025-02-27 20:07:10'),
(193, 1, 1, 1, 176, '2025-02-27 20:08:21', '2025-02-27 20:08:21'),
(194, 1, 1, 1, 177, '2025-02-27 20:09:42', '2025-02-27 20:09:42'),
(195, 1, 1, 1, 178, '2025-02-27 20:10:52', '2025-02-27 20:10:52'),
(196, 1, 1, 1, 179, '2025-02-27 20:13:53', '2025-02-27 20:13:53'),
(197, 1, 1, 1, 180, '2025-02-27 20:15:10', '2025-02-27 20:15:10'),
(198, 1, 1, 1, 181, '2025-02-27 20:16:28', '2025-02-27 20:16:28'),
(199, 1, 1, 1, 182, '2025-02-27 20:18:39', '2025-02-27 20:18:39'),
(200, 1, 1, 1, 183, '2025-02-27 20:23:14', '2025-02-27 20:23:14'),
(201, 1, 1, 1, 184, '2025-02-27 20:24:55', '2025-02-27 20:24:55'),
(202, 1, 1, 1, 185, '2025-02-27 22:07:39', '2025-02-27 22:07:39'),
(203, 1, 1, 1, 186, '2025-02-27 22:08:18', '2025-02-27 22:08:18'),
(204, 1, 1, 1, 187, '2025-02-28 22:01:17', '2025-02-28 22:01:17'),
(205, 1, 1, 1, 188, '2025-02-28 22:51:12', '2025-02-28 22:51:12'),
(206, 1, 1, 1, 189, '2025-02-28 22:51:53', '2025-02-28 22:51:53'),
(207, 1, 1, 1, 190, '2025-02-28 22:52:36', '2025-02-28 22:52:36'),
(208, 1, 1, 10, 191, '2025-03-01 05:32:01', '2025-03-01 05:32:01'),
(209, 1, 1, 1, 193, '2025-03-03 02:16:21', '2025-03-03 02:16:21'),
(210, 1, 1, 1, 194, '2025-03-03 02:25:41', '2025-03-03 02:25:41'),
(211, 1, 1, 1, 195, '2025-03-03 17:45:38', '2025-03-03 17:45:38'),
(212, 1, 1, 1, 196, '2025-03-03 20:10:48', '2025-03-03 20:10:48'),
(213, 1, 1, 1, 197, '2025-03-03 20:32:27', '2025-03-03 20:32:27'),
(214, 1, 1, 1, 198, '2025-03-03 20:34:41', '2025-03-03 20:34:41'),
(215, 1, 1, 1, 199, '2025-03-03 21:35:56', '2025-03-03 21:35:56'),
(216, 1, 1, 1, 200, '2025-03-03 21:37:13', '2025-03-03 21:37:13'),
(217, 1, 1, 1, 201, '2025-03-03 21:38:12', '2025-03-03 21:38:12'),
(218, 1, 1, 1, 202, '2025-03-03 21:39:02', '2025-03-03 21:39:02'),
(219, 1, 1, 1, 203, '2025-03-03 22:43:20', '2025-03-03 22:43:20'),
(220, 1, 1, 10, 204, '2025-03-04 00:11:44', '2025-03-04 00:11:44'),
(221, 1, 1, 10, 205, '2025-03-04 00:33:19', '2025-03-04 00:33:19'),
(222, 1, 1, 1, 206, '2025-03-04 20:32:19', '2025-03-04 20:32:19'),
(223, 1, 1, 1, 207, '2025-03-04 20:42:16', '2025-03-04 20:42:16'),
(224, 1, 1, 1, 208, '2025-03-04 21:04:59', '2025-03-04 21:04:59'),
(225, 1, 1, 1, 209, '2025-03-04 21:05:38', '2025-03-04 21:05:38'),
(226, 1, 1, 1, 210, '2025-03-04 21:06:56', '2025-03-04 21:06:56'),
(227, 1, 1, 1, 211, '2025-03-05 21:33:08', '2025-03-05 21:33:08'),
(228, 1, 1, 1, 212, '2025-03-05 22:02:49', '2025-03-05 22:02:49'),
(229, 1, 1, 1, 213, '2025-03-06 19:18:19', '2025-03-06 19:18:19'),
(230, 1, 1, 1, 214, '2025-03-06 21:00:04', '2025-03-06 21:00:04'),
(231, 1, 1, 1, 215, '2025-03-06 21:01:32', '2025-03-06 21:01:32'),
(232, 1, 1, 1, 216, '2025-03-06 21:10:59', '2025-03-06 21:10:59'),
(233, 1, 1, 1, 217, '2025-03-06 21:42:18', '2025-03-06 21:42:18'),
(234, 1, 1, 1, 218, '2025-03-06 22:46:45', '2025-03-06 22:46:45'),
(235, 1, 1, 1, 219, '2025-03-06 23:09:16', '2025-03-06 23:09:16'),
(236, 1, 1, 1, 220, '2025-03-06 23:21:03', '2025-03-06 23:21:03'),
(237, 1, 1, 1, 221, '2025-03-07 19:59:17', '2025-03-07 19:59:17'),
(238, 1, 1, 1, 222, '2025-03-07 19:59:53', '2025-03-07 19:59:53'),
(239, 1, 1, 1, 223, '2025-03-07 21:42:05', '2025-03-07 21:42:05'),
(240, 1, 1, 1, 224, '2025-03-07 21:43:25', '2025-03-07 21:43:25'),
(241, 1, 1, 10, 225, '2025-03-08 19:29:14', '2025-03-08 19:29:14'),
(242, 1, 1, 10, 226, '2025-03-10 13:59:22', '2025-03-10 13:59:22'),
(243, 1, 1, 1, 227, '2025-03-10 19:46:59', '2025-03-10 19:46:59'),
(244, 1, 1, 1, 228, '2025-03-10 19:47:48', '2025-03-10 19:47:48'),
(245, 1, 1, 1, 229, '2025-03-10 20:09:30', '2025-03-10 20:09:30'),
(246, 1, 1, 1, 230, '2025-03-10 20:10:19', '2025-03-10 20:10:19');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `iso3` varchar(255) DEFAULT NULL,
  `iso2` varchar(255) DEFAULT NULL,
  `phonecode` varchar(255) DEFAULT NULL,
  `capital` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL,
  `tld` varchar(255) DEFAULT NULL,
  `native` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `subregion` varchar(255) DEFAULT NULL,
  `timezones` text DEFAULT NULL,
  `translations` text DEFAULT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `emoji` varchar(255) DEFAULT NULL,
  `emojiU` varchar(255) DEFAULT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT 1,
  `wikiDataId` varchar(255) DEFAULT NULL,
  `covered` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `iso3`, `iso2`, `phonecode`, `capital`, `currency`, `currency_symbol`, `tld`, `native`, `region`, `subregion`, `timezones`, `translations`, `latitude`, `longitude`, `emoji`, `emojiU`, `flag`, `wikiDataId`, `covered`, `created_at`, `updated_at`) VALUES
(8, 'Anguilla', 'AIA', 'AI', '+1-264', 'The Valley', 'XCD', '$', '.ai', 'Anguilla', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Anguilla\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Anguila\\\",\\\"pt\\\":\\\"Anguila\\\",\\\"nl\\\":\\\"Anguilla\\\",\\\"hr\\\":\\\"Angvila\\\",\\\"fa\\\":\\\"آنگویلا\\\",\\\"de\\\":\\\"Anguilla\\\",\\\"es\\\":\\\"Anguilla\\\",\\\"fr\\\":\\\"Anguilla\\\",\\\"ja\\\":\\\"アンギラ\\\",\\\"it\\\":\\\"Anguilla\\\"}', 18.25000000, -63.16666666, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(10, 'Antigua And Barbuda', 'ATG', 'AG', '+1-268', 'St. John\'s', 'XCD', '$', '.ag', 'Antigua and Barbuda', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Antigua\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Antígua e Barbuda\\\",\\\"pt\\\":\\\"Antígua e Barbuda\\\",\\\"nl\\\":\\\"Antigua en Barbuda\\\",\\\"hr\\\":\\\"Antigva i Barbuda\\\",\\\"fa\\\":\\\"آنتیگوا و باربودا\\\",\\\"de\\\":\\\"Antigua und Barbuda\\\",\\\"es\\\":\\\"Antigua y Barbuda\\\",\\\"fr\\\":\\\"Antigua-et-Barbuda\\\",\\\"ja\\\":\\\"アンティグア・バーブーダ\\\",\\\"it\\\":\\\"Antigua e Barbuda\\\"}', 17.05000000, -61.80000000, '', '', 1, 'Q781', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(11, 'Argentina', 'ARG', 'AR', '54', 'Buenos Aires', 'ARS', '$', '.ar', 'Argentina', 'Americas', 'South America', '[{\\\"zoneName\\\":\\\"America\\/Argentina\\/Buenos_Aires\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"ART\\\",\\\"tzName\\\":\\\"Argentina Time\\\"},{\\\"zoneName\\\":\\\"America\\/Argentina\\/Catamarca\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"ART\\\",\\\"tzName\\\":\\\"Argentina Time\\\"},{\\\"zoneName\\\":\\\"America\\/Argentina\\/Cordoba\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"ART\\\",\\\"tzName\\\":\\\"Argentina Time\\\"},{\\\"zoneName\\\":\\\"America\\/Argentina\\/Jujuy\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"ART\\\",\\\"tzName\\\":\\\"Argentina Time\\\"},{\\\"zoneName\\\":\\\"America\\/Argentina\\/La_Rioja\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"ART\\\",\\\"tzName\\\":\\\"Argentina Time\\\"},{\\\"zoneName\\\":\\\"America\\/Argentina\\/Mendoza\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"ART\\\",\\\"tzName\\\":\\\"Argentina Time\\\"},{\\\"zoneName\\\":\\\"America\\/Argentina\\/Rio_Gallegos\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"ART\\\",\\\"tzName\\\":\\\"Argentina Time\\\"},{\\\"zoneName\\\":\\\"America\\/Argentina\\/Salta\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"ART\\\",\\\"tzName\\\":\\\"Argentina Time\\\"},{\\\"zoneName\\\":\\\"America\\/Argentina\\/San_Juan\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"ART\\\",\\\"tzName\\\":\\\"Argentina Time\\\"},{\\\"zoneName\\\":\\\"America\\/Argentina\\/San_Luis\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"ART\\\",\\\"tzName\\\":\\\"Argentina Time\\\"},{\\\"zoneName\\\":\\\"America\\/Argentina\\/Tucuman\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"ART\\\",\\\"tzName\\\":\\\"Argentina Time\\\"},{\\\"zoneName\\\":\\\"America\\/Argentina\\/Ushuaia\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"ART\\\",\\\"tzName\\\":\\\"Argentina Time\\\"}]', '{\\\"br\\\":\\\"Argentina\\\",\\\"pt\\\":\\\"Argentina\\\",\\\"nl\\\":\\\"Argentinië\\\",\\\"hr\\\":\\\"Argentina\\\",\\\"fa\\\":\\\"آرژانتین\\\",\\\"de\\\":\\\"Argentinien\\\",\\\"es\\\":\\\"Argentina\\\",\\\"fr\\\":\\\"Argentine\\\",\\\"ja\\\":\\\"アルゼンチン\\\",\\\"it\\\":\\\"Argentina\\\"}', -34.00000000, -64.00000000, '', '', 1, 'Q414', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(13, 'Aruba', 'ABW', 'AW', '297', 'Oranjestad', 'AWG', 'ƒ', '.aw', 'Aruba', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Aruba\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Aruba\\\",\\\"pt\\\":\\\"Aruba\\\",\\\"nl\\\":\\\"Aruba\\\",\\\"hr\\\":\\\"Aruba\\\",\\\"fa\\\":\\\"آروبا\\\",\\\"de\\\":\\\"Aruba\\\",\\\"es\\\":\\\"Aruba\\\",\\\"fr\\\":\\\"Aruba\\\",\\\"ja\\\":\\\"アルバ\\\",\\\"it\\\":\\\"Aruba\\\"}', 12.50000000, -69.96666666, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(17, 'Bahamas The', 'BHS', 'BS', '+1-242', 'Nassau', 'BSD', 'B$', '.bs', 'Bahamas', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Nassau\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America)\\\"}]', '{\\\"br\\\":\\\"Bahamas\\\",\\\"pt\\\":\\\"Baamas\\\",\\\"nl\\\":\\\"Bahama’s\\\",\\\"hr\\\":\\\"Bahami\\\",\\\"fa\\\":\\\"باهاما\\\",\\\"de\\\":\\\"Bahamas\\\",\\\"es\\\":\\\"Bahamas\\\",\\\"fr\\\":\\\"Bahamas\\\",\\\"ja\\\":\\\"バハマ\\\",\\\"it\\\":\\\"Bahamas\\\"}', 24.25000000, -76.00000000, '', '', 1, 'Q778', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(20, 'Barbados', 'BRB', 'BB', '+1-246', 'Bridgetown', 'BBD', 'Bds$', '.bb', 'Barbados', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Barbados\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Barbados\\\",\\\"pt\\\":\\\"Barbados\\\",\\\"nl\\\":\\\"Barbados\\\",\\\"hr\\\":\\\"Barbados\\\",\\\"fa\\\":\\\"باربادوس\\\",\\\"de\\\":\\\"Barbados\\\",\\\"es\\\":\\\"Barbados\\\",\\\"fr\\\":\\\"Barbade\\\",\\\"ja\\\":\\\"バルバドス\\\",\\\"it\\\":\\\"Barbados\\\"}', 13.16666666, -59.53333333, '', '', 1, 'Q244', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(23, 'Belize', 'BLZ', 'BZ', '501', 'Belmopan', 'BZD', '$', '.bz', 'Belize', 'Americas', 'Central America', '[{\\\"zoneName\\\":\\\"America\\/Belize\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America)\\\"}]', '{\\\"br\\\":\\\"Belize\\\",\\\"pt\\\":\\\"Belize\\\",\\\"nl\\\":\\\"Belize\\\",\\\"hr\\\":\\\"Belize\\\",\\\"fa\\\":\\\"بلیز\\\",\\\"de\\\":\\\"Belize\\\",\\\"es\\\":\\\"Belice\\\",\\\"fr\\\":\\\"Belize\\\",\\\"ja\\\":\\\"ベリーズ\\\",\\\"it\\\":\\\"Belize\\\"}', 17.25000000, -88.75000000, '', '', 1, 'Q242', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(25, 'Bermuda', 'BMU', 'BM', '+1-441', 'Hamilton', 'BMD', '$', '.bm', 'Bermuda', 'Americas', 'Northern America', '[{\\\"zoneName\\\":\\\"Atlantic\\/Bermuda\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Bermudas\\\",\\\"pt\\\":\\\"Bermudas\\\",\\\"nl\\\":\\\"Bermuda\\\",\\\"hr\\\":\\\"Bermudi\\\",\\\"fa\\\":\\\"برمودا\\\",\\\"de\\\":\\\"Bermuda\\\",\\\"es\\\":\\\"Bermudas\\\",\\\"fr\\\":\\\"Bermudes\\\",\\\"ja\\\":\\\"バミューダ\\\",\\\"it\\\":\\\"Bermuda\\\"}', 32.33333333, -64.75000000, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(27, 'Bolivia', 'BOL', 'BO', '591', 'Sucre', 'BOB', 'Bs.', '.bo', 'Bolivia', 'Americas', 'South America', '[{\\\"zoneName\\\":\\\"America\\/La_Paz\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"BOT\\\",\\\"tzName\\\":\\\"Bolivia Time\\\"}]', '{\\\"br\\\":\\\"Bolívia\\\",\\\"pt\\\":\\\"Bolívia\\\",\\\"nl\\\":\\\"Bolivia\\\",\\\"hr\\\":\\\"Bolivija\\\",\\\"fa\\\":\\\"بولیوی\\\",\\\"de\\\":\\\"Bolivien\\\",\\\"es\\\":\\\"Bolivia\\\",\\\"fr\\\":\\\"Bolivie\\\",\\\"ja\\\":\\\"ボリビア多民族国\\\",\\\"it\\\":\\\"Bolivia\\\"}', -17.00000000, -65.00000000, '', '', 1, 'Q750', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(31, 'Brazil', 'BRA', 'BR', '55', 'Brasilia', 'BRL', 'R$', '.br', 'Brasil', 'Americas', 'South America', '[{\\\"zoneName\\\":\\\"America\\/Araguaina\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"BRT\\\",\\\"tzName\\\":\\\"Bras\\u00edlia Time\\\"},{\\\"zoneName\\\":\\\"America\\/Bahia\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"BRT\\\",\\\"tzName\\\":\\\"Bras\\u00edlia Time\\\"},{\\\"zoneName\\\":\\\"America\\/Belem\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"BRT\\\",\\\"tzName\\\":\\\"Bras\\u00edlia Time\\\"},{\\\"zoneName\\\":\\\"America\\/Boa_Vista\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AMT\\\",\\\"tzName\\\":\\\"Amazon Time (Brazil)[3\\\"},{\\\"zoneName\\\":\\\"America\\/Campo_Grande\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AMT\\\",\\\"tzName\\\":\\\"Amazon Time (Brazil)[3\\\"},{\\\"zoneName\\\":\\\"America\\/Cuiaba\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"BRT\\\",\\\"tzName\\\":\\\"Brasilia Time\\\"},{\\\"zoneName\\\":\\\"America\\/Eirunepe\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"ACT\\\",\\\"tzName\\\":\\\"Acre Time\\\"},{\\\"zoneName\\\":\\\"America\\/Fortaleza\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"BRT\\\",\\\"tzName\\\":\\\"Bras\\u00edlia Time\\\"},{\\\"zoneName\\\":\\\"America\\/Maceio\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"BRT\\\",\\\"tzName\\\":\\\"Bras\\u00edlia Time\\\"},{\\\"zoneName\\\":\\\"America\\/Manaus\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AMT\\\",\\\"tzName\\\":\\\"Amazon Time (Brazil)\\\"},{\\\"zoneName\\\":\\\"America\\/Noronha\\\",\\\"gmtOffset\\\":-7200,\\\"gmtOffsetName\\\":\\\"UTC-02:00\\\",\\\"abbreviation\\\":\\\"FNT\\\",\\\"tzName\\\":\\\"Fernando de Noronha Time\\\"},{\\\"zoneName\\\":\\\"America\\/Porto_Velho\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AMT\\\",\\\"tzName\\\":\\\"Amazon Time (Brazil)[3\\\"},{\\\"zoneName\\\":\\\"America\\/Recife\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"BRT\\\",\\\"tzName\\\":\\\"Bras\\u00edlia Time\\\"},{\\\"zoneName\\\":\\\"America\\/Rio_Branco\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"ACT\\\",\\\"tzName\\\":\\\"Acre Time\\\"},{\\\"zoneName\\\":\\\"America\\/Santarem\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"BRT\\\",\\\"tzName\\\":\\\"Bras\\u00edlia Time\\\"},{\\\"zoneName\\\":\\\"America\\/Sao_Paulo\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"BRT\\\",\\\"tzName\\\":\\\"Bras\\u00edlia Time\\\"}]', '{\\\"br\\\":\\\"Brasil\\\",\\\"pt\\\":\\\"Brasil\\\",\\\"nl\\\":\\\"Brazilië\\\",\\\"hr\\\":\\\"Brazil\\\",\\\"fa\\\":\\\"برزیل\\\",\\\"de\\\":\\\"Brasilien\\\",\\\"es\\\":\\\"Brasil\\\",\\\"fr\\\":\\\"Brésil\\\",\\\"ja\\\":\\\"ブラジル\\\",\\\"it\\\":\\\"Brasile\\\"}', -10.00000000, -55.00000000, '', '', 1, 'Q155', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(39, 'Canada', 'CAN', 'CA', '1', 'Ottawa', 'CAD', '$', '.ca', 'Canada', 'Americas', 'Northern America', '[{\\\"zoneName\\\":\\\"America\\/Atikokan\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America)\\\"},{\\\"zoneName\\\":\\\"America\\/Blanc-Sablon\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"},{\\\"zoneName\\\":\\\"America\\/Cambridge_Bay\\\",\\\"gmtOffset\\\":-25200,\\\"gmtOffsetName\\\":\\\"UTC-07:00\\\",\\\"abbreviation\\\":\\\"MST\\\",\\\"tzName\\\":\\\"Mountain Standard Time (North America)\\\"},{\\\"zoneName\\\":\\\"America\\/Creston\\\",\\\"gmtOffset\\\":-25200,\\\"gmtOffsetName\\\":\\\"UTC-07:00\\\",\\\"abbreviation\\\":\\\"MST\\\",\\\"tzName\\\":\\\"Mountain Standard Time (North America)\\\"},{\\\"zoneName\\\":\\\"America\\/Dawson\\\",\\\"gmtOffset\\\":-25200,\\\"gmtOffsetName\\\":\\\"UTC-07:00\\\",\\\"abbreviation\\\":\\\"MST\\\",\\\"tzName\\\":\\\"Mountain Standard Time (North America)\\\"},{\\\"zoneName\\\":\\\"America\\/Dawson_Creek\\\",\\\"gmtOffset\\\":-25200,\\\"gmtOffsetName\\\":\\\"UTC-07:00\\\",\\\"abbreviation\\\":\\\"MST\\\",\\\"tzName\\\":\\\"Mountain Standard Time (North America)\\\"},{\\\"zoneName\\\":\\\"America\\/Edmonton\\\",\\\"gmtOffset\\\":-25200,\\\"gmtOffsetName\\\":\\\"UTC-07:00\\\",\\\"abbreviation\\\":\\\"MST\\\",\\\"tzName\\\":\\\"Mountain Standard Time (North America)\\\"},{\\\"zoneName\\\":\\\"America\\/Fort_Nelson\\\",\\\"gmtOffset\\\":-25200,\\\"gmtOffsetName\\\":\\\"UTC-07:00\\\",\\\"abbreviation\\\":\\\"MST\\\",\\\"tzName\\\":\\\"Mountain Standard Time (North America)\\\"},{\\\"zoneName\\\":\\\"America\\/Glace_Bay\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"},{\\\"zoneName\\\":\\\"America\\/Goose_Bay\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"},{\\\"zoneName\\\":\\\"America\\/Halifax\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"},{\\\"zoneName\\\":\\\"America\\/Inuvik\\\",\\\"gmtOffset\\\":-25200,\\\"gmtOffsetName\\\":\\\"UTC-07:00\\\",\\\"abbreviation\\\":\\\"MST\\\",\\\"tzName\\\":\\\"Mountain Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Iqaluit\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Moncton\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"},{\\\"zoneName\\\":\\\"America\\/Nipigon\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Pangnirtung\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Rainy_River\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Rankin_Inlet\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Regina\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Resolute\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/St_Johns\\\",\\\"gmtOffset\\\":-12600,\\\"gmtOffsetName\\\":\\\"UTC-03:30\\\",\\\"abbreviation\\\":\\\"NST\\\",\\\"tzName\\\":\\\"Newfoundland Standard Time\\\"},{\\\"zoneName\\\":\\\"America\\/Swift_Current\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Thunder_Bay\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Toronto\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Vancouver\\\",\\\"gmtOffset\\\":-28800,\\\"gmtOffsetName\\\":\\\"UTC-08:00\\\",\\\"abbreviation\\\":\\\"PST\\\",\\\"tzName\\\":\\\"Pacific Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Whitehorse\\\",\\\"gmtOffset\\\":-25200,\\\"gmtOffsetName\\\":\\\"UTC-07:00\\\",\\\"abbreviation\\\":\\\"MST\\\",\\\"tzName\\\":\\\"Mountain Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Winnipeg\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Yellowknife\\\",\\\"gmtOffset\\\":-25200,\\\"gmtOffsetName\\\":\\\"UTC-07:00\\\",\\\"abbreviation\\\":\\\"MST\\\",\\\"tzName\\\":\\\"Mountain Standard Time (North America\\\"}]', '{\\\"br\\\":\\\"Canadá\\\",\\\"pt\\\":\\\"Canadá\\\",\\\"nl\\\":\\\"Canada\\\",\\\"hr\\\":\\\"Kanada\\\",\\\"fa\\\":\\\"کانادا\\\",\\\"de\\\":\\\"Kanada\\\",\\\"es\\\":\\\"Canadá\\\",\\\"fr\\\":\\\"Canada\\\",\\\"ja\\\":\\\"カナダ\\\",\\\"it\\\":\\\"Canada\\\"}', 60.00000000, -95.00000000, '', '', 1, 'Q16', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(41, 'Cayman Islands', 'CYM', 'KY', '+1-345', 'George Town', 'KYD', '$', '.ky', 'Cayman Islands', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Cayman\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"}]', '{\\\"br\\\":\\\"Ilhas Cayman\\\",\\\"pt\\\":\\\"Ilhas Caimão\\\",\\\"nl\\\":\\\"Caymaneilanden\\\",\\\"hr\\\":\\\"Kajmanski otoci\\\",\\\"fa\\\":\\\"جزایر کیمن\\\",\\\"de\\\":\\\"Kaimaninseln\\\",\\\"es\\\":\\\"Islas Caimán\\\",\\\"fr\\\":\\\"Îles Caïmans\\\",\\\"ja\\\":\\\"ケイマン諸島\\\",\\\"it\\\":\\\"Isole Cayman\\\"}', 19.50000000, -80.50000000, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(44, 'Chile', 'CHL', 'CL', '56', 'Santiago', 'CLP', '$', '.cl', 'Chile', 'Americas', 'South America', '[{\\\"zoneName\\\":\\\"America\\/Punta_Arenas\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"CLST\\\",\\\"tzName\\\":\\\"Chile Summer Time\\\"},{\\\"zoneName\\\":\\\"America\\/Santiago\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"CLST\\\",\\\"tzName\\\":\\\"Chile Summer Time\\\"},{\\\"zoneName\\\":\\\"Pacific\\/Easter\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EASST\\\",\\\"tzName\\\":\\\"Easter Island Summer Time\\\"}]', '{\\\"br\\\":\\\"Chile\\\",\\\"pt\\\":\\\"Chile\\\",\\\"nl\\\":\\\"Chili\\\",\\\"hr\\\":\\\"Čile\\\",\\\"fa\\\":\\\"شیلی\\\",\\\"de\\\":\\\"Chile\\\",\\\"es\\\":\\\"Chile\\\",\\\"fr\\\":\\\"Chili\\\",\\\"ja\\\":\\\"チリ\\\",\\\"it\\\":\\\"Cile\\\"}', -30.00000000, -71.00000000, '', '', 1, 'Q298', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(48, 'Colombia', 'COL', 'CO', '57', 'Bogota', 'COP', '$', '.co', 'Colombia', 'Americas', 'South America', '[{\\\"zoneName\\\":\\\"America\\/Bogota\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"COT\\\",\\\"tzName\\\":\\\"Colombia Time\\\"}]', '{\\\"br\\\":\\\"Colômbia\\\",\\\"pt\\\":\\\"Colômbia\\\",\\\"nl\\\":\\\"Colombia\\\",\\\"hr\\\":\\\"Kolumbija\\\",\\\"fa\\\":\\\"کلمبیا\\\",\\\"de\\\":\\\"Kolumbien\\\",\\\"es\\\":\\\"Colombia\\\",\\\"fr\\\":\\\"Colombie\\\",\\\"ja\\\":\\\"コロンビア\\\",\\\"it\\\":\\\"Colombia\\\"}', 4.00000000, -72.00000000, '', '', 1, 'Q739', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(53, 'Costa Rica', 'CRI', 'CR', '506', 'San Jose', 'CRC', '₡', '.cr', 'Costa Rica', 'Americas', 'Central America', '[{\\\"zoneName\\\":\\\"America\\/Costa_Rica\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"}]', '{\\\"br\\\":\\\"Costa Rica\\\",\\\"pt\\\":\\\"Costa Rica\\\",\\\"nl\\\":\\\"Costa Rica\\\",\\\"hr\\\":\\\"Kostarika\\\",\\\"fa\\\":\\\"کاستاریکا\\\",\\\"de\\\":\\\"Costa Rica\\\",\\\"es\\\":\\\"Costa Rica\\\",\\\"fr\\\":\\\"Costa Rica\\\",\\\"ja\\\":\\\"コスタリカ\\\",\\\"it\\\":\\\"Costa Rica\\\"}', 10.00000000, -84.00000000, '', '', 1, 'Q800', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(56, 'Cuba', 'CUB', 'CU', '53', 'Havana', 'CUP', '$', '.cu', 'Cuba', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Havana\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Cuba Standard Time\\\"}]', '{\\\"br\\\":\\\"Cuba\\\",\\\"pt\\\":\\\"Cuba\\\",\\\"nl\\\":\\\"Cuba\\\",\\\"hr\\\":\\\"Kuba\\\",\\\"fa\\\":\\\"کوبا\\\",\\\"de\\\":\\\"Kuba\\\",\\\"es\\\":\\\"Cuba\\\",\\\"fr\\\":\\\"Cuba\\\",\\\"ja\\\":\\\"キューバ\\\",\\\"it\\\":\\\"Cuba\\\"}', 21.50000000, -80.00000000, '', '', 1, 'Q241', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(61, 'Dominica', 'DMA', 'DM', '+1-767', 'Roseau', 'XCD', '$', '.dm', 'Dominica', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Dominica\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Dominica\\\",\\\"pt\\\":\\\"Dominica\\\",\\\"nl\\\":\\\"Dominica\\\",\\\"hr\\\":\\\"Dominika\\\",\\\"fa\\\":\\\"دومینیکا\\\",\\\"de\\\":\\\"Dominica\\\",\\\"es\\\":\\\"Dominica\\\",\\\"fr\\\":\\\"Dominique\\\",\\\"ja\\\":\\\"ドミニカ国\\\",\\\"it\\\":\\\"Dominica\\\"}', 15.41666666, -61.33333333, '', '', 1, 'Q784', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(62, 'Dominican Republic', 'DOM', 'DO', '+1-809 and 1-829', 'Santo Domingo', 'DOP', '$', '.do', 'República Dominicana', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Santo_Domingo\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"República Dominicana\\\",\\\"pt\\\":\\\"República Dominicana\\\",\\\"nl\\\":\\\"Dominicaanse Republiek\\\",\\\"hr\\\":\\\"Dominikanska Republika\\\",\\\"fa\\\":\\\"جمهوری دومینیکن\\\",\\\"de\\\":\\\"Dominikanische Republik\\\",\\\"es\\\":\\\"República Dominicana\\\",\\\"fr\\\":\\\"République dominicaine\\\",\\\"ja\\\":\\\"ドミニカ共和国\\\",\\\"it\\\":\\\"Repubblica Dominicana\\\"}', 19.00000000, -70.66666666, '', '', 1, 'Q786', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(64, 'Ecuador', 'ECU', 'EC', '593', 'Quito', 'USD', '$', '.ec', 'Ecuador', 'Americas', 'South America', '[{\\\"zoneName\\\":\\\"America\\/Guayaquil\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"ECT\\\",\\\"tzName\\\":\\\"Ecuador Time\\\"},{\\\"zoneName\\\":\\\"Pacific\\/Galapagos\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"GALT\\\",\\\"tzName\\\":\\\"Gal\\u00e1pagos Time\\\"}]', '{\\\"br\\\":\\\"Equador\\\",\\\"pt\\\":\\\"Equador\\\",\\\"nl\\\":\\\"Ecuador\\\",\\\"hr\\\":\\\"Ekvador\\\",\\\"fa\\\":\\\"اکوادور\\\",\\\"de\\\":\\\"Ecuador\\\",\\\"es\\\":\\\"Ecuador\\\",\\\"fr\\\":\\\"Équateur\\\",\\\"ja\\\":\\\"エクアドル\\\",\\\"it\\\":\\\"Ecuador\\\"}', -2.00000000, -77.50000000, '', '', 1, 'Q736', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(66, 'El Salvador', 'SLV', 'SV', '503', 'San Salvador', 'USD', '$', '.sv', 'El Salvador', 'Americas', 'Central America', '[{\\\"zoneName\\\":\\\"America\\/El_Salvador\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"}]', '{\\\"br\\\":\\\"El Salvador\\\",\\\"pt\\\":\\\"El Salvador\\\",\\\"nl\\\":\\\"El Salvador\\\",\\\"hr\\\":\\\"Salvador\\\",\\\"fa\\\":\\\"السالوادور\\\",\\\"de\\\":\\\"El Salvador\\\",\\\"es\\\":\\\"El Salvador\\\",\\\"fr\\\":\\\"Salvador\\\",\\\"ja\\\":\\\"エルサルバドル\\\",\\\"it\\\":\\\"El Salvador\\\"}', 13.83333333, -88.91666666, '', '', 1, 'Q792', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(71, 'Falkland Islands', 'FLK', 'FK', '500', 'Stanley', 'FKP', '£', '.fk', 'Falkland Islands', 'Americas', 'South America', '[{\\\"zoneName\\\":\\\"Atlantic\\/Stanley\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"FKST\\\",\\\"tzName\\\":\\\"Falkland Islands Summer Time\\\"}]', '{\\\"br\\\":\\\"Ilhas Malvinas\\\",\\\"pt\\\":\\\"Ilhas Falkland\\\",\\\"nl\\\":\\\"Falklandeilanden [Islas Malvinas]\\\",\\\"hr\\\":\\\"Falklandski Otoci\\\",\\\"fa\\\":\\\"جزایر فالکلند\\\",\\\"de\\\":\\\"Falklandinseln\\\",\\\"es\\\":\\\"Islas Malvinas\\\",\\\"fr\\\":\\\"Îles Malouines\\\",\\\"ja\\\":\\\"フォークランド（マルビナス）諸島\\\",\\\"it\\\":\\\"Isole Falkland o Isole Malvine\\\"}', -51.75000000, -59.00000000, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(76, 'French Guiana', 'GUF', 'GF', '594', 'Cayenne', 'EUR', '€', '.gf', 'Guyane française', 'Americas', 'South America', '[{\\\"zoneName\\\":\\\"America\\/Cayenne\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"GFT\\\",\\\"tzName\\\":\\\"French Guiana Time\\\"}]', '{\\\"br\\\":\\\"Guiana Francesa\\\",\\\"pt\\\":\\\"Guiana Francesa\\\",\\\"nl\\\":\\\"Frans-Guyana\\\",\\\"hr\\\":\\\"Francuska Gvajana\\\",\\\"fa\\\":\\\"گویان فرانسه\\\",\\\"de\\\":\\\"Französisch Guyana\\\",\\\"es\\\":\\\"Guayana Francesa\\\",\\\"fr\\\":\\\"Guayane\\\",\\\"ja\\\":\\\"フランス領ギアナ\\\",\\\"it\\\":\\\"Guyana francese\\\"}', 4.00000000, -53.00000000, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(86, 'Greenland', 'GRL', 'GL', '299', 'Nuuk', 'DKK', 'Kr.', '.gl', 'Kalaallit Nunaat', 'Americas', 'Northern America', '[{\\\"zoneName\\\":\\\"America\\/Danmarkshavn\\\",\\\"gmtOffset\\\":0,\\\"gmtOffsetName\\\":\\\"UTC\\u00b100\\\",\\\"abbreviation\\\":\\\"GMT\\\",\\\"tzName\\\":\\\"Greenwich Mean Time\\\"},{\\\"zoneName\\\":\\\"America\\/Nuuk\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"WGT\\\",\\\"tzName\\\":\\\"West Greenland Time\\\"},{\\\"zoneName\\\":\\\"America\\/Scoresbysund\\\",\\\"gmtOffset\\\":-3600,\\\"gmtOffsetName\\\":\\\"UTC-01:00\\\",\\\"abbreviation\\\":\\\"EGT\\\",\\\"tzName\\\":\\\"Eastern Greenland Time\\\"},{\\\"zoneName\\\":\\\"America\\/Thule\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Groelândia\\\",\\\"pt\\\":\\\"Gronelândia\\\",\\\"nl\\\":\\\"Groenland\\\",\\\"hr\\\":\\\"Grenland\\\",\\\"fa\\\":\\\"گرینلند\\\",\\\"de\\\":\\\"Grönland\\\",\\\"es\\\":\\\"Groenlandia\\\",\\\"fr\\\":\\\"Groenland\\\",\\\"ja\\\":\\\"グリーンランド\\\",\\\"it\\\":\\\"Groenlandia\\\"}', 72.00000000, -40.00000000, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(87, 'Grenada', 'GRD', 'GD', '+1-473', 'St. George\'s', 'XCD', '$', '.gd', 'Grenada', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Grenada\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Granada\\\",\\\"pt\\\":\\\"Granada\\\",\\\"nl\\\":\\\"Grenada\\\",\\\"hr\\\":\\\"Grenada\\\",\\\"fa\\\":\\\"گرنادا\\\",\\\"de\\\":\\\"Grenada\\\",\\\"es\\\":\\\"Grenada\\\",\\\"fr\\\":\\\"Grenade\\\",\\\"ja\\\":\\\"グレナダ\\\",\\\"it\\\":\\\"Grenada\\\"}', 12.11666666, -61.66666666, '', '', 1, 'Q769', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(88, 'Guadeloupe', 'GLP', 'GP', '590', 'Basse-Terre', 'EUR', '€', '.gp', 'Guadeloupe', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Guadeloupe\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Guadalupe\\\",\\\"pt\\\":\\\"Guadalupe\\\",\\\"nl\\\":\\\"Guadeloupe\\\",\\\"hr\\\":\\\"Gvadalupa\\\",\\\"fa\\\":\\\"جزیره گوادلوپ\\\",\\\"de\\\":\\\"Guadeloupe\\\",\\\"es\\\":\\\"Guadalupe\\\",\\\"fr\\\":\\\"Guadeloupe\\\",\\\"ja\\\":\\\"グアドループ\\\",\\\"it\\\":\\\"Guadeloupa\\\"}', 16.25000000, -61.58333300, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(90, 'Guatemala', 'GTM', 'GT', '502', 'Guatemala City', 'GTQ', 'Q', '.gt', 'Guatemala', 'Americas', 'Central America', '[{\\\"zoneName\\\":\\\"America\\/Guatemala\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"}]', '{\\\"br\\\":\\\"Guatemala\\\",\\\"pt\\\":\\\"Guatemala\\\",\\\"nl\\\":\\\"Guatemala\\\",\\\"hr\\\":\\\"Gvatemala\\\",\\\"fa\\\":\\\"گواتمالا\\\",\\\"de\\\":\\\"Guatemala\\\",\\\"es\\\":\\\"Guatemala\\\",\\\"fr\\\":\\\"Guatemala\\\",\\\"ja\\\":\\\"グアテマラ\\\",\\\"it\\\":\\\"Guatemala\\\"}', 15.50000000, -90.25000000, '', '', 1, 'Q774', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(94, 'Guyana', 'GUY', 'GY', '592', 'Georgetown', 'GYD', '$', '.gy', 'Guyana', 'Americas', 'South America', '[{\\\"zoneName\\\":\\\"America\\/Guyana\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"GYT\\\",\\\"tzName\\\":\\\"Guyana Time\\\"}]', '{\\\"br\\\":\\\"Guiana\\\",\\\"pt\\\":\\\"Guiana\\\",\\\"nl\\\":\\\"Guyana\\\",\\\"hr\\\":\\\"Gvajana\\\",\\\"fa\\\":\\\"گویان\\\",\\\"de\\\":\\\"Guyana\\\",\\\"es\\\":\\\"Guyana\\\",\\\"fr\\\":\\\"Guyane\\\",\\\"ja\\\":\\\"ガイアナ\\\",\\\"it\\\":\\\"Guyana\\\"}', 5.00000000, -59.00000000, '', '', 1, 'Q734', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(95, 'Haiti', 'HTI', 'HT', '509', 'Port-au-Prince', 'HTG', 'G', '.ht', 'Haïti', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Port-au-Prince\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"}]', '{\\\"br\\\":\\\"Haiti\\\",\\\"pt\\\":\\\"Haiti\\\",\\\"nl\\\":\\\"Haïti\\\",\\\"hr\\\":\\\"Haiti\\\",\\\"fa\\\":\\\"هائیتی\\\",\\\"de\\\":\\\"Haiti\\\",\\\"es\\\":\\\"Haiti\\\",\\\"fr\\\":\\\"Haïti\\\",\\\"ja\\\":\\\"ハイチ\\\",\\\"it\\\":\\\"Haiti\\\"}', 19.00000000, -72.41666666, '', '', 1, 'Q790', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(97, 'Honduras', 'HND', 'HN', '504', 'Tegucigalpa', 'HNL', 'L', '.hn', 'Honduras', 'Americas', 'Central America', '[{\\\"zoneName\\\":\\\"America\\/Tegucigalpa\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"}]', '{\\\"br\\\":\\\"Honduras\\\",\\\"pt\\\":\\\"Honduras\\\",\\\"nl\\\":\\\"Honduras\\\",\\\"hr\\\":\\\"Honduras\\\",\\\"fa\\\":\\\"هندوراس\\\",\\\"de\\\":\\\"Honduras\\\",\\\"es\\\":\\\"Honduras\\\",\\\"fr\\\":\\\"Honduras\\\",\\\"ja\\\":\\\"ホンジュラス\\\",\\\"it\\\":\\\"Honduras\\\"}', 15.00000000, -86.50000000, '', '', 1, 'Q783', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(108, 'Jamaica', 'JAM', 'JM', '+1-876', 'Kingston', 'JMD', 'J$', '.jm', 'Jamaica', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Jamaica\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"}]', '{\\\"br\\\":\\\"Jamaica\\\",\\\"pt\\\":\\\"Jamaica\\\",\\\"nl\\\":\\\"Jamaica\\\",\\\"hr\\\":\\\"Jamajka\\\",\\\"fa\\\":\\\"جامائیکا\\\",\\\"de\\\":\\\"Jamaika\\\",\\\"es\\\":\\\"Jamaica\\\",\\\"fr\\\":\\\"Jamaïque\\\",\\\"ja\\\":\\\"ジャマイカ\\\",\\\"it\\\":\\\"Giamaica\\\"}', 18.25000000, -77.50000000, '', '', 1, 'Q766', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(138, 'Martinique', 'MTQ', 'MQ', '596', 'Fort-de-France', 'EUR', '€', '.mq', 'Martinique', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Martinique\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Martinica\\\",\\\"pt\\\":\\\"Martinica\\\",\\\"nl\\\":\\\"Martinique\\\",\\\"hr\\\":\\\"Martinique\\\",\\\"fa\\\":\\\"مونتسرات\\\",\\\"de\\\":\\\"Martinique\\\",\\\"es\\\":\\\"Martinica\\\",\\\"fr\\\":\\\"Martinique\\\",\\\"ja\\\":\\\"マルティニーク\\\",\\\"it\\\":\\\"Martinica\\\"}', 14.66666700, -61.00000000, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(142, 'Mexico', 'MEX', 'MX', '52', 'Mexico City', 'MXN', '$', '.mx', 'México', 'Americas', 'Central America', '[{\\\"zoneName\\\":\\\"America\\/Bahia_Banderas\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Cancun\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Chihuahua\\\",\\\"gmtOffset\\\":-25200,\\\"gmtOffsetName\\\":\\\"UTC-07:00\\\",\\\"abbreviation\\\":\\\"MST\\\",\\\"tzName\\\":\\\"Mountain Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Hermosillo\\\",\\\"gmtOffset\\\":-25200,\\\"gmtOffsetName\\\":\\\"UTC-07:00\\\",\\\"abbreviation\\\":\\\"MST\\\",\\\"tzName\\\":\\\"Mountain Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Matamoros\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Mazatlan\\\",\\\"gmtOffset\\\":-25200,\\\"gmtOffsetName\\\":\\\"UTC-07:00\\\",\\\"abbreviation\\\":\\\"MST\\\",\\\"tzName\\\":\\\"Mountain Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Merida\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Mexico_City\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Monterrey\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Ojinaga\\\",\\\"gmtOffset\\\":-25200,\\\"gmtOffsetName\\\":\\\"UTC-07:00\\\",\\\"abbreviation\\\":\\\"MST\\\",\\\"tzName\\\":\\\"Mountain Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Tijuana\\\",\\\"gmtOffset\\\":-28800,\\\"gmtOffsetName\\\":\\\"UTC-08:00\\\",\\\"abbreviation\\\":\\\"PST\\\",\\\"tzName\\\":\\\"Pacific Standard Time (North America\\\"}]', '{\\\"br\\\":\\\"México\\\",\\\"pt\\\":\\\"México\\\",\\\"nl\\\":\\\"Mexico\\\",\\\"hr\\\":\\\"Meksiko\\\",\\\"fa\\\":\\\"مکزیک\\\",\\\"de\\\":\\\"Mexiko\\\",\\\"es\\\":\\\"México\\\",\\\"fr\\\":\\\"Mexique\\\",\\\"ja\\\":\\\"メキシコ\\\",\\\"it\\\":\\\"Messico\\\"}', 23.00000000, -102.00000000, '', '', 1, 'Q96', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(148, 'Montserrat', 'MSR', 'MS', '+1-664', 'Plymouth', 'XCD', '$', '.ms', 'Montserrat', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Montserrat\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Montserrat\\\",\\\"pt\\\":\\\"Monserrate\\\",\\\"nl\\\":\\\"Montserrat\\\",\\\"hr\\\":\\\"Montserrat\\\",\\\"fa\\\":\\\"مایوت\\\",\\\"de\\\":\\\"Montserrat\\\",\\\"es\\\":\\\"Montserrat\\\",\\\"fr\\\":\\\"Montserrat\\\",\\\"ja\\\":\\\"モントセラト\\\",\\\"it\\\":\\\"Montserrat\\\"}', 16.75000000, -62.20000000, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(155, 'Bonaire, Sint Eustatius and Saba', 'BES', 'BQ', '599', 'Kralendijk', 'USD', '$', '.an', 'Caribisch Nederland', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Anguilla\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Bonaire\\\",\\\"pt\\\":\\\"Bonaire\\\",\\\"fa\\\":\\\"بونیر\\\",\\\"de\\\":\\\"Bonaire, Sint Eustatius und Saba\\\",\\\"fr\\\":\\\"Bonaire, Saint-Eustache et Saba\\\",\\\"it\\\":\\\"Bonaire, Saint-Eustache e Saba\\\"}', 12.15000000, -68.26666700, '', '', 1, 'Q27561', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(159, 'Nicaragua', 'NIC', 'NI', '505', 'Managua', 'NIO', 'C$', '.ni', 'Nicaragua', 'Americas', 'Central America', '[{\\\"zoneName\\\":\\\"America\\/Managua\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"}]', '{\\\"br\\\":\\\"Nicarágua\\\",\\\"pt\\\":\\\"Nicarágua\\\",\\\"nl\\\":\\\"Nicaragua\\\",\\\"hr\\\":\\\"Nikaragva\\\",\\\"fa\\\":\\\"نیکاراگوئه\\\",\\\"de\\\":\\\"Nicaragua\\\",\\\"es\\\":\\\"Nicaragua\\\",\\\"fr\\\":\\\"Nicaragua\\\",\\\"ja\\\":\\\"ニカラグア\\\",\\\"it\\\":\\\"Nicaragua\\\"}', 13.00000000, -85.00000000, '', '', 1, 'Q811', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(170, 'Panama', 'PAN', 'PA', '507', 'Panama City', 'PAB', 'B/.', '.pa', 'Panamá', 'Americas', 'Central America', '[{\\\"zoneName\\\":\\\"America\\/Panama\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"}]', '{\\\"br\\\":\\\"Panamá\\\",\\\"pt\\\":\\\"Panamá\\\",\\\"nl\\\":\\\"Panama\\\",\\\"hr\\\":\\\"Panama\\\",\\\"fa\\\":\\\"پاناما\\\",\\\"de\\\":\\\"Panama\\\",\\\"es\\\":\\\"Panamá\\\",\\\"fr\\\":\\\"Panama\\\",\\\"ja\\\":\\\"パナマ\\\",\\\"it\\\":\\\"Panama\\\"}', 9.00000000, -80.00000000, '', '', 1, 'Q804', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(172, 'Paraguay', 'PRY', 'PY', '595', 'Asuncion', 'PYG', '₲', '.py', 'Paraguay', 'Americas', 'South America', '[{\\\"zoneName\\\":\\\"America\\/Asuncion\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"PYST\\\",\\\"tzName\\\":\\\"Paraguay Summer Time\\\"}]', '{\\\"br\\\":\\\"Paraguai\\\",\\\"pt\\\":\\\"Paraguai\\\",\\\"nl\\\":\\\"Paraguay\\\",\\\"hr\\\":\\\"Paragvaj\\\",\\\"fa\\\":\\\"پاراگوئه\\\",\\\"de\\\":\\\"Paraguay\\\",\\\"es\\\":\\\"Paraguay\\\",\\\"fr\\\":\\\"Paraguay\\\",\\\"ja\\\":\\\"パラグアイ\\\",\\\"it\\\":\\\"Paraguay\\\"}', -23.00000000, -58.00000000, '', '', 1, 'Q733', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(173, 'Peru', 'PER', 'PE', '51', 'Lima', 'PEN', 'S/.', '.pe', 'Perú', 'Americas', 'South America', '[{\\\"zoneName\\\":\\\"America\\/Lima\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"PET\\\",\\\"tzName\\\":\\\"Peru Time\\\"}]', '{\\\"br\\\":\\\"Peru\\\",\\\"pt\\\":\\\"Peru\\\",\\\"nl\\\":\\\"Peru\\\",\\\"hr\\\":\\\"Peru\\\",\\\"fa\\\":\\\"پرو\\\",\\\"de\\\":\\\"Peru\\\",\\\"es\\\":\\\"Perú\\\",\\\"fr\\\":\\\"Pérou\\\",\\\"ja\\\":\\\"ペルー\\\",\\\"it\\\":\\\"Perù\\\"}', -10.00000000, -76.00000000, '', '', 1, 'Q419', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(178, 'Puerto Rico', 'PRI', 'PR', '+1-787 and 1-939', 'San Juan', 'USD', '$', '.pr', 'Puerto Rico', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Puerto_Rico\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Porto Rico\\\",\\\"pt\\\":\\\"Porto Rico\\\",\\\"nl\\\":\\\"Puerto Rico\\\",\\\"hr\\\":\\\"Portoriko\\\",\\\"fa\\\":\\\"پورتو ریکو\\\",\\\"de\\\":\\\"Puerto Rico\\\",\\\"es\\\":\\\"Puerto Rico\\\",\\\"fr\\\":\\\"Porto Rico\\\",\\\"ja\\\":\\\"プエルトリコ\\\",\\\"it\\\":\\\"Porto Rico\\\"}', 18.25000000, -66.50000000, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(185, 'Saint Kitts And Nevis', 'KNA', 'KN', '+1-869', 'Basseterre', 'XCD', '$', '.kn', 'Saint Kitts and Nevis', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/St_Kitts\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"São Cristóvão e Neves\\\",\\\"pt\\\":\\\"São Cristóvão e Neves\\\",\\\"nl\\\":\\\"Saint Kitts en Nevis\\\",\\\"hr\\\":\\\"Sveti Kristof i Nevis\\\",\\\"fa\\\":\\\"سنت کیتس و نویس\\\",\\\"de\\\":\\\"St. Kitts und Nevis\\\",\\\"es\\\":\\\"San Cristóbal y Nieves\\\",\\\"fr\\\":\\\"Saint-Christophe-et-Niévès\\\",\\\"ja\\\":\\\"セントクリストファー・ネイビス\\\",\\\"it\\\":\\\"Saint Kitts e Nevis\\\"}', 17.33333333, -62.75000000, '', '', 1, 'Q763', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(186, 'Saint Lucia', 'LCA', 'LC', '+1-758', 'Castries', 'XCD', '$', '.lc', 'Saint Lucia', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/St_Lucia\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Santa Lúcia\\\",\\\"pt\\\":\\\"Santa Lúcia\\\",\\\"nl\\\":\\\"Saint Lucia\\\",\\\"hr\\\":\\\"Sveta Lucija\\\",\\\"fa\\\":\\\"سنت لوسیا\\\",\\\"de\\\":\\\"Saint Lucia\\\",\\\"es\\\":\\\"Santa Lucía\\\",\\\"fr\\\":\\\"Saint-Lucie\\\",\\\"ja\\\":\\\"セントルシア\\\",\\\"it\\\":\\\"Santa Lucia\\\"}', 13.88333333, -60.96666666, '', '', 1, 'Q760', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(187, 'Saint Pierre and Miquelon', 'SPM', 'PM', '508', 'Saint-Pierre', 'EUR', '€', '.pm', 'Saint-Pierre-et-Miquelon', 'Americas', 'Northern America', '[{\\\"zoneName\\\":\\\"America\\/Miquelon\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"PMDT\\\",\\\"tzName\\\":\\\"Pierre & Miquelon Daylight Time\\\"}]', '{\\\"br\\\":\\\"Saint-Pierre e Miquelon\\\",\\\"pt\\\":\\\"São Pedro e Miquelon\\\",\\\"nl\\\":\\\"Saint Pierre en Miquelon\\\",\\\"hr\\\":\\\"Sveti Petar i Mikelon\\\",\\\"fa\\\":\\\"سن پیر و میکلن\\\",\\\"de\\\":\\\"Saint-Pierre und Miquelon\\\",\\\"es\\\":\\\"San Pedro y Miquelón\\\",\\\"fr\\\":\\\"Saint-Pierre-et-Miquelon\\\",\\\"ja\\\":\\\"サンピエール島・ミクロン島\\\",\\\"it\\\":\\\"Saint-Pierre e Miquelon\\\"}', 46.83333333, -56.33333333, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(188, 'Saint Vincent And The Grenadines', 'VCT', 'VC', '+1-784', 'Kingstown', 'XCD', '$', '.vc', 'Saint Vincent and the Grenadines', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/St_Vincent\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"São Vicente e Granadinas\\\",\\\"pt\\\":\\\"São Vicente e Granadinas\\\",\\\"nl\\\":\\\"Saint Vincent en de Grenadines\\\",\\\"hr\\\":\\\"Sveti Vincent i Grenadini\\\",\\\"fa\\\":\\\"سنت وینسنت و گرنادین‌ها\\\",\\\"de\\\":\\\"Saint Vincent und die Grenadinen\\\",\\\"es\\\":\\\"San Vicente y Granadinas\\\",\\\"fr\\\":\\\"Saint-Vincent-et-les-Grenadines\\\",\\\"ja\\\":\\\"セントビンセントおよびグレナディーン諸島\\\",\\\"it\\\":\\\"Saint Vincent e Grenadine\\\"}', 13.25000000, -61.20000000, '', '', 1, 'Q757', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(189, 'Saint-Barthelemy', 'BLM', 'BL', '590', 'Gustavia', 'EUR', '€', '.bl', 'Saint-Barthélemy', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/St_Barthelemy\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"São Bartolomeu\\\",\\\"pt\\\":\\\"São Bartolomeu\\\",\\\"nl\\\":\\\"Saint Barthélemy\\\",\\\"hr\\\":\\\"Saint Barthélemy\\\",\\\"fa\\\":\\\"سن-بارتلمی\\\",\\\"de\\\":\\\"Saint-Barthélemy\\\",\\\"es\\\":\\\"San Bartolomé\\\",\\\"fr\\\":\\\"Saint-Barthélemy\\\",\\\"ja\\\":\\\"サン・バルテルミー\\\",\\\"it\\\":\\\"Antille Francesi\\\"}', 18.50000000, -63.41666666, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(190, 'Saint-Martin (French part)', 'MAF', 'MF', '590', 'Marigot', 'EUR', '€', '.mf', 'Saint-Martin', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Marigot\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Saint Martin\\\",\\\"pt\\\":\\\"Ilha São Martinho\\\",\\\"nl\\\":\\\"Saint-Martin\\\",\\\"hr\\\":\\\"Sveti Martin\\\",\\\"fa\\\":\\\"سینت مارتن\\\",\\\"de\\\":\\\"Saint Martin\\\",\\\"es\\\":\\\"Saint Martin\\\",\\\"fr\\\":\\\"Saint-Martin\\\",\\\"ja\\\":\\\"サン・マルタン（フランス領）\\\",\\\"it\\\":\\\"Saint Martin\\\"}', 18.08333333, -63.95000000, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(205, 'South Georgia', 'SGS', 'GS', '', 'Grytviken', 'GBP', '£', '.gs', 'South Georgia', 'Americas', 'South America', '[{\\\"zoneName\\\":\\\"Atlantic\\/South_Georgia\\\",\\\"gmtOffset\\\":-7200,\\\"gmtOffsetName\\\":\\\"UTC-02:00\\\",\\\"abbreviation\\\":\\\"GST\\\",\\\"tzName\\\":\\\"South Georgia and the South Sandwich Islands Time\\\"}]', '{\\\"br\\\":\\\"Ilhas Geórgias do Sul e Sandwich do Sul\\\",\\\"pt\\\":\\\"Ilhas Geórgia do Sul e Sanduíche do Sul\\\",\\\"nl\\\":\\\"Zuid-Georgia en Zuidelijke Sandwicheilanden\\\",\\\"hr\\\":\\\"Južna Georgija i otočje Južni Sandwich\\\",\\\"fa\\\":\\\"جزایر جورجیای جنوبی و ساندویچ جنوبی\\\",\\\"de\\\":\\\"Südgeorgien und die Südlichen Sandwichinseln\\\",\\\"es\\\":\\\"Islas Georgias del Sur y Sandwich del Sur\\\",\\\"fr\\\":\\\"Géorgie du Sud-et-les Îles Sandwich du Sud\\\",\\\"ja\\\":\\\"サウスジョージア・サウスサンドウィッチ諸島\\\",\\\"it\\\":\\\"Georgia del Sud e Isole Sandwich Meridionali\\\"}', -54.50000000, -37.00000000, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(210, 'Suriname', 'SUR', 'SR', '597', 'Paramaribo', 'SRD', '$', '.sr', 'Suriname', 'Americas', 'South America', '[{\\\"zoneName\\\":\\\"America\\/Paramaribo\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"SRT\\\",\\\"tzName\\\":\\\"Suriname Time\\\"}]', '{\\\"br\\\":\\\"Suriname\\\",\\\"pt\\\":\\\"Suriname\\\",\\\"nl\\\":\\\"Suriname\\\",\\\"hr\\\":\\\"Surinam\\\",\\\"fa\\\":\\\"سورینام\\\",\\\"de\\\":\\\"Suriname\\\",\\\"es\\\":\\\"Surinam\\\",\\\"fr\\\":\\\"Surinam\\\",\\\"ja\\\":\\\"スリナム\\\",\\\"it\\\":\\\"Suriname\\\"}', 4.00000000, -56.00000000, '', '', 1, 'Q730', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(223, 'Trinidad And Tobago', 'TTO', 'TT', '+1-868', 'Port of Spain', 'TTD', '$', '.tt', 'Trinidad and Tobago', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Port_of_Spain\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Trinidad e Tobago\\\",\\\"pt\\\":\\\"Trindade e Tobago\\\",\\\"nl\\\":\\\"Trinidad en Tobago\\\",\\\"hr\\\":\\\"Trinidad i Tobago\\\",\\\"fa\\\":\\\"ترینیداد و توباگو\\\",\\\"de\\\":\\\"Trinidad und Tobago\\\",\\\"es\\\":\\\"Trinidad y Tobago\\\",\\\"fr\\\":\\\"Trinité et Tobago\\\",\\\"ja\\\":\\\"トリニダード・トバゴ\\\",\\\"it\\\":\\\"Trinidad e Tobago\\\"}', 11.00000000, -61.00000000, '', '', 1, 'Q754', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(227, 'Turks And Caicos Islands', 'TCA', 'TC', '+1-649', 'Cockburn Town', 'USD', '$', '.tc', 'Turks and Caicos Islands', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Grand_Turk\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"}]', '{\\\"br\\\":\\\"Ilhas Turcas e Caicos\\\",\\\"pt\\\":\\\"Ilhas Turcas e Caicos\\\",\\\"nl\\\":\\\"Turks- en Caicoseilanden\\\",\\\"hr\\\":\\\"Otoci Turks i Caicos\\\",\\\"fa\\\":\\\"جزایر تورکس و کایکوس\\\",\\\"de\\\":\\\"Turks- und Caicosinseln\\\",\\\"es\\\":\\\"Islas Turks y Caicos\\\",\\\"fr\\\":\\\"Îles Turques-et-Caïques\\\",\\\"ja\\\":\\\"タークス・カイコス諸島\\\",\\\"it\\\":\\\"Isole Turks e Caicos\\\"}', 21.75000000, -71.58333333, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36');
INSERT INTO `countries` (`id`, `name`, `iso3`, `iso2`, `phonecode`, `capital`, `currency`, `currency_symbol`, `tld`, `native`, `region`, `subregion`, `timezones`, `translations`, `latitude`, `longitude`, `emoji`, `emojiU`, `flag`, `wikiDataId`, `covered`, `created_at`, `updated_at`) VALUES
(233, 'United States', 'USA', 'US', '1', 'Washington', 'USD', '$', '.us', 'United States', 'Americas', 'Northern America', '[{\\\"zoneName\\\":\\\"America\\/Adak\\\",\\\"gmtOffset\\\":-36000,\\\"gmtOffsetName\\\":\\\"UTC-10:00\\\",\\\"abbreviation\\\":\\\"HST\\\",\\\"tzName\\\":\\\"Hawaii\\u2013Aleutian Standard Time\\\"},{\\\"zoneName\\\":\\\"America\\/Anchorage\\\",\\\"gmtOffset\\\":-32400,\\\"gmtOffsetName\\\":\\\"UTC-09:00\\\",\\\"abbreviation\\\":\\\"AKST\\\",\\\"tzName\\\":\\\"Alaska Standard Time\\\"},{\\\"zoneName\\\":\\\"America\\/Boise\\\",\\\"gmtOffset\\\":-25200,\\\"gmtOffsetName\\\":\\\"UTC-07:00\\\",\\\"abbreviation\\\":\\\"MST\\\",\\\"tzName\\\":\\\"Mountain Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Chicago\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Denver\\\",\\\"gmtOffset\\\":-25200,\\\"gmtOffsetName\\\":\\\"UTC-07:00\\\",\\\"abbreviation\\\":\\\"MST\\\",\\\"tzName\\\":\\\"Mountain Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Detroit\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Indiana\\/Indianapolis\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Indiana\\/Knox\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Indiana\\/Marengo\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Indiana\\/Petersburg\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Indiana\\/Tell_City\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Indiana\\/Vevay\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Indiana\\/Vincennes\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Indiana\\/Winamac\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Juneau\\\",\\\"gmtOffset\\\":-32400,\\\"gmtOffsetName\\\":\\\"UTC-09:00\\\",\\\"abbreviation\\\":\\\"AKST\\\",\\\"tzName\\\":\\\"Alaska Standard Time\\\"},{\\\"zoneName\\\":\\\"America\\/Kentucky\\/Louisville\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Kentucky\\/Monticello\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Los_Angeles\\\",\\\"gmtOffset\\\":-28800,\\\"gmtOffsetName\\\":\\\"UTC-08:00\\\",\\\"abbreviation\\\":\\\"PST\\\",\\\"tzName\\\":\\\"Pacific Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Menominee\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Metlakatla\\\",\\\"gmtOffset\\\":-32400,\\\"gmtOffsetName\\\":\\\"UTC-09:00\\\",\\\"abbreviation\\\":\\\"AKST\\\",\\\"tzName\\\":\\\"Alaska Standard Time\\\"},{\\\"zoneName\\\":\\\"America\\/New_York\\\",\\\"gmtOffset\\\":-18000,\\\"gmtOffsetName\\\":\\\"UTC-05:00\\\",\\\"abbreviation\\\":\\\"EST\\\",\\\"tzName\\\":\\\"Eastern Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Nome\\\",\\\"gmtOffset\\\":-32400,\\\"gmtOffsetName\\\":\\\"UTC-09:00\\\",\\\"abbreviation\\\":\\\"AKST\\\",\\\"tzName\\\":\\\"Alaska Standard Time\\\"},{\\\"zoneName\\\":\\\"America\\/North_Dakota\\/Beulah\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/North_Dakota\\/Center\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/North_Dakota\\/New_Salem\\\",\\\"gmtOffset\\\":-21600,\\\"gmtOffsetName\\\":\\\"UTC-06:00\\\",\\\"abbreviation\\\":\\\"CST\\\",\\\"tzName\\\":\\\"Central Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Phoenix\\\",\\\"gmtOffset\\\":-25200,\\\"gmtOffsetName\\\":\\\"UTC-07:00\\\",\\\"abbreviation\\\":\\\"MST\\\",\\\"tzName\\\":\\\"Mountain Standard Time (North America\\\"},{\\\"zoneName\\\":\\\"America\\/Sitka\\\",\\\"gmtOffset\\\":-32400,\\\"gmtOffsetName\\\":\\\"UTC-09:00\\\",\\\"abbreviation\\\":\\\"AKST\\\",\\\"tzName\\\":\\\"Alaska Standard Time\\\"},{\\\"zoneName\\\":\\\"America\\/Yakutat\\\",\\\"gmtOffset\\\":-32400,\\\"gmtOffsetName\\\":\\\"UTC-09:00\\\",\\\"abbreviation\\\":\\\"AKST\\\",\\\"tzName\\\":\\\"Alaska Standard Time\\\"},{\\\"zoneName\\\":\\\"Pacific\\/Honolulu\\\",\\\"gmtOffset\\\":-36000,\\\"gmtOffsetName\\\":\\\"UTC-10:00\\\",\\\"abbreviation\\\":\\\"HST\\\",\\\"tzName\\\":\\\"Hawaii\\u2013Aleutian Standard Time\\\"}]', '{\\\"br\\\":\\\"Estados Unidos\\\",\\\"pt\\\":\\\"Estados Unidos\\\",\\\"nl\\\":\\\"Verenigde Staten\\\",\\\"hr\\\":\\\"Sjedinjene Američke Države\\\",\\\"fa\\\":\\\"ایالات متحده آمریکا\\\",\\\"de\\\":\\\"Vereinigte Staaten von Amerika\\\",\\\"es\\\":\\\"Estados Unidos\\\",\\\"fr\\\":\\\"États-Unis\\\",\\\"ja\\\":\\\"アメリカ合衆国\\\",\\\"it\\\":\\\"Stati Uniti D\'America\\\"}', 38.00000000, -97.00000000, '', '', 1, 'Q30', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(234, 'United States Minor Outlying Islands', 'UMI', 'UM', '1', '', 'USD', '$', '.us', 'United States Minor Outlying Islands', 'Americas', 'Northern America', '[{\\\"zoneName\\\":\\\"Pacific\\/Midway\\\",\\\"gmtOffset\\\":-39600,\\\"gmtOffsetName\\\":\\\"UTC-11:00\\\",\\\"abbreviation\\\":\\\"SST\\\",\\\"tzName\\\":\\\"Samoa Standard Time\\\"},{\\\"zoneName\\\":\\\"Pacific\\/Wake\\\",\\\"gmtOffset\\\":43200,\\\"gmtOffsetName\\\":\\\"UTC+12:00\\\",\\\"abbreviation\\\":\\\"WAKT\\\",\\\"tzName\\\":\\\"Wake Island Time\\\"}]', '{\\\"br\\\":\\\"Ilhas Menores Distantes dos Estados Unidos\\\",\\\"pt\\\":\\\"Ilhas Menores Distantes dos Estados Unidos\\\",\\\"nl\\\":\\\"Kleine afgelegen eilanden van de Verenigde Staten\\\",\\\"hr\\\":\\\"Mali udaljeni otoci SAD-a\\\",\\\"fa\\\":\\\"جزایر کوچک حاشیه‌ای ایالات متحده آمریکا\\\",\\\"de\\\":\\\"Kleinere Inselbesitzungen der Vereinigten Staaten\\\",\\\"es\\\":\\\"Islas Ultramarinas Menores de Estados Unidos\\\",\\\"fr\\\":\\\"Îles mineures éloignées des États-Unis\\\",\\\"ja\\\":\\\"合衆国領有小離島\\\",\\\"it\\\":\\\"Isole minori esterne degli Stati Uniti d\'America\\\"}', 0.00000000, 0.00000000, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(235, 'Uruguay', 'URY', 'UY', '598', 'Montevideo', 'UYU', '$', '.uy', 'Uruguay', 'Americas', 'South America', '[{\\\"zoneName\\\":\\\"America\\/Montevideo\\\",\\\"gmtOffset\\\":-10800,\\\"gmtOffsetName\\\":\\\"UTC-03:00\\\",\\\"abbreviation\\\":\\\"UYT\\\",\\\"tzName\\\":\\\"Uruguay Standard Time\\\"}]', '{\\\"br\\\":\\\"Uruguai\\\",\\\"pt\\\":\\\"Uruguai\\\",\\\"nl\\\":\\\"Uruguay\\\",\\\"hr\\\":\\\"Urugvaj\\\",\\\"fa\\\":\\\"اروگوئه\\\",\\\"de\\\":\\\"Uruguay\\\",\\\"es\\\":\\\"Uruguay\\\",\\\"fr\\\":\\\"Uruguay\\\",\\\"ja\\\":\\\"ウルグアイ\\\",\\\"it\\\":\\\"Uruguay\\\"}', -33.00000000, -56.00000000, '', '', 1, 'Q77', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(239, 'Venezuela', 'VEN', 'VE', '58', 'Caracas', 'VEF', 'Bs', '.ve', 'Venezuela', 'Americas', 'South America', '[{\\\"zoneName\\\":\\\"America\\/Caracas\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"VET\\\",\\\"tzName\\\":\\\"Venezuelan Standard Time\\\"}]', '{\\\"br\\\":\\\"Venezuela\\\",\\\"pt\\\":\\\"Venezuela\\\",\\\"nl\\\":\\\"Venezuela\\\",\\\"hr\\\":\\\"Venezuela\\\",\\\"fa\\\":\\\"ونزوئلا\\\",\\\"de\\\":\\\"Venezuela\\\",\\\"es\\\":\\\"Venezuela\\\",\\\"fr\\\":\\\"Venezuela\\\",\\\"ja\\\":\\\"ベネズエラ・ボリバル共和国\\\",\\\"it\\\":\\\"Venezuela\\\"}', 8.00000000, -66.00000000, '', '', 1, 'Q717', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(241, 'Virgin Islands (British)', 'VGB', 'VG', '+1-284', 'Road Town', 'USD', '$', '.vg', 'British Virgin Islands', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Tortola\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Ilhas Virgens Britânicas\\\",\\\"pt\\\":\\\"Ilhas Virgens Britânicas\\\",\\\"nl\\\":\\\"Britse Maagdeneilanden\\\",\\\"hr\\\":\\\"Britanski Djevičanski Otoci\\\",\\\"fa\\\":\\\"جزایر ویرجین بریتانیا\\\",\\\"de\\\":\\\"Britische Jungferninseln\\\",\\\"es\\\":\\\"Islas Vírgenes del Reino Unido\\\",\\\"fr\\\":\\\"Îles Vierges britanniques\\\",\\\"ja\\\":\\\"イギリス領ヴァージン諸島\\\",\\\"it\\\":\\\"Isole Vergini Britanniche\\\"}', 18.43138300, -64.62305000, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(242, 'Virgin Islands (US)', 'VIR', 'VI', '+1-340', 'Charlotte Amalie', 'USD', '$', '.vi', 'United States Virgin Islands', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/St_Thomas\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Ilhas Virgens Americanas\\\",\\\"pt\\\":\\\"Ilhas Virgens Americanas\\\",\\\"nl\\\":\\\"Verenigde Staten Maagdeneilanden\\\",\\\"fa\\\":\\\"جزایر ویرجین آمریکا\\\",\\\"de\\\":\\\"Amerikanische Jungferninseln\\\",\\\"es\\\":\\\"Islas Vírgenes de los Estados Unidos\\\",\\\"fr\\\":\\\"Îles Vierges des États-Unis\\\",\\\"ja\\\":\\\"アメリカ領ヴァージン諸島\\\",\\\"it\\\":\\\"Isole Vergini americane\\\"}', 18.34000000, -64.93000000, '', '', 1, NULL, 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(249, 'Curaçao', 'CUW', 'CW', '599', 'Willemstad', 'ANG', 'ƒ', '.cw', 'Curaçao', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Curacao\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Curaçao\\\",\\\"pt\\\":\\\"Curaçao\\\",\\\"nl\\\":\\\"Curaçao\\\",\\\"fa\\\":\\\"کوراسائو\\\",\\\"de\\\":\\\"Curaçao\\\",\\\"fr\\\":\\\"Curaçao\\\",\\\"it\\\":\\\"Curaçao\\\"}', 12.11666700, -68.93333300, '', '', 1, 'Q25279', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(250, 'Sint Maarten', 'SXM', 'SX', '1721', 'Philipsburg', 'ANG', 'ƒ', '.sx', 'Sint Maarten', 'Americas', 'Caribbean', '[{\\\"zoneName\\\":\\\"America\\/Anguilla\\\",\\\"gmtOffset\\\":-14400,\\\"gmtOffsetName\\\":\\\"UTC-04:00\\\",\\\"abbreviation\\\":\\\"AST\\\",\\\"tzName\\\":\\\"Atlantic Standard Time\\\"}]', '{\\\"br\\\":\\\"Sint Maarten\\\",\\\"pt\\\":\\\"São Martinho\\\",\\\"nl\\\":\\\"Sint Maarten\\\",\\\"fa\\\":\\\"سینت مارتن\\\",\\\"de\\\":\\\"Sint Maarten (niederl. Teil)\\\",\\\"fr\\\":\\\"Saint Martin (partie néerlandaise)\\\",\\\"it\\\":\\\"Saint Martin (parte olandese)\\\"}', 18.03333300, -63.05000000, '', '', 1, 'Q26273', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(20, '0001_01_01_000000_create_users_table', 1),
(21, '0001_01_01_000001_create_cache_table', 1),
(22, '0001_01_01_000002_create_jobs_table', 1),
(23, '2024_11_30_031951_create_permission_tables', 1),
(24, '2024_12_02_004415_create_branches_table', 1),
(25, '2024_12_02_011333_create_countries_table', 1),
(26, '2024_12_02_011712_create_states_table', 1),
(27, '2024_12_02_011800_create_areas_table', 1),
(28, '2024_12_02_013323_create_packages_table', 1),
(29, '2024_12_02_013603_create_clients_table', 1),
(30, '2024_12_02_015022_create_client_packages_table', 1),
(31, '2024_12_02_015502_create_client_preferences_table', 1),
(32, '2024_12_02_015913_create_shipments_table', 1),
(33, '2024_12_02_022100_create_client_shipment_logs_table', 1),
(34, '2024_12_02_022332_create_package_shipments_table', 1),
(35, '2024_12_02_022739_create_client_addresses_table', 1),
(36, '2024_12_02_022838_create_missions_table', 1),
(37, '2024_12_02_023818_create_receivers_table', 1),
(38, '2024_12_02_025315_create_shipment_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `missions`
--

CREATE TABLE `missions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status_id` int(11) DEFAULT 1,
  `type` int(11) NOT NULL DEFAULT 1,
  `amount` double NOT NULL DEFAULT 0,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `due_date` varchar(255) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `from_branch_id` int(11) DEFAULT NULL,
  `to_branch_id` int(11) DEFAULT NULL,
  `seg_img` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `missions`
--

INSERT INTO `missions` (`id`, `code`, `status_id`, `type`, `amount`, `order`, `due_date`, `user_id`, `from_branch_id`, `to_branch_id`, `seg_img`, `otp`, `created_at`, `updated_at`) VALUES
(1, 'OCEAN-1', 0, 2, 0, 0, '2024-12-12', NULL, 6, 5, NULL, NULL, '2024-12-11 19:59:15', '2024-12-11 20:59:49'),
(2, 'AIR-2', 0, 1, 0, 0, '2024-12-26', NULL, 6, 1, NULL, NULL, '2024-12-23 01:05:01', '2025-01-04 09:31:38'),
(3, 'OCEAN-3', 0, 2, 0, 0, '2024-12-24', NULL, 6, 1, NULL, NULL, '2024-12-23 01:09:26', '2025-01-12 15:25:56'),
(4, 'AIR-4', 1, 1, 0, 0, '2024-12-31', 1, 6, 3, NULL, NULL, '2024-12-28 01:46:40', '2024-12-28 01:46:40'),
(5, 'OCEAN-5', 1, 2, 0, 0, '2024-12-30', 1, 2, 1, NULL, NULL, '2024-12-28 01:52:29', '2024-12-28 01:52:29'),
(6, 'OCEAN-6', 1, 2, 0, 0, '2025-01-06', 10, 6, 1, NULL, NULL, '2025-01-01 23:07:31', '2025-01-01 23:07:31'),
(7, 'OCEAN-7', 1, 2, 0, 0, '2025-01-07', 10, 6, 1, NULL, NULL, '2025-01-04 09:30:57', '2025-01-04 09:30:58'),
(8, 'OCEAN-8', 1, 2, 0, 0, '2025-03-27', 10, 6, 1, NULL, NULL, '2025-03-01 05:17:03', '2025-03-01 05:17:43');

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 13),
(2, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 16),
(2, 'App\\Models\\User', 17),
(2, 'App\\Models\\User', 18),
(2, 'App\\Models\\User', 19),
(2, 'App\\Models\\User', 20),
(2, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 22),
(2, 'App\\Models\\User', 23),
(2, 'App\\Models\\User', 24),
(2, 'App\\Models\\User', 25),
(2, 'App\\Models\\User', 26),
(2, 'App\\Models\\User', 27),
(2, 'App\\Models\\User', 28),
(2, 'App\\Models\\User', 29),
(2, 'App\\Models\\User', 30),
(2, 'App\\Models\\User', 31),
(2, 'App\\Models\\User', 32),
(2, 'App\\Models\\User', 33);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `cost` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `cost`, `created_at`, `updated_at`) VALUES
(2, 'Box', 5, '2024-12-11 08:12:09', '2025-01-02 00:29:30'),
(3, 'Pallet', 10, '2024-12-11 08:15:49', '2025-01-02 00:29:18'),
(5, 'Envelope', 5, '2025-01-02 00:29:55', '2025-01-02 00:29:55'),
(6, 'Pouch', 5, '2025-01-02 00:30:52', '2025-01-02 00:30:52');

-- --------------------------------------------------------

--
-- Table structure for table `package_shipments`
--

CREATE TABLE `package_shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `shipment_id` int(10) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `notes` varchar(145) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_shipments`
--

INSERT INTO `package_shipments` (`id`, `package_id`, `shipment_id`, `description`, `notes`, `value`, `image`, `weight`, `length`, `width`, `height`, `qty`, `created_at`, `updated_at`) VALUES
(10, 2, 14, 'caja', NULL, NULL, NULL, 2, 3, 2, 3, 1, '2024-12-22 19:40:31', '2024-12-22 19:40:31'),
(21, 3, 15, 'no se', NULL, NULL, NULL, 2, 3, 4, 3, 1, '2024-12-24 23:07:59', '2024-12-24 23:07:59'),
(22, 2, 15, 'otro', NULL, NULL, NULL, 2, 3, 2, 2, 1, '2024-12-24 23:07:59', '2024-12-24 23:07:59'),
(23, 2, 13, 'caja', NULL, NULL, NULL, 1.5, 4, 2, 3, 2, '2024-12-24 23:13:51', '2024-12-24 23:13:51'),
(24, 2, 16, 'cajas', NULL, NULL, NULL, 21.7, 11.5, 9.7, 10.6, 2, '2024-12-26 22:04:39', '2024-12-26 22:04:39'),
(25, 3, 17, '1', NULL, NULL, NULL, 23, 23, 22, 11, 1, '2024-12-31 07:15:41', '2024-12-31 07:15:41'),
(26, 1, 24, 'Package 1 description', NULL, NULL, NULL, 5.5, 10, 15, 20, 2, '2025-01-01 01:59:45', '2025-01-01 01:59:45'),
(27, 1, 25, 'Package 1 description', NULL, NULL, NULL, 5.5, 10, 15, 20, 2, '2025-01-01 03:16:02', '2025-01-01 03:16:02'),
(30, 3, 27, 'WATER', NULL, NULL, NULL, 2500, 48, 48, 52, 2, '2025-01-02 20:06:47', '2025-01-02 20:06:47'),
(34, 1, 30, NULL, NULL, NULL, NULL, 0.3, 7.5, 7, 19.5, 1, '2025-01-04 04:28:07', '2025-01-04 04:28:07'),
(35, 2, 28, 'accessories', NULL, NULL, NULL, 12, 12, 12, 12, 1, '2025-01-04 06:00:16', '2025-01-04 06:00:16'),
(41, 2, 31, 'accessories', NULL, NULL, NULL, 20, 2.7, 4.4, 12.5, 1, '2025-01-06 07:37:58', '2025-01-06 07:37:58'),
(44, 2, 26, 'GENERAL CARGO', NULL, NULL, NULL, 0.3, 7.5, 7, 19.5, 1, '2025-01-06 12:49:57', '2025-01-06 12:49:57'),
(45, 2, 34, 'general merchandise', NULL, NULL, NULL, 15, 6, 8, 6, 1, '2025-01-06 12:51:47', '2025-01-06 12:51:47'),
(46, 2, 29, 'ELECTRONICS', NULL, NULL, NULL, 0.3, 7.5, 7, 19.5, 1, '2025-01-06 13:33:00', '2025-01-06 13:33:00'),
(47, 1, 35, NULL, NULL, NULL, NULL, 1.7, 11.2, 7.9, 4.9, 1, '2025-01-06 20:57:28', '2025-01-06 20:57:28'),
(48, 1, 36, NULL, NULL, NULL, NULL, 4.1, 12.5, 7.3, 7.5, 1, '2025-01-06 20:58:03', '2025-01-06 20:58:03'),
(49, 1, 37, NULL, NULL, NULL, NULL, 0.45, 5.7, 5.5, 5.3, 1, '2025-01-06 21:00:34', '2025-01-06 21:00:34'),
(50, 1, 38, NULL, NULL, NULL, NULL, 11.05, 17.9, 12.7, 4.6, 1, '2025-01-06 21:01:08', '2025-01-06 21:01:08'),
(51, 1, 39, NULL, NULL, NULL, NULL, 3.3, 15.2, 12.6, 9.8, 1, '2025-01-06 22:11:52', '2025-01-06 22:11:52'),
(52, 1, 40, NULL, NULL, NULL, NULL, 42.8, 28.6, 15.2, 11.8, 1, '2025-01-06 23:04:21', '2025-01-06 23:04:21'),
(53, 1, 41, NULL, NULL, NULL, NULL, 27, 20.7, 15.7, 13.3, 1, '2025-01-06 23:06:01', '2025-01-06 23:06:01'),
(54, 1, 42, NULL, NULL, NULL, NULL, 20.8, 15.3, 10.3, 12.6, 1, '2025-01-06 23:07:23', '2025-01-06 23:07:23'),
(55, 1, 43, NULL, NULL, NULL, NULL, 10, 16.5, 16.2, 6.4, 1, '2025-01-06 23:08:46', '2025-01-06 23:08:46'),
(56, 1, 44, NULL, NULL, NULL, NULL, 36.4, 27.4, 14.3, 17.2, 1, '2025-01-06 23:10:01', '2025-01-06 23:10:01'),
(57, 1, 45, NULL, NULL, NULL, NULL, 36.4, 27.5, 14.3, 16.9, 1, '2025-01-06 23:11:16', '2025-01-06 23:11:16'),
(58, 1, 46, NULL, NULL, NULL, NULL, 32.9, 22.4, 19.2, 12.1, 1, '2025-01-07 20:54:23', '2025-01-07 20:54:23'),
(62, 2, 47, 'ccc', NULL, NULL, NULL, 32.8, 22.5, 19.2, 12.2, 1, '2025-01-08 05:13:53', '2025-01-08 05:13:53'),
(64, 2, 48, NULL, NULL, NULL, NULL, 15, 14.5, 13.9, 12.2, 1, '2025-01-08 06:37:40', '2025-01-08 06:37:40'),
(66, 2, 49, 'GENERAL CARGO', NULL, NULL, NULL, 27.75, 14, 12.6, 14.3, 1, '2025-01-08 22:57:10', '2025-01-08 22:57:10'),
(70, 2, 51, 'accessories', 'not fit for  rxport', 50, NULL, 3, 6, 6, 6, 1, '2025-01-12 14:40:10', '2025-01-12 14:40:10'),
(71, 3, 51, 'water', 'broken pallet', 400, NULL, 2500, 48, 40, 60, 2, '2025-01-12 14:40:10', '2025-01-12 14:40:10'),
(72, 3, 51, 'TOILET PAPER', '2', 1500, NULL, 350, 48, 40, 78, 2, '2025-01-12 14:40:10', '2025-01-12 14:40:10'),
(73, 1, 52, NULL, NULL, NULL, NULL, 8.65, 16.5, 12.3, 12.1, 1, '2025-01-14 20:53:57', '2025-01-14 20:53:57'),
(74, 1, 53, NULL, NULL, NULL, NULL, 27.15, 25.6, 19, 15.7, 1, '2025-01-14 21:26:30', '2025-01-14 21:26:30'),
(75, 1, 54, NULL, NULL, NULL, NULL, 31.1, 23, 12.5, 19.6, 1, '2025-01-14 21:27:12', '2025-01-14 21:27:12'),
(76, 1, 55, NULL, NULL, NULL, NULL, 14.15, 13.5, 11.4, 13.9, 1, '2025-01-14 21:28:13', '2025-01-14 21:28:13'),
(77, 1, 56, NULL, NULL, NULL, NULL, 5.15, 15.8, 10.3, 10.2, 1, '2025-01-14 21:29:05', '2025-01-14 21:29:05'),
(78, 1, 57, NULL, NULL, NULL, NULL, 0.5, 9.3, 5.4, 2, 1, '2025-01-14 21:30:05', '2025-01-14 21:30:05'),
(79, 1, 58, NULL, NULL, NULL, NULL, 1.55, 16.7, 15.2, 4.5, 1, '2025-01-15 20:02:30', '2025-01-15 20:02:30'),
(80, 1, 59, NULL, NULL, NULL, NULL, 16.35, 31.1, 21.7, 6.7, 1, '2025-01-15 22:35:42', '2025-01-15 22:35:42'),
(81, 1, 60, NULL, NULL, NULL, NULL, 12.95, 21.2, 17.6, 10.3, 1, '2025-01-15 22:36:33', '2025-01-15 22:36:33'),
(82, 1, 61, NULL, NULL, NULL, NULL, 15.8, 17.8, 14.3, 10.6, 1, '2025-01-15 22:37:17', '2025-01-15 22:37:17'),
(83, 1, 62, NULL, NULL, NULL, NULL, 2.75, 10.9, 8.5, 6.1, 1, '2025-01-15 22:37:52', '2025-01-15 22:37:52'),
(84, 1, 63, NULL, NULL, NULL, NULL, 2, 16, 13.4, 2.7, 1, '2025-01-15 22:38:34', '2025-01-15 22:38:34'),
(85, 1, 64, NULL, NULL, NULL, NULL, 17.95, 26, 11.7, 12.2, 1, '2025-01-17 19:41:07', '2025-01-17 19:41:07'),
(86, 1, 65, NULL, NULL, NULL, NULL, 17.95, 26.4, 11.7, 12.2, 1, '2025-01-17 19:43:19', '2025-01-17 19:43:19'),
(87, 1, 66, NULL, NULL, NULL, NULL, 17.9, 26.2, 11.6, 12.2, 1, '2025-01-17 19:46:26', '2025-01-17 19:46:26'),
(88, 1, 67, NULL, NULL, NULL, NULL, 34.8, 28.7, 18.6, 14.8, 1, '2025-01-17 21:46:44', '2025-01-17 21:46:44'),
(89, 1, 68, NULL, NULL, NULL, NULL, 19.35, 25.3, 22.3, 6.1, 1, '2025-01-17 22:32:36', '2025-01-17 22:32:36'),
(90, 1, 69, NULL, NULL, NULL, NULL, 15.15, 21.8, 16.5, 8.4, 1, '2025-01-17 22:33:04', '2025-01-17 22:33:04'),
(92, 2, 70, 'cajas', NULL, NULL, NULL, 4, 13.4, 11.8, 4.9, 2, '2025-01-21 19:46:47', '2025-01-21 19:46:47'),
(93, 1, 71, NULL, NULL, NULL, NULL, 9.7, 12.5, 11.2, 9.9, 1, '2025-01-22 20:09:36', '2025-01-22 20:09:36'),
(94, 1, 72, NULL, NULL, NULL, NULL, 1.15, 15.4, 12.4, 4, 1, '2025-01-22 20:11:13', '2025-01-22 20:11:13'),
(95, 1, 73, NULL, NULL, NULL, NULL, 1.7, 13.7, 12.2, 2.4, 1, '2025-01-22 20:11:54', '2025-01-22 20:11:54'),
(96, 1, 74, NULL, NULL, NULL, NULL, 9.35, 16.2, 13.9, 11.5, 1, '2025-01-22 20:12:42', '2025-01-22 20:12:42'),
(97, 1, 75, NULL, NULL, NULL, NULL, 5.55, 9.5, 8.6, 6.2, 1, '2025-01-22 20:14:29', '2025-01-22 20:14:29'),
(98, 1, 76, NULL, NULL, NULL, NULL, 9.5, 10.9, 10.2, 8.7, 1, '2025-01-22 20:15:34', '2025-01-22 20:15:34'),
(99, 1, 77, NULL, NULL, NULL, NULL, 9.35, 9.9, 9, 8.3, 1, '2025-01-22 20:16:25', '2025-01-22 20:16:25'),
(100, 1, 78, NULL, NULL, NULL, NULL, 9.3, 9.8, 9.6, 8.4, 1, '2025-01-22 20:17:34', '2025-01-22 20:17:34'),
(101, 1, 79, NULL, NULL, NULL, NULL, 9.6, 15.1, 12.6, 9.6, 1, '2025-01-22 21:18:23', '2025-01-22 21:18:23'),
(102, 1, 80, NULL, NULL, NULL, NULL, 2.9, 8.6, 7.8, 6, 1, '2025-01-22 21:52:37', '2025-01-22 21:52:37'),
(103, 1, 81, NULL, NULL, NULL, NULL, 11.9, 26.1, 20.1, 6.5, 1, '2025-01-22 21:53:09', '2025-01-22 21:53:09'),
(104, 1, 82, NULL, NULL, NULL, NULL, 19.55, 25.6, 22, 5.6, 1, '2025-01-22 21:54:08', '2025-01-22 21:54:08'),
(105, 1, 83, NULL, NULL, NULL, NULL, 20.35, 31.4, 18.7, 10.3, 1, '2025-01-22 21:55:24', '2025-01-22 21:55:24'),
(106, 1, 84, NULL, NULL, NULL, NULL, 27.45, 17.9, 16.3, 12.4, 1, '2025-01-22 22:00:17', '2025-01-22 22:00:17'),
(107, 1, 85, NULL, NULL, NULL, NULL, 28.05, 14.2, 12.4, 14.7, 1, '2025-01-23 20:29:28', '2025-01-23 20:29:28'),
(108, 1, 86, NULL, NULL, NULL, NULL, 2.75, 12, 6.9, 6.8, 1, '2025-01-23 21:05:41', '2025-01-23 21:05:41'),
(109, 1, 87, NULL, NULL, NULL, NULL, 16.45, 14.3, 13.5, 9.8, 1, '2025-01-23 23:00:48', '2025-01-23 23:00:48'),
(110, 1, 88, NULL, NULL, NULL, NULL, 26.35, 26.2, 23, 7.1, 1, '2025-01-23 23:03:03', '2025-01-23 23:03:03'),
(111, 1, 89, NULL, NULL, NULL, NULL, 4.55, 12.1, 9.5, 6.7, 1, '2025-01-24 21:51:49', '2025-01-24 21:51:49'),
(112, 1, 90, NULL, NULL, NULL, NULL, 37.1, 23.4, 20.5, 17.9, 1, '2025-01-24 23:14:13', '2025-01-24 23:14:13'),
(113, 1, 91, NULL, NULL, NULL, NULL, 33.75, 28.2, 13.6, 18.2, 1, '2025-01-24 23:15:33', '2025-01-24 23:15:33'),
(114, 1, 92, NULL, NULL, NULL, NULL, 14.45, 16.7, 16, 10.5, 1, '2025-01-24 23:16:19', '2025-01-24 23:16:19'),
(115, 1, 93, NULL, NULL, NULL, NULL, 19.95, 19, 18.8, 9.7, 1, '2025-01-24 23:17:15', '2025-01-24 23:17:15'),
(116, 1, 94, NULL, NULL, NULL, NULL, 8.45, 17.9, 13.9, 8.6, 1, '2025-02-03 22:27:58', '2025-02-03 22:27:58'),
(117, 1, 95, NULL, NULL, NULL, NULL, 10.35, 17.7, 14.6, 10.4, 1, '2025-02-03 22:28:43', '2025-02-03 22:28:43'),
(118, 1, 96, NULL, NULL, NULL, NULL, 9.15, 12.8, 10.6, 8.2, 1, '2025-02-03 22:29:45', '2025-02-03 22:29:45'),
(119, 1, 97, NULL, NULL, NULL, NULL, 17.55, 23.9, 23, 15.8, 1, '2025-02-03 22:35:25', '2025-02-03 22:35:25'),
(120, 1, 98, NULL, NULL, NULL, NULL, 13.7, 31.9, 20.3, 5.3, 1, '2025-02-03 22:55:27', '2025-02-03 22:55:27'),
(121, 1, 99, NULL, NULL, NULL, NULL, 13.9, 32, 20.2, 5.1, 1, '2025-02-03 22:56:27', '2025-02-03 22:56:27'),
(122, 1, 100, NULL, NULL, NULL, NULL, 13.7, 31.8, 20.4, 5.2, 1, '2025-02-03 22:57:15', '2025-02-03 22:57:15'),
(123, 1, 101, NULL, NULL, NULL, NULL, 21.75, 30.6, 20.5, 12.4, 1, '2025-02-04 20:25:04', '2025-02-04 20:25:04'),
(124, 1, 102, NULL, NULL, NULL, NULL, 7.15, 21.8, 15.4, 6.5, 1, '2025-02-04 22:22:07', '2025-02-04 22:22:07'),
(125, 1, 103, NULL, NULL, NULL, NULL, 5.75, 16.6, 16.2, 7.8, 1, '2025-02-04 22:22:48', '2025-02-04 22:22:48'),
(126, 1, 104, NULL, NULL, NULL, NULL, 15.8, 30.9, 20.2, 5.1, 1, '2025-02-04 23:02:49', '2025-02-04 23:02:49'),
(127, 1, 105, NULL, NULL, NULL, NULL, 15.8, 30.9, 20.3, 5.2, 1, '2025-02-04 23:03:31', '2025-02-04 23:03:31'),
(128, 1, 106, NULL, NULL, NULL, NULL, 15.65, 31, 20.4, 5.2, 1, '2025-02-04 23:04:16', '2025-02-04 23:04:16'),
(129, 1, 109, NULL, NULL, NULL, NULL, 0.3, 7.5, 7, 19.5, 1, '2025-02-05 06:33:16', '2025-02-05 06:33:16'),
(130, 1, 110, NULL, NULL, NULL, NULL, 21.6, 24.2, 12.9, 11.4, 1, '2025-02-06 01:17:36', '2025-02-06 01:17:36'),
(131, 1, 111, NULL, NULL, NULL, NULL, 10, 15.1, 13.4, 10.5, 1, '2025-02-06 21:06:30', '2025-02-06 21:06:30'),
(132, 1, 112, NULL, NULL, NULL, NULL, 10.45, 19, 13.3, 11.5, 1, '2025-02-06 21:07:53', '2025-02-06 21:07:53'),
(133, 1, 113, NULL, NULL, NULL, NULL, 31.3, 24, 20.6, 18.9, 1, '2025-02-06 21:09:40', '2025-02-06 21:09:40'),
(134, 1, 114, NULL, NULL, NULL, NULL, 29.25, 21.3, 13.1, 13.6, 1, '2025-02-06 21:41:38', '2025-02-06 21:41:38'),
(135, 1, 115, NULL, NULL, NULL, NULL, 6.95, 13.6, 10.4, 6.8, 1, '2025-02-06 22:05:40', '2025-02-06 22:05:40'),
(136, 1, 116, NULL, NULL, NULL, NULL, 9.6, 16.1, 12.2, 7, 1, '2025-02-07 20:07:34', '2025-02-07 20:07:34'),
(137, 1, 117, NULL, NULL, NULL, NULL, 9.45, 15.7, 12.3, 7, 1, '2025-02-07 20:08:56', '2025-02-07 20:08:56'),
(138, 1, 118, NULL, NULL, NULL, NULL, 29.9, 27.7, 13.5, 17.8, 1, '2025-02-07 21:08:36', '2025-02-07 21:08:36'),
(139, 1, 119, NULL, NULL, NULL, NULL, 25.45, 18.5, 12.8, 7.8, 1, '2025-02-07 21:09:47', '2025-02-07 21:09:47'),
(140, 1, 120, NULL, NULL, NULL, NULL, 1.7, 10.2, 7.7, 2.9, 1, '2025-02-10 20:00:23', '2025-02-10 20:00:23'),
(141, 1, 121, NULL, NULL, NULL, NULL, 27.25, 18.7, 15.3, 19.4, 1, '2025-02-10 21:26:01', '2025-02-10 21:26:01'),
(142, 1, 122, NULL, NULL, NULL, NULL, 9.4, 16, 12.3, 6.9, 1, '2025-02-10 21:27:02', '2025-02-10 21:27:02'),
(143, 1, 123, NULL, NULL, NULL, NULL, 14.95, 28.2, 10.8, 8.4, 1, '2025-02-11 21:18:51', '2025-02-11 21:18:51'),
(144, 1, 124, NULL, NULL, NULL, NULL, 12.9, 15.7, 12.6, 9.9, 1, '2025-02-12 21:13:20', '2025-02-12 21:13:20'),
(145, 1, 125, NULL, NULL, NULL, NULL, 34.5, 27.4, 13.3, 18.6, 1, '2025-02-12 21:23:45', '2025-02-12 21:23:45'),
(146, 1, 126, NULL, NULL, NULL, NULL, 19.85, 21.3, 13.6, 10.2, 1, '2025-02-13 20:43:33', '2025-02-13 20:43:33'),
(147, 1, 127, NULL, NULL, NULL, NULL, 0.5, 11, 10.5, 2, 1, '2025-02-14 21:16:52', '2025-02-14 21:16:52'),
(148, 1, 128, NULL, NULL, NULL, NULL, 2.55, 14.1, 12.6, 6, 1, '2025-02-14 21:51:33', '2025-02-14 21:51:33'),
(151, 2, 129, 'cajas', '12345678', 50, NULL, 10, 22, 15.3, 7.6, 1, '2025-02-15 23:11:33', '2025-02-15 23:11:33'),
(152, 1, 130, NULL, NULL, NULL, NULL, 21.1, 19.8, 16.6, 9, 1, '2025-02-17 21:27:23', '2025-02-17 21:27:23'),
(153, 1, 131, NULL, NULL, NULL, NULL, 19.1, 18.2, 12.6, 16.3, 1, '2025-02-17 21:31:16', '2025-02-17 21:31:16'),
(154, 1, 132, NULL, NULL, NULL, NULL, 29.1, 21.2, 13.7, 13, 1, '2025-02-17 21:32:03', '2025-02-17 21:32:03'),
(155, 1, 133, NULL, NULL, NULL, NULL, 5.05, 15.8, 11, 8, 1, '2025-02-18 20:03:44', '2025-02-18 20:03:44'),
(156, 1, 134, NULL, NULL, NULL, NULL, 4.85, 10.6, 10.4, 8.7, 1, '2025-02-18 20:04:55', '2025-02-18 20:04:55'),
(157, 1, 135, NULL, NULL, NULL, NULL, 9.85, 20.4, 17.7, 6, 1, '2025-02-18 20:43:49', '2025-02-18 20:43:49'),
(158, 1, 136, NULL, NULL, NULL, NULL, 3, 14.4, 10.7, 5.9, 1, '2025-02-19 23:21:07', '2025-02-19 23:21:07'),
(159, 1, 137, NULL, NULL, NULL, NULL, 3, 14.4, 10.5, 5.9, 1, '2025-02-19 23:21:46', '2025-02-19 23:21:46'),
(161, 1, 139, NULL, NULL, NULL, NULL, 5.15, 17.2, 11.4, 11.2, 1, '2025-02-19 23:24:48', '2025-02-19 23:24:48'),
(162, 1, 140, NULL, NULL, NULL, NULL, 42.05, 28.4, 15.3, 17, 1, '2025-02-20 19:24:38', '2025-02-20 19:24:38'),
(163, 1, 141, NULL, NULL, NULL, NULL, 41.95, 28.4, 15.2, 17, 1, '2025-02-20 19:26:47', '2025-02-20 19:26:47'),
(164, 1, 142, NULL, NULL, NULL, NULL, 42, 28.2, 15.2, 17.1, 1, '2025-02-20 19:27:55', '2025-02-20 19:27:55'),
(165, 1, 143, NULL, NULL, NULL, NULL, 41.95, 28.3, 15.2, 17, 1, '2025-02-20 19:33:01', '2025-02-20 19:33:01'),
(166, 1, 144, NULL, NULL, NULL, NULL, 30.55, 24, 13.4, 14.3, 1, '2025-02-20 19:36:32', '2025-02-20 19:36:32'),
(167, 1, 145, NULL, NULL, NULL, NULL, 30.45, 24, 13.4, 14.4, 1, '2025-02-20 19:37:31', '2025-02-20 19:37:31'),
(168, 1, 146, NULL, NULL, NULL, NULL, 30.55, 24, 13.4, 14.3, 1, '2025-02-20 19:41:21', '2025-02-20 19:41:21'),
(169, 1, 147, NULL, NULL, NULL, NULL, 30.05, 24, 13.4, 14.4, 1, '2025-02-20 19:42:51', '2025-02-20 19:42:51'),
(170, 1, 148, NULL, NULL, NULL, NULL, 11.85, 14.4, 12.8, 8.1, 1, '2025-02-20 19:54:33', '2025-02-20 19:54:33'),
(171, 1, 149, NULL, NULL, NULL, NULL, 9.2, 16.7, 15, 10.5, 1, '2025-02-20 19:55:21', '2025-02-20 19:55:21'),
(172, 1, 150, NULL, NULL, NULL, NULL, 5.25, 12.1, 11.5, 7.2, 1, '2025-02-20 19:56:37', '2025-02-20 19:56:37'),
(173, 1, 151, NULL, NULL, NULL, NULL, 6.1, 16.3, 10.1, 11.9, 1, '2025-02-20 19:57:33', '2025-02-20 19:57:33'),
(174, 1, 152, NULL, NULL, NULL, NULL, 16.25, 14.2, 13.5, 9.8, 1, '2025-02-20 20:02:21', '2025-02-20 20:02:21'),
(175, 1, 153, NULL, NULL, NULL, NULL, 18.75, 14.5, 12.8, 8.1, 1, '2025-02-20 20:04:12', '2025-02-20 20:04:12'),
(176, 1, 154, NULL, NULL, NULL, NULL, 14.2, 18.3, 13.1, 14.2, 1, '2025-02-20 20:05:46', '2025-02-20 20:05:46'),
(177, 1, 155, NULL, NULL, NULL, NULL, 11.3, 21.8, 15.4, 10, 1, '2025-02-20 20:06:51', '2025-02-20 20:06:51'),
(178, 1, 156, NULL, NULL, NULL, NULL, 27.25, 16.5, 14.9, 10, 1, '2025-02-20 20:50:04', '2025-02-20 20:50:04'),
(179, 1, 157, NULL, NULL, NULL, NULL, 20.25, 15.5, 14.3, 14.9, 1, '2025-02-20 20:51:32', '2025-02-20 20:51:32'),
(181, 1, 159, NULL, NULL, NULL, NULL, 3.6, 40.9, 6.9, 2.5, 1, '2025-02-20 20:59:45', '2025-02-20 20:59:45'),
(182, 1, 160, NULL, NULL, NULL, NULL, 37.3, 22.7, 15.3, 10.5, 1, '2025-02-21 19:41:26', '2025-02-21 19:41:26'),
(183, 1, 161, NULL, NULL, NULL, NULL, 37.2, 23, 15.5, 10.2, 1, '2025-02-21 19:44:14', '2025-02-21 19:44:14'),
(184, 1, 162, NULL, NULL, NULL, NULL, 37.1, 22.9, 15.8, 10.2, 1, '2025-02-21 19:45:19', '2025-02-21 19:45:19'),
(185, 1, 163, NULL, NULL, NULL, NULL, 37.25, 22.7, 15.8, 10, 1, '2025-02-21 19:46:06', '2025-02-21 19:46:06'),
(186, 1, 164, NULL, NULL, NULL, NULL, 37.2, 22.7, 15.5, 10.6, 1, '2025-02-21 19:46:46', '2025-02-21 19:46:46'),
(187, 1, 165, NULL, NULL, NULL, NULL, 4.35, 16.7, 11.5, 8.2, 1, '2025-02-24 22:08:52', '2025-02-24 22:08:52'),
(188, 1, 166, NULL, NULL, NULL, NULL, 26.3, 22.1, 18.7, 7.1, 1, '2025-02-27 18:25:23', '2025-02-27 18:25:23'),
(189, 1, 167, NULL, NULL, NULL, NULL, 26.4, 22.1, 18.4, 7.2, 1, '2025-02-27 18:26:08', '2025-02-27 18:26:08'),
(190, 1, 168, NULL, NULL, NULL, NULL, 13.85, 21.9, 20.4, 6.8, 1, '2025-02-27 18:26:47', '2025-02-27 18:26:47'),
(191, 1, 169, NULL, NULL, NULL, NULL, 32.15, 25.8, 21.4, 17.3, 1, '2025-02-27 19:55:28', '2025-02-27 19:55:28'),
(192, 1, 170, NULL, NULL, NULL, NULL, 32.5, 25.9, 21.4, 17.2, 1, '2025-02-27 20:00:53', '2025-02-27 20:00:53'),
(193, 1, 171, NULL, NULL, NULL, NULL, 32.15, 26, 21.5, 16.9, 1, '2025-02-27 20:02:06', '2025-02-27 20:02:06'),
(194, 1, 172, NULL, NULL, NULL, NULL, 32.3, 26.1, 21.6, 16.9, 1, '2025-02-27 20:03:08', '2025-02-27 20:03:08'),
(195, 1, 173, NULL, NULL, NULL, NULL, 32.2, 25.7, 21.6, 16.9, 1, '2025-02-27 20:04:55', '2025-02-27 20:04:55'),
(196, 1, 174, NULL, NULL, NULL, NULL, 32.25, 25.9, 21.6, 17.1, 1, '2025-02-27 20:06:06', '2025-02-27 20:06:06'),
(197, 1, 175, NULL, NULL, NULL, NULL, 32.1, 26, 21.4, 17, 1, '2025-02-27 20:07:10', '2025-02-27 20:07:10'),
(198, 1, 176, NULL, NULL, NULL, NULL, 32.35, 25.9, 21.6, 17.2, 1, '2025-02-27 20:08:22', '2025-02-27 20:08:22'),
(199, 1, 177, NULL, NULL, NULL, NULL, 32.45, 25.9, 21.5, 17.2, 1, '2025-02-27 20:09:43', '2025-02-27 20:09:43'),
(200, 1, 178, NULL, NULL, NULL, NULL, 32.45, 25.9, 21.6, 17, 1, '2025-02-27 20:10:53', '2025-02-27 20:10:53'),
(201, 1, 179, NULL, NULL, NULL, NULL, 32.45, 25.9, 21.4, 17.3, 1, '2025-02-27 20:13:53', '2025-02-27 20:13:53'),
(202, 1, 180, NULL, NULL, NULL, NULL, 32.05, 25.9, 21.6, 16.9, 1, '2025-02-27 20:15:11', '2025-02-27 20:15:11'),
(203, 1, 181, NULL, NULL, NULL, NULL, 15.6, 23.1, 17.1, 9.8, 1, '2025-02-27 20:16:28', '2025-02-27 20:16:28'),
(204, 1, 182, NULL, NULL, NULL, NULL, 34.4, 23.5, 20.4, 18, 1, '2025-02-27 20:18:39', '2025-02-27 20:18:39'),
(205, 1, 183, NULL, NULL, NULL, NULL, 27.25, 19.1, 19.1, 15.2, 1, '2025-02-27 20:23:14', '2025-02-27 20:23:14'),
(206, 1, 184, NULL, NULL, NULL, NULL, 27.25, 19.1, 19.1, 15.2, 1, '2025-02-27 20:24:55', '2025-02-27 20:24:55'),
(207, 1, 185, NULL, NULL, NULL, NULL, 2, 29.9, 7.4, 6.1, 1, '2025-02-27 22:07:39', '2025-02-27 22:07:39'),
(208, 1, 186, NULL, NULL, NULL, NULL, 13.75, 17.8, 14.3, 10.4, 1, '2025-02-27 22:08:18', '2025-02-27 22:08:18'),
(209, 1, 187, NULL, NULL, NULL, NULL, 1.8, 14.2, 8.6, 6, 1, '2025-02-28 22:01:17', '2025-02-28 22:01:17'),
(210, 1, 188, NULL, NULL, NULL, NULL, 6.9, 13.6, 10.2, 6.9, 1, '2025-02-28 22:51:13', '2025-02-28 22:51:13'),
(211, 1, 189, NULL, NULL, NULL, NULL, 22.05, 17.9, 16.3, 12.3, 1, '2025-02-28 22:51:54', '2025-02-28 22:51:54'),
(213, 2, 191, 'accessories', '554554554', 1000, NULL, 4, 4, 4, 4, 2, '2025-03-01 05:32:01', '2025-03-01 05:32:01'),
(214, 2, 138, NULL, NULL, NULL, NULL, 21.7, 23.8, 17.6, 11.3, 1, '2025-03-02 19:37:01', '2025-03-02 19:37:01'),
(217, 1, 193, NULL, NULL, NULL, NULL, 0.3, 7.5, 7, 19.5, 1, '2025-03-03 02:16:21', '2025-03-03 02:16:21'),
(219, 2, 158, NULL, NULL, NULL, NULL, 5.8, 11.2, 8.5, 6, 1, '2025-03-03 05:48:28', '2025-03-03 05:48:28'),
(225, 2, 194, 'caja', NULL, 23, NULL, 0.3, 7.5, 7, 19.5, 1, '2025-03-03 15:38:17', '2025-03-03 15:38:17'),
(229, 2, 196, 'caja', '9876543ert76', 100, NULL, 3, 4, 5, 3, 1, '2025-03-03 20:12:13', '2025-03-03 20:12:13'),
(230, 3, 197, 'sofa', NULL, 500, NULL, 43, 23, 23, 23, 1, '2025-03-03 20:32:27', '2025-03-03 20:32:27'),
(231, 3, 198, 'sofa', NULL, 500, NULL, 43, 23, 32, 32, 1, '2025-03-03 20:34:41', '2025-03-03 20:34:41'),
(236, 2, 200, 'caja', NULL, 30, NULL, 49.5, 23.8, 13.4, 9.3, 1, '2025-03-03 22:40:40', '2025-03-03 22:40:40'),
(237, 3, 202, 'caja', NULL, 400, NULL, 22.8, 13.5, 12.6, 9.3, 1, '2025-03-03 22:41:49', '2025-03-03 22:41:49'),
(238, 3, 201, 'bcss', NULL, 40, NULL, 42.9, 25.2, 17.6, 13.1, 1, '2025-03-03 22:42:47', '2025-03-03 22:42:47'),
(240, 2, 199, '1', NULL, 40, NULL, 29.8, 25.7, 20.6, 8.8, 1, '2025-03-03 22:45:00', '2025-03-03 22:45:00'),
(242, 2, 203, 'caja test', NULL, 40, NULL, 16.95, 32.2, 22.5, 7.5, 1, '2025-03-03 22:59:19', '2025-03-03 22:59:19'),
(243, 2, 195, 'general cargo', NULL, 10, NULL, 6.9, 13.6, 10.2, 7, 1, '2025-03-03 23:55:12', '2025-03-03 23:55:12'),
(244, 2, 190, 'general cargo', NULL, 50, NULL, 19.25, 22, 16.2, 8.7, 1, '2025-03-04 00:00:57', '2025-03-04 00:00:57'),
(245, 2, 204, 'general cargo', '456456456', 10, NULL, 5, 4, 5, 6, 1, '2025-03-04 00:11:44', '2025-03-04 00:11:44'),
(246, 2, 204, 'general cargo', '654654654', 5, NULL, 4, 4, 5, 6, 1, '2025-03-04 00:11:44', '2025-03-04 00:11:44'),
(248, 2, 205, 'general cargo', '878787', 10, NULL, 5, 12, 12, 12, 1, '2025-03-04 00:37:44', '2025-03-04 00:37:44'),
(249, 1, 206, NULL, NULL, NULL, NULL, 3.45, 16.4, 15.8, 6.6, 1, '2025-03-04 20:32:19', '2025-03-04 20:32:19'),
(250, 1, 207, NULL, NULL, NULL, NULL, 34.4, 38.9, 18.2, 3.4, 1, '2025-03-04 20:42:16', '2025-03-04 20:42:16'),
(251, 1, 208, NULL, NULL, NULL, NULL, 9.35, 12.9, 11.3, 3.4, 1, '2025-03-04 21:04:59', '2025-03-04 21:04:59'),
(252, 1, 209, NULL, NULL, NULL, NULL, 17.9, 17.9, 14.3, 10.4, 1, '2025-03-04 21:05:38', '2025-03-04 21:05:38'),
(253, 1, 210, NULL, NULL, NULL, NULL, 7.55, 32.5, 22.3, 3.1, 1, '2025-03-04 21:06:56', '2025-03-04 21:06:56'),
(254, 1, 211, NULL, NULL, NULL, NULL, 3.1, 9.9, 7.7, 4.6, 1, '2025-03-05 21:33:08', '2025-03-05 21:33:08'),
(255, 1, 212, NULL, NULL, NULL, NULL, 1.25, 10.5, 9.4, 2, 1, '2025-03-05 22:02:49', '2025-03-05 22:02:49'),
(256, 1, 213, NULL, NULL, NULL, NULL, 26.55, 21.9, 18.4, 12.2, 1, '2025-03-06 19:18:20', '2025-03-06 19:18:20'),
(257, 1, 214, NULL, NULL, NULL, NULL, 31.35, 21.9, 18.6, 10.3, 1, '2025-03-06 21:00:04', '2025-03-06 21:00:04'),
(258, 1, 215, NULL, NULL, NULL, NULL, 31.35, 21.7, 18.6, 10.6, 1, '2025-03-06 21:01:32', '2025-03-06 21:01:32'),
(259, 1, 216, NULL, NULL, NULL, NULL, 39.4, 23.4, 20.4, 18.1, 1, '2025-03-06 21:10:59', '2025-03-06 21:10:59'),
(260, 1, 217, NULL, NULL, NULL, NULL, 23.2, 35.6, 24.3, 10.6, 1, '2025-03-06 21:42:18', '2025-03-06 21:42:18'),
(261, 1, 218, NULL, NULL, NULL, NULL, 18.9, 31.1, 18.8, 6.6, 1, '2025-03-06 22:46:45', '2025-03-06 22:46:45'),
(262, 1, 219, NULL, NULL, NULL, NULL, 24, 31.1, 18.8, 6.7, 1, '2025-03-06 23:09:16', '2025-03-06 23:09:16'),
(263, 1, 220, NULL, NULL, NULL, NULL, 28.3, 35.6, 24.7, 10.2, 1, '2025-03-06 23:21:03', '2025-03-06 23:21:03'),
(264, 1, 221, NULL, NULL, NULL, NULL, 8, 19.3, 16.7, 8.1, 1, '2025-03-07 19:59:17', '2025-03-07 19:59:17'),
(265, 1, 222, NULL, NULL, NULL, NULL, 5.95, 21.6, 15.5, 4.9, 1, '2025-03-07 19:59:53', '2025-03-07 19:59:53'),
(266, 1, 223, NULL, NULL, NULL, NULL, 32.55, 22, 16.4, 13.6, 1, '2025-03-07 21:42:05', '2025-03-07 21:42:05'),
(268, 2, 225, 'GENERAL CARGO', 'test1234', 10, NULL, 4, 6, 6, 6, 1, '2025-03-08 19:29:14', '2025-03-08 19:29:14'),
(269, 2, 224, 'cja', NULL, 22, NULL, 33.8, 27.8, 13.6, 18.2, 1, '2025-03-10 02:01:09', '2025-03-10 02:01:09'),
(271, 2, 226, 'ELECTRONICS', 'test1234', 100, NULL, 5, 4, 4, 4, 1, '2025-03-10 14:13:53', '2025-03-10 14:13:53'),
(272, 1, 227, NULL, NULL, NULL, NULL, 1.75, 11.5, 9.3, 5.6, 1, '2025-03-10 19:46:59', '2025-03-10 19:46:59'),
(273, 1, 228, NULL, NULL, NULL, NULL, 3.1, 10.2, 7.2, 5.9, 1, '2025-03-10 19:47:48', '2025-03-10 19:47:48'),
(274, 1, 229, NULL, NULL, NULL, NULL, 25.5, 16.5, 14.1, 22.5, 1, '2025-03-10 20:09:30', '2025-03-10 20:09:30'),
(275, 1, 230, NULL, NULL, NULL, NULL, 26, 16.4, 14.4, 22.4, 1, '2025-03-10 20:10:19', '2025-03-10 20:10:19');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('jcarlosfv3@gmail.com', '$2y$12$5hVk7Cn8reLxS0qrEKVgv.83iVkIoAhiTFBHT7HnZhzwU9xtmrxjG', '2025-01-01 16:20:07');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` int(11) NOT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `payment_details` text DEFAULT NULL,
  `payment_method` text DEFAULT NULL,
  `txn_code` text DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `seller_id`, `shipment_id`, `amount`, `payment_details`, `payment_method`, `txn_code`, `payment_date`, `created_at`, `updated_at`) VALUES
(1, 1, 13, 7, NULL, 'cash_payment', NULL, '2024-12-21 03:26:00', '2024-12-21 14:26:43', '2024-12-21 14:26:43'),
(2, 1, 6, 45, NULL, 'cash_payment', NULL, '2024-12-22 11:46:00', '2024-12-22 22:46:50', '2024-12-22 22:46:50'),
(3, 11, 49, 15.1, NULL, 'cash_payment', NULL, '2025-01-12 08:13:00', '2025-01-12 15:13:49', '2025-01-12 15:13:49');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'web', '2024-12-22 20:35:44', '2024-12-22 20:35:44'),
(2, 'settings', 'web', '2024-12-22 20:35:44', '2024-12-22 20:35:44'),
(3, 'users', 'web', '2024-12-22 20:35:44', '2024-12-22 20:35:44'),
(4, 'customers', 'web', '2024-12-22 20:35:44', '2024-12-22 20:35:44'),
(5, 'shipments', 'web', '2024-12-22 20:35:44', '2024-12-22 20:35:44'),
(6, 'branches', 'web', '2024-12-22 20:35:44', '2024-12-22 20:35:44'),
(7, 'payments', 'web', '2024-12-22 20:35:44', '2024-12-22 20:35:44'),
(8, 'client', 'web', '2025-01-03 07:43:40', '2025-01-03 07:43:45');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'android_app', '1cf4eeac13b0eacafcb0a299bf35cead44cccdff74e470e3da847f3ee27469dd', '[\"*\"]', '2025-01-30 06:36:28', NULL, '2025-01-30 06:36:15', '2025-01-30 06:36:28'),
(2, 'App\\Models\\User', 1, 'android_app', 'd465e897b7784f833c6d36220d84d6f466fd8c1a0ee8a057a2deabdd0aa48920', '[\"*\"]', NULL, NULL, '2025-01-30 06:53:59', '2025-01-30 06:53:59'),
(3, 'App\\Models\\User', 1, 'android_app', '8e348a5d38499876952982960f7b14e22e702ecb78bf6d0a33a588485a715959', '[\"*\"]', NULL, NULL, '2025-01-30 06:59:08', '2025-01-30 06:59:08'),
(4, 'App\\Models\\User', 1, 'android_app', 'b741a6498bfda633e20a6b21fb7e291abbb94a284737a00f0e51d3264d3dd517', '[\"*\"]', NULL, NULL, '2025-01-30 07:12:06', '2025-01-30 07:12:06'),
(5, 'App\\Models\\User', 1, 'android_app', 'bea4b37ab0f89eb5471e76e412ff740f813fce53b0fd3a4060f5fd4f20e3f420', '[\"*\"]', '2025-01-30 07:13:18', NULL, '2025-01-30 07:13:13', '2025-01-30 07:13:18'),
(6, 'App\\Models\\User', 1, 'android_app', '574d52f88ed1314c425ae0ecf04483cda9c56c803287e6cee3b1cff4495499df', '[\"*\"]', '2025-01-30 07:14:31', NULL, '2025-01-30 07:14:25', '2025-01-30 07:14:31'),
(7, 'App\\Models\\User', 1, 'android_app', 'bdf8cf7e9b087670cf6120a3e50eb3cbbb7f8b576a68fd5201b33560e598d6be', '[\"*\"]', '2025-01-30 07:15:39', NULL, '2025-01-30 07:15:33', '2025-01-30 07:15:39'),
(8, 'App\\Models\\User', 1, 'android_app', 'eca7c4cf90508f405eb77376d8bf737b69f3686c2241928b960dab7694ab7c90', '[\"*\"]', NULL, NULL, '2025-01-30 07:17:30', '2025-01-30 07:17:30'),
(9, 'App\\Models\\User', 1, 'android_app', '3d9743365d3635ea6b822be192cb4ed480fb4d8cd602b7eb069c224b78a8539e', '[\"*\"]', '2025-01-30 07:18:45', NULL, '2025-01-30 07:18:39', '2025-01-30 07:18:45'),
(10, 'App\\Models\\User', 1, 'android_app', 'e3fa37665dccab2d63a564c0fb5c0f472f1ba766dd28430053bbb8bc28f2010d', '[\"*\"]', NULL, NULL, '2025-01-30 07:37:27', '2025-01-30 07:37:27'),
(11, 'App\\Models\\User', 1, 'android_app', '56b2007d2e7b0f3a9a2355220008403f710c208fdadc0f1250bbb1ca22e343f4', '[\"*\"]', '2025-01-30 07:44:05', NULL, '2025-01-30 07:44:01', '2025-01-30 07:44:05'),
(12, 'App\\Models\\User', 1, 'android_app', 'fab319577a579ab0b58f54a0337618821c5219178fd63fcd8d514a36b683acd8', '[\"*\"]', '2025-01-30 07:49:33', NULL, '2025-01-30 07:48:49', '2025-01-30 07:49:33'),
(13, 'App\\Models\\User', 10, 'android_app', '058bb329cd40dad99dffbaa32d264e8b6c07051cf3c2ae06d9849439061e66f7', '[\"*\"]', '2025-01-30 22:00:27', NULL, '2025-01-30 21:39:42', '2025-01-30 22:00:27'),
(14, 'App\\Models\\User', 10, 'android_app', 'fa2e9c46ba7f0a725af5c1e60a6a8a5bd93806d8f88fe314e7e4bc297abdf1d6', '[\"*\"]', '2025-01-30 22:03:31', NULL, '2025-01-30 21:59:31', '2025-01-30 22:03:31'),
(15, 'App\\Models\\User', 10, 'android_app', '1b2f94cc03a6f95d3af251653137873c5f4f152fafe85a7ed6ad37baa014b3f6', '[\"*\"]', '2025-01-30 22:33:52', NULL, '2025-01-30 22:33:23', '2025-01-30 22:33:52'),
(16, 'App\\Models\\User', 1, 'android_app', '16780e21a74df76f5e506de8668c6c4f853cc48189b01fe2150104e9ebf47dbe', '[\"*\"]', NULL, NULL, '2025-01-30 22:33:57', '2025-01-30 22:33:57'),
(17, 'App\\Models\\User', 10, 'android_app', 'd7bf2a8223c00d1ca78ab8f5cdda01b5cfc71b03ed0681a5edb42d90738d633e', '[\"*\"]', '2025-01-31 01:02:09', NULL, '2025-01-31 01:02:03', '2025-01-31 01:02:09'),
(18, 'App\\Models\\User', 1, 'android_app', '09e537820f1c040665a9178b4ef23dc7e8c9f0796af05a4b9aa7df8e1ba0be80', '[\"*\"]', '2025-01-31 01:30:52', NULL, '2025-01-31 01:27:08', '2025-01-31 01:30:52'),
(19, 'App\\Models\\User', 1, 'android_app', '878a533bb1442eb61d6728c7f03c33e9d9a8eae9141994d7e72b89ad39e8d091', '[\"*\"]', '2025-01-31 02:13:39', NULL, '2025-01-31 01:57:16', '2025-01-31 02:13:39'),
(20, 'App\\Models\\User', 1, 'android_app', '287bf4e82441755830ea6966faf50792e5e6b42849dffa30e4d15475e3071cb4', '[\"*\"]', '2025-01-31 02:24:14', NULL, '2025-01-31 02:14:47', '2025-01-31 02:24:14'),
(21, 'App\\Models\\User', 1, 'android_app', 'e2682828f16db5a1a33ff5ae5bc6c271adfcd35e8d2091065cd2fdafe441b063', '[\"*\"]', '2025-01-31 02:25:41', NULL, '2025-01-31 02:25:08', '2025-01-31 02:25:41'),
(22, 'App\\Models\\User', 1, 'android_app', 'd1a17aa0b42f8051e48c0d4534c35a2a3af331e35511a2c018bf5bfa19572879', '[\"*\"]', '2025-01-31 02:29:09', NULL, '2025-01-31 02:29:06', '2025-01-31 02:29:09'),
(23, 'App\\Models\\User', 1, 'android_app', '4b34d594c4675be05479bf6b3d79e754eb8ac4485d43ec0be48f6344caa5fdec', '[\"*\"]', '2025-01-31 02:36:49', NULL, '2025-01-31 02:36:25', '2025-01-31 02:36:49'),
(24, 'App\\Models\\User', 1, 'android_app', '1e2612b2f53c0ed81a4d642213915e91465901cf31373eed2b09ca8fc89d941d', '[\"*\"]', '2025-01-31 02:42:57', NULL, '2025-01-31 02:42:13', '2025-01-31 02:42:57'),
(25, 'App\\Models\\User', 10, 'android_app', 'f019d889e6d3bf2f8c7d3608d9e1c7a95a8da354720347a8d833974b46a40b76', '[\"*\"]', NULL, NULL, '2025-01-31 02:49:55', '2025-01-31 02:49:55'),
(26, 'App\\Models\\User', 1, 'android_app', '2b088f99ad13fc2d6a7761731784b1b0f92f910a9880f494d64e13bbd7acd84e', '[\"*\"]', '2025-01-31 02:55:08', NULL, '2025-01-31 02:51:41', '2025-01-31 02:55:08'),
(27, 'App\\Models\\User', 10, 'android_app', 'ea4de040adfe3c4c1a3e7e0ba6b17e0077acd0dc33dc765750577b4d5a5c1899', '[\"*\"]', '2025-01-31 03:16:39', NULL, '2025-01-31 03:15:47', '2025-01-31 03:16:39'),
(28, 'App\\Models\\User', 1, 'android_app', 'e9ac4d45720626288e7623240a9f810021c42f2405deb1c1616e1955e6583bee', '[\"*\"]', '2025-01-31 03:29:40', NULL, '2025-01-31 03:29:08', '2025-01-31 03:29:40'),
(29, 'App\\Models\\User', 1, 'android_app', 'a93a567c9545a00d06417c1ea96a359b862ff2c3b3ec8c36c2d405f9ef45cef5', '[\"*\"]', '2025-01-31 03:44:12', NULL, '2025-01-31 03:42:31', '2025-01-31 03:44:12'),
(30, 'App\\Models\\User', 10, 'android_app', 'fd75e5f50cff457f297671aec2cc2059f76b6aa62a05d5dadec61088f55cdaaf', '[\"*\"]', '2025-01-31 04:39:00', NULL, '2025-01-31 04:38:31', '2025-01-31 04:39:00'),
(31, 'App\\Models\\User', 10, 'android_app', '762cabb20b38a588ba3912092d3970393cb2190436582aeacdb1042ef78f63ca', '[\"*\"]', '2025-01-31 05:24:05', NULL, '2025-01-31 05:02:27', '2025-01-31 05:24:05'),
(32, 'App\\Models\\User', 10, 'android_app', '86d79661fba31f78500ed68b3f4826b4e7b6b8831f9a25a6b9fe4ee5671934f2', '[\"*\"]', '2025-01-31 06:04:39', NULL, '2025-01-31 06:03:40', '2025-01-31 06:04:39'),
(33, 'App\\Models\\User', 10, 'android_app', 'a9632a8f167c051dc9c841574d06d2301741a43ac3c27d9d7049615ffcb78fce', '[\"*\"]', '2025-01-31 06:10:31', NULL, '2025-01-31 06:10:09', '2025-01-31 06:10:31'),
(34, 'App\\Models\\User', 10, 'android_app', '8d4abda0f64b6c3935570c0797f32639b2ec315544132f3c19e73c03d9a7033c', '[\"*\"]', '2025-01-31 06:35:15', NULL, '2025-01-31 06:30:48', '2025-01-31 06:35:15'),
(35, 'App\\Models\\User', 10, 'android_app', '3d2fb5fc870105437e560b450b2c3654f6566bb9a233f6efea320819fb383b3b', '[\"*\"]', '2025-01-31 06:52:29', NULL, '2025-01-31 06:52:26', '2025-01-31 06:52:29'),
(36, 'App\\Models\\User', 10, 'android_app', 'be66bba8fb8aed6b877c0a60c85438d750f14774147a01b3f28314356f60fc8b', '[\"*\"]', '2025-01-31 07:02:41', NULL, '2025-01-31 07:01:56', '2025-01-31 07:02:41'),
(37, 'App\\Models\\User', 1, 'android_app', 'a518604c47f8148d70e73855e62b0e11dfe5e391d8d6bc070cf339778f7849d1', '[\"*\"]', '2025-01-31 20:02:02', NULL, '2025-01-31 20:01:26', '2025-01-31 20:02:02'),
(38, 'App\\Models\\User', 1, 'android_app', 'c7466068c416d3280c8b7a76c8df7a53943fd9c6d6d646cb10835452f5a285b7', '[\"*\"]', NULL, NULL, '2025-02-01 00:41:57', '2025-02-01 00:41:57'),
(39, 'App\\Models\\User', 1, 'android_app', 'df2c40c2553f5dec6ce16e302d9db58b0b91c1ba8278cf85bcc6f72f3387abb1', '[\"*\"]', '2025-02-01 00:42:09', NULL, '2025-02-01 00:41:57', '2025-02-01 00:42:09'),
(41, 'App\\Models\\User', 1, 'android_app', 'ef961bc482c8707a018b3e27324aa6d28bf499826635f0636395dec97087573a', '[\"*\"]', NULL, NULL, '2025-02-01 00:47:46', '2025-02-01 00:47:46'),
(42, 'App\\Models\\User', 1, 'android_app', '3c6c144d829029f41daae18c793432ff21f4c4c5afb711156aad88bb8e1d0a7b', '[\"*\"]', '2025-02-01 00:53:14', NULL, '2025-02-01 00:53:10', '2025-02-01 00:53:14'),
(43, 'App\\Models\\User', 1, 'android_app', '5e6fe80e249161045bfd5327811c10f9947dc87738cf0cfcbea4a4180aeeec15', '[\"*\"]', '2025-02-01 00:59:25', NULL, '2025-02-01 00:59:20', '2025-02-01 00:59:25'),
(44, 'App\\Models\\User', 1, 'android_app', '1915e8a7ab096da16e9bea0522d39d837f69f5a9dbe904b0fcc9ace7b661e2db', '[\"*\"]', '2025-02-01 01:18:40', NULL, '2025-02-01 01:18:35', '2025-02-01 01:18:40'),
(45, 'App\\Models\\User', 1, 'android_app', '6aa28a475f86f026a80cb0cfe413fc84ee73832decd68b0fbcf899ab1eafa2f7', '[\"*\"]', '2025-02-01 01:33:00', NULL, '2025-02-01 01:32:55', '2025-02-01 01:33:00'),
(46, 'App\\Models\\User', 1, 'android_app', 'b065f0d5c0cd38912b17227ed88b49057bf0126eec442527dce3c136b2a175a0', '[\"*\"]', '2025-02-01 02:41:46', NULL, '2025-02-01 01:39:59', '2025-02-01 02:41:46'),
(47, 'App\\Models\\User', 1, 'android_app', '35020ebde56bdaf0b3ff1576424c12e561c017acec3f420f8f71c4de14b11e25', '[\"*\"]', '2025-02-01 02:17:45', NULL, '2025-02-01 01:50:05', '2025-02-01 02:17:45'),
(48, 'App\\Models\\User', 1, 'android_app', '860c39927a6327290090733b590c6d096b338052d45844bf57c484a0c0edcc28', '[\"*\"]', '2025-02-01 02:31:47', NULL, '2025-02-01 02:18:07', '2025-02-01 02:31:47'),
(49, 'App\\Models\\User', 1, 'android_app', 'cc0b20c058140cf5b701a8d3ced1eaac881203fce0109dd16e0bbf9e12538936', '[\"*\"]', '2025-02-01 02:58:23', NULL, '2025-02-01 02:31:54', '2025-02-01 02:58:23'),
(50, 'App\\Models\\User', 1, 'android_app', 'e069324b2f119572a5f040f8c092896124065d763691f044c082b319a9e7d0b9', '[\"*\"]', '2025-02-01 05:27:36', NULL, '2025-02-01 03:40:33', '2025-02-01 05:27:36'),
(51, 'App\\Models\\User', 1, 'android_app', 'f93694920f1610769dee7b7b4049cfdfcf0f97cb864378eccfc2de7e0950cccf', '[\"*\"]', '2025-02-01 03:43:47', NULL, '2025-02-01 03:43:42', '2025-02-01 03:43:47'),
(52, 'App\\Models\\User', 1, 'android_app', '3cf20a7af1814300dd708ca21e263ddd682de652ac335e3395a9a4734652e32c', '[\"*\"]', '2025-02-01 04:05:16', NULL, '2025-02-01 04:03:10', '2025-02-01 04:05:16'),
(53, 'App\\Models\\User', 1, 'android_app', '5152e883e05bc0b8710ed33fcdbe3fba22019ebdc5818b678799088f209b8461', '[\"*\"]', '2025-02-01 04:33:34', NULL, '2025-02-01 04:31:31', '2025-02-01 04:33:34'),
(54, 'App\\Models\\User', 1, 'android_app', 'f242cb9ae70998ec42e911b761e074c238632de3f8cad87799622f8404497463', '[\"*\"]', '2025-02-01 05:11:46', NULL, '2025-02-01 05:10:10', '2025-02-01 05:11:46'),
(55, 'App\\Models\\User', 1, 'android_app', '968c86b663523a0a614b108ee321a0e830abe225866a4f9f62ac1b1ab40ab129', '[\"*\"]', '2025-02-01 05:17:26', NULL, '2025-02-01 05:16:24', '2025-02-01 05:17:26'),
(56, 'App\\Models\\User', 1, 'android_app', '62a66ee6653e12bf7a379e97a3aa64eabbbc678a4c42c5c0c8df204b00bf4228', '[\"*\"]', '2025-02-01 05:18:31', NULL, '2025-02-01 05:18:00', '2025-02-01 05:18:31'),
(57, 'App\\Models\\User', 1, 'android_app', 'd9a083add861c9f50aa90df638ebaa7c5bc120cddbdb74762a1c0003359db43c', '[\"*\"]', '2025-02-01 05:20:20', NULL, '2025-02-01 05:19:54', '2025-02-01 05:20:20'),
(58, 'App\\Models\\User', 1, 'android_app', '688aadbce98a79b320ccbe05c2d8665e675afe34eb96e79e80859844ff7dca6f', '[\"*\"]', '2025-02-01 05:25:36', NULL, '2025-02-01 05:24:47', '2025-02-01 05:25:36'),
(59, 'App\\Models\\User', 1, 'android_app', '36d14770b0a38ed12c16d264de93cbfea041809cbeaf86d784d2c689a51fb897', '[\"*\"]', '2025-02-01 05:47:08', NULL, '2025-02-01 05:26:22', '2025-02-01 05:47:08'),
(60, 'App\\Models\\User', 1, 'android_app', 'e516ab663b1db7831cea59f56f122818839550b22255b09cb3b23f1d2cc9fb2e', '[\"*\"]', '2025-02-01 06:11:16', NULL, '2025-02-01 06:10:28', '2025-02-01 06:11:16'),
(61, 'App\\Models\\User', 1, 'android_app', '807ef98d06f64790fbbb014a6e2fb4b8ce4bbe72e812162c5d26c9e40a1eda77', '[\"*\"]', '2025-02-01 06:44:00', NULL, '2025-02-01 06:43:36', '2025-02-01 06:44:00'),
(62, 'App\\Models\\User', 1, 'android_app', 'dc5fbe596d401e9b9f64fe98ce65511a5348f1b6c4b43cf7a7dd4c27acb01bc4', '[\"*\"]', '2025-02-01 06:51:43', NULL, '2025-02-01 06:51:26', '2025-02-01 06:51:43'),
(63, 'App\\Models\\User', 1, 'android_app', 'd7417a5066663901aa4f61c184467140c64eee194a165cb5924622d17a02645b', '[\"*\"]', '2025-02-01 06:55:12', NULL, '2025-02-01 06:54:30', '2025-02-01 06:55:12'),
(64, 'App\\Models\\User', 1, 'android_app', '23170c5c52c7459f5aa002b2001f266b77a6afddc01e9a2616aad233f528413d', '[\"*\"]', '2025-02-01 07:18:10', NULL, '2025-02-01 07:15:52', '2025-02-01 07:18:10'),
(65, 'App\\Models\\User', 1, 'android_app', 'df3a9527b4acc01b33a57a1d8333852320f0d2d9dbb23e7a0aa9bb90a874921f', '[\"*\"]', NULL, NULL, '2025-02-01 22:01:14', '2025-02-01 22:01:14'),
(66, 'App\\Models\\User', 1, 'android_app', '1819440c7725fd67a168fb1b8c2f951bb81cd61acc1af593a6e8249c12bee433', '[\"*\"]', NULL, NULL, '2025-02-01 22:02:47', '2025-02-01 22:02:47'),
(67, 'App\\Models\\User', 1, 'android_app', '6f33560853d4dbcc071e8b5d596e75a6e789d39990e76f990f9f74bae08bd231', '[\"*\"]', '2025-02-01 22:05:29', NULL, '2025-02-01 22:04:02', '2025-02-01 22:05:29'),
(68, 'App\\Models\\User', 1, 'android_app', '4da83b0d7652b47f124e7277be015cc63fa69deb72cf5f33c0cf5ea02e943549', '[\"*\"]', '2025-02-01 22:14:18', NULL, '2025-02-01 22:14:15', '2025-02-01 22:14:18'),
(69, 'App\\Models\\User', 1, 'android_app', 'fd05bc4c5774e31298afa06844dd810b75bd823eefc53bf0dc9c1a7423e1edcd', '[\"*\"]', NULL, NULL, '2025-02-01 22:19:02', '2025-02-01 22:19:02'),
(70, 'App\\Models\\User', 1, 'android_app', '795ebe1adfa43fbd3bdcc222daaba70f69e30f4540bce6fadbe4f90579a3cdc7', '[\"*\"]', '2025-02-01 22:43:12', NULL, '2025-02-01 22:42:57', '2025-02-01 22:43:12'),
(71, 'App\\Models\\User', 1, 'android_app', '495d8d901a9bfcf3ad49b172c4b57290b631a39763af9cd4a4060251ed954fbe', '[\"*\"]', '2025-02-01 22:51:08', NULL, '2025-02-01 22:44:24', '2025-02-01 22:51:08'),
(72, 'App\\Models\\User', 1, 'android_app', '766c4e7ae32cd69fee08fd724d8e7665242795bad0a12cf12671f965b2263dda', '[\"*\"]', '2025-02-01 23:08:23', NULL, '2025-02-01 23:07:58', '2025-02-01 23:08:23'),
(73, 'App\\Models\\User', 1, 'android_app', '2a06348df1a5044b94090dc5fa156de62ac34904d06d66d87b5fb7648e2aaff6', '[\"*\"]', '2025-02-01 23:16:24', NULL, '2025-02-01 23:15:07', '2025-02-01 23:16:24'),
(74, 'App\\Models\\User', 1, 'android_app', '1eab1dddf2ae3be6b4fca9890249a1d9d38635ef0726ef127639753503463d16', '[\"*\"]', '2025-02-01 23:29:01', NULL, '2025-02-01 23:28:50', '2025-02-01 23:29:01'),
(75, 'App\\Models\\User', 1, 'android_app', '4d9986314c330f8b8ac62b3051777eaba470e90137f8e3c80aa8e6b9ec12f6eb', '[\"*\"]', '2025-02-01 23:31:06', NULL, '2025-02-01 23:30:56', '2025-02-01 23:31:06'),
(76, 'App\\Models\\User', 1, 'android_app', 'b2b48162ff6e7c7be082deb9b7d4e1fa2f3621f297dbdd237a27ab300b6db422', '[\"*\"]', '2025-02-01 23:33:18', NULL, '2025-02-01 23:33:08', '2025-02-01 23:33:18'),
(77, 'App\\Models\\User', 1, 'android_app', '6af47c5e38015902bb0a1e96c81d15f25253648caff925c6e9440f892c5dc886', '[\"*\"]', '2025-02-01 23:40:12', NULL, '2025-02-01 23:39:43', '2025-02-01 23:40:12'),
(78, 'App\\Models\\User', 1, 'android_app', 'ff7aef70d7d9fd9678b4f45c2bed997b18c1bc62883f4b309d17065423dd915e', '[\"*\"]', '2025-02-01 23:54:11', NULL, '2025-02-01 23:54:08', '2025-02-01 23:54:11'),
(79, 'App\\Models\\User', 1, 'android_app', '7c352542ae76c5f00866e97ed5f909f78369d1bdbdbb44be371e3212f6112996', '[\"*\"]', '2025-02-01 23:58:25', NULL, '2025-02-01 23:58:15', '2025-02-01 23:58:25'),
(80, 'App\\Models\\User', 1, 'android_app', '9cbba3c98c8176ce2b5a7192a30e5e5adfc1cf858f17661638023df03320d4fe', '[\"*\"]', '2025-02-02 00:02:41', NULL, '2025-02-02 00:02:37', '2025-02-02 00:02:41'),
(81, 'App\\Models\\User', 1, 'android_app', '8f9dea5b5feae9c6134feab16ab373db48e2eb563451a8b7478a16ea3dbbd744', '[\"*\"]', '2025-02-02 00:04:01', NULL, '2025-02-02 00:03:55', '2025-02-02 00:04:01'),
(82, 'App\\Models\\User', 1, 'android_app', '8389f9e032376bc229e7c3ad7e9ddacbbe13e2169dfe182142483c68fc5cb808', '[\"*\"]', '2025-02-02 00:07:18', NULL, '2025-02-02 00:07:09', '2025-02-02 00:07:18'),
(83, 'App\\Models\\User', 1, 'android_app', '5103b4161e30e5a1f14ed31440ebce456d41ff205a469b0c73868d7e01ba4dc8', '[\"*\"]', '2025-02-02 00:13:28', NULL, '2025-02-02 00:13:13', '2025-02-02 00:13:28'),
(84, 'App\\Models\\User', 1, 'android_app', '6a3a59d48dcfe38df8ac3eedd7a89990085ab871c6fee12d7d9d59a70e4b3437', '[\"*\"]', '2025-02-02 00:18:45', NULL, '2025-02-02 00:18:40', '2025-02-02 00:18:45'),
(85, 'App\\Models\\User', 1, 'android_app', 'c8b6eabd710cd556aa5f65666c61c484533722e6aa88589fc3a1885d3f0d15c6', '[\"*\"]', '2025-02-02 00:21:10', NULL, '2025-02-02 00:20:00', '2025-02-02 00:21:10'),
(86, 'App\\Models\\User', 1, 'android_app', 'adac3abd7184a9d6e3949051729e11fe739cd7f6fbe0b599d039967b83afb731', '[\"*\"]', '2025-02-02 00:23:45', NULL, '2025-02-02 00:23:10', '2025-02-02 00:23:45'),
(87, 'App\\Models\\User', 1, 'android_app', '919c86ad68bdfef2ce92c23381242c12c35218c090781bc34837fb08f80e0cf0', '[\"*\"]', '2025-02-02 00:30:19', NULL, '2025-02-02 00:29:54', '2025-02-02 00:30:19'),
(88, 'App\\Models\\User', 1, 'android_app', 'b0fe970e1e5b43e596c0dd8a211d22a8c2e766d835c816dbb86706f628be2a1f', '[\"*\"]', '2025-02-02 00:41:17', NULL, '2025-02-02 00:40:15', '2025-02-02 00:41:17'),
(89, 'App\\Models\\User', 1, 'android_app', '4a5cddde8762d0b22e60d73e36db7952983597db9b952be74b9c8d7cb271b0f7', '[\"*\"]', '2025-02-02 17:15:38', NULL, '2025-02-02 17:14:16', '2025-02-02 17:15:38'),
(90, 'App\\Models\\User', 1, 'android_app', '9dfc2b38d95403b6ae149843e5bebbc14d59aa5263f9457167980479b308ffd2', '[\"*\"]', '2025-02-02 17:19:17', NULL, '2025-02-02 17:19:15', '2025-02-02 17:19:17'),
(91, 'App\\Models\\User', 1, 'android_app', 'f286f511b9e4a157a8f17080dca8116bd624c05f42ac8f690897824cb1d5dcb3', '[\"*\"]', '2025-02-02 18:03:38', NULL, '2025-02-02 17:37:21', '2025-02-02 18:03:38'),
(92, 'App\\Models\\User', 1, 'android_app', '61acdacc15419f07bba236d12eff2c24a32ecb958c67dd904e612279dd557a1e', '[\"*\"]', '2025-02-02 18:23:38', NULL, '2025-02-02 18:13:14', '2025-02-02 18:23:38'),
(93, 'App\\Models\\User', 1, 'android_app', 'b05a5fc65151e80fd0ff964c9ffce23ac1e43c65988b644aa4b4676152451469', '[\"*\"]', '2025-02-02 18:42:10', NULL, '2025-02-02 18:41:04', '2025-02-02 18:42:10'),
(94, 'App\\Models\\User', 1, 'android_app', '37b51fc0bbde3c7c66b7d74e319b127b34c971d2a6df196b5c68f8751cf8a31c', '[\"*\"]', '2025-02-02 19:05:26', NULL, '2025-02-02 19:00:58', '2025-02-02 19:05:26'),
(95, 'App\\Models\\User', 1, 'android_app', 'a5caaff6a8acea21a59ca2efbe6afebf688ee602ac9cab8d53263c85960178c1', '[\"*\"]', '2025-02-02 19:10:22', NULL, '2025-02-02 19:09:58', '2025-02-02 19:10:22'),
(96, 'App\\Models\\User', 1, 'android_app', 'b187b83965454536f2db0b8f63bcf2011782209ad249f43cb06f5a200f9eb7b4', '[\"*\"]', NULL, NULL, '2025-02-02 22:42:49', '2025-02-02 22:42:49'),
(97, 'App\\Models\\User', 1, 'android_app', '584a0a305e232af347511854b320d01b171c054c99ccf6333c96fe5fe4fa75c4', '[\"*\"]', '2025-02-02 22:59:30', NULL, '2025-02-02 22:42:50', '2025-02-02 22:59:30'),
(98, 'App\\Models\\User', 10, 'android_app', 'bd2e9889c40faf765d282b23b8a994a4a69350f86892ba12ba21fa1ac55f5ed1', '[\"*\"]', '2025-02-03 03:07:54', NULL, '2025-02-03 02:42:58', '2025-02-03 03:07:54'),
(99, 'App\\Models\\User', 10, 'android_app', '90e3c6fd244456c83f4251778da2d736a297dd831dc1318e28c08dd3d68f337f', '[\"*\"]', '2025-02-03 03:21:50', NULL, '2025-02-03 03:21:46', '2025-02-03 03:21:50'),
(100, 'App\\Models\\User', 10, 'android_app', 'a53d01b7c90974458e42ff5458126a3f240a9a1953422d43936841206704ebe0', '[\"*\"]', '2025-02-03 03:23:38', NULL, '2025-02-03 03:22:45', '2025-02-03 03:23:38'),
(101, 'App\\Models\\User', 10, 'android_app', '88fd9b74ddfde07a01f9963722b3af652ba671092114311869d59b94f4caae56', '[\"*\"]', '2025-02-03 03:33:59', NULL, '2025-02-03 03:29:23', '2025-02-03 03:33:59'),
(102, 'App\\Models\\User', 10, 'android_app', '9fd39237fc3b18529133419fdb97dce9e30fedb2bdfad86615d8a5914787b064', '[\"*\"]', '2025-02-03 03:35:52', NULL, '2025-02-03 03:34:15', '2025-02-03 03:35:52'),
(103, 'App\\Models\\User', 10, 'android_app', 'c6b85705f518078442957b1ad432f5f5817f168de81867bfafe5e5b3140748ff', '[\"*\"]', '2025-02-03 09:44:02', NULL, '2025-02-03 09:42:06', '2025-02-03 09:44:02'),
(104, 'App\\Models\\User', 10, 'android_app', '550499003020ca1c15951ee5140a0abb1d64b0df80e32678737066b5d194e6bb', '[\"*\"]', '2025-02-03 15:29:34', NULL, '2025-02-03 15:29:28', '2025-02-03 15:29:34'),
(105, 'App\\Models\\User', 10, 'android_app', '226c500d5afb6cb018804e21644d7a9397f50c4c50bf06568c41c3badd42efab', '[\"*\"]', '2025-02-03 16:49:37', NULL, '2025-02-03 16:49:18', '2025-02-03 16:49:37'),
(106, 'App\\Models\\User', 1, 'android_app', 'a5aae30b9049272e3080940743505fea86381b6bc1f52c3ecd726c32ab46e4c9', '[\"*\"]', '2025-02-03 20:52:22', NULL, '2025-02-03 20:46:52', '2025-02-03 20:52:22'),
(107, 'App\\Models\\User', 1, 'android_app', '5aeeb6896b94f3f08e015d287888fc5cdccd6250fe777a6919a3b02125d2fc13', '[\"*\"]', NULL, NULL, '2025-02-03 20:54:43', '2025-02-03 20:54:43'),
(108, 'App\\Models\\User', 1, 'android_app', '55e9760e330e67cb5407aa19eced23e3a9422d2877bf4ecc0a2808c8b8583a96', '[\"*\"]', NULL, NULL, '2025-02-03 20:54:44', '2025-02-03 20:54:44'),
(109, 'App\\Models\\User', 1, 'android_app', 'a70c68412c81d3dfebd4d0f02e6defc4b05fd624c36d54ba9c3fc8403cafcf46', '[\"*\"]', '2025-02-03 21:08:13', NULL, '2025-02-03 21:07:38', '2025-02-03 21:08:13'),
(110, 'App\\Models\\User', 10, 'android_app', '00d33a23e8d2c7f09d483eb099e65bc802731c2af3623fdfc41181a7ca843e39', '[\"*\"]', '2025-02-03 21:56:40', NULL, '2025-02-03 21:56:14', '2025-02-03 21:56:40'),
(111, 'App\\Models\\User', 10, 'android_app', '7ec94423a4a3a3d8fe2986f9168d34ad203e206987b21304cb341a566fac86de', '[\"*\"]', '2025-02-04 01:48:57', NULL, '2025-02-04 01:46:36', '2025-02-04 01:48:57'),
(112, 'App\\Models\\User', 10, 'android_app', '3a31f5a76f602ab55461a1dfb1bf8eb875d45e726b6f0e1f0f92dc9fc2cb3175', '[\"*\"]', '2025-02-04 02:56:11', NULL, '2025-02-04 02:56:05', '2025-02-04 02:56:11'),
(113, 'App\\Models\\User', 10, 'android_app', '01696ea16fbb76d341ea41c23696de65618d78a98ad2ff84f7231e1e0937f78e', '[\"*\"]', '2025-02-04 03:01:47', NULL, '2025-02-04 03:01:44', '2025-02-04 03:01:47'),
(114, 'App\\Models\\User', 10, 'android_app', 'a1656248501ecdc433e007dbfb8b1c4c3fa32ed4f3effb3abe8918387d3d3ec3', '[\"*\"]', NULL, NULL, '2025-02-04 03:50:50', '2025-02-04 03:50:50'),
(115, 'App\\Models\\User', 10, 'android_app', '6216322bb43dcc72d079c4f18c68c5b87e75bcd584615608b2365cc3863b0f73', '[\"*\"]', '2025-02-04 05:20:10', NULL, '2025-02-04 05:19:41', '2025-02-04 05:20:10'),
(116, 'App\\Models\\User', 10, 'android_app', '34f3e4ec84573b20026846710140e3011cb53162b7e99bbefe61f770dfff48a0', '[\"*\"]', '2025-02-04 16:21:33', NULL, '2025-02-04 16:21:31', '2025-02-04 16:21:33'),
(117, 'App\\Models\\User', 1, 'android_app', '2eabfeacb3a3ee7e83905eab4310d7860a3320b479610c648b3a2ceb28f34029', '[\"*\"]', '2025-02-04 17:47:40', NULL, '2025-02-04 17:32:10', '2025-02-04 17:47:40'),
(118, 'App\\Models\\User', 10, 'android_app', '4cdcf143428c07d4c45a3cabbfae5425e801040b0f6944558d972e0970a0eb38', '[\"*\"]', '2025-02-04 18:01:12', NULL, '2025-02-04 17:52:24', '2025-02-04 18:01:12'),
(119, 'App\\Models\\User', 1, 'android_app', 'a512446021f3a7e9639442cd3c989db4b09de6f0fbf03ee1e96579eb3500f367', '[\"*\"]', '2025-02-04 21:10:46', NULL, '2025-02-04 21:09:09', '2025-02-04 21:10:46'),
(120, 'App\\Models\\User', 10, 'android_app', 'f4dc7911d75a101a89b9dd83198efd30d2f110d702357db1c92e186e5cdd8bd8', '[\"*\"]', '2025-02-05 05:35:58', NULL, '2025-02-05 05:35:51', '2025-02-05 05:35:58'),
(121, 'App\\Models\\User', 10, 'android_app', 'fcef6bee0764ae4f6faa33b6acb17f81e4ce1b9b86a45af3e42ce9767ac965c6', '[\"*\"]', '2025-02-05 14:52:01', NULL, '2025-02-05 14:51:50', '2025-02-05 14:52:01'),
(122, 'App\\Models\\User', 10, 'android_app', '0b40cd166eed765109fe871a555fb1c1b7ed7c784262659eb4e2e4b90a29c6b7', '[\"*\"]', '2025-02-06 00:51:19', NULL, '2025-02-06 00:51:16', '2025-02-06 00:51:19'),
(123, 'App\\Models\\User', 10, 'android_app', '741f8d98292c5200be52384886ef73881fe672675d89839bdbf4059935f3b452', '[\"*\"]', '2025-02-06 03:17:06', NULL, '2025-02-06 03:16:03', '2025-02-06 03:17:06'),
(124, 'App\\Models\\User', 10, 'android_app', '8bb189e31d2e4dbca61ae849b4554f770cef03b261967f031893095e41d985b8', '[\"*\"]', NULL, NULL, '2025-02-06 03:18:13', '2025-02-06 03:18:13'),
(125, 'App\\Models\\User', 10, 'android_app', '774631984e2891a77481d827ff3fb4c3c663731c7bdcb0e6173f9f558e9ce416', '[\"*\"]', '2025-02-07 16:05:35', NULL, '2025-02-07 16:05:29', '2025-02-07 16:05:35'),
(126, 'App\\Models\\User', 10, 'android_app', '9ef6622b6235ec78c492246993ed4cdfb23c6e4a56f728ce28a35272a4e71656', '[\"*\"]', '2025-02-07 16:06:49', NULL, '2025-02-07 16:06:45', '2025-02-07 16:06:49'),
(127, 'App\\Models\\User', 10, 'android_app', '1c363cc5a68bd9d657ca049d7c81b0edac6f682ba73c432723db631b94b08856', '[\"*\"]', '2025-02-08 01:50:28', NULL, '2025-02-08 01:50:18', '2025-02-08 01:50:28'),
(128, 'App\\Models\\User', 10, 'android_app', 'afc512b17382091e95fb6657294d32de03b3f27a642967f41bed2c3f145de87c', '[\"*\"]', '2025-02-08 23:23:04', NULL, '2025-02-08 23:23:01', '2025-02-08 23:23:04'),
(129, 'App\\Models\\User', 10, 'android_app', '238de5b7e8cc171bf2796cc11269895529c53aeab49a3d46dc8db044c9207c54', '[\"*\"]', '2025-02-09 04:06:53', NULL, '2025-02-09 04:06:32', '2025-02-09 04:06:53'),
(130, 'App\\Models\\User', 10, 'android_app', '8af390a76ecb122249fb8b4a9e9552b78f10ce208e5f01c57ff2c0fb4b29fa88', '[\"*\"]', '2025-02-09 07:41:50', NULL, '2025-02-09 07:41:20', '2025-02-09 07:41:50'),
(131, 'App\\Models\\User', 10, 'android_app', 'd409431e2b24598b22371bbb7f4dde7a2e052e671a5cfd08f7bd634c6c0c12ba', '[\"*\"]', '2025-02-09 07:46:06', NULL, '2025-02-09 07:45:55', '2025-02-09 07:46:06'),
(132, 'App\\Models\\User', 10, 'android_app', '1b1604e3e2ca9524cfd4d00523d867d72ddc4c82fd141cb0ba7100de4f87cee5', '[\"*\"]', NULL, NULL, '2025-02-09 07:46:59', '2025-02-09 07:46:59'),
(133, 'App\\Models\\User', 10, 'android_app', 'f2348892593ddfc82f890a370902dbe975a8d625c32bc65b65123394ea0801d0', '[\"*\"]', '2025-02-09 22:56:25', NULL, '2025-02-09 22:56:04', '2025-02-09 22:56:25'),
(134, 'App\\Models\\User', 10, 'android_app', '1918f4551f4f389679d50ac1a8d683e9f57c3f1552c6ca92d671b2502490ef97', '[\"*\"]', NULL, NULL, '2025-02-10 04:06:09', '2025-02-10 04:06:09'),
(135, 'App\\Models\\User', 10, 'android_app', 'bc26d2cd9e2d5b03314be893d33f3bd481ce2bff4e3eae93598bd0159e90205b', '[\"*\"]', '2025-02-10 19:13:37', NULL, '2025-02-10 19:13:30', '2025-02-10 19:13:37'),
(136, 'App\\Models\\User', 10, 'android_app', '394b517f641aea869cce48f86571ade0aaf989f3f2511c1258a7bb845f9bd9c3', '[\"*\"]', NULL, NULL, '2025-02-11 02:14:54', '2025-02-11 02:14:54'),
(137, 'App\\Models\\User', 10, 'android_app', '4bc9f145511b3a1a32bef259cd91c138d81b85e2045883a8ee16b4be0bfe1203', '[\"*\"]', '2025-02-11 21:08:41', NULL, '2025-02-11 21:08:20', '2025-02-11 21:08:41'),
(138, 'App\\Models\\User', 10, 'android_app', 'e16d68572745ce97cb16882d5fe0d8eb92d56912010ebe7537c8c37197f68807', '[\"*\"]', NULL, NULL, '2025-02-12 03:25:34', '2025-02-12 03:25:34'),
(139, 'App\\Models\\User', 10, 'android_app', 'b7bc4712a51583e6fac16be45f6a40ff35015d197656eeef2d74c78a6e0dd897', '[\"*\"]', NULL, NULL, '2025-02-12 03:28:46', '2025-02-12 03:28:46'),
(140, 'App\\Models\\User', 10, 'android_app', '88f32430de1d99707a2b24a668146d0bbb85e44433a4fccc6520d4cd1544427d', '[\"*\"]', NULL, NULL, '2025-02-13 01:52:23', '2025-02-13 01:52:23'),
(141, 'App\\Models\\User', 10, 'android_app', '164da128263f44f70d335c456e733c1e7f107878b813dd9a6f4b32959d0fba20', '[\"*\"]', '2025-02-13 14:33:21', NULL, '2025-02-13 14:33:18', '2025-02-13 14:33:21'),
(142, 'App\\Models\\User', 10, 'android_app', '5e706c26fd270662f25c4a8ba0a29a7baf10b7fc81a997de07ba864a8906b673', '[\"*\"]', NULL, NULL, '2025-02-14 01:34:35', '2025-02-14 01:34:35'),
(143, 'App\\Models\\User', 10, 'android_app', '06dac40e3eea0191e6da930eb594a925fb448bcee680b6ec4e7accb0d503e0e5', '[\"*\"]', NULL, NULL, '2025-02-15 19:25:41', '2025-02-15 19:25:41'),
(144, 'App\\Models\\User', 10, 'android_app', 'c4d40e6a28dedcb98562af4d6757176233f020091d1f84e7c97bff214ab1f05c', '[\"*\"]', NULL, NULL, '2025-02-17 23:02:23', '2025-02-17 23:02:23');

-- --------------------------------------------------------

--
-- Table structure for table `receivers`
--

CREATE TABLE `receivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `receiver_address` varchar(255) DEFAULT NULL,
  `receiver_mobile` varchar(255) DEFAULT NULL,
  `is_archived` tinyint(4) NOT NULL DEFAULT 0,
  `branch_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receivers`
--

INSERT INTO `receivers` (`id`, `user_id`, `name`, `country_code`, `receiver_address`, `receiver_mobile`, `is_archived`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pondfill', NULL, 'Nisbeth Road , Pondfill', '(721) 543-1222', 0, 1, '2024-12-13 03:54:25', '2025-01-04 01:19:06'),
(3, 1, 'Anguilla Ferry Terminal', NULL, 'Anguilla Ferry Terminal', '+1264000000', 0, 2, '2024-12-15 20:04:10', '2025-01-04 01:20:13'),
(4, 1, 'Colebay', NULL, 'Smart Electronics', '+1 721-5202014', 0, 1, '2024-12-15 20:04:41', '2025-01-04 01:21:13'),
(5, 1, 'Marigot ferry terminal', NULL, 'Marigot ferry terminal', '+590590123456', 0, 3, '2024-12-15 20:21:02', '2025-01-04 01:23:22'),
(6, 1, 'Basseterre', NULL, 'Basseterre', '186924455', 0, 4, '2025-01-04 08:58:24', '2025-01-04 08:58:24'),
(7, 1, 'Marigot', NULL, 'Marigot', '+590590123456', 0, 5, '2025-01-04 08:59:47', '2025-01-04 08:59:47'),
(8, 1, 'SABA', NULL, 'MAKANA FERRY TERMINAL', '+1721123456', 0, 7, '2025-01-04 09:06:11', '2025-01-04 09:06:11'),
(9, 1, 'Sint Eustatius', NULL, 'MAKANA FERRY TERMINAL', '+17211234556', 0, 8, '2025-01-04 09:06:56', '2025-01-04 09:06:56');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2024-12-22 20:35:44', '2024-12-22 20:35:44'),
(2, 'user', 'web', '2024-12-22 20:45:41', '2024-12-22 20:45:41');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `payload` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `group`, `name`, `enabled`, `payload`, `created_at`, `updated_at`) VALUES
(1, 'payments', 'cash_payment', 1, '\"\"', '2024-02-04 01:13:25', '2024-02-04 01:13:25'),
(2, 'payments', 'debit/credit card', 1, '\"\"', '2024-02-04 01:13:25', '2024-02-04 01:13:25'),
(3, 'payments', 'paypal_payment', 0, '\"\"', '2024-02-04 01:13:25', '2024-02-04 01:13:25');

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT 1,
  `type` tinyint(4) NOT NULL,
  `shipping_date` varchar(100) DEFAULT NULL,
  `collection_time` date DEFAULT NULL,
  `client_status` int(11) NOT NULL DEFAULT 1,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_mobile` text DEFAULT NULL,
  `receiver_address` varchar(255) DEFAULT NULL,
  `from_branch_id` int(10) UNSIGNED NOT NULL,
  `to_branch_id` int(11) NOT NULL,
  `carrier` varchar(100) DEFAULT NULL,
  `carrier_doc` varchar(250) DEFAULT NULL,
  `payment_type` tinyint(4) DEFAULT NULL,
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  `payment_integration_id` text DEFAULT NULL,
  `payment_method_id` varchar(255) DEFAULT NULL,
  `tax` double NOT NULL DEFAULT 0,
  `insurance` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `hazmat` double NOT NULL DEFAULT 0,
  `imo` double NOT NULL DEFAULT 0,
  `handling` double NOT NULL DEFAULT 0,
  `sed` double NOT NULL DEFAULT 0,
  `delivery_time` date DEFAULT NULL,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `return_cost` double NOT NULL DEFAULT 0,
  `total_weight` double NOT NULL DEFAULT 0,
  `amount_to_be_collected` double NOT NULL DEFAULT 0,
  `employee_user_id` int(10) UNSIGNED DEFAULT NULL,
  `attachments_before_shipping` text DEFAULT NULL,
  `attachments_after_shipping` text DEFAULT NULL,
  `mission_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`id`, `code`, `status_id`, `type`, `shipping_date`, `collection_time`, `client_status`, `client_id`, `receiver_name`, `receiver_mobile`, `receiver_address`, `from_branch_id`, `to_branch_id`, `carrier`, `carrier_doc`, `payment_type`, `paid`, `payment_integration_id`, `payment_method_id`, `tax`, `insurance`, `discount`, `hazmat`, `imo`, `handling`, `sed`, `delivery_time`, `shipping_cost`, `return_cost`, `total_weight`, `amount_to_be_collected`, `employee_user_id`, `attachments_before_shipping`, `attachments_after_shipping`, `mission_id`, `order_id`, `otp`, `barcode`, `created_at`, `updated_at`) VALUES
(1, 'VM121', 4, 1, '2024-12-15', '2024-12-17', 1, 1, '1', NULL, 'mas aqui', 1, 1, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, 0, 0, 0, 0, NULL, 1, 1, 2, 1, NULL, NULL, NULL, 3, NULL, NULL, NULL, '2024-12-16 07:29:02', '2025-02-04 17:55:15'),
(6, 'VM122', 2, 1, '2024-12-15', NULL, 1, 1, '1', NULL, 'mas alla', 1, 1, NULL, NULL, NULL, 1, NULL, NULL, 3, 3, 0, 0, 0, 0, 0, NULL, 3, 3, 6, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2024-12-16 07:43:35', '2025-03-01 05:18:17'),
(13, 'VM123', 4, 2, '2024-12-23 00:00:00', '2024-12-17', 1, 1, '1', '+1 721-580-9215', 'mas alla', 1, 1, NULL, NULL, 1, 1, NULL, 'cash_payment', 5, 4, 0, 0, 0, 0, 0, NULL, 4, 4, 3, 17, NULL, NULL, NULL, 3, '66', NULL, NULL, '2024-12-16 08:16:16', '2025-02-03 03:29:43'),
(14, 'WB14', 1, 1, '2024-12-22 00:00:00', NULL, 1, 1, '1', '+1 721-580-9215', 'mas alla', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 1, 2, 0, 0, 0, 0, 0, NULL, 2, 3, 4, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL, '2024-12-22 19:40:31', '2025-01-12 15:25:07'),
(15, 'WB15', 1, 2, '2024-12-23 00:00:00', NULL, 1, 1, '1', '+1 721-580-9215', 'mas alla', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 2, 3, 0, 0, 0, 0, 0, NULL, 4, 2, 4, 11, NULL, NULL, NULL, 2, NULL, NULL, NULL, '2024-12-22 19:46:52', '2024-12-24 23:07:59'),
(16, 'WB16', 1, 2, NULL, NULL, 1, 1, '1', '+1 721-580-9215', 'mas alla', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 2, 2, 0, 0, 0, 0, 0, NULL, 14.6, 2, 43.4, 21, NULL, NULL, NULL, 3, NULL, NULL, NULL, '2024-12-26 22:04:39', '2024-12-26 22:04:39'),
(17, 'WB17', 1, 1, NULL, NULL, 1, 1, '1', '+1 721-580-9215', 'mas alla', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, 0, 0, 0, 0, NULL, 200.3, 1, 23, 203, NULL, NULL, NULL, 2, NULL, NULL, NULL, '2024-12-31 07:15:41', '2024-12-31 07:15:41'),
(24, 'VM24', 2, 1, NULL, NULL, 1, 1, '1', '+1234567890', '123 Main St, City, Country', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 50.5, 0, NULL, NULL, NULL, 3, NULL, NULL, '56789', '2025-01-01 01:59:44', '2025-01-31 02:36:49'),
(25, 'VM25', 4, 1, NULL, NULL, 1, 1, '1', '+1234567890', '123 Main St, City, Country', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 50.5, 0, NULL, NULL, NULL, 8, NULL, NULL, '56789', '2025-01-01 03:16:01', '2025-03-01 05:18:27'),
(26, 'VM26', 2, 2, NULL, NULL, 1, 11, '1', '(721) 543-1222', 'Nisbeth Road , Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 7.4, 0, 0.3, 7.4, NULL, NULL, NULL, 3, NULL, NULL, 'NA', '2025-01-01 03:20:53', '2025-01-31 02:42:57'),
(27, 'WR27', 1, 2, NULL, NULL, 1, 11, '1', '+1 721-580-9215', 'W.J.A Nisbeth road # 73', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 868, 1, 5000, 868, NULL, NULL, NULL, 1, '12121212', NULL, NULL, '2025-01-02 00:21:51', '2025-01-02 00:21:51'),
(28, 'WR28', 1, 2, NULL, NULL, 1, 11, '1', '+1 721-580-9215', 'W.J.A Nisbeth road # 73', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 2.4, 3.2, 0, 0, 0, 0, 0, NULL, 12.3, 5.5, 12, 23, NULL, NULL, NULL, 6, NULL, NULL, NULL, '2025-01-03 20:26:57', '2025-01-04 06:00:16'),
(29, 'VM29', 2, 2, NULL, NULL, 1, 11, '1', '(721) 543-1222', 'Nisbeth Road , Pondfill', 6, 1, 'HUGO GONLAVEZ', 'attachments/x8SJXqy5i4dL2nCegXlj2TBa2nSh9eS6AlCpYKwj.pdf', NULL, 0, NULL, NULL, 0, 16.5, 0, 0, 0, 0, 0, NULL, 7.4, 0, 0.3, 23.9, NULL, NULL, NULL, 7, '125125', NULL, 'NA', '2025-01-04 04:05:48', '2025-01-31 02:53:48'),
(31, 'WR31', 1, 2, NULL, NULL, 1, 11, '1', '(721) 543-1222', 'Nisbeth Road , Pondfill', 6, 1, NULL, 'attachments/GpPdskz3YgEOQQlGFplTkZF8mH0HnWtkAfmmDElv.jpg', NULL, 0, NULL, NULL, 1.23, 1.37, 0, 0, 0, 0, 0, NULL, 4, 2.5, 20, 9.1, NULL, NULL, NULL, 3, NULL, NULL, NULL, '2025-01-04 08:38:18', '2025-01-06 07:37:58'),
(34, 'WR34', 1, 2, NULL, NULL, 1, 11, '1', '(721) 543-1222', 'Nisbeth Road , Pondfill', 6, 1, 'HUGO GONLAVEZ', 'attachments/6ncTF2uCrXk0g0Mx1tSPT4lAhe6y4HNoGFQXQ0C8.pdf', NULL, 0, NULL, NULL, 1, 1.21, 0, 0, 0, 0, 0, NULL, 4, 1, 15, 7.21, NULL, NULL, NULL, 3, '124124124', NULL, NULL, '2025-01-06 12:24:42', '2025-01-06 12:24:42'),
(35, 'VM916', 2, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1.7, 0, NULL, NULL, NULL, 8, NULL, NULL, '1Z14V3880344011758', '2025-01-06 20:57:27', '2025-03-01 05:18:30'),
(36, 'VM917', 2, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 4.1, 0, NULL, NULL, NULL, 8, NULL, NULL, '1Z14V3880364368505', '2025-01-06 20:58:03', '2025-03-01 05:18:34'),
(37, 'VM918', 2, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0.45, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA318017134894', '2025-01-06 21:00:33', '2025-03-01 05:18:35'),
(38, 'VM919', 2, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 11.05, 0, NULL, NULL, NULL, 8, NULL, NULL, 'CNUSUP00011464556', '2025-01-06 21:01:08', '2025-03-01 05:18:54'),
(39, 'VM920', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 3.3, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA318426347393', '2025-01-06 22:11:52', '2025-03-01 05:18:59'),
(40, 'VM921', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 42.8, 0, NULL, NULL, NULL, 8, NULL, NULL, '9622041730003890409200434293150904', '2025-01-06 23:04:21', '2025-03-01 05:19:00'),
(41, 'VM922', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 27, 0, NULL, NULL, NULL, 8, NULL, NULL, '9622001900008100377900429379173206', '2025-01-06 23:06:01', '2025-03-01 05:19:00'),
(42, 'VM923', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 20.8, 0, NULL, NULL, NULL, 8, NULL, NULL, '9622001900008100377900429379173170', '2025-01-06 23:07:22', '2025-03-01 05:20:57'),
(43, 'VM924', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 10, 0, NULL, NULL, NULL, 8, NULL, NULL, '9622041730003890409200434293149245', '2025-01-06 23:08:46', '2025-03-01 05:19:01'),
(44, 'VM925', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 36.4, 0, NULL, NULL, NULL, 8, NULL, NULL, '9622001900000604742000416596957221', '2025-01-06 23:10:00', '2025-03-01 05:19:07'),
(45, 'VM926', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 36.4, 0, NULL, NULL, NULL, 8, NULL, NULL, '9622001900000604742000416596957232', '2025-01-06 23:11:16', '2025-03-01 05:19:08'),
(46, 'VM927', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 32.9, 0, NULL, NULL, NULL, 8, NULL, NULL, '9622001560008338663000283927887110', '2025-01-07 20:54:22', '2025-03-01 05:19:09'),
(47, 'VM928', 1, 1, NULL, NULL, 1, 5, '1', '(721) 543-1222', 'Nisbeth Road , Pondfill', 6, 1, 'amazon', NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 189.6, 0, 32.8, 189.6, NULL, NULL, NULL, 7, '12345678', NULL, '9622001560008338663000283927925939', '2025-01-07 20:55:51', '2025-01-08 05:13:53'),
(48, 'VM930', 1, 2, NULL, NULL, 1, 11, '1', '(721) 543-1222', 'Nisbeth Road , Pondfill', 6, 1, NULL, 'shippers/J3NWhKgZ6nNIJi0yNBlL7GiMHEbQOfB3OQKbDdGC.png', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 14.9, 0, 15, 14.9, NULL, NULL, NULL, 7, '323232', NULL, '9622041730003890409200434293185850', '2025-01-07 20:57:16', '2025-01-08 06:37:40'),
(49, 'VM931', 1, 2, NULL, NULL, 1, 11, '1', '(721) 543-1222', 'Nisbeth Road , Pondfill', 6, 1, 'AMAZON', 'shippers/5TtYu8FR7Hia2ZVykM2mhoYwJ35ebAX29TXA668F.pdf', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 15.1, 0, 27.75, 15.1, NULL, NULL, NULL, 3, '1234554321', NULL, '9622041730003890409200434293185861', '2025-01-07 20:58:05', '2025-01-12 15:13:49'),
(51, 'WR51', 1, 2, NULL, NULL, 1, 11, NULL, '+1 721-580-9212', 'Pondfill', 6, 1, 'AMAZON', 'shippers/fahNs8dfqyNHij5FYQB9AjR7OFKEZMuDce6WHbiC.jpg', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 1913, 0, 5703, 1913, NULL, NULL, NULL, 5, '1212121222', NULL, NULL, '2025-01-12 14:34:47', '2025-01-12 14:40:10'),
(52, 'VM932', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 8.65, 0, NULL, NULL, NULL, 8, NULL, NULL, '9632080400798132172000283636543315', '2025-01-14 20:53:57', '2025-03-01 05:19:09'),
(53, 'VM933', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 27.15, 0, NULL, NULL, NULL, 8, '9261290284679409226860', NULL, '420331669261290284679409226860', '2025-01-14 21:26:30', '2025-03-01 05:19:09'),
(54, 'VM934', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 31.1, 0, NULL, NULL, NULL, 8, NULL, NULL, '9588471054180337013142', '2025-01-14 21:27:11', '2025-03-01 05:19:09'),
(55, 'VM935', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 14.15, 0, NULL, NULL, NULL, 8, '9434608105462303846750', NULL, '4203316627509434608105462303846750', '2025-01-14 21:28:12', '2025-03-01 05:20:57'),
(56, 'VM936', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 5.15, 0, NULL, NULL, NULL, 8, '9434908105462304701974', NULL, '4203316627509434908105462304701974', '2025-01-14 21:29:04', '2025-03-01 05:20:57'),
(57, 'VM937', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0.5, 0, NULL, NULL, NULL, 8, '9400108105463279709108', NULL, '4203316627509400108105463279709108', '2025-01-14 21:30:05', '2025-03-01 05:20:57'),
(58, 'VM938', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1.55, 0, NULL, NULL, NULL, 8, NULL, NULL, 'SBBTGCn65Y_001_v', '2025-01-15 20:02:30', '2025-03-01 05:20:57'),
(59, 'VM939', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 16.35, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA318705926449', '2025-01-15 22:35:41', '2025-03-01 05:20:57'),
(60, 'VM940', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 12.95, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA318699693229', '2025-01-15 22:36:32', '2025-03-01 05:20:57'),
(61, 'VM941', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 15.8, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA318743870488', '2025-01-15 22:37:17', '2025-03-01 05:20:57'),
(62, 'VM942', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 2.75, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA318691071288', '2025-01-15 22:37:52', '2025-03-01 05:20:57'),
(63, 'VM943', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 2, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA318720447966', '2025-01-15 22:38:33', '2025-03-01 05:20:57'),
(64, 'VM944', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 17.95, 0, NULL, NULL, NULL, 8, NULL, NULL, '420331662750', '2025-01-17 19:41:07', '2025-03-01 05:20:57'),
(65, 'VM945', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 17.95, 0, NULL, NULL, NULL, 8, NULL, NULL, '1Z9XY7590352026763', '2025-01-17 19:43:18', '2025-03-01 05:20:57'),
(66, 'VM946', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 17.9, 0, NULL, NULL, NULL, 8, NULL, NULL, '1Z9XY7590352026718', '2025-01-17 19:46:26', '2025-03-01 05:20:57'),
(67, 'VM947', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 34.8, 0, NULL, NULL, NULL, 8, NULL, NULL, '9622001900008955088200429839775786', '2025-01-17 21:46:43', '2025-03-01 05:20:57'),
(68, 'VM948', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 19.35, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA318779978002', '2025-01-17 22:32:35', '2025-03-01 05:20:57'),
(69, 'VM949', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 15.15, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA318753535427', '2025-01-17 22:33:03', '2025-03-01 05:20:57'),
(70, 'VM950', 4, 1, NULL, NULL, 1, 20, '1', '(721) 580-9210', 'Pondfill', 6, 1, NULL, 'shippers/blVfcnuqa37gBUf0q6F5Vp9iDIXbSiAqzPjKb3RV.jpg', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 55.8, 0, 8, 55.8, NULL, NULL, NULL, 4, NULL, NULL, 'CNUSUP00012380099', '2025-01-20 23:48:51', '2025-01-31 05:02:48'),
(71, 'VM951', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 9.7, 0, NULL, NULL, NULL, 8, NULL, NULL, 'CNUSUP00012516448', '2025-01-22 20:09:35', '2025-03-01 05:20:57'),
(72, 'VM952', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1.15, 0, NULL, NULL, NULL, 8, NULL, NULL, 'CNUSUP00012494807', '2025-01-22 20:11:13', '2025-03-01 05:20:57'),
(73, 'VM953', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1.7, 0, NULL, NULL, NULL, 8, NULL, NULL, 'CNUSUP00012470593', '2025-01-22 20:11:54', '2025-03-01 05:20:57'),
(74, 'VM954', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 9.35, 0, NULL, NULL, NULL, 8, NULL, NULL, 'CNUSUP00012501985', '2025-01-22 20:12:42', '2025-03-01 05:20:57'),
(75, 'VM955', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 5.55, 0, NULL, NULL, NULL, 8, NULL, NULL, 'CNUSUP00012478412', '2025-01-22 20:14:29', '2025-03-01 05:20:57'),
(76, 'VM956', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 9.5, 0, NULL, NULL, NULL, 8, NULL, NULL, 'CNUSUP00012478460', '2025-01-22 20:15:33', '2025-03-01 05:20:57'),
(77, 'VM957', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 9.35, 0, NULL, NULL, NULL, 8, NULL, NULL, 'CNUSUP00012478221', '2025-01-22 20:16:25', '2025-03-01 05:20:57'),
(78, 'VM958', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 9.3, 0, NULL, NULL, NULL, 8, NULL, NULL, 'CNUSUP00012477681', '2025-01-22 20:17:33', '2025-03-01 05:20:57'),
(79, 'VM959', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 9.6, 0, NULL, NULL, NULL, 8, NULL, NULL, '9622001560008524261900284550156609', '2025-01-22 21:18:22', '2025-03-01 05:20:57'),
(80, 'VM960', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 2.9, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA318882325030', '2025-01-22 21:52:36', '2025-03-01 05:20:57'),
(81, 'VM961', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 11.9, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA318853844949', '2025-01-22 21:53:08', '2025-03-01 05:20:57'),
(82, 'VM962', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 19.55, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA318884493119', '2025-01-22 21:54:08', '2025-03-01 05:20:57'),
(83, 'VM963', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 20.35, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA318881594937', '2025-01-22 21:55:23', '2025-03-01 05:20:57'),
(84, 'VM964', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 27.45, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA318875605839', '2025-01-22 22:00:17', '2025-03-01 05:20:57'),
(85, 'VM965', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 28.05, 0, NULL, NULL, NULL, 8, NULL, NULL, '9622041730003890409200434293318241', '2025-01-23 20:29:28', '2025-03-01 05:20:57'),
(86, 'VM966', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 2.75, 0, NULL, NULL, NULL, 8, '9434611206224422936891', NULL, '420331669434611206224422936891', '2025-01-23 21:05:40', '2025-03-01 05:20:57'),
(87, 'VM967', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 16.45, 0, NULL, NULL, NULL, 8, NULL, NULL, 'SMART ELECTRONICS', '2025-01-23 23:00:47', '2025-03-01 05:20:57'),
(88, 'VM968', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 26.35, 0, NULL, NULL, NULL, 8, NULL, NULL, 'SMART ELECTRONICS HARRY', '2025-01-23 23:03:02', '2025-03-01 05:20:57'),
(89, 'VM969', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 4.55, 0, NULL, NULL, NULL, 8, NULL, NULL, '420331669998', '2025-01-24 21:51:49', '2025-03-01 05:20:57'),
(90, 'VM970', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 37.1, 0, NULL, NULL, NULL, 8, NULL, NULL, '9632001960722725980600438938584878', '2025-01-24 23:14:13', '2025-03-01 05:20:57'),
(91, 'VM971', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 33.75, 0, NULL, NULL, NULL, 8, NULL, NULL, '9632001960722725980600438938593699', '2025-01-24 23:15:32', '2025-03-01 05:20:57'),
(92, 'VM972', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 14.45, 0, NULL, NULL, NULL, 8, NULL, NULL, '9622041730003890409200434293318230', '2025-01-24 23:16:18', '2025-03-01 05:20:57'),
(93, 'VM973', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 19.95, 0, NULL, NULL, NULL, 8, NULL, NULL, '9632001960722725980600438938584867', '2025-01-24 23:17:14', '2025-03-01 05:20:57'),
(94, 'VM993', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 8.45, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA319137488423', '2025-02-03 22:27:58', '2025-03-01 05:20:57'),
(95, 'VM994', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 10.35, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA319137881570', '2025-02-03 22:28:43', '2025-03-01 05:20:57'),
(96, 'VM995', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 9.15, 0, NULL, NULL, NULL, 8, NULL, NULL, 'TBA319140212126', '2025-02-03 22:29:45', '2025-03-01 05:20:57'),
(97, 'VM996', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 17.55, 0, NULL, NULL, NULL, 8, NULL, NULL, '9622001900005890809000435564316144', '2025-02-03 22:35:25', '2025-03-01 05:20:57'),
(98, 'VM997', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 13.7, 0, NULL, NULL, NULL, 8, '9261290189160000116118', NULL, '420331669261290189160000116118', '2025-02-03 22:55:26', '2025-03-01 05:20:57'),
(99, 'VM998', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 13.9, 0, NULL, NULL, NULL, 8, '9261290189160000116101', NULL, '420331669261290189160000116101', '2025-02-03 22:56:26', '2025-03-01 05:20:57'),
(100, 'VM999', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 13.7, 0, NULL, NULL, NULL, 8, '9261290189160000116088', NULL, '420331669261290189160000116088', '2025-02-03 22:57:15', '2025-03-01 05:20:57'),
(101, 'VM1000', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 21.75, 0, NULL, NULL, NULL, 8, NULL, NULL, '9632001960810668458200432758620499', '2025-02-04 20:25:04', '2025-03-01 05:20:57'),
(102, 'VM1001', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 7.15, 0, NULL, NULL, NULL, 8, '9405508105462421157579', NULL, '4203316627509405508105462421157579', '2025-02-04 22:22:06', '2025-03-01 05:20:57'),
(103, 'VM1002', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 5.75, 0, NULL, NULL, NULL, 8, NULL, NULL, '1ZJ74F34YW84039887', '2025-02-04 22:22:48', '2025-03-01 05:20:57'),
(104, 'VM1003', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 15.8, 0, NULL, NULL, NULL, 8, NULL, NULL, 'c3e4b8f1cdb94ad1', '2025-02-04 23:02:49', '2025-03-01 05:20:57'),
(105, 'VM1004', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 15.8, 0, NULL, NULL, NULL, 8, NULL, NULL, '0c3e909dfd786138', '2025-02-04 23:03:31', '2025-03-01 05:20:57'),
(106, 'VM1005', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 15.65, 0, NULL, NULL, NULL, 8, NULL, NULL, 'afe25d2141182c64', '2025-02-04 23:04:16', '2025-03-01 05:20:57'),
(110, 'VM1006', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 21.6, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-06 01:17:36', '2025-03-01 05:20:57'),
(111, 'VM1007', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 10, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-06 21:06:29', '2025-03-01 05:20:57'),
(112, 'VM1008', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 10.45, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-06 21:07:53', '2025-03-01 05:20:57'),
(113, 'VM1009', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 31.3, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-06 21:09:40', '2025-03-01 05:20:57'),
(114, 'VM1010', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 29.25, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-06 21:41:38', '2025-03-01 05:20:57'),
(115, 'VM1011', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 6.95, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-06 22:05:40', '2025-03-01 05:20:57'),
(116, 'VM1012', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 9.6, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-07 20:07:34', '2025-03-01 05:20:57'),
(117, 'VM1013', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 9.45, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-07 20:08:56', '2025-03-01 05:20:57'),
(118, 'VM1014', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 29.9, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-07 21:08:36', '2025-03-01 05:20:57'),
(119, 'VM1015', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 25.45, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-07 21:09:47', '2025-03-01 05:20:57'),
(120, 'VM1016', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1.7, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-10 20:00:23', '2025-03-01 05:20:57'),
(121, 'VM1017', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 27.25, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-10 21:26:01', '2025-03-01 05:20:57'),
(122, 'VM1018', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 9.4, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-10 21:27:02', '2025-03-01 05:20:57'),
(123, 'VM1019', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 14.95, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-11 21:18:51', '2025-03-01 05:20:57'),
(124, 'VM1020', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 12.9, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-12 21:13:20', '2025-03-01 05:20:57'),
(125, 'VM1021', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 34.5, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-12 21:23:45', '2025-03-01 05:20:57'),
(126, 'VM1022', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 19.85, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-13 20:43:33', '2025-03-01 05:20:57'),
(127, 'VM1023', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0.5, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-14 21:16:51', '2025-03-01 05:20:57'),
(128, 'VM1024', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 2.55, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-14 21:51:33', '2025-03-01 05:20:57'),
(129, 'VM1025', 1, 1, NULL, NULL, 1, 11, '1', '(721) 580-9210', 'Pondfill', 6, 1, 'amazon', 'shippers/skRK5wzXZn4UcFAOjHZJSc4ScDch37qqDAKptgVT.jpg', NULL, 0, NULL, NULL, 1, 2, 0, 0, 0, 0, 0, NULL, 92.1, 0, 10, 94.86, NULL, NULL, NULL, 7, '987654324766545432', NULL, NULL, '2025-02-14 21:52:07', '2025-02-15 23:11:33'),
(130, 'VM1026', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 21.1, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-17 21:27:22', '2025-03-01 05:20:57'),
(131, 'VM1027', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 19.1, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-17 21:31:16', '2025-03-01 05:20:57'),
(132, 'VM1028', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 29.1, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-17 21:32:03', '2025-03-01 05:20:57'),
(133, 'VM1029', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 5.05, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-18 20:03:44', '2025-03-01 05:20:57'),
(134, 'VM1030', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 4.85, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-18 20:04:55', '2025-03-01 05:20:57'),
(135, 'VM1031', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 9.85, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-18 20:43:49', '2025-03-01 05:20:57'),
(136, 'VM1032', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 3, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-19 23:21:07', '2025-03-01 05:20:57'),
(137, 'VM1033', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 3, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-19 23:21:46', '2025-03-01 05:20:57'),
(138, 'VM1034', 1, 2, NULL, NULL, 1, 31, '1', '(721) 580-9210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 23.1, 0, 21.7, 23.1, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-19 23:24:05', '2025-03-02 19:37:00'),
(139, 'VM1035', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 5.15, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-19 23:24:48', '2025-03-01 05:20:57'),
(140, 'VM1037', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 42.05, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 19:24:38', '2025-03-01 05:20:57'),
(141, 'VM1038', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 41.95, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 19:26:47', '2025-03-01 05:20:57'),
(142, 'VM1039', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 42, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 19:27:55', '2025-03-01 05:20:57'),
(143, 'VM1040', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 41.95, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 19:33:01', '2025-03-01 05:20:57'),
(144, 'VM1041', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 30.55, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 19:36:32', '2025-03-01 05:20:57'),
(145, 'VM1042', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 30.45, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 19:37:31', '2025-03-01 05:20:57'),
(146, 'VM1043', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 30.55, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 19:41:21', '2025-03-01 05:20:57'),
(147, 'VM1044', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 30.05, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 19:42:51', '2025-03-01 05:20:57'),
(148, 'VM1045', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 11.85, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 19:54:33', '2025-03-01 05:20:57'),
(149, 'VM1046', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 9.2, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 19:55:20', '2025-03-01 05:20:57'),
(150, 'VM1047', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 5.25, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 19:56:37', '2025-03-01 05:20:57'),
(151, 'VM1048', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 6.1, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 19:57:32', '2025-03-01 05:20:57'),
(152, 'VM1049', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 16.25, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 20:02:20', '2025-03-01 05:20:57'),
(153, 'VM1050', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 18.75, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 20:04:12', '2025-03-01 05:20:57'),
(154, 'VM1051', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 14.2, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 20:05:46', '2025-03-01 05:20:57'),
(155, 'VM1052', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 11.3, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 20:06:51', '2025-03-01 05:20:57'),
(156, 'VM1053', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 27.25, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 20:50:04', '2025-03-01 05:20:57'),
(157, 'VM1054', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 20.25, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 20:51:32', '2025-03-01 05:20:57'),
(158, 'VM1055', 1, 2, NULL, NULL, 1, 11, '1', '(721) 580-9210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 4.2, 0, 5.8, 4.2, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 20:58:40', '2025-03-03 05:48:28'),
(159, 'VM1056', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 3.6, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-20 20:59:44', '2025-03-01 05:20:57'),
(160, 'VM1057', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 37.3, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-21 19:41:26', '2025-03-01 05:20:57'),
(161, 'VM1058', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 37.2, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-21 19:44:13', '2025-03-01 05:20:57'),
(162, 'VM1059', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 37.1, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-21 19:45:19', '2025-03-01 05:20:57'),
(163, 'VM1060', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 37.25, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-21 19:46:06', '2025-03-01 05:20:57'),
(164, 'VM1061', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 37.2, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-21 19:46:46', '2025-03-01 05:20:57'),
(165, 'VM1062', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 4.35, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-24 22:08:52', '2025-03-01 05:20:57'),
(166, 'VM1063', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 26.3, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 18:25:22', '2025-03-01 05:20:57'),
(167, 'VM1064', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 26.4, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 18:26:08', '2025-03-01 05:20:57'),
(168, 'VM1065', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 13.85, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 18:26:46', '2025-03-01 05:20:57'),
(169, 'VM1066', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 32.15, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 19:55:28', '2025-03-01 05:20:57'),
(170, 'VM1067', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 32.5, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 20:00:53', '2025-03-01 05:20:57'),
(171, 'VM1068', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 32.15, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 20:02:06', '2025-03-01 05:20:57'),
(172, 'VM1069', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 32.3, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 20:03:08', '2025-03-01 05:20:57'),
(173, 'VM1070', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 32.2, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 20:04:54', '2025-03-01 05:20:57'),
(174, 'VM1071', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 32.25, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 20:06:06', '2025-03-01 05:20:57'),
(175, 'VM1072', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 32.1, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 20:07:10', '2025-03-01 05:20:57'),
(176, 'VM1073', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 32.35, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 20:08:21', '2025-03-01 05:20:57'),
(177, 'VM1074', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 32.45, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 20:09:42', '2025-03-01 05:20:57'),
(178, 'VM1075', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 32.45, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 20:10:52', '2025-03-01 05:20:57'),
(179, 'VM1076', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 32.45, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 20:13:53', '2025-03-01 05:20:57'),
(180, 'VM1077', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 32.05, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 20:15:10', '2025-03-01 05:21:02'),
(181, 'VM1078', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 15.6, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 20:16:28', '2025-03-01 05:20:57'),
(182, 'VM1079', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 34.4, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 20:18:39', '2025-03-01 05:20:57'),
(183, 'VM1080', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 27.25, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 20:23:14', '2025-03-01 05:20:57'),
(184, 'VM1081', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 27.25, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 20:24:55', '2025-03-01 05:20:57'),
(185, 'VM1082', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 2, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 22:07:39', '2025-03-01 05:20:57'),
(186, 'VM1083', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 13.75, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-27 22:08:18', '2025-03-01 05:20:57'),
(187, 'VM1084', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1.8, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-28 22:01:17', '2025-03-01 05:20:57'),
(188, 'VM1085', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 6.9, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-28 22:51:12', '2025-03-01 05:21:01'),
(189, 'VM1086', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 22.05, 0, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-28 22:51:53', '2025-03-01 05:21:00'),
(190, 'VM1087', 1, 2, NULL, NULL, 1, 11, '1', '(721) 580-9210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 17.2, 0, 19.25, 17.2, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-02-28 22:52:36', '2025-03-04 00:00:57'),
(191, 'WR191', 1, 2, NULL, NULL, 1, 11, NULL, '+1 721-580-9212', 'Pondfill', 6, 1, 'AMAZON', 'shippers/vDS7AiXj3KUWingfBfA2YaRlunhQmaTa7lFCNDLj.pdf', NULL, 0, NULL, NULL, 0, 2, 0, 0, 0, 0, 0, NULL, 4, 0, 8, 4.08, NULL, NULL, NULL, 8, '297297297', NULL, NULL, '2025-03-01 05:32:00', '2025-03-01 05:32:00'),
(194, 'VM50175', 1, 1, NULL, NULL, 1, 11, '1', '+1 721-580-9212', 'Pondfill', 6, 1, 'test', 'shippers/shipper_67c59c994ad13.png', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 36.9, 0, 0.3, 36.9, NULL, NULL, NULL, 4, '125125125', NULL, 'NA', '2025-03-03 02:25:41', '2025-03-03 15:38:17'),
(195, 'VM1088', 1, 2, NULL, NULL, 1, 11, '1', '(721) 580-9210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 7, 0, 6.9, 7, NULL, NULL, NULL, 8, NULL, NULL, 'TBA319671603726', '2025-03-03 17:45:38', '2025-03-03 23:55:12'),
(196, 'WR196', 1, 1, NULL, NULL, 1, 21, NULL, '+1 721-580-9212', 'Pondfill', 6, 1, 'amazon', 'shippers/shipper_67c5e2983aa65.png', NULL, 0, NULL, NULL, 3, 2, 0, 0, 0, 0, 0, NULL, 15, 0, 3, 20, NULL, NULL, NULL, 5, NULL, NULL, NULL, '2025-03-03 20:10:47', '2025-03-03 20:12:13'),
(197, 'WR197', 1, 1, NULL, NULL, 1, 7, NULL, '+1 721-580-9212', 'Pondfill', 6, 1, 'amazon', NULL, NULL, 0, NULL, NULL, 3, 2, 0, 0, 0, 0, 0, NULL, 437.7, 0, 43, 462.7, NULL, NULL, NULL, 4, NULL, NULL, NULL, '2025-03-03 20:32:27', '2025-03-03 20:32:27'),
(198, 'WR198', 1, 2, NULL, NULL, 1, 7, NULL, '+1 721-580-9212', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 3, 3, 0, 0, 0, 0, 0, NULL, 90.8, 0, 43, 120.8, NULL, NULL, NULL, 5, NULL, NULL, NULL, '2025-03-03 20:34:41', '2025-03-03 20:34:41'),
(199, 'VM1089', 1, 1, NULL, NULL, 1, 11, '1', '(721) 580-9210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 167.6, 0, 29.8, 167.6, NULL, NULL, NULL, 4, NULL, NULL, '0008461982', '2025-03-03 21:35:56', '2025-03-03 22:45:00'),
(200, 'VM1090', 1, 1, NULL, NULL, 1, 11, '1', '(721) 580-9210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 247.5, 0, 49.5, 247.5, NULL, NULL, NULL, 4, NULL, NULL, '9632001960762627019400438526374833', '2025-03-03 21:37:13', '2025-03-03 22:40:40'),
(201, 'VM1091', 1, 1, NULL, NULL, 1, 11, '1', '(721) 580-9210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 214.5, 0, 42.9, 214.5, NULL, NULL, NULL, 4, NULL, NULL, '9632001960762627019400438526374822', '2025-03-03 21:38:12', '2025-03-03 22:42:47'),
(202, 'VM1092', 1, 1, NULL, NULL, 1, 11, '1', '(721) 580-9210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 114, 0, 22.8, 114, NULL, NULL, NULL, 4, NULL, NULL, '9632001960762627019400438526374855', '2025-03-03 21:39:02', '2025-03-03 22:41:49'),
(203, 'VM1093', 1, 1, NULL, NULL, 1, 11, '1', '(721) 580-9210', 'Pondfill', 6, 1, NULL, 'shippers/shipper_67c60a176ddf4.png', NULL, 0, NULL, NULL, 2, 2, 0, 0, 0, 0, 0, NULL, 195.5, 0, 16.95, 197.1, NULL, NULL, NULL, 4, NULL, NULL, 'TBA319710354653', '2025-03-03 22:43:20', '2025-03-03 22:59:19'),
(204, 'WR204', 1, 2, NULL, NULL, 1, 11, NULL, '+1 721-580-9212', 'Pondfill', 6, 1, 'rac deliviries', 'shippers/shipper_67c61b0fd9c84.png', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 4, 0, 9, 4, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-03-04 00:11:43', '2025-03-04 00:11:43'),
(205, 'WR205', 1, 2, NULL, NULL, 1, 11, NULL, '+1 721-580-9212', 'Pondfill', 6, 1, NULL, 'shippers/shipper_67c62128e3846.png', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 12.3, 0, 5, 12.3, NULL, NULL, NULL, 8, '787878', NULL, NULL, '2025-03-04 00:33:19', '2025-03-04 00:37:45'),
(206, 'VM1094', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 3.45, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'CNUSUP00014842118', '2025-03-04 20:32:19', '2025-03-04 20:32:19'),
(207, 'VM1095', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 34.4, 0, NULL, NULL, NULL, NULL, NULL, NULL, '9632001960626328717500772326167271', '2025-03-04 20:42:16', '2025-03-04 20:42:16'),
(208, 'VM1096', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 9.35, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'TBA319720940129', '2025-03-04 21:04:58', '2025-03-04 21:04:58'),
(209, 'VM1097', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 17.9, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'TBA319763246987', '2025-03-04 21:05:38', '2025-03-04 21:05:38'),
(210, 'VM1098', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 7.55, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'TBA319769474236', '2025-03-04 21:06:56', '2025-03-04 21:06:56'),
(211, 'VM1099', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 3.1, 0, NULL, NULL, NULL, NULL, '9434636106028277731809', NULL, '420331669434636106028277731809', '2025-03-05 21:33:07', '2025-03-05 21:33:07'),
(212, 'VM1100', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1.25, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'TBA319783352509', '2025-03-05 22:02:49', '2025-03-05 22:02:49'),
(213, 'VM1102', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 26.55, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'TBA319800870246', '2025-03-06 19:18:19', '2025-03-06 19:18:19'),
(214, 'VM1103', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 31.35, 0, NULL, NULL, NULL, NULL, NULL, NULL, '9622001900008955088200434045096906', '2025-03-06 21:00:04', '2025-03-06 21:00:04'),
(215, 'VM1104', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 31.35, 0, NULL, NULL, NULL, NULL, NULL, NULL, '0009344514', '2025-03-06 21:01:32', '2025-03-06 21:01:32'),
(216, 'VM1105', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 39.4, 0, NULL, NULL, NULL, NULL, NULL, NULL, '9622001900008955088200434045096928', '2025-03-06 21:10:59', '2025-03-06 21:10:59'),
(217, 'VM1106', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 23.2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1001910920760003316600286120928882', '2025-03-06 21:42:18', '2025-03-06 21:42:18'),
(218, 'VM1107', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 18.9, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1106', '2025-03-06 22:46:45', '2025-03-06 22:46:45'),
(219, 'VM1108', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 24, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1107 1096 1100', '2025-03-06 23:09:16', '2025-03-06 23:09:16'),
(220, 'VM1110', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 28.3, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'TEST', '2025-03-06 23:21:02', '2025-03-06 23:21:02');
INSERT INTO `shipments` (`id`, `code`, `status_id`, `type`, `shipping_date`, `collection_time`, `client_status`, `client_id`, `receiver_name`, `receiver_mobile`, `receiver_address`, `from_branch_id`, `to_branch_id`, `carrier`, `carrier_doc`, `payment_type`, `paid`, `payment_integration_id`, `payment_method_id`, `tax`, `insurance`, `discount`, `hazmat`, `imo`, `handling`, `sed`, `delivery_time`, `shipping_cost`, `return_cost`, `total_weight`, `amount_to_be_collected`, `employee_user_id`, `attachments_before_shipping`, `attachments_after_shipping`, `mission_id`, `order_id`, `otp`, `barcode`, `created_at`, `updated_at`) VALUES
(221, 'VM1111', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 8, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'CNUSUP00014979747', '2025-03-07 19:59:16', '2025-03-07 19:59:16'),
(222, 'VM1112', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 5.95, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'CNUSUP00014960223', '2025-03-07 19:59:53', '2025-03-07 19:59:53'),
(223, 'VM1113', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 32.55, 0, NULL, NULL, NULL, NULL, NULL, NULL, '9632001960722725980600445313851887', '2025-03-07 21:42:05', '2025-03-07 21:42:05'),
(224, 'VM1114', 1, 1, NULL, NULL, 1, 1, '1', '(721) 580-9210', 'Pondfill', 6, 1, 'amazon', NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 247.6, 0, 33.8, 247.6, NULL, NULL, NULL, 7, NULL, NULL, '9622001900008955088200434045106234', '2025-03-07 21:43:24', '2025-03-10 02:01:08'),
(225, 'WR225', 1, 1, NULL, NULL, 1, 11, NULL, '+1 721-580-9212', 'Pondfill', 6, 1, NULL, 'shippers/shipper_67cc705a002a6.png', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 20, 0, 4, 20, NULL, NULL, NULL, 8, '221133', NULL, NULL, '2025-03-08 19:29:13', '2025-03-08 19:29:14'),
(226, 'WR226', 1, 2, NULL, NULL, 1, 11, NULL, '+1 721-580-9212', 'Pondfill', 6, 1, 'HUGO GONLAVEZ', 'shippers/shipper_67cec60a2ac35.png', NULL, 0, NULL, NULL, 0, 1.25, 10, 1, 2, 3, 4, NULL, 4, 5, 5, 19.85, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2025-03-10 13:59:20', '2025-03-10 13:59:22'),
(227, 'VM1115', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1.75, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'UUSC000008237390', '2025-03-10 19:46:59', '2025-03-10 19:46:59'),
(228, 'VM1116', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 3.1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'UUSC000008284586', '2025-03-10 19:47:47', '2025-03-10 19:47:47'),
(229, 'VM1117', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 25.5, 0, NULL, NULL, NULL, NULL, NULL, NULL, '9632041700201464327000772515380170', '2025-03-10 20:09:30', '2025-03-10 20:09:30'),
(230, 'VM1118', 1, 1, NULL, NULL, 1, 1, '1', '7215809210', 'Pondfill', 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 26, 0, NULL, NULL, NULL, NULL, NULL, NULL, '9632041700201464327000772515626090', '2025-03-10 20:10:19', '2025-03-10 20:10:19');

-- --------------------------------------------------------

--
-- Table structure for table `shipment_attachments`
--

CREATE TABLE `shipment_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipment_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipment_attachments`
--

INSERT INTO `shipment_attachments` (`id`, `shipment_id`, `file_path`, `created_at`, `updated_at`) VALUES
(9, 31, 'attachments/YTeHVhHneTx946jl4v6xsfbn3gVgjdoIX8ukuag1.jpg', '2025-01-06 07:07:16', '2025-01-06 07:07:16'),
(10, 31, 'attachments/INNfj3k7iuDlehfG5v0l8mMINfJUCyferPqhUk5B.jpg', '2025-01-06 07:07:16', '2025-01-06 07:07:16'),
(13, 34, 'attachments/yFUpdq3Gg77QSYQWh4w6p4l7hhxjz60kqMVa2QfY.jpg', '2025-01-06 12:24:42', '2025-01-06 12:24:42'),
(14, 29, 'attachments/ORN0QP5DeUSEhw7Fd2DkKfGT3A8QSf6Xo4RPnxkk.jpg', '2025-01-06 13:33:01', '2025-01-06 13:33:01'),
(15, 48, 'attachments/VxvaXMlnsfIb0JJBFuhWh3rdfnKC01n1f17hHXt9.png', '2025-01-08 06:37:40', '2025-01-08 06:37:40'),
(16, 51, 'attachments/QQG6NmdcOcnEyk7jCP8Kta3fFPc03eF4m42QzwLa.png', '2025-01-12 14:37:20', '2025-01-12 14:37:20'),
(17, 70, 'attachments/BoTN4SD6nVFRi5zFOyy4VLsLl1xtde5g6mxX6PJu.jpg', '2025-01-21 19:46:47', '2025-01-21 19:46:47'),
(18, 70, 'attachments/okJ4d4XWmz8nCD2GcaIeQF4cgWS3AQzCsTh9VlRi.jpg', '2025-01-21 19:46:47', '2025-01-21 19:46:47'),
(19, 70, 'attachments/K2X3QjnQcTgdtwUrY44qVSRWGCRyO4L65q6frO2U.jpg', '2025-01-21 19:46:47', '2025-01-21 19:46:47'),
(20, 17, 'attachments/6VbV0pAnnRpVqe5D9kMSfm9uV9v6i3XVIERiBNCA.png', '2025-02-01 03:41:08', '2025-02-01 03:41:08'),
(21, 17, 'attachments/aTh9h0S87RQGzcK3jBDoBed0Sn5g8QYArx4qOb9M.png', '2025-02-01 04:41:15', '2025-02-01 04:41:15'),
(22, 17, 'attachments/B18EnXm66FjGxPMhlCjsNPUUrbF37as0HOEPTWsQ.png', '2025-02-01 04:42:16', '2025-02-01 04:42:16'),
(23, 17, 'attachments/2dma2reOpTlpqUjfsAbryDqlPmjzVI0QG1R3zQEg.png', '2025-02-01 04:42:25', '2025-02-01 04:42:25'),
(24, 1, 'attachments/rkbvtBEZwnu90pmaXYKGg4DF8H0nwKbat2Sop22H.jpg', '2025-02-01 05:27:36', '2025-02-01 05:27:36'),
(25, 1, 'attachments/6Ahsd7VTahttVgqsVUOwDxKDBgzlxOusxSPPat95.jpg', '2025-02-01 06:44:00', '2025-02-01 06:44:00'),
(26, 1, 'attachments/rG5Pr41QIGhHYDMGQJWyETR5qqNzWHoBkGzyLKFb.jpg', '2025-02-01 06:51:44', '2025-02-01 06:51:44'),
(27, 1, 'attachments/BbUvPkqUEiW3fqtBeksJMZ3IC44Ay3StXur6Iwgx.jpg', '2025-02-01 06:55:12', '2025-02-01 06:55:12'),
(28, 1, 'attachments/IC68o4wAU10AsVFAyOcvjlJvHy3Fvj3f7Wpytm8E.jpg', '2025-02-01 07:18:10', '2025-02-01 07:18:10'),
(29, 1, 'attachments/lzriCnyS5mEkZiXe0VzbTbbnDuaXGRzZ8pNIToC0.png', '2025-02-01 22:04:41', '2025-02-01 22:04:41'),
(30, 1, 'attachments/878CoXZ2XBFO24uGZCzqaC07pbvLytrV6eCD3gya.png', '2025-02-01 23:16:19', '2025-02-01 23:16:19'),
(31, 36, 'attachments/clRykH49VSTilOBf7LPIznnLu6geOL180jSvjf61.png', '2025-02-02 00:23:45', '2025-02-02 00:23:45'),
(32, 35, 'attachments/11cqZX1DGHuSQqIh8IAKk7q4hmj55iiX7ovjG9wz.png', '2025-02-02 00:30:19', '2025-02-02 00:30:19'),
(33, 36, 'attachments/pnWOE8mVl8d00K6nDipQC0ncCmud5SoEzLuwRV1j.png', '2025-02-02 00:40:47', '2025-02-02 00:40:47'),
(34, 37, 'attachments/o3y7Ff13jyw7GGH3Pnh1oikwMtn97tzqeyj4ZdN3.jpg', '2025-02-02 19:05:26', '2025-02-02 19:05:26'),
(35, 37, 'attachments/x3AdBEJtCtQ2ghnCVE4Ah0K8DKOibGKOI0GSyG1Y.jpg', '2025-02-02 19:10:22', '2025-02-02 19:10:22'),
(36, 13, 'attachments/KLea9hJYhQ98ID6mhwbPExJYKFO1L4yigUFwrleJ.jpg', '2025-02-03 09:43:18', '2025-02-03 09:43:18'),
(37, 13, 'attachments/8wi7ABzADh0Cbb7PdIUkdN0YLZ95RuSZH6JKWLAU.png', '2025-02-03 09:44:02', '2025-02-03 09:44:02'),
(38, 38, 'attachments/Zr1oI7tEMVuCa5SUm9J1JTh9VGZVG3XwbWPCyGGJ.jpg', '2025-02-03 20:49:26', '2025-02-03 20:49:26'),
(39, 38, 'attachments/834VvEu5YKCnYUOl5ahUGY6n1F8bgUkhgRnHi4n5.png', '2025-02-03 20:50:14', '2025-02-03 20:50:14'),
(40, 38, 'attachments/iaDz6c3ICoS6fPcPgfc51kge5BkhzHib7JuHv6Te.jpg', '2025-02-03 21:08:13', '2025-02-03 21:08:13'),
(41, 1, 'attachments/xs6JWZZ5cqXvtJLgv5qBjEzh5oov5mylRFz9Ao6l.jpg', '2025-02-04 17:54:32', '2025-02-04 17:54:32'),
(42, 1, 'attachments/G256uR13CBGP7MEbhaskoSROFwwaAINsN8RvtKDT.png', '2025-02-04 17:54:54', '2025-02-04 17:54:54'),
(43, 129, 'attachments/qJzSft2bgrjE3EcfPFXgCJOUCaYSZafIM1J9hGWe.jpg', '2025-02-15 23:09:41', '2025-02-15 23:09:41'),
(44, 129, 'attachments/V8L5i6QecJIAiDRtKNzwEYtjfxzLyDXyvcudXTdC.jpg', '2025-02-15 23:09:41', '2025-02-15 23:09:41'),
(45, 129, 'attachments/QYhfGnfmtVepJ2CWTs6N8uZxj4yzXne8ocRpnF9p.jpg', '2025-02-15 23:09:41', '2025-02-15 23:09:41'),
(46, 129, 'attachments/shipment_1739650293_0.png', '2025-02-15 23:11:33', '2025-02-15 23:11:33'),
(47, 191, 'attachments/T92VUDCRUZtulf4ijq4YjoprFvGorcPdRWRJBwaU.pdf', '2025-03-01 05:32:00', '2025-03-01 05:32:00'),
(48, 191, 'attachments/shipment_1740796320_0.png', '2025-03-01 05:32:01', '2025-03-01 05:32:01'),
(49, 194, 'attachments/mC8wcb0NmPgCVv38bBTAKUbXdvjahGtsQdXuAEAZ.png', '2025-03-03 07:02:10', '2025-03-03 07:02:10'),
(50, 194, 'attachments/shipment_1741003890_0.png', '2025-03-03 15:11:30', '2025-03-03 15:11:30'),
(51, 196, 'attachments/iildsq8t1m77VKSbsBfPLG9b3oiO3IyPZr5gMLyp.jpg', '2025-03-03 20:10:48', '2025-03-03 20:10:48'),
(52, 203, 'attachments/TQXRBXw1pzDadPsN2LUPDbHnQQFeXsX6hzwhbkVX.jpg', '2025-03-03 22:59:19', '2025-03-03 22:59:19'),
(53, 204, 'attachments/TVYBLgEkjZZdZ79DfYRSobeqcc7E6DKFBLhKH3xd.pdf', '2025-03-04 00:11:43', '2025-03-04 00:11:43'),
(54, 204, 'attachments/shipment_1741036303_0.png', '2025-03-04 00:11:43', '2025-03-04 00:11:43'),
(55, 205, 'attachments/shipment_1741037865_0.png', '2025-03-04 00:37:45', '2025-03-04 00:37:45'),
(57, 226, 'attachments/shipment_1741604361_0.png', '2025-03-10 13:59:21', '2025-03-10 13:59:21'),
(58, 226, 'attachments/shipment_1741604361_1.png', '2025-03-10 13:59:21', '2025-03-10 13:59:21'),
(59, 226, 'attachments/shipment_1741604361_2.png', '2025-03-10 13:59:22', '2025-03-10 13:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `shipment_settings`
--

CREATE TABLE `shipment_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipment_settings`
--

INSERT INTO `shipment_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'def_tax', '0', NULL, NULL),
(2, 'def_insurance', '0', NULL, NULL),
(3, 'def_return_cost', '0', NULL, NULL),
(4, 'def_shipping_cost_gram', '0', NULL, NULL),
(5, 'def_shipping_cost', '0', NULL, NULL),
(6, 'def_tax_gram', '0', NULL, NULL),
(7, 'def_insurance_gram', '0', NULL, NULL),
(8, 'def_return_cost_gram', '0', NULL, NULL),
(9, 'latest_shipment_count', '10', NULL, NULL),
(10, 'is_date_required', '1', NULL, NULL),
(11, 'def_shipping_date', '0', NULL, NULL),
(12, 'shipment_prefix_lo', 'WR', NULL, NULL),
(13, 'shipment_prefix_ex', 'VM', NULL, NULL),
(14, 'mission_prefix_air', 'AIR', NULL, NULL),
(15, 'mission_prefix_sea', 'OCEAN', NULL, NULL),
(16, 'is_def_mile_or_fees', '2', NULL, NULL),
(17, 'def_pickup_cost', '0', NULL, NULL),
(18, 'def_supply_cost', '0', NULL, NULL),
(19, 'def_mile_cost', '0', NULL, NULL),
(20, 'def_return_mile_cost', '0', NULL, NULL),
(21, 'def_mile_cost_gram', '0', NULL, NULL),
(22, 'def_return_mile_cost_gram', '0', NULL, NULL),
(23, 'mission_done_with_fees_received', '1', NULL, NULL),
(24, 'show_register_in_driver_app', '1', NULL, NULL),
(25, 'is_shipping_calc_required', '0', NULL, NULL),
(26, 'def_shipment_type', '1', NULL, NULL),
(27, 'def_shipment_code_type', 'sequential', NULL, NULL),
(28, 'def_shipment_conf_type', 'none', NULL, NULL),
(29, 'default_shipment_code_number_type', 'random', NULL, NULL),
(30, 'receiving_mission_confirmation_type', 'none', NULL, NULL),
(31, 'def_package_type', NULL, NULL, NULL),
(32, 'def_branch', NULL, NULL, NULL),
(33, 'def_payment_method', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `fips_code` varchar(255) DEFAULT NULL,
  `iso2` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT 1,
  `wikiDataId` varchar(255) DEFAULT NULL,
  `covered` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `country_id`, `country_code`, `fips_code`, `iso2`, `latitude`, `longitude`, `flag`, `wikiDataId`, `covered`, `created_at`, `updated_at`) VALUES
(264, 'Belize District', 23, 'BZ', '01', 'BZ', 17.56776790, -88.40160410, 1, 'Q506056', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(265, 'Stann Creek District', 23, 'BZ', '05', 'SC', 16.81166310, -88.40160410, 1, 'Q502652', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(266, 'Corozal District', 23, 'BZ', '03', 'CZL', 18.13492380, -88.24611830, 1, 'Q512273', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(267, 'Toledo District', 23, 'BZ', '06', 'TOL', 16.24919230, -88.86469800, 1, 'Q506049', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(268, 'Orange Walk District', 23, 'BZ', '04', 'OW', 17.76035300, -88.86469800, 1, 'Q506036', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(269, 'Cayo District', 23, 'BZ', '02', 'CY', 17.09844450, -88.94138650, 1, 'Q508773', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(272, 'Havana Province', 56, 'CU', '02', '03', 23.05406980, -82.34518900, 1, 'Q12588', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(273, 'Santiago de Cuba Province', 56, 'CU', '15', '13', 20.23976820, -75.99276520, 1, 'Q234200', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(274, 'Sancti Spíritus Province', 56, 'CU', '14', '07', 21.99382140, -79.47038850, 1, 'Q115441', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(275, 'Granma Province', 56, 'CU', '09', '12', 20.38449020, -76.64127120, 1, 'Q115046', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(276, 'Mayabeque Province', 56, 'CU', 'MA', '16', 22.89265290, -81.95348150, 1, 'Q115310', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(277, 'Pinar del Río Province', 56, 'CU', '01', '01', 22.40762560, -83.84730150, 1, 'Q115497', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(278, 'Isla de la Juventud', 56, 'CU', '04', '99', 21.70847370, -82.82202320, 1, 'Q115027', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(279, 'Holguín Province', 56, 'CU', '12', '11', 20.78378930, -75.80690820, 1, 'Q115302', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(280, 'Villa Clara Province', 56, 'CU', '16', '05', 22.49372040, -79.91927020, 1, 'Q115434', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(281, 'Las Tunas Province', 56, 'CU', '13', '10', 21.06051620, -76.91820970, 1, 'Q115334', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(282, 'Ciego de Ávila Province', 56, 'CU', '07', '08', 21.93295150, -78.56608520, 1, 'Q220692', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(283, 'Artemisa Province', 56, 'CU', 'AR', '15', 22.75229030, -82.99316070, 1, 'Q115325', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(284, 'Matanzas Province', 56, 'CU', '03', '04', 22.57671230, -81.33994140, 1, 'Q115438', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(285, 'Guantánamo Province', 56, 'CU', '10', '14', 20.14559170, -74.87410450, 1, 'Q115319', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(286, 'Camagüey Province', 56, 'CU', '05', '09', 21.21672470, -77.74520810, 1, 'Q215147', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(287, 'Cienfuegos Province', 56, 'CU', '08', '06', 22.23797830, -80.36586500, 1, 'Q115444', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(866, 'Ontario', 39, 'CA', '08', 'ON', 51.25377500, -85.32321400, 1, 'Q1904', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(867, 'Manitoba', 39, 'CA', '03', 'MB', 53.76086080, -98.81387620, 1, 'Q1948', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(868, 'New Brunswick', 39, 'CA', '04', 'NB', 46.56531630, -66.46191640, 1, 'Q1965', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(869, 'Yukon', 39, 'CA', '12', 'YT', 35.50672150, -97.76254410, 1, 'Q2009', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(870, 'Saskatchewan', 39, 'CA', '11', 'SK', 52.93991590, -106.45086390, 1, 'Q1989', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(871, 'Prince Edward Island', 39, 'CA', '09', 'PE', 46.51071200, -63.41681360, 1, 'Q1979', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(872, 'Alberta', 39, 'CA', '01', 'AB', 53.93327060, -116.57650350, 1, 'Q1951', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(873, 'Quebec', 39, 'CA', '10', 'QC', 52.93991590, -73.54913610, 1, 'Q176', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(874, 'Nova Scotia', 39, 'CA', '07', 'NS', 44.68198660, -63.74431100, 1, 'Q1952', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(875, 'British Columbia', 39, 'CA', '02', 'BC', 53.72666830, -127.64762050, 1, 'Q1974', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(876, 'Nunavut', 39, 'CA', '14', 'NU', 70.29977110, -83.10757700, 1, 'Q2023', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(877, 'Newfoundland and Labrador', 39, 'CA', '05', 'NL', 53.13550910, -57.66043640, 1, 'Q2003', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(878, 'Northwest Territories', 39, 'CA', '13', 'NT', 64.82554410, -124.84573340, 1, 'Q2007', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(940, 'Chontales Department', 159, 'NI', '04', 'CO', 11.93947170, -85.18940450, 1, 'Q498443', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(941, 'Managua Department', 159, 'NI', '10', 'MN', 12.13916990, -86.33767610, 1, 'Q260009', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(942, 'Rivas Department', 159, 'NI', '15', 'RI', 11.40234900, -85.68457800, 1, 'Q728127', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(943, 'Granada Department', 159, 'NI', '06', 'GR', 11.93440730, -85.95600050, 1, 'Q258405', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(944, 'León Department', 159, 'NI', '08', 'LE', 12.50920370, -86.66110830, 1, 'Q586818', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(945, 'Estelí Department', 159, 'NI', '05', 'ES', 13.08511390, -86.36301970, 1, 'Q728015', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(946, 'Boaco Department', 159, 'NI', '01', 'BO', 12.46928400, -85.66146820, 1, 'Q280973', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(947, 'Matagalpa Department', 159, 'NI', '12', 'MT', 12.94984360, -85.43755740, 1, 'Q728099', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(948, 'Madriz Department', 159, 'NI', '09', 'MD', 13.47260050, -86.45920910, 1, 'Q728056', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(949, 'Río San Juan Department', 159, 'NI', '14', 'SJ', 11.47816100, -84.77333250, 1, 'Q728155', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(950, 'Carazo Department', 159, 'NI', '02', 'CA', 11.72747290, -86.21584970, 1, 'Q461133', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(951, 'North Caribbean Coast Autonomous Region', 159, 'NI', '17', 'AN', 13.83944560, -83.93208060, 1, 'Q498452', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(952, 'South Caribbean Coast Autonomous Region', 159, 'NI', '18', 'AS', 12.19185020, -84.10128610, 1, 'Q291279', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(953, 'Masaya Department', 159, 'NI', '11', 'MS', 11.97593280, -86.07334980, 1, 'Q570358', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(954, 'Chinandega Department', 159, 'NI', '03', 'CI', 12.88200620, -87.14228950, 1, 'Q644024', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(955, 'Jinotega Department', 159, 'NI', '07', 'JI', 13.08839070, -85.99939970, 1, 'Q728120', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1209, 'Guanacaste Province', 53, 'CR', '03', 'G', 10.62673990, -85.44367060, 1, 'Q690026', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1210, 'Puntarenas Province', 53, 'CR', '07', 'P', 9.21695310, -83.33618800, 1, 'Q502170', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1211, 'Provincia de Cartago', 53, 'CR', '02', 'C', 9.86223110, -83.92141870, 1, 'Q502181', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1212, 'Heredia Province', 53, 'CR', '04', 'H', 10.47352300, -84.01674230, 1, 'Q502192', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1213, 'Limón Province', 53, 'CR', '06', 'L', 9.98963980, -83.03324170, 1, 'Q642644', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1214, 'San José Province', 53, 'CR', '08', 'SJ', 9.91297270, -84.07682940, 1, 'Q647808', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1215, 'Alajuela Province', 53, 'CR', '01', 'A', 10.39158300, -84.43827210, 1, 'Q502188', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1220, 'Saint Philip', 20, 'BB', '10', '10', 35.23311400, -89.43640420, 1, 'Q1647436', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1221, 'Saint Lucy', 20, 'BB', '07', '07', 38.76146250, -77.44914390, 1, 'Q1647447', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1222, 'Saint Peter', 20, 'BB', '09', '09', 37.08271190, -94.51712500, 1, 'Q932723', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1223, 'Saint Joseph', 20, 'BB', '06', '06', 39.76745780, -94.84668100, 1, 'Q550249', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1224, 'Saint James', 20, 'BB', '04', '04', 48.52356600, -1.32378850, 1, 'Q592141', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1225, 'Saint Thomas', 20, 'BB', '11', '11', 18.33809650, -64.89409460, 1, 'Q1647432', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1226, 'Saint George', 20, 'BB', '03', '03', 37.09652780, -113.56841640, 1, 'Q1647443', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1227, 'Saint John', 20, 'BB', '05', '05', 45.27331530, -66.06330800, 1, 'Q1626540', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1228, 'Christ Church', 20, 'BB', '01', '01', 36.00604070, -95.92112100, 1, 'Q1626524', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1229, 'Saint Andrew', 20, 'BB', '02', '02', NULL, NULL, 1, 'Q1647439', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1230, 'Saint Michael', 20, 'BB', '08', '08', 36.03597700, -95.84905200, 1, 'Q819170', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1385, 'Darién Province', 170, 'PA', '05', '5', 7.86817130, -77.83672820, 1, 'Q688660', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1386, 'Colón Province', 170, 'PA', '04', '3', 9.18519890, -80.05349230, 1, 'Q820514', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1387, 'Coclé Province', 170, 'PA', '03', '2', 8.62660680, -80.36586500, 1, 'Q825799', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1388, 'Guna Yala', 170, 'PA', '09', 'KY', 9.23443950, -78.19262500, 1, 'Q919017', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1389, 'Herrera Province', 170, 'PA', '06', '6', 7.77042820, -80.72144170, 1, 'Q842886', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1390, 'Los Santos Province', 170, 'PA', '07', '7', 7.59093020, -80.36586500, 1, 'Q911278', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1391, 'Ngöbe-Buglé Comarca', 170, 'PA', '12', 'NB', 8.65958330, -81.77870210, 1, 'Q1129783', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1392, 'Veraguas Province', 170, 'PA', '10', '9', 8.12310330, -81.07546570, 1, 'Q593137', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1393, 'Bocas del Toro Province', 170, 'PA', '01', '1', 9.41655210, -82.52077870, 1, 'Q217138', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1394, 'Panamá Oeste Province', 170, 'PA', '13', '10', 9.11967510, -79.29021330, 1, 'Q16250688', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1395, 'Panamá Province', 170, 'PA', '08', '8', 9.11967510, -79.29021330, 1, 'Q557506', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1396, 'Emberá-Wounaan Comarca', 170, 'PA', '11', 'EM', 8.37669830, -77.65361250, 1, 'Q1141041', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1397, 'Chiriquí Province', 170, 'PA', '02', '4', 8.58489800, -82.38857830, 1, 'Q739651', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1398, 'Howland Island', 233, 'US', 'HQ', 'UM-84', 0.81132190, -176.61827360, 1, 'Q131305', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1399, 'Delaware', 233, 'US', '10', 'DE', 38.91083250, -75.52766990, 1, 'Q1393', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1400, 'Alaska', 233, 'US', '02', 'AK', 64.20084130, -149.49367330, 1, 'Q797', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1401, 'Maryland', 233, 'US', '24', 'MD', 39.04575490, -76.64127120, 1, 'Q1391', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1402, 'Baker Island', 233, 'US', 'FQ', 'UM-81', 0.19362660, -176.47690800, 1, 'Q46879', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1403, 'Kingman Reef', 233, 'US', 'KQ', 'UM-89', 6.38333300, -162.41666700, 1, 'Q130895', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1404, 'New Hampshire', 233, 'US', '33', 'NH', 43.19385160, -71.57239530, 1, 'Q759', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1405, 'Wake Island', 233, 'US', 'WQ', 'UM-79', 19.27961900, 166.64993480, 1, 'Q43296', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1406, 'Kansas', 233, 'US', '20', 'KS', 39.01190200, -98.48424650, 1, 'Q1558', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1407, 'Texas', 233, 'US', '48', 'TX', 31.96859880, -99.90181310, 1, 'Q1439', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1408, 'Nebraska', 233, 'US', '31', 'NE', 41.49253740, -99.90181310, 1, 'Q1553', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1409, 'Vermont', 233, 'US', '50', 'VT', 44.55880280, -72.57784150, 1, 'Q16551', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1410, 'Jarvis Island', 233, 'US', 'DQ', 'UM-86', -0.37435030, -159.99672060, 1, 'Q62218', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1411, 'Hawaii', 233, 'US', '15', 'HI', 19.89676620, -155.58278180, 1, 'Q782', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1412, 'Guam', 233, 'US', 'GQ', 'GU', 13.44430400, 144.79373100, 1, 'Q16635', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1413, 'United States Virgin Islands', 233, 'US', 'VQ', 'VI', 18.33576500, -64.89633500, 1, 'Q11703', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1414, 'Utah', 233, 'US', '49', 'UT', 39.32098010, -111.09373110, 1, 'Q829', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1415, 'Oregon', 233, 'US', '41', 'OR', 43.80413340, -120.55420120, 1, 'Q824', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1416, 'California', 233, 'US', '06', 'CA', 36.77826100, -119.41793240, 1, 'Q99', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1417, 'New Jersey', 233, 'US', '34', 'NJ', 40.05832380, -74.40566120, 1, 'Q1408', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1418, 'North Dakota', 233, 'US', '38', 'ND', 47.55149260, -101.00201190, 1, 'Q1207', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1419, 'Kentucky', 233, 'US', '21', 'KY', 37.83933320, -84.27001790, 1, 'Q1603', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1420, 'Minnesota', 233, 'US', '27', 'MN', 46.72955300, -94.68589980, 1, 'Q1527', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1421, 'Oklahoma', 233, 'US', '40', 'OK', 35.46756020, -97.51642760, 1, 'Q1649', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1422, 'Pennsylvania', 233, 'US', '42', 'PA', 41.20332160, -77.19452470, 1, 'Q1400', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1423, 'New Mexico', 233, 'US', '35', 'NM', 34.51994020, -105.87009010, 1, 'Q1522', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1424, 'American Samoa', 233, 'US', 'AQ', 'AS', -14.27097200, -170.13221700, 1, 'Q16641', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1425, 'Illinois', 233, 'US', '17', 'IL', 40.63312490, -89.39852830, 1, 'Q1204', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1426, 'Michigan', 233, 'US', '26', 'MI', 44.31484430, -85.60236430, 1, 'Q1166', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1427, 'Virginia', 233, 'US', '51', 'VA', 37.43157340, -78.65689420, 1, 'Q1370', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1428, 'Johnston Atoll', 233, 'US', 'JQ', 'UM-67', 16.72950350, -169.53364770, 1, 'Q131008', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1429, 'West Virginia', 233, 'US', '54', 'WV', 38.59762620, -80.45490260, 1, 'Q1371', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1430, 'Mississippi', 233, 'US', '28', 'MS', 32.35466790, -89.39852830, 1, 'Q1494', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1431, 'Northern Mariana Islands', 233, 'US', 'CQ', 'MP', 15.09790000, 145.67390000, 1, 'Q16644', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1432, 'United States Minor Outlying Islands', 233, 'US', 'CQ', 'UM', 19.28231920, 166.64704700, 1, 'Q16645', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1433, 'Massachusetts', 233, 'US', '25', 'MA', 42.40721070, -71.38243740, 1, 'Q771', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1434, 'Arizona', 233, 'US', '04', 'AZ', 34.04892810, -111.09373110, 1, 'Q816', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1435, 'Connecticut', 233, 'US', '09', 'CT', 41.60322070, -73.08774900, 1, 'Q779', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1436, 'Florida', 233, 'US', '12', 'FL', 27.66482740, -81.51575350, 1, 'Q812', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1437, 'District of Columbia', 233, 'US', '11', 'DC', 38.90719230, -77.03687070, 1, 'Q3551781', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1438, 'Midway Atoll', 233, 'US', 'MQ', 'UM-71', 28.20721680, -177.37349260, 1, 'Q47863', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1439, 'Navassa Island', 233, 'US', 'BQ', 'UM-76', 18.41006890, -75.01146120, 1, 'Q25359', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1440, 'Indiana', 233, 'US', '18', 'IN', 40.26719410, -86.13490190, 1, 'Q1415', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1441, 'Wisconsin', 233, 'US', '55', 'WI', 43.78443970, -88.78786780, 1, 'Q1537', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1442, 'Wyoming', 233, 'US', '56', 'WY', 43.07596780, -107.29028390, 1, 'Q1214', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1443, 'South Carolina', 233, 'US', '45', 'SC', 33.83608100, -81.16372450, 1, 'Q1456', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1444, 'Arkansas', 233, 'US', '05', 'AR', 35.20105000, -91.83183340, 1, 'Q1612', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1445, 'South Dakota', 233, 'US', '46', 'SD', 43.96951480, -99.90181310, 1, 'Q1211', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1446, 'Montana', 233, 'US', '30', 'MT', 46.87968220, -110.36256580, 1, 'Q1212', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1447, 'North Carolina', 233, 'US', '37', 'NC', 35.75957310, -79.01929970, 1, 'Q1454', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1448, 'Palmyra Atoll', 233, 'US', 'LQ', 'UM-95', 5.88850260, -162.07866560, 1, 'Q123076', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1449, 'Puerto Rico', 233, 'US', 'RQ', 'PR', 18.22083300, -66.59014900, 1, 'Q1183', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1450, 'Colorado', 233, 'US', '08', 'CO', 39.55005070, -105.78206740, 1, 'Q1261', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1451, 'Missouri', 233, 'US', '29', 'MO', 37.96425290, -91.83183340, 1, 'Q1581', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1452, 'New York', 233, 'US', '36', 'NY', 40.71277530, -74.00597280, 1, 'Q1384', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1453, 'Maine', 233, 'US', '23', 'ME', 45.25378300, -69.44546890, 1, 'Q724', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1454, 'Tennessee', 233, 'US', '47', 'TN', 35.51749130, -86.58044730, 1, 'Q1509', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1455, 'Georgia', 233, 'US', '13', 'GA', 32.16562210, -82.90007510, 1, 'Q1428', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1456, 'Alabama', 233, 'US', '01', 'AL', 32.31823140, -86.90229800, 1, 'Q173', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1457, 'Louisiana', 233, 'US', '22', 'LA', 30.98429770, -91.96233270, 1, 'Q1588', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1458, 'Nevada', 233, 'US', '32', 'NV', 38.80260970, -116.41938900, 1, 'Q1227', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1459, 'Iowa', 233, 'US', '19', 'IA', 41.87800250, -93.09770200, 1, 'Q1546', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1460, 'Idaho', 233, 'US', '16', 'ID', 44.06820190, -114.74204080, 1, 'Q1221', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1461, 'Rhode Island', 233, 'US', '44', 'RI', 41.58009450, -71.47742910, 1, 'Q1387', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1462, 'Washington', 233, 'US', '53', 'WA', 47.75107410, -120.74013850, 1, 'Q1223', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1997, 'Rio de Janeiro', 31, 'BR', '21', 'RJ', -22.90684670, -43.17289650, 1, 'Q41428', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1998, 'Minas Gerais', 31, 'BR', '15', 'MG', -18.51217800, -44.55503080, 1, 'Q39109', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(1999, 'Amapá', 31, 'BR', '03', 'AP', 0.90199250, -52.00295650, 1, 'Q40130', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2000, 'Goiás', 31, 'BR', '29', 'GO', -15.82703690, -49.83622370, 1, 'Q41587', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2001, 'Rio Grande do Sul', 31, 'BR', '23', 'RS', -30.03463160, -51.21769860, 1, 'Q40030', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2002, 'Bahia', 31, 'BR', '05', 'BA', 26.11353900, -80.10620400, 1, 'Q40430', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2003, 'Sergipe', 31, 'BR', '28', 'SE', -10.57409340, -37.38565810, 1, 'Q43783', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2004, 'Amazonas', 31, 'BR', '04', 'AM', NULL, NULL, 1, 'Q40040', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2005, 'Paraíba', 31, 'BR', '17', 'PB', -7.23996090, -36.78195050, 1, 'Q38088', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2006, 'Pernambuco', 31, 'BR', '30', 'PE', -8.81371730, -36.95410700, 1, 'Q40942', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2007, 'Alagoas', 31, 'BR', '02', 'AL', -9.57130580, -36.78195050, 1, 'Q40885', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2008, 'Piauí', 31, 'BR', '20', 'PI', -7.71834010, -42.72892360, 1, 'Q42722', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2009, 'Pará', 31, 'BR', '16', 'PA', -1.99812710, -54.93061520, 1, 'Q39517', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2010, 'Mato Grosso do Sul', 31, 'BR', '11', 'MS', -20.77222950, -54.78515310, 1, 'Q43319', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2011, 'Mato Grosso', 31, 'BR', '14', 'MT', -12.68187120, -56.92109900, 1, 'Q42824', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2012, 'Acre', 31, 'BR', '01', 'AC', 32.93305200, 35.08267800, 1, 'Q40780', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2013, 'Rondônia', 31, 'BR', '24', 'RO', -11.50573410, -63.58061100, 1, 'Q43235', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2014, 'Santa Catarina', 31, 'BR', '26', 'SC', NULL, NULL, 1, 'Q41115', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2015, 'Maranhão', 31, 'BR', '13', 'MA', -4.96094980, -45.27441590, 1, 'Q42362', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2016, 'Ceará', 31, 'BR', '06', 'CE', -5.49839770, -39.32062410, 1, 'Q40123', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2017, 'Federal District', 31, 'BR', '07', 'DF', -15.79976540, -47.86447150, 1, 'Q119158', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2018, 'Espírito Santo', 31, 'BR', '08', 'ES', -19.18342290, -40.30886260, 1, 'Q43233', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2019, 'Rio Grande do Norte', 31, 'BR', '22', 'RN', -5.40258030, -36.95410700, 1, 'Q43255', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2020, 'Tocantins', 31, 'BR', '31', 'TO', -10.17528000, -48.29824740, 1, 'Q43695', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2021, 'São Paulo', 31, 'BR', '27', 'SP', -23.55051990, -46.63330940, 1, 'Q175', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2022, 'Paraná', 31, 'BR', '18', 'PR', -25.25208880, -52.02154150, 1, 'Q15499', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2034, 'Cojedes', 239, 'VE', '08', 'H', 9.38166820, -68.33392750, 1, 'Q205460', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2035, 'Falcón', 239, 'VE', '11', 'I', 11.18106740, -69.85974060, 1, 'Q202071', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2036, 'Portuguesa', 239, 'VE', '18', 'P', 9.09439990, -69.09702300, 1, 'Q205784', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2037, 'Miranda', 239, 'VE', '15', 'M', 42.35193830, -71.52907660, 1, 'Q191174', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2038, 'Lara', 239, 'VE', '13', 'K', 33.98221650, -118.13227470, 1, 'Q205796', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2039, 'Bolívar', 239, 'VE', '06', 'F', 37.61448380, -93.41047490, 1, 'Q191164', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2040, 'Carabobo', 239, 'VE', '07', 'G', 10.11764330, -68.04775090, 1, 'Q191186', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2041, 'Yaracuy', 239, 'VE', '22', 'U', 10.33938900, -68.81088490, 1, 'Q201121', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2042, 'Zulia', 239, 'VE', '23', 'V', 10.29102370, -72.14161320, 1, 'Q43269', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2043, 'Trujillo', 239, 'VE', '21', 'T', 36.67343430, -121.62875880, 1, 'Q202068', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2044, 'Amazonas', 239, 'VE', '01', 'Z', -3.41684270, -65.85606460, 1, 'Q170453', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2045, 'Guárico', 239, 'VE', '12', 'J', 8.74893090, -66.23671720, 1, 'Q202075', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2046, 'Federal Dependencies of Venezuela', 239, 'VE', '24', 'W', 10.93770530, -65.35695730, 1, 'Q130343', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2047, 'Aragua', 239, 'VE', '04', 'D', 10.06357580, -67.28478750, 1, 'Q190687', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2048, 'Táchira', 239, 'VE', '20', 'S', 7.91370010, -72.14161320, 1, 'Q41144', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2049, 'Barinas', 239, 'VE', '05', 'E', 8.62314980, -70.23710450, 1, 'Q43271', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2050, 'Anzoátegui', 239, 'VE', '02', 'B', 8.59130730, -63.95861110, 1, 'Q190922', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2051, 'Delta Amacuro', 239, 'VE', '09', 'Y', 8.84993070, -61.14031960, 1, 'Q201137', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2052, 'Nueva Esparta', 239, 'VE', '17', 'O', 10.99707230, -63.91132960, 1, 'Q204876', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2053, 'Mérida', 239, 'VE', '14', 'L', 20.96737020, -89.59258570, 1, 'Q165582', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2054, 'Monagas', 239, 'VE', '16', 'N', 9.32416520, -63.01475780, 1, 'Q205776', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2055, 'Vargas', 239, 'VE', '26', 'X', 29.30522680, -94.79138540, 1, 'Q205843', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2056, 'Sucre', 239, 'VE', '19', 'R', -19.03534500, -65.25921280, 1, 'Q205824', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2760, 'Cuyuni-Mazaruni', 94, 'GY', '11', 'CU', 6.46421410, -60.21107520, 1, 'Q1146777', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2761, 'Potaro-Siparuni', 94, 'GY', '17', 'PT', 4.78558530, -59.28799770, 1, 'Q1454035', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2762, 'Mahaica-Berbice', 94, 'GY', '15', 'MA', 6.23849600, -57.91625550, 1, 'Q1466671', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2763, 'Upper Demerara-Berbice', 94, 'GY', '18', 'UD', 5.30648790, -58.18929210, 1, 'Q1309042', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2764, 'Barima-Waini', 94, 'GY', '10', 'BA', 7.48824190, -59.65644940, 1, 'Q537740', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2765, 'Pomeroon-Supenaam', 94, 'GY', '16', 'PM', 7.12941660, -58.92062950, 1, 'Q680382', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2766, 'East Berbice-Corentyne', 94, 'GY', '13', 'EB', 2.74779220, -57.46272590, 1, 'Q1277758', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2767, 'Demerara-Mahaica', 94, 'GY', '12', 'DE', 6.54642600, -58.09820460, 1, 'Q1185362', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2768, 'Essequibo Islands-West Demerara', 94, 'GY', '14', 'ES', 6.57201320, -58.46299970, 1, 'Q1368802', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2769, 'Upper Takutu-Upper Essequibo', 94, 'GY', '19', 'UT', 2.92395950, -58.73736340, 1, 'Q1516381', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2770, 'Presidente Hayes Department', 172, 'PY', '16', '15', -23.35126050, -58.73736340, 1, 'Q750551', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2771, 'Canindeyú', 172, 'PY', '19', '14', -24.13787350, -55.66896360, 1, 'Q279085', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2772, 'Guairá Department', 172, 'PY', '10', '4', -25.88109320, -56.29293810, 1, 'Q755116', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2773, 'Caaguazú', 172, 'PY', '04', '5', -25.46458180, -56.01385100, 1, 'Q880399', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2774, 'Paraguarí Department', 172, 'PY', '15', '9', -25.62621740, -57.15206420, 1, 'Q240014', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2775, 'Caazapá', 172, 'PY', '05', '6', -26.18277130, -56.37123270, 1, 'Q881839', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2776, 'San Pedro Department', 172, 'PY', '17', '2', -24.19486680, -56.56164700, 1, 'Q526176', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2777, 'Central Department', 172, 'PY', '06', '11', 36.15592290, -95.96620750, 1, 'Q372461', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2778, 'Itapúa', 172, 'PY', '11', '7', -26.79236230, -55.66896360, 1, 'Q222564', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2779, 'Concepción Department', 172, 'PY', '07', '1', -23.42142640, -57.43444510, 1, 'Q741009', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2780, 'Boquerón Department', 172, 'PY', '24', '19', -21.74492540, -60.95400730, 1, 'Q741017', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2781, 'Ñeembucú Department', 172, 'PY', '13', '12', -27.02991140, -57.82539500, 1, 'Q755115', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2782, 'Amambay Department', 172, 'PY', '02', '13', -22.55902720, -56.02499820, 1, 'Q686586', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2783, 'Cordillera Department', 172, 'PY', '08', '3', -25.22894910, -57.01116810, 1, 'Q755121', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2784, 'Alto Paraná Department', 172, 'PY', '01', '10', -25.60755460, -54.96118360, 1, 'Q682654', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2785, 'Alto Paraguay Department', 172, 'PY', '23', '16', -20.08525080, -59.47209040, 1, 'Q682642', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2786, 'Misiones Department', 172, 'PY', '12', '8', -26.84335120, -57.10131880, 1, 'Q591194', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2823, 'Atacama Region', 44, 'CL', '05', 'AT', -27.56605580, -70.05031400, 1, 'Q2120', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2824, 'Santiago Metropolitan Region', 44, 'CL', '12', 'RM', -33.43755450, -70.65048960, 1, 'Q2131', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2825, 'Coquimbo Region', 44, 'CL', '07', 'CO', -30.54018100, -70.81199530, 1, 'Q2121', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2826, 'Araucanía Region', 44, 'CL', '04', 'AR', -38.94892100, -72.33111300, 1, 'Q2176', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2827, 'Bío Bío Region', 44, 'CL', '06', 'BI', -37.44644280, -72.14161320, 1, 'Q2170', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2828, 'Aysén Region', 44, 'CL', '02', 'AI', -46.37834500, -72.30076230, 1, 'Q2181', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2829, 'Arica y Parinacota Region', 44, 'CL', '16', 'AP', -18.59404850, -69.47845410, 1, 'Q2109', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2830, 'Valparaíso', 44, 'CL', '01', 'VS', -33.04723800, -71.61268850, 1, 'Q219458', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2831, 'Ñuble Region', 44, 'CL', '18', 'NB', -36.72257430, -71.76224810, 1, 'Q24076693', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2832, 'Antofagasta Region', 44, 'CL', '03', 'AN', -23.83691040, -69.28775350, 1, 'Q2118', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2833, 'Maule Region', 44, 'CL', '11', 'ML', -35.51636030, -71.57239530, 1, 'Q2166', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2834, 'Los Ríos Region', 44, 'CL', '17', 'LR', -40.23102170, -72.33111300, 1, 'Q2177', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2835, 'Los Lagos Region', 44, 'CL', '14', 'LL', -41.91977790, -72.14161320, 1, 'Q2178', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2836, 'Magellan and the Chilean Antarctic Region', 44, 'CL', '10', 'MA', -52.20643160, -72.16850010, 1, 'Q2189', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2837, 'Tarapacá Region', 44, 'CL', '15', 'TA', -20.20287990, -69.28775350, 1, 'Q2114', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2838, 'O\'Higgins', 44, 'CL', '08', 'LI', -34.57553740, -71.00223110, 1, 'Q2133', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2839, 'Commewijne District', 210, 'SR', '11', 'CM', 5.74021100, -54.87312190, 1, 'Q952510', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2840, 'Nickerie District', 210, 'SR', '14', 'NI', 5.58554690, -56.83111170, 1, 'Q1147515', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2841, 'Para District', 210, 'SR', '15', 'PR', 5.48173180, -55.22592070, 1, 'Q1140891', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2842, 'Coronie District', 210, 'SR', '12', 'CR', 5.69432710, -56.29293810, 1, 'Q1130141', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2843, 'Paramaribo District', 210, 'SR', '16', 'PM', 5.85203550, -55.20382780, 1, 'Q1130134', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2844, 'Wanica District', 210, 'SR', '19', 'WA', 5.73237620, -55.27012350, 1, 'Q1147524', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2845, 'Marowijne District', 210, 'SR', '13', 'MA', 5.62681280, -54.25931180, 1, 'Q1140897', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2846, 'Brokopondo District', 210, 'SR', '10', 'BR', 4.77102470, -55.04933750, 1, 'Q847680', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2847, 'Sipaliwini District', 210, 'SR', '18', 'SI', 3.65673820, -56.20353870, 1, 'Q1130138', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2848, 'Saramacca District', 210, 'SR', '17', 'SA', 5.72408130, -55.66896360, 1, 'Q1351157', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2874, 'Quindío Department', 48, 'CO', '23', 'QUI', 4.46101910, -75.66735600, 1, 'Q13995', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2875, 'Cundinamarca Department', 48, 'CO', '33', 'CUN', 5.02600300, -74.03001220, 1, 'Q232564', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2876, 'Chocó Department', 48, 'CO', '11', 'CHO', 5.25280330, -76.82596520, 1, 'Q230584', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2877, 'Norte de Santander Department', 48, 'CO', '21', 'NSA', 7.94628310, -72.89880690, 1, 'Q233058', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2878, 'Meta', 48, 'CO', '19', 'MET', 39.76732580, -104.97535950, 1, 'Q238629', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2879, 'Risaralda Department', 48, 'CO', '24', 'RIS', 5.31584750, -75.99276520, 1, 'Q13993', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2880, 'Atlántico Department', 48, 'CO', '04', 'ATL', 10.69661590, -74.87410450, 1, 'Q230882', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2881, 'Arauca Department', 48, 'CO', '03', 'ARA', 6.54730600, -71.00223110, 1, 'Q230223', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2882, 'Guainía Department', 48, 'CO', '15', 'GUA', 2.58539300, -68.52471490, 1, 'Q238645', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2883, 'Tolima Department', 48, 'CO', '28', 'TOL', 4.09251680, -75.15453810, 1, 'Q234501', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2884, 'Cauca Department', 48, 'CO', '09', 'CAU', 2.70498130, -76.82596520, 1, 'Q230602', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2885, 'Vaupés Department', 48, 'CO', '30', 'VAU', 0.85535610, -70.81199530, 1, 'Q234505', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2886, 'Magdalena Department', 48, 'CO', '38', 'MAG', 10.41130140, -74.40566120, 1, 'Q199910', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2887, 'Caldas Department', 48, 'CO', '37', 'CAL', 5.29826000, -75.24790610, 1, 'Q230607', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2888, 'Guaviare Department', 48, 'CO', '14', 'GUV', 2.04392400, -72.33111300, 1, 'Q272885', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2889, 'La Guajira Department', 48, 'CO', '17', 'LAG', 11.35477430, -72.52048270, 1, 'Q272747', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2890, 'Antioquia Department', 48, 'CO', '02', 'ANT', 7.19860640, -75.34121790, 1, 'Q123304', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2891, 'Caquetá Department', 48, 'CO', '08', 'CAQ', 0.86989200, -73.84190630, 1, 'Q13985', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2892, 'Casanare Department', 48, 'CO', '32', 'CAS', 5.75892690, -71.57239530, 1, 'Q13984', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2893, 'Bolívar Department', 48, 'CO', '35', 'BOL', 8.67043820, -74.03001220, 1, 'Q230597', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2894, 'Vichada Department', 48, 'CO', '31', 'VID', 4.42344520, -69.28775350, 1, 'Q268729', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2895, 'Amazonas Department', 48, 'CO', '01', 'AMA', -1.44291230, -71.57239530, 1, 'Q44724', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2896, 'Putumayo Department', 48, 'CO', '22', 'PUT', 0.43595060, -75.52766990, 1, 'Q232953', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2897, 'Nariño Department', 48, 'CO', '20', 'NAR', 1.28915100, -77.35794000, 1, 'Q230217', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2898, 'Córdoba Department', 48, 'CO', '12', 'COR', 8.04929300, -75.57405000, 1, 'Q234912', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2899, 'Cesar Department', 48, 'CO', '10', 'CES', 9.33729480, -73.65362090, 1, 'Q234916', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2900, 'Archipelago of Saint Andréws, Providence and Saint Catalina', 48, 'CO', '25', 'SAP', 12.55673240, -81.71852530, 1, 'Q26855', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2901, 'Santander Department', 48, 'CO', '26', 'SAN', 6.64370760, -73.65362090, 1, 'Q235166', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2902, 'Sucre Department', 48, 'CO', '27', 'SUC', 8.81397700, -74.72328300, 1, 'Q235188', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2903, 'Boyacá Department', 48, 'CO', '36', 'BOY', 5.45451100, -73.36200300, 1, 'Q121233', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2904, 'Valle del Cauca Department', 48, 'CO', '29', 'VAC', 3.80088930, -76.64127120, 1, 'Q13990', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2905, 'Galápagos Province', 64, 'EC', '01', 'W', -0.95376910, -90.96560190, 1, 'Q475038', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2906, 'Sucumbíos Province', 64, 'EC', '22', 'U', 0.08892310, -76.88975570, 1, 'Q499456', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2907, 'Pastaza Province', 64, 'EC', '17', 'Y', -1.48822650, -78.00310570, 1, 'Q214814', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2908, 'Tungurahua Province', 64, 'EC', '19', 'T', -1.26352840, -78.56608520, 1, 'Q504252', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2909, 'Zamora-Chinchipe Province', 64, 'EC', '20', 'Z', -4.06558920, -78.95035250, 1, 'Q744670', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2910, 'Los Ríos Province', 64, 'EC', '13', 'R', -1.02306070, -79.46088970, 1, 'Q504260', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2911, 'Imbabura Province', 64, 'EC', '11', 'I', 0.34997680, -78.12601290, 1, 'Q321863', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2912, 'Santa Elena Province', 64, 'EC', '25', 'SE', -2.22671050, -80.85949900, 1, 'Q1124125', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2913, 'Manabí Province', 64, 'EC', '14', 'M', -1.05434340, -80.45264400, 1, 'Q504666', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2914, 'Guayas Province', 64, 'EC', '10', 'G', -1.95748390, -79.91927020, 1, 'Q335464', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2915, 'Carchi Province', 64, 'EC', '05', 'C', 0.50269120, -77.90425210, 1, 'Q321729', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2916, 'Napo Province', 64, 'EC', '23', 'N', -0.99559640, -77.81296840, 1, 'Q211900', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2917, 'Cañar Province', 64, 'EC', '04', 'F', -2.55893150, -78.93881910, 1, 'Q335471', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2918, 'Morona-Santiago Province', 64, 'EC', '15', 'S', -2.30510620, -78.11468660, 1, 'Q549522', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2919, 'Santo Domingo de los Tsáchilas Province', 64, 'EC', '26', 'SD', -0.25218820, -79.18793830, 1, 'Q1123208', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2920, 'Bolívar Province', 64, 'EC', '03', 'B', -1.70958280, -79.04504290, 1, 'Q261165', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2921, 'Cotopaxi Province', 64, 'EC', '07', 'X', -0.83842060, -78.66626780, 1, 'Q241140', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2922, 'Esmeraldas', 64, 'EC', '09', 'E', 0.96817890, -79.65172020, 1, 'Q335526', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2923, 'Azuay Province', 64, 'EC', '02', 'A', -2.89430680, -78.99683440, 1, 'Q220451', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2924, 'El Oro Province', 64, 'EC', '08', 'O', -3.25924130, -79.95835410, 1, 'Q466019', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2925, 'Chimborazo Province', 64, 'EC', '06', 'H', -1.66479950, -78.65432550, 1, 'Q238492', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2926, 'Orellana Province', 64, 'EC', '24', 'D', -0.45451630, -76.99502860, 1, 'Q499475', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(2927, 'Pichincha Province', 64, 'EC', '18', 'P', -0.14648470, -78.47519450, 1, 'Q272586', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3203, 'Flores Department', 235, 'UY', '06', 'FS', -33.57337530, -56.89450280, 1, 'Q16578', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3204, 'San José Department', 235, 'UY', '16', 'SJ', 37.34929680, -121.90560490, 1, 'Q16579', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3205, 'Artigas Department', 235, 'UY', '01', 'AR', -30.61751120, -56.95945590, 1, 'Q16603', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3206, 'Maldonado Department', 235, 'UY', '09', 'MA', -34.55979320, -54.86285520, 1, 'Q331196', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3207, 'Rivera Department', 235, 'UY', '13', 'RV', -31.48174210, -55.24357590, 1, 'Q16609', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3208, 'Colonia Department', 235, 'UY', '04', 'CO', -34.12946780, -57.66051840, 1, 'Q16580', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3209, 'Durazno Department', 235, 'UY', '05', 'DU', -33.02324540, -56.02846440, 1, 'Q16591', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3210, 'Río Negro Department', 235, 'UY', '12', 'RN', -32.76763560, -57.42952070, 1, 'Q16596', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3211, 'Cerro Largo Department', 235, 'UY', '03', 'CL', -32.44110320, -54.35217530, 1, 'Q16575', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3212, 'Paysandú Department', 235, 'UY', '11', 'PA', -32.06673660, -57.33647890, 1, 'Q16576', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3213, 'Canelones Department', 235, 'UY', '02', 'CA', -34.54087170, -55.93076000, 1, 'Q16577', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3214, 'Treinta y Tres Department', 235, 'UY', '19', 'TT', -33.06850860, -54.28586270, 1, 'Q16610', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3215, 'Lavalleja Department', 235, 'UY', '08', 'LA', -33.92261750, -54.97657940, 1, 'Q460435', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3216, 'Rocha Department', 235, 'UY', '14', 'RO', -33.96900810, -54.02148500, 1, 'Q16582', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3217, 'Florida Department', 235, 'UY', '07', 'FD', 28.03594950, -82.45792890, 1, 'Q16593', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3218, 'Montevideo Department', 235, 'UY', '10', 'MO', -34.81815870, -56.21382560, 1, 'Q16594', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3219, 'Soriano Department', 235, 'UY', '17', 'SO', -33.51027920, -57.74981030, 1, 'Q16584', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3220, 'Salto Department', 235, 'UY', '15', 'SA', -31.38802800, -57.96124550, 1, 'Q16595', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3221, 'Tacuarembó Department', 235, 'UY', '18', 'TA', -31.72068370, -55.98598870, 1, 'Q16587', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3353, 'Western Tobago', 223, 'TT', '03', 'WTO', 11.18970720, -60.77954520, 1, 'Q13365874', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3354, 'Couva-Tabaquite-Talparo Regional Corporation', 223, 'TT', 'CTT', 'CTT', 10.42971450, -61.37352100, 1, 'Q2679127', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3355, 'Eastern Tobago', 223, 'TT', '11', 'ETO', 11.29793480, -60.55885240, 1, 'Q13365873', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3356, 'Rio Claro-Mayaro Regional Corporation', 223, 'TT', '11', 'MRC', 10.24128320, -61.09372060, 1, 'Q2487249', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3357, 'San Juan-Laventille Regional Corporation', 223, 'TT', 'SJL', 'SJL', 10.69085780, -61.45522130, 1, 'Q979608', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3358, 'Tunapuna-Piarco Regional Corporation', 223, 'TT', 'TUP', 'TUP', 10.68590960, -61.30352480, 1, 'Q1899163', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3359, 'San Fernando', 223, 'TT', '10', 'SFO', 34.28194610, -118.43897190, 1, 'Q1023712', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3360, 'Point Fortin', 223, 'TT', 'PTF', 'PTF', 10.17027370, -61.67133860, 1, 'Q786957', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3361, 'Sangre Grande Regional Corporation', 223, 'TT', 'SGE', 'SGE', 10.58529390, -61.13158130, 1, 'Q290292', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3362, 'Arima', 223, 'TT', '01', 'ARI', 46.79316040, -71.25843110, 1, 'Q661405', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3363, 'Port of Spain', 223, 'TT', '05', 'POS', 10.66031960, -61.50856250, 1, 'Q39178', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3364, 'Siparia Regional Corporation', 223, 'TT', 'SIP', 'SIP', 10.12456260, -61.56032440, 1, 'Q2679119', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3365, 'Penal-Debe Regional Corporation', 223, 'TT', 'PED', 'PED', 10.13374020, -61.44354740, 1, 'Q2056273', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3366, 'Chaguanas', 223, 'TT', 'CHA', 'CHA', 10.51683870, -61.41144820, 1, 'Q1444575', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3367, 'Diego Martin Regional Corporation', 223, 'TT', 'DMN', 'DMN', 10.73622860, -61.55448360, 1, 'Q2679107', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3368, 'Princes Town Regional Corporation', 223, 'TT', 'PRT', 'PRT', 10.17867460, -61.28019960, 1, 'Q2228167', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3375, 'Beni Department', 27, 'BO', '03', 'B', -14.37827470, -65.09577920, 1, 'Q233169', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3376, 'Oruro Department', 27, 'BO', '05', 'O', -18.57115790, -67.76159830, 1, 'Q1061368', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3377, 'Santa Cruz Department', 27, 'BO', '08', 'S', -16.74760370, -62.07509980, 1, 'Q235106', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3378, 'Tarija Department', 27, 'BO', '09', 'T', -21.58315950, -63.95861110, 1, 'Q233933', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3379, 'Pando Department', 27, 'BO', '06', 'N', -10.79889010, -66.99880110, 1, 'Q235362', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3380, 'La Paz Department', 27, 'BO', '04', 'L', NULL, NULL, 1, 'Q272784', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3381, 'Cochabamba Department', 27, 'BO', '02', 'C', -17.56816750, -65.47573600, 1, 'Q233917', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3382, 'Chuquisaca Department', 27, 'BO', '01', 'H', -20.02491440, -64.14782360, 1, 'Q235110', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3383, 'Potosí Department', 27, 'BO', '07', 'P', -20.62471300, -66.99880110, 1, 'Q238079', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3384, 'Saint George Parish', 188, 'VC', '04', '04', 42.95760900, -81.32670500, 1, 'Q2300294', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3385, 'Saint Patrick Parish', 188, 'VC', '05', '05', 39.75091860, -94.84505560, 1, 'Q1864637', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3386, 'Saint Andrew Parish', 188, 'VC', '02', '02', 43.02429990, -81.20250000, 1, 'Q2305115', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3387, 'Saint David Parish', 188, 'VC', '03', '03', 43.85230950, -79.52366540, 1, 'Q2412394', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3388, 'Grenadines Parish', 188, 'VC', '06', '06', 13.01229650, -61.22773010, 1, 'Q2545297', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3389, 'Charlotte Parish', 188, 'VC', '01', '01', 13.21754510, -61.16362440, 1, 'Q2075188', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3447, 'Chihuahua', 142, 'MX', '06', 'CHH', 28.63299570, -106.06910040, 1, 'Q655', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3448, 'Oaxaca', 142, 'MX', '20', 'OAX', 17.07318420, -96.72658890, 1, 'Q34110', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3449, 'Sinaloa', 142, 'MX', '25', 'SIN', 25.17210910, -107.47951730, 1, 'Q80252', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3450, 'México', 142, 'MX', '15', 'MEX', 23.63450100, -102.55278400, 1, 'Q82112', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3451, 'Chiapas', 142, 'MX', '05', 'CHP', 16.75693180, -93.12923530, 1, 'Q60123', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3452, 'Nuevo León', 142, 'MX', '19', 'NLE', 25.59217200, -99.99619470, 1, 'Q15282', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3453, 'Durango', 142, 'MX', '10', 'DUR', 37.27528000, -107.88006670, 1, 'Q79918', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3454, 'Tabasco', 142, 'MX', '27', 'TAB', 17.84091730, -92.61892730, 1, 'Q80914', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3455, 'Querétaro', 142, 'MX', '22', 'QUE', 20.58879320, -100.38988810, 1, 'Q79754', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3456, 'Aguascalientes', 142, 'MX', '01', 'AGU', 21.88525620, -102.29156770, 1, 'Q79952', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36');
INSERT INTO `states` (`id`, `name`, `country_id`, `country_code`, `fips_code`, `iso2`, `latitude`, `longitude`, `flag`, `wikiDataId`, `covered`, `created_at`, `updated_at`) VALUES
(3457, 'Baja California', 142, 'MX', '02', 'BCN', 30.84063380, -115.28375850, 1, 'Q58731', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3458, 'Tlaxcala', 142, 'MX', '29', 'TLA', 19.31815400, -98.23749540, 1, 'Q82681', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3459, 'Guerrero', 142, 'MX', '12', 'GRO', 17.43919260, -99.54509740, 1, 'Q60158', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3460, 'Baja California Sur', 142, 'MX', '03', 'BCS', 26.04444460, -111.66607250, 1, 'Q46508', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3461, 'San Luis Potosí', 142, 'MX', '24', 'SLP', 22.15646990, -100.98554090, 1, 'Q78980', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3462, 'Zacatecas', 142, 'MX', '32', 'ZAC', 22.77085550, -102.58324260, 1, 'Q80269', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3463, 'Tamaulipas', 142, 'MX', '28', 'TAM', 24.26694000, -98.83627550, 1, 'Q80007', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3464, 'Veracruz', 142, 'MX', '30', 'VER', 19.17377300, -96.13422410, 1, 'Q60130', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3465, 'Morelos', 142, 'MX', '17', 'MOR', 18.68130490, -99.10134980, 1, 'Q66117', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3466, 'Yucatán', 142, 'MX', '31', 'YUC', 20.70987860, -89.09433770, 1, 'Q60176', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3467, 'Quintana Roo', 142, 'MX', '23', 'ROO', 19.18173930, -88.47913760, 1, 'Q80245', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3468, 'Sonora', 142, 'MX', '26', 'SON', 37.98294960, -120.38217240, 1, 'Q46422', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3469, 'Guanajuato', 142, 'MX', '11', 'GUA', 21.01901450, -101.25735860, 1, 'Q46475', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3470, 'Hidalgo', 142, 'MX', '13', 'HID', 26.10035470, -98.26306840, 1, 'Q80903', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3471, 'Coahuila', 142, 'MX', '07', 'COA', 27.05867600, -101.70682940, 1, 'Q53079', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3472, 'Colima', 142, 'MX', '08', 'COL', 19.24523420, -103.72408680, 1, 'Q61309', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3473, 'Mexico City', 142, 'MX', '09', 'CMX', 19.43260770, -99.13320800, 1, 'Q1489', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3474, 'Michoacán', 142, 'MX', '16', 'MIC', 19.56651920, -101.70682940, 1, 'Q79861', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3475, 'Campeche', 142, 'MX', '04', 'CAM', 19.83012510, -90.53490870, 1, 'Q80908', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3476, 'Puebla', 142, 'MX', '21', 'PUE', 19.04143980, -98.20627270, 1, 'Q79923', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3477, 'Nayarit', 142, 'MX', '18', 'NAY', 21.75138440, -104.84546190, 1, 'Q79920', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3593, 'Berry Islands', 17, 'BS', '32', 'BY', 25.62500420, -77.82522030, 1, 'Q827173', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3594, 'Nichollstown and Berry Islands', 17, 'BS', '32', 'NB', 25.72362340, -77.83101040, 1, 'Q15478152', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3595, 'Green Turtle Cay', 17, 'BS', '28', 'GT', 26.77471070, -77.32957080, 1, 'Q3249446', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3596, 'Central Eleuthera', 17, 'BS', '39', 'CE', 25.13620370, -76.14359150, 1, 'Q938518', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3597, 'Governor\'s Harbour', 17, 'BS', '27', 'GH', 25.19480960, -76.24396220, 1, 'Q5589465', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3598, 'High Rock', 17, 'BS', '29', 'HR', 46.68434150, -121.90174610, 1, 'Q1771787', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3599, 'West Grand Bahama', 17, 'BS', '54', 'WG', 26.65944700, -78.52065000, 1, 'Q2702338', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3600, 'Rum Cay District', 17, 'BS', '49', 'RC', 23.68546760, -74.83901620, 1, 'Q21713441', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3601, 'Acklins', 17, 'BS', '24', 'AK', 22.36577080, -74.05351260, 1, 'Q341919', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3602, 'North Eleuthera', 17, 'BS', '48', 'NE', 25.46475170, -76.67592200, 1, 'Q2705535', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3603, 'Central Abaco', 17, 'BS', '37', 'CO', 26.35550290, -77.14851630, 1, 'Q2525371', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3604, 'Marsh Harbour', 17, 'BS', '31', 'MH', 26.52416530, -77.09098090, 1, 'Q1337651', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3605, 'Black Point', 17, 'BS', '36', 'BP', 41.39510240, -71.46505560, 1, 'Q2525298', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3606, 'Sandy Point', 17, 'BS', '34', 'SP', 39.01454640, -76.39989250, 1, 'Q7417405', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3607, 'South Eleuthera', 17, 'BS', '52', 'SE', 24.77085620, -76.21314740, 1, 'Q2699715', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3608, 'South Abaco', 17, 'BS', '50', 'SO', 26.06405910, -77.26350380, 1, 'Q2703192', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3609, 'Inagua', 17, 'BS', '13', 'IN', 21.06560660, -73.32370800, 1, 'Q1353668', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3610, 'Long Island', 17, 'BS', '15', 'LI', 40.78914200, -73.13496100, 1, 'Q890879', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3611, 'Cat Island', 17, 'BS', '06', 'CI', 30.22801360, -89.10149330, 1, 'Q1050154', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3612, 'Exuma', 17, 'BS', '10', 'EX', 23.61925980, -75.96954650, 1, 'Q1385577', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3613, 'Harbour Island', 17, 'BS', '22', 'HI', 25.50011000, -76.63405110, 1, 'Q2357510', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3614, 'East Grand Bahama', 17, 'BS', '41', 'EG', 26.65828230, -78.22482910, 1, 'Q2630334', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3615, 'Ragged Island', 17, 'BS', '18', 'RI', 41.59743100, -71.26020200, 1, 'Q1532634', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3616, 'North Abaco', 17, 'BS', '46', 'NO', 26.78716970, -77.43577390, 1, 'Q623327', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3617, 'North Andros', 17, 'BS', '47', 'NS', 24.70638050, -78.01953870, 1, 'Q2699411', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3618, 'Kemps Bay', 17, 'BS', '30', 'KB', 24.02364000, -77.54534900, 1, 'Q9291041', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3619, 'Fresh Creek', 17, 'BS', '26', 'FC', 40.65437560, -73.89479390, 1, 'Q14209513', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3620, 'San Salvador and Rum Cay', 17, 'BS', '35', 'SR', 23.68546760, -74.83901620, 1, 'Q7415283', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3621, 'Crooked Island', 17, 'BS', '40', 'CK', 22.63909820, -74.00650900, 1, 'Q1140993', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3622, 'South Andros', 17, 'BS', '51', 'SA', 23.97135560, -77.60778650, 1, 'Q2408672', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3623, 'Rock Sound', 17, 'BS', '33', 'RS', 39.01424430, -95.67089890, 1, 'Q1771799', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3624, 'Hope Town', 17, 'BS', '43', 'HT', 26.50095040, -76.99598720, 1, 'Q2699709', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3625, 'Mangrove Cay', 17, 'BS', '44', 'MC', 24.14814250, -77.76809520, 1, 'Q2702334', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3626, 'Freeport', 17, 'BS', '25', 'FP', 42.29668610, -89.62122710, 1, 'Q867573', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3627, 'San Salvador Island', 17, 'BS', '35', 'SS', 24.07755460, -74.47600880, 1, 'Q845540', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3628, 'Acklins and Crooked Islands', 17, 'BS', '24', 'AC', 22.36577080, -74.05351260, 1, 'Q4674283', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3629, 'Bimini', 17, 'BS', '05', 'BI', 24.64153250, -79.85062260, 1, 'Q863476', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3630, 'Spanish Wells', 17, 'BS', '53', 'SW', 26.32505990, -81.79803280, 1, 'Q1771681', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3631, 'Central Andros', 17, 'BS', '38', 'CS', 24.46884820, -77.97386500, 1, 'Q2096558', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3632, 'Grand Cay', 17, 'BS', '42', 'GC', 27.21626150, -78.32305590, 1, 'Q2524373', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3633, 'Mayaguana District', 17, 'BS', '16', 'MG', 22.40177140, -73.06413960, 1, 'Q21712462', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3634, 'San Juan Province', 11, 'AR', '18', 'J', NULL, NULL, 1, 'Q44805', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3635, 'Santiago del Estero Province', 11, 'AR', '22', 'G', -27.78335740, -64.26416700, 1, 'Q44827', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3636, 'San Luis Province', 11, 'AR', '19', 'D', -33.29620420, -66.32949480, 1, 'Q44818', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3637, 'Tucumán Province', 11, 'AR', '24', 'T', -26.82211270, -65.21929030, 1, 'Q44829', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3638, 'Corrientes', 11, 'AR', '06', 'W', -27.46921310, -58.83063490, 1, 'Q44758', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3639, 'Río Negro Province', 11, 'AR', '16', 'R', -40.82614340, -63.02663390, 1, 'Q44802', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3640, 'Chaco Province', 11, 'AR', '03', 'H', -27.42571750, -59.02437840, 1, 'Q44757', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3641, 'Santa Fe Province', 11, 'AR', '21', 'S', -31.58551090, -60.72380160, 1, 'Q44823', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3642, 'Córdoba Province', 11, 'AR', '05', 'X', NULL, NULL, 1, 'Q44759', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3643, 'Salta Province', 11, 'AR', '17', 'A', -24.79976880, -65.41503670, 1, 'Q44803', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3644, 'Misiones Province', 11, 'AR', '14', 'N', -27.42692550, -55.94670760, 1, 'Q44798', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3645, 'Jujuy Province', 11, 'AR', '10', 'Y', -24.18433970, -65.30217700, 1, 'Q44764', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3646, 'Mendoza', 11, 'AR', '13', 'M', -32.88945870, -68.84583860, 1, 'Q44797', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3647, 'Catamarca Province', 11, 'AR', '02', 'K', -28.47158770, -65.78772090, 1, 'Q44756', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3648, 'Neuquén Province', 11, 'AR', '15', 'Q', -38.94587000, -68.07309250, 1, 'Q44800', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3649, 'Santa Cruz Province', 11, 'AR', '20', 'Z', -51.63528210, -69.24743530, 1, 'Q44821', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3650, 'Tierra del Fuego Province', 11, 'AR', '23', 'V', -54.80539980, -68.32420610, 1, 'Q44832', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3651, 'Chubut Province', 11, 'AR', '04', 'U', -43.29342460, -65.11148180, 1, 'Q45007', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3652, 'Formosa Province', 11, 'AR', '09', 'P', -26.18948040, -58.22428060, 1, 'Q44761', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3653, 'La Rioja Province', 11, 'AR', '12', 'F', -29.41937930, -66.85599320, 1, 'Q44796', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3654, 'Entre Ríos Province', 11, 'AR', '08', 'E', -31.77466540, -60.49564610, 1, 'Q44762', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3655, 'La Pampa', 11, 'AR', '11', 'L', -36.61475730, -64.28392090, 1, 'Q44795', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3656, 'Buenos Aires Province', 11, 'AR', '07', 'B', -37.20172850, -59.84106970, 1, 'Q1486', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3657, 'Quiché Department', 90, 'GT', '14', 'QC', 15.49838080, -90.98206680, 1, 'Q669802', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3658, 'Jalapa Department', 90, 'GT', '10', 'JA', 14.61214460, -89.96267990, 1, 'Q795441', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3659, 'Izabal Department', 90, 'GT', '09', 'IZ', 15.49765170, -88.86469800, 1, 'Q693658', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3660, 'Suchitepéquez Department', 90, 'GT', '20', 'SU', 14.42159820, -91.40482490, 1, 'Q883734', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3661, 'Sololá Department', 90, 'GT', '19', 'SO', 14.74852300, -91.28910360, 1, 'Q178136', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3662, 'El Progreso Department', 90, 'GT', '05', 'PR', 14.93887320, -90.07467670, 1, 'Q795591', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3663, 'Totonicapán Department', 90, 'GT', '21', 'TO', 14.91734020, -91.36139230, 1, 'Q885644', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3664, 'Retalhuleu Department', 90, 'GT', '15', 'RE', 14.52454850, -91.68578800, 1, 'Q888307', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3665, 'Santa Rosa Department', 90, 'GT', '18', 'SR', 38.44057590, -122.70375430, 1, 'Q885656', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3666, 'Chiquimula Department', 90, 'GT', '04', 'CQ', 14.75149990, -89.47421770, 1, 'Q753037', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3667, 'San Marcos Department', 90, 'GT', '17', 'SM', 14.93095690, -91.90992380, 1, 'Q883907', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3668, 'Quetzaltenango Department', 90, 'GT', '13', 'QZ', 14.79243300, -91.71495800, 1, 'Q844502', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3669, 'Petén Department', 90, 'GT', '12', 'PE', 16.91203300, -90.29957850, 1, 'Q466061', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3670, 'Huehuetenango Department', 90, 'GT', '08', 'HU', 15.58799140, -91.67606910, 1, 'Q842266', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3671, 'Alta Verapaz Department', 90, 'GT', '01', 'AV', 15.59428830, -90.14949880, 1, 'Q504637', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3672, 'Guatemala Department', 90, 'GT', '07', 'GU', 14.56494010, -90.52578230, 1, 'Q695660', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3673, 'Jutiapa Department', 90, 'GT', '11', 'JU', 14.19308020, -89.92532330, 1, 'Q765984', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3674, 'Baja Verapaz Department', 90, 'GT', '02', 'BV', 15.12558670, -90.37483540, 1, 'Q504647', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3675, 'Chimaltenango Department', 90, 'GT', '03', 'CM', 14.56347870, -90.98206680, 1, 'Q765975', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3676, 'Sacatepéquez Department', 90, 'GT', '16', 'SA', 14.51783790, -90.71527490, 1, 'Q508804', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3677, 'Escuintla Department', 90, 'GT', '06', 'ES', 14.19109120, -90.98206680, 1, 'Q795587', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3678, 'Madre de Dios', 173, 'PE', '17', 'MDD', -11.76687050, -70.81199530, 1, 'Q210896', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3679, 'Huancavelica', 173, 'PE', '09', 'HUV', -12.78619780, -74.97640240, 1, 'Q505220', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3680, 'Áncash', 173, 'PE', '02', 'ANC', -9.32504970, -77.56194190, 1, 'Q205089', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3681, 'Arequipa', 173, 'PE', '04', 'ARE', -16.40904740, -71.53745100, 1, 'Q205068', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3682, 'Puno', 173, 'PE', '21', 'PUN', -15.84022180, -70.02188050, 1, 'Q205104', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3683, 'La Libertad', 173, 'PE', '13', 'LAL', 13.49069700, -89.30846070, 1, 'Q205126', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3684, 'Ucayali', 173, 'PE', '25', 'UCA', -9.82511830, -73.08774900, 1, 'Q207424', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3685, 'Amazonas', 173, 'PE', '01', 'AMA', NULL, NULL, 1, 'Q201162', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3686, 'Pasco', 173, 'PE', '19', 'PAS', 46.23050490, -119.09223160, 1, 'Q211208', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3687, 'Huanuco', 173, 'PE', '10', 'HUC', -9.92076480, -76.24108430, 1, 'Q215221', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3688, 'Cajamarca', 173, 'PE', '06', 'CAJ', -7.16174650, -78.51278550, 1, 'Q205078', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3689, 'Tumbes', 173, 'PE', '24', 'TUM', -3.55649210, -80.42708850, 1, 'Q209597', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3691, 'Cusco', 173, 'PE', '08', 'CUS', -13.53195000, -71.96746260, 1, 'Q205057', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3692, 'Ayacucho', 173, 'PE', '05', 'AYA', -13.16387370, -74.22356410, 1, 'Q205112', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3693, 'Junín', 173, 'PE', '12', 'JUN', -11.15819250, -75.99263060, 1, 'Q207973', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3694, 'San Martín', 173, 'PE', '22', 'SAM', 37.08494640, -121.61022160, 1, 'Q211793', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3695, 'Lima', 173, 'PE', '15', 'LIM', -12.04637310, -77.04275400, 1, 'Q211795', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3696, 'Tacna', 173, 'PE', '23', 'TAC', -18.00656790, -70.24627410, 1, 'Q207413', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3697, 'Piura', 173, 'PE', '20', 'PIU', -5.17828840, -80.65488820, 1, 'Q208183', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3698, 'Moquegua', 173, 'PE', '18', 'MOQ', -17.19273610, -70.93281380, 1, 'Q208182', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3699, 'Apurímac', 173, 'PE', '03', 'APU', -14.05045330, -73.08774900, 1, 'Q208185', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3700, 'Ica', 173, 'PE', '11', 'ICA', 42.35288320, -71.04300970, 1, 'Q208186', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3701, 'Callao', 173, 'PE', '07', 'CAL', -12.05084910, -77.12598430, 1, 'Q2071352', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3702, 'Lambayeque', 173, 'PE', '14', 'LAM', -6.71976660, -79.90807570, 1, 'Q210061', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3703, 'Redonda', 10, 'AG', '09', '11', 16.93841600, -62.34551480, 1, 'Q457261', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3704, 'Saint Peter Parish', 10, 'AG', '07', '07', NULL, NULL, 1, 'Q1952603', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3705, 'Saint Paul Parish', 10, 'AG', '06', '06', NULL, NULL, 1, 'Q386093', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3706, 'Saint John Parish', 10, 'AG', '04', '04', NULL, NULL, 1, 'Q548816', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3707, 'Saint Mary Parish', 10, 'AG', '05', '05', NULL, NULL, 1, 'Q1999872', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3708, 'Barbuda', 10, 'AG', '01', '10', 17.62662420, -61.77130280, 1, 'Q238752', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3709, 'Saint George Parish', 10, 'AG', '03', '03', NULL, NULL, 1, 'Q1770796', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3710, 'Saint Philip Parish', 10, 'AG', '08', '08', 40.43682580, -80.06855320, 1, 'Q1996895', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3742, 'Westmoreland Parish', 108, 'JM', '16', '10', 18.29443780, -78.15644320, 1, 'Q1440250', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3743, 'Saint Elizabeth Parish', 108, 'JM', '11', '11', 38.99253080, -94.58992000, 1, 'Q1473646', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3744, 'Saint Ann Parish', 108, 'JM', '09', '06', 37.28714520, -77.41035330, 1, 'Q1326284', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3745, 'Saint James Parish', 108, 'JM', '12', '08', 30.01792920, -90.79132270, 1, 'Q1421939', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3746, 'Saint Catherine Parish', 108, 'JM', '10', '14', 18.03641340, -77.05644640, 1, 'Q1473663', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3747, 'Saint Mary Parish', 108, 'JM', '13', '05', 36.09252200, -95.97384400, 1, 'Q633565', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3748, 'Kingston Parish', 108, 'JM', '17', '01', 17.96832710, -76.78270200, 1, 'Q1473680', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3749, 'Hanover Parish', 108, 'JM', '02', '09', 18.40977070, -78.13363800, 1, 'Q1131779', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3750, 'Saint Thomas Parish', 108, 'JM', '14', '03', 41.44253890, -81.74022180, 1, 'Q1422332', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3751, 'Saint Andrew', 108, 'JM', '08', '02', 37.22451030, -95.70211890, 1, 'Q2212935', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3752, 'Portland Parish', 108, 'JM', '07', '04', 18.08442740, -76.41002670, 1, 'Q125148', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3753, 'Clarendon Parish', 108, 'JM', '01', '13', 17.95571830, -77.24051530, 1, 'Q1095557', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3754, 'Manchester Parish', 108, 'JM', '04', '12', 18.06696540, -77.51607880, 1, 'Q920496', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3755, 'Trelawny Parish', 108, 'JM', '15', '07', 18.35261430, -77.60778650, 1, 'Q1123340', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3756, 'Dennery Quarter', 186, 'LC', '05', '05', 13.92673930, -60.91909880, 1, 'Q1188890', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3757, 'Anse la Raye Quarter', 186, 'LC', '01', '01', 13.94594240, -61.03694680, 1, 'Q1676934', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3758, 'Castries Quarter', 186, 'LC', '03', '02', 14.01010940, -60.98746870, 1, 'Q1049867', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3759, 'Laborie Quarter', 186, 'LC', '07', '07', 13.75227830, -60.99328890, 1, 'Q599347', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3760, 'Choiseul Quarter', 186, 'LC', '04', '03', 13.77501540, -61.04859100, 1, 'Q1075816', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3761, 'Canaries', 186, 'LC', '12', '12', 28.29156370, -16.62913040, 1, 'Q1032796', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3762, 'Micoud Quarter', 186, 'LC', '08', '08', 13.82118710, -60.90019340, 1, 'Q1240193', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3763, 'Vieux Fort Quarter', 186, 'LC', '10', '11', 13.72060800, -60.94964330, 1, 'Q1472864', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3764, 'Soufrière Quarter', 186, 'LC', '09', '10', 13.85709860, -61.05732480, 1, 'Q1472841', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3765, 'Praslin Quarter', 186, 'LC', '11', '09', 13.87523920, -60.89946630, 1, 'Q1567791', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3766, 'Gros Islet Quarter', 186, 'LC', '06', '06', 14.08435780, -60.94527940, 1, 'Q953557', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3767, 'Dauphin Quarter', 186, 'LC', '02', '04', 14.01033960, -60.91909880, 1, 'Q182988', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3831, 'Saint Peter Basseterre Parish', 185, 'KN', '11', '11', 17.31029110, -62.71475330, 1, 'Q1725609', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3832, 'Nevis', 185, 'KN', '11', 'N', 17.15535580, -62.57960260, 1, 'Q207794', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3833, 'Christ Church Nichola Town Parish', 185, 'KN', '01', '01', 17.36048120, -62.76178370, 1, 'Q176164', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3834, 'Saint Paul Capisterre Parish', 185, 'KN', '09', '09', 17.40166830, -62.82573320, 1, 'Q952735', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3835, 'Saint James Windward Parish', 185, 'KN', '05', '05', 17.17696330, -62.57960260, 1, 'Q1342139', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3836, 'Saint Anne Sandy Point Parish', 185, 'KN', '02', '02', 17.37253330, -62.84411330, 1, 'Q1473654', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3837, 'Saint George Gingerland Parish', 185, 'KN', '04', '04', 17.12577590, -62.56198110, 1, 'Q1472520', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3838, 'Saint Paul Charlestown Parish', 185, 'KN', '10', '10', 17.13462970, -62.61338160, 1, 'Q1752127', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3839, 'Saint Thomas Lowland Parish', 185, 'KN', '12', '12', 17.16505130, -62.60897530, 1, 'Q1752122', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3840, 'Saint John Figtree Parish', 185, 'KN', '07', '07', 17.11557480, -62.60310040, 1, 'Q657318', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3841, 'Saint Kitts', 185, 'KN', '07', 'K', 17.34337960, -62.75590430, 1, 'Q204989', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3842, 'Saint Thomas Middle Island Parish', 185, 'KN', '13', '13', 17.33488130, -62.80882510, 1, 'Q1752101', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3843, 'Trinity Palmetto Point Parish', 185, 'KN', '15', '15', 17.30635190, -62.76178370, 1, 'Q376738', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3844, 'Saint Mary Cayon Parish', 185, 'KN', '08', '08', 17.34620710, -62.73826710, 1, 'Q1538034', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3845, 'Saint John Capisterre Parish', 185, 'KN', '06', '06', 17.38103410, -62.79118330, 1, 'Q668498', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3863, 'Saint Patrick Parish', 87, 'GD', '06', '06', NULL, NULL, 1, 'Q1476309', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3864, 'Saint George Parish', 87, 'GD', '03', '03', NULL, NULL, 1, 'Q576651', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3865, 'Saint Andrew Parish', 87, 'GD', '01', '01', NULL, NULL, 1, 'Q977183', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3866, 'Saint Mark Parish', 87, 'GD', '05', '05', 40.58818630, -73.94957010, 1, 'Q1291077', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3867, 'Carriacou and Petite Martinique', 87, 'GD', '10', '10', 12.47858880, -61.44938420, 1, 'Q3044818', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3868, 'Saint John Parish', 87, 'GD', '04', '04', 30.11183310, -90.48799160, 1, 'Q1476289', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(3869, 'Saint David Parish', 87, 'GD', '02', '02', NULL, NULL, 1, 'Q2087806', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4041, 'Choluteca Department', 97, 'HN', '02', 'CH', 13.25043250, -87.14228950, 1, 'Q899272', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4042, 'Comayagua Department', 97, 'HN', '04', 'CM', 14.55348280, -87.61863790, 1, 'Q823443', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4043, 'El Paraíso Department', 97, 'HN', '07', 'EP', 13.98212940, -86.49965460, 1, 'Q867108', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4044, 'Intibucá Department', 97, 'HN', '10', 'IN', 14.37273400, -88.24611830, 1, 'Q262125', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4045, 'Bay Islands Department', 97, 'HN', '11', 'IB', 16.48266140, -85.87932520, 1, 'Q751725', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4046, 'Cortés Department', 97, 'HN', '06', 'CR', 15.49235080, -88.09007620, 1, 'Q767244', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4047, 'Atlántida Department', 97, 'HN', '01', 'AT', 15.66962830, -87.14228950, 1, 'Q622619', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4048, 'Gracias a Dios Department', 97, 'HN', '09', 'GD', 15.34180600, -84.60604490, 1, 'Q867112', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4049, 'Copán Department', 97, 'HN', '05', 'CP', 14.93608380, -88.86469800, 1, 'Q843984', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4050, 'Olancho Department', 97, 'HN', '15', 'OL', 14.80674060, -85.76666450, 1, 'Q867089', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4051, 'Colón Department', 97, 'HN', '03', 'CL', 15.64259650, -85.52002400, 1, 'Q867117', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4052, 'Francisco Morazán Department', 97, 'HN', '08', 'FM', 14.45411000, -87.06242610, 1, 'Q867126', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4053, 'Santa Bárbara Department', 97, 'HN', '16', 'SB', 15.12027950, -88.40160410, 1, 'Q591139', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4054, 'Lempira Department', 97, 'HN', '13', 'LE', 14.18876980, -88.55653100, 1, 'Q744138', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4055, 'Valle Department', 97, 'HN', '17', 'VA', 13.57829360, -87.57912870, 1, 'Q867097', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4056, 'Ocotepeque Department', 97, 'HN', '14', 'OC', 14.51703470, -89.05615320, 1, 'Q867084', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4057, 'Yoro Department', 97, 'HN', '18', 'YO', 15.29496790, -87.14228950, 1, 'Q1123380', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4058, 'La Paz Department', 97, 'HN', '12', 'LP', -15.08924160, -68.52471490, 1, 'Q866886', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4076, 'Saint John Parish', 61, 'DM', '05', '05', NULL, NULL, 1, 'Q1476285', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4077, 'Saint Mark Parish', 61, 'DM', '08', '08', NULL, NULL, 1, 'Q1431115', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4078, 'Saint David Parish', 61, 'DM', '03', '03', NULL, NULL, 1, 'Q1431129', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4079, 'Saint George Parish', 61, 'DM', '04', '04', NULL, NULL, 1, 'Q617801', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4080, 'Saint Patrick Parish', 61, 'DM', '09', '09', NULL, NULL, 1, 'Q1431108', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4081, 'Saint Peter Parish', 61, 'DM', '11', '11', 40.45241940, -80.00850560, 1, 'Q1476294', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4082, 'Saint Andrew Parish', 61, 'DM', '02', '02', NULL, NULL, 1, 'Q732322', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4083, 'Saint Luke Parish', 61, 'DM', '07', '07', 42.10513630, -80.05707220, 1, 'Q1431099', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4084, 'Saint Paul Parish', 61, 'DM', '10', '10', 38.86146000, -90.74356190, 1, 'Q339063', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4085, 'Saint Joseph Parish', 61, 'DM', '06', '06', 39.02227120, -94.71765040, 1, 'Q1476302', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4086, 'El Seibo Province', 62, 'DO', '28', '08', 18.76584960, -69.04066800, 1, 'Q1774831', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4087, 'La Romana Province', 62, 'DO', '12', '12', 18.43102710, -68.98373730, 1, 'Q1140742', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4088, 'Sánchez Ramírez Province', 62, 'DO', '21', '24', 19.05270600, -70.14922640, 1, 'Q1836903', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4089, 'Hermanas Mirabal Province', 62, 'DO', '19', '19', 19.37475590, -70.35132350, 1, 'Q549386', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4090, 'Barahona Province', 62, 'DO', '03', '04', 18.21390660, -71.10437590, 1, 'Q1137551', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4091, 'San Cristóbal Province', 62, 'DO', '33', '21', 18.41804140, -70.10658490, 1, 'Q1366107', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4092, 'Puerto Plata Province', 62, 'DO', '18', '18', 19.75432250, -70.83328470, 1, 'Q693487', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4093, 'Santo Domingo Province', 62, 'DO', '37', '32', 18.51042530, -69.84040540, 1, 'Q1352536', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4094, 'María Trinidad Sánchez Province', 62, 'DO', '14', '14', 19.37345970, -69.85144390, 1, 'Q1949656', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4095, 'Distrito Nacional', 62, 'DO', '34', '01', 18.48605750, -69.93121170, 1, 'Q2499228', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4096, 'Peravia Province', 62, 'DO', '35', '17', 18.27865940, -70.33358870, 1, 'Q1331932', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4097, 'Independencia', 62, 'DO', '09', '10', 32.63357480, -115.42892940, 1, 'Q1424401', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4098, 'San Juan Province', 62, 'DO', '23', '22', -31.52871270, -68.53604030, 1, 'Q2001793', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4099, 'Monseñor Nouel Province', 62, 'DO', '31', '28', 18.92152340, -70.38368150, 1, 'Q1295496', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4100, 'Santiago Rodríguez Province', 62, 'DO', '26', '26', 19.47131810, -71.33958010, 1, 'Q2021942', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4101, 'Pedernales Province', 62, 'DO', '16', '16', 17.85376260, -71.33032090, 1, 'Q1352533', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4102, 'Espaillat Province', 62, 'DO', '08', '09', 19.62776580, -70.27867750, 1, 'Q530231', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4103, 'Samaná Province', 62, 'DO', '20', '20', 19.20583710, -69.33629490, 1, 'Q1145487', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4104, 'Valverde Province', 62, 'DO', '27', '27', 19.58812210, -70.98033100, 1, 'Q1774848', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4105, 'Baoruco Province', 62, 'DO', '02', '03', 18.48798980, -71.41822490, 1, 'Q807079', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4106, 'Hato Mayor Province', 62, 'DO', '29', '30', 18.76357990, -69.25576370, 1, 'Q937217', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4107, 'Dajabón Province', 62, 'DO', '04', '05', 19.54992410, -71.70865140, 1, 'Q1138575', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4108, 'Santiago Province', 62, 'DO', '25', '25', -33.45000000, -70.66670000, 1, 'Q1772983', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4109, 'La Altagracia Province', 62, 'DO', '10', '11', 18.58502360, -68.62010720, 1, 'Q1323353', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4110, 'San Pedro de Macorís', 62, 'DO', '24', '23', 18.46266000, -69.30512340, 1, 'Q1366119', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4111, 'Monte Plata Province', 62, 'DO', '32', '29', 18.80808780, -69.78691460, 1, 'Q1772745', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4112, 'San José de Ocoa Province', 62, 'DO', '36', '31', 18.54385800, -70.50418160, 1, 'Q1424391', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4113, 'Duarte Province', 62, 'DO', '06', '06', 19.20908230, -70.02700040, 1, 'Q1262745', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4114, 'Azua Province', 62, 'DO', '01', '02', 18.45527090, -70.73809280, 1, 'Q794239', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4115, 'Monte Cristi Province', 62, 'DO', '15', '15', 19.73968990, -71.44339840, 1, 'Q592624', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4116, 'La Vega Province', 62, 'DO', '30', '13', 19.22115540, -70.52887530, 1, 'Q594405', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4117, 'Nord', 95, 'HT', '09', 'ND', 43.19052600, -89.43792100, 1, 'Q943932', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4118, 'Nippes', 95, 'HT', '15', 'NI', 18.39907350, -73.41802110, 1, 'Q125232', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4119, 'Grand\'Anse', 95, 'HT', '14', 'GA', 12.01666670, -61.76666670, 1, 'Q913231', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4120, 'Ouest', 95, 'HT', '11', 'OU', 45.45472490, -73.65023650, 1, 'Q1434621', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4121, 'Nord-Est', 95, 'HT', '10', 'NE', 19.48897230, -71.85713310, 1, 'Q928694', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4122, 'Sud', 95, 'HT', '12', 'SD', 29.92132480, -90.09737720, 1, 'Q936704', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4123, 'Artibonite', 95, 'HT', '06', 'AR', 19.36290200, -72.42581450, 1, 'Q844024', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4124, 'Sud-Est', 95, 'HT', '13', 'SE', 18.27835980, -72.35479150, 1, 'Q936717', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4125, 'Centre', 95, 'HT', '07', 'CE', 32.83702510, -96.77738820, 1, 'Q844528', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4126, 'Nord-Ouest', 95, 'HT', '03', 'NO', 19.83740090, -73.04052770, 1, 'Q608361', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4127, 'San Vicente Department', 66, 'SV', '12', 'SV', 13.58685610, -88.74939980, 1, 'Q1130180', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4128, 'Santa Ana Department', 66, 'SV', '11', 'SA', 14.14611210, -89.51200840, 1, 'Q671158', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4129, 'Usulután Department', 66, 'SV', '14', 'US', 13.44706340, -88.55653100, 1, 'Q1122748', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4130, 'Morazán Department', 66, 'SV', '08', 'MO', 13.76820000, -88.12913870, 1, 'Q1122836', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4131, 'Chalatenango Department', 66, 'SV', '03', 'CH', 14.19166480, -89.17059980, 1, 'Q522221', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4132, 'Cabañas Department', 66, 'SV', '02', 'CA', 13.86482880, -88.74939980, 1, 'Q914058', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4133, 'San Salvador Department', 66, 'SV', '10', 'SS', 13.77399970, -89.20867730, 1, 'Q1543219', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4134, 'La Libertad Department', 66, 'SV', '05', 'LI', 13.68176610, -89.36062980, 1, 'Q930820', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4135, 'San Miguel Department', 66, 'SV', '09', 'SM', 13.44510410, -88.24611830, 1, 'Q930804', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4136, 'La Paz Department', 66, 'SV', '06', 'PA', NULL, NULL, 1, 'Q1129788', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4137, 'Cuscatlán Department', 66, 'SV', '04', 'CU', 13.86619570, -89.05615320, 1, 'Q1130677', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4138, 'La Unión Department', 66, 'SV', '07', 'UN', 13.48864430, -87.89424510, 1, 'Q1130688', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4139, 'Ahuachapán Department', 66, 'SV', '01', 'AH', 13.82161480, -89.92532330, 1, 'Q572993', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4140, 'Sonsonate Department', 66, 'SV', '13', 'SO', 13.68235800, -89.66281110, 1, 'Q212540', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4851, 'Ohio', 233, 'US', '39', 'OH', 40.41728710, -82.90712300, 1, 'Q1397', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4855, 'Capital District', 239, 'VE', '25', 'A', 41.26148460, -95.93108070, 1, 'Q492791', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4856, 'Apure', 239, 'VE', '03', 'C', 6.92694830, -68.52471490, 1, 'Q41146', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4857, 'Jalisco', 142, 'MX', '14', 'JAL', 20.65953820, -103.34943760, 1, 'Q13160', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4858, 'Roraima', 31, 'BR', '25', 'RR', 2.73759710, -62.07509980, 1, 'Q42508', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4860, 'Devonshire Parish', 25, 'BM', '01', 'DEV', 32.30380620, -64.76069540, 1, 'Q1207018', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4861, 'Hamilton Parish', 25, 'BM', '02', 'HA', 32.34494320, -64.72365000, 1, 'Q289876', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4862, 'Hamilton Municipality', 25, 'BM', '03', 'HAM', 43.32394400, -79.90592190, 1, 'MANUAL', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4863, 'Paget Parish', 25, 'BM', '04', 'PAG', 32.28107400, -64.77847870, 1, 'Q2046204', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4864, 'Pembroke Parish', 25, 'BM', '05', 'PEM', 32.30076720, -64.79626300, 1, 'Q1756036', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4865, 'Saint George\'s Municipality', 25, 'BM', '06', 'SG', 37.09652780, -113.56841640, 1, 'MANUAL', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4866, 'Saint George\'s Parish', 25, 'BM', '07', 'SGE', 17.12577590, -62.56198110, 1, 'Q1521745', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4867, 'Sandys Parish', 25, 'BM', '08', 'SAN', 32.29995280, -64.86741030, 1, 'Q121782', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4868, 'Smith\'s Parish,', 25, 'BM', '09', 'SMI', 32.31339660, -64.73105880, 1, 'Q1735847', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4869, 'Southampton Parish', 25, 'BM', '10', 'SOU', 32.25400950, -64.82590580, 1, 'Q1323054', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4870, 'Warwick Parish', 25, 'BM', '11', 'WAR', 32.26615340, -64.80811980, 1, 'Q1468860', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4871, 'Huila Department', 48, 'CO', '16', 'HUI', 2.53593490, -75.52766990, 1, 'Q234920', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4880, 'Autonomous City Of Buenos Aires', 11, 'AR', NULL, 'C', -34.60368440, -58.38155910, 1, 'MANUAL', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4881, 'New Providence', 17, 'BS', '23', 'NP', 40.69843480, -74.40154050, 1, 'Q858513', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4902, 'Simpson Bay', 250, 'SX', '01', 'C', 18.03333300, -63.05000000, 1, 'Q2509364', 0, '2024-12-03 06:56:36', '2024-12-03 06:56:36'),
(4903, 'Marigot', 190, 'MF', 'ee', 'mf', NULL, NULL, 1, NULL, 0, '2025-01-04 04:51:04', '2025-01-04 04:51:04'),
(4904, 'Basseterre', 185, 'KN', 'ee', 'mf', NULL, NULL, 1, NULL, 0, '2025-01-04 04:51:04', '2025-01-04 04:51:04'),
(4905, 'Gustavia', 189, 'BL', 'ee', 'mf', NULL, NULL, 1, NULL, 0, '2025-01-04 04:51:04', '2025-01-04 04:51:04'),
(4906, 'The Valley', 8, 'AI', 'ee', 'mf', NULL, NULL, 1, NULL, 0, '2025-01-04 04:51:04', '2025-01-04 04:51:04'),
(4907, 'Phillipburg', 250, 'SX', 'ee', 'mf', NULL, NULL, 1, NULL, 0, '2025-01-04 04:51:04', '2025-01-04 04:51:04'),
(4908, 'Colebay', 250, 'SX', 'ee', 'mf', NULL, NULL, 1, NULL, 0, '2025-01-04 04:51:04', '2025-01-04 04:51:04'),
(4909, 'Cupecoy', 250, 'SX', 'ee', 'mf', NULL, NULL, 1, NULL, 0, '2025-01-04 04:51:04', '2025-01-04 04:51:04'),
(4910, 'The Botton', 155, 'BQ', 'ee', 'mf', NULL, NULL, 1, NULL, 0, '2025-01-04 04:51:04', '2025-01-04 04:51:04'),
(4911, 'Oranjestad', 155, 'BQ', 'ee', 'mf', NULL, NULL, 1, NULL, 0, '2025-01-04 04:51:04', '2025-01-04 04:51:04'),
(4912, 'Hope Estate', 190, 'MF', 'ee', 'mf', NULL, NULL, 1, NULL, 0, '2025-01-04 04:51:04', '2025-01-04 04:51:04'),
(4913, 'Plymouth', 148, 'MS', 'ms', 'ms', NULL, NULL, 1, NULL, 0, '2025-01-04 04:51:04', '2025-01-04 04:51:04'),
(4914, 'Brades', 148, 'MS', 'ms', 'ms', NULL, NULL, 1, NULL, 0, '2025-01-04 04:51:04', '2025-01-04 04:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `code`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Received', 'Package received at origin facility.', '2024-12-16 07:29:02', '2024-12-16 07:29:02'),
(2, 2, 'Processing', 'Package Approved for delivery.', '2024-12-16 07:29:02', '2024-12-16 07:29:02'),
(3, 3, 'Shipped', 'Package departed from sorting facility.', '2024-12-16 07:29:02', '2024-12-16 07:29:02'),
(4, 4, 'Arrived', 'Package arrived at destination branch.', '2024-12-16 07:29:02', '2024-12-16 07:29:02'),
(5, 5, 'Delivered', 'Package delivered to receiver.', '2024-12-16 07:29:02', '2024-12-16 07:29:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Vmeasure', 'jcarlosfv3@gmail.com', '2024-12-24 15:26:53', 2, '$2y$12$jHrzixuSWNUQbG2q5l8VH.226HnEMg2kIFTsytZjYOkpEXUmVSyOe', '20YQVditbZIdWRAJO55zhwbM2VheqaLfsG1v8XvZjDQupYdLm34YVy5j94pE', '2024-12-03 06:56:36', '2024-12-24 15:26:53'),
(9, 'jcarlos', 'jcarlosfv33@gmail.com', '2025-01-01 20:18:06', 4, '$2y$12$fuUY3GHy/manKeIvUP1.n.rQeOSv/jp3PH49RgVkOhBHY2IaQA/r.', NULL, '2025-01-01 15:51:44', '2025-01-01 20:18:06'),
(10, 'Eazzyreship', 'eazzyreship@gmail.com', '2025-01-01 22:39:43', 4, '$2y$12$wXa3Slvk0QzSIgXMfrVVheIV1Bs4Bz091isqz4N0LEBJCPV50sMCy', NULL, '2025-01-01 22:37:42', '2025-01-01 22:39:43'),
(11, 'NARESH BHAGIA', 'nashbhagia@gmail.com', '2025-01-01 23:13:19', 4, '$2y$12$./hAIH4YHMDtb3T.Ogv8e.WhPDUdWGpDwePcJvSTGgEqMoE79KT5i', 'U65AYsFTChJ3Uw0ISl1Ta3wnQkSFeSqkbZzNBwomuyDjeP14p3AKbHiKbKrt', '2025-01-01 23:12:44', '2025-01-01 23:13:19'),
(12, 'Kimberly Williams', 'kcwilliams87@gmail.com', '2025-01-03 00:57:40', 4, '$2y$12$4Gg7jInmGbLRCgELHoaGOec1cEVjCyVGbC.G.1JT/07NjNHmOQQWS', NULL, '2025-01-03 00:56:47', '2025-01-03 00:57:40'),
(15, 'VIHAAN BHAGIA', 'vihaanbhagia@gmail.com', '2025-01-05 23:35:20', 4, '$2y$12$FJ.9QPL5dOp5sXGs3h7fFeRCEfJ/Ztv10MjJfnh9muQ9uXhku5tGm', 'KL05TomLKOparQ74aFVf0qm1whkYfM5FvzIQwEZthFjNR9U2q25XOb2x91JH', '2025-01-05 22:16:15', '2025-01-05 23:35:20'),
(17, 'SHOPNTAKE', 'info@shopandtake.com', '2025-01-05 23:12:49', 4, '$2y$12$XKrpI/5V1AB/3ely5XlCyOyXXOBTcAHVS.ByQAIXCS1ZkFq88iz8K', NULL, '2025-01-05 23:12:27', '2025-01-05 23:12:49'),
(19, 'TEST1234', 'artibhagia@gmail.com', NULL, 4, '$2y$12$HFoV9MwizjmgjtVSjH9OOOkCxOUB/aMfMZkkH6F/q6le3Sp8Tk/RK', NULL, '2025-01-07 04:46:11', '2025-01-07 04:46:11'),
(20, 'Nash Bhagia', 'nashbhagia@yahoo.com', '2025-01-07 05:14:41', 4, '$2y$12$YQB2AIFKXYLLoSknddZ6welm3LInzaLiCOyDf6Boexnx/P0S/lA6G', 'lecFMeKFI732ENwy2xWOuvv1tBuhmTB7CUhtxsTdQw33vJuOWzqJu779tA00', '2025-01-07 04:50:38', '2025-01-09 16:02:55'),
(22, 'Victor Perez', 'victor.sxm@gmail.com', '2025-01-07 05:39:34', 4, '$2y$12$MKHe4.uKxcD5qTvqoVnonuS5UTPOYvIFFL0IYF9d0h6HFw9jVmOUm', 'c3Vm1ox2KWwBPUDZc89FoA0UJm4WgGsvt5T7UKTMzwHJQRXZgAwZAseDf9ov', '2025-01-07 05:39:16', '2025-03-04 05:24:25'),
(23, 'TEST1234ARTI', 'nashbhagia@hotmail.com', NULL, 4, '$2y$12$7zROd5vycFBAt5mPF3fGYOa2R1UbxVqR3F6OPzBFaioGE4Au23PPi', NULL, '2025-01-09 15:14:24', '2025-01-09 15:14:24'),
(24, 'BRANDON BARTLEY', 'bartley241@hotmail.com', '2025-01-09 18:41:37', 4, '$2y$12$N0msjwXnG7YWfUAVD8iGE.KbCSw/FQPXHpYnqtjN.1XhioE701Nxi', NULL, '2025-01-09 18:40:30', '2025-01-09 18:41:37'),
(25, 'Naresh Bhagia', 'nash@shopandtake.com', NULL, 4, '$2y$12$WiTTxxQd3iAyccJWdYd1XeSvaKmXp1tsno.jyRnE58x5cf5xShuru', NULL, '2025-01-10 14:16:20', '2025-01-10 14:16:20'),
(26, 'John Prescot', 'wilconfab@gmail.com', NULL, 4, '$2y$12$kih79Ljk2qynhWQRV0Akl.bWps7czWWchsgZ8vV8uE6KP/3pDik4a', NULL, '2025-01-11 16:28:52', '2025-01-11 16:28:52'),
(27, 'K. W.', 'kimberlychengwilliams@gmail.com', '2025-01-11 23:56:24', 4, '$2y$12$LHt8Y457qeArgvAteQsu6eTE8iRE84iE8mOiXfC4kguz2KRFqUCz.', NULL, '2025-01-11 23:51:54', '2025-01-11 23:56:24'),
(28, 'IS', 'islandshawarmasxm@gmail.com', '2025-01-12 05:41:01', 4, '$2y$12$nRKZ0fs/fAjQ9DWARhOAmOlTNdBOwlatGZfe6pP.5jIWu2jURsAVa', NULL, '2025-01-12 05:40:18', '2025-01-12 05:41:01'),
(29, 'TW', 'techworldsxm@gmail.com', '2025-01-12 22:10:53', 4, '$2y$12$7PtH55.m/1NYZEldJXocu.SSPTj6/77snRWiwGxpzPNITbrIOfW5a', 'o0qltKGXhdCOdnK1OlZKVNQKXb8VejcPUBLHPmNqxTTsvD3tPYdiZLd6Sd5c', '2025-01-12 22:10:04', '2025-03-04 17:35:24'),
(30, 'TEST12345', 'artibhagia@mail.com', NULL, 4, '$2y$12$XbP8PNTx8AGEqTTPKb70x.EmB5af7gA/.UTgQQxBP/B/uuRBCLMze', NULL, '2025-01-13 03:01:23', '2025-01-13 03:01:23'),
(31, 'Glen Alexander', 'mistro34@gmail.com', '2025-01-25 01:22:35', 4, '$2y$12$6sYMpR0CqeKCL3TbDPNAoeTDM.QUbLe33eRNH0pNRY3P25dv7htFa', NULL, '2025-01-25 01:16:12', '2025-01-25 01:22:35'),
(32, 'ASHOK SADHWANI', 'ashokmni@yahoo.com', NULL, 4, '$2y$12$XpoUfZo.JhpW0A5VAM4TteeH4rUckPw98GhoQZyrKVbdKVGD4ZKja', NULL, '2025-03-02 19:33:59', '2025-03-02 19:33:59'),
(33, 'mustak shaikh', 'mustak_007@hotmail.com', '2025-03-06 08:07:37', 4, '$2y$12$Ob.IsnBekizGaK6ub2.S3.1DOUKpc5AUZZINXfbcx29kShD3.V9/O', NULL, '2025-03-06 08:04:42', '2025-03-06 08:07:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_addresses`
--
ALTER TABLE `client_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_packages`
--
ALTER TABLE `client_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_preferences`
--
ALTER TABLE `client_preferences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_shipment_logs`
--
ALTER TABLE `client_shipment_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_shipments`
--
ALTER TABLE `package_shipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `receivers`
--
ALTER TABLE `receivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shipments_order_id_unique` (`order_id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- Indexes for table `shipment_attachments`
--
ALTER TABLE `shipment_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipment_attachments_shipment_id_foreign` (`shipment_id`);

--
-- Indexes for table `shipment_settings`
--
ALTER TABLE `shipment_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `client_addresses`
--
ALTER TABLE `client_addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `client_packages`
--
ALTER TABLE `client_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_preferences`
--
ALTER TABLE `client_preferences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_shipment_logs`
--
ALTER TABLE `client_shipment_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `missions`
--
ALTER TABLE `missions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `package_shipments`
--
ALTER TABLE `package_shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `receivers`
--
ALTER TABLE `receivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT for table `shipment_attachments`
--
ALTER TABLE `shipment_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `shipment_settings`
--
ALTER TABLE `shipment_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4915;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipment_attachments`
--
ALTER TABLE `shipment_attachments`
  ADD CONSTRAINT `shipment_attachments_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

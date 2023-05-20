-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2023 at 02:04 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medical_exel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT 2,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Admin', '12345678', 1, 'def.png', 'admin@gmail.com', NULL, '$2y$10$lNYROVmH8sCEowjpScSSpuKZEbNmqkbIGyp1/hctVvyztC/xtoUNO', 'AnAx54ZMNvqgZJWxzbVJWUlVgHx7oXB6moonWyzDYOolRQ3b9Kwb9ZrLbfdG', '2023-03-20 14:03:15', '2023-03-20 14:03:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `module_access` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `inhouse_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `inhouse_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_earned`, `delivery_charge_earned`, `pending_amount`, `total_tax_collected`) VALUES
(1, 1, 65, 0, NULL, '2023-04-19 03:24:21', 0.00, 25.00, 0.00, 0.00),
(2, 1, 0, 0, '2023-03-20 14:03:15', '2023-03-20 14:03:15', 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `banner_type` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `resource_type` varchar(191) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`, `resource_type`, `resource_id`) VALUES
(4, '2023-03-22-641a1c65f123a.png', 'Main Banner', 1, '2023-03-22 02:06:45', '2023-03-22 02:06:48', 'banner-4', 'category', 4),
(5, '2023-04-14-6438ee5e9f98a.png', 'Main Banner', 1, '2023-04-14 04:10:38', '2023-04-14 04:10:43', 'عطور', 'product', 11),
(7, '2023-04-15-643a34393352c.png', 'Main Banner', 1, '2023-04-15 03:20:57', '2023-04-15 03:21:35', 'عطور', 'product', 11),
(10, '2023-04-17-643c9d830e751.png', 'Main Banner', 1, '2023-04-16 23:14:43', '2023-04-16 23:14:50', 'hh', 'product', 11),
(13, '2023-04-18-643e2110b9f76.png', 'Main Banner', 1, '2023-04-18 02:48:16', '2023-04-18 02:48:19', 'hh', 'product', 11),
(14, '2023-04-19-643f797be54e7.png', 'Main Banner', 1, '2023-04-19 03:17:13', '2023-04-19 03:17:47', 'hh', 'product', 11);

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(191) DEFAULT NULL,
  `address_type` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'def.png',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PHILADELPHIA PHARMACEUTICAL', '2023-03-22-641a1e50ce805.png', 1, '2023-03-22 02:11:35', '2023-03-22 02:14:56'),
(2, 'THE NILE COMPANY FOR PHARMACEUTICALS AND CHEMICAL', '2023-03-22-641a1e9257cb9.png', 1, '2023-03-22 02:16:02', '2023-03-24 02:23:54'),
(3, 'OMAN PHARMACEUTICAL PRODUCTS', '2023-03-22-641a1f4b1b928.png', 1, '2023-03-22 02:19:07', '2023-03-22 02:19:07'),
(6, 'يونيلفر', '2023-04-13-643777c273fc4.png', 1, '2023-04-13 01:20:38', '2023-04-13 01:32:18'),
(7, 'ريكيت بينكيزر', '2023-04-13-643778028eec7.png', 1, '2023-04-13 01:22:33', '2023-04-13 01:33:22'),
(8, 'جلاكسو سميثكلين', '2023-04-13-64378a9a33193.png', 1, '2023-04-13 02:52:42', '2023-04-13 02:52:42'),
(9, 'ممفيس', '2023-04-13-64379af9803a7.png', 1, '2023-04-13 04:02:33', '2023-04-13 04:02:33'),
(10, 'جلاكسو سميث كلاين', '2023-04-13-64379b622e97d.png', 1, '2023-04-13 04:04:18', '2023-04-13 04:04:18'),
(11, 'أمون للأدوية', '2023-04-13-64379b9ae1f9a.png', 1, '2023-04-13 04:05:14', '2023-04-13 04:05:14'),
(12, 'نوفارتس', '2023-04-13-64379bf8dc46f.png', 1, '2023-04-13 04:06:48', '2023-04-13 04:06:48'),
(14, 'ايبيكو', '2023-04-14-6438b822ac8c5.png', 1, '2023-04-14 00:19:14', '2023-04-14 00:19:14'),
(15, 'الاسكندريه', '2023-04-14-6438cf1b616f5.png', 1, '2023-04-14 01:57:15', '2023-04-14 01:57:15'),
(16, 'آي بي إم فارما', '2023-04-15-6439f9e3aad6e.png', 1, '2023-04-14 23:12:03', '2023-04-14 23:12:03'),
(17, 'اب فارما', '2023-04-15-643a02b27a053.png', 1, '2023-04-14 23:17:35', '2023-04-14 23:49:38'),
(18, 'أبوت', '2023-04-15-643a0d582e905.png', 1, '2023-04-14 23:20:01', '2023-04-15 00:35:04'),
(19, 'أتوس فارما', '2023-04-15-643a0d2217c1f.png', 1, '2023-04-14 23:20:21', '2023-04-15 00:34:10'),
(20, 'أدفانس فارما -مصر', '2023-04-15-643a0c7f62b06.png', 1, '2023-04-14 23:20:50', '2023-04-15 00:31:27'),
(21, 'أدفوكيور', '2023-04-15-643a0c45833f8.png', 1, '2023-04-14 23:21:14', '2023-04-15 00:30:29'),
(24, 'أرابكوميد - مصر', '2023-04-15-643a0b89287bb.png', 1, '2023-04-14 23:22:43', '2023-04-15 00:27:21'),
(25, 'أراكس فارم', '2023-04-15-643a0a810d89e.png', 1, '2023-04-14 23:23:29', '2023-04-15 00:22:57'),
(26, 'أسترا زينيكا', '2023-04-15-643a0a0fd9e4a.png', 1, '2023-04-14 23:24:17', '2023-04-15 00:21:03'),
(27, 'أسينو', '2023-04-15-643a09c9ad049.png', 1, '2023-04-14 23:24:51', '2023-04-15 00:19:53'),
(28, 'أفانو فارما', '2023-04-15-643a20d8be210.png', 1, '2023-04-14 23:25:17', '2023-04-15 01:58:16'),
(29, 'أفيرويس فارما مصر', '2023-04-15-643a0fd4b9106.png', 1, '2023-04-14 23:25:36', '2023-04-15 00:45:40'),
(30, 'أفيسينا فارم', '2023-04-15-643a0f18cf7eb.png', 1, '2023-04-14 23:26:05', '2023-04-15 00:42:32'),
(31, 'أكادي فارما', '2023-04-15-643a0eda57177.png', 1, '2023-04-14 23:26:44', '2023-04-15 00:41:30'),
(32, 'أكتوبر فارما', '2023-04-15-643a0e7ebfa86.png', 1, '2023-04-14 23:27:03', '2023-04-15 00:39:58'),
(34, 'أكديما للتجاره الدوليه', '2023-04-15-643a0e1e541fc.png', 1, '2023-04-14 23:28:20', '2023-04-15 00:38:22'),
(36, 'أكسيديا فارما', '2023-04-15-643a0da043245.png', 1, '2023-04-14 23:29:18', '2023-04-15 00:36:16'),
(37, 'ألتونا هيلث', '2023-04-15-643a072aede25.png', 1, '2023-04-14 23:29:42', '2023-04-15 00:08:42'),
(38, 'ألفا جروب', '2023-04-15-643a096fee537.png', 1, '2023-04-14 23:29:55', '2023-04-15 00:18:23'),
(40, 'أم جي فارما', '2023-04-15-643a10bc941f5.png', 1, '2023-04-14 23:30:51', '2023-04-15 00:49:32'),
(45, 'أوبي فارما', '2023-04-15-643a0799db402.png', 1, '2023-04-14 23:33:22', '2023-04-15 00:10:33'),
(46, 'أوتسوكا', '2023-04-15-643a06cb7fb52.png', 1, '2023-04-14 23:33:48', '2023-04-15 00:07:07'),
(47, 'أورالين', 'def.png', 1, '2023-04-14 23:34:01', '2023-04-14 23:34:01'),
(48, 'أورجانو فارما', '2023-04-15-643a061190d3a.png', 1, '2023-04-14 23:34:16', '2023-04-15 00:04:01'),
(49, 'أوركيديا', '2023-04-15-643a05a9be67e.png', 1, '2023-04-14 23:34:31', '2023-04-15 00:02:17'),
(50, 'أوريجينال جروب', '2023-04-15-643a0560b6d02.png', 1, '2023-04-14 23:35:13', '2023-04-15 00:01:04'),
(51, 'أوكتابيوتك فارما', '2023-04-15-643a052dc3d61.png', 1, '2023-04-14 23:35:34', '2023-04-15 00:00:13'),
(52, 'أونست', '2023-04-15-643a04f0d4992.png', 1, '2023-04-14 23:35:44', '2023-04-14 23:59:12'),
(55, 'أي تي أم للصناعات الدوائيه', '2023-04-15-643a039fa6dbc.png', 1, '2023-04-14 23:37:11', '2023-04-14 23:53:35'),
(57, 'أبيك للادويه', '2023-04-15-643a020b5c0e2.png', 1, '2023-04-14 23:37:37', '2023-04-14 23:46:51'),
(58, 'ابن سينا', '2023-04-15-643a206a7dc70.png', 1, '2023-04-15 00:52:40', '2023-04-15 01:56:26'),
(59, 'ابيكس فارما', '2023-04-15-643a201404c13.png', 1, '2023-04-15 00:52:54', '2023-04-15 01:55:00'),
(60, 'اتكو فارما', '2023-04-15-643a1fce0eefa.png', 1, '2023-04-15 00:53:09', '2023-04-15 01:53:50'),
(61, 'اجلان فارما', '2023-04-15-643a1f92d0ec4.png', 1, '2023-04-15 00:53:20', '2023-04-15 01:52:50'),
(62, 'اطلس الادويه', '2023-04-15-643a1f56b7cea.png', 1, '2023-04-15 00:53:51', '2023-04-15 01:51:50'),
(63, 'الاندلس ميديكال', '2023-04-15-643a1f07eb46a.png', 1, '2023-04-15 00:54:18', '2023-04-15 01:50:31'),
(64, 'الخليج للصناعات الدوائيه', '2023-04-15-643a1ec879ba9.png', 1, '2023-04-15 00:54:56', '2023-04-15 01:49:28'),
(65, 'الشركاء المتحدون', '2023-04-15-643a1e3aecd4d.png', 1, '2023-04-15 00:55:15', '2023-04-15 01:47:06'),
(66, 'الشركه الاوربيه المصريه للصناعات الدوائيه', '2023-04-15-643a1dfe7f063.png', 1, '2023-04-15 00:55:59', '2023-04-15 01:46:06'),
(67, 'الشركه العالميه للادويه', '2023-04-15-643a1d45f2c6a.png', 1, '2023-04-15 00:56:20', '2023-04-15 01:43:01'),
(68, 'الشركه المتحده للتوزيع', '2023-04-15-643a1cf106bef.png', 1, '2023-04-15 00:56:50', '2023-04-15 01:41:37'),
(69, 'المتحدون فارما', '2023-04-15-643a1c91d6a56.png', 1, '2023-04-15 00:57:06', '2023-04-15 01:40:01'),
(70, 'المصريه فارمكس', '2023-04-15-643a1c0c7eb6c.png', 1, '2023-04-15 00:57:25', '2023-04-15 01:37:48'),
(71, 'النصر', '2023-04-15-643a216506c90.png', 1, '2023-04-15 00:57:33', '2023-04-15 02:00:37'),
(72, 'انتر فارما', '2023-04-15-643a1bb341a90.png', 1, '2023-04-15 00:57:52', '2023-04-15 01:36:19'),
(73, 'ايجي فارما', '2023-04-15-643a1aee45cc9.png', 1, '2023-04-15 00:58:07', '2023-04-15 01:33:02'),
(75, 'ايكونيك للادويه', '2023-04-15-643a1a4aa5550.png', 1, '2023-04-15 00:58:51', '2023-04-15 01:30:18'),
(77, 'بيوفارم مصر', '2023-04-15-643a1971411e8.png', 1, '2023-04-15 00:59:34', '2023-04-15 01:26:41'),
(78, 'تكنو للادويه', '2023-04-15-643a191ac2767.png', 1, '2023-04-15 00:59:57', '2023-04-15 01:25:14'),
(79, 'جلبوال ادفانسد للادويه', '2023-04-15-643a18b10ca62.png', 1, '2023-04-15 01:00:29', '2023-04-15 01:23:29'),
(80, 'جمجوم للادويه', '2023-04-15-643a18456e74f.png', 1, '2023-04-15 01:00:46', '2023-04-15 01:21:41'),
(82, 'جونسون اند جونسون', '2023-04-15-643a17bd20f50.png', 1, '2023-04-15 01:01:27', '2023-04-15 01:19:25'),
(83, 'جينيسيس للادويه', '2023-04-15-643a17766fe89.png', 1, '2023-04-15 01:01:45', '2023-04-15 01:18:14'),
(84, 'جيوفارما مصر', '2023-04-15-643a171458929.png', 1, '2023-04-15 01:02:00', '2023-04-15 01:16:36'),
(85, 'سفينكس فارما', '2023-04-15-643a165fcfa1d.png', 1, '2023-04-15 01:02:34', '2023-04-15 01:13:35'),
(86, 'سيديكو', '2023-04-15-643a15ed59ffc.png', 1, '2023-04-15 01:02:48', '2023-04-15 01:11:41'),
(87, 'شركه الدلتا للادويه', '2023-04-15-643a157fddd29.png', 1, '2023-04-15 01:03:14', '2023-04-15 01:09:51'),
(88, 'فاركو', '2023-04-15-643a152e0a91b.png', 1, '2023-04-15 01:03:30', '2023-04-15 01:08:30'),
(89, 'شركه الرواد للصناعات الدوائيه', '2023-04-15-643a14de61f50.png', 1, '2023-04-15 01:04:38', '2023-04-15 01:07:10'),
(90, 'لا روش', '2023-04-15-643b37bdd7935.png', 1, '2023-04-15 21:48:13', '2023-04-15 21:48:13'),
(91, 'باير', '2023-04-15-643b3830bcf71.png', 1, '2023-04-15 21:50:08', '2023-04-15 21:50:08'),
(92, 'حكمه', '2023-04-15-643b3873cfdd6.png', 1, '2023-04-15 21:51:15', '2023-04-15 21:51:15'),
(93, 'ميرك', '2023-04-15-643b38bee4e5c.png', 1, '2023-04-15 21:52:30', '2023-04-15 21:52:30'),
(94, 'مينا فارم', '2023-04-15-643b39165b7dd.png', 1, '2023-04-15 21:53:58', '2023-04-15 21:53:58'),
(95, 'تبوك', '2023-04-15-643b3959b5249.png', 1, '2023-04-15 21:55:05', '2023-04-15 21:55:05'),
(96, 'بيراميدز', '2023-04-15-643b39a27f271.png', 1, '2023-04-15 21:56:18', '2023-04-15 21:56:18'),
(97, 'سيجما', '2023-04-15-643b39de7d0a8.png', 1, '2023-04-15 21:57:18', '2023-04-15 21:57:18'),
(98, 'العامريه', '2023-04-15-643b3a09c7efe.png', 1, '2023-04-15 21:58:01', '2023-04-15 21:58:01'),
(99, 'فايزر', '2023-04-15-643b3a555f6fd.png', 1, '2023-04-15 21:59:17', '2023-04-15 21:59:17'),
(100, 'سكويب', 'def.png', 1, '2023-04-15 22:00:29', '2023-04-15 22:00:29'),
(101, 'القاهره', '2023-04-16-643b3aef60f8e.png', 1, '2023-04-15 22:01:51', '2023-04-15 22:01:51'),
(102, 'الشركه الفرعونيه', '2023-04-16-643b3b444a376.png', 1, '2023-04-15 22:03:16', '2023-04-15 22:03:16'),
(103, 'جلوبال نابي', '2023-04-16-643b3b842f6c4.png', 1, '2023-04-15 22:04:20', '2023-04-15 22:04:20');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '8', '2020-10-11 07:43:44', '2023-04-14 02:19:54'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":true},{\"id\":2,\"name\":\"\\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0629\",\"direction\":\"rtl\",\"code\":\"eg\",\"status\":1,\"default\":false}]', '2020-10-11 07:53:02', '2023-04-14 02:20:24'),
(3, 'mail_config', '{\"status\":0,\"name\":\"demo\",\"host\":\"mail.demo.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"info@demo.com\",\"email_id\":\"info@demo.com\",\"encryption\":\"TLS\",\"password\":\"demo\"}', '2020-10-12 10:29:18', '2021-07-06 12:32:01'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-25 21:21:15'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"environment\":\"sandbox\",\"store_id\":\"\",\"store_password\":\"\"}', '2020-11-09 08:36:51', '2023-01-10 05:51:56'),
(7, 'paypal', '{\"status\":\"0\",\"environment\":\"sandbox\",\"paypal_client_id\":\"\",\"paypal_secret\":\"\"}', '2020-11-09 08:51:39', '2023-01-10 05:51:56'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 09:01:47', '2021-07-06 12:30:05'),
(10, 'company_phone', '01019597185', NULL, '2020-12-08 14:15:01'),
(11, 'company_name', 'Nashmi', NULL, '2021-02-27 18:11:53'),
(12, 'company_web_logo', '2023-04-17-643d5f5181c82.png', NULL, '2023-04-17 13:01:37'),
(13, 'company_mobile_logo', '2021-02-20-6030c88c91911.png', NULL, '2021-02-20 14:30:04'),
(14, 'terms_condition', '<p>terms and conditions</p>', NULL, '2021-06-11 01:51:36'),
(15, 'about_us', '<p>this is about us page. hello and hi from about page description..</p>', NULL, '2021-06-11 01:42:53'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'Copy@semicolcon.com', NULL, '2021-03-15 12:29:51'),
(18, 'colors', '{\"primary\":\"#1d62ed\",\"secondary\":\"#000000\"}', '2020-10-11 13:53:02', '2023-04-18 03:02:34'),
(19, 'company_footer_logo', '2023-04-17-643d5f518303f.png', NULL, '2023-04-17 13:01:37'),
(20, 'company_copyright_text', 'CopyRight 6amTech@2021', NULL, '2021-03-15 12:30:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/www.target.com\\/s\\/apple+store++now?ref=tgt_adv_XS000000&AFID=msn&fndsrc=tgtao&DFA=71700000012505188&CPNG=Electronics_Portable+Computers&adgroup=Portable+Computers&LID=700000001176246&LNM=apple+store+near+me+now&MT=b&network=s&device=c&location=12&targetid=kwd-81913773633608:loc-12&ds_rl=1246978&ds_rl=1248099&gclsrc=ds\"}', NULL, '2020-12-08 12:54:53'),
(22, 'download_app_google_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}', NULL, '2020-12-08 12:54:48'),
(23, 'company_fav_icon', '2021-03-02-603df1634614f.png', '2020-10-11 13:53:02', '2021-03-02 14:03:48'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'Put your firebase server key here.', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"order pen message\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"Order con Message\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"Order pro Message\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"Order ouut Message\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"Order del Message\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', NULL, '2021-07-06 12:30:14'),
(33, 'sales_commission', '0', NULL, '2021-06-11 18:13:13'),
(34, 'seller_registration', '1', NULL, '2021-06-04 21:02:48'),
(35, 'pnc_language', '[\"en\",\"eg\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"Order hh Message\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":null,\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(43, 'terms_and_conditions', '', NULL, NULL),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<p>my privacy policy</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2021-07-06 11:09:07'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 12:30:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 12:30:23'),
(48, 'currency_model', 'single_currency', NULL, NULL),
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"}]', NULL, NULL),
(50, 'digital_payment', '{\"status\":\"1\"}', NULL, NULL),
(51, 'phone_verification', '1', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '0', NULL, NULL),
(54, 'country_code', 'EG', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'inhouse_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'bkash', '{\"status\":\"0\",\"environment\":\"sandbox\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, '2023-01-10 05:51:56'),
(59, 'forgot_password_verification', 'email', NULL, NULL),
(60, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-21 03:01:40'),
(61, 'stock_limit', '10', NULL, NULL),
(62, 'flutterwave', '{\"status\":1,\"public_key\":\"\",\"secret_key\":\"\",\"hash\":\"\"}', NULL, NULL),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', NULL, NULL),
(64, 'announcement', '{\"status\":\"1\",\"color\":\"#000000\",\"text_color\":\"#000000\",\"announcement\":\"\\u0627\\u0647\\u0644\\u0627\"}', NULL, NULL),
(65, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(66, 'recaptcha', '{\"status\":\"0\",\"site_key\":\"6LfpzEolAAAAAE1AIicE786ZlTJeknR86ywx5Whf\",\"secret_key\":\"6LfpzEolAAAAAL2KMN-mKAJuiusputQ3WCChC5Lz\"}', '2023-03-31 18:52:37', '2023-03-31 18:52:37'),
(67, 'seller_pos', '0', NULL, NULL),
(68, 'liqpay', '{\"status\":0,\"public_key\":\"\",\"private_key\":\"\"}', NULL, NULL),
(69, 'paytm', '{\"status\":0,\"environment\":\"sandbox\",\"paytm_merchant_key\":\"\",\"paytm_merchant_mid\":\"\",\"paytm_merchant_website\":\"\",\"paytm_refund_url\":\"\"}', NULL, '2023-01-10 05:51:56'),
(70, 'refund_day_limit', '0', NULL, NULL),
(71, 'business_mode', 'multi', NULL, NULL),
(72, 'mail_config_sendgrid', '{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}', NULL, NULL),
(73, 'decimal_point_settings', '2', NULL, NULL),
(74, 'shop_address', 'cairo', NULL, NULL),
(75, 'billing_input_by_customer', '1', NULL, NULL),
(76, 'wallet_status', '0', NULL, NULL),
(77, 'loyalty_point_status', '0', NULL, NULL),
(78, 'wallet_add_refund', '0', NULL, NULL),
(79, 'loyalty_point_exchange_rate', '0', NULL, NULL),
(80, 'loyalty_point_item_purchase_point', '0', NULL, NULL),
(81, 'loyalty_point_minimum_point', '0', NULL, NULL),
(82, 'minimum_order_limit', '1', NULL, NULL),
(83, 'product_brand', '1', NULL, NULL),
(84, 'digital_product', '1', NULL, NULL),
(85, 'delivery_boy_expected_delivery_date_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(86, 'order_canceled', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(87, 'refund-policy', '{\"status\":1,\"content\":\"\"}', NULL, '2023-03-04 06:25:36'),
(88, 'return-policy', '{\"status\":1,\"content\":\"\"}', NULL, '2023-03-04 06:25:36'),
(89, 'cancellation-policy', '{\"status\":1,\"content\":\"\"}', NULL, '2023-03-04 06:25:36'),
(90, 'offline_payment', '{\"status\":0}', NULL, '2023-03-04 06:25:36'),
(91, 'temporary_close', '{\"status\":0}', NULL, '2023-03-04 06:25:36'),
(92, 'vacation_add', '{\"status\":0,\"vacation_start_date\":null,\"vacation_end_date\":null,\"vacation_note\":null}', NULL, '2023-03-04 06:25:36'),
(93, 'cookie_setting', '{\"status\":0,\"cookie_text\":null}', NULL, '2023-03-04 06:25:36'),
(94, 'timezone', 'UTC', NULL, NULL),
(95, 'default_location', '{\"lat\":null,\"lng\":null}', NULL, NULL),
(96, 'map_api_key', 'AIzaSyCrIStYLavaCbivcKb47QgYp6gqSyMRyRQ', NULL, NULL),
(97, 'map_api_key_server', 'AIzaSyCrIStYLavaCbivcKb47QgYp6gqSyMRyRQ', NULL, NULL),
(98, 'whatsapp', '{\"status\":null,\"phone\":null}', '2023-03-31 18:54:18', '2023-03-31 18:54:18'),
(99, 'currency_symbol_position', 'right', '2023-04-14 02:22:54', '2023-04-14 02:24:48');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_type` varchar(20) NOT NULL DEFAULT 'physical',
  `digital_product_type` varchar(30) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `choices` text DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `variant` text DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 1,
  `tax` double NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 1,
  `tax_model` varchar(20) NOT NULL DEFAULT 'exclude',
  `slug` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `thumbnail` varchar(191) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippings`
--

CREATE TABLE `cart_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `created_at`, `updated_at`, `home_status`, `priority`) VALUES
(1, 'مستحضرات تجميل', 'msthdrat-tgmyl', '2023-04-18-643e20ad0a143.png', 0, 0, '2023-03-22 01:57:17', '2023-04-18 02:46:37', 1, 3),
(5, 'اثاث طبي', 'athath-tby', '2023-04-13-643770a50e538.png', 0, 0, '2023-04-13 01:01:57', '2023-04-13 01:02:04', 1, 4),
(6, 'كيماويات', 'kymaoyat', '2023-04-16-643b524591f25.png', 0, 0, '2023-04-13 01:04:08', '2023-04-15 23:41:25', 1, 4),
(7, 'الادويه', 'aladoyh', '2023-04-18-643e1fd3d3b28.png', 0, 0, '2023-04-13 01:12:20', '2023-04-18 02:42:59', 1, 2),
(8, 'اجهزه طبيه', 'aghzh-tbyh', '2023-04-13-64379eb9b5934.png', 0, 0, '2023-04-13 01:14:02', '2023-04-13 04:18:33', 1, 2),
(9, 'مكملات غدائيه', 'mkmlat-ghdayyh', '2023-04-13-64379f3c81571.png', 0, 0, '2023-04-13 01:14:29', '2023-04-13 04:20:44', 1, 2),
(10, 'مستلزمات طبيه', 'mstlzmat-tbyh', '2023-04-18-643e21fd1c524.png', 0, 0, '2023-04-13 01:41:33', '2023-04-18 02:52:13', 1, 2),
(11, 'demo sub categoriy', 'demo-sub-categoriy', NULL, 1, 1, '2023-05-11 12:16:39', '2023-05-11 12:16:39', 0, 0),
(12, 'demo sub sub category', 'demo-sub-sub-category', NULL, 11, 2, '2023-05-11 12:17:37', '2023-05-11 12:17:37', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_shipping_costs`
--

CREATE TABLE `category_shipping_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_shipping_costs`
--

INSERT INTO `category_shipping_costs` (`id`, `seller_id`, `category_id`, `cost`, `multiply_qty`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 0.00, NULL, '2023-04-15 23:29:33', '2023-04-15 23:29:33'),
(2, 0, 5, 0.00, NULL, '2023-04-15 23:29:33', '2023-04-15 23:29:33'),
(3, 0, 6, 0.00, NULL, '2023-04-15 23:29:33', '2023-04-15 23:29:33'),
(4, 0, 7, 0.00, NULL, '2023-04-15 23:29:33', '2023-04-15 23:29:33'),
(5, 0, 8, 0.00, NULL, '2023-04-15 23:29:33', '2023-04-15 23:29:33'),
(6, 0, 9, 0.00, NULL, '2023-04-15 23:29:33', '2023-04-15 23:29:33'),
(7, 0, 10, 0.00, NULL, '2023-04-15 23:29:33', '2023-04-15 23:29:33');

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `message` text NOT NULL,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_admin` tinyint(1) DEFAULT NULL,
  `sent_by_delivery_man` tinyint(1) DEFAULT NULL,
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_admin` tinyint(1) DEFAULT NULL,
  `seen_by_delivery_man` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `mobile_number` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `feedback` varchar(191) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(3, 'Mike Day', 'no-replyRall@gmail.com', '81127646384', 'NEW: Semrush Backlinks', 'Hi \r\n \r\nThis is Mike Day\r\n \r\nLet me introduce to you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your medicalexcel.org SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\n \r\nRegards \r\n \r\nMike Day\r\n \r\nmike@strictlydigital.net', 0, '0', '2023-04-19 10:33:55', '2023-04-19 10:33:55', NULL),
(4, 'Mike Babcock', 'no-replyRall@gmail.com', '89628397313', 'Domain Authority of your medicalexcel.org', 'Hi there \r\n \r\nJust checked your medicalexcel.org in MOZ and saw that you could use an authority boost. \r\n \r\nWith our service you will get a guaranteed Domain Authority score within just 3 months time. This will increase the organic visibility and strengthen your website authority, thus getting it stronger against G updates as well. \r\n \r\nFor more information, please check our offers \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\nNEW: Semrush DA is now possible \r\nhttps://www.monkeydigital.co/semrush-da/ \r\n \r\nThanks and regards \r\nMike Babcock', 0, '0', '2023-04-22 18:19:38', '2023-04-22 18:19:38', NULL),
(5, 'Mike Douglas', 'no-replyRall@gmail.com', '87282293147', 'Improve local visibility for medicalexcel.org', 'If you have a local business and want to rank it on google maps in a specific area then this service is for you. \r\n \r\nGoogle Map Stacking is one of the best ways to rank your GMB in a specific mile radius. \r\n \r\nMore info: \r\nhttps://www.speed-seo.net/product/google-maps-pointers/ \r\n \r\nThanks and Regards \r\nMike Douglas\r\n \r\n \r\nPS: Want an all in one Local Plan that includes everything? \r\nhttps://www.speed-seo.net/product/local-seo-package/', 0, '0', '2023-04-25 17:34:12', '2023-04-25 17:34:12', NULL),
(6, 'Mike Shackley', 'no-replyRall@gmail.com', '81622533216', 'AI Monthly SEO plans', 'Greetings \r\n \r\nI have just took an in depth look on your  medicalexcel.org for its SEO metrics and saw that your website could use a push. \r\n \r\nWe will improve your ranks organically and safely, using state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.hilkom-digital.de/cheap-seo-packages/ \r\n \r\nRegards \r\nMike Shackley', 0, '0', '2023-05-01 08:16:10', '2023-05-01 08:16:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) NOT NULL DEFAULT 'admin',
  `coupon_type` varchar(50) DEFAULT NULL,
  `coupon_bearer` varchar(191) NOT NULL DEFAULT 'inhouse',
  `seller_id` bigint(20) DEFAULT NULL COMMENT 'NULL=in-house, 0=all seller',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '0 = all customer',
  `title` varchar(100) DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'USD', '1', 1, NULL, '2023-04-14 02:22:26'),
(2, 'BDT', '৳', 'BDT', '84', 1, NULL, '2021-07-06 11:52:58'),
(3, 'Indian Rupi', '₹', 'INR', '60', 1, '2020-10-15 17:23:04', '2021-06-04 18:26:38'),
(4, 'Euro', '€', 'EUR', '100', 1, '2021-05-25 21:00:23', '2021-06-04 18:25:29'),
(5, 'YEN', '¥', 'JPY', '110', 1, '2021-06-10 22:08:31', '2021-06-26 14:21:10'),
(8, 'EGP', 'EGP', 'EGP', '1', 1, '2023-03-24 02:19:03', '2023-04-15 22:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `royality_points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) DEFAULT NULL,
  `transaction_method` varchar(30) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(12) NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deal_of_the_days`
--

INSERT INTO `deal_of_the_days` (`id`, `title`, `product_id`, `discount`, `discount_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'اكس', 26, '25.00', 'percent', 0, '2023-04-13 02:59:58', '2023-04-14 17:32:34'),
(2, 'اكس', 27, '0.00', 'flat', 1, '2023-04-13 03:32:25', '2023-04-14 17:36:31'),
(3, 'اكس', 32, '28.00', 'percent', 0, '2023-04-14 17:34:59', '2023-04-14 17:36:31');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_notifications`
--

CREATE TABLE `deliveryman_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_wallets`
--

CREATE TABLE `deliveryman_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `current_balance` decimal(50,2) NOT NULL DEFAULT 0.00,
  `cash_in_hand` decimal(50,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(50,2) NOT NULL DEFAULT 0.00,
  `total_withdraw` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_country_codes`
--

CREATE TABLE `delivery_country_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `deliveryman_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_transactions`
--

CREATE TABLE `delivery_man_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `transaction_id` char(36) NOT NULL,
  `debit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `identity_number` varchar(30) DEFAULT NULL,
  `identity_type` varchar(50) DEFAULT NULL,
  `identity_image` varchar(191) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_online` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) NOT NULL DEFAULT '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',
  `fcm_token` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_zip_codes`
--

CREATE TABLE `delivery_zip_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zipcode` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contacts`
--

CREATE TABLE `emergency_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) DEFAULT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`, `product_id`, `deal_type`) VALUES
(1, 'اكس', '2023-12-04', '2023-12-05', 0, 0, NULL, NULL, '2023-04-14-6438d6a7a2591.png', 'aks', '2023-04-14 02:29:27', '2023-04-14 17:32:33', NULL, 'flash_deal'),
(2, 'العروض المميزه', '2023-12-04', '2023-02-05', 1, 0, NULL, NULL, 'def.png', 'alaarod-almmyzh', '2023-04-14 02:33:33', '2023-04-14 17:36:30', NULL, 'feature_deal');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `ranking` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_08_105159_create_admins_table', 1),
(5, '2020_09_08_111837_create_admin_roles_table', 1),
(6, '2020_09_16_142451_create_categories_table', 2),
(7, '2020_09_16_181753_create_categories_table', 3),
(8, '2020_09_17_134238_create_brands_table', 4),
(9, '2020_09_17_203054_create_attributes_table', 5),
(10, '2020_09_19_112509_create_coupons_table', 6),
(11, '2020_09_19_161802_create_curriencies_table', 7),
(12, '2020_09_20_114509_create_sellers_table', 8),
(13, '2020_09_23_113454_create_shops_table', 9),
(14, '2020_09_23_115615_create_shops_table', 10),
(15, '2020_09_23_153822_create_shops_table', 11),
(16, '2020_09_21_122817_create_products_table', 12),
(17, '2020_09_22_140800_create_colors_table', 12),
(18, '2020_09_28_175020_create_products_table', 13),
(19, '2020_09_28_180311_create_products_table', 14),
(20, '2020_10_04_105041_create_search_functions_table', 15),
(21, '2020_10_05_150730_create_customers_table', 15),
(22, '2020_10_08_133548_create_wishlists_table', 16),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 17),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 17),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 17),
(26, '2016_06_01_000004_create_oauth_clients_table', 17),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 17),
(28, '2020_10_06_133710_create_product_stocks_table', 17),
(29, '2020_10_06_134636_create_flash_deals_table', 17),
(30, '2020_10_06_134719_create_flash_deal_products_table', 17),
(31, '2020_10_08_115439_create_orders_table', 17),
(32, '2020_10_08_115453_create_order_details_table', 17),
(33, '2020_10_08_121135_create_shipping_addresses_table', 17),
(34, '2020_10_10_171722_create_business_settings_table', 17),
(35, '2020_09_19_161802_create_currencies_table', 18),
(36, '2020_10_12_152350_create_reviews_table', 18),
(37, '2020_10_12_161834_create_reviews_table', 19),
(38, '2020_10_12_180510_create_support_tickets_table', 20),
(39, '2020_10_14_140130_create_transactions_table', 21),
(40, '2020_10_14_143553_create_customer_wallets_table', 21),
(41, '2020_10_14_143607_create_customer_wallet_histories_table', 21),
(42, '2020_10_22_142212_create_support_ticket_convs_table', 21),
(43, '2020_10_24_234813_create_banners_table', 22),
(44, '2020_10_27_111557_create_shipping_methods_table', 23),
(45, '2020_10_27_114154_add_url_to_banners_table', 24),
(46, '2020_10_28_170308_add_shipping_id_to_order_details', 25),
(47, '2020_11_02_140528_add_discount_to_order_table', 26),
(48, '2020_11_03_162723_add_column_to_order_details', 27),
(49, '2020_11_08_202351_add_url_to_banners_table', 28),
(50, '2020_11_10_112713_create_help_topic', 29),
(51, '2020_11_10_141513_create_contacts_table', 29),
(52, '2020_11_15_180036_add_address_column_user_table', 30),
(53, '2020_11_18_170209_add_status_column_to_product_table', 31),
(54, '2020_11_19_115453_add_featured_status_product', 32),
(55, '2020_11_21_133302_create_deal_of_the_days_table', 33),
(56, '2020_11_20_172332_add_product_id_to_products', 34),
(57, '2020_11_27_234439_add__state_to_shipping_addresses', 34),
(58, '2020_11_28_091929_create_chattings_table', 35),
(59, '2020_12_02_011815_add_bank_info_to_sellers', 36),
(60, '2020_12_08_193234_create_social_medias_table', 37),
(61, '2020_12_13_122649_shop_id_to_chattings', 37),
(62, '2020_12_14_145116_create_seller_wallet_histories_table', 38),
(63, '2020_12_14_145127_create_seller_wallets_table', 38),
(64, '2020_12_15_174804_create_admin_wallets_table', 39),
(65, '2020_12_15_174821_create_admin_wallet_histories_table', 39),
(66, '2020_12_15_214312_create_feature_deals_table', 40),
(67, '2020_12_17_205712_create_withdraw_requests_table', 41),
(68, '2021_02_22_161510_create_notifications_table', 42),
(69, '2021_02_24_154706_add_deal_type_to_flash_deals', 43),
(70, '2021_03_03_204349_add_cm_firebase_token_to_users', 44),
(71, '2021_04_17_134848_add_column_to_order_details_stock', 45),
(72, '2021_05_12_155401_add_auth_token_seller', 46),
(73, '2021_06_03_104531_ex_rate_update', 47),
(74, '2021_06_03_222413_amount_withdraw_req', 48),
(75, '2021_06_04_154501_seller_wallet_withdraw_bal', 49),
(76, '2021_06_04_195853_product_dis_tax', 50),
(77, '2021_05_27_103505_create_product_translations_table', 51),
(78, '2021_06_17_054551_create_soft_credentials_table', 51),
(79, '2021_06_29_212549_add_active_col_user_table', 52),
(80, '2021_06_30_212619_add_col_to_contact', 53),
(81, '2021_07_01_160828_add_col_daily_needs_products', 54),
(82, '2021_07_04_182331_add_col_seller_sales_commission', 55),
(83, '2021_08_07_190655_add_seo_columns_to_products', 56),
(84, '2021_08_07_205913_add_col_to_category_table', 56),
(85, '2021_08_07_210808_add_col_to_shops_table', 56),
(86, '2021_08_14_205216_change_product_price_col_type', 56),
(87, '2021_08_16_201505_change_order_price_col', 56),
(88, '2021_08_16_201552_change_order_details_price_col', 56),
(89, '2019_09_29_154000_create_payment_cards_table', 57),
(90, '2021_08_17_213934_change_col_type_seller_earning_history', 57),
(91, '2021_08_17_214109_change_col_type_admin_earning_history', 57),
(92, '2021_08_17_214232_change_col_type_admin_wallet', 57),
(93, '2021_08_17_214405_change_col_type_seller_wallet', 57),
(94, '2021_08_22_184834_add_publish_to_products_table', 57),
(95, '2021_09_08_211832_add_social_column_to_users_table', 57),
(96, '2021_09_13_165535_add_col_to_user', 57),
(97, '2021_09_19_061647_add_limit_to_coupons_table', 57),
(98, '2021_09_20_020716_add_coupon_code_to_orders_table', 57),
(99, '2021_09_23_003059_add_gst_to_sellers_table', 57),
(100, '2021_09_28_025411_create_order_transactions_table', 57),
(101, '2021_10_02_185124_create_carts_table', 57),
(102, '2021_10_02_190207_create_cart_shippings_table', 57),
(103, '2021_10_03_194334_add_col_order_table', 57),
(104, '2021_10_03_200536_add_shipping_cost', 57),
(105, '2021_10_04_153201_add_col_to_order_table', 57),
(106, '2021_10_07_172701_add_col_cart_shop_info', 57),
(107, '2021_10_07_184442_create_phone_or_email_verifications_table', 57),
(108, '2021_10_07_185416_add_user_table_email_verified', 57),
(109, '2021_10_11_192739_add_transaction_amount_table', 57),
(110, '2021_10_11_200850_add_order_verification_code', 57),
(111, '2021_10_12_083241_add_col_to_order_transaction', 57),
(112, '2021_10_12_084440_add_seller_id_to_order', 57),
(113, '2021_10_12_102853_change_col_type', 57),
(114, '2021_10_12_110434_add_col_to_admin_wallet', 57),
(115, '2021_10_12_110829_add_col_to_seller_wallet', 57),
(116, '2021_10_13_091801_add_col_to_admin_wallets', 57),
(117, '2021_10_13_092000_add_col_to_seller_wallets_tax', 57),
(118, '2021_10_13_165947_rename_and_remove_col_seller_wallet', 57),
(119, '2021_10_13_170258_rename_and_remove_col_admin_wallet', 57),
(120, '2021_10_14_061603_column_update_order_transaction', 57),
(121, '2021_10_15_103339_remove_col_from_seller_wallet', 57),
(122, '2021_10_15_104419_add_id_col_order_tran', 57),
(123, '2021_10_15_213454_update_string_limit', 57),
(124, '2021_10_16_234037_change_col_type_translation', 57),
(125, '2021_10_16_234329_change_col_type_translation_1', 57),
(126, '2021_10_27_091250_add_shipping_address_in_order', 58),
(127, '2021_01_24_205114_create_paytabs_invoices_table', 59),
(128, '2021_11_20_043814_change_pass_reset_email_col', 59),
(129, '2021_11_25_043109_create_delivery_men_table', 60),
(130, '2021_11_25_062242_add_auth_token_delivery_man', 60),
(131, '2021_11_27_043405_add_deliveryman_in_order_table', 60),
(132, '2021_11_27_051432_create_delivery_histories_table', 60),
(133, '2021_11_27_051512_add_fcm_col_for_delivery_man', 60),
(134, '2021_12_15_123216_add_columns_to_banner', 60),
(135, '2022_01_04_100543_add_order_note_to_orders_table', 60),
(136, '2022_01_10_034952_add_lat_long_to_shipping_addresses_table', 60),
(137, '2022_01_10_045517_create_billing_addresses_table', 60),
(138, '2022_01_11_040755_add_is_billing_to_shipping_addresses_table', 60),
(139, '2022_01_11_053404_add_billing_to_orders_table', 60),
(140, '2022_01_11_234310_add_firebase_toke_to_sellers_table', 60),
(141, '2022_01_16_121801_change_colu_type', 60),
(142, '2022_01_22_101601_change_cart_col_type', 61),
(143, '2022_01_23_031359_add_column_to_orders_table', 61),
(144, '2022_01_28_235054_add_status_to_admins_table', 61),
(145, '2022_02_01_214654_add_pos_status_to_sellers_table', 61),
(146, '2019_12_14_000001_create_personal_access_tokens_table', 62),
(147, '2022_02_11_225355_add_checked_to_orders_table', 62),
(148, '2022_02_14_114359_create_refund_requests_table', 62),
(149, '2022_02_14_115757_add_refund_request_to_order_details_table', 62),
(150, '2022_02_15_092604_add_order_details_id_to_transactions_table', 62),
(151, '2022_02_15_121410_create_refund_transactions_table', 62),
(152, '2022_02_24_091236_add_multiple_column_to_refund_requests_table', 62),
(153, '2022_02_24_103827_create_refund_statuses_table', 62),
(154, '2022_03_01_121420_add_refund_id_to_refund_transactions_table', 62),
(155, '2022_03_10_091943_add_priority_to_categories_table', 63),
(156, '2022_03_13_111914_create_shipping_types_table', 63),
(157, '2022_03_13_121514_create_category_shipping_costs_table', 63),
(158, '2022_03_14_074413_add_four_column_to_products_table', 63),
(159, '2022_03_15_105838_add_shipping_to_carts_table', 63),
(160, '2022_03_16_070327_add_shipping_type_to_orders_table', 63),
(161, '2022_03_17_070200_add_delivery_info_to_orders_table', 63),
(162, '2022_03_18_143339_add_shipping_type_to_carts_table', 63),
(163, '2022_04_06_020313_create_subscriptions_table', 64),
(164, '2022_04_12_233704_change_column_to_products_table', 64),
(165, '2022_04_19_095926_create_jobs_table', 64),
(166, '2022_05_12_104247_create_wallet_transactions_table', 65),
(167, '2022_05_12_104511_add_two_column_to_users_table', 65),
(168, '2022_05_14_063309_create_loyalty_point_transactions_table', 65),
(169, '2022_05_26_044016_add_user_type_to_password_resets_table', 65),
(170, '2022_04_15_235820_add_provider', 66),
(171, '2022_07_21_101659_add_code_to_products_table', 66),
(172, '2022_07_26_103744_add_notification_count_to_notifications_table', 66),
(173, '2022_07_31_031541_add_minimum_order_qty_to_products_table', 66),
(174, '2022_08_11_172839_add_product_type_and_digital_product_type_and_digital_file_ready_to_products', 67),
(175, '2022_08_11_173941_add_product_type_and_digital_product_type_and_digital_file_to_order_details', 67),
(176, '2022_08_20_094225_add_product_type_and_digital_product_type_and_digital_file_ready_to_carts_table', 67),
(177, '2022_10_04_160234_add_banking_columns_to_delivery_men_table', 68),
(178, '2022_10_04_161339_create_deliveryman_wallets_table', 68),
(179, '2022_10_04_184506_add_deliverymanid_column_to_withdraw_requests_table', 68),
(180, '2022_10_11_103011_add_deliverymans_columns_to_chattings_table', 68),
(181, '2022_10_11_144902_add_deliverman_id_cloumn_to_reviews_table', 68),
(182, '2022_10_17_114744_create_order_status_histories_table', 68),
(183, '2022_10_17_120840_create_order_expected_delivery_histories_table', 68),
(184, '2022_10_18_084245_add_deliveryman_charge_and_expected_delivery_date', 68),
(185, '2022_10_18_130938_create_delivery_zip_codes_table', 68),
(186, '2022_10_18_130956_create_delivery_country_codes_table', 68),
(187, '2022_10_20_164712_create_delivery_man_transactions_table', 68),
(188, '2022_10_27_145604_create_emergency_contacts_table', 68),
(189, '2022_10_29_182930_add_is_pause_cause_to_orders_table', 68),
(190, '2022_10_31_150604_add_address_phone_country_code_column_to_delivery_men_table', 68),
(191, '2022_11_05_185726_add_order_id_to_reviews_table', 68),
(192, '2022_11_07_190749_create_deliveryman_notifications_table', 68),
(193, '2022_11_08_132745_change_transaction_note_type_to_withdraw_requests_table', 68),
(194, '2022_11_10_193747_chenge_order_amount_seller_amount_admin_commission_delivery_charge_tax_toorder_transactions_table', 68),
(195, '2022_12_17_035723_few_field_add_to_coupons_table', 69),
(196, '2022_12_26_231606_add_coupon_discount_bearer_and_admin_commission_to_orders', 69),
(197, '2023_01_04_003034_alter_billing_addresses_change_zip', 69),
(198, '2023_01_05_121600_change_id_to_transactions_table', 69),
(199, '2023_02_02_113330_create_product_tag_table', 70),
(200, '2023_02_02_114518_create_tags_table', 70),
(201, '2023_02_02_152248_add_tax_model_to_products_table', 70),
(202, '2023_02_02_152718_add_tax_model_to_order_details_table', 70),
(203, '2023_02_02_171034_add_tax_type_to_carts', 70),
(204, '2023_02_06_124447_add_color_image_column_to_products_table', 70),
(205, '2023_02_07_120136_create_withdrawal_methods_table', 70),
(206, '2023_02_07_175939_add_withdrawal_method_id_and_withdrawal_method_fields_to_withdraw_requests_table', 70),
(207, '2023_02_08_143314_add_vacation_start_and_vacation_end_and_vacation_not_column_to_shops_table', 70),
(208, '2023_02_09_104656_add_payment_by_and_payment_not_to_orders_table', 70);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `notification_count` int(11) NOT NULL DEFAULT 0,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:25:41', '2021-07-05 09:25:41', '2022-07-05 15:25:41'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:24:36', '2021-07-05 09:24:36', '2022-07-05 15:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`, `provider`) VALUES
(1, NULL, '6amtech', 'GEUx5tqkviM6AAQcz4oi1dcm1KtRdJPgw41lj0eI', 'http://localhost', 1, 0, 0, '2020-10-21 18:27:22', '2020-10-21 18:27:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-21 18:27:23', '2020-10-21 18:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `customer_type` varchar(10) DEFAULT NULL,
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) DEFAULT NULL,
  `transaction_ref` varchar(30) DEFAULT NULL,
  `payment_by` varchar(191) DEFAULT NULL,
  `payment_note` text DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `admin_commission` decimal(8,2) NOT NULL DEFAULT 0.00,
  `is_pause` varchar(20) NOT NULL DEFAULT '0',
  `cause` varchar(191) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `coupon_discount_bearer` varchar(191) NOT NULL DEFAULT 'inhouse',
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `order_group_id` varchar(191) NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) NOT NULL DEFAULT '0',
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `shipping_address_data` text DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `deliveryman_charge` double NOT NULL DEFAULT 0,
  `expected_delivery_date` date DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_data` text DEFAULT NULL,
  `order_type` varchar(191) NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_discount_type` varchar(191) DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) DEFAULT NULL,
  `delivery_type` varchar(191) DEFAULT NULL,
  `delivery_service_name` varchar(191) DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `order_status`, `payment_method`, `transaction_ref`, `payment_by`, `payment_note`, `order_amount`, `admin_commission`, `is_pause`, `cause`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `coupon_discount_bearer`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `deliveryman_charge`, `expected_delivery_date`, `order_note`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `delivery_service_name`, `third_party_delivery_tracking_id`) VALUES
(100001, '3', 'customer', 'paid', 'processing', 'cash_on_delivery', '', NULL, NULL, 4340.5, '0.00', '0', NULL, '1', '2023-03-29 10:56:25', '2023-04-18 03:08:29', 0, NULL, '0', 'inhouse', 2, 5.00, '1758-uEpRT-1680094585', '331107', 2, 'seller', '{\"id\":1,\"customer_id\":0,\"contact_person_name\":\"\\u202aAlaa Mohamed\\u202c\\u200f3\",\"address_type\":\"home\",\"address\":\"egg\",\"city\":\"\\u0645\\u0635\\u0631\",\"zip\":\"3753450\",\"phone\":\"01140404211\",\"created_at\":\"2023-03-29T12:56:14.000000Z\",\"updated_at\":\"2023-03-29T12:56:14.000000Z\",\"state\":null,\"country\":\"Egypt\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100002, '3', 'customer', 'paid', 'pending', 'cash_on_delivery', '', NULL, NULL, 134.94, '0.00', '0', NULL, '1', '2023-03-29 10:56:25', '2023-04-18 03:07:56', 0, NULL, '0', 'inhouse', 2, 5.00, '1758-uEpRT-1680094585', '397819', 1, 'admin', '{\"id\":1,\"customer_id\":0,\"contact_person_name\":\"\\u202aAlaa Mohamed\\u202c\\u200f3\",\"address_type\":\"home\",\"address\":\"egg\",\"city\":\"\\u0645\\u0635\\u0631\",\"zip\":\"3753450\",\"phone\":\"01140404211\",\"created_at\":\"2023-03-29T12:56:14.000000Z\",\"updated_at\":\"2023-03-29T12:56:14.000000Z\",\"state\":null,\"country\":\"Egypt\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100003, '3', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', NULL, NULL, 175, '0.00', '0', NULL, '1', '2023-03-29 10:56:25', '2023-04-19 03:24:21', 0, NULL, '0', 'inhouse', 2, 5.00, '1758-uEpRT-1680094585', '477345', 1, 'seller', '{\"id\":1,\"customer_id\":0,\"contact_person_name\":\"\\u202aAlaa Mohamed\\u202c\\u200f3\",\"address_type\":\"home\",\"address\":\"egg\",\"city\":\"\\u0645\\u0635\\u0631\",\"zip\":\"3753450\",\"phone\":\"01140404211\",\"created_at\":\"2023-03-29T12:56:14.000000Z\",\"updated_at\":\"2023-03-29T12:56:14.000000Z\",\"state\":null,\"country\":\"Egypt\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100004, '4', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', NULL, NULL, 365, '0.00', '0', NULL, '2', '2023-04-12 22:09:08', '2023-04-18 03:07:12', 0, NULL, '0', 'inhouse', 2, 5.00, '8111-i0QY2-1681344548', '285072', 1, 'seller', '{\"id\":2,\"customer_id\":0,\"contact_person_name\":\"\\u202aAlaa Mohamed\\u202c\\u200f3\",\"address_type\":\"permanent\",\"address\":\"egg\",\"city\":\"\\u0645\\u0635\\u0631\",\"zip\":\"3753450\",\"phone\":\"01140404211\",\"created_at\":\"2023-04-13T00:08:57.000000Z\",\"updated_at\":\"2023-04-13T00:08:57.000000Z\",\"state\":null,\"country\":\"Egypt\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100005, '4', 'customer', 'unpaid', 'confirmed', 'cash_on_delivery', '', NULL, NULL, 256.25, '0.00', '0', NULL, '2', '2023-04-12 22:09:09', '2023-04-12 22:10:42', 0, NULL, '0', 'inhouse', 2, 5.00, '8111-i0QY2-1681344548', '494890', 2, 'seller', '{\"id\":2,\"customer_id\":0,\"contact_person_name\":\"\\u202aAlaa Mohamed\\u202c\\u200f3\",\"address_type\":\"permanent\",\"address\":\"egg\",\"city\":\"\\u0645\\u0635\\u0631\",\"zip\":\"3753450\",\"phone\":\"01140404211\",\"created_at\":\"2023-04-13T00:08:57.000000Z\",\"updated_at\":\"2023-04-13T00:08:57.000000Z\",\"state\":null,\"country\":\"Egypt\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100006, '5', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', NULL, NULL, 70, '0.00', '0', NULL, '3', '2023-04-13 22:40:50', '2023-04-18 03:06:25', 0, NULL, '0', 'inhouse', 2, 5.00, '5151-fwZVl-1681432850', '239127', 1, 'admin', '{\"id\":3,\"customer_id\":5,\"contact_person_name\":\"\\u0645\\u062d\\u0645\\u062f\",\"address_type\":\"home\",\"address\":\"\\u0627\\u0644\\u0639\\u0631\\u064a\\u0634\",\"city\":\"\\u0633\\u064a\\u0646\\u0627\\u0621\",\"zip\":\"medosd@gma\",\"phone\":\"01019597185\",\"created_at\":\"2023-04-14T00:40:06.000000Z\",\"updated_at\":\"2023-04-14T00:40:06.000000Z\",\"state\":null,\"country\":\"Angola\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, 'hhhhh', NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100007, '5', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', NULL, NULL, 1212.5, '0.00', '0', NULL, '3', '2023-04-13 22:40:50', '2023-04-18 03:05:52', 0, NULL, '0', 'inhouse', 2, 5.00, '5151-fwZVl-1681432850', '632031', 4, 'seller', '{\"id\":3,\"customer_id\":5,\"contact_person_name\":\"\\u0645\\u062d\\u0645\\u062f\",\"address_type\":\"home\",\"address\":\"\\u0627\\u0644\\u0639\\u0631\\u064a\\u0634\",\"city\":\"\\u0633\\u064a\\u0646\\u0627\\u0621\",\"zip\":\"medosd@gma\",\"phone\":\"01019597185\",\"created_at\":\"2023-04-14T00:40:06.000000Z\",\"updated_at\":\"2023-04-14T00:40:06.000000Z\",\"state\":null,\"country\":\"Angola\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, 'hhhhh', NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100008, '5', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', NULL, NULL, 417, '0.00', '0', NULL, '3', '2023-04-13 22:45:25', '2023-04-13 23:30:37', 0, NULL, '0', 'inhouse', 2, 5.00, '6955-FWg1H-1681433125', '687051', 3, 'seller', '{\"id\":3,\"customer_id\":5,\"contact_person_name\":\"\\u0645\\u062d\\u0645\\u062f\",\"address_type\":\"home\",\"address\":\"\\u0627\\u0644\\u0639\\u0631\\u064a\\u0634\",\"city\":\"\\u0633\\u064a\\u0646\\u0627\\u0621\",\"zip\":\"medosd@gma\",\"phone\":\"01019597185\",\"created_at\":\"2023-04-14T00:40:06.000000Z\",\"updated_at\":\"2023-04-14T00:40:06.000000Z\",\"state\":null,\"country\":\"Angola\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 50, '2023-12-05', NULL, 3, '{\"id\":3,\"customer_id\":5,\"contact_person_name\":\"\\u0645\\u062d\\u0645\\u062f\",\"address_type\":\"home\",\"address\":\"\\u0627\\u0644\\u0639\\u0631\\u064a\\u0634\",\"city\":\"\\u0633\\u064a\\u0646\\u0627\\u0621\",\"zip\":\"medosd@gma\",\"phone\":\"01019597185\",\"created_at\":\"2023-04-14T00:40:06.000000Z\",\"updated_at\":\"2023-04-14T00:40:06.000000Z\",\"state\":null,\"country\":\"Angola\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `digital_file_after_sell` varchar(191) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `tax_model` varchar(20) NOT NULL DEFAULT 'exclude',
  `delivery_status` varchar(15) NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `variation` varchar(255) DEFAULT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `refund_request` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `digital_file_after_sell`, `product_details`, `qty`, `price`, `tax`, `discount`, `tax_model`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(1, 100001, 11, 2, NULL, '{\"id\":11,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Entresto\",\"slug\":\"entresto-qQxSvI\",\"product_type\":\"digital\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":null,\"min_qty\":1,\"refundable\":1,\"digital_product_type\":\"ready_after_sell\",\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-29-6424341042cd9.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-03-29-64243410443c7.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[]\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":35,\"purchase_price\":22,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":0,\"minimum_order_qty\":120,\"details\":\"<h2>Entresto<\\/h2>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-29T12:50:24.000000Z\",\"updated_at\":\"2023-03-29T12:50:25.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"169033\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 121, 35, 0, 0, 'include', 'pending', 'unpaid', '2023-03-29 10:56:25', '2023-03-29 10:56:25', NULL, '', '[]', 'discount_on_product', 1, 0),
(2, 100001, 12, 2, NULL, '{\"id\":12,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Capozide\",\"slug\":\"capozide-XRmrOy\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1}]\",\"brand_id\":2,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-29-6424346a36cbb.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-03-29-6424346a38348.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":50.25,\"purchase_price\":49,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":300,\"minimum_order_qty\":1,\"details\":\"<p>&nbsp;Capozide<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-29T12:51:54.000000Z\",\"updated_at\":\"2023-03-29T12:51:59.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"148532\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 50.25, 0, 0, 'include', 'pending', 'unpaid', '2023-03-29 10:56:25', '2023-03-29 10:56:25', NULL, '', '[]', 'discount_on_product', 1, 0),
(3, 100002, 6, 1, NULL, '{\"id\":6,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Congestal\",\"slug\":\"congestal-sSSn0I\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":2,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-24-641cbee463714.png\\\",\\\"2023-03-24-641cbee46487c.png\\\",\\\"2023-03-24-641cbee4649a9.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-03-24-641cbee464bcf.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":64.97,\"purchase_price\":59.98,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":30,\"minimum_order_qty\":1,\"details\":\"<p>It is one of the most important medicines for treating colds and influenza, as it helps relieve headaches, pain, cold, sore throat and watery eyes, due to the active substances it contains, and it is better to consult a specialist before taking it.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-24T03:04:36.000000Z\",\"updated_at\":\"2023-03-24T03:20:46.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"105580\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 64.97, 0, 0, 'include', 'pending', 'unpaid', '2023-03-29 10:56:25', '2023-03-29 10:56:25', NULL, '', '[]', 'discount_on_product', 1, 0),
(4, 100003, 9, 1, NULL, '{\"id\":9,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"Pseudoephedrine\",\"slug\":\"pseudoephedrine-edvTMd\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"gms\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-28-642377ae93778.png\\\",\\\"2023-03-28-642377ae952c8.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-03-28-642377ae95415.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":120,\"purchase_price\":110,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":110,\"minimum_order_qty\":1,\"details\":\"<p>Pseudoephedrine<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-28T23:26:38.000000Z\",\"updated_at\":\"2023-03-28T23:27:02.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"148231\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 120, 0, 0, 'include', 'delivered', 'unpaid', '2023-03-29 10:56:25', '2023-04-19 03:24:21', NULL, '', '[]', 'discount_on_product', 1, 0),
(5, 100003, 10, 1, NULL, '{\"id\":10,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"Milga Advance\",\"slug\":\"milga-advance-UJVUMC\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":2,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-29-642432622c3e1.png\\\",\\\"2023-03-29-6424326230090.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-03-29-642432623021b.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":50,\"purchase_price\":45,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":300,\"minimum_order_qty\":1,\"details\":\"<h1>Milga Advance<\\/h1>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-29T12:43:14.000000Z\",\"updated_at\":\"2023-03-29T12:43:16.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2023-03-29-6424326230366.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"145417\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 50, 0, 0, 'include', 'delivered', 'unpaid', '2023-03-29 10:56:25', '2023-04-19 03:24:21', NULL, '', '[]', 'discount_on_product', 1, 0),
(6, 100004, 9, 1, NULL, '{\"id\":9,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"Pseudoephedrine\",\"slug\":\"pseudoephedrine-edvTMd\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"gms\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-28-642377ae93778.png\\\",\\\"2023-03-28-642377ae952c8.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-03-28-642377ae95415.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":120,\"purchase_price\":110,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":109,\"minimum_order_qty\":1,\"details\":\"<p>Pseudoephedrine<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-28T23:26:38.000000Z\",\"updated_at\":\"2023-03-29T12:56:25.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"148231\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 3, 120, 0, 0, 'include', 'delivered', 'unpaid', '2023-04-12 22:09:08', '2023-04-18 03:07:12', NULL, '', '[]', 'discount_on_product', 1, 0),
(7, 100005, 12, 2, NULL, '{\"id\":12,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Capozide\",\"slug\":\"capozide-XRmrOy\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1}]\",\"brand_id\":2,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-29-6424346a36cbb.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-03-29-6424346a38348.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":50.25,\"purchase_price\":49,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":298,\"minimum_order_qty\":1,\"details\":\"<p>&nbsp;Capozide<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-29T12:51:54.000000Z\",\"updated_at\":\"2023-03-29T12:56:25.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"148532\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 5, 50.25, 0, 0, 'include', 'pending', 'unpaid', '2023-04-12 22:09:09', '2023-04-12 22:09:09', NULL, '', '[]', 'discount_on_product', 1, 0),
(8, 100006, 5, 1, NULL, '{\"id\":5,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0643\\u0648\\u0645\\u062a\\u0631\\u064a\\u0643\\u0633\",\"slug\":\"comtrex-jLL4IA\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"7\\\",\\\"position\\\":1}]\",\"brand_id\":8,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-24-641cbe70b6afa.png\\\",\\\"2023-03-24-641cbe70b8008.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-04-13-6437833b5fe2c.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":65,\"purchase_price\":54.98,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":49,\"minimum_order_qty\":1,\"details\":\"<p>\\u064a\\u0633\\u0627\\u0639\\u062f \\u0647\\u0630\\u0627 \\u0627\\u0644\\u0646\\u0648\\u0639 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u062e\\u0644\\u0635 \\u0645\\u0646 \\u0627\\u0644\\u0631\\u0634\\u062d \\u0648\\u0627\\u062d\\u062a\\u0642\\u0627\\u0646 \\u0627\\u0644\\u062c\\u064a\\u0648\\u0628 \\u0627\\u0644\\u0623\\u0646\\u0641\\u064a\\u0629\\u060c \\u0644\\u0627\\u062d\\u062a\\u0648\\u0627\\u0626\\u0647 \\u0639\\u0644\\u0649 \\u0645\\u0648\\u0627\\u062f \\u0641\\u0639\\u0627\\u0644\\u0629 \\u0645\\u062b\\u0644 \\u0628\\u0631\\u0648\\u0645\\u0641\\u064a\\u0646\\u064a\\u0631\\u0627\\u0645\\u064a\\u0646\\u060c \\u0628\\u0627\\u0631\\u0627\\u0633\\u064a\\u062a\\u0627\\u0645\\u0648\\u0644\\u060c \\u0628\\u0633\\u064a\\u062f\\u0648\\u0641\\u064a\\u062f\\u0631\\u064a\\u0646\\u060c \\u0648\\u0644\\u0627 \\u064a\\u0641\\u0636\\u0644 \\u062a\\u0646\\u0627\\u0648\\u0644\\u0647 \\u0644\\u0645\\u0631\\u0636\\u0649 \\u0627\\u0644\\u063a\\u062f\\u0629 \\u0627\\u0644\\u062f\\u0631\\u0642\\u064a\\u0629\\u060c \\u0648\\u0627\\u0644\\u0623\\u0637\\u0641\\u0627\\u0644 \\u062a\\u062d\\u062a \\u0633\\u0646 6 \\u0633\\u0646\\u0648\\u0627\\u062a.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-24T03:02:40.000000Z\",\"updated_at\":\"2023-04-13T04:54:17.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2023-04-13-6437834d1c8cc.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"101984\",\"reviews_count\":0,\"translations\":[{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":5,\"locale\":\"eg\",\"key\":\"name\",\"value\":\"\\u0643\\u0648\\u0645\\u062a\\u0631\\u064a\\u0643\\u0633\",\"id\":7},{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":5,\"locale\":\"eg\",\"key\":\"description\",\"value\":\"<p>\\u064a\\u0633\\u0627\\u0639\\u062f \\u0647\\u0630\\u0627 \\u0627\\u0644\\u0646\\u0648\\u0639 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u062e\\u0644\\u0635 \\u0645\\u0646 \\u0627\\u0644\\u0631\\u0634\\u062d \\u0648\\u0627\\u062d\\u062a\\u0642\\u0627\\u0646 \\u0627\\u0644\\u062c\\u064a\\u0648\\u0628 \\u0627\\u0644\\u0623\\u0646\\u0641\\u064a\\u0629\\u060c \\u0644\\u0627\\u062d\\u062a\\u0648\\u0627\\u0626\\u0647 \\u0639\\u0644\\u0649 \\u0645\\u0648\\u0627\\u062f \\u0641\\u0639\\u0627\\u0644\\u0629 \\u0645\\u062b\\u0644 \\u0628\\u0631\\u0648\\u0645\\u0641\\u064a\\u0646\\u064a\\u0631\\u0627\\u0645\\u064a\\u0646\\u060c \\u0628\\u0627\\u0631\\u0627\\u0633\\u064a\\u062a\\u0627\\u0645\\u0648\\u0644\\u060c \\u0628\\u0633\\u064a\\u062f\\u0648\\u0641\\u064a\\u062f\\u0631\\u064a\\u0646\\u060c \\u0648\\u0644\\u0627 \\u064a\\u0641\\u0636\\u0644 \\u062a\\u0646\\u0627\\u0648\\u0644\\u0647 \\u0644\\u0645\\u0631\\u0636\\u0649 \\u0627\\u0644\\u063a\\u062f\\u0629 \\u0627\\u0644\\u062f\\u0631\\u0642\\u064a\\u0629\\u060c \\u0648\\u0627\\u0644\\u0623\\u0637\\u0641\\u0627\\u0644 \\u062a\\u062d\\u062a \\u0633\\u0646 6 \\u0633\\u0646\\u0648\\u0627\\u062a.<\\/p>\",\"id\":8}],\"reviews\":[]}', 1, 65, 0, 0, 'include', 'delivered', 'unpaid', '2023-04-13 22:40:50', '2023-04-18 03:06:25', NULL, '', '[]', 'discount_on_product', 1, 0),
(9, 100007, 26, 4, NULL, '{\"id\":26,\"added_by\":\"seller\",\"user_id\":4,\"name\":\"\\u0627\\u0643\\u0633 \\u0628\\u0644\\u0627\\u0643 \\u0646\\u0627\\u064a\\u062a \\u0645\\u0632\\u064a\\u0644 \\u0639\\u0631\\u0642 150\\u0645\\u0644\",\"slug\":\"aks-blak-nayt-mzyl-aark-150ml-JGnEGt\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1}]\",\"brand_id\":6,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-04-13-64376855738dd.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-04-13-6437685574dbb.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":70,\"purchase_price\":70,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":25,\"discount_type\":\"percent\",\"current_stock\":100,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-04-13T02:26:29.000000Z\",\"updated_at\":\"2023-04-13T03:21:08.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2023-04-13-6437685574fdb.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"167553\",\"reviews_count\":0,\"translations\":[{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":26,\"locale\":\"eg\",\"key\":\"name\",\"value\":\"\\u0627\\u0643\\u0633 \\u0628\\u0644\\u0627\\u0643 \\u0646\\u0627\\u064a\\u062a \\u0645\\u0632\\u064a\\u0644 \\u0639\\u0631\\u0642 150\\u0645\\u0644\",\"id\":31}],\"reviews\":[]}', 23, 70, 0, 402.5, 'exclude', 'delivered', 'unpaid', '2023-04-13 22:40:50', '2023-04-18 03:05:52', NULL, '', '[]', 'discount_on_product', 1, 0),
(10, 100008, 18, 3, NULL, '{\"id\":18,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"\\u062f\\u0648\\u0641 \\u0643\\u0631\\u064a\\u0645  \\u0644\\u062a\\u063a\\u062f\\u064a\\u0647 \\u0627\\u0644\\u0634\\u0639\\u0631 75 \\u0645\\u0644\",\"slug\":\"dof-krym-ltghdyh-alshaar-75-ml-rwIZkK\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1}]\",\"brand_id\":6,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-04-13-64375a5c0ac13.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-04-13-64375a5c0c33f.png\",\"featured\":0,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":29,\"purchase_price\":29,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":100,\"minimum_order_qty\":5,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-04-13T01:26:52.000000Z\",\"updated_at\":\"2023-04-13T03:36:43.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u062f\\u0648\\u0641 \\u0643\\u0631\\u064a\\u0645  \\u0644\\u062a\\u063a\\u062f\\u064a\\u0647 \\u0627\\u0644\\u0634\\u0639\\u0631 75 \\u0645\\u0644\",\"meta_description\":null,\"meta_image\":\"2023-04-13-64375a5c0c562.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"136305\",\"reviews_count\":0,\"translations\":[{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":18,\"locale\":\"eg\",\"key\":\"name\",\"value\":\"\\u062f\\u0648\\u0641 \\u0643\\u0631\\u064a\\u0645  \\u0644\\u062a\\u063a\\u062f\\u064a\\u0647 \\u0627\\u0644\\u0634\\u0639\\u0631 75 \\u0645\\u0644\",\"id\":38}],\"reviews\":[]}', 5, 29, 0, 0, 'include', 'delivered', 'unpaid', '2023-04-13 22:45:25', '2023-04-13 23:30:37', NULL, '', '[]', 'discount_on_product', 1, 0),
(11, 100008, 20, 3, NULL, '{\"id\":20,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"\\u0634\\u0627\\u0645\\u0628\\u0648 \\u0643\\u0644\\u064a\\u0631 \\u0631\\u062c\\u0627\\u0644\\u064a 180 \\u0645\\u0644\",\"slug\":\"shambo-klyr-rgaly-180-ml-4RnsXs\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1}]\",\"brand_id\":6,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-04-13-64375dcaa3d76.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-04-13-64375dcaa7b0d.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":38,\"purchase_price\":38,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1000,\"minimum_order_qty\":5,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-04-13T01:41:30.000000Z\",\"updated_at\":\"2023-04-13T03:36:08.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u0634\\u0627\\u0645\\u0628\\u0648 \\u0643\\u0644\\u064a\\u0631 \\u0631\\u062c\\u0627\\u0644\\u064a 180 \\u0645\\u0644\",\"meta_description\":null,\"meta_image\":\"2023-04-13-64375dcaa7dbb.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"149359\",\"reviews_count\":0,\"translations\":[{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":20,\"locale\":\"eg\",\"key\":\"name\",\"value\":\"\\u0634\\u0627\\u0645\\u0628\\u0648 \\u0643\\u0644\\u064a\\u0631 \\u0631\\u062c\\u0627\\u0644\\u064a 180 \\u0645\\u0644\",\"id\":36}],\"reviews\":[]}', 5, 38, 0, 0, 'include', 'delivered', 'unpaid', '2023-04-13 22:45:25', '2023-04-13 23:30:37', NULL, '', '[]', 'discount_on_product', 1, 0),
(12, 100008, 22, 3, NULL, '{\"id\":22,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"\\u0627\\u0643\\u0633 \\u0628\\u0644\\u0627\\u0643 \\u0646\\u0627\\u064a\\u062a \\u0645\\u0632\\u064a\\u0644 \\u0639\\u0631\\u0642 150\\u0645\\u0644\",\"slug\":\"aks-blak-nayt-mzyl-aark-150ml-Ka9MtL\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1}]\",\"brand_id\":6,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-04-13-643763cc3936b.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-04-13-643763cc3a51d.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":77,\"purchase_price\":50,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1000,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-04-13T02:07:08.000000Z\",\"updated_at\":\"2023-04-13T05:25:35.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u0627\\u0643\\u0633 \\u0628\\u0644\\u0627\\u0643 \\u0646\\u0627\\u064a\\u062a \\u0645\\u0632\\u064a\\u0644 \\u0639\\u0631\\u0642 150\\u0645\\u0644\",\"meta_description\":null,\"meta_image\":\"2023-04-13-643763cc3a654.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"162200\",\"reviews_count\":0,\"translations\":[{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":22,\"locale\":\"eg\",\"key\":\"name\",\"value\":\"\\u0627\\u0643\\u0633 \\u0628\\u0644\\u0627\\u0643 \\u0646\\u0627\\u064a\\u062a \\u0645\\u0632\\u064a\\u0644 \\u0639\\u0631\\u0642 150\\u0645\\u0644\",\"id\":35}],\"reviews\":[]}', 1, 77, 0, 0, 'include', 'delivered', 'unpaid', '2023-04-13 22:45:25', '2023-04-13 23:30:37', NULL, '', '[]', 'discount_on_product', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_expected_delivery_histories`
--

CREATE TABLE `order_expected_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `expected_delivery_date` date NOT NULL,
  `cause` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status_histories`
--

CREATE TABLE `order_status_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `cause` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status_histories`
--

INSERT INTO `order_status_histories` (`id`, `order_id`, `user_id`, `user_type`, `status`, `cause`, `created_at`, `updated_at`) VALUES
(1, 100001, 3, 'customer', 'pending', NULL, '2023-03-29 10:56:25', '2023-03-29 10:56:25'),
(2, 100002, 3, 'customer', 'pending', NULL, '2023-03-29 10:56:25', '2023-03-29 10:56:25'),
(3, 100003, 3, 'customer', 'pending', NULL, '2023-03-29 10:56:25', '2023-03-29 10:56:25'),
(4, 100001, 2, 'seller', 'confirmed', NULL, '2023-03-29 10:58:14', '2023-03-29 10:58:14'),
(5, 100001, 2, 'seller', 'processing', NULL, '2023-03-29 10:59:21', '2023-03-29 10:59:21'),
(6, 100004, 4, 'customer', 'pending', NULL, '2023-04-12 22:09:08', '2023-04-12 22:09:08'),
(7, 100005, 4, 'customer', 'pending', NULL, '2023-04-12 22:09:09', '2023-04-12 22:09:09'),
(8, 100005, 0, 'admin', 'confirmed', NULL, '2023-04-12 22:10:42', '2023-04-12 22:10:42'),
(9, 100006, 5, 'customer', 'pending', NULL, '2023-04-13 22:40:50', '2023-04-13 22:40:50'),
(10, 100007, 5, 'customer', 'pending', NULL, '2023-04-13 22:40:50', '2023-04-13 22:40:50'),
(11, 100008, 5, 'customer', 'pending', NULL, '2023-04-13 22:45:25', '2023-04-13 22:45:25'),
(12, 100008, 3, 'seller', 'confirmed', NULL, '2023-04-13 22:47:24', '2023-04-13 22:47:24'),
(13, 100008, 3, 'seller', 'processing', NULL, '2023-04-13 22:48:10', '2023-04-13 22:48:10'),
(14, 100008, 0, 'admin', 'out_for_delivery', NULL, '2023-04-13 23:30:10', '2023-04-13 23:30:10'),
(15, 100008, 0, 'admin', 'delivered', NULL, '2023-04-13 23:30:37', '2023-04-13 23:30:37'),
(16, 100007, 0, 'admin', 'delivered', NULL, '2023-04-18 03:05:52', '2023-04-18 03:05:52'),
(17, 100006, 0, 'admin', 'delivered', NULL, '2023-04-18 03:06:25', '2023-04-18 03:06:25'),
(18, 100004, 0, 'admin', 'delivered', NULL, '2023-04-18 03:07:12', '2023-04-18 03:07:12'),
(19, 100003, 0, 'admin', 'delivered', NULL, '2023-04-19 03:24:21', '2023-04-19 03:24:21');

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `seller_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_amount` decimal(50,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(50,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(50,2) NOT NULL DEFAULT 0.00,
  `received_by` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `delivery_charge` decimal(50,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `delivered_by` varchar(191) NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_transactions`
--

INSERT INTO `order_transactions` (`seller_id`, `order_id`, `order_amount`, `seller_amount`, `admin_commission`, `received_by`, `status`, `delivery_charge`, `tax`, `created_at`, `updated_at`, `customer_id`, `seller_is`, `delivered_by`, `payment_method`, `transaction_id`, `id`) VALUES
(3, 100008, '412.00', '412.00', '0.00', 'admin', 'disburse', '5.00', '0.00', '2023-04-13 23:30:37', '2023-04-13 23:30:37', 5, 'seller', 'admin', 'cash_on_delivery', '1415-uzRTA-1681435837', 1),
(4, 100007, '1207.50', '1207.50', '0.00', 'admin', 'disburse', '5.00', '0.00', '2023-04-18 03:05:52', '2023-04-18 03:05:52', 5, 'seller', 'admin', 'cash_on_delivery', '2781-ah3Z9-1681794352', 2),
(1, 100006, '65.00', '65.00', '0.00', 'admin', 'disburse', '5.00', '0.00', '2023-04-18 03:06:25', '2023-04-18 03:06:25', 5, 'admin', 'admin', 'cash_on_delivery', '1417-F6qT9-1681794385', 3),
(1, 100004, '360.00', '360.00', '0.00', 'admin', 'disburse', '5.00', '0.00', '2023-04-18 03:07:12', '2023-04-18 03:07:12', 4, 'seller', 'admin', 'cash_on_delivery', '8308-kmiiV-1681794432', 4),
(1, 100003, '170.00', '170.00', '0.00', 'admin', 'disburse', '5.00', '0.00', '2023-04-19 03:24:21', '2023-04-19 03:24:21', 3, 'seller', 'admin', 'cash_on_delivery', '6352-fLXss-1681881861', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `identity` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paytabs_invoices`
--

CREATE TABLE `paytabs_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `result` text NOT NULL,
  `response_code` int(10) UNSIGNED NOT NULL,
  `pt_invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_first_six_digits` int(10) UNSIGNED DEFAULT NULL,
  `card_last_four_digits` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_or_email_verifications`
--

CREATE TABLE `phone_or_email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone_or_email` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `product_type` varchar(20) NOT NULL DEFAULT 'physical',
  `category_ids` varchar(80) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `unit` varchar(191) DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(1) NOT NULL DEFAULT 1,
  `digital_product_type` varchar(30) DEFAULT NULL,
  `digital_file_ready` varchar(191) DEFAULT NULL,
  `images` longtext DEFAULT NULL,
  `color_image` text NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `flash_deal` varchar(255) DEFAULT NULL,
  `video_provider` varchar(30) DEFAULT NULL,
  `video_url` varchar(150) DEFAULT NULL,
  `colors` varchar(150) DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT 0,
  `attributes` varchar(255) DEFAULT NULL,
  `choice_options` text DEFAULT NULL,
  `variation` text DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `unit_price` double NOT NULL DEFAULT 0,
  `purchase_price` double NOT NULL DEFAULT 0,
  `tax` varchar(191) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) DEFAULT NULL,
  `tax_model` varchar(20) NOT NULL DEFAULT 'exclude',
  `discount` varchar(191) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `minimum_order_qty` int(11) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured_status` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT 0,
  `denied_note` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `temp_shipping_cost` double(8,2) DEFAULT NULL,
  `is_shipping_cost_updated` tinyint(1) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `parent_id`, `name`, `slug`, `product_type`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `digital_product_type`, `digital_file_ready`, `images`, `color_image`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `tax_model`, `discount`, `discount_type`, `current_stock`, `minimum_order_qty`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`, `code`) VALUES
(71, 'admin', 1, NULL, 'Demo Product 22', 'demo-product-22-sfx10f', 'physical', '[{\"id\":\"10\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"12\",\"position\":3}]', 103, 'pc', 23, 0, NULL, NULL, '[\"def.png\"]', '', '', NULL, NULL, 'youtube', 'https://www.youtube.com/watch?v=2D-rr4gv3fk', '[]', 0, '[]', '[]', '[]', 0, 100, 59, '0', NULL, 'exclude', '90', 'percent', 100, 1, 'hhhhh', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 'admin', 1, NULL, 'Nathan Sears', 'nathan-sears-RlcKmw', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"12\",\"position\":3}]', 37, 'kg', 1, 1, NULL, NULL, '[\"2023-05-16-6462dfc24c886.png\"]', '[]', '2023-05-16-6462dfc32326c.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 100, 385, '0', 'percent', 'include', '111', 'percent', 62, 29, '.', 0, NULL, '2023-05-15 22:43:31', '2023-05-15 22:43:31', 1, 1, NULL, NULL, 'def.png', 1, NULL, 73.00, 0, NULL, NULL, '170655'),
(100, 'seller', 7, 71, 'Demo Product 22', 'demo-product-22-sfx10f', 'physical', '[{\"id\":\"10\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"12\",\"position\":3}]', 103, 'pc', 23, 0, NULL, NULL, '[\"def.png\"]', '', '', NULL, NULL, 'youtube', 'https://www.youtube.com/watch?v=2D-rr4gv3fk', '[]', 0, '[]', '[]', '[]', 0, 100, 59, '0', NULL, 'exclude', '10', 'percent', 99, 1, 'hhhhh', 0, NULL, '2023-05-16 17:24:10', '2023-05-16 17:24:10', 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 'seller', 7, 88, 'Nathan Sears', 'nathan-sears-RlcKmw', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"12\",\"position\":3}]', 37, 'kg', 1, 1, NULL, NULL, '[\"2023-05-16-6462dfc24c886.png\"]', '[]', '2023-05-16-6462dfc32326c.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 100, 385, '0', 'percent', 'exclude', '20', 'percent', 77, 29, '.', 0, NULL, '2023-05-16 17:24:16', '2023-05-16 17:24:16', 1, 1, NULL, NULL, 'def.png', 1, NULL, 73.00, 0, NULL, NULL, '170655'),
(102, 'seller', 5, 88, 'Nathan Sears', 'nathan-sears-RlcKmw', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"12\",\"position\":3}]', 37, 'kg', 1, 1, NULL, NULL, '[\"2023-05-16-6462dfc24c886.png\"]', '[]', '2023-05-16-6462dfc32326c.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 100, 385, '0', 'percent', 'exclude', '30', 'percent', 88, 29, '.', 0, NULL, '2023-05-16 17:24:16', '2023-05-16 17:24:16', 1, 1, NULL, NULL, 'def.png', 1, NULL, 73.00, 0, NULL, NULL, '170655'),
(103, 'seller', 5, 71, 'Demo Product 22', 'demo-product-22-sfx10f', 'physical', '[{\"id\":\"10\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"12\",\"position\":3}]', 103, 'pc', 23, 0, NULL, NULL, '[\"def.png\"]', '', '', NULL, NULL, 'youtube', 'https://www.youtube.com/watch?v=2D-rr4gv3fk', '[]', 0, '[]', '[]', '[]', 0, 100, 59, '0', NULL, 'exclude', '40', 'percent', 100, 1, 'hhhhh', 0, NULL, '2023-05-16 17:24:10', '2023-05-16 17:24:10', 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 'seller', 5, 71, 'Demo Product 22', 'demo-product-22-sfx10f', 'physical', '[{\"id\":\"10\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"12\",\"position\":3}]', 103, 'pc', 23, 0, NULL, NULL, '[\"def.png\"]', '', '', NULL, NULL, 'youtube', 'https://www.youtube.com/watch?v=2D-rr4gv3fk', '[]', 0, '[]', '[]', '[]', 0, 100, 59, '0', NULL, 'exclude', '60', 'percent', 100, 1, 'hhhhh', 0, NULL, '2023-05-16 17:24:10', '2023-05-16 17:24:10', 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 'admin', 1, NULL, 'Emi Byrdewf', 'emi-byrdewf-7gurF6', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"12\",\"position\":3}]', 3, 'kg', 1, 1, NULL, NULL, '[]', '', '2023-05-20-6468afbb3f000.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 1, 1, '0', 'percent', 'exclude', '1', 'percent', 9999999, 1, '.', 0, NULL, '2023-05-20 08:32:11', '2023-05-20 08:32:11', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '170655'),
(106, 'seller', 2, 105, 'Emi Byrdewf', 'emi-byrdewf-7gurF6', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"12\",\"position\":3}]', 3, 'kg', 1, 1, NULL, NULL, '[]', '', '2023-05-20-6468afbb3f000.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 1, 1, '0', 'percent', 'exclude', '1', 'percent', 9999999, 1, '.', 0, NULL, '2023-05-20 08:40:50', '2023-05-20 08:40:50', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '170655'),
(107, 'seller', 2, 88, 'Nathan Sears', 'nathan-sears-RlcKmw', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"12\",\"position\":3}]', 37, 'kg', 1, 1, NULL, NULL, '[\"2023-05-16-6462dfc24c886.png\"]', '[]', '2023-05-16-6462dfc32326c.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 100, 385, '0', 'percent', 'exclude', '60', 'percent', 62, 29, '.', 0, NULL, '2023-05-20 08:42:13', '2023-05-20 08:42:13', 1, 1, NULL, NULL, 'def.png', 1, NULL, 73.00, 0, NULL, NULL, '170655'),
(108, 'seller', 2, 71, 'Demo Product 22', 'demo-product-22-sfx10f', 'physical', '[{\"id\":\"10\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"12\",\"position\":3}]', 103, 'pc', 23, 0, NULL, NULL, '[\"def.png\"]', '', '', NULL, NULL, 'youtube', 'https://www.youtube.com/watch?v=2D-rr4gv3fk', '[]', 0, '[]', '[]', '[]', 0, 100, 59, '0', NULL, 'exclude', '90', 'percent', 100, 1, 'hhhhh', 0, NULL, '2023-05-20 08:42:16', '2023-05-20 08:42:16', 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 'admin', 1, NULL, 'Hedy Castro', 'hedy-castro-NQzZGY', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"12\",\"position\":3}]', 25, 'ltrs', 1, 1, NULL, NULL, '[]', '', '2023-05-20-6468b4b71a09b.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 1, 1, '0', 'percent', 'exclude', '1', 'percent', 9999999, 1, '.', 0, NULL, '2023-05-20 08:53:27', '2023-05-20 08:53:27', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '170655'),
(112, 'seller', 2, 109, 'Hedy Castro', 'hedy-castro-NQzZGY', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"12\",\"position\":3}]', 25, 'ltrs', 1, 1, NULL, NULL, '[]', '', '2023-05-20-6468b4b71a09b.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 1, 1, '0', 'percent', 'exclude', '25', 'percent', 9999999, 1, '.', 0, NULL, '2023-05-20 08:59:57', '2023-05-20 08:59:57', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '170655');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 13, 1, NULL, NULL),
(2, 98, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `refund_reason` longtext NOT NULL,
  `images` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_note` longtext DEFAULT NULL,
  `rejected_note` longtext DEFAULT NULL,
  `payment_info` longtext DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_statuses`
--

CREATE TABLE `refund_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refund_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL,
  `change_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_transactions`
--

CREATE TABLE `refund_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_for` varchar(191) DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_by` varchar(191) DEFAULT NULL,
  `paid_to` varchar(191) DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_status` varchar(191) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `comment` mediumtext DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `is_saved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(150) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `visible_for` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_functions`
--

INSERT INTO `search_functions` (`id`, `key`, `url`, `visible_for`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'admin/dashboard', 'admin', NULL, NULL),
(2, 'Order All', 'admin/orders/list/all', 'admin', NULL, NULL),
(3, 'Order Pending', 'admin/orders/list/pending', 'admin', NULL, NULL),
(4, 'Order Processed', 'admin/orders/list/processed', 'admin', NULL, NULL),
(5, 'Order Delivered', 'admin/orders/list/delivered', 'admin', NULL, NULL),
(6, 'Order Returned', 'admin/orders/list/returned', 'admin', NULL, NULL),
(7, 'Order Failed', 'admin/orders/list/failed', 'admin', NULL, NULL),
(8, 'Brand Add', 'admin/brand/add-new', 'admin', NULL, NULL),
(9, 'Brand List', 'admin/brand/list', 'admin', NULL, NULL),
(10, 'Banner', 'admin/banner/list', 'admin', NULL, NULL),
(11, 'Category', 'admin/category/view', 'admin', NULL, NULL),
(12, 'Sub Category', 'admin/category/sub-category/view', 'admin', NULL, NULL),
(13, 'Sub sub category', 'admin/category/sub-sub-category/view', 'admin', NULL, NULL),
(14, 'Attribute', 'admin/attribute/view', 'admin', NULL, NULL),
(15, 'Product', 'admin/product/list', 'admin', NULL, NULL),
(16, 'Coupon', 'admin/coupon/add-new', 'admin', NULL, NULL),
(17, 'Custom Role', 'admin/custom-role/create', 'admin', NULL, NULL),
(18, 'Employee', 'admin/employee/add-new', 'admin', NULL, NULL),
(19, 'Seller', 'admin/sellers/seller-list', 'admin', NULL, NULL),
(20, 'Contacts', 'admin/contact/list', 'admin', NULL, NULL),
(21, 'Flash Deal', 'admin/deal/flash', 'admin', NULL, NULL),
(22, 'Deal of the day', 'admin/deal/day', 'admin', NULL, NULL),
(23, 'Language', 'admin/business-settings/language', 'admin', NULL, NULL),
(24, 'Mail', 'admin/business-settings/mail', 'admin', NULL, NULL),
(25, 'Shipping method', 'admin/business-settings/shipping-method/add', 'admin', NULL, NULL),
(26, 'Currency', 'admin/currency/view', 'admin', NULL, NULL),
(27, 'Payment method', 'admin/business-settings/payment-method', 'admin', NULL, NULL),
(28, 'SMS Gateway', 'admin/business-settings/sms-gateway', 'admin', NULL, NULL),
(29, 'Support Ticket', 'admin/support-ticket/view', 'admin', NULL, NULL),
(30, 'FAQ', 'admin/helpTopic/list', 'admin', NULL, NULL),
(31, 'About Us', 'admin/business-settings/about-us', 'admin', NULL, NULL),
(32, 'Terms and Conditions', 'admin/business-settings/terms-condition', 'admin', NULL, NULL),
(33, 'Web Config', 'admin/business-settings/web-config', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(30) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `auth_token` text DEFAULT NULL,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `pos_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `f_name`, `l_name`, `phone`, `image`, `email`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `account_no`, `holder_name`, `auth_token`, `sales_commission_percentage`, `gst`, `cm_firebase_token`, `pos_status`) VALUES
(1, 'Alaa', 'Mohamed', '01140404211', '2023-03-28-642376f24326c.png', 'alaa@gmail.com', '$2y$10$EOY5NdqPeqqJykrSVbQN5O0I7dKGhicEFoADcUunScgJccOYmo/f.', 'approved', NULL, '2023-03-28 21:23:30', '2023-03-28 21:23:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, 'Mohamed', 'Ali', '01245784545', '2023-03-28-64237b20de0bf.png', 'mohamed@gmail.com', '$2y$10$lNYROVmH8sCEowjpScSSpuKZEbNmqkbIGyp1/hctVvyztC/xtoUNO', 'approved', NULL, '2023-03-28 21:41:21', '2023-03-28 21:41:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 'mohammed', 'abdoon', '0021019597185', '2023-04-14-6438c8f093a40.png', 'medoabdoon66@gmail.com', '$2y$10$Q9XfhSteid4.ZVIcSjaac.7.KNmo9ixxdezrJT02e2i7eOcPdU2AG', 'approved', 'xU8E5esK7mKjZRkwA8firEVGqqn48tdRPUXp7SXU547ipDQSmVF72H7rgi4r', '2023-04-12 22:44:13', '2023-04-14 01:30:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 'badr', 'abdoon', '01019597185', '2023-04-14-6438ed6cac906.png', 'medoabdoon55@gmail.com', '$2y$10$MnCvnEHqdEnTyMfL19I6M.SwyjLrEyIzDK1wRxGIpL.Cm8kbkroP.', 'approved', 'Fo7ai6caQcHAakq5jfKY2AoF2lHwuCUPmIDKRU461SXq2uImjrSnkCINW04D', '2023-04-13 00:16:41', '2023-04-14 04:06:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 'ahmed', 'ahmed', '002019597185', '2023-04-15-6439f487d4914.png', 'medott@gmail.com', '$2y$10$f0xUVgaDzgQnH1F0xVqtguSi.54KoksVA4Hy1bLmRGESWyhLXVdke', 'approved', 'bT8CBHaePgQ2Y4buVBVbiNLzBZAF6BDirxWcXHGB0zOsMoVbb3FIs8m24z4e', '2023-04-14 00:06:51', '2023-04-14 22:49:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, 'Seller', 'Seller', '201090250088', '2023-05-11-645d04c6520d1.png', 'seller@gmail.com', '$2y$10$Cm9sZn42aQp88v4LYOA/c.jiGKyAaWkSGQCOs00VbloaN7NXoEmaa', 'approved', 'uJdgStOO9Q0NabiO8pe8jfdLLZS0oUDTTO5zlqjOPMKSr2V03Lnt3vYvimR1', '2023-05-11 12:07:50', '2023-05-16 17:27:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(8, 'Seller', 'Account', '201060250088', '2023-05-11-645d7ca1b7c50.png', 'seller2@gmail.com', '$2y$10$uXq4EdQDV0lIbtXEA/0BLOnmakKeErSiExOG3mgpYCAtXgyBZAgRq', 'approved', NULL, '2023-05-11 20:39:13', '2023-05-11 20:40:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `total_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_given` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `collected_cash` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_wallets`
--

INSERT INTO `seller_wallets` (`id`, `seller_id`, `total_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_given`, `pending_withdraw`, `delivery_charge_earned`, `collected_cash`, `total_tax_collected`) VALUES
(1, 1, 530, 0, '2023-03-28 21:23:30', '2023-04-19 03:24:21', 0.00, 0.00, 0.00, 0.00, 0.00),
(2, 2, 0, 0, '2023-03-28 21:41:21', '2023-03-28 21:41:21', 0.00, 0.00, 0.00, 0.00, 0.00),
(3, 3, 412, 0, '2023-04-12 22:44:13', '2023-04-13 23:30:37', 0.00, 0.00, 0.00, 0.00, 0.00),
(4, 4, 1207.5, 0, '2023-04-13 00:16:41', '2023-04-18 03:05:52', 0.00, 0.00, 0.00, 0.00, 0.00),
(5, 5, 0, 0, '2023-04-14 00:06:51', '2023-04-14 00:06:51', 0.00, 0.00, 0.00, 0.00, 0.00),
(6, 6, 0, 0, '2023-05-06 12:41:01', '2023-05-06 12:41:01', 0.00, 0.00, 0.00, 0.00, 0.00),
(7, 7, 0, 0, '2023-05-11 12:07:50', '2023-05-11 12:07:50', 0.00, 0.00, 0.00, 0.00, 0.00),
(8, 8, 0, 0, '2023-05-11 20:39:13', '2023-05-11 20:39:13', 0.00, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `contact_person_name` varchar(50) DEFAULT NULL,
  `address_type` varchar(20) NOT NULL DEFAULT 'home',
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`, `latitude`, `longitude`, `is_billing`) VALUES
(1, '0', '‪Alaa Mohamed‬‏3', 'home', 'egg', 'مصر', '3753450', '01140404211', '2023-03-29 10:56:14', '2023-03-29 10:56:14', NULL, 'Egypt', '', '', 0),
(2, '0', '‪Alaa Mohamed‬‏3', 'permanent', 'egg', 'مصر', '3753450', '01140404211', '2023-04-12 22:08:57', '2023-04-12 22:08:57', NULL, 'Egypt', '', '', 0),
(3, '5', 'محمد', 'home', 'العريش', 'سيناء', 'medosd@gma', '01019597185', '2023-04-13 22:40:06', '2023-04-13 22:40:06', NULL, 'Angola', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) NOT NULL DEFAULT 'admin',
  `title` varchar(100) DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `title`, `cost`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'admin', 'Company Vehicle', '5.00', '2 Week', 1, '2021-05-25 20:57:04', '2021-05-25 20:57:04');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

CREATE TABLE `shipping_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `vacation_start_date` date DEFAULT NULL,
  `vacation_end_date` date DEFAULT NULL,
  `vacation_note` varchar(255) DEFAULT NULL,
  `vacation_status` tinyint(4) NOT NULL DEFAULT 0,
  `temporary_close` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `seller_id`, `name`, `address`, `contact`, `image`, `vacation_start_date`, `vacation_end_date`, `vacation_note`, `vacation_status`, `temporary_close`, `created_at`, `updated_at`, `banner`) VALUES
(1, 1, 'Alaa-Store', 'ismailiya', '01140404211', '2023-03-28-642376f25ab34.png', NULL, NULL, NULL, 0, 0, '2023-03-28 21:23:30', '2023-03-28 21:23:30', '2023-03-28-642376f25b32d.png'),
(2, 2, 'Mohamed-Store', 'ismailiya', '01245784545', '2023-03-28-64237b2102636.png', NULL, NULL, NULL, 0, 0, '2023-03-28 21:41:21', '2023-03-28 21:41:21', '2023-03-28-64237b2102ef6.png'),
(3, 3, 'Al-Fayrouz Cosmetics', 'العريش', '0021019597185', '2023-04-13-6437531bc0817.png', NULL, NULL, NULL, 0, 0, '2023-04-12 22:44:13', '2023-04-14 03:57:44', '2023-04-14-6438eb5867fbf.png'),
(4, 4, 'Nashmi Cosmetics', 'القاهره', '01019597185', '2023-04-19-643f7ab050054.png', NULL, NULL, NULL, 0, 0, '2023-04-13 00:16:41', '2023-04-19 03:22:56', '2023-04-19-643f7ab0502bf.png'),
(5, 5, 'Al-Fayrouz Pharmaceutical', 'العريش شارع البحر', '002019597185', '2023-04-15-6439f453871ba.png', NULL, NULL, NULL, 0, 0, '2023-04-14 00:06:51', '2023-04-14 22:48:19', '2023-04-14-6438ec4d7197d.png'),
(6, 6, 'demo seller', 'cairo', '201090250088', '2023-05-06-6456750d2bb5a.png', NULL, NULL, NULL, 0, 0, '2023-05-06 12:41:01', '2023-05-06 12:41:01', '2023-05-06-6456750d2c9f8.png'),
(7, 7, 'demo Seller 01', 'seller', '201090250088', '2023-05-11-645d04c691591.png', NULL, NULL, NULL, 0, 0, '2023-05-11 12:07:50', '2023-05-16 17:28:28', '2023-05-11-645d04c692339.png'),
(8, 8, 'demo Seller 2', 'cairo', '201060250088', '2023-05-11-645d7ca1d8b0b.png', NULL, NULL, NULL, 0, 0, '2023-05-11 20:39:13', '2023-05-11 20:39:13', '2023-05-11-645d7ca1d96eb.png');

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `active_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'twitter', 'https://www.w3schools.com/howto/howto_css_table_responsive.asp', 'fa fa-twitter', 1, 1, '2020-12-31 21:18:03', '2020-12-31 21:18:25'),
(2, 'linkedin', 'https://dev.6amtech.com/', 'fa fa-linkedin', 1, 1, '2021-02-27 16:23:01', '2021-02-27 16:23:05'),
(3, 'google-plus', 'https://dev.6amtech.com/', 'fa fa-google-plus-square', 1, 1, '2021-02-27 16:23:30', '2021-02-27 16:23:33'),
(4, 'pinterest', 'https://dev.6amtech.com/', 'fa fa-pinterest', 1, 1, '2021-02-27 16:24:14', '2021-02-27 16:24:26'),
(5, 'instagram', 'https://dev.6amtech.com/', 'fa fa-instagram', 1, 1, '2021-02-27 16:24:36', '2021-02-27 16:24:41'),
(6, 'facebook', 'facebook.com', 'fa fa-facebook', 1, 1, '2021-02-27 19:19:42', '2021-06-11 17:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `priority` varchar(15) NOT NULL DEFAULT 'low',
  `description` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) DEFAULT NULL,
  `admin_message` varchar(191) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag`, `created_at`, `updated_at`) VALUES
(1, 'اكس رجالي 150 مل', '2023-04-09 02:18:52', '2023-04-09 02:18:52'),
(2, 'Odit id voluptatem', '2023-05-15 22:23:47', '2023-05-15 22:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) DEFAULT NULL,
  `paid_to` varchar(15) DEFAULT NULL,
  `payment_method` varchar(15) DEFAULT NULL,
  `payment_status` varchar(10) NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `translationable_type` varchar(191) NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`translationable_type`, `translationable_id`, `locale`, `key`, `value`, `id`) VALUES
('App\\Model\\Product', 105, 'eg', 'description', '.', 0),
('App\\Model\\Category', 1, 'eg', 'name', 'مستحضرات تجميل', 4),
('App\\Model\\Brand', 3, 'eg', 'name', 'المنتجات الصيدلانية العمانية', 19),
('App\\Model\\Brand', 2, 'eg', 'name', 'شركة النيل للأدوية والكيماويات', 20),
('App\\Model\\Brand', 1, 'eg', 'name', 'فيلادلفيا للادوية', 21),
('App\\Model\\Product', 11, 'eg', 'name', 'انتريستو', 26),
('App\\Model\\Product', 11, 'eg', 'description', '<h2>انتريستو&nbsp;</h2>', 27),
('App\\Model\\Product', 12, 'eg', 'name', 'كابوزايد', 28),
('App\\Model\\Product', 12, 'eg', 'description', '<p>يعمل دواء كابوزايد على التحكم في ضغط الدم المرتفع بفعالية كبيرة، لأنه يحفز الكلى عند تناوله على طرد السوائل المحبوسة في الجسم والأملاح الزائدة عن طريق البول.</p>\r\n\r\n<p>ويبلغ سعر كابوزايد في الصيدليات 50.25 جنيهًا.</p>', 29),
('App\\Model\\Product', 26, 'eg', 'name', 'اكس بلاك نايت مزيل عرق 150مل', 31),
('App\\Model\\Product', 25, 'eg', 'name', 'ديتول سائل مطهر 125مل', 32),
('App\\Model\\Product', 24, 'eg', 'name', 'دوف كريم  لتغديه الشعر 75 مل', 33),
('App\\Model\\Product', 23, 'eg', 'name', 'شامبو كلير رجالي 180 مل', 34),
('App\\Model\\Product', 22, 'eg', 'name', 'اكس بلاك نايت مزيل عرق 150مل', 35),
('App\\Model\\Product', 20, 'eg', 'name', 'شامبو كلير رجالي 180 مل', 36),
('App\\Model\\Product', 19, 'eg', 'name', 'ديتول سائل مطهر 125مل', 37),
('App\\Model\\Product', 18, 'eg', 'name', 'دوف كريم  لتغديه الشعر 75 مل', 38),
('App\\Model\\Product', 32, 'eg', 'name', 'اتور 40 مجم 10 قرص', 42),
('App\\Model\\Product', 45, 'eg', 'name', 'ريدوكسون فيتامين سى 15 كبسوله', 43),
('App\\Model\\Product', 44, 'eg', 'name', 'بدياشور لبن بالفراولة 400 جم', 44),
('App\\Model\\Product', 43, 'eg', 'name', 'اكتى فوليك 30 قرص', 45),
('App\\Model\\Product', 49, 'eg', 'name', 'املوديبين 10 مجم 20 قرص', 46),
('App\\Model\\Product', 98, 'eg', 'description', '.', 47),
('App\\Model\\Product', 99, 'eg', 'description', '.', 48);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `house_no` varchar(50) DEFAULT NULL,
  `apartment_no` varchar(50) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `payment_card_last_four` varchar(191) DEFAULT NULL,
  `payment_card_brand` varchar(191) DEFAULT NULL,
  `payment_card_fawry_token` text DEFAULT NULL,
  `login_medium` varchar(191) DEFAULT NULL,
  `social_id` varchar(191) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `temporary_token` varchar(191) DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_balance` double(8,2) DEFAULT NULL,
  `loyalty_point` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `f_name`, `l_name`, `phone`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `payment_card_last_four`, `payment_card_brand`, `payment_card_fawry_token`, `login_medium`, `social_id`, `is_phone_verified`, `temporary_token`, `is_email_verified`, `wallet_balance`, `loyalty_point`) VALUES
(0, 'walking customer', 'walking', 'customer', '000000000000', 'def.png', 'walking@customer.com', NULL, '', NULL, NULL, '2022-02-03 03:46:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(2, NULL, 'El shrouk', 'city', '66635870', 'def.png', 'alielhemaly5@gmail.com', NULL, '$2y$10$bZAxUZDCWr2pUW2LiqQC0.8x0/XAtM4n8TbUz/mDJBhXd3rVZzQ.2', '787UhyccWD8IEsPZDHgbpftgJhA4PxoMBsuV73H7Xvu94Q63Yxdy3aqVvG5P', '2023-03-24 02:18:05', '2023-03-24 02:18:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(3, NULL, 'Al7awy', 'fares', '124548754545', 'def.png', 'hema@gmail.com', NULL, '$2y$10$b2uHN7JWkfnn1mSYkVou5OiXhuegJtM7VzURfY9mTYTW61v8hmgKO', NULL, '2023-03-29 10:52:54', '2023-03-29 10:52:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(4, NULL, 'Ahmed', 'Ahmed', '01245452145', 'def.png', 'medo@gmail.com', NULL, '$2y$10$l63qOawc45qbb9T8hE298eXCS91cFRT0MXEBgHM0gnr3I5mwJVg6u', NULL, '2023-04-12 22:05:21', '2023-04-12 22:05:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(5, NULL, 'mohammed', 'abdoon', '01019597185', 'def.png', 'medoabd@gmail.com', NULL, '$2y$10$KRw9iIG5Yl7o7AZt0ekEk.Cw8WNd5tqhwQZIgSXHj5ygLmntlw1WW', 'AETqiQeXQ3qGEeBzhT1wR5ryGZLfoDdatAgxVHPXnYUqLcdbkj6egPdwrIgU', '2023-04-13 22:35:27', '2023-04-13 22:35:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_methods`
--

CREATE TABLE `withdrawal_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_name` varchar(191) NOT NULL,
  `method_fields` text NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) NOT NULL DEFAULT '0.00',
  `withdrawal_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `withdrawal_method_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`withdrawal_method_fields`)),
  `transaction_note` text DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chattings`
--
ALTER TABLE `chattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_notifications`
--
ALTER TABLE `deliveryman_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_wallets`
--
ALTER TABLE `deliveryman_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_country_codes`
--
ALTER TABLE `delivery_country_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_transactions`
--
ALTER TABLE `delivery_man_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_zip_codes`
--
ALTER TABLE `delivery_zip_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_deals`
--
ALTER TABLE `feature_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_topics`
--
ALTER TABLE `help_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_expected_delivery_histories`
--
ALTER TABLE `order_expected_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status_histories`
--
ALTER TABLE `order_status_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`identity`);

--
-- Indexes for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_types`
--
ALTER TABLE `shipping_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `transactions_id_unique` (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_methods`
--
ALTER TABLE `withdrawal_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deliveryman_notifications`
--
ALTER TABLE `deliveryman_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryman_wallets`
--
ALTER TABLE `deliveryman_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_country_codes`
--
ALTER TABLE `delivery_country_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man_transactions`
--
ALTER TABLE `delivery_man_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_zip_codes`
--
ALTER TABLE `delivery_zip_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_deals`
--
ALTER TABLE `feature_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `help_topics`
--
ALTER TABLE `help_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100009;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_expected_delivery_histories`
--
ALTER TABLE `order_expected_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status_histories`
--
ALTER TABLE `order_status_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

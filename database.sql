-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 01, 2024 at 05:31 PM
-- Server version: 8.0.39-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `empty_cutfx`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `user_id` int NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`user_id`, `user_name`, `user_password`, `user_type`) VALUES
(1, 'admin', 'admin123', 1),
(3, 'tester', 'tester123', 0);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int NOT NULL,
  `image` varchar(555) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `booking_id` varchar(55) DEFAULT NULL,
  `completion_otp` int DEFAULT NULL,
  `salon_id` int NOT NULL,
  `staff_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `service_location` tinyint(1) NOT NULL DEFAULT '0' COMMENT '	0=at_salon 1=different_address',
  `address_id` int DEFAULT NULL,
  `date` date NOT NULL,
  `time` varchar(4) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `services` text,
  `is_coupon_applied` tinyint(1) DEFAULT '0' COMMENT '0=no 1=yes',
  `coupon_title` varchar(255) DEFAULT NULL,
  `service_amount` float NOT NULL DEFAULT '0',
  `discount_amount` float NOT NULL,
  `subtotal` float NOT NULL DEFAULT '0',
  `total_tax_amount` float NOT NULL DEFAULT '0',
  `payable_amount` float NOT NULL,
  `payment_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=pre_paid 1=pay_after_service',
  `is_rated` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=no 1=yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int NOT NULL,
  `coupon` varchar(255) NOT NULL,
  `percentage` int NOT NULL DEFAULT '0',
  `max_discount_amount` int NOT NULL,
  `min_order_amount` int NOT NULL,
  `heading` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `question` varchar(999) DEFAULT NULL,
  `answer` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `global_settings`
--

CREATE TABLE `global_settings` (
  `id` int NOT NULL,
  `currency` varchar(5) DEFAULT '$',
  `comission` int NOT NULL COMMENT '% (percentage)',
  `min_amount_payout_salon` int NOT NULL DEFAULT '100',
  `max_order_at_once` int NOT NULL DEFAULT '2',
  `support_email` varchar(255) DEFAULT NULL,
  `payment_gateway` int NOT NULL DEFAULT '1' COMMENT 'check constants',
  `stripe_publishable_key` varchar(555) DEFAULT NULL,
  `stripe_secret` varchar(555) DEFAULT NULL,
  `stripe_currency_code` varchar(10) DEFAULT NULL,
  `razorpay_key` varchar(555) DEFAULT NULL,
  `razorpay_currency_code` varchar(10) DEFAULT NULL,
  `paystack_public_key` varchar(555) DEFAULT NULL,
  `paystack_secret_key` varchar(555) DEFAULT NULL,
  `paystack_currency_code` varchar(10) DEFAULT NULL,
  `paypal_client_id` varchar(555) DEFAULT NULL,
  `paypal_secret_key` varchar(555) DEFAULT NULL,
  `paypal_currency_code` varchar(10) DEFAULT NULL,
  `flutterwave_public_key` varchar(555) DEFAULT NULL,
  `flutterwave_secret_key` varchar(555) DEFAULT NULL,
  `flutterwave_encryption_key` varchar(555) DEFAULT NULL,
  `flutterwave_currency_code` varchar(10) DEFAULT NULL,
  `sslcommerz_store_id` varchar(255) DEFAULT NULL,
  `sslcommerz_store_passwd` varchar(255) DEFAULT NULL,
  `sslcommerz_currency_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `global_settings`
--

INSERT INTO `global_settings` (`id`, `currency`, `comission`, `min_amount_payout_salon`, `max_order_at_once`, `support_email`, `payment_gateway`, `stripe_publishable_key`, `stripe_secret`, `stripe_currency_code`, `razorpay_key`, `razorpay_currency_code`, `paystack_public_key`, `paystack_secret_key`, `paystack_currency_code`, `paypal_client_id`, `paypal_secret_key`, `paypal_currency_code`, `flutterwave_public_key`, `flutterwave_secret_key`, `flutterwave_encryption_key`, `flutterwave_currency_code`, `sslcommerz_store_id`, `sslcommerz_store_passwd`, `sslcommerz_currency_code`, `created_at`, `updated_at`) VALUES
(1, '$', 15, 100, 5, 'hello@retrytech.com', 1, 'pk_test_51ImGJFSJz8qQinlxOgDL3VZ3AQM3qIsD9vkKbyAd2sO1qPLLXfre0pbks4Y1wuFOsLno1PnJ5gcErruoyeqtRFke00npvyV8UU', 'sk_test_51ImGJFSJz8qQinlxXPkJTZfKSWL87Rm5oDfRIiWGMC8qxTif4AmZcPcOxwyef7qSvdgR5bLcbDiCJf2zYhLbzQs500CQosOz5K', 'INR', 'rzp_test_EkzDwjtRNcYCHd', 'INR', 'pk_test_fcdfb6b1421b48533f688b74c80277b20d45152f', 'sk_test_e845d71a4495f587c2517ebe7fc9d5370b5adac9', 'NGN', 'AeTzY2ina4AReM5H8wNDhyRunXAjiL57hsqSTbTcgEXnK02HAuteflZgS56v4-Qs94yr0kIeOpflHZG5', 'ENX69U7wGHAflXj-k8tPhmb7HvQrnRCv1pDZSyOdtIVM2a5Y4UM6X5CuqSHRwXT55FdjUX7roYLB7qGj', 'USD', 'FLWPUBK_TEST-0769c62fbe824ae4b87396e63e48c19c-X', 'FLWSECK_TEST-623f41e0549bb809f2319c5921dfa597-X', 'FLWSECK_TEST83481f8aeb04', 'USD', NULL, NULL, NULL, '2023-03-24 07:59:35', '2024-05-27 19:38:58');

-- --------------------------------------------------------

--
-- Table structure for table `platform_data`
--

CREATE TABLE `platform_data` (
  `id` int NOT NULL,
  `lifetime_earnings` float NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `platform_data`
--

INSERT INTO `platform_data` (`id`, `lifetime_earnings`, `created_at`, `updated_at`) VALUES
(1, 1071.6, '2022-12-07 12:21:34', '2024-06-21 20:30:44');

-- --------------------------------------------------------

--
-- Table structure for table `platform_earning_history`
--

CREATE TABLE `platform_earning_history` (
  `id` int NOT NULL,
  `earning_number` varchar(255) NOT NULL,
  `amount` float NOT NULL,
  `commission_percentage` varchar(255) NOT NULL DEFAULT '0',
  `booking_id` int NOT NULL,
  `salon_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon`
--

CREATE TABLE `salon` (
  `id` int NOT NULL,
  `wallet` float NOT NULL DEFAULT '0',
  `lifetime_earnings` float NOT NULL DEFAULT '0',
  `device_type` tinyint(1) NOT NULL COMMENT '1=android 2=iOS',
  `status` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '0=pending 1=active 2=banned',
  `top_rated` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=no 1=yes',
  `is_notification` tinyint NOT NULL DEFAULT '1' COMMENT '1=on 2=off',
  `on_vacation` tinyint NOT NULL DEFAULT '0' COMMENT '0=no 1=yes (on vacation)',
  `rating` float NOT NULL DEFAULT '0',
  `salon_number` varchar(255) DEFAULT NULL,
  `email` varchar(555) DEFAULT NULL,
  `salon_name` varchar(555) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `owner_photo` varchar(555) DEFAULT NULL,
  `salon_about` varchar(555) DEFAULT NULL,
  `salon_address` varchar(555) DEFAULT NULL,
  `salon_phone` varchar(255) DEFAULT NULL,
  `salon_lat` varchar(555) DEFAULT NULL,
  `salon_long` varchar(555) DEFAULT NULL,
  `salon_categories` varchar(900) DEFAULT NULL,
  `gender_served` tinyint(1) DEFAULT NULL COMMENT '0=male 1=female 2=unisex',
  `mon_fri_from` varchar(55) DEFAULT NULL,
  `mon_fri_to` varchar(55) DEFAULT NULL,
  `sat_sun_from` varchar(55) DEFAULT NULL,
  `sat_sun_to` varchar(55) DEFAULT NULL,
  `device_token` varchar(555) DEFAULT NULL,
  `total_rejected_bookings` int NOT NULL DEFAULT '0',
  `total_completed_bookings` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_pay_after_service` tinyint(1) NOT NULL DEFAULT '0' COMMENT '	0=no 1=yes_they_do',
  `is_serve_outside` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=no 1=yes_they_do'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_awards`
--

CREATE TABLE `salon_awards` (
  `id` int NOT NULL,
  `salon_id` int DEFAULT NULL,
  `title` varchar(555) DEFAULT NULL,
  `award_by` varchar(555) DEFAULT NULL,
  `description` varchar(999) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_bank_accounts`
--

CREATE TABLE `salon_bank_accounts` (
  `id` int NOT NULL,
  `salon_id` int DEFAULT NULL,
  `bank_title` varchar(555) DEFAULT NULL,
  `account_number` varchar(555) DEFAULT NULL,
  `holder` varchar(555) NOT NULL,
  `swift_code` varchar(255) NOT NULL,
  `cheque_photo` varchar(555) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_booking_slots`
--

CREATE TABLE `salon_booking_slots` (
  `id` int NOT NULL,
  `salon_id` int DEFAULT NULL,
  `time` varchar(4) DEFAULT NULL,
  `weekday` tinyint(1) DEFAULT NULL,
  `booking_limit` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_categories`
--

CREATE TABLE `salon_categories` (
  `id` int NOT NULL,
  `title` varchar(55) DEFAULT NULL,
  `icon` varchar(555) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=no 1=yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_earning_history`
--

CREATE TABLE `salon_earning_history` (
  `id` int NOT NULL,
  `salon_id` int NOT NULL,
  `booking_id` int NOT NULL,
  `earning_number` varchar(255) NOT NULL,
  `amount` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_gallery`
--

CREATE TABLE `salon_gallery` (
  `id` int NOT NULL,
  `salon_id` int DEFAULT NULL,
  `image` varchar(555) DEFAULT NULL,
  `description` varchar(555) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_images`
--

CREATE TABLE `salon_images` (
  `id` int NOT NULL,
  `salon_id` int DEFAULT NULL,
  `image` varchar(555) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_notifications`
--

CREATE TABLE `salon_notifications` (
  `id` int NOT NULL,
  `title` varchar(555) DEFAULT NULL,
  `description` varchar(999) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_payouts`
--

CREATE TABLE `salon_payouts` (
  `id` int NOT NULL,
  `request_number` varchar(555) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=pending 1=completed 2=rejected',
  `salon_id` int NOT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `summary` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_reviews`
--

CREATE TABLE `salon_reviews` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `salon_id` int DEFAULT NULL,
  `booking_id` int DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `comment` varchar(555) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_services`
--

CREATE TABLE `salon_services` (
  `id` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=on 0=off',
  `service_number` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `salon_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `service_time` int NOT NULL DEFAULT '0',
  `price` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=male 1=female 2=unisex',
  `about` varchar(999) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_service_images`
--

CREATE TABLE `salon_service_images` (
  `id` int NOT NULL,
  `service_id` int DEFAULT NULL,
  `image` varchar(555) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_staff`
--

CREATE TABLE `salon_staff` (
  `id` int NOT NULL,
  `salon_id` int DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=no 1=deleted',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=on 0=off',
  `rating` float NOT NULL DEFAULT '0',
  `photo` varchar(999) DEFAULT NULL,
  `name` varchar(999) DEFAULT NULL,
  `phone` varchar(555) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL COMMENT '1=male 0=female',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_wallet_statement`
--

CREATE TABLE `salon_wallet_statement` (
  `id` int NOT NULL,
  `salon_id` int NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `booking_id` varchar(255) DEFAULT NULL,
  `type` int NOT NULL,
  `amount` float NOT NULL,
  `cr_or_dr` tinyint(1) NOT NULL,
  `summary` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=on 0=off',
  `tax_title` varchar(55) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=percent 1=fixed',
  `value` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pages`
--

CREATE TABLE `tbl_pages` (
  `id` int NOT NULL,
  `privacy` text,
  `termsofuse` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_pages`
--

INSERT INTO `tbl_pages` (`id`, `privacy`, `termsofuse`, `created_at`, `updated_at`) VALUES
(1, '<pre style=\"font-family: Menlo, Monaco, Consolas, \" courier=\"\" new\",=\"\" monospace;=\"\" font-size:=\"\" 13px;=\"\" padding:=\"\" 9.5px;=\"\" margin-bottom:=\"\" 10px;=\"\" line-height:=\"\" 1.42857;=\"\" word-break:=\"\" break-all;=\"\" overflow-wrap:=\"\" break-word;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" background-color:=\"\" rgb(245,=\"\" 245,=\"\" 245);=\"\" border:=\"\" 1px=\"\" solid=\"\" rgb(204,=\"\" 204,=\"\" 204);=\"\" border-radius:=\"\" 4px;\"=\"\"><h1 style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 36px; font-family: AR12; font-weight: normal; color: rgb(58, 72, 81); white-space: normal;\"><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">5 July 2020</span></p></h1><h3 style=\"text-align: left; border: 0px; margin: 20px 0px; padding: 0px; font-size: 22px; font-family: ALO8; font-weight: normal; color: rgb(58, 72, 81); white-space: normal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Cut FX Privacy Policy</span></h3><h1 style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 36px; font-family: AR12; font-weight: normal; color: rgb(58, 72, 81); white-space: normal;\"><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos follows the relevant legal requirements and takes all reasonable precautions to safeguard personal information.</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">INTRODUCTION</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos is committed to protecting your privacy and security. This policy explains how and why we use your personal data, to ensure you remain informed and in control of your information.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">You can decide not to receive communications or change how we contact you at any time. If you wish to do so please contact us by emailing&nbsp;hello@demos.co.uk, writing to 76 Vincent Square, London, SW1 2PD or 020 3878 3955 (Lines open 9.30am – 6pm, Mon – Fri).</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We will never sell your personal data, and will only ever share it with organisations we work with where necessary and if its privacy and security are guaranteed. Personal information submitted to Demos is only used to contact you regarding Demos activities.&nbsp;</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Information about visitors to the Demos website domain is automatically logged for the purposes of statistical analysis. Such information includes the IP address from which you visit, referral address, and other technical information such as browser type and operating system. Your email address is not automatically logged without your knowledge.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We will not distribute, sell, trade or rent your personal information to third parties. Demos may provide aggregate statistics about our website’s users, traffic patterns and related site information to reputable third-parties such as Demos’s funding bodies or potential partners. Such statistical information will not include personally identifying information.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Questions?</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Any questions you have in relation to this policy or how we use your personal data should be sent to&nbsp;hello@demos.co.uk&nbsp;for the attention of Demos’ Head of External Affairs.</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">ABOUT US</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Your personal data (i.e. any information which identifies you, or which can be identified as relating to you personally) will be collected and used by Demos (charity no:1042046,&nbsp; company registration no: 2977740).</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">THE INFORMATION WE COLLECT</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Personal data you provide</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We collect data you provide to us. This includes information you give when joining as a member or signing up to our newsletter, placing an order or communicating with us. For example:</span></p><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">personal details (name, job title, organisation and email) when you sign up to our newsletter and / or events.</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">financial information (payment information such as credit/debit card or direct debit details, when making donations or paying for a service. Please see section 8 for more information on payment security); and</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">details of Demos events you have attended.</span></li></ul><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Sensitive personal data</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We do not normally collect or store sensitive personal data (such as information relating to health, beliefs or political affiliation) about those signed up to Demos’s newsletter. However there are some situations where this will occur (e.g. if you have an accident on one of our events). If this does occur, we’ll take extra care to ensure your privacy rights are protected.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Accidents or incidents</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If an accident or incident occurs on our property, at one of our events or involving one of our staff then we’ll keep a record of this (which may include personal data and sensitive personal data).</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">HOW WE USE INFORMATION2222</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We only ever use your personal data with your consent, or where it is necessary in order to:</span></p><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">enter into, or perform, a contract with you;</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">comply with a legal duty;</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">protect your vital interests;</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">for our own (or a third party’s) lawful interests, provided your rights don’t override these.</span></li></ul><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">In any event, we’ll only use your information for the purpose or purposes it was collected for (or else for closely related purposes).</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Administration</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We use personal data for administrative purposes (i.e. on our research and events programmes). This includes:</span></p><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">maintaining databases of those signed up to our newsletter;</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">fulfilling orders for goods or services (whether placed online, over the phone or in person);</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">helping us respect your choices and preferences (e.g. if you ask not to receive marketing material, we’ll keep a record of this).</span></li></ul><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">DISCLOSING AND SHARING DATA</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Your personal data – which may include your name, organisation, position, and email address are held by our mailing list provider. By signing up to our newsletter you are agreeing to the terms and conditions of MailChimp.com (</span><a href=\"https://mailchimp.com/legal/terms/\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(14, 40, 42); outline: none;\">http://mailchimp.com/legal/terms/</a><span style=\"border: 0px; margin: 0px; padding: 0px;\">). This information is not shared with any other organisation. If you wish to unsubscribe from our mailing list at any time, you can do so by clicking the ‘unsubscribe’ link, found at the bottom of any email we send you – or by sending your name and email address to&nbsp;</span><span style=\"border: 0px; margin: 0px; padding: 0px;\">hello@demos.co.uk</span><span style=\"border: 0px; margin: 0px; padding: 0px;\">&nbsp;– stating ‘Unsubscribe’ in the email in the subject line or body of the email.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If you register to attend an event, your personal data which may include your name, organisation, and email address are held by our event registration provider. By registering to attend an event you are agreeing to the terms and conditions of Eventbrite (</span><a href=\"https://www.eventbrite.com/l/LegalTerms/\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(14, 40, 42); outline: none;\">https://www.eventbrite.com/l/LegalTerms/</a><span style=\"border: 0px; margin: 0px; padding: 0px;\">)</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Occasionally, where we partner with other organisations, we may also share information with them (for example, if you register to attend an event being jointly organised by us and another organisation). We’ll only share information when necessary and we will never share your contact information (e.g. email or telephone).</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">MARKETING</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos will ask for individuals to “opt-in” for most communications. This includes all our marketing communications (the term marketing is broadly defined and covers information shared in our newsletter.)</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We use personal data to communicate with people, to promote Demos and to help with fundraising activities. This includes keeping you up to date with information from Demos on our research, events, news, job opportunities and other information relating to our work.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">You can decide not to receive communications or change how we contact you at any time. If you wish to do so please contact us by emailing&nbsp;</span><span style=\"border: 0px; margin: 0px; padding: 0px;\">hello@demos.co.uk,</span><span style=\"border: 0px; margin: 0px; padding: 0px;\">&nbsp;writing to Demos, 76 Vincent Square, London SW1P 2PD or telephoning 020 3878 3955 (Lines open 9.30am – 6pm, Mon – Fri).</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">What does ‘marketing’ mean?</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Marketing does not just mean offering things for sale, but also includes news and information about:</span></p><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">our research programme, including details of recent reports or blogs;</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">our events and activities; and</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">job opportunities.</span></li></ul><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">When you receive a communication, we may collect information about how you respond to or interact with that communication, and this may affect how we communicate with you in future.</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">HOW WE PROTECT DATA</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We employ a variety of physical and technical measures to keep your data safe and to prevent unauthorised access to, or use or disclosure of your personal information.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Electronic data and databases are stored on secure computer systems and we control who has access to information (using both physical and electronic means). Our staff receive data protection training and we have a set of detailed data protection procedures which personnel are required to follow when handling personal data.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Payment security</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">All electronic Demos forms that request financial data use pass your details to our payment provider (Stripe Payments Europe:&nbsp;</span><a href=\"https://stripe.com/gb/privacy\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(14, 40, 42); outline: none;\">https://stripe.com/gb/privacy</a><span style=\"border: 0px; margin: 0px; padding: 0px;\">;&nbsp;</span><a href=\"https://stripe.com/privacy-shield-policy\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(14, 40, 42); outline: none;\">https://stripe.com/privacy-shield-policy</a><span style=\"border: 0px; margin: 0px; padding: 0px;\">). Demos complies with the payment card industry data security standard (PCI-DSS) published by the PCI Security Standards Council, and will never store card details. If you would rather make a payment through BACS or by cheque please contact us by emailing&nbsp;hello@demos.co.uk, writing to Unit 1, Lloyd’s Wharf, 2-3 Mill Street, London SE1 2BD or telephoning 020 3878 3955 (Lines open 9.30am – 6pm, Mon – Fri).</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Of course, we cannot guarantee the security of your home computer or the internet, and any online communications (e.g. information provided by email or our website) are at the user’s own risk.</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">STORAGE</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Where we store information</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos’ operations are based in England and we store our data within the European Union.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">How long we store information</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We will only use and store information for so long as it is required for the purposes it was collected for. How long information will be stored for depends on the information in question and what it is being used for. For example, if you ask us not to send you marketing emails, we will stop storing your emails for marketing purposes (though we’ll keep a record of your preference not to be emailed).</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We continually review what information we hold and delete what is no longer required. We never store payment card information.</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">KEEPING YOU IN CONTROL</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We want to ensure you remain in control of your personal data. Part of this is making sure you understand your legal rights, which are as follows:</span></p><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">the right to confirmation as to whether or not we have your personal data and, if we do, to obtain a copy of the personal information we hold (this is known as subject access request);</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">the right to have your data erased (though this will not apply where it is necessary for us to continue to use the data for a lawful reason);</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">the right to have inaccurate data rectified;</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">the right to object to your data being used for marketing or profiling; and</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">where technically feasible, you have the right to personal data you have provided to us which we process automatically on the basis of your consent or the performance of a contract. This information will be provided in a common electronic format.</span></li></ul><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Please keep in mind that there are exceptions to the rights above and, though we will always try to respond to your satisfaction, there may be situations where we are unable to do so.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If you would like further information on your rights or wish to exercise them, please write to Demos’ Head of External Affairs, 76 Vincent Square, London, SW1P 2PD or by email;&nbsp;hello@demos.co.uk</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Complaints</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">You can complain to Demos directly by contacting our Head of External Affairs using the details set out above.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If you are not happy with our response, or you believe that your data protection or privacy rights have been infringed, you can complain to the UK Information Commissioner’s Office which regulates and enforces data protection law in the UK. Details of how to do this can be found at&nbsp;</span><a href=\"https://www.ico.org.uk/\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(14, 40, 42); outline: none;\">www.ico.org.uk</a></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">COOKIES AND LINKS TO OTHER SITES</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Cookies</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We use cookies on our website. Cookies files are downloaded to a device when certain websites are accessed by users, allowing the website to identify that user on subsequent visits.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">The only cookies in use on our site are for Google Analytics. Google Analytics are tools employed by organisations to help them understand how visitors engage with their website, so improvements can be made. Google Analytics collects information anonymously – and reports overall trends, without disclosing information on individual visitors. By using our site you are consenting to saving and sending us this data. You can opt out of Google Analytics – which will not affect how you visit our site. Further information on this can be found here:&nbsp;</span><a href=\"https://tools.google.com/dlpage/gaoptout\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(14, 40, 42); outline: none;\">https://tools.google.com/dlpage/gaoptout</a></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Our website uses local storage strictly for system administration to provide you with the best possible experience – used in order to create reports relating to web traffic and user preferences. This includes: your IP address; details of which web browser or operating system was used; and information on how you use the site.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Links to other sites</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Our website contains hyperlinks to many other websites. We are not responsible for the content or functionality of any of those external websites.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If an external website requests personal information from you (e.g. in connection with an order for goods or services), the information you provide will not be covered by the Demos’ Privacy Policy. We suggest you read the privacy policy of any website before providing any personal information.</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">CHANGES TO THIS PRIVACY POLICY</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We’ll amend this Privacy Policy from time to time to ensure it remains up-to-date and accurately reflects how and why we use your personal data. The current version of our Privacy Policy will always be posted on our website.</span></p></h1><h4 style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 20px; font-family: AR12; font-weight: normal; color: rgb(58, 72, 81); white-space: normal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Note on compliance with the General Data Protection Regulation as pertaining to use of social media data within Demos projects</span></h4><h1 style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 36px; font-family: AR12; font-weight: normal; color: rgb(58, 72, 81); white-space: normal;\"><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">The Centre for the Analysis of Social Media (CASM) often conducts research which involves the collection and analysis of publicly available data from social media platforms.&nbsp; Much of this data, including usernames, is considered personal data under the General Data Protection Regulation (GDPR). In order to ensure this data is processed lawfully and transparently, the following procedures are followed by CASM projects undertaken by Demos:</span></p><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">All data collected from social media platforms is accessed through the official application programming interface (API) of that platform, and stored and used in compliance with that API’s terms of service.</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Data is only collected from platforms for which users have provided clear consent, as defined in Article 4(11) of the GDPR, to provide that platform with published data</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">CASM often applies techniques in artificial intelligence to social media data, in order to conduct research on this data. As we have throughout our history as a research centre, we ensure that the reasons for applying these techniques, the methodology used to analyse data, and the conclusions drawn from our analysis are presented clearly and fully in each report. This includes publishing detailed accuracy scores for any machine learning algorithms applied as part of the research.</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">This data is securely stored on a monitored server, accessible only to CASM staff, and encrypted in transit. In the event that a data breach is discovered, CASM will act swiftly to ensure that damage from this breach is minimised, including informing relevant supervisory authorities and acting to identify and resolve any security issues allowing the breach.</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos will maintain a publicly accessible page on its website for each project, explaining the sources and character of data collected for that project, the purposes for which this data will be used, and including contact details for a designated member of staff responsible for responding to public queries about this data.</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Data collected from social media sites is not stored for longer than is necessary to complete each project</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">In order to respect the rights of data controllers to maintain control of their personal data, CASM will remove from any dataset personal data pertaining to an individual who requests such deletion. This includes taking reasonable measures to ensure that content deleted from social media platforms is also removed from datasets used by CASM.</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">CASM does not publish any personal data collected during its research, nor is personal data shared with third parties external to CASM or transferred out of the UK, without the explicit consent of the data subject. Any data published or shared with a third party is aggregated, anonymised or altered to prevent identification a natural person.</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Where quotes from social media users are published in reports, these quotes are bowdlerised – altered in a way which preserves meaning but prevents retroactive identification of the original post through e.g an online search. An occasional exception to this policy is observed when the user is publically known to the extent that they would not reasonably expect their social media posts to be private. It should be noted here that the GDPR only applies to natural persons, and not companies or organisations.</span></li></ul><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">This Privacy Policy was last updated on 05.07.2020 234</span></p></h1></pre><p>\r\n                    </p>', '<pre courier=\"\" new\",=\"\" monospace;=\"\" font-size:=\"\" 13px;=\"\" padding:=\"\" 9.5px;=\"\" margin-bottom:=\"\" 10px;=\"\" line-height:=\"\" 1.42857;=\"\" word-break:=\"\" break-all;=\"\" overflow-wrap:=\"\" break-word;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" background-color:=\"\" rgb(245,=\"\" 245,=\"\" 245);=\"\" border:=\"\" 1px=\"\" solid=\"\" rgb(204,=\"\" 204,=\"\" 204);=\"\" border-radius:=\"\" 4px;\"=\"\" style=\"font-size: 12.25px;\"><h1 style=\"margin: 20px 0px; font-weight: normal; font-size: 36px; border: 0px; padding: 0px; font-family: AR12; color: rgb(58, 72, 81); white-space: normal;\"><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">5 July 2020</span></p></h1><h3 style=\"margin: 20px 0px; font-weight: normal; font-size: 22px; border: 0px; padding: 0px; font-family: ALO8; color: rgb(58, 72, 81); white-space: normal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Terms Of Use</span></h3><h1 style=\"margin: 20px 0px; font-weight: normal; font-size: 36px; border: 0px; padding: 0px; font-family: AR12; color: rgb(58, 72, 81); white-space: normal;\"><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos follows the relevant legal requirements and takes all reasonable precautions to safeguard personal information.</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">INTRODUCTION</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos is committed to protecting your privacy and security. This policy explains how and why we use your personal data, to ensure you remain informed and in control of your information.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">You can decide not to receive communications or change how we contact you at any time. If you wish to do so please contact us by emailing hello@demos.co.uk, writing to 76 Vincent Square, London, SW1 2PD or 020 3878 3955 (Lines open 9.30am – 6pm, Mon – Fri).</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We will never sell your personal data, and will only ever share it with organisations we work with where necessary and if its privacy and security are guaranteed. Personal information submitted to Demos is only used to contact you regarding Demos activities. </span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Information about visitors to the Demos website domain is automatically logged for the purposes of statistical analysis. Such information includes the IP address from which you visit, referral address, and other technical information such as browser type and operating system. Your email address is not automatically logged without your knowledge.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We will not distribute, sell, trade or rent your personal information to third parties. Demos may provide aggregate statistics about our website’s users, traffic patterns and related site information to reputable third-parties such as Demos’s funding bodies or potential partners. Such statistical information will not include personally identifying information.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Questions?</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Any questions you have in relation to this policy or how we use your personal data should be sent to hello@demos.co.uk for the attention of Demos’ Head of External Affairs.</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">ABOUT US</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Your personal data (i.e. any information which identifies you, or which can be identified as relating to you personally) will be collected and used by Demos (charity no:1042046,  company registration no: 2977740).</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">THE INFORMATION WE COLLECT</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Personal data you provide</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We collect data you provide to us. This includes information you give when joining as a member or signing up to our newsletter, placing an order or communicating with us. For example:</span></p><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">personal details (name, job title, organisation and email) when you sign up to our newsletter and / or events.</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">financial information (payment information such as credit/debit card or direct debit details, when making donations or paying for a service. Please see section 8 for more information on payment security); and</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">details of Demos events you have attended.</span></li></ul><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Sensitive personal data</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We do not normally collect or store sensitive personal data (such as information relating to health, beliefs or political affiliation) about those signed up to Demos’s newsletter. However there are some situations where this will occur (e.g. if you have an accident on one of our events). If this does occur, we’ll take extra care to ensure your privacy rights are protected.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Accidents or incidents</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If an accident or incident occurs on our property, at one of our events or involving one of our staff then we’ll keep a record of this (which may include personal data and sensitive personal data).</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">HOW WE USE INFORMATION</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We only ever use your personal data with your consent, or where it is necessary in order to:</span></p><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">enter into, or perform, a contract with you;</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">comply with a legal duty;</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">protect your vital interests;</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">for our own (or a third party’s) lawful interests, provided your rights don’t override these.</span></li></ul><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">In any event, we’ll only use your information for the purpose or purposes it was collected for (or else for closely related purposes).</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Administration</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We use personal data for administrative purposes (i.e. on our research and events programmes). This includes:</span></p><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">maintaining databases of those signed up to our newsletter;</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">fulfilling orders for goods or services (whether placed online, over the phone or in person);</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">helping us respect your choices and preferences (e.g. if you ask not to receive marketing material, we’ll keep a record of this).</span></li></ul><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">DISCLOSING AND SHARING DATA</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Your personal data – which may include your name, organisation, position, and email address are held by our mailing list provider. By signing up to our newsletter you are agreeing to the terms and conditions of MailChimp.com (</span><a href=\"https://mailchimp.com/legal/terms/\" style=\"color: rgb(14, 40, 42); border: 0px; margin: 0px; padding: 0px; outline: none;\">http://mailchimp.com/legal/terms/</a><span style=\"border: 0px; margin: 0px; padding: 0px;\">). This information is not shared with any other organisation. If you wish to unsubscribe from our mailing list at any time, you can do so by clicking the ‘unsubscribe’ link, found at the bottom of any email we send you – or by sending your name and email address to </span><span style=\"border: 0px; margin: 0px; padding: 0px;\">hello@demos.co.uk</span><span style=\"border: 0px; margin: 0px; padding: 0px;\"> – stating ‘Unsubscribe’ in the email in the subject line or body of the email.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If you register to attend an event, your personal data which may include your name, organisation, and email address are held by our event registration provider. By registering to attend an event you are agreeing to the terms and conditions of Eventbrite (</span><a href=\"https://www.eventbrite.com/l/LegalTerms/\" style=\"color: rgb(14, 40, 42); border: 0px; margin: 0px; padding: 0px; outline: none;\">https://www.eventbrite.com/l/LegalTerms/</a><span style=\"border: 0px; margin: 0px; padding: 0px;\">)</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Occasionally, where we partner with other organisations, we may also share information with them (for example, if you register to attend an event being jointly organised by us and another organisation). We’ll only share information when necessary and we will never share your contact information (e.g. email or telephone).</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">MARKETING</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos will ask for individuals to “opt-in” for most communications. This includes all our marketing communications (the term marketing is broadly defined and covers information shared in our newsletter.)</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We use personal data to communicate with people, to promote Demos and to help with fundraising activities. This includes keeping you up to date with information from Demos on our research, events, news, job opportunities and other information relating to our work.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">You can decide not to receive communications or change how we contact you at any time. If you wish to do so please contact us by emailing </span><span style=\"border: 0px; margin: 0px; padding: 0px;\">hello@demos.co.uk,</span><span style=\"border: 0px; margin: 0px; padding: 0px;\"> writing to Demos, 76 Vincent Square, London SW1P 2PD or telephoning 020 3878 3955 (Lines open 9.30am – 6pm, Mon – Fri).</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">What does ‘marketing’ mean?</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Marketing does not just mean offering things for sale, but also includes news and information about:</span></p><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">our research programme, including details of recent reports or blogs;</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">our events and activities; and</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">job opportunities.</span></li></ul><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">When you receive a communication, we may collect information about how you respond to or interact with that communication, and this may affect how we communicate with you in future.</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">HOW WE PROTECT DATA</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We employ a variety of physical and technical measures to keep your data safe and to prevent unauthorised access to, or use or disclosure of your personal information.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Electronic data and databases are stored on secure computer systems and we control who has access to information (using both physical and electronic means). Our staff receive data protection training and we have a set of detailed data protection procedures which personnel are required to follow when handling personal data.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Payment security</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">All electronic Demos forms that request financial data use pass your details to our payment provider (Stripe Payments Europe: </span><a href=\"https://stripe.com/gb/privacy\" style=\"color: rgb(14, 40, 42); border: 0px; margin: 0px; padding: 0px; outline: none;\">https://stripe.com/gb/privacy</a><span style=\"border: 0px; margin: 0px; padding: 0px;\">; </span><a href=\"https://stripe.com/privacy-shield-policy\" style=\"color: rgb(14, 40, 42); border: 0px; margin: 0px; padding: 0px; outline: none;\">https://stripe.com/privacy-shield-policy</a><span style=\"border: 0px; margin: 0px; padding: 0px;\">). Demos complies with the payment card industry data security standard (PCI-DSS) published by the PCI Security Standards Council, and will never store card details. If you would rather make a payment through BACS or by cheque please contact us by emailing hello@demos.co.uk, writing to Unit 1, Lloyd’s Wharf, 2-3 Mill Street, London SE1 2BD or telephoning 020 3878 3955 (Lines open 9.30am – 6pm, Mon – Fri).</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Of course, we cannot guarantee the security of your home computer or the internet, and any online communications (e.g. information provided by email or our website) are at the user’s own risk.</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">STORAGE</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Where we store information</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos’ operations are based in England and we store our data within the European Union.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">How long we store information</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We will only use and store information for so long as it is required for the purposes it was collected for. How long information will be stored for depends on the information in question and what it is being used for. For example, if you ask us not to send you marketing emails, we will stop storing your emails for marketing purposes (though we’ll keep a record of your preference not to be emailed).</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We continually review what information we hold and delete what is no longer required. We never store payment card information.</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">KEEPING YOU IN CONTROL</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We want to ensure you remain in control of your personal data. Part of this is making sure you understand your legal rights, which are as follows:</span></p><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">the right to confirmation as to whether or not we have your personal data and, if we do, to obtain a copy of the personal information we hold (this is known as subject access request);</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">the right to have your data erased (though this will not apply where it is necessary for us to continue to use the data for a lawful reason);</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">the right to have inaccurate data rectified;</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">the right to object to your data being used for marketing or profiling; and</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">where technically feasible, you have the right to personal data you have provided to us which we process automatically on the basis of your consent or the performance of a contract. This information will be provided in a common electronic format.</span></li></ul><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Please keep in mind that there are exceptions to the rights above and, though we will always try to respond to your satisfaction, there may be situations where we are unable to do so.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If you would like further information on your rights or wish to exercise them, please write to Demos’ Head of External Affairs, 76 Vincent Square, London, SW1P 2PD or by email; hello@demos.co.uk</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Complaints</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">You can complain to Demos directly by contacting our Head of External Affairs using the details set out above.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If you are not happy with our response, or you believe that your data protection or privacy rights have been infringed, you can complain to the UK Information Commissioner’s Office which regulates and enforces data protection law in the UK. Details of how to do this can be found at </span><a href=\"https://www.ico.org.uk/\" style=\"color: rgb(14, 40, 42); border: 0px; margin: 0px; padding: 0px; outline: none;\">www.ico.org.uk</a></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">COOKIES AND LINKS TO OTHER SITES</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Cookies</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We use cookies on our website. Cookies files are downloaded to a device when certain websites are accessed by users, allowing the website to identify that user on subsequent visits.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">The only cookies in use on our site are for Google Analytics. Google Analytics are tools employed by organisations to help them understand how visitors engage with their website, so improvements can be made. Google Analytics collects information anonymously – and reports overall trends, without disclosing information on individual visitors. By using our site you are consenting to saving and sending us this data. You can opt out of Google Analytics – which will not affect how you visit our site. Further information on this can be found here: </span><a href=\"https://tools.google.com/dlpage/gaoptout\" style=\"color: rgb(14, 40, 42); border: 0px; margin: 0px; padding: 0px; outline: none;\">https://tools.google.com/dlpage/gaoptout</a></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Our website uses local storage strictly for system administration to provide you with the best possible experience – used in order to create reports relating to web traffic and user preferences. This includes: your IP address; details of which web browser or operating system was used; and information on how you use the site.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Links to other sites</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Our website contains hyperlinks to many other websites. We are not responsible for the content or functionality of any of those external websites.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If an external website requests personal information from you (e.g. in connection with an order for goods or services), the information you provide will not be covered by the Demos’ Privacy Policy. We suggest you read the privacy policy of any website before providing any personal information.</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">CHANGES TO THIS PRIVACY POLICY</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We’ll amend this Privacy Policy from time to time to ensure it remains up-to-date and accurately reflects how and why we use your personal data. The current version of our Privacy Policy will always be posted on our website.</span></p></h1><h4 style=\"margin: 20px 0px; font-weight: normal; font-size: 20px; border: 0px; padding: 0px; font-family: AR12; color: rgb(58, 72, 81); white-space: normal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Note on compliance with the General Data Protection Regulation as pertaining to use of social media data within Demos projects</span></h4><h1 style=\"margin: 20px 0px; font-weight: normal; font-size: 36px; border: 0px; padding: 0px; font-family: AR12; color: rgb(58, 72, 81); white-space: normal;\"><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">The Centre for the Analysis of Social Media (CASM) often conducts research which involves the collection and analysis of publicly available data from social media platforms.  Much of this data, including usernames, is considered personal data under the General Data Protection Regulation (GDPR). In order to ensure this data is processed lawfully and transparently, the following procedures are followed by CASM projects undertaken by Demos:</span></p><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">All data collected from social media platforms is accessed through the official application programming interface (API) of that platform, and stored and used in compliance with that API’s terms of service.</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Data is only collected from platforms for which users have provided clear consent, as defined in Article 4(11) of the GDPR, to provide that platform with published data</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">CASM often applies techniques in artificial intelligence to social media data, in order to conduct research on this data. As we have throughout our history as a research centre, we ensure that the reasons for applying these techniques, the methodology used to analyse data, and the conclusions drawn from our analysis are presented clearly and fully in each report. This includes publishing detailed accuracy scores for any machine learning algorithms applied as part of the research.</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">This data is securely stored on a monitored server, accessible only to CASM staff, and encrypted in transit. In the event that a data breach is discovered, CASM will act swiftly to ensure that damage from this breach is minimised, including informing relevant supervisory authorities and acting to identify and resolve any security issues allowing the breach.</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos will maintain a publicly accessible page on its website for each project, explaining the sources and character of data collected for that project, the purposes for which this data will be used, and including contact details for a designated member of staff responsible for responding to public queries about this data.</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Data collected from social media sites is not stored for longer than is necessary to complete each project</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">In order to respect the rights of data controllers to maintain control of their personal data, CASM will remove from any dataset personal data pertaining to an individual who requests such deletion. This includes taking reasonable measures to ensure that content deleted from social media platforms is also removed from datasets used by CASM.</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">CASM does not publish any personal data collected during its research, nor is personal data shared with third parties external to CASM or transferred out of the UK, without the explicit consent of the data subject. Any data published or shared with a third party is aggregated, anonymised or altered to prevent identification a natural person.</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Where quotes from social media users are published in reports, these quotes are bowdlerised – altered in a way which preserves meaning but prevents retroactive identification of the original post through e.g an online search. An occasional exception to this policy is observed when the user is publically known to the extent that they would not reasonably expect their social media posts to be private. It should be noted here that the GDPR only applies to natural persons, and not companies or organisations.</span></li></ul><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">This Privacy Policy was last updated on 05.07.2020</span></p></h1></pre>', '2022-05-18 10:45:41', '2022-11-18 00:59:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `is_block` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=no 1=yes_blocked',
  `identity` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `profile_image` varchar(555) DEFAULT NULL,
  `is_notification` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=no 1=yes',
  `device_type` tinyint(1) DEFAULT NULL COMMENT '1=android 2=iOS',
  `device_token` varchar(555) DEFAULT NULL,
  `login_type` tinyint(1) DEFAULT NULL COMMENT '1=apple 2=gmail 3=email',
  `wallet` float NOT NULL DEFAULT '0',
  `favourite_salons` text,
  `favourite_services` text,
  `coupons_used` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(555) DEFAULT NULL,
  `mobile` varchar(55) DEFAULT NULL,
  `address` varchar(999) DEFAULT NULL,
  `locality` varchar(555) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `pin` varchar(15) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `type` int NOT NULL DEFAULT '1' COMMENT '1=home 2=office',
  `latitude` varchar(555) DEFAULT NULL,
  `longitude` varchar(555) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int NOT NULL,
  `title` varchar(555) DEFAULT NULL,
  `description` varchar(999) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_wallet_recharge_logs`
--

CREATE TABLE `user_wallet_recharge_logs` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `gateway` varchar(255) NOT NULL,
  `transaction_id` varchar(555) DEFAULT NULL,
  `transaction_summary` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_wallet_statement`
--

CREATE TABLE `user_wallet_statement` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `booking_id` varchar(255) DEFAULT NULL,
  `type` int NOT NULL COMMENT 'check constants in code',
  `amount` float NOT NULL DEFAULT '0',
  `cr_or_dr` tinyint(1) NOT NULL COMMENT '1=credit 0=debit',
  `summary` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_withdraw_request`
--

CREATE TABLE `user_withdraw_request` (
  `id` int NOT NULL,
  `request_number` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=pending 1=completed 2=rejected',
  `amount` float NOT NULL,
  `bank_title` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `holder` varchar(255) NOT NULL,
  `swift_code` varchar(255) NOT NULL,
  `summary` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `platform_data`
--
ALTER TABLE `platform_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `platform_earning_history`
--
ALTER TABLE `platform_earning_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon`
--
ALTER TABLE `salon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon_awards`
--
ALTER TABLE `salon_awards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon_bank_accounts`
--
ALTER TABLE `salon_bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon_booking_slots`
--
ALTER TABLE `salon_booking_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon_categories`
--
ALTER TABLE `salon_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon_earning_history`
--
ALTER TABLE `salon_earning_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon_gallery`
--
ALTER TABLE `salon_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon_images`
--
ALTER TABLE `salon_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon_notifications`
--
ALTER TABLE `salon_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon_payouts`
--
ALTER TABLE `salon_payouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon_reviews`
--
ALTER TABLE `salon_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon_services`
--
ALTER TABLE `salon_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon_service_images`
--
ALTER TABLE `salon_service_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon_staff`
--
ALTER TABLE `salon_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon_wallet_statement`
--
ALTER TABLE `salon_wallet_statement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pages`
--
ALTER TABLE `tbl_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_wallet_recharge_logs`
--
ALTER TABLE `user_wallet_recharge_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_wallet_statement`
--
ALTER TABLE `user_wallet_statement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_withdraw_request`
--
ALTER TABLE `user_withdraw_request`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `global_settings`
--
ALTER TABLE `global_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `platform_data`
--
ALTER TABLE `platform_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `platform_earning_history`
--
ALTER TABLE `platform_earning_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salon`
--
ALTER TABLE `salon`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salon_awards`
--
ALTER TABLE `salon_awards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salon_bank_accounts`
--
ALTER TABLE `salon_bank_accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salon_booking_slots`
--
ALTER TABLE `salon_booking_slots`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salon_categories`
--
ALTER TABLE `salon_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salon_earning_history`
--
ALTER TABLE `salon_earning_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salon_gallery`
--
ALTER TABLE `salon_gallery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salon_images`
--
ALTER TABLE `salon_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salon_notifications`
--
ALTER TABLE `salon_notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salon_payouts`
--
ALTER TABLE `salon_payouts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salon_reviews`
--
ALTER TABLE `salon_reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salon_services`
--
ALTER TABLE `salon_services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salon_service_images`
--
ALTER TABLE `salon_service_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salon_staff`
--
ALTER TABLE `salon_staff`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `salon_wallet_statement`
--
ALTER TABLE `salon_wallet_statement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pages`
--
ALTER TABLE `tbl_pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_wallet_recharge_logs`
--
ALTER TABLE `user_wallet_recharge_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_wallet_statement`
--
ALTER TABLE `user_wallet_statement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_withdraw_request`
--
ALTER TABLE `user_withdraw_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

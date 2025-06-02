-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2025 at 01:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatapplaravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_1b6453892473a467d07372d45eb05abc2031647a', 'i:4;', 1748241444),
('laravel_cache_1b6453892473a467d07372d45eb05abc2031647a:timer', 'i:1748241444;', 1748241444),
('laravel_cache_5c785c036466adea360111aa28563bfd556b5fba', 'i:6;', 1748241069),
('laravel_cache_5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1748241069;', 1748241069),
('laravel_cache_admin@gmail.com|127.0.0.1', 'i:1;', 1748775580),
('laravel_cache_admin@gmail.com|127.0.0.1:timer', 'i:1748775580;', 1748775580),
('laravel_cache_laravel:reverb:restart', 'i:1748240847;', 2063600847);

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
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `reciver_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(127, 12, 11, 'Hello', '2025-06-01 13:13:36', '2025-06-01 13:13:29', '2025-06-01 13:13:36'),
(128, 11, 12, 'Hello', '2025-06-01 13:32:30', '2025-06-01 13:32:23', '2025-06-01 13:32:30'),
(129, 12, 11, 'Hey', '2025-06-01 13:35:32', '2025-06-01 13:35:30', '2025-06-01 13:35:32'),
(130, 11, 12, 'Hey', '2025-06-02 00:07:07', '2025-06-02 00:07:05', '2025-06-02 00:07:07'),
(131, 12, 11, 'Hey', '2025-06-02 00:10:17', '2025-06-02 00:10:15', '2025-06-02 00:10:17'),
(132, 12, 11, 'hiiiiiiiii', '2025-06-02 00:10:38', '2025-06-02 00:10:35', '2025-06-02 00:10:38'),
(133, 12, 11, 'HI', '2025-06-02 00:21:35', '2025-06-02 00:21:33', '2025-06-02 00:21:35'),
(134, 11, 12, 'Hi', '2025-06-02 00:21:46', '2025-06-02 00:21:44', '2025-06-02 00:21:46'),
(135, 11, 12, 'Hello', '2025-06-02 00:26:29', '2025-06-02 00:26:27', '2025-06-02 00:26:29'),
(136, 12, 11, 'Hi', '2025-06-02 00:29:06', '2025-06-02 00:29:00', '2025-06-02 00:29:06'),
(137, 12, 11, 'Hello', '2025-06-02 00:29:11', '2025-06-02 00:29:09', '2025-06-02 00:29:11'),
(138, 13, 12, 'hello', '2025-06-02 01:24:18', '2025-06-02 01:23:35', '2025-06-02 01:24:18'),
(139, 12, 13, 'hello', '2025-06-02 01:24:35', '2025-06-02 01:24:33', '2025-06-02 01:24:35'),
(140, 13, 12, 'how are you', '2025-06-02 01:24:41', '2025-06-02 01:24:38', '2025-06-02 01:24:41'),
(141, 12, 11, 'are you there', '2025-06-02 02:37:25', '2025-06-02 01:24:47', '2025-06-02 02:37:25'),
(142, 12, 13, 'fine', '2025-06-02 01:25:02', '2025-06-02 01:24:59', '2025-06-02 01:25:02');

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_20_094207_create_chat_messages_table', 1),
(5, '2025_05_21_052937_add_read_at_to_chat_messages_table', 1),
(6, '2025_05_22_101022_create_personal_access_tokens_table', 1),
(7, '2025_05_23_083510_create_messages_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'App\\Models\\User', 1, 'auth-token', '3eb7a664f59baaf2665b4df5059699acc94d7bb4e582bb748c72d567130fba0d', '[\"*\"]', NULL, NULL, '2025-05-22 06:50:51', '2025-05-22 06:50:51'),
(2, 'App\\Models\\User', 1, 'auth-token', '0e665bde36a5030a7922435d4c832988e60cd4fccd1e7e9c52a7c0899505d753', '[\"*\"]', NULL, NULL, '2025-05-22 06:53:01', '2025-05-22 06:53:01'),
(3, 'App\\Models\\User', 1, 'auth-token', '3bc401e9b7ccccb3c0379c7e4c8328025526be0385087e5752792aa2a9b3c987', '[\"*\"]', NULL, NULL, '2025-05-22 06:53:30', '2025-05-22 06:53:30'),
(4, 'App\\Models\\User', 1, 'auth-token', 'f541fe9ba90b6c1f54f98a6ebda448aa8444a25637b6ba0d8f420d7a6a83ade1', '[\"*\"]', NULL, NULL, '2025-05-22 06:54:16', '2025-05-22 06:54:16'),
(7, 'App\\Models\\User', 3, 'auth-token', '42f1b8600fca525f3df14f0243e120f2dfc81e320164523b43c5a3362294a9eb', '[\"*\"]', NULL, NULL, '2025-05-22 07:31:26', '2025-05-22 07:31:26'),
(8, 'App\\Models\\User', 1, 'auth-token', 'b55fc35bf7024b14bc3148e175e40a87b4ac0e529cb1c654e3d694cf9435c0c9', '[\"*\"]', NULL, NULL, '2025-05-22 07:31:46', '2025-05-22 07:31:46'),
(9, 'App\\Models\\User', 1, 'auth-token', '988277ad10a152cb535906f374caa5741ff66fe0945c63b0ea814b11c86780da', '[\"*\"]', NULL, NULL, '2025-05-22 07:33:28', '2025-05-22 07:33:28'),
(10, 'App\\Models\\User', 1, 'auth-token', '75d3a551c4e7ad08396eba666afe3f643a635075f4b5cf962bc03e72c32954b5', '[\"*\"]', NULL, NULL, '2025-05-22 23:17:37', '2025-05-22 23:17:37'),
(11, 'App\\Models\\User', 1, 'auth-token', 'bcc10d6d438798ca226858e0bd1ca859d4c8c10124902f5e39362ed1beec8c06', '[\"*\"]', NULL, NULL, '2025-05-22 23:17:40', '2025-05-22 23:17:40'),
(12, 'App\\Models\\User', 1, 'auth-token', '7b1111b522b0722ff2779dd38041c8a218df41fdc9c02357cc57a8fb2760c846', '[\"*\"]', NULL, NULL, '2025-05-22 23:17:41', '2025-05-22 23:17:41'),
(13, 'App\\Models\\User', 4, 'auth-token', 'd0d7df61b929f0180f11b883458d6343ee72640c37400e2d4e0c23176550f822', '[\"*\"]', NULL, NULL, '2025-05-22 23:33:49', '2025-05-22 23:33:49'),
(14, 'App\\Models\\User', 4, 'auth-token', '7a41b81fdb0fd32e64b91a8265defaa55cc974c1112ae23dda45ca8da5c51206', '[\"*\"]', NULL, NULL, '2025-05-22 23:34:10', '2025-05-22 23:34:10'),
(15, 'App\\Models\\User', 3, 'auth-token', '95d18a0775e7056443fa0e9933640c69745a48d7992da76cf760df55fb0f8568', '[\"*\"]', NULL, NULL, '2025-05-23 00:15:43', '2025-05-23 00:15:43'),
(16, 'App\\Models\\User', 4, 'auth-token', '2ea9ad68ce4ea7cf17725c19330866929924069c68e2fe44d16ec5e05e05e95b', '[\"*\"]', NULL, NULL, '2025-05-23 00:34:18', '2025-05-23 00:34:18'),
(17, 'App\\Models\\User', 3, 'auth-token', '67f6a57a7632b9bdcc2cd7634f80b62d394e654a32215a5a12940e25f42d0fb3', '[\"*\"]', NULL, NULL, '2025-05-23 01:06:09', '2025-05-23 01:06:09'),
(18, 'App\\Models\\User', 1, 'auth-token', '5cf8ab448eb215520a6fe565b37a51a1b17345bde9784b6485fae633404ca4ec', '[\"*\"]', NULL, NULL, '2025-05-23 01:14:19', '2025-05-23 01:14:19'),
(19, 'App\\Models\\User', 1, 'auth-token', '7f967e3a278db82675ddf114a6964a2765efee57f8843ece787628a9cfda9d87', '[\"*\"]', NULL, NULL, '2025-05-23 01:23:16', '2025-05-23 01:23:16'),
(20, 'App\\Models\\User', 1, 'auth-token', 'f0f189999f91af74dac7025ef3f915295536ba8f6ed20d0d7873fe162b0000db', '[\"*\"]', NULL, NULL, '2025-05-23 01:25:43', '2025-05-23 01:25:43'),
(21, 'App\\Models\\User', 1, 'auth-token', 'f6966b7cdfdff295079f1e56ed3c8c11b7225c1a2ea3f9060cb550ac62ddcb01', '[\"*\"]', NULL, NULL, '2025-05-23 01:28:04', '2025-05-23 01:28:04'),
(22, 'App\\Models\\User', 1, 'auth-token', '1554924f98e7292e9e7ad152ea24376b6a6c5c760af6655a6f8d18fdae04069f', '[\"*\"]', NULL, NULL, '2025-05-23 01:28:40', '2025-05-23 01:28:40'),
(23, 'App\\Models\\User', 1, 'auth-token', 'e4e5a40665d78ff532b69bdf2fb2aca39a4bd12504086fc82f32b17a0de4afad', '[\"*\"]', NULL, NULL, '2025-05-23 01:30:55', '2025-05-23 01:30:55'),
(24, 'App\\Models\\User', 1, 'auth-token', '807284fa33f0fd23a4fa57367ff60edb33f340d33327d7a07bf4ac54c740e40f', '[\"*\"]', NULL, NULL, '2025-05-23 01:31:19', '2025-05-23 01:31:19'),
(25, 'App\\Models\\User', 1, 'auth-token', '103290277749a25224bc53a72c6c84f998f70bfd72b28f3626eb5583f3f0e40c', '[\"*\"]', NULL, NULL, '2025-05-23 01:32:51', '2025-05-23 01:32:51'),
(26, 'App\\Models\\User', 1, 'auth-token', '493dfef8a9ce1c109ab834231502f81830c9865eeb9ecbf29344494a9f1526f7', '[\"*\"]', NULL, NULL, '2025-05-23 01:37:39', '2025-05-23 01:37:39'),
(27, 'App\\Models\\User', 1, 'auth-token', '7851d33414dd6bb5f0ec0a9eeca158d02344433de70c0995c91aeb1185c0d221', '[\"*\"]', NULL, NULL, '2025-05-23 01:37:56', '2025-05-23 01:37:56'),
(28, 'App\\Models\\User', 1, 'auth-token', '6741e5498fdda69a01910af3938a05135449b6a5cc28193dbd50ed6ac4320b36', '[\"*\"]', NULL, NULL, '2025-05-23 01:38:47', '2025-05-23 01:38:47'),
(29, 'App\\Models\\User', 1, 'auth-token', '38d164977849dfee7587379568243688c8aad9a6c6d6f1b384e36fd6d2faba01', '[\"*\"]', NULL, NULL, '2025-05-23 01:39:35', '2025-05-23 01:39:35'),
(30, 'App\\Models\\User', 1, 'auth-token', '6ebe15fac149d1705d8332bd136717a0db1d6ae743aa62de9043b17e03a06101', '[\"*\"]', NULL, NULL, '2025-05-23 01:42:54', '2025-05-23 01:42:54'),
(31, 'App\\Models\\User', 5, 'auth-token', '163cdde4df033e38164438e2f3f61971393b709f48b1fd4deaf9a980c39631cb', '[\"*\"]', NULL, NULL, '2025-05-23 02:00:38', '2025-05-23 02:00:38'),
(32, 'App\\Models\\User', 5, 'auth-token', 'c9fc0bb9f2ce822dcb83c9fa85c630279a43e0584a82ee48aa2b5364f145c9ce', '[\"*\"]', NULL, NULL, '2025-05-23 02:02:33', '2025-05-23 02:02:33'),
(33, 'App\\Models\\User', 5, 'auth-token', 'f59f4b798ed3318ecf61474c9c149fab51f025242b531b2a208aa66c2ea85120', '[\"*\"]', NULL, NULL, '2025-05-23 02:06:28', '2025-05-23 02:06:28'),
(34, 'App\\Models\\User', 1, 'auth-token', '5ada8f01d44f1a7a31553061e640511276373ac916e896368580bc3027b61924', '[\"*\"]', NULL, NULL, '2025-05-23 02:12:14', '2025-05-23 02:12:14'),
(35, 'App\\Models\\User', 1, 'auth-token', 'f172ffee50b7af7c0cf7df48dff342f4e0b45bfaa65daa386f05173e5569677f', '[\"*\"]', NULL, NULL, '2025-05-23 02:12:20', '2025-05-23 02:12:20'),
(36, 'App\\Models\\User', 1, 'auth-token', '5290f1fa9c3b79921cde07b1aacd3d3c5f42c0478b0c9e28e92feed0186c7b0d', '[\"*\"]', NULL, NULL, '2025-05-23 02:13:37', '2025-05-23 02:13:37'),
(38, 'App\\Models\\User', 4, 'auth-token', '90008ceccd70123133be45a277791dc04eade124911f54bccf7be6238460a11e', '[\"*\"]', NULL, NULL, '2025-05-23 02:16:19', '2025-05-23 02:16:19'),
(40, 'App\\Models\\User', 4, 'auth-token', 'c5fbe8059d2ba52b592db1ffbf26a36e02c5d288290f7c78b90a9378732692ad', '[\"*\"]', NULL, NULL, '2025-05-23 02:20:30', '2025-05-23 02:20:30'),
(42, 'App\\Models\\User', 6, 'api-token', '024aa4ea536c27ea54d773d0d4a4c2b584c3ab7c1f3b11b7e8a4c136fddf27a0', '[\"*\"]', NULL, NULL, '2025-05-23 02:59:27', '2025-05-23 02:59:27'),
(43, 'App\\Models\\User', 6, 'api-token', 'a71abe5c9290a13975774ee107c0a1f6a56677ed21fe4f305d72b52e5109bc45', '[\"*\"]', '2025-05-23 10:50:09', NULL, '2025-05-23 03:03:00', '2025-05-23 10:50:09'),
(44, 'App\\Models\\User', 1, 'api-token', 'd0f20baaa5fba06d96cdde20c3bf9864b31ac642fae027629da0d9fee9de0b93', '[\"*\"]', NULL, NULL, '2025-05-23 03:31:56', '2025-05-23 03:31:56'),
(45, 'App\\Models\\User', 1, 'api-token', 'd4e70e8f0b3f6f416a99ecf8f0acc4786f5395e6e2177115c33000f82db278de', '[\"*\"]', NULL, NULL, '2025-05-23 03:31:57', '2025-05-23 03:31:57'),
(46, 'App\\Models\\User', 1, 'api-token', 'b3099213f257820186a7f90821895f861d1c1788df6eba657bcae3f88400d7e6', '[\"*\"]', '2025-05-23 03:43:21', NULL, '2025-05-23 03:35:06', '2025-05-23 03:43:21'),
(47, 'App\\Models\\User', 1, 'api-token', 'c0d8d488d67904e49b3da22796b7912537a8b9a4adca9378ac0ac66d4bd46b62', '[\"*\"]', '2025-05-23 03:43:33', NULL, '2025-05-23 03:43:32', '2025-05-23 03:43:33'),
(48, 'App\\Models\\User', 7, 'api-token', '7d81cdf0bdf68ec6497696e3941943b3e663a37caf25c8f8cb6358c5f175c5f9', '[\"*\"]', '2025-05-23 03:44:39', NULL, '2025-05-23 03:44:15', '2025-05-23 03:44:39'),
(49, 'App\\Models\\User', 1, 'api-token', '6e55a9413ebedb42bd1e2d87136600bb6748d03040519dc2cd437e0c1e588aaf', '[\"*\"]', '2025-05-23 03:45:00', NULL, '2025-05-23 03:44:46', '2025-05-23 03:45:00'),
(50, 'App\\Models\\User', 1, 'api-token', '57f8afd93ce009a09d19cc6904be61e9a0d113cca5749dd64d6cb0859f3d9c71', '[\"*\"]', '2025-05-23 04:13:12', NULL, '2025-05-23 04:13:11', '2025-05-23 04:13:12'),
(51, 'App\\Models\\User', 1, 'api-token', '4cfb4ec8fc7e9cc6be32af804250bd8546aabb93fd466b355e1523494bb84def', '[\"*\"]', '2025-05-23 04:34:24', NULL, '2025-05-23 04:13:29', '2025-05-23 04:34:24'),
(52, 'App\\Models\\User', 1, 'api-token', '9b86abdd5057e2859f4b0b4a2bfa6ab35e4557167cde5caebb513d1d50b37cdd', '[\"*\"]', '2025-05-23 04:34:28', NULL, '2025-05-23 04:34:28', '2025-05-23 04:34:28'),
(53, 'App\\Models\\User', 1, 'api-token', 'c9d71ef3927688971fe3bf48a6057106633594ebd1118b9bca3b91d959b5db8a', '[\"*\"]', '2025-05-23 04:34:31', NULL, '2025-05-23 04:34:31', '2025-05-23 04:34:31'),
(54, 'App\\Models\\User', 1, 'api-token', '2552f1fba895d61ef8f2855a742943bde410b5594f325fe844d6fe94e600f472', '[\"*\"]', NULL, NULL, '2025-05-23 04:35:27', '2025-05-23 04:35:27'),
(55, 'App\\Models\\User', 1, 'api-token', '64655e6eec7d97cf15714c47bfb52977a2b3eb83798dace4445df01fa9bb9e00', '[\"*\"]', NULL, NULL, '2025-05-23 04:35:44', '2025-05-23 04:35:44'),
(56, 'App\\Models\\User', 1, 'api-token', 'd810fc531fe9969731363f2d7cb1baa522929c0f7870c117e54333d781608200', '[\"*\"]', NULL, NULL, '2025-05-23 04:35:48', '2025-05-23 04:35:48'),
(57, 'App\\Models\\User', 1, 'api-token', '4e212d9187d5fabd7b10855ca3c61ceefc3f3b5d106ef068529b9492052a2f9a', '[\"*\"]', NULL, NULL, '2025-05-23 04:36:33', '2025-05-23 04:36:33'),
(58, 'App\\Models\\User', 1, 'api-token', '211b15af023635f1aafbe09e40806d9c2d786b03a2afee4907941ac50549cbaf', '[\"*\"]', NULL, NULL, '2025-05-23 04:36:37', '2025-05-23 04:36:37'),
(59, 'App\\Models\\User', 1, 'api-token', 'b83649668f7f80654c5acc85eba7637cc3bec9f70f513b55346190cd8014d0a2', '[\"*\"]', NULL, NULL, '2025-05-23 04:36:47', '2025-05-23 04:36:47'),
(60, 'App\\Models\\User', 1, 'api-token', 'e67d9ac50a0180d0bf4c76061471467d6244af466d5c095b8e17b58046684b06', '[\"*\"]', NULL, NULL, '2025-05-23 04:37:16', '2025-05-23 04:37:16'),
(61, 'App\\Models\\User', 1, 'api-token', 'ec81e7f3092b9696410a105db3b882d87e9cac1276e6176e67007c145bc3fdb8', '[\"*\"]', NULL, NULL, '2025-05-23 04:37:30', '2025-05-23 04:37:30'),
(62, 'App\\Models\\User', 1, 'api-token', '28d30cdbdb0313413e4281fd5b53deb5865d4616abad0f640c47f0d7720ec960', '[\"*\"]', '2025-05-23 04:37:48', NULL, '2025-05-23 04:37:48', '2025-05-23 04:37:48'),
(63, 'App\\Models\\User', 1, 'api-token', 'c84558cde80a475b3abe6469e6c644a7a7aa09b586dfa9f648e0c07eec83cee5', '[\"*\"]', NULL, NULL, '2025-05-23 04:39:38', '2025-05-23 04:39:38'),
(64, 'App\\Models\\User', 1, 'api-token', 'af8b8890eef2cf16f9a9678fd5db4692c5af0c23e3b1f502eb9ca28979d35bff', '[\"*\"]', '2025-05-23 05:56:03', NULL, '2025-05-23 04:39:47', '2025-05-23 05:56:03'),
(65, 'App\\Models\\User', 1, 'api-token', '4fb5b0b27e5dfa101d22006201d28c948d6b001ff23b5e57241ad4dfec9c85d5', '[\"*\"]', '2025-05-23 05:56:12', NULL, '2025-05-23 05:56:06', '2025-05-23 05:56:12'),
(66, 'App\\Models\\User', 1, 'api-token', 'b97500fd299742ef40e689351e555e230bc9fffe40ffc908f1d18baf5a220333', '[\"*\"]', '2025-05-23 05:56:13', NULL, '2025-05-23 05:56:08', '2025-05-23 05:56:13'),
(67, 'App\\Models\\User', 1, 'api-token', '5c15eb798419146f894ada0a4594234033fc80afae2cdf9ac01b9a8322550ed7', '[\"*\"]', '2025-05-23 06:03:11', NULL, '2025-05-23 05:56:58', '2025-05-23 06:03:11'),
(68, 'App\\Models\\User', 1, 'api-token', '07b1dc031d05d2b0f79891af18414c06e7dec2dba0c64b28b569b55759188bd2', '[\"*\"]', '2025-05-23 06:04:32', NULL, '2025-05-23 06:03:30', '2025-05-23 06:04:32'),
(69, 'App\\Models\\User', 1, 'api-token', 'a4a810a1c76f93bd06a0993a9e635c28f87817c1dd0c4a1bbc9a28e2e6bbc8e3', '[\"*\"]', '2025-05-23 06:05:05', NULL, '2025-05-23 06:05:03', '2025-05-23 06:05:05'),
(70, 'App\\Models\\User', 1, 'api-token', '21e901ffdcd06cccf0dcdde5480f1005aefd90487a6507a896fe326b82a6536b', '[\"*\"]', '2025-05-23 07:46:22', NULL, '2025-05-23 06:05:27', '2025-05-23 07:46:22'),
(71, 'App\\Models\\User', 1, 'api-token', '1e90811dc0f09f6d59950596d2c6a0e1641ac40def65ccce451cefdaaa4763a4', '[\"*\"]', '2025-05-23 07:51:43', NULL, '2025-05-23 07:46:24', '2025-05-23 07:51:43'),
(72, 'App\\Models\\User', 4, 'api-token', '1c81777aa6d4b6667d4662a34a596b2fe47e056a0b40c73b193db9b8b69d1fef', '[\"*\"]', '2025-05-23 07:52:32', NULL, '2025-05-23 07:52:05', '2025-05-23 07:52:32'),
(73, 'App\\Models\\User', 4, 'api-token', 'ba2ea0368e51aa171a0d575e0f6620f8e0ba8dd73ded81b20b7b9271c9444050', '[\"*\"]', '2025-05-23 08:00:54', NULL, '2025-05-23 07:52:55', '2025-05-23 08:00:54'),
(74, 'App\\Models\\User', 4, 'api-token', 'e7115a85de4960b0bd9683bf4325c7063b8dad16ef1b0c5c7642dcc9efebb5d6', '[\"*\"]', '2025-05-23 10:29:37', NULL, '2025-05-23 10:29:35', '2025-05-23 10:29:37'),
(75, 'App\\Models\\User', 7, 'api-token', 'b513ef356f61dcb908df23966af534060fc2510373cb61466c4bdcafd5cd62ec', '[\"*\"]', '2025-05-23 11:56:12', NULL, '2025-05-23 11:56:09', '2025-05-23 11:56:12'),
(76, 'App\\Models\\User', 7, 'api-token', 'db79ec88da3e924ba383def41790e398f15c6d878a8a6a1605b83d4b19b5212e', '[\"*\"]', '2025-05-23 12:05:01', NULL, '2025-05-23 11:56:31', '2025-05-23 12:05:01'),
(77, 'App\\Models\\User', 7, 'api-token', 'dee388bacb29350467d0339fc0d6c82d53c276946ea78d64acde61b3c09c903a', '[\"*\"]', '2025-05-23 12:13:30', NULL, '2025-05-23 12:13:20', '2025-05-23 12:13:30'),
(78, 'App\\Models\\User', 7, 'api-token', '7c453619c126e4c280c8197ff249160df96c096cce44af4a90b04d0f5bb8e01b', '[\"*\"]', '2025-05-23 12:43:28', NULL, '2025-05-23 12:15:36', '2025-05-23 12:43:28'),
(79, 'App\\Models\\User', 4, 'api-token', '9ee22ef429d0bcfce2563e6476eaa0d858fc2477c2148fb345da315aa45594ee', '[\"*\"]', '2025-05-23 20:19:41', NULL, '2025-05-23 12:29:31', '2025-05-23 20:19:41'),
(80, 'App\\Models\\User', 7, 'api-token', 'ef568e0958f8e3495ce52ade4757862ac09bfc6d30ff4c4c47a7586e4be1abb4', '[\"*\"]', NULL, NULL, '2025-05-24 00:06:51', '2025-05-24 00:06:51'),
(81, 'App\\Models\\User', 7, 'api-token', '6a76e6d5cbbbaf7a08a9a5a05d081e88cca18bb22cdbc457b97379194c3b6b40', '[\"*\"]', '2025-05-24 03:30:34', NULL, '2025-05-24 00:07:36', '2025-05-24 03:30:34'),
(82, 'App\\Models\\User', 4, 'api-token', '9ae50d70d82995e87520505ceaea532fd762e1cb0ce904ee4386733a78c7c1f5', '[\"*\"]', '2025-05-24 03:29:42', NULL, '2025-05-24 01:44:34', '2025-05-24 03:29:42'),
(83, 'App\\Models\\User', 4, 'api-token', 'b7e76866c7cc626fb5e3d499ef137dae276f8b23b736d98a40b9f5b67f5e8396', '[\"*\"]', '2025-05-24 02:27:24', NULL, '2025-05-24 02:05:39', '2025-05-24 02:27:24'),
(84, 'App\\Models\\User', 4, 'api-token', '0def354c404baa69509bfcad03f4498bbf48a47e06c76798e2c566f4d61eda37', '[\"*\"]', '2025-05-24 04:40:12', NULL, '2025-05-24 04:06:32', '2025-05-24 04:40:12'),
(85, 'App\\Models\\User', 4, 'api-token', '416a65bf7b7ddc7715a0899d4f48ac4d9fec4b4b1d5008b33f310c083019b1bc', '[\"*\"]', NULL, NULL, '2025-05-24 04:23:17', '2025-05-24 04:23:17'),
(86, 'App\\Models\\User', 4, 'api-token', '81a0225abf2defbba25937d0017690e32a12438b2472f5e1645a96af925c6d8d', '[\"*\"]', '2025-05-24 04:51:26', NULL, '2025-05-24 04:40:19', '2025-05-24 04:51:26'),
(87, 'App\\Models\\User', 4, 'api-token', '71079f9d87434e5a64803909c13bd4e1267e5327c031db53a1e846c7a0734cc8', '[\"*\"]', '2025-05-24 05:03:59', NULL, '2025-05-24 04:51:35', '2025-05-24 05:03:59'),
(88, 'App\\Models\\User', 4, 'api-token', '073dfe002e6328e3867ba91c8463dd6ebe0c18f47cb2247ada25d55aa5db8070', '[\"*\"]', '2025-05-24 05:19:31', NULL, '2025-05-24 05:04:14', '2025-05-24 05:19:31'),
(89, 'App\\Models\\User', 4, 'api-token', '05dab9311f55e78d401a9ff5e5ac8ce189c301051225b096cb2a5cabff49a60f', '[\"*\"]', '2025-05-24 06:15:34', NULL, '2025-05-24 05:47:50', '2025-05-24 06:15:34'),
(90, 'App\\Models\\User', 1, 'api-token', '998c3bfd721e521d73c764e639ba0f664499c8d48001f103ddc00539a3011755', '[\"*\"]', '2025-05-24 07:25:29', NULL, '2025-05-24 06:15:57', '2025-05-24 07:25:29'),
(91, 'App\\Models\\User', 4, 'api-token', 'b3b6acfa2a565a414adc8a5073d07c551a58939bdffcac78d13fe4d34162ece2', '[\"*\"]', NULL, NULL, '2025-05-24 06:50:01', '2025-05-24 06:50:01'),
(92, 'App\\Models\\User', 4, 'api-token', '9458799d6fefbf73370a0b292e8947491df7a592f39094bfa0af5ab7e09e2ed4', '[\"*\"]', '2025-05-24 07:25:47', NULL, '2025-05-24 06:50:04', '2025-05-24 07:25:47'),
(93, 'App\\Models\\User', 1, 'api-token', 'dcbb9760cc7d8bffeee5073ae47d9ca45e8b57ed19b846fe68fa8c6dde0048fe', '[\"*\"]', '2025-05-24 07:35:52', NULL, '2025-05-24 07:26:18', '2025-05-24 07:35:52'),
(94, 'App\\Models\\User', 4, 'api-token', '3f37a401b0f62decec82041740e492e8f8193dd43017fed7cdc16400baf17174', '[\"*\"]', '2025-05-24 07:43:31', NULL, '2025-05-24 07:31:30', '2025-05-24 07:43:31'),
(95, 'App\\Models\\User', 1, 'api-token', '49031b33f9117fa03a16a9269a008dd5ad9455b57f4c04091cf01b6bd7bff74a', '[\"*\"]', '2025-05-24 07:52:10', NULL, '2025-05-24 07:44:10', '2025-05-24 07:52:10'),
(96, 'App\\Models\\User', 1, 'api-token', '556abab21f90229ae589738840bee00645da06e6d46fffdf0d541553477e78f1', '[\"*\"]', '2025-05-24 08:15:57', NULL, '2025-05-24 07:54:01', '2025-05-24 08:15:57'),
(97, 'App\\Models\\User', 4, 'api-token', '6e53fb1cea9543d87c53fb386aef6cb702b1acfa9b82100ef005b95afaac26b7', '[\"*\"]', '2025-05-24 08:15:58', NULL, '2025-05-24 07:57:32', '2025-05-24 08:15:58'),
(98, 'App\\Models\\User', 1, 'api-token', '7c830f66f560b118f286c22e4d819d1a3d96b5942fbabff3a242776a86f9669a', '[\"*\"]', '2025-05-24 08:20:39', NULL, '2025-05-24 08:19:19', '2025-05-24 08:20:39'),
(99, 'App\\Models\\User', 1, 'api-token', '31d83ddfbec78056aa1b6a76562301abaa0fff3b59565dc16a336e12d3abaa72', '[\"*\"]', '2025-05-24 08:21:34', NULL, '2025-05-24 08:21:29', '2025-05-24 08:21:34'),
(100, 'App\\Models\\User', 4, 'api-token', '0f62f2a7ddf9dcd8dfbbc6ce093a51918832b96ac7503e3917642fc1c8f08e16', '[\"*\"]', '2025-05-24 08:21:37', NULL, '2025-05-24 08:21:34', '2025-05-24 08:21:37'),
(101, 'App\\Models\\User', 1, 'api-token', 'c1e3fa18f40c1c6befbcc1c391e2fc64f498f03a1ab7c90b5c1b2d6a22235a91', '[\"*\"]', '2025-05-24 10:28:29', NULL, '2025-05-24 08:22:35', '2025-05-24 10:28:29'),
(102, 'App\\Models\\User', 4, 'api-token', 'a809cbafee2d1366adac0868d628302c361a2fd9e1f7214569629a5f5b7b7f98', '[\"*\"]', '2025-05-24 08:33:36', NULL, '2025-05-24 08:24:05', '2025-05-24 08:33:36'),
(103, 'App\\Models\\User', 4, 'api-token', '7a55ed0f802624f2144b4bbf3a7c193d86b3e1a40f36210c806003940939541b', '[\"*\"]', '2025-05-24 09:42:52', NULL, '2025-05-24 09:15:41', '2025-05-24 09:42:52'),
(104, 'App\\Models\\User', 4, 'api-token', '7b64f03062af850757b35335cb53b8cc1113234f0fae95b9ef9de0e0df37cce9', '[\"*\"]', '2025-05-24 09:43:53', NULL, '2025-05-24 09:43:50', '2025-05-24 09:43:53'),
(105, 'App\\Models\\User', 4, 'api-token', '4fab78db0214ec994fa2690160073c3544c3a96c2a092caeac1de3976b7e3413', '[\"*\"]', '2025-05-24 10:12:14', NULL, '2025-05-24 10:09:38', '2025-05-24 10:12:14'),
(106, 'App\\Models\\User', 4, 'api-token', 'f2e2b711e971481210c160a164917633b4b440be3b25bf90f534b81af2c7a223', '[\"*\"]', '2025-05-24 10:53:36', NULL, '2025-05-24 10:27:40', '2025-05-24 10:53:36'),
(107, 'App\\Models\\User', 1, 'api-token', '0b4af3817daeae5f3ef6eee4db541fa75311312682b9d523f48be9ad7c492170', '[\"*\"]', '2025-05-24 10:53:02', NULL, '2025-05-24 10:29:09', '2025-05-24 10:53:02'),
(108, 'App\\Models\\User', 4, 'api-token', '0ff1f71a504cb2ad1cb3085201732c43987de00864891aae3267b4a16d529271', '[\"*\"]', '2025-05-24 11:44:36', NULL, '2025-05-24 11:28:56', '2025-05-24 11:44:36'),
(109, 'App\\Models\\User', 1, 'api-token', 'b8b828596f69e717bed31568293094dcb35a58054acbe519bdf7e82f07977ef7', '[\"*\"]', '2025-05-24 11:49:09', NULL, '2025-05-24 11:31:05', '2025-05-24 11:49:09'),
(110, 'App\\Models\\User', 4, 'api-token', 'bfe9b7da4309639f726c80697669c11ba3b99a2fd846889e67445f9b2ee0e59b', '[\"*\"]', '2025-05-24 11:49:21', NULL, '2025-05-24 11:45:55', '2025-05-24 11:49:21'),
(111, 'App\\Models\\User', 4, 'api-token', '590bcce6474d1474cfbc732f85a4460f904285555137b9595608bcad7e7953cb', '[\"*\"]', '2025-05-25 02:01:55', NULL, '2025-05-25 00:10:08', '2025-05-25 02:01:55'),
(112, 'App\\Models\\User', 1, 'api-token', 'ed44e7c23b38ffe3e9e2ac6067cd86da61d9a110c3f88ce1342e7e4650090bb5', '[\"*\"]', '2025-05-25 02:01:32', NULL, '2025-05-25 00:10:46', '2025-05-25 02:01:32'),
(113, 'App\\Models\\User', 1, 'api-token', 'f2b12810f085e98590ce3f26c8e63660a66b2640a26b5c8c57dd0c1a6ef7584e', '[\"*\"]', '2025-05-25 04:36:48', NULL, '2025-05-25 02:02:15', '2025-05-25 04:36:48'),
(114, 'App\\Models\\User', 4, 'api-token', '6ef4d1cb3fa73a29ca13ec5be0efa202411297f6ba6c17562d5d08b523f3f064', '[\"*\"]', '2025-05-25 04:15:39', NULL, '2025-05-25 02:02:17', '2025-05-25 04:15:39'),
(115, 'App\\Models\\User', 1, 'api-token', '0737b37d162ed258d1f434eb230b95bcc3843f4eafc982d59703e048d12b8080', '[\"*\"]', '2025-05-25 03:04:14', NULL, '2025-05-25 03:04:04', '2025-05-25 03:04:14'),
(116, 'App\\Models\\User', 4, 'api-token', 'e48a237a7b737e8d97d168d0873172f6a1688a937184c5c0cdc92582273113e7', '[\"*\"]', '2025-05-25 04:38:03', NULL, '2025-05-25 03:04:43', '2025-05-25 04:38:03'),
(117, 'App\\Models\\User', 4, 'api-token', 'f064a66d764197deb5ef51c62d1ac9cb77742b905e1c4c34c8e2e382213fa19c', '[\"*\"]', '2025-05-25 04:55:46', NULL, '2025-05-25 04:38:38', '2025-05-25 04:55:46'),
(118, 'App\\Models\\User', 1, 'api-token', '816d6fc8015ac66ad5d9bd3a7da2c92f21671e0d3c45f74dc1da4f349afb5391', '[\"*\"]', '2025-05-25 04:55:45', NULL, '2025-05-25 04:38:39', '2025-05-25 04:55:45'),
(119, 'App\\Models\\User', 1, 'api-token', 'f3b43f6f86ab203003ec4fe1ae321465eb75e27d3497d5590c601d77d3cd12b7', '[\"*\"]', '2025-05-25 05:05:34', NULL, '2025-05-25 04:52:00', '2025-05-25 05:05:34'),
(120, 'App\\Models\\User', 4, 'api-token', '61aea7736037530228809b6dacf812632a39af62d9c07ce1f5a32f183617e0b4', '[\"*\"]', '2025-05-25 05:52:01', NULL, '2025-05-25 04:59:00', '2025-05-25 05:52:01'),
(121, 'App\\Models\\User', 1, 'api-token', '22b9a99e13085d068c56dad9bf60436eb571968d0725fd9440d038a8bf28b1c0', '[\"*\"]', '2025-05-25 05:51:31', NULL, '2025-05-25 04:59:02', '2025-05-25 05:51:31'),
(122, 'App\\Models\\User', 1, 'api-token', 'f846c91d9bce19327cc586731301534a7516ef3e5c44e5910fdf99cf4e1728db', '[\"*\"]', '2025-05-25 05:21:44', NULL, '2025-05-25 05:06:59', '2025-05-25 05:21:44'),
(123, 'App\\Models\\User', 1, 'api-token', '6e69c8bbd95c3ad88d7fc3e93a34f19e6facac147fd36486dc5a7b0d21749e9d', '[\"*\"]', '2025-05-25 06:07:53', NULL, '2025-05-25 06:07:04', '2025-05-25 06:07:53'),
(124, 'App\\Models\\User', 4, 'api-token', '861401144d5d69dd2557474160bd449681f642ad683514793a57d0494a9a9697', '[\"*\"]', '2025-05-25 06:08:03', NULL, '2025-05-25 06:07:34', '2025-05-25 06:08:03'),
(125, 'App\\Models\\User', 4, 'api-token', 'f3a4b619d2ce6f3a542a38dade5291c3a2ebd545ea3f249d84c1c279f3ddc395', '[\"*\"]', '2025-05-25 06:24:25', NULL, '2025-05-25 06:24:10', '2025-05-25 06:24:25'),
(126, 'App\\Models\\User', 1, 'api-token', '38ea1ab2ba81d035b0ce8a509afbfb213b067aaea861e6e8e475fd177fcf0512', '[\"*\"]', '2025-05-25 06:30:50', NULL, '2025-05-25 06:29:43', '2025-05-25 06:30:50'),
(127, 'App\\Models\\User', 4, 'api-token', '8997f42f8939ef66e213c3662cfbe08bc3d575e9d7f18c81950eed13a99441e0', '[\"*\"]', NULL, NULL, '2025-05-25 06:36:10', '2025-05-25 06:36:10'),
(128, 'App\\Models\\User', 1, 'api-token', '7db2d8b9772742cd9384a2ad9f629f5427b7958676b411c7f0c999d687362ec3', '[\"*\"]', '2025-05-25 08:19:34', NULL, '2025-05-25 08:09:39', '2025-05-25 08:19:34'),
(129, 'App\\Models\\User', 4, 'api-token', 'c3d2fa25f86825b66263ca374d763178208885c8a9d31ab12f7397eca9d3d8d5', '[\"*\"]', '2025-05-25 08:18:07', NULL, '2025-05-25 08:11:15', '2025-05-25 08:18:07'),
(130, 'App\\Models\\User', 4, 'api-token', '22a3f72487f45019e94845e120698370555ba1d1dce0f4b5f04ede1cfddec52d', '[\"*\"]', '2025-05-25 23:40:48', NULL, '2025-05-25 23:40:39', '2025-05-25 23:40:48'),
(131, 'App\\Models\\User', 4, 'api-token', '9c0a9a7299ffded08e164e686c9c580e1c88a1c9101496c48da355359911599c', '[\"*\"]', '2025-05-26 00:00:37', NULL, '2025-05-25 23:52:52', '2025-05-26 00:00:37'),
(132, 'App\\Models\\User', 4, 'api-token', 'cc5ae91dd8a4ad15653c355cd186817b48bdf48cb6887711a7b5d780763ca99b', '[\"*\"]', NULL, NULL, '2025-05-26 00:17:34', '2025-05-26 00:17:34'),
(133, 'App\\Models\\User', 4, 'api-token', '15d0e06edee3e76a1b28a0b486fef71abd00a24215c7318897a931c5ead380cf', '[\"*\"]', '2025-05-26 01:06:30', NULL, '2025-05-26 00:18:26', '2025-05-26 01:06:30'),
(134, 'App\\Models\\User', 4, 'api-token', 'de41be2e90601b0add9784a53f30dc62707dd538575848033fb1a24adac9e838', '[\"*\"]', '2025-05-26 05:20:32', NULL, '2025-05-26 05:19:04', '2025-05-26 05:20:32'),
(135, 'App\\Models\\User', 8, 'auth-token', 'fbee7d3c0424a16923cf844c41827b472a43f450a54dc14109d5879a6910adf7', '[\"*\"]', NULL, NULL, '2025-05-26 07:39:47', '2025-05-26 07:39:47'),
(136, 'App\\Models\\User', 1, 'api-token', 'e2dac66b0b2863302ae74cf5fdd6f7c1be4a584243430c294d344ec0ab7e48aa', '[\"*\"]', NULL, NULL, '2025-05-26 07:40:05', '2025-05-26 07:40:05'),
(137, 'App\\Models\\User', 1, 'api-token', '6cd3dec98e7b9b07e56335692503a48b7997c95d4fddd48e501862cb3adfc6c4', '[\"*\"]', NULL, NULL, '2025-05-26 07:46:00', '2025-05-26 07:46:00'),
(138, 'App\\Models\\User', 1, 'api-token', '966880ff85ec155d43fc62846fda7370ef4d2ac9ed315aca886af1c955910bf7', '[\"*\"]', NULL, NULL, '2025-05-26 07:51:02', '2025-05-26 07:51:02'),
(139, 'App\\Models\\User', 1, 'api-token', '44ee9c57e8b6d0263985668b446b7f587daba97153bec5d073b824f84e07f06c', '[\"*\"]', NULL, NULL, '2025-05-26 07:53:50', '2025-05-26 07:53:50'),
(140, 'App\\Models\\User', 4, 'api-token', '3ea5acfd74acd3bc10b5008d0516cbe57d408a6f1bfab11300f22efe29a5fb78', '[\"*\"]', NULL, NULL, '2025-05-26 08:03:36', '2025-05-26 08:03:36'),
(141, 'App\\Models\\User', 1, 'api-token', 'c968e5eac5ae32d5a3f1e950afee4add6168fc281af5b1909b962584602bc118', '[\"*\"]', NULL, NULL, '2025-05-26 08:10:47', '2025-05-26 08:10:47'),
(142, 'App\\Models\\User', 1, 'api-token', '4fffc7ef39265c4349b630424ee5c5af17fa44cbf34309527653428e58760168', '[\"*\"]', NULL, NULL, '2025-05-26 08:12:06', '2025-05-26 08:12:06'),
(143, 'App\\Models\\User', 1, 'api-token', '22d9c4ac5d590757217da5d7cbcf789fa1a001443eb4b980c95c278a9dc8803d', '[\"*\"]', NULL, NULL, '2025-05-26 08:12:07', '2025-05-26 08:12:07'),
(144, 'App\\Models\\User', 1, 'api-token', 'beda51de38316585d33ebaaf798f93cd3dcd1246337d51577ceba35fcc692236', '[\"*\"]', NULL, NULL, '2025-05-26 08:12:09', '2025-05-26 08:12:09'),
(145, 'App\\Models\\User', 1, 'api-token', 'f7fb717c780fe44a25f32e3a02abe8c3b053ff474c614ca74cb7345a5422d6bd', '[\"*\"]', NULL, NULL, '2025-05-26 08:15:24', '2025-05-26 08:15:24'),
(146, 'App\\Models\\User', 1, 'api-token', 'dc7c8dff1554752bf559b562a0638ca50ef68baa82a3fd577e924fd402bce76a', '[\"*\"]', NULL, NULL, '2025-05-26 08:19:32', '2025-05-26 08:19:32'),
(147, 'App\\Models\\User', 1, 'api-token', 'b2356fec01eb6aa3773b03550768cddad0e84a2073ce361ffa3ede17ce039fd5', '[\"*\"]', NULL, NULL, '2025-05-26 08:20:45', '2025-05-26 08:20:45'),
(148, 'App\\Models\\User', 1, 'api-token', 'ac89c5e2102c4126d4a6c960e4412ed1e98cb075fb665d16b2d0c1c6a3d857a8', '[\"*\"]', NULL, NULL, '2025-05-26 08:25:10', '2025-05-26 08:25:10'),
(149, 'App\\Models\\User', 1, 'api-token', '96ba63a20883817eaad353ccfdfb8e26011e81c4f5157e41be52d77d25675413', '[\"*\"]', NULL, NULL, '2025-05-26 10:24:06', '2025-05-26 10:24:06'),
(150, 'App\\Models\\User', 1, 'api-token', 'eb6a311506cfa2bd5210987bcbc880f036a534e49214f832a8cfed41de9b86ac', '[\"*\"]', NULL, NULL, '2025-05-26 10:28:29', '2025-05-26 10:28:29'),
(151, 'App\\Models\\User', 1, 'api-token', '1e6fa9d894c6cbd298b8ebb134dc4f2ef3dae4fc16e9d2ed1c9057224fd34054', '[\"*\"]', NULL, NULL, '2025-05-26 10:35:08', '2025-05-26 10:35:08'),
(152, 'App\\Models\\User', 1, 'api-token', '7e102ab86705057b32046bef11b06caa68ffa73ef79f8f75ab697d73346a565a', '[\"*\"]', NULL, NULL, '2025-05-26 10:38:17', '2025-05-26 10:38:17'),
(153, 'App\\Models\\User', 1, 'api-token', '08170b33d895ad4d8b786e6d54ffaca3fc8ca79b2cffe1cc9de1104658f48519', '[\"*\"]', NULL, NULL, '2025-05-26 10:42:36', '2025-05-26 10:42:36'),
(154, 'App\\Models\\User', 1, 'api-token', '995d45632fcfa1d15d371e541b7db1846f76680c1a4ff8da8aafd509167d9fa8', '[\"*\"]', NULL, NULL, '2025-05-26 10:45:36', '2025-05-26 10:45:36'),
(155, 'App\\Models\\User', 1, 'api-token', '17f98b850afa6542652da7833a5bc561cf810b87e29e6c789cd0cdfb3e817f1f', '[\"*\"]', NULL, NULL, '2025-05-26 10:48:41', '2025-05-26 10:48:41'),
(156, 'App\\Models\\User', 1, 'api-token', 'c1d1c796d628e10554f0b7d061da57a9ea1cd616541538e8ac2b1d257279c8a3', '[\"*\"]', NULL, NULL, '2025-05-26 10:53:25', '2025-05-26 10:53:25'),
(157, 'App\\Models\\User', 1, 'api-token', 'b80fb2bb57922dd2b57ab148b9509a12f2ee47bf96923fa24863891480031697', '[\"*\"]', NULL, NULL, '2025-05-26 10:54:48', '2025-05-26 10:54:48'),
(158, 'App\\Models\\User', 1, 'api-token', '898caca6fe952af2a8661b2a6d918de306a5b796e91ee4490c39da43c6b89f69', '[\"*\"]', NULL, NULL, '2025-05-26 11:05:03', '2025-05-26 11:05:03'),
(159, 'App\\Models\\User', 1, 'api-token', 'cfd3d5a7c7b6e0afd4bb3392d3597ee2a98406ed0c1cbfc4d2ad22baf9eeb584', '[\"*\"]', NULL, NULL, '2025-05-26 11:14:17', '2025-05-26 11:14:17'),
(160, 'App\\Models\\User', 1, 'api-token', 'bc4c9744913f85ed05a15dbd69e06e65d4290dab9e34be14817bd5525858e74c', '[\"*\"]', NULL, NULL, '2025-05-26 11:19:22', '2025-05-26 11:19:22'),
(161, 'App\\Models\\User', 1, 'api-token', '5d3f449b6df6822437a347daac45ed0035b508161188f7b02fc8a219307b09e3', '[\"*\"]', NULL, NULL, '2025-05-26 11:28:50', '2025-05-26 11:28:50'),
(162, 'App\\Models\\User', 1, 'api-token', 'a583a5695e6621eeace4766eef35942a41cd095f2572873326341e64824e52be', '[\"*\"]', NULL, NULL, '2025-05-26 11:31:20', '2025-05-26 11:31:20'),
(163, 'App\\Models\\User', 1, 'api-token', 'ee82de5e1679f0dc9ee62ac5acdb8f3757eafaae6d65633c377e3a7c44207786', '[\"*\"]', '2025-06-01 08:15:08', NULL, '2025-06-01 06:36:08', '2025-06-01 08:15:08'),
(164, 'App\\Models\\User', 7, 'api-token', 'f702cac32d8e35a4ad5dc7343bc7bda20ebf9c20f0e430bb0a1cb8dc00b66bcc', '[\"*\"]', '2025-06-01 08:15:06', NULL, '2025-06-01 06:51:15', '2025-06-01 08:15:06'),
(165, 'App\\Models\\User', 1, 'api-token', '0c13432c16eefe23d108e357d58789a7f97a8884ad7ef14149a76cb9daebcddc', '[\"*\"]', '2025-06-01 08:22:04', NULL, '2025-06-01 08:21:59', '2025-06-01 08:22:04'),
(166, 'App\\Models\\User', 9, 'api-token', 'dd2906b64de9e36b4789b24d00d9a1bdb1403cd31563a7851096069e1aface46', '[\"*\"]', '2025-06-01 10:37:05', NULL, '2025-06-01 08:22:36', '2025-06-01 10:37:05'),
(167, 'App\\Models\\User', 10, 'api-token', '8e0fc556dcf0bc95c47065154d061279b69375a01d09b1cac97ec008ef0589f0', '[\"*\"]', '2025-06-01 10:37:03', NULL, '2025-06-01 08:23:12', '2025-06-01 10:37:03'),
(168, 'App\\Models\\User', 1, 'api-token', '6f2e13df1a0433e66ba6e82748e04a0eb651ba370059c4fb692ceca9e094e474', '[\"*\"]', '2025-06-01 12:49:34', NULL, '2025-06-01 12:47:05', '2025-06-01 12:49:34'),
(169, 'App\\Models\\User', 1, 'api-token', '79bcb1b75331bec6fe4600e358b6cf33f15e32a092c0fc8a8d6b1ddda5c273b4', '[\"*\"]', '2025-06-01 12:53:31', NULL, '2025-06-01 12:50:11', '2025-06-01 12:53:31'),
(170, 'App\\Models\\User', 1, 'api-token', '253147c22f3500b992a19e98678086d765c4c6bbcf2153b1b8b36057eeb92ac4', '[\"*\"]', '2025-06-01 13:04:18', NULL, '2025-06-01 12:55:46', '2025-06-01 13:04:18'),
(171, 'App\\Models\\User', 7, 'api-token', '72a5a2434bfd1cc0756215126acc0fa9b34301c67fe290dec685c1cdbe90fa41', '[\"*\"]', '2025-06-01 13:04:20', NULL, '2025-06-01 13:00:11', '2025-06-01 13:04:20'),
(172, 'App\\Models\\User', 12, 'api-token', '16e9857186c60f08945cdadf8cbcadf514e129d37f3b102e3943ca29cc3b5634', '[\"*\"]', '2025-06-01 13:29:58', NULL, '2025-06-01 13:05:38', '2025-06-01 13:29:58'),
(173, 'App\\Models\\User', 11, 'api-token', 'b53cc9780424664f940f33220a56d004d43cb006d7262f135dbeec436391c7fe', '[\"*\"]', '2025-06-01 13:28:56', NULL, '2025-06-01 13:05:49', '2025-06-01 13:28:56'),
(174, 'App\\Models\\User', 12, 'api-token', '6d9b24293791700c049c20a8eabd1da0353baf895e7212f0f0b68e75baf6c2c4', '[\"*\"]', '2025-06-01 13:34:06', NULL, '2025-06-01 13:30:31', '2025-06-01 13:34:06'),
(175, 'App\\Models\\User', 11, 'api-token', '7c156ebef3bd765cccb31c0769a1a4caf8c0dbcf2a277e5f1026586d356985fe', '[\"*\"]', '2025-06-02 03:29:46', NULL, '2025-06-01 13:32:04', '2025-06-02 03:29:46'),
(176, 'App\\Models\\User', 11, 'api-token', '955efc9931596f1017585a0e7a798e9fe4098abfb84b42539ef78c682864bbc0', '[\"*\"]', '2025-06-01 13:34:31', NULL, '2025-06-01 13:34:27', '2025-06-01 13:34:31'),
(177, 'App\\Models\\User', 12, 'api-token', '1aeff86128cfcb07351ec579682caaf9d54c14910ca0e65c5436878b0f623c30', '[\"*\"]', '2025-06-01 13:48:48', NULL, '2025-06-01 13:35:14', '2025-06-01 13:48:48'),
(178, 'App\\Models\\User', 11, 'api-token', '5358f12baf0916064c6a154a86a4fa17f1ec63c0ac6f2ebde71e4d66439a7eb8', '[\"*\"]', '2025-06-02 00:35:58', NULL, '2025-06-02 00:06:26', '2025-06-02 00:35:58'),
(179, 'App\\Models\\User', 12, 'api-token', '8a4264caf8a226949eb7e9f5823fba8532623f5003eac5752a694fecce205be0', '[\"*\"]', '2025-06-02 01:16:58', NULL, '2025-06-02 00:06:46', '2025-06-02 01:16:58'),
(180, 'App\\Models\\User', 11, 'api-token', '0c70dd3958ea042442e5c51c21428c6f9c985ac00e052cbcfe7338def9f6d457', '[\"*\"]', NULL, NULL, '2025-06-02 00:36:14', '2025-06-02 00:36:14'),
(181, 'App\\Models\\User', 11, 'api-token', '23945f22383e4314a4b7f74a2f23c491cfa0e506b3988535cb7b57cb4e629883', '[\"*\"]', '2025-06-02 01:20:39', NULL, '2025-06-02 00:36:44', '2025-06-02 01:20:39'),
(182, 'App\\Models\\User', 13, 'api-token', 'a59c5f3ea576459251dfed89c10b2c5363b5e0406f3512d6f43fe4596a5c1725', '[\"*\"]', '2025-06-02 02:13:18', NULL, '2025-06-02 01:22:11', '2025-06-02 02:13:18'),
(183, 'App\\Models\\User', 12, 'api-token', '9561056c45b74d11fef0549c7c189a61af6c6a08afe26aa1a4d3b2ce3ae28835', '[\"*\"]', '2025-06-02 05:30:52', NULL, '2025-06-02 01:24:01', '2025-06-02 05:30:52'),
(184, 'App\\Models\\User', 11, 'api-token', 'b020d111db27709ac2edde6f60340bd50b30a227e66b23b9013106ff073fef72', '[\"*\"]', '2025-06-02 04:07:58', NULL, '2025-06-02 04:01:24', '2025-06-02 04:07:58'),
(185, 'App\\Models\\User', 11, 'api-token', '6655690ecd9bda4154ad492ddd3458047b33295d7680d4f06307b156dea460a7', '[\"*\"]', NULL, NULL, '2025-06-02 04:08:18', '2025-06-02 04:08:18'),
(186, 'App\\Models\\User', 11, 'api-token', 'f82e619787f62d1d1030f719d6b02934a7f10e93643f3ccedf390d01a09c1d9d', '[\"*\"]', NULL, NULL, '2025-06-02 04:08:22', '2025-06-02 04:08:22'),
(187, 'App\\Models\\User', 11, 'api-token', 'b0d22fab76b513c8f258618ecf7fda2fbe526943ee6ccb0713ac03a1b1194e31', '[\"*\"]', '2025-06-02 04:12:37', NULL, '2025-06-02 04:09:43', '2025-06-02 04:12:37'),
(188, 'App\\Models\\User', 11, 'api-token', 'daac43a02e8438bdff7a0a4fb8395e745aa53bede60f9280041c25d6051df049', '[\"*\"]', NULL, NULL, '2025-06-02 04:12:50', '2025-06-02 04:12:50'),
(189, 'App\\Models\\User', 11, 'api-token', '0f8fdb8f05c38241a8b0a43af4774e81469de057ee98dd24758ddf02504c2961', '[\"*\"]', NULL, NULL, '2025-06-02 04:12:56', '2025-06-02 04:12:56'),
(190, 'App\\Models\\User', 11, 'api-token', '88ce10dc5bbf5b6d8833efb5b8584282a0788e9a2b0d6efe3cec20b141a6450c', '[\"*\"]', NULL, NULL, '2025-06-02 04:13:10', '2025-06-02 04:13:10'),
(191, 'App\\Models\\User', 11, 'api-token', '82ab29e761966d5a94fe9c7b43ea3fc8c54d6479378f1f0d8b250b28a3249817', '[\"*\"]', NULL, NULL, '2025-06-02 04:13:23', '2025-06-02 04:13:23'),
(192, 'App\\Models\\User', 11, 'api-token', '337691bf253a454e3a181d12c9f3bdb54081a28ba404c19e3a5d747a0595f4a2', '[\"*\"]', '2025-06-02 04:25:00', NULL, '2025-06-02 04:13:49', '2025-06-02 04:25:00'),
(193, 'App\\Models\\User', 11, 'api-token', '02b6613403064a8ba881900ff09e4f7c3650ca32f0bb52219978b8d2a585940b', '[\"*\"]', NULL, NULL, '2025-06-02 04:25:09', '2025-06-02 04:25:09'),
(194, 'App\\Models\\User', 11, 'api-token', 'b2953fce6323fdb59d437b99e05ce308dce8ce227565e920c0f5081fa7e08b51', '[\"*\"]', NULL, NULL, '2025-06-02 04:27:37', '2025-06-02 04:27:37'),
(195, 'App\\Models\\User', 11, 'api-token', '51af21e254ff08148e8e94a51c4d671fa1a704d6013a8db0deaa2ee88ae2de04', '[\"*\"]', '2025-06-02 04:36:02', NULL, '2025-06-02 04:30:11', '2025-06-02 04:36:02'),
(196, 'App\\Models\\User', 11, 'api-token', 'e0a444ba980334d5256f4ea66b59225ec53a5186b3bac67594e351d3121cdcaf', '[\"*\"]', '2025-06-02 05:15:49', NULL, '2025-06-02 04:45:21', '2025-06-02 05:15:49'),
(197, 'App\\Models\\User', 11, 'api-token', '4b167927aeb9b6ca4950e3cd8ef59f899b3225b62589dd7eb0b257cb4f3791f3', '[\"*\"]', '2025-06-02 05:28:38', NULL, '2025-06-02 05:19:19', '2025-06-02 05:28:38');

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

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0hrqzFmjyAe7wTa6YmxDa3sv1b2MBGw3lZ0XGRV6', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaVZPTjA1SmNoTU15YlpzODVLWUtGcklXS1RJc3QyZ05CTHFjWVpvaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748857357),
('3g4x7CpWnTLyfIVphGfNw4j9pABRBhjj91N5etJs', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoib01tUEZhSEw0NXl0TUwzcHZ4VHJuQ3dOaWl6YjM4WmM3ZW8xM0tsaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748848841),
('3ROBXuXEKizSEyZxMyCIicxrcHZGga8FuHVpG6mX', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYmw4UDVhdk1SNzZvMVA1aWtoOHYxMDlGcnAyRnE2b2s5TEdnenI2bCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748858414),
('4q6jxO4B0VrjPiHM5h90drTj1OjjruCcsSo6kFg8', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieHc0VklZYW9SeFlyblRQblBySkp4MmpSdkJwc0hINkhGaWk5RUNLaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748858094),
('6eE6WJbTlwBRUReQBR8lveg1JFcebnYT4rXjCG1H', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVW9MOUFpRUtwSjRrQjNBeTUyUDBjeVg1MUJMdHJ0ZEhtYUhSYjNOdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748850189),
('6kGpvw7or6fNy37sgRBGxXYhGRyt2BI8zzAJrxBJ', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOGE0TnhIQjZGc2hQZkdJY3hRVDYwSE1ObGR1T2RDQ1VNQzNaM0htOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748859483),
('6rR89iULeA4Unk6MY7xWnhCVaWfkNFnPDEKcD8RJ', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWWtUd2pIekdqOFZHV1djNFdDU1JxdHB4dFhUTVNyREtVeFI1Tld6YiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748857185),
('7Gjpv3r358QiyDCnsnR0IRhq4CyyeFXPNYCjx7Rx', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidXJsQmRMejRRaGdiOUNKckluNkE4dzNmWjlxY3lQakt2YzdmdjJhbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748859400),
('8ijv3eyI6zFdku8CDdSueEA8gdXsKBuQNnKtIapZ', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieGZXUnUwOFdZY2NXTDFVRTllSTBDWkVoZlFkQnd6dUlqR2s3VzNDSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748849203),
('8ZJE5oU6L2JqjieTOYL8TnCL2b3DgMkogofx6q6t', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ1F6eXdzVTYzQVh2cG1nVWd2V0llWFZNOHgzWW56UTJyNHhNeks2NyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748847620),
('9LaPjWGUZJaRbSMHkBadE8m91gfOBZftI7lrqDZN', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidmRqUmt1MVpDRlRSaU1CQXBDc0ZCWjdhN3VPaGdmblZuMlpSZUhsRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748847605),
('A3DQ414HZQNWqtW1gEi5Ym4eCOYBKyKAUcfORSaf', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSzFybWo5T29EUUNYWlBQS2UyZ2FPMGxFdU92UU56RVFuRU1YWlZGcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748849487),
('afEmSkxlGfXWXIGW3etnhGM5a944RbChZG9fpmzG', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSzZuUmdiZVp4c0pxbGRvUWJENUg4WDg5NmhvNHJNZ25qSFdjQ1cxYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748849449),
('AhBn43IDvRGUoMqO0FPzukxTTKunsLZeKTH3H0jR', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidkdVZUtMeDBGdG85YVo5VzBKVE5ka1R5T2wzQ05nS09qN05qZjgyOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748849455),
('AtyD8zdIR6m1t3bL4KreLgWTHyfoxndzPjKesV5f', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWEJjRXFqempLQUtraVVLMWhzdWtDUzNwRjh0SWNxU0s4VndadmxyeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748850198),
('aV4MEZGWUQb83qEJDX64OhTFtKF6EgYI2LLcmHeN', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSm5pc2NuZzR0WXFWQWpHWXA0RnVuVzQ2VmVITnduR2ozMWpUSktPciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748861528),
('b0vw8yAQL0AG0WQuEV1V087uSEzHuV6fcZSfGEvr', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMzF1a2ZURWo3YWdDS2tpaEZrWk5MYkZON1ZxOXM3ZURWalFlODJvUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748849615),
('B5yaoK69VM798OiQaZYmp64B7Th3Wokdvf7EvVQs', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoic3FKd3IwNGxYTXRXVElFdTlLbDd4dXI0R3REd3ZoOG5aWkdyR040bSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748854858),
('BRs3cLizIi64wokqQd1pxtiTN3fnfOsJm1LBqw4H', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidkR3b05ZOVlhSVl5dTQzcjhUYnpBOWQ0cWhZdVIyQWN3R0dhNHBUZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748857074),
('cAKUQjPfSzRf49nYvMQizD8dF0KolmCqHNmykvst', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWlptdTgxUVBIeW1CUU82YzB6UWZUaWd0bEVNcGR0cmNsbWN2aFZHdyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748848853),
('CNvdAbUbGYIrapvPeqHbGP7CMhKmHEfmtPEXvZW2', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOUljWERmdWtGWThYTDY0dEJVdFF2QVlPbVJUYmxVM0xpTEhzYmRyUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748861441),
('CXAY1NyAy7PyaaiV7VoCpEgCI0BY7LtRhtomyIPd', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSXdpVGpVM3UyUnY1NENldERXNndMR1hQdUQyQkI0OWo0VlB3V1B5ViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748861150),
('DsBakb66RmFXlsKmUm8iqyvhBDCLu5xm2qeANKu7', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY0toWkxJU3prQTB4b0ZFRzV5bWVJeTZ5T0laaFZ5WG9ETG9xdGRBRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748858100),
('DVPmcI2rnBde3yV9eDMyPmRWLjD467Y7mCVYYZZR', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNnlacDFuTGVRWG5EQ3dBQXVxSGU4NjMwNUY4M3RHU2Fya0toaDNSMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748849243),
('DZ6E7H4AdxgsJtJNHVUw9AKfdRP2CKidpYBjrPW6', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ01BNTY1T29ZTlViREcyMk1PNmZBeGZobmFTWG5jUDdiUml0YWt2byI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748851641),
('e0Qvix4i3MtWf3C7RT7K21sH3FH6KTT9znAubdq3', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVlRlNHdGTGpkZ3kyZTB2V2J1cjZHbTY0MHozR2l6TktMbmhOWERtSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748859398),
('eqjZGFt5tjBcWj062zCqoWmkOHdrB24HQdA6FtUB', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibzhOamFXbXcySzVoVGRkQnNRZDNRc1p5bENnT2RwamtNSlA0MVhPSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748847604),
('FDgIcOgO5cOY8S07BbockTJGGLcjQUEHLhmUV9QJ', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoic2FnaDF4NE9Cck9QY0xiZmtNMjNyMEhpVllMYkZiTVdBWGhIT3RBNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748859396),
('FDYizJaQ7wUoCHz3whttdA0PoHUpHWTDY249SDr4', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOTV2OVFkZUxLODE5MzVZRzFFaFBjZ1RoUTAzTDVqTGI1Qm5EY3RvdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748856686),
('FGdoQzkJY3sD87xLPLilLwF5Bnk0I6KiJBujYlea', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZGhWTVFGVElzcVJjZmtsdXNpMWhRbFk4WnBuSW5lQkxZVWgxN3IxaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748848692),
('FlnvEiTk94C5RKJQjTXiO8OHluvpxzAEkd0NF2RW', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicXNkbUppc1B0S1A4amZmdks5MVozZ3JyYndnRXhaUmQ4VU9XZUZpZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748854844),
('FYMps5DDQ0E0ltei14Tntb8OZYFzOxmpDaxrFn16', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoic1FuakNReFl2UkpzNGtaUnNHVlp5Y0lSYU9zUkxSTlVuQ1ZzczhqTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748848441),
('GBv7h16KzduOzQfxd5xJ1VDJRnwq9emMp0BZzDE7', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYUh1aGkxQXNvSWw5ek5QQ2VYOGZ0VVNkU3M4RmN0V1BwVGVvT1FWZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748847827),
('gF1FSNW8XcVStoS6S0V6C1zkP970R9z37KD3Rsao', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiS0RRQVFRN1pZUnFERnFydERNcXpMNnVqSUhSbHdLZnluZkhUSTd2RSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748861452),
('gheHIcHkhFc40SQhBWwFTQ4vFDso0QF0ctdeF12j', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUFN5bUtUSWhXWVdXTUQwTHI4cFZFNFBKQ0tJWWtUNG1tMHdaRUJxQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748847998),
('GjMjugU984qQuwdiD49mWY7nfRFtKdCDDqNCDBLz', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNlVPa3V4NktRdU1raXVIWDd4ZndmdVlzWW5nNUtpN0VvblJUcE9maCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748859428),
('gnXmpeMu6AXldQqIfjfY5nH2VvimBQN2Fu1xEPGR', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZWR6S2N6dm9lWVNNUjdZMEFtUFJsS0FadXo2MG9YcFA2TnJZaThGcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748861477),
('H7EaV6m8tBeu2vs4nt8gksnhEFp6e60maIfWCcTJ', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoia0lCbWpDNVJ5STlyZmtTQ3hUZkUzdTZaN2k0UzJjSzJWbzc0VjFITyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748850029),
('HBF8vcsZ1Jg1bn1qg8gnmKWfmt8icnHoiRvdNf3M', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRUxuWmFOd0RyZ0NJM2lNSDJrTmRibjQwdmlXUXljODdnZUUyeUowUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748848721),
('HeC78sVDCETFJ280AADWEIdezNSfXlUh44ikxJLQ', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiT05nT2ZnMDkxS0RhbVpOMWlVTUdjUVB5b1R5c1hjd0JUOXZKclVxTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748850022),
('hhEeDXyP74gUih1wxsJ4zvUNY3VxQCQreMQ7map6', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibnNZMXRQVkc0MGNNNWNScHgxZ2o1ZWVidmRiWWtRSHRhN1JiUjM3UiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748861456),
('HTlT0D58IG8YcBUU44w0yVJRjypSwMTX6yPxresw', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieUJTYlFwVjN1NDc1bHZDY3BEUGM4V3FyZ2dEMUtBUkxPcVIxb3NIYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748849224),
('ICbpAGdsVzkvEfFkstI1A1nn6DKvfRxrtKchns3r', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMGl0TVlXamlVVkNia2FhVk56UHpjdTlSU1hrNmJhWlVPREdOQmg1ViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748861485),
('ImfAQ96izgJKTa5SqVKMmSkRfB682SaWyBpuG1Yj', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidkVtVkNodWVIMkVTaGVhSGZwNmtxWmRDQmN5Uk5NcVdWRjBIQnhEZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748854786),
('iZkiF0VXwKPTXUrHThcTGeeGqvocXTimDxNq3Cn1', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidWFFR2tlZHpmVXhsU3pEVHpaOU04OEtUNmRLUkNxMFJtMFJuYWNIRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748850055),
('iZmoGxdr2k3zpXGsB9rHAl84aalkN20fQReA0Qkr', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUlRaeHFyejk1RkNERjJaTUx3NE45VkRYcWphT0FaSUt5eUN4eUpjTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748848141),
('j4Trrb8Ru1n4swXZVa46nWsLKjc9gLReLPOeiQHz', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieGlkVjUxNnppd0NMMUxYTlhXMkExYVFqRGk2TkNJaVZTbUhBNFBvZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748858430),
('jjNB233t6YzNI1OartNvkou8hkDgbdTxBzvDtRg7', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSTA4MXpuUkoyMnlFZldsa2lQaEZISXRLZFFpV1NJcWtDRzdpajJMcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748858760),
('Jrtl4hVB6kY1XlDRlsKanUFy56NqdTvFDwWT14bL', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicXpzRHF5UEhzNU5wV3lxMlcwWUlCUnpycnNOVkRmaEI4YWJiS2EyWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748849981),
('JSiMoopzBPFlc4PaABUiaGFyxuFuLO304Q7CWDy0', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZzZoN0JYV0t2dEhZQ1lPd3BRNTRtSXFTY211OVZERDVzMXo0bFl3eCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748849973),
('jtR7ryXYSxpusSxp0a7KmjIG5hDk3KPtIXX5OmL5', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiakhWQmx3aVBWb21TcWVwQ1hXSHhrSWRHTTdsYUlUZ2tPdENrREVDUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748862052),
('kAymQECv4b72GAeEcMXsSkHGbXSENCDlAERHh1rn', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVVBsR0hvS2hNOXRBN1FyUTN4V3ZqWVkxMUZpbklUODdGVUlxa21rbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748848988),
('lbKF0T2uIlxOlGpqTjSDTNV3tZL4qPc54vrBwLu4', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibFZoQmdkTTFGSDdWTUI5M2FOWVFHSUJEU0ZZRmtUckZZRlVaclpCZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748847678),
('LvM5cJJp0usJnDsLfZpoSKM3UI2STUThBHayxWlf', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoid1BteDNoY3JGV0tIdVpadEJVbkUzSjRDaTdDY3hKYVJMNFliMWlQMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748851640),
('LYwMY9LQgLZATBq7uBe2LEVCP7ITx7rDlFs9mj1V', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNDg2NlhXeUtQWm9LekZxTUNlWGtYb0I0N1dJcm91WFNrbVRHclBkMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748859397),
('m3DjuLze2acC0XaniqyBsq9EMUfgErTqjzdxqRQD', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaWxjNTJ1WjVqZlJTbWxJTFl6cjdxVVlEakN3NXpwNVNNWUdtd09ieSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748859323),
('MBdMTNrfgOC8SbRiGLkBdG7ZobZvnSQ2mCr4eS4D', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZGVZa0ZLWkc2cWpaNlNXYVhYSk5sWHl0aGFzYWxOcnZ2SGJrOE5YWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748847601),
('MkKggSsS3cuLHVKbZSk6SnwYzoicM8upQQBeZiWh', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidmFZSURvT3NZUUtxNWxzU25kVjY3c3c1WmkzaHYzck9Eb09Ec25JciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748861474),
('MNXjTKpI0tGCzzopptJlHQ2iqPSj05nG6pJJ3mUG', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibXdTMFo2Vk1ENmxFdjI4cWtTNDJwbjNFQ3k1czJEdFJ4Q1NtYnJpcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748858762),
('n11DrVGQGJvOQnKBJVvo3AfzrSflRKRAacWxWYxW', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRlJrbmhMQ1M0QVlvYkY2UjczaWl5T3ozcURSUktGbzdxdkRTTTBmViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748856785),
('nc1b8HBOVyRSkANOKmyaCJUkwQbi8FMoQFaRcf79', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidkxZMTJBUm5NeHdRRWFoS1F1RWdsb3c4WmhObUd1VmJSRnhzRXlMbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748857431),
('nEwJLgb3ASNDnH2wxC2s706z3TuyejsgQrVgKGHM', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicVBhcTJkd3BvMFFDcUZoRUpMdHplR01nVU9JQlRna09yY05WTXluOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748859395),
('nZRQaQiSydYdWS482GgOUHBJ5dC8Iwl78UIkmNyR', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMThUSUdFNUNiY3d4SmZwcFBZNFl0SFdUYUpQeVo4UVJYYmZ5UUlOTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748861480),
('O03OfseByl83cEFg14XJF9fdAqRJKdHNEir9LaLv', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMW91RlJGbUpCRUJ1TmRjNm90blpFNVdhWGFJVlNjaGN1VzNacEIzMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748850161),
('oIM4dCrQAGtBs9JbIUuphqrn1Yu56IVJ9R2DUose', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVnlsSjVLWE52MzFISGdHRndJZjdVMVlIVGhlTzFGY1MzQ0hDQm5jdyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748859326),
('OivWgoATuqAKRE8o0rzPp9GngXKbApTkxoVU8YH7', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVVFnWEs3Q21hV09ZaUIzQWxLdGdVWjJGemJqc0lDSkZwcWhKYlBnaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748848686),
('oXmtBRueI0AxavJSu7If6stjxR95ChWP9E3llDZF', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOFpKcGs0dE5sakVrMXB2S29FZUpRSTZ1R0FNZ3JTWVdxd1JaY0NSbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748857078),
('oXPgyjCxcX5btb7JkObwzSwnaqFfZ44qfaoEzCYU', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSlMzWFFNS0Z0MWR1WlVIQXFwbmNrbXU0V1BoTjR1bllvajdwR0NHYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748847728),
('PwMwZA2s10go29K2vo76Lry1ZJv2BIJj2e8nk4C4', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoickQ4VzFLbk83aVYwNEhVcnJXMHQyMm95VU5SQk9VWGxWSHRQQWNweCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748859697),
('Q284OMNOjZ3X3PpBFkOONNEPctYjVuXqHoOL2ZWy', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZVN5bmdTRW5QQ3F6ZlZhNkZNNmFsdGJpTGdMaGFoZGt6TFhoRHIxeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748861534),
('QfF00gZ92CtwL1SzhSBjhll9rIDXgWvvUYtDEgne', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUmhCemRNUnZmdkJ5ZHBTRjFac1ZGcDc1Zjl4VlFZMlBNVHVPZlNNbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748848979),
('QFRGliR7qtj5b1h3ejnD6XVqOxVPKZJYX7IhVI9e', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiU2w5OG83UjZ3YU1tdnpnMzR2VlNhZUNuSnYzM0VhVXBVUTBma1I4OCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748849033),
('QiyBIx91RymmOePrES9k0JfA8ELd4WUruePZec2p', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicmNlZTZoUVFibHdPZ3Fza2xIa3NPVTNRdTR2RFBQMDBaeE55VkU2cSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748848449),
('qlKdQgCrWM9N9dNZ3SYbQmqA8EClCScgSS20fK0S', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUVFZMzMyN3hMZUxNcTZ3YXFNRTN0ZGdhSndrQWR4RVhRb21ITEhibiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748849822),
('QujHVcymks0Wqk4geHrm9UKFRNSjCW4IUrmAIzSX', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY1hMckNXT1REZmRFQzFnTzAzRFlQQmpPOXBXS216dUhGejdDOHNGZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748849078),
('RMqWI13Um0I8Ae3c16JM6EIOzATPnQOsY0VCJ8J6', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoib3JGblB5VkM2dkR6dVdxVFA1WEJIb2dJTTVjQ3lXb3N1WVhBMnczUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748858735),
('rnyDPDqXDFaAH1tPeeNXnMXUgGvnfJpW0noc5Nb4', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaFpQTTIwaFhZSmlvRUY0WUhkbXlkV1FTSW8zeWVIQlBrRXN6dm5vbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748858434),
('rqLcSH4HpxWk8QJoiXn4R3mMc95RX663YEq7yfQX', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidkJZVDJpRUxqRnNZT0R3SkNRS2ltbzdyR1RQNEFkZnBQZmJXNG9ZTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748848127),
('SeMl6R0voam45HBDR5ebSfB5zGJLCoXrxNf6ak5u', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidHVXVFh1VU1pUzBmYTRWcFVSQ2ZkcjhKSjc1ZTk3T1ZrWHZRZEhNNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748858732),
('sIp7GKOPRHDPv1KExyUMNPQ3DJKzKibGBeiqnQD1', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVXpmUVI4OWRtVFI5R0tBSGkxNjR5bUxzSEw0a1JQNnNFenBBZjV3eiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748861481),
('SuBX46nXHkKf4QQXa94aCvmKsvLkasC7tiqKc1Da', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUmtKeTJFRVEyd3paNlVoa1gxZmZLTjVGdHgzN1BvQllUNm1vTHh4VSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748849074),
('TBwdEdDqRBZOOabIanf3AsuQm4dcxfuDQyV60PLK', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNXZJSmpMc0lHMklvb2VOR0s4c0h5Qlh4TldqOWVoVU40MmlNaW9RNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748861362),
('tje6qAWdXAQBjbvvlwpaaZ4Nz1mNqILyyBtwxqhW', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiT0dHQlF5ajZORzZoeWdFYWdmZkgzMzN6Nk9HQ1R1RWFJVVFiR0tuMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748847617),
('uDXzba623fPbSguJps2g3JaDPlPKw4v8jDaKhVK0', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibkxoaU5pT3JmZ1FaRm5uN0pQUld3MTdOZFZnRmlibXNoMzhzdFJMcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748859474),
('Ul8cIAefEi6qOMqt2yadnufyr3W5Mx5UjKaWLjky', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibHV3QmZRbWZ0WXJKcmF0UW41NXpueGhiS2tlODI5N0pkMTJ0U0VWaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748847995),
('uyhMHNNfZKNqF9zltm6dhlguJ0Fa4BddDKZ8crQh', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTXRzYng0VnhKSjJCd3NBREI4OHd3cmFUMmFJZzczVlRYdldUQVVIeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748850114),
('Uz4dUNuSfw30b5gS3tZXzU1ESLPJfy96tAWnYFqD', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSjNFOXpLcUg3eUxPSVBRM0FOMDBreGZ5bDJ3SFFrMENZNEFhbUhaRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748861380),
('vutYd4XrC0oAFvp2bA3crf2u8Hy3YX9crgxi1bBH', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidXBBMDJ5dzExRnNVMUhxdm5WSUZBZ3VhVWR6RjdIR1ltVFo1U0wxNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748850157),
('VZEqtpcvXuqCT9gNqJRgZWx0g8VOMuF6X7CW5tgM', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoic0ZpaUNOTTZBT1hnS1lvc1ppcmJUck5TTkhLcXNYbmF0TFRmZnlDdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748859697),
('w3Em2djNCnhDjXcWkJJiQublZ8KdL97DGtlsV0KW', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidDZlQUZodVBtd0k5Q0d3SjBTUzFtN0dkZjFHQ0ROOElDbm5hQWFZOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748847828),
('x8xJS59163MlRgsKoQwwgLpyxxCqA4EGYqZnHSfb', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiN1pZTWJSdTVXRmlOQjlyVVhERHc2bkE4azRxQzg3UFRuUmcwZ2M0dCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748850139),
('Xa6dG3BEbYdpVXaTIvxZXsFDRif2G0Kife5H4tSz', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVExwMkJNNHNlTWNiYmJyTUd5NHRyaDQzdDFFQmczb0hybUpxVU1TNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748861918),
('y9nmOaxGhuO665HAyof72OmPYZtiYQbMfZvUvLT0', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiR1JIT3d4N2VyWDJwbTRadFBhTWduVTJUeHBnRHd5S0VjQ0t5NXExaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748848192),
('yEObAeu2nfSd9HB6vzSYZxj18rIOnLOwmZ8zkiWL', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiT0tQRkVlcmtzZW5qVkNCd2dIT1JFNzM4OGZ5Um9iejJsc2VLczhJMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748854738),
('ygEXzteYBx8We0wIKaUtrFH3b7y2aLQDBScHiK31', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicWtLcklRVkNSM3ZNOGllRzhKaWN1SldsV2ZTVGJWbk0zaHBwTlZtcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748847677),
('YjeUqjLpy0KiP3WLO7BCxY8z1G1CMTS4XtlQhLw9', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ0trc1Ywc2FhOFVZWkN6U0hlSjVuUHc0dno0VVZCdmg3Rmg2eDhINyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748861482),
('ypJk1LyKhLnrWKJXgZob5Jtgm9QXmZtsmIYZnZbI', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiczNnd3JuOHRwRFFTRzdEYjlXSXNDSjNYWUc0bTZsSjFhZ2M0dWdReiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748848972),
('YPvHu8KoIjityI3GM8IxJL53mE1U8o4VDGaXK8Dw', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUGhsN0ZpTmdEUnN3YTZlQ1lwZndsNzR1Sm9lY2lDUVk2Q0w4bVFTVCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748849621),
('ZaG4XgtgIxjdVahJFig7fd94aC8mbOcvowDN2RcY', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiejk2Qnl4MkdxYzhRV084aldJQlN0WWNRVWNwTDY5UkN0MzlGb2RWSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748851529),
('ZE4LIWwiBBjvPETVl4UHQZDm2Gy4cyZNJRA7sSsS', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMWlVWlkzQnM1OVc5ZkxKcERLNnd4ajRYMEd6RTI1dHRXTXVoZGpvYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748854783),
('ZtTtK6ILqzwlQullZXsAPuSNhKFbRLjI83xFt4e9', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYkhDRk0zMnhkTWdoRkdCQk8xQU9yYmRxbnFYVFFQNVdHWjB1RFZaWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319fQ==', 1748861907);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_online` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_online`) VALUES
(11, 'Test User One', 'test1@gmail.com', NULL, '$2y$12$L12TLwrJfJZug3bTFHqhoeFxDXo9ng8KQp6PzfsJC3xxK8VYsjs6G', NULL, '2025-06-01 13:04:58', '2025-06-01 13:04:58', 0),
(12, 'Test User 2', 'test2@gmail.com', NULL, '$2y$12$LNjwCVTH15De4G.BehxrqujWp74Cz6qg8c1ujlMR8zPe1j2.9M8/a', NULL, '2025-06-01 13:05:26', '2025-06-01 13:05:26', 0),
(13, 'paras', 'parashirani99@gmail.com', NULL, '$2y$12$baQunD72DQF97h7E9NEdIO.aX7mFowNMSnzU29yWVVqnSmSNiD74.', NULL, '2025-06-02 01:21:53', '2025-06-02 01:21:53', 0);

--
-- Indexes for dumped tables
--

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
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
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
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

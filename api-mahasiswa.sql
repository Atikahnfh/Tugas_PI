-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2023 at 04:24 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api-mahasiswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `academics`
--

CREATE TABLE `academics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `faculty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `major` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('S1','S2','S3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `gpa` double(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `academics`
--

INSERT INTO `academics` (`id`, `student_id`, `faculty`, `major`, `level`, `gpa`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ilmu Komputer dan Teknologi Informasi', 'Teknologi Informasi', 'S1', 3.90, '2023-05-20 03:53:14', '2023-05-20 03:53:14'),
(2, 2, 'Ilmu Komputer dan Teknologi Informasi', 'Teknologi Informasi', 'S1', 3.80, '2023-05-20 11:19:40', '2023-05-20 11:19:42'),
(3, 3, 'Ilmu Komputer dan Teknologi Informasi', 'Teknologi Informasi', 'S1', 3.50, '2023-05-24 17:59:15', '2023-05-24 17:59:15'),
(4, 4, 'Ilmu Komputer dan Teknologi Informasi', 'Teknologi Informasi', 'S1', 3.70, '2023-05-24 17:59:15', '2023-05-24 17:59:15'),
(5, 5, 'Ilmu Komputer dan Teknologi Informasi', 'Teknologi Informasi', 'S1', 3.76, '2023-05-24 18:01:22', '2023-05-24 18:01:22'),
(6, 6, 'Ilmu Komputer dan Teknologi Informasi', 'Teknologi Informasi', 'S1', 3.40, '2023-05-24 18:02:00', '2023-05-24 18:02:00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_19_152256_create_tasks_table', 1),
(6, '2023_05_20_024039_create_students_table', 1),
(7, '2023_05_20_093115_create_academics_table', 1),
(8, '2023_05_20_104147_create_statuses_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(13, 'App\\Models\\User', 29, 'API Token of User 1', '61890734cddf4cc8fc897fd1dd246b8dfb468f3c4ac5319aac2ccde7087f9b7a', '[\"*\"]', '2023-05-28 09:04:52', NULL, '2023-05-28 08:50:57', '2023-05-28 09:04:52'),
(14, 'App\\Models\\User', 31, 'API Token of Mhd Afifan Aly Rahman Saragih', 'f21c403c51c996dcc15c85160d4688d187d226ed043a21f34c4e3a9d75d1f852', '[\"*\"]', NULL, NULL, '2023-05-29 08:23:07', '2023-05-29 08:23:07'),
(15, 'App\\Models\\User', 32, 'API Token of Mhd Afifan Aly Rahman Saragih', '365f681234a9ba2071cc794c78e6cdbe2fad4de05585f0a013b0766ae6bdfc34', '[\"*\"]', '2023-05-31 05:19:29', NULL, '2023-05-29 18:28:18', '2023-05-31 05:19:29'),
(16, 'App\\Models\\User', 33, 'API Token of Mhd Afifan Aly Rahman Saragih', '843a951a44afac1ebd06361acd66acb7f211fad40191f1a96e7063e7adaa5ab2', '[\"*\"]', '2023-05-31 06:51:35', NULL, '2023-05-31 05:34:05', '2023-05-31 06:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `batch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registered_semester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Aktif','Lulus','Mengundurkan Diri','Drop Out') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `student_id`, `batch`, `registered_semester`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2020', '6', 'Aktif', '2023-05-20 11:10:02', '2023-05-20 11:10:05'),
(2, 2, '2020', '6', 'Aktif', '2023-05-20 11:19:52', '2023-05-20 11:19:52'),
(3, 3, '2020', '6', 'Aktif', '2023-05-24 15:22:54', '2023-05-24 15:22:54'),
(4, 4, '2020', '6', 'Aktif', '2023-05-24 15:22:54', '2023-05-24 15:22:54'),
(5, 5, '2020', '6', 'Aktif', '2023-05-24 15:24:31', '2023-05-24 15:24:31'),
(6, 6, '2020', '3', 'Mengundurkan Diri', '2023-05-24 15:26:36', '2023-05-24 15:26:36');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `nim`, `sex`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'Mhd Afifan Aly Rahman Saragih', '201402099', 'L', 'http://201402099', '2023-05-20 11:13:42', '2023-05-20 11:13:44'),
(2, 'Ridha Arrahmi', '201402015', 'P', 'https://201402015', '2023-05-20 11:16:09', '2023-05-20 11:16:09'),
(3, 'M.D. Arbani Asfi Dalimunthe', '201402108', 'L', 'https://201402108', '2023-05-24 15:19:25', '2023-05-24 15:19:25'),
(4, 'Geby Febry Anhar', '201402042', 'L', 'https://201402042', '2023-05-24 15:19:25', '2023-05-24 15:19:25'),
(5, 'Atikah Nafisah', '201402096', 'P', 'https://201402096', '2023-05-24 15:21:33', '2023-05-24 15:21:33'),
(6, 'Randy Hisyam Abya', '201402063', 'L', 'https://201402063', '2023-05-24 15:25:01', '2023-05-24 15:25:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(29, 'User 1', 'user1@gmail.com', NULL, '$2y$10$/gOfDRovwXGnDFbGRGvvduUwt8.6qXHPihDO0ublMuNEbfg.tmpfC', NULL, '2023-05-28 08:50:57', '2023-05-28 08:50:57'),
(30, 'Lizo Lemaro', 'lizolemaro@gmail.com', NULL, '$2y$10$T.G3bwZkM7QvVjIBxyNu0./1W1kNCJtt2owCCY32cQRrNWJW06khC', NULL, '2023-05-29 08:12:30', '2023-05-29 08:12:30'),
(33, 'Mhd Afifan Aly Rahman Saragih', 'sm.afifanaly@gmail.com', NULL, '$2y$10$q7FU8lzrObhnHq6paOotxOqG9ZmF6T9uwOhfDb5ZFsij.d6/oWOuC', NULL, '2023-05-31 05:34:05', '2023-05-31 05:34:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academics`
--
ALTER TABLE `academics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `academics_student_id_foreign` (`student_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `statuses_student_id_foreign` (`student_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
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
-- AUTO_INCREMENT for table `academics`
--
ALTER TABLE `academics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academics`
--
ALTER TABLE `academics`
  ADD CONSTRAINT `academics_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `statuses`
--
ALTER TABLE `statuses`
  ADD CONSTRAINT `statuses_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

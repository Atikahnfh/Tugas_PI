-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2023 at 08:10 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beasiswaapiredo`
--

-- --------------------------------------------------------

--
-- Table structure for table `akuns`
--

CREATE TABLE `akuns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `akuns`
--

INSERT INTO `akuns` (`id`, `username`, `email`, `password`, `level`) VALUES
(1, 'shollibone0', 'bklainman0@shop-pro.jp', 'VWEweb', 2),
(2, 'btytler1', 'eegel1@ibm.com', 'bRY4ACO24rwO', 1),
(3, 'dcompfort2', 'pelsey2@blog.com', '6PlUKATmybiN', 2),
(4, 'adallywater3', 'gdeeth3@devhub.com', 'BQ2i5AYgwr', 2),
(5, 'bicke4', 'aparrington4@redcross.org', 'q2R9sidG', 1),
(6, 'kbrisbane5', 'bsollam5@yelp.com', 'Frk8GNK', 1),
(7, 'mlinforth6', 'hromagnosi6@cocolog-nifty.com', '5Ugu5QMQo', 2),
(8, 'rtruswell7', 'lkillcross7@wufoo.com', 'KPHRcYokmE', 1),
(9, 'ccornu8', 'kmaclardie8@ebay.com', 'THpWxv', 2),
(10, 'mnewlove9', 'qkisbee9@biblegateway.com', 'LyhlUG8NiIn', 2),
(11, 'oremingtona', 'astannaha@addtoany.com', 'agSFCyKN6', 1),
(12, 'waleksandrovb', 'ocawleyb@tinypic.com', 'JeVIPHe6Y7', 1),
(13, 'fantillc', 'kbrinsonc@fc2.com', 'OZML4Se', 1),
(14, 'aclyburnd', 'datkirkd@ucsd.edu', 'eeJ8SosFa', 2),
(15, 'ncotteee', 'cwaleworkee@free.fr', '4cGp2UBwt', 1),
(16, 'jkelceyf', 'ncrokerf@ca.gov', 'aiMWHiDp1Slh', 2),
(17, 'tkurtg', 'ediesg@china.com.cn', '3ttiK48l', 1),
(18, 'jclemmensh', 'dkenwrickh@mlb.com', 'QLXnN7FMx5m', 1),
(19, 'bpreni', 'mfernei@newyorker.com', '1PFxrVg4', 1),
(20, 'lblenkinj', 'kboylandj@hexun.com', 'w7OqntKBFr', 1),
(21, 'acleggk', 'mfrisek@nbcnews.com', 'GMrqyDP', 2),
(22, 'dgivesl', 'czavatterol@nps.gov', 'iKwufPmqfBUM', 1),
(23, 'klarmetm', 'nbanfillm@house.gov', 'CnRjKjT9uc', 1),
(24, 'tfauningn', 'dvinen@moonfruit.com', '5yW0SSaDU', 2),
(25, 'kpflegero', 'agelletto@infoseek.co.jp', 'EXx14mRv5N06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `beasiswas`
--

CREATE TABLE `beasiswas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_beasiswa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mitra_id` bigint(20) UNSIGNED NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `angkatan_awal` int(11) NOT NULL,
  `angkatan_akhir` int(11) NOT NULL,
  `sem_min` int(11) NOT NULL,
  `sem_max` int(11) NOT NULL,
  `status` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beasiswas`
--

INSERT INTO `beasiswas` (`id`, `nama_beasiswa`, `mitra_id`, `deskripsi`, `angkatan_awal`, `angkatan_akhir`, `sem_min`, `sem_max`, `status`) VALUES
(1, 'Beasiswa Djarum', 1, '-Aktif berorganisasi di dalam maupun di luar negeri\n	-Tidak sedang menerima beasiswa dari pihak lain\n	-Kuliah di mitra perguruan tinggi Djarum Beasiswa Plus', 2021, 2019, 4, 8, 1),
(2, 'Beasiswa KSE USU', 3, 'Karya Salemba Empat kembali membuka kesempatan kepada para mahasiswa untuk ikut serta dalam Program Beasiswa Reguler Karya Salemba Empat Tahun Akademik 2023/2024. Beasiswa berupa tunjangan pendidikan akan diberikan kepada program studi Strata 1 (S1) yang ', 2022, 2019, 2, 8, 1),
(3, 'Beasiswa Bantuan Belajar (BBM)', 4, '1. Jenjang S1/Diploma IV/Diploma III paling rendah pada semester II dan paling tinggi duduk pada semester VI untuk Jenjang S1 dan Jenjang Diploma IV, paling rendah pada semester II dan paling tinggi duduk pada semester IV untuk Jenjang Diploma III;\n3. IPK', 2022, 2020, 2, 6, 2),
(4, 'BSI Scholarship Tahun 2023', 5, 'Program beasiswa ini khusus bagi mahasiswa dari jurusan Ilmu Ekonomi, Managemen, Agribisnis, Akuntansi, Bisnis, Perbankan (Syariah dan Umum), Aktuaria, Statistika, Matematika, Ilmu-ilmu Pengetahuan Alam, Ilmu Komputer, Psikologi dan Ilmu Hukum.', 2021, 2019, 4, 8, 2),
(5, 'BCA Finance Peduli', 7, 'Adapun persyaratan minimum yang harus dipenuhi oleh calon penerima Beasiswa BCA Finance adalah :\n1. Mahasiswa/i PTN/PTS semua jurusan di Indonesia yang sedang menempuhprogram Strata-1 (S-1).\n2. Mahasiswa aktif S1 yang pada saat pendaftaran Beasiswa dibuka', 2021, 2019, 4, 8, 1),
(6, 'Beasiswa Bank Indonesia 2023', 8, '1. Mahasiswa/i Aktif program S1 (tidak dalam status cuti akademik)\n2. Sekurang-kurangnya telah menyelesaikan 40 SKS atau 3 Semester\n3. IPK minimal 3,00 skala 4\n4. Maksimal berusia tidak lebih dari 23 tahun atau belum berusia 24 tahun pada saat menerima be', 2021, 2019, 3, 8, 2),
(7, 'Beasiswa Pertamina Sobat Bumi 2023', 9, 'Pendaftaran program Beasiswa Pertamina Sobat Bumi 2023 dilakukan secara online dengan syarat pelamar merupakan mahasiswa aktif, berkuliah di kampus mitra Pertamina Foundation, IPK >3,00 skala 4,00, tidak sedang mendapatkan beasiswa dari pihak mana pun, pe', 2022, 2020, 2, 6, 2),
(8, 'Bakti BCA 2022', 7, 'PENDAFTARAN\n\n1. Melengkapi seluruh administrasi pada persyaratan umum;\n2. Kartu Tanda Mahasiswa (KTM);\n3. Kartu Tanda Penduduk (KTP);\n4. Foto Diri;\n5. Batas Pendaftaran sampai tanggal 12 Juni 2022.', 2020, 2018, 4, 8, 2),
(9, 'BEASISWA CENDEKIA BAZNAS 2022', 10, 'Beasiswa BAZNAS adalah program BAZNAS yang memiliki tugas menyediakan dana pendidikan demi terjaminnya keberlangsungan program pendidikan sebagai pertanggungjawaban antar generasi dan menyiapkan generasi penerus bangsa yang memiliki kedalaman ilmu pengeta', 2020, 2020, 4, 4, 2),
(10, 'BEASISWA ADARO TA 2022/2023', 11, '1. Mahasiswa/I berkebangsaan Indonesia\n2. Mahasiswa S1 reguler minimal semester III maksimal semester VII\n3. IPK minimal 3,00\n4. Mahasiswa dengan kondisi keluarga yang kurang mampu\n5. Tidak atau sedang menerima beasiswa dari Lembaga atau Instansi lain\n6. ', 2021, 2019, 3, 7, 2);

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
-- Table structure for table `jurusanbeasiswas`
--

CREATE TABLE `jurusanbeasiswas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `beasiswa_id` bigint(20) UNSIGNED NOT NULL,
  `id_beasiswakhsjrsn` bigint(20) UNSIGNED NOT NULL,
  `ipk_min` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jurusanbeasiswas`
--

INSERT INTO `jurusanbeasiswas` (`id`, `beasiswa_id`, `id_beasiswakhsjrsn`, `ipk_min`) VALUES
(29, 10, 7, 3),
(30, 4, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `jurusans`
--

CREATE TABLE `jurusans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_jurusan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jurusans`
--

INSERT INTO `jurusans` (`id`, `nama_jurusan`) VALUES
(1, 'Akuntansi'),
(2, 'Arsitektur'),
(3, 'Biologi'),
(4, 'Hukum'),
(5, 'Manajemen'),
(6, 'Ilmu Komputer'),
(7, 'Kedokteran'),
(8, 'Kedokteran Gigi'),
(9, 'Manajemen'),
(10, 'Teknologi Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `kliens`
--

CREATE TABLE `kliens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username_klien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_klien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_klien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kliens`
--

INSERT INTO `kliens` (`id`, `username_klien`, `email_klien`, `password_klien`) VALUES
(1, 'amunro0', 'bdavies0@goodreads.com', '80JieZ5k'),
(2, 'nlewson1', 'bkennifeck1@jimdo.com', 'aGEL29uDwzyM'),
(3, 'flavalle2', 'mlohrensen2@go.com', 'tOZ6P1zG'),
(4, 'gscatchar3', 'jcoules3@cdbaby.com', 'o881W4r2aL'),
(5, 'ubedinham4', 'jrowbottam4@bandcamp.com', 'koR7fqQIHg');

-- --------------------------------------------------------

--
-- Table structure for table `levelkliens`
--

CREATE TABLE `levelkliens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_level_klien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levelkliens`
--

INSERT INTO `levelkliens` (`id`, `nama_level_klien`) VALUES
(1, 'Basic'),
(2, 'Premium');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `nama_level`) VALUES
(1, 'Admin'),
(2, 'Regular');

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
(5, '2023_05_11_115136_create_mitras_table', 1),
(6, '2023_05_11_115145_create_jurusans_table', 1),
(7, '2023_05_11_115152_create_levels_table', 1),
(8, '2023_05_11_115204_create_levelkliens_table', 1),
(9, '2023_05_11_115221_create_statusbeasiswas_table', 1),
(10, '2023_05_11_115229_create_akuns_table', 1),
(11, '2023_05_11_115238_create_kliens_table', 1),
(12, '2023_05_11_115246_create_beasiswas_table', 1),
(13, '2023_05_11_115256_create_jurusanbeasiswas_table', 1),
(14, '2023_05_11_115310_create_tokens_table', 1),
(15, '2023_05_15_054845_create_userlevels_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mitras`
--

CREATE TABLE `mitras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_mitra` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mitras`
--

INSERT INTO `mitras` (`id`, `nama_mitra`) VALUES
(1, 'Djarum Foundation'),
(3, 'Yayasan Karya Salemba Empat'),
(4, 'USU'),
(5, 'BSI'),
(7, 'BCA'),
(8, 'Bank Indonesia\n'),
(9, 'Pertamina Foundation\n'),
(10, 'Badan Amil Zakat Nasional'),
(11, 'PT Adaro Foundation\n');

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
(10, 'App\\Models\\User', 1, 'Api Token of SFUTRA', '7069a1bb7c554d7e57081b2e10ea6d9d2b1ae38e2e3420c53615d7763563c7b8', '[\"none\"]', '2023-05-15 07:38:53', NULL, '2023-05-15 07:38:01', '2023-05-15 07:38:53'),
(11, 'App\\Models\\User', 1, 'Api Token of SFUTRA', 'f1430d804358cc21806d20425adcc4c06b7f083b1d9aa76ca250768c259bab84', '[\"none\"]', '2023-05-17 06:27:10', NULL, '2023-05-17 06:05:00', '2023-05-17 06:27:10'),
(12, 'App\\Models\\User', 2, 'Api Token of SHOOOGU', '4314ee8fe17d8245faf0ab5a0c9b42cac3fc657a9a2788264090912899167cc5', '[\"*\"]', '2023-05-17 06:06:50', NULL, '2023-05-17 06:06:26', '2023-05-17 06:06:50'),
(13, 'App\\Models\\User', 1, 'Api Token of SFUTRA', '655f1e2a2e188c6bd98ce6f343e852dd79b65bc6287e956d56a68029166bfd98', '[\"none\"]', '2023-05-19 04:13:05', NULL, '2023-05-19 04:12:33', '2023-05-19 04:13:05'),
(14, 'App\\Models\\User', 1, 'Api Token of SFUTRA', '774ecb3ca2a30bb0490a6460abb1a3c5307bfab371b09149307049ad06e50654', '[\"*\"]', '2023-05-21 08:24:35', NULL, '2023-05-19 04:13:51', '2023-05-21 08:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `statusbeasiswas`
--

CREATE TABLE `statusbeasiswas` (
  `id_status` bigint(20) UNSIGNED NOT NULL,
  `nama_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statusbeasiswas`
--

INSERT INTO `statusbeasiswas` (`id_status`, `nama_status`) VALUES
(1, 'Aktif'),
(2, 'Tidak Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_klien` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_klien` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `id_klien`, `token`, `level_klien`) VALUES
(1, 1, 'JkzTgom4', 2),
(2, 3, 'Hc9MeDZ8', 1),
(3, 3, 'KsgOoPpX', 1);

-- --------------------------------------------------------

--
-- Table structure for table `userlevels`
--

CREATE TABLE `userlevels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `level_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userlevels`
--

INSERT INTO `userlevels` (`id`, `user_id`, `level_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(4, 7, 1);

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
(1, 'SFUTRA', 'safutrasetya@gmail.com', NULL, '$2y$10$435ArwaDOCfoC9N39B/14.VAypJlCJZjjVZW0dBcJptctEiL/5j7m', NULL, '2023-05-14 10:37:56', '2023-05-14 10:37:56'),
(2, 'SHOOOGU', 'han@gmail.com', NULL, '$2y$10$9t7rsnUnt5br9Tj4VkG5yOjp7Bi9BogbMQNeibEtZU4TZg4KywGr.', NULL, '2023-05-14 22:46:55', '2023-05-14 22:46:55'),
(7, 'Userlevel tester', 'tester@tester.test', NULL, '$2y$10$aK2PGdUsldYl4Uc52uzXqeVmC4FN7hs0fKqbruC1t.SKtxtCxawGi', NULL, '2023-05-19 06:31:15', '2023-05-19 06:31:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akuns`
--
ALTER TABLE `akuns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `akuns_level_foreign` (`level`);

--
-- Indexes for table `beasiswas`
--
ALTER TABLE `beasiswas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `beasiswas_id_mitra_foreign` (`mitra_id`),
  ADD KEY `beasiswas_status_foreign` (`status`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jurusanbeasiswas`
--
ALTER TABLE `jurusanbeasiswas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jurusanbeasiswas_id_beasiswa_foreign` (`beasiswa_id`),
  ADD KEY `jurusanbeasiswas_id_beasiswa_khsjrsn_foreign` (`id_beasiswakhsjrsn`);

--
-- Indexes for table `jurusans`
--
ALTER TABLE `jurusans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kliens`
--
ALTER TABLE `kliens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levelkliens`
--
ALTER TABLE `levelkliens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mitras`
--
ALTER TABLE `mitras`
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
-- Indexes for table `statusbeasiswas`
--
ALTER TABLE `statusbeasiswas`
  ADD PRIMARY KEY (`id_status`) USING BTREE;

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tokens_id_klien_foreign` (`id_klien`),
  ADD KEY `tokens_level_klien_foreign` (`level_klien`);

--
-- Indexes for table `userlevels`
--
ALTER TABLE `userlevels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userlevels_user_id_foreign` (`user_id`),
  ADD KEY `userlevels_level_id_foreign` (`level_id`);

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
-- AUTO_INCREMENT for table `akuns`
--
ALTER TABLE `akuns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `beasiswas`
--
ALTER TABLE `beasiswas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jurusanbeasiswas`
--
ALTER TABLE `jurusanbeasiswas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `jurusans`
--
ALTER TABLE `jurusans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `kliens`
--
ALTER TABLE `kliens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `levelkliens`
--
ALTER TABLE `levelkliens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `mitras`
--
ALTER TABLE `mitras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `statusbeasiswas`
--
ALTER TABLE `statusbeasiswas`
  MODIFY `id_status` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userlevels`
--
ALTER TABLE `userlevels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `akuns`
--
ALTER TABLE `akuns`
  ADD CONSTRAINT `akuns_level_foreign` FOREIGN KEY (`level`) REFERENCES `levels` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `beasiswas`
--
ALTER TABLE `beasiswas`
  ADD CONSTRAINT `beasiswas_id_mitra_foreign` FOREIGN KEY (`mitra_id`) REFERENCES `mitras` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `beasiswas_status_foreign` FOREIGN KEY (`status`) REFERENCES `statusbeasiswas` (`id_status`) ON UPDATE CASCADE;

--
-- Constraints for table `jurusanbeasiswas`
--
ALTER TABLE `jurusanbeasiswas`
  ADD CONSTRAINT `jurusanbeasiswas_id_beasiswa_foreign` FOREIGN KEY (`beasiswa_id`) REFERENCES `beasiswas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `jurusanbeasiswas_id_beasiswa_khsjrsn_foreign` FOREIGN KEY (`id_beasiswakhsjrsn`) REFERENCES `jurusans` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_id_klien_foreign` FOREIGN KEY (`id_klien`) REFERENCES `kliens` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tokens_level_klien_foreign` FOREIGN KEY (`level_klien`) REFERENCES `levelkliens` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `userlevels`
--
ALTER TABLE `userlevels`
  ADD CONSTRAINT `userlevels_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `userlevels_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2023 at 02:10 PM
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
(2, 2, 'Ilmu Komputer dan Teknologi Informasi', 'Teknologi Informasi', 'S1', 3.80, '2023-05-20 11:19:40', '2023-05-20 11:19:42');

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
(1, 'App\\Models\\User', 26, 'API Token of Mhd Afifan Aly Rahman Saragih', 'fb6d9362a1e1311a45280e0761e72259390553e07bd9af34f0002e296168270b', '[\"*\"]', '2023-05-20 04:23:13', NULL, '2023-05-20 03:53:35', '2023-05-20 04:23:13');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `batch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registered_semester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Aktif','Lulus','Mengundurkan Diri','drop out') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `student_id`, `batch`, `registered_semester`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2020', '6', 'Aktif', '2023-05-20 11:10:02', '2023-05-20 11:10:05'),
(2, 2, '2020', '6', 'Aktif', '2023-05-20 11:19:52', '2023-05-20 11:19:52');

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
(2, 'Ridha Arrahmi', '201402015', 'P', 'https://201402015', '2023-05-20 11:16:09', '2023-05-20 11:16:09');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `name`, `description`, `priority`, `created_at`, `updated_at`) VALUES
(1, 5, 'Esse tempora nihil quidem.', 'Doloremque a eos et iusto aperiam. Voluptatem est quo deserunt ipsam nesciunt amet. Quasi omnis voluptatem suscipit est sit repellendus est.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(2, 18, 'Sed illo aut similique dolorem facilis facere itaque.', 'Sint blanditiis provident ea aperiam recusandae aut molestiae. Dolores aperiam dolores rem fugiat est. Exercitationem asperiores tempora inventore delectus.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(3, 5, 'Repellendus corporis explicabo pariatur quod quam dolore voluptatem.', 'Repellendus ratione optio distinctio quia non odit eligendi accusamus. Provident ipsa dolor excepturi tempore deserunt quibusdam. Eaque excepturi autem deserunt facilis voluptas.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(4, 6, 'Molestias distinctio ut temporibus ut perspiciatis dolore doloremque nulla.', 'Ipsum reiciendis est enim officia. Fugit earum quod doloremque.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(5, 4, 'Animi fugiat sunt quia ex.', 'Non est cumque ullam atque ad. Ut omnis numquam numquam. Voluptatem aut quaerat voluptatem. Accusantium et nesciunt sed aspernatur provident iure.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(6, 2, 'Temporibus architecto nihil nulla reiciendis eligendi assumenda.', 'Corporis harum laudantium cupiditate officiis quia. Provident iste dignissimos excepturi laborum rerum.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(7, 9, 'Ullam sed vel aliquam hic et.', 'Deserunt quaerat vel quam voluptate modi. Ut ipsa quis voluptatem sed sunt nihil in. Hic quaerat praesentium voluptatem eligendi tempora.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(8, 19, 'Quod vel nam beatae omnis velit.', 'Est eum quasi ad voluptates aut. Dolores est praesentium autem facere et minima asperiores. Quia qui sed ad officiis et perspiciatis dolor in.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(9, 24, 'Veritatis nisi est possimus quibusdam voluptas rerum maxime.', 'Qui vel perspiciatis excepturi hic. Quia aperiam amet commodi corrupti. Expedita aut est vel sequi sint dolor dolores quas.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(10, 21, 'Eos magnam sit praesentium temporibus.', 'Ut et rem nisi nihil. Sit vitae illum omnis consectetur quae sit. Dolore amet et quia aut rem quo. Quae optio architecto illo aut atque ut vero.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(11, 23, 'Mollitia repudiandae minus voluptatem ut delectus distinctio.', 'Est labore magnam voluptatum. Nisi et consequatur eveniet molestias. Recusandae qui in facilis sed voluptatem numquam. Laboriosam quae odit perspiciatis expedita.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(12, 1, 'Vel quibusdam molestiae facilis omnis ea.', 'Ipsam adipisci illo adipisci minima et autem. Ut qui vitae delectus voluptatum veniam. Autem velit perspiciatis sit iusto non quia. Tempora enim quisquam ut delectus fuga vitae distinctio doloribus.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(13, 9, 'Eos placeat aut dicta aspernatur commodi pariatur aut molestiae.', 'Et porro id id quaerat quaerat. Est recusandae distinctio enim iste. Sint sed rerum velit ut.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(14, 24, 'Corporis voluptatibus adipisci et voluptatem ut sit.', 'Quo reiciendis eligendi non qui aspernatur. Ullam nulla enim vel atque autem. Modi qui tempora praesentium voluptas minus molestias accusantium. Nemo odio eos illo necessitatibus commodi.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(15, 25, 'Qui debitis ut praesentium voluptatem.', 'Tenetur nemo voluptatem consequuntur fugiat. Possimus doloremque et ad nihil rerum. In maxime temporibus dolor itaque autem animi. Corrupti assumenda tempore quia et.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(16, 15, 'Corrupti dolorem quia atque sit ut necessitatibus.', 'Distinctio iure quia rem dolorem a ex. Quam eum et repellat numquam. Assumenda qui qui quaerat aut aliquid non.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(17, 18, 'Ut placeat est est.', 'Et ut maxime provident magnam consequatur ratione cum. Iste aliquid est eaque reiciendis. Repudiandae minus voluptatum in ea.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(18, 21, 'Dolorem eos mollitia ab ut.', 'Occaecati quibusdam et molestiae aut ab. Facilis ut rerum ea. Sunt libero quia dolor qui. Et pariatur inventore dolore et reprehenderit.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(19, 1, 'Rerum aperiam dolorem libero necessitatibus ea.', 'Distinctio praesentium voluptates quo impedit repellat. Quis et quaerat in aliquam iusto excepturi vitae. Asperiores dicta explicabo vero veritatis repellat exercitationem modi.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(20, 7, 'Laudantium voluptatibus et est vitae ut unde.', 'Id sit fugit natus deserunt officia iusto. In nisi unde quia ut debitis ad quia. Placeat reprehenderit distinctio ratione facere.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(21, 1, 'Neque eum dolorum illum omnis aut modi ipsa.', 'Nihil mollitia repellat quo incidunt. Qui aut rerum nobis id qui et ut. Fugit eius placeat possimus quisquam.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(22, 4, 'Rerum ut voluptas sapiente sunt beatae aperiam.', 'Impedit omnis sit tenetur accusantium. Ex cum repellendus sit quia consectetur omnis error. Deserunt voluptas voluptatum provident pariatur. Maiores quis sed aut vel incidunt sint est.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(23, 6, 'A ipsam ea quis voluptas consequuntur mollitia.', 'Quis et soluta alias nemo omnis. Harum officia fugiat aut facere aliquid est et. Earum iste quaerat mollitia numquam. Modi iure atque esse accusantium.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(24, 24, 'Nihil at minima consequatur facilis eos facere harum.', 'Sit rem dolorum aut magni voluptas. Vel labore ut reprehenderit sit perspiciatis ea. Ut ut sed doloribus quasi.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(25, 5, 'Consequatur error id non omnis sit et qui.', 'Molestiae aut impedit rerum. Nobis explicabo inventore in sed mollitia explicabo voluptatem. Pariatur non omnis neque sunt. Est rerum eligendi saepe sit ea illo voluptate.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(26, 19, 'Asperiores maiores voluptatum qui quaerat illo quo sed.', 'Nesciunt qui illo voluptatibus sunt. Eveniet dolore ullam ut molestiae. Sequi magnam sit sapiente. Vel debitis tempore corrupti sit totam.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(27, 12, 'Nulla aliquam voluptas distinctio sint.', 'Ut sunt eius reprehenderit ad fugit velit. Rerum expedita nisi laudantium ratione nihil aut. Voluptatem eligendi ducimus ipsa exercitationem et quis quidem. Magni eos tempore est culpa molestiae.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(28, 15, 'Optio laborum sit ut voluptas.', 'Quia error nihil aspernatur quia dolor molestiae sit incidunt. Quo quam iure qui eos aut et animi. Molestiae placeat doloremque voluptates omnis sit voluptas. Ullam quia quo unde officiis.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(29, 9, 'Et animi maxime cumque magnam eius.', 'Officiis nulla odio voluptatum. Est repudiandae aut reprehenderit neque est illo. Iure ipsum laborum sint blanditiis vero.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(30, 8, 'Tempora a magnam et ut totam quod.', 'Animi quaerat enim praesentium omnis. Aut quaerat ut velit occaecati temporibus vero. Enim atque perspiciatis ducimus ab et perferendis dolore.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(31, 17, 'Minima quos ut voluptas blanditiis laudantium sint error.', 'Ipsam voluptatem perferendis qui sit voluptas quo doloremque omnis. Aut harum illum magnam consequatur.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(32, 9, 'Ut consequatur repudiandae perferendis repellendus voluptates dolor culpa.', 'Qui alias ad dolores animi optio sunt maiores. Nisi voluptatibus ipsam earum deserunt quia omnis qui. Quo accusamus tempora odio ullam adipisci labore.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(33, 17, 'Asperiores architecto enim placeat rem rerum assumenda ab.', 'Eveniet sunt odit nam iure. Quod aut quia qui tenetur.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(34, 5, 'Id qui atque atque.', 'Quasi sit maiores quo et. Odio recusandae et ut ad consequuntur. Quam nulla saepe fuga temporibus quia consequatur autem.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(35, 21, 'Enim numquam est quod illo qui ratione.', 'Voluptatibus ratione doloribus a assumenda a aut odio. Optio ut eveniet ut temporibus quis. Omnis consequatur ut fugit. Earum modi repudiandae illum libero. Autem eum ratione veniam.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(36, 17, 'Id deserunt perferendis neque.', 'Maxime velit ad nam doloribus inventore. Officia ipsa similique ipsam mollitia. Pariatur dolorem eaque vero rem voluptatem ut. Libero doloremque nobis laudantium quia fugiat.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(37, 20, 'Consectetur quia necessitatibus officiis.', 'Occaecati omnis sit ipsum veniam aperiam eos. Ut ut illum facilis molestias sed adipisci. Temporibus et nihil a aspernatur atque.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(38, 9, 'Perferendis similique pariatur voluptatem molestiae rerum corrupti quia.', 'Eos omnis sapiente similique id. Et aliquid dignissimos quaerat vitae tempora. Molestiae necessitatibus perferendis rem pariatur.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(39, 4, 'Harum aut magni sit eligendi qui eum.', 'Modi quas id culpa occaecati. Consequatur doloribus delectus iure non et earum. Sapiente dolorem sequi accusamus ipsum reprehenderit labore. Assumenda dolor libero ex ut aut deleniti.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(40, 17, 'Perferendis quibusdam ea dignissimos animi quisquam et aspernatur iste.', 'Officia dolorem repellat quia voluptates sed illo consequatur cupiditate. Aut porro est adipisci sunt. Nemo aperiam sed nam ut.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(41, 18, 'Et quia voluptatem ut delectus.', 'Repellat est esse aut officiis in magnam nam aut. Laboriosam quia et aperiam eaque. Corporis ut provident cum accusamus. Excepturi placeat quo eum rerum illo. Aut possimus quaerat quia et.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(42, 13, 'Totam dolore suscipit quis iusto et dolorem.', 'Nam earum a quibusdam eum et aperiam sit. Et nesciunt harum qui.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(43, 4, 'Non amet corporis aliquam est ad asperiores quas.', 'Temporibus velit et fugiat nobis provident nisi. Alias ut atque provident qui praesentium expedita. Dicta vel fugiat et.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(44, 7, 'Cum quia natus et vel.', 'Ea id at et id et ex asperiores. Animi id non ullam id. Aperiam voluptas atque eos molestiae incidunt exercitationem reiciendis eum.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(45, 14, 'Qui distinctio officia voluptatem sed ut in.', 'Fugit consectetur distinctio ut placeat sit. Quia consequatur veniam soluta esse nostrum reprehenderit magnam fugiat. Ducimus repellat ut vero aut. Id quo in aut nulla et.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(46, 9, 'Eos exercitationem aspernatur veniam et maxime et itaque aliquam.', 'Sunt earum placeat animi dolore et eius. Ut est eos ullam ut inventore eveniet consequatur. Quas sint nobis error aut.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(47, 22, 'Omnis expedita qui ut placeat ut ipsam eveniet.', 'Eveniet tempore vitae qui quia doloribus. Consequuntur earum aperiam veniam corrupti quis fuga odit ut. Architecto sit nihil veritatis. Qui laborum ullam blanditiis sunt dolorum ea.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(48, 4, 'Aut ab sunt et officia.', 'Non sunt consequatur sed voluptates. Praesentium sit neque eos cumque. Qui est sequi sequi rem repellat. Dolores dolor nemo deserunt ut et tempore est. Neque tenetur ut qui natus.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(49, 19, 'Nihil distinctio sit et harum dolor.', 'Aspernatur necessitatibus et et. Distinctio sed pariatur nobis aut eius. Ipsa suscipit suscipit consequatur sit. Et esse omnis omnis quaerat aut.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(50, 7, 'Quidem necessitatibus non minus saepe sit.', 'Eaque ut deleniti facilis quidem et cum nesciunt modi. Nobis quibusdam quis alias illum. Vitae rerum repellendus perferendis aut in.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(51, 7, 'Quis occaecati distinctio placeat eos est minima ut et.', 'Mollitia rem odit occaecati facilis est. Repudiandae dolorem omnis voluptatem quisquam rerum. At sint tempora illo aperiam porro quia aliquam. Eligendi quam recusandae laudantium.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(52, 23, 'Voluptatibus non ipsam dolore culpa quo qui et.', 'Quo eius nostrum quasi debitis atque. Id cupiditate ex quae ea facere autem nam et. Dolorum reprehenderit amet officiis veritatis voluptatem. Id aut rerum et saepe.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(53, 12, 'Inventore quod neque voluptatem exercitationem consectetur repellat numquam.', 'Quia enim tempora amet est dolorem sint. Laudantium dolore sit quis nisi. Aliquid tempora atque autem dolor.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(54, 25, 'Fugiat laborum sed earum aspernatur ratione deserunt commodi.', 'Id est qui dolore accusamus autem nostrum in. Quasi qui explicabo alias enim sint tenetur eaque. Officiis dolor aperiam eos modi. Amet minus qui quas repellendus et inventore.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(55, 4, 'Rem natus perspiciatis magnam eaque et labore quas.', 'Sit rerum aut porro non laboriosam excepturi minima. Et at est aut ratione nihil.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(56, 12, 'Quaerat harum aliquam qui magnam rerum delectus veritatis reprehenderit.', 'Sapiente odio voluptate voluptatibus et labore quia. Rerum commodi facere rerum. Sit rerum repellendus quo non doloribus doloribus alias.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(57, 21, 'Ducimus dolores fugit dolorem quisquam debitis sunt.', 'Modi nostrum quo omnis sunt. Numquam rerum voluptatibus ab eos. Aut facilis et rerum dolorem.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(58, 16, 'Debitis quia explicabo assumenda cumque eius officia ut.', 'Tempore perferendis animi placeat doloremque corporis quia. Delectus voluptatem ut sed cumque tempora provident. Voluptatem corporis incidunt incidunt provident.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(59, 21, 'Eligendi consequatur est magnam dignissimos quia impedit.', 'Enim voluptatem eius est consequuntur. Sint autem possimus id laudantium quaerat quia eaque magnam. Nostrum a eius qui ut ab praesentium. Quaerat nesciunt et nihil voluptatibus et aspernatur aut.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(60, 25, 'Architecto incidunt enim vitae consequatur quibusdam aliquid.', 'Dolor et quis sapiente dolorum in et. Consequuntur temporibus sit ipsa sint eum. Qui dolores dicta rerum omnis neque repudiandae. Et dignissimos consequatur quia natus officiis vitae id.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(61, 4, 'Voluptates porro enim voluptates hic asperiores.', 'Recusandae ad vel distinctio maxime qui eligendi quasi. Quo quia nostrum magni tenetur id repellendus distinctio.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(62, 7, 'Amet et quaerat eaque blanditiis officia perferendis.', 'Ut eius ut expedita rerum. Et esse velit quo tenetur. Libero molestias vero quo blanditiis quia ut et. Veniam vero omnis neque aut. Ipsa quas ea sequi quasi.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(63, 18, 'Facere adipisci et beatae recusandae distinctio accusantium.', 'Et a itaque libero nesciunt. Non sequi debitis temporibus facere atque qui quod. Exercitationem qui eaque animi et non ullam ut.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(64, 6, 'Veritatis voluptate blanditiis voluptas sit inventore.', 'Rerum ut aliquam et voluptas ex tempore. Nam labore vel accusamus porro nihil. Aperiam qui in impedit quisquam occaecati et et voluptatibus.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(65, 17, 'Voluptatum facilis adipisci reiciendis cumque qui.', 'Voluptatem corrupti quos eius voluptas. Voluptatibus similique eum deleniti et vel. Beatae et nam laborum pariatur.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(66, 22, 'Pariatur autem adipisci consequuntur.', 'Ipsam ut porro voluptatem est maxime qui aut. Qui ut esse autem veniam eveniet sit dolores. Quo quae voluptate odit molestiae dolor quia quam. Reprehenderit omnis rerum ut qui unde provident fuga.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(67, 17, 'Enim rerum amet voluptatem esse est optio numquam molestias.', 'Rerum ullam dignissimos ut sequi et ut dolores. Numquam ex expedita accusantium culpa. Autem in et quam tenetur perspiciatis.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(68, 22, 'Recusandae autem non cupiditate.', 'Quia officiis et autem consequatur quae in provident quisquam. Quo inventore et labore. Numquam nemo architecto quia ea praesentium ut. Quia omnis voluptas fugit adipisci distinctio tenetur.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(69, 20, 'Culpa ipsam aperiam facere ut.', 'Eum veniam et quae ea rerum aut. Corporis numquam illo accusamus rerum itaque quis. Reiciendis ducimus asperiores est occaecati nulla velit hic et.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(70, 16, 'Omnis et magnam veritatis dolores et itaque perspiciatis fugiat.', 'Vel odit veniam voluptatibus velit. Fuga aut velit nostrum. Explicabo numquam et distinctio dolorum. Perspiciatis voluptatem voluptas occaecati natus quod veritatis.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(71, 20, 'Est mollitia optio voluptas quisquam porro est.', 'Harum amet dolorum aliquid omnis accusamus. Omnis repellendus ex voluptates cum quisquam nihil. Sit velit quas sed alias quam minima inventore.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(72, 5, 'Illo quam omnis nostrum qui quia.', 'Enim modi unde quae dolor. Explicabo magni ea rerum sequi. Aut est voluptas doloribus doloribus molestias. Enim animi quae dolore possimus et in est.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(73, 5, 'Velit et eius distinctio vitae magni ut.', 'Id quo quo qui. Nemo tenetur maiores aut. Fugiat et impedit dolorem maxime. Et minus dicta est assumenda.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(74, 12, 'Itaque aliquam unde laboriosam odit expedita.', 'Fugiat perspiciatis et voluptatem. Aut ut veniam sunt inventore.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(75, 22, 'Dolores repellat provident repudiandae ratione quaerat.', 'Iste molestias iure dolores tenetur ea debitis nihil. Eum aut sunt in similique modi fugiat non. Non quis quod commodi sed tempore deserunt nemo. Quaerat dolorum cum odit pariatur adipisci et.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(76, 19, 'Aut amet alias quae perferendis odio quia architecto.', 'Et nemo velit sit dolores qui ut eaque. Quia ut quo pariatur perferendis et eveniet. In commodi libero quae perspiciatis officiis totam. Libero sed asperiores consectetur eius.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(77, 8, 'Eum harum odit deleniti numquam ea autem mollitia.', 'Dolorem doloribus et fuga et. Qui placeat sed amet similique. Reiciendis ut doloremque aperiam est quas. Aut fuga molestias earum et. Autem asperiores dolor et similique cum veniam.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(78, 4, 'Suscipit ad debitis et.', 'Eligendi reiciendis aut autem autem quia rem. Nesciunt autem est incidunt labore deleniti nobis voluptatibus rerum. Voluptatem et voluptas sit qui pariatur.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(79, 2, 'Sit maxime iste qui aliquam facilis neque est.', 'Rerum rerum alias enim ut eum eos possimus. Veritatis optio doloribus in eos qui. Vitae esse neque impedit adipisci rerum ullam dolorem enim.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(80, 7, 'Consequatur exercitationem voluptatum sunt perspiciatis excepturi asperiores incidunt.', 'Tenetur dolorum numquam voluptatem nulla rerum corporis. Autem architecto dolores ullam omnis iure. Culpa facere laboriosam excepturi nihil porro quia architecto. Eos et expedita illum corporis.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(81, 19, 'Nihil amet nobis similique in neque.', 'Numquam dicta rerum repellat sed beatae magnam. Sed hic saepe aperiam reiciendis ea tempore libero. Et et eos autem. Consequuntur dicta laudantium voluptate sapiente rem debitis quisquam.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(82, 7, 'Non vel exercitationem occaecati hic.', 'Alias beatae qui laborum corrupti sed qui ad maiores. Minus sit nihil libero est dolores. Sit itaque a architecto et. Sapiente sed atque reiciendis accusamus nihil distinctio.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(83, 17, 'Eius impedit eius adipisci voluptatibus.', 'Et quo et qui nihil et. Recusandae eum consequatur maxime velit earum voluptas dicta. Iste doloribus porro quo minus earum. Ullam et culpa illo occaecati.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(84, 21, 'Laudantium autem veniam modi omnis ea eligendi est.', 'Mollitia qui quia nulla velit quia. Maxime fuga voluptas ea autem fuga. Aliquid non incidunt quis consequatur. Veniam est aspernatur aliquid qui quia saepe.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(85, 23, 'Adipisci nulla nihil laudantium qui laudantium repellendus.', 'Eligendi eum commodi aut aspernatur adipisci non laudantium. Itaque et eos quisquam molestiae. Sed quia excepturi molestiae dolor voluptas. Architecto saepe ex sunt accusantium delectus.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(86, 6, 'Molestiae eligendi vel est recusandae magnam eos.', 'Veniam commodi asperiores adipisci et. Sint magni accusamus beatae et aliquam. Qui minus iste eligendi minus sunt doloremque quisquam. Distinctio ipsam saepe aut molestiae sit sint sit incidunt.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(87, 24, 'Deleniti ea porro recusandae eos est.', 'Et eaque et ipsum sed consequatur. Omnis maxime placeat itaque praesentium est voluptatem libero. Eius quia minus eligendi dolor molestias. Aut fugiat aliquam a rerum iste repellat temporibus.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(88, 14, 'Adipisci ipsa repudiandae eius ullam dolorem.', 'Omnis est dolores voluptatem dolor consequatur et tempora quia. Est et asperiores inventore minima. Dignissimos praesentium vero deserunt non. Ea aliquam placeat vel quo.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(89, 17, 'Reprehenderit in rerum eum velit sit quia.', 'Deleniti quia quis maiores et. Quisquam omnis eum sed exercitationem beatae. Perferendis eveniet provident autem eum est.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(90, 15, 'Et reiciendis dolore eum non sed enim ratione.', 'Omnis et nulla at fugiat cumque maxime. Ea aspernatur autem repellendus consequatur distinctio odit illo. Ex nostrum ea eum dolorem est et.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(91, 22, 'Autem iste fugiat facere dignissimos.', 'Illum nemo iure eveniet adipisci aut ab omnis. Aspernatur ut non velit ad. Exercitationem facere odit qui corporis quia aspernatur dolorem. Illum expedita optio velit nihil ut.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(92, 15, 'Minima asperiores id veritatis aut et.', 'Modi laudantium minus est qui minus eum. In animi laudantium est autem maxime id. Reiciendis aut ab rerum magni sit cupiditate voluptas.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(93, 5, 'Sit ea odit sunt harum totam inventore.', 'Cum ea dicta excepturi nihil tenetur aut. Et repellendus perferendis minus tempora aperiam voluptatem voluptas. Doloribus veniam iusto nihil aperiam.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(94, 22, 'Totam quia quia rem culpa.', 'Dolores delectus laboriosam sed optio voluptas. Reiciendis aut sed deserunt rerum ut. Soluta enim qui quis qui. Et consequatur deleniti cupiditate iure.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(95, 15, 'Ullam aliquid enim qui id asperiores nemo est.', 'Numquam totam voluptas quam qui nihil non eaque. Animi fugiat officia sequi est labore rerum quia. Debitis ea rem accusamus.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(96, 19, 'Modi ut totam eos quasi voluptas veniam perferendis.', 'Ut id magnam quisquam modi. Dicta qui et tempora dolorem nisi consequatur. Dolor et tempora omnis odit suscipit.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(97, 18, 'At culpa velit tenetur dolorem similique a.', 'Cupiditate vel sint sed quibusdam fuga modi. Accusamus inventore perferendis consectetur tenetur earum velit. Repellat repellat voluptatum ea deserunt deserunt dicta sint.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(98, 11, 'Voluptas ex rem ex aut laborum et.', 'Velit est perspiciatis similique autem. Mollitia dignissimos expedita iste in sint libero voluptatem. Vero facilis inventore quia dolorem sint.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(99, 16, 'Voluptas non quis molestiae consequuntur.', 'Iure et autem omnis. Velit earum quis et voluptatem et. Velit eum non nemo voluptates modi aut eius accusantium.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(100, 1, 'Et nesciunt aut eligendi excepturi earum.', 'Amet voluptates laborum velit earum ducimus dolore. Dolorem quia facere accusamus. Est placeat consequuntur quam officia.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(101, 6, 'Ipsum adipisci aut quas impedit dolores in.', 'Tenetur aspernatur qui dolores vel est qui rerum explicabo. Iusto omnis aut omnis ducimus. Consequatur unde inventore at dolores.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(102, 12, 'Aut qui in ullam ut earum.', 'Ut adipisci tempore ipsum laborum harum. Ut dolorum enim facilis quidem est cum. Quo nobis et magnam est rerum. Ea voluptate error quia ea.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(103, 2, 'Est rerum amet rerum ea doloribus.', 'Est voluptas voluptatem dignissimos qui dolorum sint. Asperiores dolorem explicabo voluptatum esse sint. Nemo nemo molestias quibusdam dicta aperiam. Aut doloremque quo deserunt recusandae sunt.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(104, 25, 'Totam cupiditate non earum qui voluptatem.', 'Ea ut unde ut et. Impedit dolore odit nihil eius soluta. Placeat facere quis ut suscipit et tempore. Quos nam a voluptatem ut id error a.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(105, 18, 'Quos omnis atque harum vitae quisquam.', 'Quis corrupti magnam dolor dolor sequi ducimus. Quia cupiditate qui harum et accusamus. Perspiciatis in odio vero nobis fugiat eius pariatur.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(106, 5, 'Officia ut incidunt nobis.', 'Recusandae illo voluptatem velit. Quo iusto itaque illo necessitatibus. Est ut enim numquam accusamus dignissimos.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(107, 20, 'Aut accusantium quis dignissimos molestiae asperiores sit.', 'Aut quasi in nemo repellendus ut dolorem. Vero consequatur magni dolor culpa modi. Sint maiores et dicta. Et laborum dolores ipsa reiciendis molestias dolore non. Et eum quia molestias.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(108, 22, 'Velit est quia enim incidunt.', 'Tempora eius id non eum expedita dolorem itaque. Sunt repellendus quia velit esse sapiente aut iure. Sunt quam quia iusto at et sequi. Quaerat quia repellendus aperiam.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(109, 12, 'Voluptas aut et nisi inventore deleniti consectetur sit aliquid.', 'Animi sed molestiae necessitatibus autem. Officia provident ullam ducimus earum. Similique cumque molestiae architecto et voluptas mollitia id.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(110, 25, 'Consequatur eligendi omnis voluptatem placeat iste molestias similique.', 'Laboriosam harum quia eligendi harum consequatur libero sed. Exercitationem omnis officia enim reprehenderit beatae aspernatur. Ducimus aut amet quidem possimus. Est id est id ut laudantium optio.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(111, 13, 'Incidunt minus neque perferendis.', 'Deleniti ducimus ipsa eos porro modi. Unde inventore nisi occaecati eligendi. Adipisci maiores nesciunt unde autem eos. Aliquam saepe nulla nobis illum.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(112, 25, 'Et tenetur doloremque dolorum.', 'Itaque omnis veritatis et et maiores itaque porro ipsum. Perferendis fugiat quod nostrum in.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(113, 11, 'Veritatis cum quia omnis sunt aut omnis quis fuga.', 'Aut at qui quidem nemo. Quae blanditiis maiores distinctio incidunt vitae. Quae accusantium aut facere doloribus quia.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(114, 13, 'Nam quia dolor molestiae quis ut voluptas.', 'Voluptas enim culpa cumque temporibus eos eos harum nobis. Molestias officiis illum nisi. Facilis et fugiat laboriosam est magnam beatae et.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(115, 11, 'Aperiam in reprehenderit adipisci.', 'Accusantium beatae assumenda et sint. Sit culpa explicabo voluptatem corrupti id id veniam. Blanditiis sed et sit dolorum doloremque debitis.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(116, 14, 'Quidem facere dolores et commodi.', 'Explicabo eligendi temporibus qui quae omnis. Est id quibusdam culpa iure id. Molestiae quas facere ea aliquid et error. Veritatis praesentium odit necessitatibus. Odio at aut dicta.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(117, 23, 'Recusandae quos magni voluptates inventore aut minus.', 'Explicabo vitae ducimus qui minima modi. In enim sed atque culpa. Ab aliquam expedita aut amet at.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(118, 14, 'Quae veritatis amet sit harum.', 'Delectus occaecati fuga molestiae ut dolorem soluta natus suscipit. Quis est non excepturi nobis repellat est fuga. Eos architecto repellendus neque alias. Minima iste praesentium qui quidem aperiam.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(119, 18, 'In sunt et reprehenderit quidem.', 'Aut quod quidem esse aut sint qui omnis. Molestiae aut nobis ut laboriosam vero. Cupiditate commodi dolorem rerum officia eos delectus. Ducimus eius veniam voluptatem.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(120, 11, 'Ipsa odit nesciunt rerum optio.', 'Et vero aut nulla consequatur esse modi unde. Doloribus molestiae et neque corrupti explicabo vitae totam. Voluptas quasi quibusdam saepe inventore earum. Fuga alias est ut tenetur odio sint sunt.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(121, 16, 'Incidunt et illo qui qui non quasi.', 'Magni minima quam non. Velit in vel est veniam. Commodi ab est reprehenderit ad et qui.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(122, 2, 'Voluptates eligendi numquam aut numquam.', 'Quis ut dolores vero quia qui ullam rerum. Molestiae voluptatem nihil corporis vel voluptas perspiciatis voluptate.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(123, 6, 'Quasi qui autem illo animi nemo et sequi.', 'Vitae libero dolor rerum doloribus suscipit totam. Et saepe est ut consequatur. Eius assumenda autem rem et laboriosam. Nihil dolore neque a enim quia neque quia.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(124, 12, 'Aut voluptate vel mollitia qui quia maxime.', 'Qui quia ipsum ea fugiat. Asperiores dolorum minus velit at beatae nostrum et. Eos minima repudiandae reiciendis dolor.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(125, 7, 'Officia debitis asperiores et.', 'Maiores illum quidem quis itaque consequatur velit. Nihil qui possimus veniam laudantium voluptatem. Aut voluptatum tempore incidunt rerum. Ea ut dolorem ut molestias enim nihil amet.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(126, 24, 'Pariatur et perspiciatis aperiam qui minima voluptatem ut.', 'Harum quo deserunt voluptas quo voluptatibus veniam. Sed saepe cupiditate nihil culpa in fugiat. Magni sint tempora tenetur tempora voluptatem amet.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(127, 23, 'In omnis et natus incidunt eius sint itaque.', 'Unde eaque consectetur corrupti deserunt sit. Officia quia nam a et molestiae. Enim saepe dolor inventore libero nemo delectus.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(128, 22, 'Placeat porro architecto nihil unde et voluptatem qui.', 'Perferendis sequi voluptatem consequuntur. At ullam facilis aut itaque asperiores accusamus. Quaerat quis iusto pariatur tempora. Repudiandae voluptatum quia porro harum.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(129, 20, 'Corrupti doloribus eos necessitatibus velit voluptates est et.', 'Omnis expedita ea quo ea ad pariatur. Officia dolores maxime dignissimos et. Quos nisi id reprehenderit veritatis qui. Quis a similique earum officia asperiores facere in.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(130, 16, 'Dicta aut corrupti necessitatibus illo.', 'Aut modi assumenda esse. Id exercitationem sequi in minima nemo praesentium porro. Mollitia quia reiciendis culpa tempore doloribus molestiae.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(131, 3, 'Omnis aliquam excepturi et debitis consequatur voluptas nemo qui.', 'Et minus et consectetur error occaecati. Sint et optio id in. Corporis in consectetur illo sit. Dolorum qui dicta suscipit velit. Et harum deleniti aliquam eum omnis distinctio ad atque.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(132, 19, 'Rerum numquam sapiente harum ducimus.', 'Id dolorem pariatur laboriosam dolore ex vel. Nisi tempore suscipit minima ex porro. Natus aut iste ducimus quia labore autem.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(133, 18, 'Aut quibusdam illum est illum sed in.', 'Exercitationem vero id a non quia. Iusto ut voluptate rerum. Enim cupiditate facilis ut. Vel autem ratione suscipit saepe adipisci beatae amet.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(134, 25, 'Pariatur aut aperiam non voluptas nostrum sunt.', 'Facere veniam nisi illum similique corrupti distinctio. Quasi eum delectus ex nobis. Laudantium fugiat cumque eius. Magnam porro libero occaecati ea et harum.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(135, 21, 'Consectetur qui voluptas excepturi accusantium maiores sint.', 'Nihil et et eos eaque. Excepturi velit ex quia et. Dolorem blanditiis consequatur reiciendis impedit aliquid. Excepturi labore aut numquam.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(136, 24, 'Voluptatum qui qui sit provident magni.', 'Iusto impedit architecto quia quasi et atque possimus ipsam. Et quia ratione et vitae maiores. Ipsam ut minima ab facere saepe. Sit eos eos accusamus commodi aut enim reiciendis quisquam.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(137, 1, 'Sit totam quia nihil doloremque voluptatem.', 'Commodi doloribus incidunt officiis qui veniam saepe. Ea iste esse fugiat nostrum rem voluptatem. Minus eius quo sed iure. Ullam libero et quis doloremque delectus eum.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(138, 2, 'Dolores sit et vitae itaque.', 'Nihil dolorem et harum sed ducimus nihil expedita. Laborum adipisci corporis ab et et quae. Architecto eos et autem qui. Impedit odio consequatur nihil.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(139, 13, 'Exercitationem aspernatur pariatur quia corporis.', 'Omnis nihil temporibus sapiente quisquam sit facere iste. Sunt impedit qui ut consectetur laudantium. Et dolore nam praesentium sint. Soluta quo voluptates fuga vitae qui omnis animi.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(140, 15, 'Soluta rerum ad neque tempore non qui ut ipsa.', 'Vel sapiente optio et doloribus aut. Voluptas architecto consectetur aut tempore omnis perspiciatis asperiores. Accusantium ut sint omnis. Sunt autem modi repellat et corrupti.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(141, 8, 'Eum tempore ut minima qui molestias.', 'Labore recusandae sapiente quia mollitia qui est rerum veritatis. Nemo quia similique voluptas et rerum deleniti. Quia nihil est dolores ipsum. Quod exercitationem vel temporibus eveniet.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(142, 5, 'Eaque itaque eos est deserunt eos.', 'Enim et culpa dolores repellat quia. Magnam eos esse eos aspernatur quia eum rem debitis. Rerum beatae deleniti et ab sit dolores nihil.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(143, 1, 'Est dolores magni nam atque quia in quas.', 'Et eum ut odit velit et amet soluta. Et quia eveniet non aperiam ea dolorem maiores. Aut error totam ducimus dignissimos laborum pariatur. Quam ab aut repellendus expedita quos officia sed.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(144, 13, 'Nihil dolore et enim aut animi ipsam.', 'Quae omnis voluptas quia illum. At quo est expedita natus eaque dolorem. Assumenda perferendis cum eveniet cupiditate. Mollitia ipsum est et.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(145, 8, 'Suscipit porro assumenda ut officia qui.', 'Molestias corrupti sed recusandae hic voluptatibus explicabo ipsum. Ut praesentium maiores iure cupiditate. Ut ratione provident vero fugit iste sint nobis.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(146, 23, 'Dolore asperiores aut nihil dolore nihil ab.', 'Tempore eius quod id sapiente eos. Et voluptatem ea nemo dolor rerum quos. Temporibus vitae voluptas optio ut aut in esse. Sequi vitae ullam saepe alias dolores veritatis voluptatem sit.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(147, 17, 'Aut pariatur vel dolorem corrupti dicta.', 'Illo et ducimus qui non tempora voluptatem. Et consectetur nemo explicabo asperiores aut vel culpa. Eum sed velit voluptas mollitia. Et distinctio reiciendis laborum libero error.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(148, 20, 'Quia delectus voluptates rerum fugit unde voluptas.', 'Libero vel qui at. Suscipit est amet consequuntur quae voluptatem iusto aut. Dolor aut quasi dolorum reiciendis libero ipsa ut. Magnam veritatis quidem dolor dolorum.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(149, 23, 'Illo enim a molestias atque expedita.', 'Voluptatem numquam incidunt ea fugiat unde et earum. Et voluptate magni rerum sint vitae incidunt. Totam voluptatum et molestiae quae ducimus.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(150, 7, 'Facere veniam vero ea id aliquam.', 'Nisi quisquam quia odit magnam. Voluptates quaerat corporis ea aspernatur qui adipisci. Dolorem ab excepturi aliquam deleniti suscipit voluptatibus.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(151, 17, 'Ut ad mollitia voluptatibus.', 'Voluptatem vel excepturi sint inventore non molestiae. Ut voluptatem ratione facere quia laudantium dolores. Voluptatem illum voluptatem labore voluptate accusantium.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(152, 17, 'Veniam nihil nisi expedita fugit distinctio assumenda et alias.', 'Vel accusamus cum nulla quasi distinctio nulla. Voluptas enim eum sed at.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(153, 9, 'Inventore quis sapiente aut voluptatem suscipit.', 'Molestiae saepe molestiae quibusdam dolores recusandae. Voluptatum consequatur nemo ipsum delectus laboriosam.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(154, 15, 'Numquam qui quas vel inventore.', 'Fugiat voluptas consequatur et ipsa aut. Ipsa non sequi et est corrupti. Omnis sint nisi at. Accusantium quis et explicabo voluptas rem et. Possimus libero omnis ad culpa sunt aperiam.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(155, 13, 'Consequatur saepe fugiat minus qui.', 'Nisi dolorum esse distinctio laborum consequatur. Consequatur magni incidunt vel error. Molestias ab eos velit pariatur sapiente doloribus eum unde.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(156, 15, 'Eius temporibus libero quis occaecati autem est.', 'At nam velit et voluptas. Eaque et sint totam. Officia non reprehenderit nulla.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(157, 24, 'Corporis molestiae culpa laborum nulla.', 'Aut excepturi et modi. Magnam libero laborum repellat temporibus delectus. Aut id qui ex sapiente tempore eius dignissimos.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(158, 11, 'Voluptatem voluptatum alias ut qui facilis.', 'Itaque ratione iusto ratione tenetur velit voluptate et. Consequatur non assumenda doloribus officia sit sapiente. Eligendi dolorem delectus temporibus veniam itaque odit.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(159, 25, 'Id voluptatibus in et in magni quis.', 'Dicta sunt nesciunt non voluptate explicabo ullam. Dolores labore beatae ut aperiam. Magni voluptas nulla sed.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(160, 19, 'Facere qui exercitationem illum velit perferendis.', 'Dolore dignissimos amet sit quidem dolorem quae ut. Ipsam temporibus nihil beatae atque exercitationem hic eos. Quia quae laboriosam veritatis molestiae voluptas.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(161, 17, 'Minima vero explicabo harum totam.', 'Fugit illo voluptas dolorum provident non excepturi dolores. Quos et ipsum quasi occaecati. Consequatur saepe aut qui.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(162, 10, 'Numquam similique aut blanditiis voluptate impedit distinctio.', 'Vitae quo quas beatae explicabo aliquid in sunt. Ea et nostrum laboriosam repellat sit. Ut odit est esse et architecto nostrum.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(163, 16, 'Et laudantium et voluptas dolores quo ipsum ad.', 'Suscipit quasi autem sit iste officiis et. Non quasi minima id et alias rerum voluptas.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(164, 24, 'Quod ratione eum omnis.', 'Ut omnis voluptatem unde non laudantium ipsa. Aut illo ea fugiat velit veniam quis. Accusamus cumque molestiae vero sit quibusdam.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(165, 8, 'Voluptatem pariatur ex necessitatibus tempora ea magnam autem.', 'Eveniet aliquid nulla totam maxime. Ea quod non alias praesentium. Mollitia ex officia deserunt aspernatur. Ut amet quia et qui iure accusantium non.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(166, 15, 'Odio laudantium architecto molestiae et vitae et molestiae.', 'Recusandae et alias aut et earum provident. Veritatis sunt enim sed. Blanditiis laudantium ea saepe. Iusto sed velit repellendus eum ut adipisci ducimus et.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(167, 12, 'Rerum similique corporis pariatur ut odio.', 'Nemo dolorem vel ullam vel qui. Necessitatibus deleniti sit ut fuga. Non quidem perspiciatis a modi. Dolores id sapiente enim velit odio.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(168, 4, 'Illum explicabo distinctio eius voluptatum ipsam quibusdam incidunt veniam.', 'Autem ullam voluptatem quia culpa quisquam. Et eos omnis quia alias atque et et. Accusamus veritatis omnis velit fugiat minima et esse. Voluptas omnis assumenda sint animi beatae rerum perferendis.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(169, 5, 'Enim repellendus ab iste officia.', 'Aliquid non incidunt porro maiores assumenda. A pariatur architecto quis maiores ut eligendi vero. Omnis ipsa soluta qui doloribus est laborum est. Odio dolores cumque vel commodi aut nihil illo.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(170, 1, 'Ut debitis quam similique ex minima.', 'Voluptas cum dolor sint pariatur neque. Veritatis molestiae tempore eaque voluptatem molestiae. Et qui quos in rem eligendi cumque. Quo nulla rerum aut illum eveniet commodi consequatur.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(171, 5, 'Assumenda veniam sunt dolore consequatur ut.', 'Iure quia est beatae id quod. Debitis commodi et sit ducimus dolorum non. In et aut sed aut aut delectus soluta. Debitis vitae quaerat nihil illum suscipit quas.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(172, 6, 'Similique voluptas excepturi modi quia quia est.', 'Hic id tenetur et nihil a id. Cum voluptatem dolor quas nisi et. Dolorum incidunt occaecati dolorum unde et.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(173, 12, 'Nemo totam possimus eum qui et voluptatem officia.', 'Odit molestias aut ut voluptas. Doloribus temporibus optio et rerum sed odit.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(174, 13, 'Esse dolor labore aut vitae quaerat voluptatum aliquid.', 'Magni aut sed aut. Omnis voluptatem omnis aut aut. Expedita iste corporis est et expedita magnam. Voluptatum officiis dolor accusantium aut.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(175, 17, 'Debitis corrupti adipisci cupiditate dolor.', 'Quod dolor et quis pariatur reprehenderit quo. Vero et est quam ullam temporibus. Tempora dolores quasi maxime non alias repudiandae dolorum.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(176, 12, 'A quibusdam tempora earum sint odit reprehenderit.', 'Adipisci dolor fuga totam debitis. Atque tenetur libero ut eum. Nesciunt numquam quo doloremque error. Pariatur eos exercitationem distinctio cum consequatur.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(177, 14, 'In nobis in ut rerum esse.', 'Temporibus et et odio praesentium. Perferendis quas odio perspiciatis id vero odio. Illum ratione consequatur est.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(178, 7, 'Eveniet placeat molestiae culpa non ea atque voluptatem quia.', 'Provident et ad est in quis architecto officia. Consequuntur sed neque dolores repellendus ipsam. Id eligendi quos maxime qui culpa.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(179, 24, 'Et animi blanditiis molestiae amet accusantium aperiam.', 'Ea temporibus placeat eos dolorem. Qui aperiam maxime error vero rerum. Dolorem excepturi maxime harum velit necessitatibus dignissimos.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(180, 25, 'Sint nisi est repellendus exercitationem ullam doloremque est.', 'Odio ipsa molestiae molestias id vel et. Quae suscipit saepe eum repudiandae. Aut ducimus architecto rerum sapiente. Non numquam rem fugit quibusdam omnis.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(181, 6, 'Ratione minus dolore ut dolorem harum.', 'Alias aut reprehenderit neque at et. Et eum dolorem fuga repudiandae quos qui.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(182, 4, 'Explicabo voluptatem ipsum ipsa aperiam.', 'Enim placeat ipsum amet blanditiis iusto est veritatis. Doloremque occaecati dolorem qui ut fugiat. Et fugit nisi rem ut non nobis.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(183, 10, 'Qui esse ea distinctio eveniet hic laudantium.', 'Possimus ex culpa numquam at aliquam. Est est quo culpa aspernatur corporis magni. Ipsa corporis dicta reiciendis facilis est. Optio repellat voluptatem occaecati non aut.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(184, 19, 'Consequatur qui voluptas consequatur sed sit aperiam ullam placeat.', 'In iusto vel eius placeat non doloremque. Sapiente nemo deserunt doloremque sint dolorem.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(185, 8, 'Harum totam eius quo eaque.', 'Recusandae est sint libero voluptas. Non eius quae impedit magni facilis.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(186, 6, 'Sit sint facere dolorem.', 'Quasi unde consequuntur ea animi. Laudantium molestiae aspernatur deserunt itaque at optio et. Distinctio hic molestias rerum. Sint fugit sunt ut et officia.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(187, 11, 'Ducimus aut et ab quia.', 'Quia est ullam deleniti deserunt velit aut incidunt. Molestias distinctio non rem itaque dolor. Ad molestias ut ipsam nihil. Debitis et consequatur veritatis.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(188, 25, 'Reiciendis repellat ea dignissimos possimus amet.', 'Exercitationem impedit qui et quidem dolorem. Nisi assumenda temporibus aut maiores officia rerum. Neque facilis officia ratione qui aut. Non minima et facere aut natus consectetur.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(189, 15, 'Et dicta incidunt animi impedit.', 'Est non expedita alias doloremque. Ad fuga consequuntur odio atque ab et. A qui eaque expedita. Iste itaque eum aliquid.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(190, 5, 'Velit perspiciatis commodi et rerum.', 'Iste ea optio aut. Molestiae magnam labore iste tempora laborum. Asperiores et fugiat qui rerum magnam officia. Aperiam dolor quidem fugit nam. Ut ut est totam nulla.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27');
INSERT INTO `tasks` (`id`, `user_id`, `name`, `description`, `priority`, `created_at`, `updated_at`) VALUES
(191, 24, 'Est et odio quas numquam.', 'Distinctio similique fugiat ex error. Veritatis non et sed ut consectetur labore molestias. Ea nesciunt aliquam ut ut fugiat eligendi. Eos numquam perspiciatis quia sed suscipit voluptates.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(192, 25, 'Et pariatur hic nemo cum.', 'Voluptatem qui ab tempore. Rerum omnis eum reiciendis dolor quia. Voluptatem adipisci voluptas dolores enim. Delectus voluptatem est voluptatum eos et.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(193, 17, 'Vel facilis consequatur recusandae laboriosam.', 'Labore iste possimus soluta dicta natus enim. Est doloribus distinctio illum quo sit iure eos et. Sint ut est eius ducimus. Aut et est et. Ab ducimus consequatur soluta assumenda modi magni voluptas.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(194, 16, 'Eveniet hic natus eos ipsa architecto.', 'Quo voluptatem enim numquam nam. Rerum aut quos provident dignissimos. Omnis voluptates rerum veritatis exercitationem quia. Dolores magnam odit magnam ut reprehenderit similique.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(195, 25, 'Eum itaque debitis aut quia aut nobis provident.', 'Molestiae quia possimus officiis. Eius earum sunt id tempore iste. Quia voluptatum excepturi quia iste ex sed.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(196, 5, 'Ipsam eveniet culpa quia fugiat non iure accusantium.', 'Qui molestiae cupiditate vitae molestias. Quo suscipit natus eum odit mollitia dolores. Ab nostrum aliquid architecto nihil ut harum facilis. Ratione molestiae rerum iure.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(197, 14, 'Cum et reprehenderit voluptatum laboriosam.', 'Voluptatum minima omnis qui vero enim voluptas. Molestiae deleniti dicta doloribus placeat aperiam. Nobis sit vel autem voluptatem minima.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(198, 14, 'Fuga recusandae aliquam totam est sunt debitis.', 'Animi quod alias debitis illum officiis animi. Odit ab minus inventore autem ut officiis velit. Et voluptate quo ipsam nulla eum. Beatae tenetur minus quidem et tenetur culpa.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(199, 18, 'Rerum et non provident velit perferendis exercitationem.', 'Temporibus blanditiis voluptatum incidunt nesciunt aut est voluptatibus. Voluptatem tenetur enim tempora quasi. Qui quia earum molestiae velit.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(200, 21, 'At ut nemo illum est quo quaerat.', 'Quam velit animi error quia et ullam neque. Sequi est officia tempore maiores beatae quae aliquam. Ex vel voluptatem ipsa aut commodi est provident.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(201, 5, 'Reprehenderit vero et qui culpa.', 'Eum asperiores facere velit neque qui quo voluptatum. Eos id fugiat et ipsa vitae. Accusamus ducimus ullam est cumque.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(202, 13, 'Explicabo cupiditate numquam occaecati atque provident vel impedit.', 'Rerum magni dignissimos corrupti eius sit et ducimus laboriosam. Atque nihil est voluptatem similique eveniet. Dolores consequuntur animi in ullam.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(203, 14, 'Est vel in velit in sunt voluptate ipsam.', 'Et accusamus consequatur et recusandae aut sequi ea dolorem. Illo cupiditate qui ea. Voluptatem voluptatem accusamus temporibus numquam magni a quae. Quaerat aliquam ex quo nostrum magnam.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(204, 8, 'Non odit iusto est expedita ipsam.', 'Enim veniam ab consequuntur sed beatae reprehenderit placeat sit. Itaque amet asperiores consectetur et corporis. Eum dolor fugit et quidem atque iure. Aut iste aut quisquam non.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(205, 15, 'Architecto tempora qui ea architecto repudiandae.', 'Qui rerum suscipit eos consequatur repellendus consequuntur veritatis. Nemo magni labore voluptatem sit. Unde ratione consequatur laborum quo aut. Sint aliquid et explicabo sed quis voluptatem.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(206, 13, 'Et aspernatur placeat repellendus ratione illo quibusdam.', 'Odit animi vel qui eius tempore veniam optio qui. Corporis suscipit dolore est quis sint adipisci qui. Optio corporis nihil modi ut et eum quidem.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(207, 24, 'Tempore earum iure et provident.', 'Officiis fugit et officia enim nesciunt. Qui laudantium ut est non omnis maxime ex iusto. Odit qui enim eveniet est non officia. Eveniet asperiores deserunt sunt temporibus laudantium delectus.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(208, 8, 'Tenetur enim aut qui quam assumenda quibusdam accusamus.', 'Voluptas ullam velit qui voluptas inventore. Voluptatibus voluptate ratione sit. Est vel amet dolor tempora deserunt velit. Quis exercitationem velit placeat est ex.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(209, 14, 'Aut sint sed voluptatum.', 'Molestiae error nihil amet aut reiciendis et. Voluptate dolorem error delectus optio aperiam consequatur dolores. Corporis provident nisi corporis explicabo ex.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(210, 23, 'Laboriosam aut eum aspernatur eius dolores.', 'Totam aliquam aliquid praesentium enim sint. Possimus dolor dolorem ex mollitia quia.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(211, 25, 'Consequatur et at quo esse.', 'Deleniti ut enim consequatur fuga omnis aliquam illum. Iusto quis tempore sunt et sed. Tenetur modi voluptatem quos dolorem. Voluptatem deleniti maiores eaque impedit nesciunt maiores maiores.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(212, 19, 'Nihil animi aut et exercitationem.', 'Adipisci et laboriosam vel est. Earum atque autem sed nihil velit facere eum. Omnis nihil labore sapiente reprehenderit soluta non. Amet eaque magni veritatis eveniet.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(213, 13, 'Eligendi dolorum necessitatibus magni a neque rerum.', 'Aut perspiciatis tempora cum quidem quis ex. Dolore aspernatur perferendis iste alias inventore et debitis magni. Quo optio vero ipsa dolor tenetur ut. Dicta beatae optio perferendis sapiente vero.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(214, 19, 'Totam ut illo sequi et nesciunt maxime et.', 'Quod dolorem ullam voluptatem eum illum. Delectus inventore est doloribus velit.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(215, 20, 'Nulla qui nam ut itaque aliquam nobis.', 'Atque veritatis laudantium quia error sed. Qui vel qui enim nihil facere nobis. Corrupti optio est quaerat. Aspernatur quos fuga qui sequi.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(216, 13, 'Fugit nesciunt aut aliquam ducimus.', 'Aut eum consequatur delectus velit. Nihil quos excepturi veritatis tempore.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(217, 22, 'At nisi molestias repudiandae sed eveniet consequatur qui.', 'Et repudiandae non inventore hic quis sunt. At quibusdam quis placeat nobis quis aut nihil. Aliquid ex eum distinctio a.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(218, 21, 'Qui nobis illo eos vitae.', 'Repellat libero ad minus non commodi et quam. Ea incidunt totam et voluptatem placeat debitis. Et molestiae ut ut qui dolor et mollitia eveniet. Et vel voluptate blanditiis blanditiis blanditiis.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(219, 4, 'Deserunt non aut quaerat est eos tempora consequatur.', 'Suscipit vel mollitia ipsam iste aut magnam. Voluptatem quaerat architecto vel aperiam fugiat omnis.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(220, 22, 'Possimus quidem aut consectetur et.', 'Et placeat et consequatur hic recusandae doloremque magnam. Excepturi aut soluta sint quos non quis voluptas. Rerum et ea qui ut nihil quisquam et. Sit rerum fuga et perferendis consequatur at.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(221, 25, 'Repudiandae excepturi consequatur quasi dolores.', 'Nihil quis sunt ea adipisci voluptatem accusamus quo. Vel praesentium placeat exercitationem est ea. Recusandae accusamus voluptatibus id assumenda.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(222, 17, 'Quidem perspiciatis inventore ut quia perspiciatis.', 'Libero impedit dolores quia soluta. Totam eveniet quod repellat a esse.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(223, 13, 'Et commodi ut ea consectetur ratione.', 'Sapiente tempora magnam asperiores quia occaecati. Nobis aut explicabo corporis. Officiis at qui inventore et deleniti fugit dicta.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(224, 8, 'Eum assumenda itaque quisquam deleniti similique accusamus ea.', 'Voluptatibus doloremque voluptatem fuga vero quia. Ea amet sint distinctio. Esse beatae vel aut aspernatur molestiae non ipsum.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(225, 14, 'Commodi sed nobis aut eius et.', 'Nostrum accusamus voluptates eos autem. Minus explicabo explicabo ut omnis. Dolorem delectus atque harum ipsam aperiam minima. Est velit quas dolores sed ut doloremque quaerat.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(226, 18, 'Nam qui praesentium unde molestias aperiam rerum quam.', 'Voluptatibus recusandae et voluptatum incidunt fugit quia dignissimos. Labore qui iste ea ipsam explicabo. Facere consequuntur asperiores ad ut asperiores architecto veritatis.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(227, 20, 'Et suscipit et laboriosam beatae.', 'Dolorum et ad et. Dolore reiciendis voluptatibus ad quia sapiente consequuntur placeat. Aliquid in quo modi placeat sint eos. Deserunt occaecati sed enim commodi.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(228, 20, 'Et odio ut cupiditate neque.', 'Autem veniam sed occaecati corrupti voluptates. Reiciendis aut deleniti recusandae sed ipsam. Nostrum omnis corporis a autem doloremque qui. Cupiditate quis excepturi id et.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(229, 14, 'Quos quia enim est nemo et.', 'Sapiente eos soluta itaque a ut. Quasi enim sint dignissimos. Odit dolorem nihil quisquam.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(230, 1, 'Quo debitis qui mollitia expedita quibusdam odio eos consequuntur.', 'Minus consequatur dolorem aliquid quibusdam laborum eum voluptas. Repellendus sapiente ea et et voluptatum quia officiis porro.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(231, 15, 'Similique quia rerum minima aut et.', 'Quidem quam repellat occaecati odit quia. Nihil nobis veniam et animi voluptatem minima quidem enim. Est dolor officia et ut. Velit eius blanditiis nemo veritatis vitae debitis at.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(232, 20, 'Tenetur provident et aut asperiores eaque in.', 'Dolores repudiandae eos non inventore. Et et iure officia distinctio. Et ipsam suscipit quis sunt iusto quas eos. Qui ab occaecati non ullam sequi provident sint odit.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(233, 1, 'Mollitia dolorum tempora beatae.', 'Temporibus magnam amet aut maxime occaecati corrupti. Fuga ipsum vel voluptas. Illum iusto rem quam ut eveniet optio. Inventore accusamus maiores qui ea est dolorum.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(234, 21, 'Aut qui nulla iure.', 'Praesentium provident rem expedita quod aut enim molestiae. Explicabo eum reiciendis voluptatem quibusdam hic. Necessitatibus repellat natus vel veritatis dicta accusantium quam.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(235, 17, 'Sed saepe expedita quo tempore.', 'Qui eaque veniam consequuntur sequi placeat non nemo. Rem ut voluptas expedita in. Adipisci veritatis dicta ipsa ea.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(236, 3, 'Eum culpa sint consectetur.', 'Ipsa voluptas consequuntur est odio vitae aut eligendi. Voluptatem ut aut praesentium quae beatae excepturi eum. Quaerat dolorem neque voluptas quo. Sit earum numquam eius dignissimos et animi optio.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(237, 6, 'Ullam impedit nihil tenetur et ex repudiandae et.', 'Ut vel voluptas dicta et et totam nobis earum. Neque cum nisi et velit maxime. Dolores et odit consequuntur quisquam. Inventore sit nisi velit impedit maxime.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(238, 1, 'Minima nulla deserunt deleniti velit.', 'Deserunt enim et ut quia. Ullam soluta commodi aut sapiente.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(239, 14, 'Saepe nostrum sequi aliquid nostrum corporis voluptas.', 'Voluptatem sit enim modi modi eos adipisci. Delectus et dignissimos qui laboriosam. Cumque rem vel libero ullam temporibus in.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(240, 12, 'Minima cupiditate voluptates quia ut.', 'Earum a impedit nulla. Cumque exercitationem inventore dolores et ratione quae ipsum similique. Molestiae autem eos beatae. Doloribus velit rerum quae quae harum et.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(241, 11, 'Voluptatem explicabo quidem labore qui culpa enim.', 'Repudiandae atque aut amet dolore. Inventore cupiditate consequatur aut.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(242, 14, 'Dignissimos qui et eligendi est autem.', 'Alias modi ipsam omnis dolorem quia non rerum. Quia eaque consequatur sit facilis. Omnis culpa minus dolores dolore voluptatem aut.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(243, 8, 'Et error in molestiae ut soluta illo omnis.', 'Dolor ab doloremque sunt. Nisi ad corporis dignissimos dolor impedit. Nihil sit fugit in quis ut.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(244, 20, 'Neque nisi architecto voluptatem repudiandae voluptatem accusamus animi.', 'Sapiente est iure ipsa dolor. Cumque exercitationem eveniet dolorem.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(245, 23, 'Omnis omnis consectetur odio voluptate ipsum laboriosam fugiat.', 'Maiores alias quas ut sed ut. Fugiat ratione impedit quo suscipit quia cum quasi. Reprehenderit est nihil eos quas velit. Dolore sit dolor fugiat nostrum dicta placeat.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(246, 19, 'Ullam debitis aut enim tempora.', 'Natus quaerat excepturi corrupti. Eaque ut sit suscipit inventore quasi quod nam. Ducimus sit praesentium aperiam veritatis laboriosam.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(247, 4, 'Totam suscipit doloribus non iste.', 'Et delectus eveniet possimus officiis nisi eum aspernatur qui. Ad illum earum explicabo eligendi. Nulla itaque aut dolorem vel. Voluptatibus blanditiis facere quisquam tenetur.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(248, 12, 'Vel illum velit eos voluptas debitis repellat.', 'Voluptates iure ratione aperiam repellat quidem. Natus quis nisi exercitationem harum enim dolorum. Aut sint officia illo qui. Molestiae quis ea cum aut et incidunt. Est tempore itaque voluptatum.', 'low', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(249, 25, 'Et aut qui ut omnis.', 'Harum praesentium rerum cum. Autem voluptatum quia voluptates consectetur nam. Expedita et et animi sit soluta.', 'mwdium', '2023-05-20 03:52:27', '2023-05-20 03:52:27'),
(250, 5, 'Enim nemo necessitatibus quasi corporis autem repellat.', 'Est laborum alias velit minus. Repudiandae aperiam et quia nihil quis et doloremque. Dolorum aut rerum accusamus voluptatum optio consequatur. In molestiae veritatis velit.', 'high', '2023-05-20 03:52:27', '2023-05-20 03:52:27');

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
(1, 'Bernard Botsford', 'charlie95@example.org', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fvMjCbHva1', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(2, 'Myrtle Collier', 'wcartwright@example.com', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TMGVhNrfqC', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(3, 'Aletha Reinger', 'hbeatty@example.com', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'X141xfBpft', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(4, 'Dallas Rodriguez', 'dubuque.janelle@example.com', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jlEMw01Slr', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(5, 'Mr. Chesley Rodriguez', 'niko.ortiz@example.org', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2dse3BzAPB', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(6, 'June Daniel', 'frances.robel@example.net', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tWXyfcNNml', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(7, 'Gregorio Grant V', 'isai.anderson@example.net', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GmkNncfqYE', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(8, 'Brando Hodkiewicz', 'cflatley@example.net', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zBOmP2JqfF', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(9, 'Nelda Mayert', 'bechtelar.dawson@example.com', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UFQDhB0cu5', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(10, 'Zaria Walker', 'kovacek.hilario@example.net', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XmoJ7foueY', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(11, 'Anais Hammes', 'claudia.thompson@example.com', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'J5DJYheGWm', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(12, 'Kelsi Schroeder PhD', 'phoppe@example.net', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JAWwXkWLS3', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(13, 'Jarret Johnston', 'alexzander.effertz@example.net', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'B2fUTRLhJZ', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(14, 'Mr. Gennaro Haley', 'evan51@example.org', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wgdKEr0M1w', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(15, 'Brennan Hudson III', 'colt64@example.com', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FBP71Efoec', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(16, 'Hermann Raynor', 'walker.austen@example.net', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FpyI6CFAt8', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(17, 'Rylan Smith', 'ebruen@example.org', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dqpKL9iAF3', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(18, 'Nannie Langworth', 'brandi52@example.com', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XoQBBJ8vq0', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(19, 'Janice Braun', 'bergnaum.jaylan@example.net', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yTFsIoxAQd', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(20, 'Darron Willms', 'bwest@example.org', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2gHdUTCNiw', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(21, 'Rubie Raynor', 'gabernathy@example.org', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CIy3vGciLw', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(22, 'Syble Tremblay', 'leopoldo.ullrich@example.org', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ChyKmKuVwy', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(23, 'Dr. Jodie Frami V', 'pacocha.granville@example.net', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'URCwHeTkZ2', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(24, 'Lilyan Collier MD', 'xmcclure@example.com', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'K7UY0QfuAx', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(25, 'Lavada Okuneva IV', 'armand28@example.com', '2023-05-20 03:52:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kgS8Bnqn7J', '2023-05-20 03:52:24', '2023-05-20 03:52:24'),
(26, 'Mhd Afifan Aly Rahman Saragih', 'sm.afifanaly@gmail.com', NULL, '$2y$10$AWHV2TxEP3nUAIhcfRodD.D.VnVv7xgc87PVPwl5fq39Vmm46dnOu', NULL, '2023-05-20 03:53:35', '2023-05-20 03:53:35');

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
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

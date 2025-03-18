-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 21, 2024 at 04:19 AM
-- Server version: 8.0.40-0ubuntu0.22.04.1
-- PHP Version: 8.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dev_dbnasho2`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` int NOT NULL,
  `option` json NOT NULL,
  `phase` int NOT NULL,
  `kategori_materi_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int DEFAULT NULL,
  `answer_key` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `title`, `question`, `point`, `option`, `phase`, `kategori_materi_id`, `batch`, `answer_key`, `created_at`, `updated_at`) VALUES
('04607aa8-bb51-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Harf apa saja yang masuk pada isim dan fi’il ....', 10, '[{\"key\": \"A\", \"value\": \"Harf Athaf\"}, {\"key\": \"B\", \"value\": \"Wawul hal\"}, {\"key\": \"C\", \"value\": \"Wawul qosam\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('04608f5e-bb51-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Berikut ini merupakan contoh dari jumlah ismiyyah yang terdiri dari Isim jamak mudzakkar salim', 10, '[{\"key\": \"A\", \"value\": \" الأُسْتَاذُ جَمِيْلٌ\"}, {\"key\": \"B\", \"value\": \" ذَلِكَ فَصْلٌ\"}, {\"key\": \"C\", \"value\": \" المُدَرِّسُوْنَ مَاهِرُوْنَ\"}, {\"key\": \"D\", \"value\": \" تِلكَ مَدْرَسَةٌ\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('0460a388-bb51-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Apa yang berfungsi sebagai Mubtada\' dalam Jumlah Ismiyyah?', 10, '[{\"key\": \"A\", \"value\": \"Isim yang terletak di awal kalimat dan menjadi subyek  \"}, {\"key\": \"B\", \"value\": \"Kata yang menerangkan subyek  \"}, {\"key\": \"C\", \"value\": \"Kata yang terletak di akhir kalimat  \"}, {\"key\": \"D\", \"value\": \"Kata yang menghubungkan kalimat  \"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('0460b193-bb51-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Manakah contoh yang benar dari I’rob nashob pada isim jamak Mudzakkar salim', 10, '[{\"key\": \"A\", \"value\": \" صَالِحُوْنَ\"}, {\"key\": \"B\", \"value\": \" صَالِحٌ\"}, {\"key\": \"C\", \"value\": \" صَالِحَاتُ\"}, {\"key\": \"D\", \"value\": \" صَالِحِيْنَ\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('0460bde4-bb51-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Penerapan I’rob rofa’ pada jama’ mudzakkar salim adalah menggunakan…', 10, '[{\"key\": \"A\", \"value\": \"Alif\"}, {\"key\": \"B\", \"value\": \"Wawu\"}, {\"key\": \"C\", \"value\": \"Fathah\"}, {\"key\": \"D\", \"value\": \"Dhommah\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('0460c8f0-bb51-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Bagaimana keadaan suatu kata jika dimasuki oleh Inna dan saudari-saudarinya', 10, '[{\"key\": \"A\", \"value\": \"Khobar inna irobnya menjadi nashob\"}, {\"key\": \"B\", \"value\": \"Isim inna irobnya menjadi nashob\"}, {\"key\": \"C\", \"value\": \"Isim inna irobnya menjadi Jarr\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('0460d97f-bb51-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Pilihlah kata yang sesuai dengan kalimat berikut, “ كَأَنَّ........ عَاقِلٌ”', 10, '[{\"key\": \"A\", \"value\": \" المَسْجِدُُ\"}, {\"key\": \"B\", \"value\": \" الكِتَابُ\"}, {\"key\": \"C\", \"value\": \" يَضْرِبُ\"}, {\"key\": \"D\", \"value\": \" الطَّالِبَ\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('0460e48c-bb51-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Manakah saudari Kaana yang tidak menunjukkan waktu', 10, '[{\"key\": \"A\", \"value\": \"  أَصْبَحَ\"}, {\"key\": \"B\", \"value\": \" أَضْحَى\"}, {\"key\": \"C\", \"value\": \" أمْسَى\"}, {\"key\": \"D\", \"value\": \" صَار\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('0460fa87-bb51-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Berikut merupakan ciri-ciri dari fi’il mudhari’, kecuali …..', 10, '[{\"key\": \"A\", \"value\": \"Pasti dimulai dengan salah satu huruf mudhoro’ah ( أ - ن - ي - ت )\"}, {\"key\": \"B\", \"value\": \"Huruf sin ( س ) artinya sebentar lagi. Menunjukkan waktu sedang atau yang akan datang.\"}, {\"key\": \"C\", \"value\": \"Huruf saufa ( سوف ) artinya agar/supaya/kelak. Menunjukkan waktu yang akan datang tetapi lebih lama.\"}, {\"key\": \"D\", \"value\": \"Didahului huruf “قَدْ ”\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('046106f0-bb51-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Berikut merupakan contoh dari fi’il nahyi', 10, '[{\"key\": \"A\", \"value\": \" لَا تَضْرِبْ\"}, {\"key\": \"B\", \"value\": \" لاَ يَجْلِسُ\"}, {\"key\": \"C\", \"value\": \" جَلَسَ\"}, {\"key\": \"D\", \"value\": \" اُكْتُبْ\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('22626eac-bd7a-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Pola atau acuan atau rumus disebut dengan?', 10, '[{\"key\": \"A\", \"value\": \"Mauzun\"}, {\"key\": \"B\", \"value\": \"Wazan\"}, {\"key\": \"C\", \"value\": \"Tashrif\"}, {\"key\": \"D\", \"value\": \"Samaiy\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('226284e0-bd7a-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Kata yang mengikuti pola tertentu disebut?', 10, '[{\"key\": \"A\", \"value\": \"Wazan\"}, {\"key\": \"B\", \"value\": \"Mauzun\"}, {\"key\": \"C\", \"value\": \"Tashrif\"}, {\"key\": \"D\", \"value\": \"Qiyasiy\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('22629889-bd7a-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Kata kerja perintah dalam Bahasa Arab disebut?', 10, '[{\"key\": \"A\", \"value\": \"makanan_isim\"}, {\"key\": \"B\", \"value\": \"makanan_isim2\"}, {\"key\": \"C\", \"value\": \"makanan_isim3\"}, {\"key\": \"D\", \"value\": \"makanan_isim4\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('2262a85f-bd7a-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Ada berapa jenis tsulatsy mazid', 10, '[{\"key\": \"A\", \"value\": \"1\"}, {\"key\": \"B\", \"value\": \"2\"}, {\"key\": \"C\", \"value\": \"3\"}, {\"key\": \"D\", \"value\": \"4\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('2262b7fb-bd7a-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Hamzah pada fi’il amr untuk semua wazan merupakan hamzah', 10, '[{\"key\": \"A\", \"value\": \"Washl\"}, {\"key\": \"B\", \"value\": \"Qathi\"}, {\"key\": \"C\", \"value\": \"Alif\"}, {\"key\": \"D\", \"value\": \"Mamdudah\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('2262c2ea-bd7a-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Perubahan suatu kata berdasarkan jenis dan jumlah subjek atau pelakunya disebut dengan?', 10, '[{\"key\": \"A\", \"value\": \"Tashrif Lughawi\"}, {\"key\": \"B\", \"value\": \"Tashrif Ishtilahi\"}, {\"key\": \"C\", \"value\": \"Tashrif Qiyasiy\"}, {\"key\": \"D\", \"value\": \"Tashrif Samaiy\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('2262cd17-bd7a-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Kapan tashrif lughawi fi’il madhy memiliki huruf tambahan نَا ketika diawali dhamir?', 10, '[{\"key\": \"A\", \"value\": \"أَنْتَ\"}, {\"key\": \"B\", \"value\": \"أَنَا\"}, {\"key\": \"C\", \"value\": \"أَنْتُمْ\"}, {\"key\": \"D\", \"value\": \"نَحْنُ\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('2262e2a4-bd7a-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Berikut ini yang termasul fi\'il tsulatsy mazid dengan huruf tambahan 3 huruf, kecuali..', 10, '[{\"key\": \"A\", \"value\": \"اسْتَفْهَمَ\"}, {\"key\": \"B\", \"value\": \"أَجْلَسَ\"}, {\"key\": \"C\", \"value\": \"نَظَّمَ\"}, {\"key\": \"D\", \"value\": \"اِفْعَا\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('2262f816-bd7a-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Berikut ini yang termasul fi\'il tsulatsy mazid dengan huruf tambahan 3 huruf, kecuali..', 10, '[{\"key\": \"A\", \"value\": \"عَلَّمَ\"}, {\"key\": \"B\", \"value\": \"سَلْسَلَ\"}, {\"key\": \"C\", \"value\": \"اِسْتَفْهَمَ\"}, {\"key\": \"D\", \"value\": \"أَعْلَنَ\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('22630728-bd7a-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Manakah yang merupakan tasrif lughawi isim fail dari rubaiy mazid 1 huruf dengan dhamir “هُوَ”', 10, '[{\"key\": \"A\", \"value\": \"تَدَحْرَجَ\"}, {\"key\": \"B\", \"value\": \"نَاصِرٌ\"}, {\"key\": \"C\", \"value\": \"مُسْتَعْمِلٌ\"}, {\"key\": \"D\", \"value\": \"مُتَدَحْرِجٌ\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('31140a13-bd78-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Ilmu yang mempelajari perubahan kata dari satu bentuk ke bentuk lainnya dinamakan dengan ilmu?', 10, '[{\"key\": \"A\", \"value\": \"Nahwu\"}, {\"key\": \"B\", \"value\": \"Sharaf\"}, {\"key\": \"C\", \"value\": \"Balaghah\"}, {\"key\": \"D\", \"value\": \"Imla\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('31142210-bd78-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Perubahan kata حَامِدٌ menjadi حَامِدُوْن حَامِدَانِ  dan seterusnya disebut dengan?', 10, '[{\"key\": \"A\", \"value\": \"Tashrif Lughawi\"}, {\"key\": \"B\", \"value\": \"Tashrif Ishtilahiy\"}, {\"key\": \"C\", \"value\": \"Tashrif Qiyasiy\"}, {\"key\": \"D\", \"value\": \"Tashrif Samaiy\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('31143a56-bd78-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Apa makna dasar dari isim maf’ul?', 10, '[{\"key\": \"A\", \"value\": \"Yang melakukan sesuatu\"}, {\"key\": \"B\", \"value\": \"Yang dikenai perbuatan\"}, {\"key\": \"C\", \"value\": \"Kata perintah\"}, {\"key\": \"D\", \"value\": \"Kata benda\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('311455cf-bd78-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Kata kerja yang huruf penyusunnya 3 huruf disebut', 10, '[{\"key\": \"A\", \"value\": \"Tsulatsy\"}, {\"key\": \"B\", \"value\": \"Rubaiy\"}, {\"key\": \"C\", \"value\": \"Khumasiy\"}, {\"key\": \"D\", \"value\": \"Sudasiy\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('311475bb-bd78-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Isim maf’ul dari ذَهَبَ adalah', 10, '[{\"key\": \"A\", \"value\": \"مَذْهُوْبٌ\"}, {\"key\": \"B\", \"value\": \"مَهْذُوْبٌ\"}, {\"key\": \"C\", \"value\": \"مَبْهُوْذ\"}, {\"key\": \"D\", \"value\": \"Tidak ada\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('311487e4-bd78-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Tashrif Lughawi dibagi menjadi berapa', 10, '[{\"key\": \"A\", \"value\": \"1\"}, {\"key\": \"B\", \"value\": \"2\"}, {\"key\": \"C\", \"value\": \"3\"}, {\"key\": \"D\", \"value\": \"4\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('311493e0-bd78-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Tashrif Lughawi bentuk isim mencakup apa saja?', 10, '[{\"key\": \"A\", \"value\": \"Isim fail dan isim maful\"}, {\"key\": \"B\", \"value\": \"Isim makan dan isim zaman\"}, {\"key\": \"C\", \"value\": \"Harf\"}, {\"key\": \"D\", \"value\": \"Isim isyarah\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('3114a0e0-bd78-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Ada berapa jumlah dhamir untuk fi’il madhi dan dan fi’il mudhari’ ada berapa?', 10, '[{\"key\": \"A\", \"value\": \"6 dhamir\"}, {\"key\": \"B\", \"value\": \"10 dhamir\"}, {\"key\": \"C\", \"value\": \"15 dhamir\"}, {\"key\": \"D\", \"value\": \"14 dhamir\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('3114b210-bd78-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Berikut merupakan salah satu ciri fi’il mudhari’, kecuali..', 10, '[{\"key\": \"A\", \"value\": \"Alif\"}, {\"key\": \"B\", \"value\": \"Nun\"}, {\"key\": \"C\", \"value\": \"Ya\"}, {\"key\": \"D\", \"value\": \"Ba\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('3114c140-bd78-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Huruf tambahan dari tasrif lughawi fi’il madhi dhamir “أَنَا”', 10, '[{\"key\": \"A\", \"value\": \"Ta bersukun\"}, {\"key\": \"B\", \"value\": \"Ta berfathah\"}, {\"key\": \"C\", \"value\": \"Ta berkasrah\"}, {\"key\": \"D\", \"value\": \"Ta berdommah\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('6256c841-bb4b-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Apa yang dimaksud dengan الْكَلِمَةُ ?', 10, '[{\"key\": \"A\", \"value\": \"Kata\"}, {\"key\": \"B\", \"value\": \"Kalimat\"}, {\"key\": \"C\", \"value\": \"Kata kerja\"}, {\"key\": \"D\", \"value\": \"Kata Perintah\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('6256d8a8-bb4b-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Isim Muannats (إِسْمُ الْمُؤَنَّثُ) adalah kata benda yang menunjukkan kepada ....', 10, '[{\"key\": \"A\", \"value\": \"Satu benda\"}, {\"key\": \"B\", \"value\": \"Laki-laki\"}, {\"key\": \"C\", \"value\": \"Dua benda\"}, {\"key\": \"D\", \"value\": \"Perempuan\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('6256e5b4-bb4b-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Berikut ini adalah pembagian isim berdasarkan kuantitasnya..', 10, '[{\"key\": \"A\", \"value\": \" مُفْرَدٌ\"}, {\"key\": \"B\", \"value\": \" مُثَنَّى\"}, {\"key\": \"C\", \"value\": \" جَمْعٌ\"}, {\"key\": \"D\", \"value\": \" Semua benar\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('6256f9a2-bb4b-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Jika isim maushul berbentuk mufrod muannats maka menggunakan…', 10, '[{\"key\": \"A\", \"value\": \" الَّذِيْ\"}, {\"key\": \"B\", \"value\": \" الَّتِيْ\"}, {\"key\": \"C\", \"value\": \" الَّذَانِ\"}, {\"key\": \"D\", \"value\": \" الَّتَانِ\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('62570bc9-bb4b-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Berikut merupakan contoh dari isim isyarah untuk menunjuk yang jauh adalah..', 10, '[{\"key\": \"A\", \"value\": \" هَذَا\"}, {\"key\": \"B\", \"value\": \" ذَلِكَ\"}, {\"key\": \"C\", \"value\": \" هُنَاكَ\"}, {\"key\": \"D\", \"value\": \" Semua benar\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('625718fc-bb4b-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Manakah yang termasuk dalam isim ma’rifah yang menggunakan Isim dhomir muttasil?', 10, '[{\"key\": \"A\", \"value\": \" أَنْتَ\"}, {\"key\": \"B\", \"value\": \" هُنَاكَ\"}, {\"key\": \"C\", \"value\": \" الْكِتَابُ\"}, {\"key\": \"D\", \"value\": \" قَلَمُكَ\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('625729d8-bb4b-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Apa fungsi utama Dhomir Muttashil dalam kalimat?', 10, '[{\"key\": \"A\", \"value\": \"Menunjukkan subyek atau pelaku\"}, {\"key\": \"B\", \"value\": \"Menunjukkan kepemilikan\"}, {\"key\": \"C\", \"value\": \"Menunjukkan lokasi  \"}, {\"key\": \"D\", \"value\": \"Menunjukkan objek\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('6257391e-bb4b-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Manakah pernyataan berikut yang benar mengenai syarat aturan Mudhof Ilaihi?', 10, '[{\"key\": \"A\", \"value\": \"Mudhof Ilaihi tidak boleh mengandung alif lam\"}, {\"key\": \"B\", \"value\": \"Huruf terakhir isim Mudhof Ilaihi harus berharakat kasroh\"}, {\"key\": \"C\", \"value\": \"Mudhof Ilaihi tidak boleh di-tanwin\"}, {\"key\": \"D\", \"value\": \"Mudhof Ilaihi selalu menggunakan nun mutsanna\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('6257446e-bb4b-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Berikut merupakan contoh dari isim idhofat untuk mudhof mutsanna..', 10, '[{\"key\": \"A\", \"value\": \" أَحْمَدُ قَائِمٌ\"}, {\"key\": \"B\", \"value\": \" أَحْمَدُ يَجْلِسُ عَلَى الكُرْسِيِّ\"}, {\"key\": \"C\", \"value\": \" مُسْلِمَا الإِنْدُوْنِسِيَّا\"}, {\"key\": \"D\", \"value\": \" غُلَامُ زَيْد\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('62575798-bb4b-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Tentukan sifat pada kalimat berikut\r\nالْوَلَدُ الصَّالِحُ يَذْهَبُ إِلَى المَسْجِدِ', 10, '[{\"key\": \"A\", \"value\": \" الْوَلَدُ\"}, {\"key\": \"B\", \"value\": \"  الصَّالِحُ\"}, {\"key\": \"C\", \"value\": \" يَذْهَبُ\"}, {\"key\": \"D\", \"value\": \" إِلَى المَسْجِد\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('78ea4cf2-bb4f-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Contoh dari syibhul jumlah yang berupa huruf jar adalah ….', 10, '[{\"key\": \"A\", \"value\": \" الزَّيْدَانِ قَائِمَانِ\"}, {\"key\": \"B\", \"value\": \" الجَوَّالُ عَلَى المَكْتَبِ\"}, {\"key\": \"C\", \"value\": \" زَيْدٌ قَائِمٌ\"}, {\"key\": \"D\", \"value\": \" مُدَرَّسُوْنَ قَائِمُوْنَ\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('78ea640b-bb4f-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Berikut merupakan harf atof, kecuali..', 10, '[{\"key\": \"A\", \"value\": \" أَمْ\"}, {\"key\": \"B\", \"value\": \" ثُمَّ\"}, {\"key\": \"C\", \"value\": \" كَمْ\"}, {\"key\": \"D\", \"value\": \" فَ\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('78ea706c-bb4f-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Apa yang dimaksud jumlah Ismiyyah?', 10, '[{\"key\": \"A\", \"value\": \"Kalimat yang dimulai dengan kata kerja (fi’il)\"}, {\"key\": \"B\", \"value\": \"Kalimat yang dimulai dengan harf jar\"}, {\"key\": \"C\", \"value\": \"Kalimat yang dimulai dengan isim\"}, {\"key\": \"D\", \"value\": \"Kalimat yang dimulai dengan kata keterangan\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('78ea7ea4-bb4f-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Berikut merupakan contoh dari jumlah fi’liyyah', 10, '[{\"key\": \"A\", \"value\": \" الطَّالِبُ مَاهِرٌ\"}, {\"key\": \"B\", \"value\": \" هُنَاكَ مَسْجِدٌ\"}, {\"key\": \"C\", \"value\": \" ذَلِكَ أُسْتَاذٌ\"}, {\"key\": \"D\", \"value\": \" قَرَأَتْ مَرْيَمُ القُرْآنَ\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('78ea9121-bb4f-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Kapan kondisi I’rob rofa’ pada isim?', 10, '[{\"key\": \"A\", \"value\": \"Mubtada - khobar pada jumlah Ismiyyah\"}, {\"key\": \"B\", \"value\": \"Isim kana dan saudari-saudarinya serta khobar Inna dan saudari-saudarinya\"}, {\"key\": \"C\", \"value\": \"Fail pada jumlah filiyyah\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('78ea9c80-bb4f-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Berikut merupakan contoh Irob rofa’ pada isim mutsanna adalah', 10, '[{\"key\": \"A\", \"value\": \" مُسْلِمٌ\"}, {\"key\": \"B\", \"value\": \" مُسْلِمَانِ\"}, {\"key\": \"C\", \"value\": \" مُسْلِمَيْنِ\"}, {\"key\": \"D\", \"value\": \" مُسْلِمُوْنَ\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('78eaae05-bb4f-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Apakah fungsi dari Inna?', 10, '[{\"key\": \"A\", \"value\": \"Penjelasan\"}, {\"key\": \"B\", \"value\": \"Penegas\"}, {\"key\": \"C\", \"value\": \"Keterangan\"}, {\"key\": \"D\", \"value\": \"Kata tunjuk\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('78eab915-bb4f-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Manakah dari contoh berikut yang bukan termasuk saudari-saudari Kaana?', 10, '[{\"key\": \"A\", \"value\": \" لَيْشَ\"}, {\"key\": \"B\", \"value\": \" أَمْسَى\"}, {\"key\": \"C\", \"value\": \" ظَلَّ\"}, {\"key\": \"D\", \"value\": \" لَعَلَّ\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('78eac3ce-bb4f-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Fi’il adalah kata kerja yang menunjukkan perbuatan yang dilakukan pada waktu tertentu. Fi’il dibagi menjadi?', 10, '[{\"key\": \"A\", \"value\": \"Fiil Madhi dan Fiil Mudhari\"}, {\"key\": \"B\", \"value\": \" Fiil Madhi, Fiil Mudhari, Fiil Nahy dan Fiil Amr\"}, {\"key\": \"C\", \"value\": \"Fiil Mudhari, Fiil Amr dan Fiil Madhi\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('78eacf37-bb4f-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Bentuk fi’il amri dari kata “جَلَسَ - يَجْلِسُ” adalah', 10, '[{\"key\": \"A\", \"value\": \" أَجْلِسُ\"}, {\"key\": \"B\", \"value\": \" يَجْلِسُ\"}, {\"key\": \"C\", \"value\": \" اِجْلَسْ\"}, {\"key\": \"D\", \"value\": \" اِجْلِسْ\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('99748b69-bb52-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Manakah yang merupakan “Kata Kerja” (Predikat) dalam contoh berikut: قَرَأَ إِبْرَاهِيْمُ الْكِتَابَ?', 10, '[{\"key\": \"A\", \"value\": \" إِبْرَاهِيْمُ\"}, {\"key\": \"B\", \"value\": \" الْكِتَابَ \"}, {\"key\": \"C\", \"value\": \" قَرَأَ \"}, {\"key\": \"D\", \"value\": \"Semua jawaban benar \"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('9974a1aa-bb52-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Apa yang dimaksud dengan Jumlah Ismiyyah?', 10, '[{\"key\": \"A\", \"value\": \"Kalimat yang dimulai dengan fi\'il\"}, {\"key\": \"B\", \"value\": \"Kalimat yang dimulai dengan isim\"}, {\"key\": \"C\", \"value\": \"Kalimat yang tidak memiliki makna  \"}, {\"key\": \"D\", \"value\": \"Kalimat yang hanya terdiri dari satu kata\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('9974b585-bb52-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Bagaimana i’rob dari isim yang berfungsi sebagai maf’ul bih (obyek) dalam kalimat?', 10, '[{\"key\": \"A\", \"value\": \"Rofa dengan dhommah\"}, {\"key\": \"B\", \"value\": \"Nashob dengan fathah\"}, {\"key\": \"C\", \"value\": \"Jar dengan kasroh\"}, {\"key\": \"D\", \"value\": \"Mabni dengan sukun\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('9974c2fc-bb52-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Apa makna dari إِنَّ  dalam sebuah kalimat?', 10, '[{\"key\": \"A\", \"value\": \"Tetapi\"}, {\"key\": \"B\", \"value\": \"Sesungguhnya\"}, {\"key\": \"C\", \"value\": \"Seakan-akan\"}, {\"key\": \"D\", \"value\": \"Semoga\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('9974d0f2-bb52-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Pilihlah khobar inna dari kalimat berikut: إِنَّ الصَّلاَةَ مَفْرُوْضَةٌ عَلَى الْمُسْلِمِيْنَ.', 10, '[{\"key\": \"A\", \"value\": \" إِنَّ\"}, {\"key\": \"B\", \"value\": \" الصَّلاَةَ\"}, {\"key\": \"C\", \"value\": \" مَفْرُوْضَةٌ\"}, {\"key\": \"D\", \"value\": \" عَلَى\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('9974e24d-bb52-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Saudari Kaana “لَيْسَ” digunakan untuk menyatakan?', 10, '[{\"key\": \"A\", \"value\": \"Waktu tertentu\"}, {\"key\": \"B\", \"value\": \"Penegasan\"}, {\"key\": \"C\", \"value\": \"Peniadaan\"}, {\"key\": \"D\", \"value\": \"Perubahan keadaan\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('9974ee12-bb52-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Apa yang terjadi pada khobar kaana dalam kalimat berikut?\r\n”كَانَ البَيْتُ نَظِيفًا”\r\n', 10, '[{\"key\": \"A\", \"value\": \"Irabnya rafa\"}, {\"key\": \"B\", \"value\": \"Irabnya jar\"}, {\"key\": \"C\", \"value\": \"Irabnya nashob\"}, {\"key\": \"D\", \"value\": \"Tidak berubah\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('99750029-bb52-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Manakah ciri berikut yang bukan termasuk ciri Fi’il Madhi?', 10, '[{\"key\": \"A\", \"value\": \"Menunjukkan perbuatan di masa lampau\"}, {\"key\": \"B\", \"value\": \"Biasanya berakhiran fathah\"}, {\"key\": \"C\", \"value\": \"Didahului oleh huruf mudhari’ah (أ - ن - ي - ت)\"}, {\"key\": \"D\", \"value\": \"Dapat diakhiri Ta Tanits\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('99750bc2-bb52-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Manakah kalimat berikut yang menunjukkan contoh Fi’il Mudhari’?', 10, '[{\"key\": \"A\", \"value\": \" يَكْتُبُ الطَّالِبُ دَرْسَهُ\"}, {\"key\": \"B\", \"value\": \" كَتَبَ الطَّالِبُ دَرْسَهُ\"}, {\"key\": \"C\", \"value\": \" الطَّالِبُ كَاتِبٌ\"}, {\"key\": \"D\", \"value\": \" الطَّالِبُ فِى الْفَصْلِ\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('99751d29-bb52-11ef-8196-00163e047c76', 'UJIAN AKHIR', 'Manakah bentuk yang benar dari Fi’il Nahyi?', 10, '[{\"key\": \"A\", \"value\": \" لاَ تَفْتَحْ\"}, {\"key\": \"B\", \"value\": \" اُفْتَحْ\"}, {\"key\": \"C\", \"value\": \" يَفْتَحُ\"}, {\"key\": \"D\", \"value\": \" فَتَحَ\"}]', 2, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('b8511cd9-bb48-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Berikut ini adalah macam - macam dari kata ( أنواع الكلمة ), kecuali..', 10, '[{\"key\": \"A\", \"value\": \"إسم \"}, {\"key\": \"B\", \"value\": \"جملة\"}, {\"key\": \"C\", \"value\": \"فعل \"}, {\"key\": \"D\", \"value\": \"حرف \"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('b85130f2-bb48-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Berikut ini yang termasuk contoh Isim Mudzakkar (إِسْمُ الْمُذَكَّرُ) adalah ....', 10, '[{\"key\": \"A\", \"value\": \" كِتَابٌ\"}, {\"key\": \"B\", \"value\": \" الْشَمْسُ\"}, {\"key\": \"C\", \"value\": \" سَبُّوْرَةٌ\"}, {\"key\": \"D\", \"value\": \" مَرْيَم\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('b8513e2c-bb48-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Isim mutsanna menunjukkan bilangan benda sebanyak?', 10, '[{\"key\": \"A\", \"value\": \"Tunggal\"}, {\"key\": \"B\", \"value\": \"Dua\"}, {\"key\": \"C\", \"value\": \"Lebih dari dua\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('b85150e4-bb48-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Jika isim maushul berbentuk mufrod mudzakkar maka menggunakan…', 10, '[{\"key\": \"A\", \"value\": \" الَّذِيْ\"}, {\"key\": \"B\", \"value\": \" الَّتِيْ\"}, {\"key\": \"C\", \"value\": \" الَّذِيْنَ\"}, {\"key\": \"D\", \"value\": \" اللَّاتِي\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('b8515cb4-bb48-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Berikut merupakan contoh dari isim isyarah untuk menunjuk lokasi adalah ..', 10, '[{\"key\": \"A\", \"value\": \" هَذَا\"}, {\"key\": \"B\", \"value\": \" ذَلِكَ\"}, {\"key\": \"C\", \"value\": \" هُنَاكَ\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('b8516762-bb48-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Pilihlah contoh berikut yang termasuk Isim ma’rifah', 10, '[{\"key\": \"A\", \"value\": \" كِتَابٌ\"}, {\"key\": \"B\", \"value\": \" الْكِتَابُ\"}, {\"key\": \"C\", \"value\": \" قَلَمٌ\"}, {\"key\": \"D\", \"value\": \" شَجَرَة\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('b85171d0-bb48-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Apa yang dimaksud dengan dhomir muttasil', 10, '[{\"key\": \"A\", \"value\": \"Kata ganti yang ditulis terpisah dengan kata lain\"}, {\"key\": \"B\", \"value\": \"Kata ganti yang ditulis bersambung dengan kata lain\"}, {\"key\": \"C\", \"value\": \"Kata ganti berjumlah tunggal\"}, {\"key\": \"D\", \"value\": \"Kata ganti berjumlah lebih dari dua\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('b85181ef-bb48-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Berikut merupakan contoh dari dhomir munfasil, kecuali', 10, '[{\"key\": \"A\", \"value\": \" قَلَمُكَ\"}, {\"key\": \"B\", \"value\": \" هُوَ أُسْتَاذٌ\"}, {\"key\": \"C\", \"value\": \" هُمًا طًالِبَانِ\"}, {\"key\": \"D\", \"value\": \" زَيْدٌ نَائِمٌ\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('b8518cd6-bb48-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Berikut syarat aturan mudhof..', 10, '[{\"key\": \"A\", \"value\": \"Boleh di-tanwin\"}, {\"key\": \"B\", \"value\": \"Tidak boleh tanwin\"}, {\"key\": \"C\", \"value\": \"Mengandung alif lam\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('b8519cc5-bb48-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Dalam kalimat \"طَالِبٌ جَدِيْدٌ,\" kata \"جَدِيْدٌ\" berfungsi sebagai?', 10, '[{\"key\": \"A\", \"value\": \"Maushuf\"}, {\"key\": \"B\", \"value\": \"Mudhof\"}, {\"key\": \"C\", \"value\": \"Sifat\"}, {\"key\": \"D\", \"value\": \"Isim Ma’rifah\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('bf0e8fc5-bb4d-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Isim (الْإِسْمُ) adalah kata yang menunjukan kepada ....', 10, '[{\"key\": \"A\", \"value\": \"Benda hidup dan Benda Mati\"}, {\"key\": \"B\", \"value\": \"Kata Kerja\"}, {\"key\": \"C\", \"value\": \"Kata bantu\"}, {\"key\": \"D\", \"value\": \"Kata sambung\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('bf0e9f6b-bb4d-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Manakah di antara berikut ini yang merupakan contoh “Isim Muannats”?', 10, '[{\"key\": \"A\", \"value\": \" أَحْمَدُ  \"}, {\"key\": \"B\", \"value\": \" يُوْسُفُ  \"}, {\"key\": \"C\", \"value\": \" فَاطِمَةُ  \"}, {\"key\": \"D\", \"value\": \" زَيْدُ  \"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('bf0eb1a7-bb4d-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Isim Jamak menunjukkan bilangan benda sebanyak?', 10, '[{\"key\": \"A\", \"value\": \"Tunggal\"}, {\"key\": \"B\", \"value\": \"Dua\"}, {\"key\": \"C\", \"value\": \"Lebih dari dua\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('bf0ec7b5-bb4d-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Apa kedudukan الَّذَانِ dalam kalimat “جَاءَ الطَّالِبَانِ الَّذَانِ يَدْرُسَانِ الشَّرِيْعَةَ”?', 10, '[{\"key\": \"A\", \"value\": \"Isim Isyarah\"}, {\"key\": \"B\", \"value\": \"Isim Maushul yang menunjukkan dua orang\"}, {\"key\": \"C\", \"value\": \"Sifat untuk kata sebelumnya\"}, {\"key\": \"D\", \"value\": \"Keterangan waktu\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('bf0ed6d4-bb4d-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Manakah contoh berikut yang merupakan isim isyarah untuk Jamak?', 10, '[{\"key\": \"A\", \"value\": \" هُنَاكَ مَسْجِدٌ\"}, {\"key\": \"B\", \"value\": \" هَتاَنِ قَلَمَانِ\"}, {\"key\": \"C\", \"value\": \" هَوُلاَءِ مُسْلِمُوْنَ\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('bf0ee234-bb4d-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Apa yang dimaksud dengan Isim Nakirah?', 10, '[{\"key\": \"A\", \"value\": \"Kata yang khusus menunjukan benda tertentu\"}, {\"key\": \"B\", \"value\": \"Kata yang bersifat umum dan belum jelas pengertiannya\"}, {\"key\": \"C\", \"value\": \"Kata yang digunakan untuk menunjukkan lokasi\"}, {\"key\": \"D\", \"value\": \"Kata yang diawali huruf alif dan lam (ال)\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'b', NULL, NULL),
('bf0ef75f-bb4d-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Manakah dari contoh berikut ini yang merupakan Dhomir Munfashil?', 10, '[{\"key\": \"A\", \"value\": \" هُوَ  \"}, {\"key\": \"B\", \"value\": \" قَلَمِي  \"}, {\"key\": \"C\", \"value\": \" كِتَابُهُ  \"}, {\"key\": \"D\", \"value\": \" رِسَالَتُكُمْ  \"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('bf0f040d-bb4d-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Berikut merupakan contoh dari isim idhofat untuk jamak..', 10, '[{\"key\": \"A\", \"value\": \" مُسْلِمُ الإِنْدُوْنِسِيَّا\"}, {\"key\": \"B\", \"value\": \" مُسْلِمَا الإِنْدُوْنِسِيَّا\"}, {\"key\": \"C\", \"value\": \" مُسْلِمُو الإِنْدُوْنِسِيَّا\"}, {\"key\": \"D\", \"value\": \" مُسْلِمَةُ الإِنْدُوْنِسِيَّا\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('bf0f132c-bb4d-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Pilihlah kata yg tepat agar terbentuk sifat maushuf pada kalimat berikut\r\n ______هَذِهِ مَدْرَسَةٌ ', 10, '[{\"key\": \"A\", \"value\": \" مَشْهُورٌ\"}, {\"key\": \"B\", \"value\": \" مشْهُوْرَةٌ\"}, {\"key\": \"C\", \"value\": \" مَشْهُورُوْنَ\"}, {\"key\": \"D\", \"value\": \" مَشْهُورَاتُ\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('bf0f1ee8-bb4d-11ef-8196-00163e047c76', 'UJIAN TENGAH SEMESTER', 'Mana yang menunjukkan Isim Maushuf yang berbentuk Jamak?ِ', 10, '[{\"key\": \"A\", \"value\": \" الطَّالِبُ جَدِيْدٌ ُ\"}, {\"key\": \"B\", \"value\": \" الطَّالِبَاتُ جَدِيْدَاتٌ ُ\"}, {\"key\": \"C\", \"value\": \"  طَالِبٌ جَدِيْدٌ َ\"}, {\"key\": \"D\", \"value\": \" فىِ الفَصْل\"}]', 1, 'c376e864-ba1e-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('e72b598d-bd7b-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Perubahan suatu kata dari fi’il madhi ke fi’il mudhari’, mashdar, isim fa’il, dan seterusnya disebut dengan?', 10, '[{\"key\": \"A\", \"value\": \"Tashrif Lughawi\"}, {\"key\": \"B\", \"value\": \"Tashrif Istilahi\"}, {\"key\": \"C\", \"value\": \"Tashrif Qiyasiy\"}, {\"key\": \"D\", \"value\": \"Tashrif Samaiy\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('e72b76f5-bd7b-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Kata kerja yang huruf penyusunnya 4 huruf disebut?', 10, '[{\"key\": \"A\", \"value\": \"Tsulatsy\"}, {\"key\": \"B\", \"value\": \"Rubaiy\"}, {\"key\": \"C\", \"value\": \"Khumasiy\"}, {\"key\": \"D\", \"value\": \"Sudasiy\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('e72b89f7-bd7b-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Berapakah total Wazan Tsulatsy dan Ruba’iy?', 10, '[{\"key\": \"A\", \"value\": \"6 Wazan\"}, {\"key\": \"B\", \"value\": \"22 Wazan\"}, {\"key\": \"C\", \"value\": \"12 Wazan\"}, {\"key\": \"D\", \"value\": \"35 Wazan\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('e72b99cc-bd7b-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Kata مَسْجِدٌ termasuk dalam contoh adalah isim..', 10, '[{\"key\": \"A\", \"value\": \"Isim zaman\"}, {\"key\": \"B\", \"value\": \"Isim makan\"}, {\"key\": \"C\", \"value\": \"Isim Alat\"}, {\"key\": \"D\", \"value\": \"Mashdar\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('e72bae69-bd7b-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Jumlah wazan tsulatsy mujarrad adalah?', 10, '[{\"key\": \"A\", \"value\": \"12 Wazan\"}, {\"key\": \"B\", \"value\": \"6 Wazan\"}, {\"key\": \"C\", \"value\": \"35 Wazan\"}, {\"key\": \"D\", \"value\": \"22 wazan\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 3, 'D', NULL, NULL),
('e72bbc06-bd7b-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Hamzah yang ada pada wazan infa\'ala, ifta\'ala, istaf\'ala adalah hamzah?', 10, '[{\"key\": \"A\", \"value\": \"Washl\"}, {\"key\": \"B\", \"value\": \"Qathi\"}, {\"key\": \"C\", \"value\": \"Alif\"}, {\"key\": \"D\", \"value\": \"Mamdudah\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('e72bc741-bd7b-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Manakah berikut yang merupakan tashrif lughawi isim fa’il dari fi’il ruba’i mujarrad?', 10, '[{\"key\": \"A\", \"value\": \"تَسَلْسَلَ\"}, {\"key\": \"B\", \"value\": \"بَسْمَلَ\"}, {\"key\": \"C\", \"value\": \"مُسَلْسَلٌ\"}, {\"key\": \"D\", \"value\": \"مُسَلْسِلٌ\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('e72bdb9f-bd7b-11ef-8196-00163e047c76', 'UJIAN SHOROF', '.8Manakah contoh berikut yang merupakan tashrif lughawi fi’il madhi dengan dhamir “أَنْتُنَّ” ?', 10, '[{\"key\": \"A\", \"value\": \"أَكْتُبُ\"}, {\"key\": \"B\", \"value\": \"كَتَبَ\"}, {\"key\": \"C\", \"value\": \"كَتَبْتَ\"}, {\"key\": \"D\", \"value\": \"كَتَبْتُنَّ\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 3, 'D', NULL, NULL),
('e72c07da-bd7b-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Berikut merupakan contoh dari tashrif lughawi fi’il amri', 10, '[{\"key\": \"A\", \"value\": \"نَصَر\"}, {\"key\": \"B\", \"value\": \"نَقْرَأُ\"}, {\"key\": \"C\", \"value\": \"اِقْرَأْ\"}, {\"key\": \"D\", \"value\": \"جَلَسْتَ\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('e72c15bf-bd7b-11ef-8196-00163e047c76', 'UJIAN SHOROF', 'Berikut merupakan contoh tashrif lughawi wazan fi’il mudhari’ dhamir “نَحْنُ”', 10, '[{\"key\": \"A\", \"value\": \"نَصَرَ\"}, {\"key\": \"B\", \"value\": \"أَنْصُرُ\"}, {\"key\": \"C\", \"value\": \"تَنْصُرُ\"}, {\"key\": \"D\", \"value\": \"نَنْصُرُ\"}]', 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', 3, 'D', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_answer`
--

CREATE TABLE `exam_answer` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `point` int NOT NULL,
  `batch` int NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_materi_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phase` int NOT NULL,
  `users_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_answer`
--

INSERT INTO `exam_answer` (`id`, `point`, `batch`, `answer`, `exam_id`, `kategori_materi_id`, `phase`, `users_id`, `created_at`, `updated_at`) VALUES
('04607aa8-bb51-11ef-8196-00163e047c76', 0, 2, 'B', '04607aa8-bb51-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 2, NULL, NULL),
('04608f5e-bb51-11ef-8196-00163e047c76', 10, 2, 'C', '04608f5e-bb51-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 2, NULL, NULL),
('0460a388-bb51-11ef-8196-00163e047c76', 0, 2, 'B', '0460a388-bb51-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 2, NULL, NULL),
('0460b193-bb51-11ef-8196-00163e047c76', 0, 2, 'A', '0460b193-bb51-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 2, NULL, NULL),
('0460bde4-bb51-11ef-8196-00163e047c76', 0, 2, 'D', '0460bde4-bb51-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 2, NULL, NULL),
('0460c8f0-bb51-11ef-8196-00163e047c76', 0, 2, 'A', '0460c8f0-bb51-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 2, NULL, NULL),
('0460d97f-bb51-11ef-8196-00163e047c76', 0, 2, 'C', '0460d97f-bb51-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 2, NULL, NULL),
('0460e48c-bb51-11ef-8196-00163e047c76', 0, 2, 'B', '0460e48c-bb51-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 2, NULL, NULL),
('0460fa87-bb51-11ef-8196-00163e047c76', 0, 2, 'A', '0460fa87-bb51-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 2, NULL, NULL),
('046106f0-bb51-11ef-8196-00163e047c76', 0, 2, 'C', '046106f0-bb51-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 2, 2, NULL, NULL),
('31140a13-bd78-11ef-8196-00163e047c76', 10, 1, 'B', '31140a13-bd78-11ef-8196-00163e047c76', 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('31142210-bd78-11ef-8196-00163e047c76', 0, 1, 'D', '31142210-bd78-11ef-8196-00163e047c76', 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('31143a56-bd78-11ef-8196-00163e047c76', 10, 1, 'B', '31143a56-bd78-11ef-8196-00163e047c76', 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('311455cf-bd78-11ef-8196-00163e047c76', 10, 1, 'A', '311455cf-bd78-11ef-8196-00163e047c76', 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('311475bb-bd78-11ef-8196-00163e047c76', 0, 1, 'D', '311475bb-bd78-11ef-8196-00163e047c76', 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('311487e4-bd78-11ef-8196-00163e047c76', 0, 1, 'C', '311487e4-bd78-11ef-8196-00163e047c76', 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('311493e0-bd78-11ef-8196-00163e047c76', 0, 1, 'B', '311493e0-bd78-11ef-8196-00163e047c76', 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('3114a0e0-bd78-11ef-8196-00163e047c76', 0, 1, 'A', '3114a0e0-bd78-11ef-8196-00163e047c76', 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('3114b210-bd78-11ef-8196-00163e047c76', 0, 1, 'C', '3114b210-bd78-11ef-8196-00163e047c76', 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('3114c140-bd78-11ef-8196-00163e047c76', 10, 1, 'B', '3114c140-bd78-11ef-8196-00163e047c76', 'ca84af01-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('b8511cd9-bb48-11ef-8196-00163e047c76', 10, 1, 'B', 'b8511cd9-bb48-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('b85130f2-bb48-11ef-8196-00163e047c76', 10, 1, 'A', 'b85130f2-bb48-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('b8513e2c-bb48-11ef-8196-00163e047c76', 10, 1, 'B', 'b8513e2c-bb48-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('b85150e4-bb48-11ef-8196-00163e047c76', 10, 1, 'A', 'b85150e4-bb48-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('b8515cb4-bb48-11ef-8196-00163e047c76', 0, 1, 'C', 'b8515cb4-bb48-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('b8516762-bb48-11ef-8196-00163e047c76', 10, 1, 'B', 'b8516762-bb48-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('b85171d0-bb48-11ef-8196-00163e047c76', 10, 1, 'B', 'b85171d0-bb48-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('b85181ef-bb48-11ef-8196-00163e047c76', 10, 1, 'A', 'b85181ef-bb48-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('b8518cd6-bb48-11ef-8196-00163e047c76', 10, 1, 'B', 'b8518cd6-bb48-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL),
('b8519cc5-bb48-11ef-8196-00163e047c76', 10, 1, 'C', 'b8519cc5-bb48-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_materi`
--

CREATE TABLE `kategori_materi` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `jenis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_materi`
--

INSERT INTO `kategori_materi` (`id`, `jenis`, `deskripsi`, `created_at`, `updated_at`) VALUES
('c376e864-ba1e-11ef-8196-00163e047c76', 'Nahwu', 'Nahwu adalah ilmu yang mempelajari struktur kalimat dalam bahasa Arab', '2024-12-14 13:34:36', '2024-12-14 13:34:36'),
('ca84af01-ba1e-11ef-8196-00163e047c76', 'Sharaf', 'Sharaf adalah ilmu yang mempelajari struktur kalimat dalam bahasa Arab', '2024-12-14 13:34:54', '2024-12-14 13:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_materi_detail`
--

CREATE TABLE `kategori_materi_detail` (
  `id` bigint UNSIGNED NOT NULL,
  `exam1` enum('false','true') COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam2` enum('false','true') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Exam1','Exam2') COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_materi_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_materi_detail`
--

INSERT INTO `kategori_materi_detail` (`id`, `exam1`, `exam2`, `status`, `kategori_materi_id`, `users_id`, `created_at`, `updated_at`) VALUES
(1, 'true', 'false', 'Exam2', 'c376e864-ba1e-11ef-8196-00163e047c76', 2, '2024-12-21 01:12:34', NULL),
(2, 'false', 'false', 'Exam1', 'c376e864-ba1e-11ef-8196-00163e047c76', 3, '2024-12-21 01:45:15', NULL),
(3, 'false', 'false', 'Exam1', 'ca84af01-ba1e-11ef-8196-00163e047c76', 3, '2024-12-21 01:53:46', NULL),
(4, 'false', 'false', 'Exam1', 'c376e864-ba1e-11ef-8196-00163e047c76', 11, '2024-12-21 02:12:40', NULL),
(5, 'false', 'false', 'Exam1', 'ca84af01-ba1e-11ef-8196-00163e047c76', 2, '2024-12-21 02:50:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `embed` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phase` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permalink` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quis_status` tinyint(1) NOT NULL,
  `urutan` int DEFAULT NULL,
  `kategori_materi_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`id`, `embed`, `phase`, `judul`, `permalink`, `isi`, `file_uri`, `quis_status`, `urutan`, `kategori_materi_id`, `created_at`, `updated_at`) VALUES
('0438fff3-bd23-11ef-8196-00163e047c76', 'https://drive.google.com/file/d/1ad7xRoGqwtRxkgis4Y0imI32fjRAsLV8/view', '2', 'INNA DAN SAUDARINYA', 'inna-dan-saudarinya', NULL, '1734514356_MATERI_13(INNA_DAN_SAUDARINYA).pdf', 1, 13, 'c376e864-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:32:36', '2024-12-18 08:32:36'),
('1624ab69-bd22-11ef-8196-00163e047c76', 'https://www.youtube.com/watch?v=WeHkn9MffA4', '1', 'DHOMIR MUTTASIL DAN DHOMIR MUNFASIL', 'dhomir-muttashil-dan-dhomir-munfasil', NULL, '1734513956_MATERI_7(DHOMIR_MUTTASHIL_&_DHOMIR_MUSNFASHIL).pdf', 1, 7, 'c376e864-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:25:56', '2024-12-18 08:25:56'),
('2500c400-bd23-11ef-8196-00163e047c76', 'https://drive.google.com/file/d/15aiU0cSyAEuFq5dhxeYlInp_gKXa9suw/view', '2', 'KAANA DAN SAUDARINYA', 'kaana-dan-saudarinya', NULL, '1734514411_MATERI_14(KAANA_DAN_SAUDARINYA).pdf', 1, 14, 'c376e864-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:33:31', '2024-12-18 08:33:31'),
('461783da-bd23-11ef-8196-00163e047c76', 'https://www.youtube.com/watch?v=yfR8CzN3k10&authuser=0', '2', 'FIIL MADLI DAN MUDHORE\'', 'fiil-madli-dan-mudhore-', NULL, '1734514466_MATERI_15(FIIL_MADII_DAN_MUDHORE).pdf', 1, 15, 'c376e864-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:34:26', '2024-12-18 08:34:26'),
('4a91f951-bd22-11ef-8196-00163e047c76', 'https://www.google.co.uk/', '1', 'ISIM IDHOFAT', 'isim-idhofat', NULL, '1734514044_MATERI_8(ISIM_IDHOFAT).pdf', 1, 8, 'c376e864-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:27:24', '2024-12-18 08:27:24'),
('60065b85-bd23-11ef-8196-00163e047c76', 'https://www.youtube.com/watch?v=yfR8CzN3k10&authuser=0', '2', 'FIIL AMR DAN NAHYI', 'fiil-amr-dan-nahyi', NULL, '1734514510_MATERI_16(FIIL_AMR_DAN_NAHYI).pdf', 1, 16, 'c376e864-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:35:10', '2024-12-18 08:35:10'),
('61977613-bd22-11ef-8196-00163e047c76', 'https://www.google.co.uk/', '1', 'ISIM SIFAT MAUSHUF', 'isim-sifat-maushuf', NULL, '1734514083_MATERI_9(ISIM_SIFAT_MAUSHUF).pdf', 1, 9, 'c376e864-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:28:03', '2024-12-18 08:28:03'),
('68477fd4-bd21-11ef-8196-00163e047c76', 'https://www.google.com', '1', 'UNSUR PEMBENTUK KALIMAT', 'unsur-pembentuk-kalimat', NULL, '1734513665_MATERI_1(Unsur_Pembentukan_Kalimat).pdf', 1, 1, 'c376e864-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:21:05', '2024-12-18 08:21:05'),
('83fcdb9e-bd22-11ef-8196-00163e047c76', 'https://www.youtube.com/watch?v=6C6WNS88Z4U', '2', 'HARF-DHOROF-SYIBHUL JUMLAH', 'harf-dhorof-syibhul-jumlah', NULL, '1734514141_MATERI_10(HARF_DHOROF_SYIBHUL_JUMLAH).pdf', 1, 10, 'c376e864-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:29:01', '2024-12-18 08:29:01'),
('8526b927-bd21-11ef-8196-00163e047c76', 'https://www.youtube.com/watch?v=OnoyS4s7gVk', '1', 'ISIM BERDASARKAN GENDER', 'isim-berdasarkan-gender', NULL, '1734513713_MATERI_2(Isim_Berdasarkan_Gender).pdf', 1, 2, 'c376e864-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:21:53', '2024-12-18 08:21:53'),
('9c62d709-bd21-11ef-8196-00163e047c76', 'https://www.youtube.com/watch?v=y0DPIoKqO44', '1', 'ISIM BERDASARKAN KUANTITAS', 'isim-berdasarkan-kuantitas', NULL, '1734513752_Materi_3(Isim_Berdasarkan_Kuantitas).pdf', 1, 3, 'c376e864-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:22:32', '2024-12-18 08:22:32'),
('adf9870d-bd23-11ef-8196-00163e047c76', 'https://www.google.co.uk/', '1', 'MENGENAL ILMU SHOROF', 'mengenal-ilmu-shorof', NULL, '1734514641_BAB_1(MENGENAL_ILMU_SHOROF).pdf', 1, 1, 'ca84af01-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:37:21', '2024-12-18 08:37:21'),
('b59eca84-bd22-11ef-8196-00163e047c76', 'https://www.youtube.com/watch?v=UvrDV97mYhw', '2', 'JUMLAH ISMIYYAH', 'jumlah-ismiyyah', NULL, '1734514224_MATERI_11(JUMLAH_ISMIYYAH).pdf', 1, 11, 'c376e864-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:30:24', '2024-12-18 08:30:24'),
('b6c897f6-bd21-11ef-8196-00163e047c76', 'https://www.youtube.com/watch?v=ax_aqOv9UBo', '1', 'ISIM MAUSHUL', 'isim-maushul', NULL, '1734513796_MATERI_4(Isim_Maushul).pdf', 1, 4, 'c376e864-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:23:16', '2024-12-18 08:23:16'),
('c099f35b-bd23-11ef-8196-00163e047c76', 'https://www.google.co.uk/', '1', 'TASHRIF LUGHOWI', 'tashrif-lughowi', NULL, '1734514672_BAB_2(TASHRIF_LUGHOWI).pdf', 1, 2, 'ca84af01-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:37:52', '2024-12-18 08:37:52'),
('d342457a-bd21-11ef-8196-00163e047c76', 'https://www.youtube.com/watch?v=cnDathEQR9g', '1', 'ISIM ISYAROH', 'isim-isyaroh', NULL, '1734513844_MATERI_5(Isim_Isyaroh).pdf', 1, 5, 'c376e864-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:24:04', '2024-12-18 08:24:04'),
('db2e8050-bd22-11ef-8196-00163e047c76', 'https://www.youtube.com/watch?v=Mg1VNJCWoKE&authuser=0', '2', 'MABNI DAN MU\'ROB', 'mabni-dan-mu-rob', NULL, '1734514287_Materi_12(MABNI_DAN_MU\'ROB).pdf', 1, 12, 'c376e864-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:31:27', '2024-12-18 08:31:27'),
('f4e744ac-bd21-11ef-8196-00163e047c76', 'https://www.youtube.com/watch?v=jti1u44o144', '1', 'ISIM NAKIRAH DAN MA\'RIFAH', 'isim-nakiroh-dan-ma-rifah', NULL, '1734513901_MATERI_6(Isim_nakiroh_dan_ma\'rifah).pdf', 1, 6, 'c376e864-ba1e-11ef-8196-00163e047c76', '2024-12-18 08:25:01', '2024-12-18 08:25:01');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(28, '0001_01_01_000001_create_cache_table', 1),
(29, '0001_01_01_000002_create_jobs_table', 1),
(30, '2024_10_26_112212_create_personal_access_tokens_table', 1),
(31, '2024_10_26_115702_create_oauth_auth_codes_table', 1),
(32, '2024_10_26_115703_create_oauth_access_tokens_table', 1),
(33, '2024_10_26_115704_create_oauth_refresh_tokens_table', 1),
(34, '2024_10_26_115705_create_oauth_clients_table', 1),
(35, '2024_10_26_115706_create_oauth_personal_access_clients_table', 1),
(36, '2024_11_04_095820_create_role_table', 1),
(37, '2024_11_04_095822_create_users_table', 1),
(38, '2024_11_04_182452_create_request_header_table', 1),
(39, '2024_11_05_055254_create_materi_table', 1),
(40, '2024_11_05_093045_create_kategori_materi_table', 1),
(41, '2024_11_11_141552_create_about_table', 1),
(43, '2024_12_08_200822_create_quis_table', 1),
(44, '2024_12_11_212917_create_exam_table', 1),
(45, '2024_12_16_062823_create_quis_answer_table', 2),
(46, '2024_12_19_124235_create_exam_answer_table', 3),
(48, '2024_12_08_160504_create_kategori_materi_detail_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('011e7f636a90a0a012306598e230086f1b0acc79649f2eb461c371818139cbb0234e859dde44ca28', 2, 1, 'nasholearn', '[]', 0, '2024-12-14 12:21:15', '2024-12-14 12:21:15', '2025-03-14 20:21:15'),
('02c17a9eb19cfb753ebb0be55c34186a153e29c9bc4510cd7148d0d22584dafe47eaa1681c3f8e82', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:18:49', '2024-12-17 20:18:50', '2025-03-18 04:18:49'),
('08420a235fb6e0676e92cb294050ae1258d0778a5ec811c9032ee875f85b9af4adefa6a4ecf16a3f', 2, 1, 'nasholearn', '[]', 0, '2024-12-16 21:48:57', '2024-12-16 21:48:57', '2025-03-17 05:48:57'),
('084dbf84c8b12a7860f991c3acab0d2136c907f1d7577f05bc670dc2556b6abcfccb25e20100b508', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 21:04:49', '2024-12-17 21:04:49', '2025-03-18 05:04:49'),
('08a523ea9de86e00149c81ed3064a883e194c445449ee00817ddbada71e5593882217d4971bebd77', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 21:21:24', '2024-12-17 21:21:24', '2025-03-18 05:21:24'),
('0d992850808f2e89192cbc7b3d8565e1fef46705552c8bbae4965936880b7985152d719136d39b7d', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:55:15', '2024-12-17 20:55:15', '2025-03-18 04:55:15'),
('0e36251f86043355e398e6a57d90e5baf04d30ac54cbd72049178f4b7ca651efb15400fdca8fd143', 7, 1, 'nasholearn', '[]', 0, '2024-12-20 12:54:13', '2024-12-20 12:54:13', '2025-03-20 20:54:13'),
('1124402f263102d3caf2b0801ced4873165b0d58a231861af426c04aafafc943fea0065ddb030cfc', 2, 1, 'nasholearn', '[]', 0, '2024-12-14 12:18:18', '2024-12-14 12:18:18', '2025-03-14 20:18:18'),
('11744ad3c74362060fc106a44bb9ce1bdfe888439357b561e83773d60b9f06522ab682eaefb215b9', 2, 1, 'nasholearn', '[]', 0, '2024-12-16 20:57:10', '2024-12-16 20:57:10', '2025-03-17 04:57:10'),
('11ab1faae66d94ae48dbd329a63ab4a718e92e0a35f5a0d9390e4ad3c768d4ff3dc060ea71cfbb82', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:21:59', '2024-12-17 20:21:59', '2025-03-18 04:21:59'),
('12144660d1fb92e356cbddb0bc059f9c4cb1b35e13969847e218c98fb83fd2c5f51d81da75978f03', 2, 1, 'nasholearn', '[]', 0, '2024-12-16 01:36:01', '2024-12-16 01:36:01', '2025-03-16 09:36:01'),
('15a37b6344a6683bb481ab0909febf5a602eff0cdb663707228ffc5413f4d01b412a8749f8cea657', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:32:47', '2024-12-17 20:32:47', '2025-03-18 04:32:47'),
('165f092af9dbb5beaa5a1fc601de2a68fd6294caf133e8b69490ff56a4fcbffffa9a7860648f3cb9', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:14:58', '2024-12-17 20:14:58', '2025-03-18 04:14:58'),
('1996d26eecb79497c1c681735d98d0b3932de3e1efda396aa5ec9ae4a6574433a3e0e9cf2453b14a', 2, 1, 'nasholearn', '[]', 0, '2024-12-17 22:12:35', '2024-12-17 22:12:35', '2025-03-18 06:12:35'),
('1bca7f6d41cd12829aee01e5974d138e3e77f67ed70cb25733d87fa9ee2e3ea2d34f508c93f540ab', 1, 1, 'nasholearn', '[]', 0, '2024-12-13 13:36:27', '2024-12-13 13:36:27', '2025-03-13 21:36:27'),
('2104448da80a26a4a52383d837da41c48854d2a35c764f9598cc625225828831ee27cb94db85aff7', 2, 1, 'nasholearn', '[]', 0, '2024-12-19 22:04:31', '2024-12-19 22:04:31', '2025-03-20 06:04:31'),
('210b05f2327f11b79bbc0f9e3f33e145f3bd0628fb827be9f00bd1c269e147213c908e39a387ef71', 2, 1, 'nasholearn', '[]', 0, '2024-12-21 02:45:20', '2024-12-21 02:45:20', '2025-03-21 10:45:20'),
('2149a5b045d130f22105d1b9cb4b8fa7783313f81e2fccd9377189f8536bd0de597d8420b5e034e8', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:17:01', '2024-12-17 20:17:01', '2025-03-18 04:17:01'),
('24c02dd28cb983e1ea2f350bc9358338e3de0b1f603d4da74f0553c98f84c83876d359bc440fd05b', 2, 1, 'nasholearn', '[]', 0, '2024-12-17 17:28:15', '2024-12-17 17:28:15', '2025-03-18 01:28:15'),
('25b066fb12fffaf7bda9458797e701ea1f859903088db076470182ca73db8217c302b0203f2deead', 2, 1, 'nasholearn', '[]', 0, '2024-12-14 13:32:21', '2024-12-14 13:32:21', '2025-03-14 21:32:21'),
('304310fed9d0e939e214dcbc949f577455a37d4b28905a91aa74f7bc7eac661523c90ebbb030ab23', 2, 1, 'nasholearn', '[]', 0, '2024-12-21 02:20:24', '2024-12-21 02:20:24', '2025-03-21 10:20:24'),
('37e4e280cf95c7ce32333987d65429b58b1fbabf64ab22c55c9ba7a311c73f7f8d616e3d46b343e2', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 21:00:37', '2024-12-17 21:00:37', '2025-03-18 05:00:37'),
('3bf33f42f32161ee62d2e364e0f9e74e58ddd11263e35eac91ba6bdc6fdfca02731781b57daa0634', 8, 1, 'nasholearn', '[]', 0, '2024-12-20 12:59:43', '2024-12-20 12:59:43', '2025-03-20 20:59:43'),
('3f7e17c0566d3027de86d84fc2e991771258b551911fec0e9a66ef67cd00d4d8800c1c70147eaf5a', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:33:01', '2024-12-17 20:33:01', '2025-03-18 04:33:01'),
('3f917544e3f94aeb68f289d1fcb8f3348816eb7301a52dfbeeef0a8bfe612f13ac3a142d59196ad5', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:21:56', '2024-12-17 20:21:56', '2025-03-18 04:21:56'),
('41290e4fe47741d5f4e3759b6fc7508c9343026c1b29b0a5a9f9e763591a95a37721d4d5f89acdb2', 3, 1, 'nasholearn', '[]', 0, '2024-12-14 13:29:29', '2024-12-14 13:29:29', '2025-03-14 21:29:29'),
('41ffacda5427740702fe9b27cc3b570f7ead6a258a9f8f3a8cfc95d4799e605bd8a3310b61e04f6c', 2, 1, 'nasholearn', '[]', 0, '2024-12-17 18:59:41', '2024-12-17 18:59:41', '2025-03-18 02:59:41'),
('496adaedb1e81b74fec8f1b25569d0e0b4876f6c54f99a46d443871fb4ef03f83fe67d554d6b2efd', 4, 1, 'nasholearn', '[]', 0, '2024-12-16 02:53:09', '2024-12-16 02:53:09', '2025-03-16 10:53:09'),
('4a65d8ede03b61238a6eaec544b50bef44cc3ff878e2e9a58bdd665dbded2951ac4510c8b9104805', 2, 1, 'nasholearn', '[]', 0, '2024-12-17 13:33:39', '2024-12-17 13:33:39', '2025-03-17 21:33:39'),
('4a8d4bbb5eb29572dc560516ba2ac0e722630e9f8b8b8cb3bf00cb78b8334a632f0edb1e8b7a525d', 1, 1, 'nasholearn', '[]', 0, '2024-12-14 13:33:54', '2024-12-14 13:33:54', '2025-03-14 21:33:54'),
('4dd7f8e1a90cec706ca10023fc04044f26730fc6a94f5b5a721fe81eee059a851cff8b942809699f', 6, 1, 'nasholearn', '[]', 0, '2024-12-20 12:46:40', '2024-12-20 12:46:40', '2025-03-20 20:46:40'),
('4ec70b0388f3be6109004bce04c95e7061e30059d2b38f4fa4740666788394caae1075bf58aa0979', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:55:22', '2024-12-17 20:55:22', '2025-03-18 04:55:22'),
('584b2dec1a6480d5090d89eff20441dc384fadee04bd0676ba212dd426b56a5df450d6f5332d12ef', 11, 1, 'nasholearn', '[]', 0, '2024-12-21 00:55:02', '2024-12-21 00:55:02', '2025-03-21 08:55:02'),
('5cedc164edbff243c8d48ba2c160f0364f8d325fe781269482bcd4e9f7a9effd83f50542a93ad06e', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:14:51', '2024-12-17 20:14:51', '2025-03-18 04:14:51'),
('6273b884ce86d351fb72582d143734e54f86b74d1e43ba613c250bc0475e096442af34655dbd12e4', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:32:13', '2024-12-17 20:32:13', '2025-03-18 04:32:13'),
('646cff41b235ee9a0271531eb4e9d7bb2de4d544ebc10be36b7a905c2eff0931f5926cf2205a00a5', 1, 1, 'nasholearn', '[]', 0, '2024-12-18 14:30:13', '2024-12-18 14:30:13', '2025-03-18 22:30:13'),
('6c412deaa5078778c16d3146e73a90ed4976710c1f4f577f7ccf01c9cc481c536d2de3863e3da52e', 3, 1, 'nasholearn', '[]', 0, '2024-12-17 13:35:40', '2024-12-17 13:35:40', '2025-03-17 21:35:40'),
('6d523af5c363fc94e5e2fbf1a188d49bb0f66275f8bdd5ee2fd5928351720c7f367a7ac278820509', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:31:48', '2024-12-17 20:31:48', '2025-03-18 04:31:48'),
('6e0ea58a2395cd0b2dd090bf0b5b5cc6fb9224cc7e086848dc3eb8e755b716150252205dc915b86c', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:09:16', '2024-12-17 20:09:16', '2025-03-18 04:09:16'),
('76b28d6b5f59606e234824408fa0fa89791f204b58cb53931d06fcc3f1ade9174694e53c5bfcc1a4', 1, 1, 'nasholearn', '[]', 0, '2024-12-18 14:15:57', '2024-12-18 14:15:57', '2025-03-18 22:15:57'),
('7969f94f6a7d29234e96fe9f1fd9e09df9ccf5aadee9211383a6c5e270330ac88eadc7102adb3391', 2, 1, 'nasholearn', '[]', 0, '2024-12-17 13:47:24', '2024-12-17 13:47:24', '2025-03-17 21:47:24'),
('7efa03dbf142104c25e635e384be9f63104d93bd3e46a9d1607fd41f654a9c239e65989cb827b3c0', 3, 1, 'nasholearn', '[]', 0, '2024-12-19 13:45:33', '2024-12-19 13:45:33', '2025-03-19 21:45:33'),
('803f7194d9aa4cfac6c5831e92bb1b82fd674c00febd8658fe6a033b177f80a71fc5dc8b3b914b52', 2, 1, 'nasholearn', '[]', 0, '2024-12-16 01:35:29', '2024-12-16 01:35:29', '2025-03-16 09:35:29'),
('83362d929fcf880bd6e1101b67481a241ba9c28e5617575bf47227935f6257e94bd79135a2b6212f', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:59:58', '2024-12-17 20:59:58', '2025-03-18 04:59:58'),
('83c01072c5e175ed0fe4b96977b91b7795eb64643c03312c9d5e88478f8189a86c0b784c315123c7', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:31:57', '2024-12-17 20:31:57', '2025-03-18 04:31:57'),
('86bfaef4a5337b8318f525d89f9ef9344efbaf8d0198dbbdac045e91e6024455c4bd548fb044e42b', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:33:41', '2024-12-17 20:33:41', '2025-03-18 04:33:41'),
('8a21a74c69153bcf80d6e9a2272bbd840b30726dae7ea18cfb08c1e5c4c27d9ae77f9a1c6009c238', 2, 1, 'nasholearn', '[]', 0, '2024-12-20 12:31:40', '2024-12-20 12:31:41', '2025-03-20 20:31:40'),
('8c2cd8bef9d9130dc8582b12e1931173e38fa818d6552d60176c70a164382dbcd2298e17c0182b97', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 23:31:07', '2024-12-17 23:31:07', '2025-03-18 07:31:07'),
('908a75bad4d191ab06f6350d728afff9f8b8fec18c97ff93b8071a0bcce980f8686e99e2845f4567', 2, 1, 'nasholearn', '[]', 0, '2024-12-20 12:32:56', '2024-12-20 12:32:56', '2025-03-20 20:32:56'),
('9563373a02087e14412b7899a44d9bb762d89b4038ed84ef0ee5c9d74fd61fe4f432c82ab1c75af8', 2, 1, 'nasholearn', '[]', 0, '2024-12-16 01:30:51', '2024-12-16 01:30:51', '2025-03-16 09:30:51'),
('9a729a756c6605d7b61ce8324470d9e8f8a062dccaf39da0352e49d4ec0fd2af4f65b8d012549624', 2, 1, 'nasholearn', '[]', 0, '2024-12-16 22:01:01', '2024-12-16 22:01:01', '2025-03-17 06:01:01'),
('9adf37a4fa6f812555919bcba574a47570e33463d28e586f4f4a57f73519f5326dce719cf7b6ba85', 2, 1, 'nasholearn', '[]', 0, '2024-12-20 15:07:12', '2024-12-20 15:07:12', '2025-03-20 23:07:12'),
('9b13798f8b4224cdd6cf4475ab0b672f3a7fc7a33c2c2f309931a9c363ea6c0506d1e08f1b4b8546', 3, 1, 'nasholearn', '[]', 0, '2024-12-14 13:29:40', '2024-12-14 13:29:40', '2025-03-14 21:29:40'),
('9e147ae980b7d9d12fbe75299bc527a5f887ab4512d1dfe9a942aa24e793278dc5b3deb45cfcbb9e', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 21:20:37', '2024-12-17 21:20:37', '2025-03-18 05:20:37'),
('a2cf2cf9fb2b615d56592a4f0c461b5cb1dc2c20bb95fe3b1832b992bc7449dee58a2916056a3f24', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:12:22', '2024-12-17 20:12:22', '2025-03-18 04:12:22'),
('a2d41306156f5cec77c2a2c3e4a0d16b8c7932ff2664fcdcc035ccfb65fe7209460173fc27e898eb', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:22:00', '2024-12-17 20:22:00', '2025-03-18 04:22:00'),
('a4f643fc45c8ccdea0e0f5a7b22b8267ed165a6527d855a9ee57c14bc5112b67c1029a16515bfb35', 3, 1, 'nasholearn', '[]', 0, '2024-12-16 01:28:59', '2024-12-16 01:28:59', '2025-03-16 09:28:59'),
('a9b8008faa04441302d4addd0c885a6a8823bddef65b8f11cc90b488753d4e92d3799304ca8a1741', 1, 1, 'nasholearn', '[]', 0, '2024-12-19 12:02:13', '2024-12-19 12:02:13', '2025-03-19 20:02:13'),
('ab75f33628b1acbb682a43f9708ab8476761da9bd2e90acf583e21532a21761b43bc782e6f8e5866', 1, 1, 'nasholearn', '[]', 0, '2024-12-20 06:58:13', '2024-12-20 06:58:13', '2025-03-20 14:58:13'),
('b16609e0364e7eecdc764e2c2903226a82c9a338d13a5516c59a56475268343155069b37b6acba1f', 3, 1, 'nasholearn', '[]', 0, '2024-12-17 13:35:31', '2024-12-17 13:35:32', '2025-03-17 21:35:31'),
('bca6058848dc01c43360614d13b6c8bf5dde4d9a9d814d394082884fed1efbfda45bad17e8aea108', 3, 1, 'nasholearn', '[]', 0, '2024-12-17 20:07:15', '2024-12-17 20:07:15', '2025-03-18 04:07:15'),
('c0fb810f589ce2a78cdad7562ea7d1e2e1f03d1d53219c4c45845d61b5bcff3cda9ed45b902409f2', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:21:48', '2024-12-17 20:21:48', '2025-03-18 04:21:48'),
('c206c59e0caa10732b0d1f215aacfb7ab1e9082671f7b67732442b17b2905c0aa9616748210a2b06', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:32:21', '2024-12-17 20:32:21', '2025-03-18 04:32:21'),
('c2dd4ccc28bb410991c11542df444cd35da9717e587ead0ae18037e3849de8268905b7dd23510b36', 12, 1, 'nasholearn', '[]', 0, '2024-12-21 03:02:50', '2024-12-21 03:02:50', '2025-03-21 11:02:50'),
('cb140b5ebc79abb2aae1c3e25d0b66f7a6694b106c226bb343f80503b152a9273b4cd686c411b073', 2, 1, 'nasholearn', '[]', 0, '2024-12-20 12:12:42', '2024-12-20 12:12:43', '2025-03-20 20:12:42'),
('cb3a082dd22b9437b4df3027282158a1dbf623fa18b68fa90feed620f30c5cbfcffbd42f3da3b19f', 3, 1, 'nasholearn', '[]', 0, '2024-12-19 12:05:50', '2024-12-19 12:05:50', '2025-03-19 20:05:50'),
('ce293edd62cf144ff889c1ec043230538e1980e5d49628e086faf760b9c91fbb8732238b456daaa3', 3, 1, 'nasholearn', '[]', 0, '2024-12-18 13:23:30', '2024-12-18 13:23:30', '2025-03-18 21:23:30'),
('d2116a609787a9117b94c84d9dc9022cf189d8f9a5245851539a614f839d74ead639c3db6a35a914', 3, 1, 'nasholearn', '[]', 0, '2024-12-16 01:51:56', '2024-12-16 01:51:56', '2025-03-16 09:51:56'),
('d3b6aea532e52c0d4c6e1953897508abffca48c408b771f3e74a7e0a3c684a8f58dfd6761ad71e6d', 2, 1, 'nasholearn', '[]', 0, '2024-12-16 21:49:58', '2024-12-16 21:49:58', '2025-03-17 05:49:58'),
('d5541a18fe8025a3ce2d826d8ca52824574c5b3717311cebfd0bc642528c2ff3979d85c37df7fdaf', 2, 1, 'nasholearn', '[]', 0, '2024-12-20 23:03:13', '2024-12-20 23:03:13', '2025-03-21 07:03:13'),
('d79d936e182ce2d6fb870f562b8d3cb93bc8d3d303ec376a1c3af2870d645e9d451c17d70749633c', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:35:57', '2024-12-17 20:35:57', '2025-03-18 04:35:57'),
('d941551854611d5ebd31570891d202d1d3326a2df8186a8ddf13feb3d8a5614c5558b99bd4f09bd6', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:32:27', '2024-12-17 20:32:27', '2025-03-18 04:32:27'),
('d9d396387ea31e5299c2b91218ee1b96e523a165ea0ff78e777f6ad9bfb2eca9da51bda0334720ec', 7, 1, 'nasholearn', '[]', 0, '2024-12-20 12:54:49', '2024-12-20 12:54:49', '2025-03-20 20:54:49'),
('db1674dbb7931fcfcbe5ef228bb2f7cac5bab9e1fd8a423de9bdba67838199633d44fd6a8be8a841', 3, 1, 'nasholearn', '[]', 0, '2024-12-18 13:23:28', '2024-12-18 13:23:28', '2025-03-18 21:23:28'),
('e0cbba3d8fa24a837680f2f5d9c4f100b6f25134b2e0ff19b745416e10d758f98c89404cb4b3ccda', 2, 1, 'nasholearn', '[]', 0, '2024-12-20 23:08:50', '2024-12-20 23:08:50', '2025-03-21 07:08:50'),
('e0f744c3d296d87ba032f810c62f58abaf8364ce9ebaba65f02f6a7292e598e3f09502d8ef1a37f8', 6, 1, 'nasholearn', '[]', 0, '2024-12-20 12:13:55', '2024-12-20 12:13:55', '2025-03-20 20:13:55'),
('e1d0127e3696b2e6edf885996e826560553aecc97bd5c654a6265c29271eaf18b95b10ac54c272ca', 3, 1, 'nasholearn', '[]', 0, '2024-12-18 13:21:23', '2024-12-18 13:21:23', '2025-03-18 21:21:23'),
('e25b6402dc42af8c9cfa4446f4c929fa4e54cd3c910ebf4d06693351a236d475f4dd5d7fb4fce4a9', 1, 1, 'nasholearn', '[]', 0, '2024-12-17 20:21:03', '2024-12-17 20:21:04', '2025-03-18 04:21:03'),
('e79ff38f9217a10495d11719acd1fc5bb20a479e0e496fd27120ec5833589c9eaba277a81539b302', 1, 1, 'nasholearn', '[]', 0, '2024-12-13 13:36:19', '2024-12-13 13:36:19', '2025-03-13 21:36:19'),
('ea8e4c5b1628c518a3c9a5dd657d27fb88a2a41fcfcf51c542e080390a5f799e14fdade2968f38a2', 12, 1, 'nasholearn', '[]', 0, '2024-12-21 03:00:25', '2024-12-21 03:00:25', '2025-03-21 11:00:25'),
('ee8e1940cd21955db31413624ff0a2e24621ce3e5fc80f2869eb849c907d123e5b5480224318a282', 5, 1, 'nasholearn', '[]', 0, '2024-12-19 23:18:29', '2024-12-19 23:18:29', '2025-03-20 07:18:29'),
('fa6bb7324ec9946d246313e9f3ae19bc485a81add57c6cff167609745348bed76de0083283418ee0', 2, 1, 'nasholearn', '[]', 0, '2024-12-21 01:00:19', '2024-12-21 01:00:19', '2025-03-21 09:00:19'),
('fd1801f87ee8226747c0c0fa92710b8d4074b2f2682444b669801b6097cb8d3428f65dd60e937596', 3, 1, 'nasholearn', '[]', 0, '2024-12-16 01:25:52', '2024-12-16 01:25:52', '2025-03-16 09:25:52');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'NashoLearn', 'n4RHVQJt1wsOYnviuQgp0PTVRJx3Ko3TfYlbjmz1', NULL, 'http://localhost', 1, 0, 0, '2024-12-13 13:35:53', '2024-12-13 13:35:53');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-12-13 13:35:53', '2024-12-13 13:35:53');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quis`
--

CREATE TABLE `quis` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` int NOT NULL,
  `option` json NOT NULL,
  `kategori_materi_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `materi_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int DEFAULT NULL,
  `answer_key` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quis`
--

INSERT INTO `quis` (`id`, `title`, `question`, `point`, `option`, `kategori_materi_id`, `materi_id`, `batch`, `answer_key`, `created_at`, `updated_at`) VALUES
('04617f16-bb23-11ef-8196-00163e047c76', 'KAANA DAN SAUDARINYA', 'Berikut merupakan contoh kalimat yang terdiri dari isim kaana dan khobar kaana, kecuali..', 20, '[{\"key\": \"A\", \"value\": \" كَانَ مُحَمَّدًا نَائِماً\"}, {\"key\": \"B\", \"value\": \" كَانَ الطَّالِبُ مُتَعَلِّمٌ\"}, {\"key\": \"C\", \"value\": \" كَانَتْ الطَّالِبَةَ ناَئِمَةٌ\"}, {\"key\": \"D\", \"value\": \" كَانَتْ الأُسْتَاذَةُ مَاهِرَةً\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '2500c400-bd23-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('04618f95-bb23-11ef-8196-00163e047c76', 'KAANA DAN SAUDARINYA', 'Manakah saudari Kaana yang tidak menunjukkan waktu?', 20, '[{\"key\": \"A\", \"value\": \"  أَصْبَحَ\"}, {\"key\": \"B\", \"value\": \" أَضْحَى\"}, {\"key\": \"C\", \"value\": \" أمْسَى\"}, {\"key\": \"D\", \"value\": \" صَارَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '2500c400-bd23-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('0461a44d-bb23-11ef-8196-00163e047c76', 'KAANA DAN SAUDARINYA', 'Pilihlah kata yang sesuai dengan kalimat berikut, “......... صَارَتْ الْمُدَرِّسَةُ” ', 20, '[{\"key\": \"A\", \"value\": \" جَمِيْلاً\"}, {\"key\": \"B\", \"value\": \" جَمِيْلَةً\"}, {\"key\": \"C\", \"value\": \" جَمِيْلَةٌ\"}, {\"key\": \"D\", \"value\": \" جَمِيْلٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '2500c400-bd23-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('0461b01d-bb23-11ef-8196-00163e047c76', 'KAANA DAN SAUDARINYA', 'Pilihlah kata yang sesuai dengan kalimat berikut, “........ مَازَلَ الْفَصْلُ”', 20, '[{\"key\": \"A\", \"value\": \" كَبِيْرًا\"}, {\"key\": \"B\", \"value\": \" كَبِيْرٌ\"}, {\"key\": \"C\", \"value\": \" كَبِيْرَةٌ\"}, {\"key\": \"D\", \"value\": \" كَبِيْرَةً\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '2500c400-bd23-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('0461bb56-bb23-11ef-8196-00163e047c76', 'KAANA DAN SAUDARINYA', 'Pilihlah kata yang sesuai dengan kalimat berikut, “لَيْسَ ........ مُجْتَهِدًا”', 20, '[{\"key\": \"A\", \"value\": \" الطَّالِبَ\"}, {\"key\": \"B\", \"value\": \" الأُسْتَاذُ\"}, {\"key\": \"C\", \"value\": \" الأُسْتَاذَةُ\"}, {\"key\": \"D\", \"value\": \" الطَّالِبَةُ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '2500c400-bd23-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('0cc3cebf-badb-11ef-8196-00163e047c76', 'Unsur pembentuk kalimat (الْجُمْلاَةُ المُفِيْدَةُ)', 'Berikut ini yang termasuk dalam pembagian الْكَلِمَةُ adalah?', 20, '[{\"key\": \"A\", \"value\": \"الْإِسْمُ , الْفِعْلُ , الْمَوْصُوْل\"}, {\"key\": \"B\", \"value\": \"الْإِسْمُ , الْفِعْلُ , الْحَرْف\"}, {\"key\": \"C\", \"value\": \"مَاضِي , مُضَارِعُ , أَمْرُ\"}, {\"key\": \"D\", \"value\": \"الْإِسْمُ , الْفِعْلُ , الْحَرْفُ , الْمُضَارِع\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '68477fd4-bd21-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('1eb1b3af-bd6c-11ef-8196-00163e047c76', 'MENGENAL ILMU SHOROF', 'Ilmu yang mempelajari perubahan kata dari satu bentuk ke bentuk lainnya dinamakan dengan ilmu?', 20, '[{\"key\": \"A\", \"value\": \"Nahwu \"}, {\"key\": \"B\", \"value\": \"Sharaf  \"}, {\"key\": \"C\", \"value\": \"Balaghah \"}, {\"key\": \"D\", \"value\": \"Imla \"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'adf9870d-bd23-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('1eb1cf4e-bd6c-11ef-8196-00163e047c76', 'MENGENAL ILMU SHOROF', 'Pola atau acuan atau rumus disebut dengan?', 20, '[{\"key\": \"A\", \"value\": \"Mauzun   \"}, {\"key\": \"B\", \"value\": \"Wazan     \"}, {\"key\": \"C\", \"value\": \"Tashrif \"}, {\"key\": \"D\", \"value\": \"Samaiy \"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'adf9870d-bd23-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('1eb1def0-bd6c-11ef-8196-00163e047c76', 'MENGENAL ILMU SHOROF', 'Kata yang mengikuti pola tertentu disebut?', 20, '[{\"key\": \"A\", \"value\": \"Wazan     \"}, {\"key\": \"B\", \"value\": \"Mauzun   \"}, {\"key\": \"C\", \"value\": \"Tashrif \"}, {\"key\": \"D\", \"value\": \"Qiyasiy \"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'adf9870d-bd23-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('1eb1f23c-bd6c-11ef-8196-00163e047c76', 'MENGENAL ILMU SHOROF', 'Perubahan suatu kata dari fi’il madhi ke fi’il mudhari’, mashdar, isim fa’il, dan seterusnya disebut dengan?', 20, '[{\"key\": \"A\", \"value\": \"Tashrif Lughawi  \"}, {\"key\": \"B\", \"value\": \"Tashrif Istilahi   \"}, {\"key\": \"C\", \"value\": \"Tashrif Qiyasiy \"}, {\"key\": \"D\", \"value\": \"Tashrif Samaiy \"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'adf9870d-bd23-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('1eb2001f-bd6c-11ef-8196-00163e047c76', 'MENGENAL ILMU SHOROF', 'Perubahan kata حَامِدٌ menjadi حَامِدُوْنَ، حَامِدَانِ  dan seterusnya disebut dengan?', 20, '[{\"key\": \"A\", \"value\": \"Tashrif Lughawi  \"}, {\"key\": \"B\", \"value\": \"Tashrif Ishtilahiy  \"}, {\"key\": \"C\", \"value\": \"Tashrif Qiyasiy \"}, {\"key\": \"D\", \"value\": \"Tashrif Samaiy\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'adf9870d-bd23-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('1eb21211-bd6c-11ef-8196-00163e047c76', 'MENGENAL ILMU SHOROF', 'Kata kerja perintah dalam Bahasa Arab disebut?', 20, '[{\"key\": \"A\", \"value\": \"Fiil Madhi\"}, {\"key\": \"B\", \"value\": \"Fiil Amr \"}, {\"key\": \"C\", \"value\": \"Fiil Mudhari\"}, {\"key\": \"D\", \"value\": \"Fiil Nahyi\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'adf9870d-bd23-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('1eb22181-bd6c-11ef-8196-00163e047c76', 'MENGENAL ILMU SHOROF', 'Apa makna dasar dari isim maf’ul?', 20, '[{\"key\": \"A\", \"value\": \"Yang melakukan sesuatu \"}, {\"key\": \"B\", \"value\": \"Yang dikenai perbuatan\"}, {\"key\": \"C\", \"value\": \"Kata perintah\"}, {\"key\": \"D\", \"value\": \"Kata benda\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'adf9870d-bd23-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('1eb22d36-bd6c-11ef-8196-00163e047c76', 'MENGENAL ILMU SHOROF', 'Kata kerja yang huruf penyusunnya 3 huruf disebut?', 20, '[{\"key\": \"A\", \"value\": \"Tsulatsy\"}, {\"key\": \"B\", \"value\": \"Rubaiy\"}, {\"key\": \"C\", \"value\": \"Khumasiy\"}, {\"key\": \"D\", \"value\": \"Sudasiy\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'adf9870d-bd23-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('1eb238fd-bd6c-11ef-8196-00163e047c76', 'MENGENAL ILMU SHOROF', 'Kata kerja yang huruf penyusunnya 4 huruf disebut?', 20, '[{\"key\": \"A\", \"value\": \"Tsulatsy\"}, {\"key\": \"B\", \"value\": \"Rubaiy\"}, {\"key\": \"C\", \"value\": \"Khumasiy\"}, {\"key\": \"D\", \"value\": \"Sudasiy\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'adf9870d-bd23-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('1eb24ada-bd6c-11ef-8196-00163e047c76', 'MENGENAL ILMU SHOROF', 'Berapakah total Wazan Tsulatsy dan Rubaiy?', 20, '[{\"key\": \"A\", \"value\": \"6 Wazan\"}, {\"key\": \"B\", \"value\": \"22 Wazan   \"}, {\"key\": \"C\", \"value\": \"12 Wazan\"}, {\"key\": \"D\", \"value\": \"35 Wazan\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'adf9870d-bd23-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('1eb2642e-bd6c-11ef-8196-00163e047c76', 'MENGENAL ILMU SHOROF', 'Ada berapa jenis tsulatsy mazid?', 20, '[{\"key\": \"A\", \"value\": \"1\"}, {\"key\": \"B\", \"value\": \"2\"}, {\"key\": \"C\", \"value\": \"3\"}, {\"key\": \"D\", \"value\": \"4\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'adf9870d-bd23-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('1eb27793-bd6c-11ef-8196-00163e047c76', 'MENGENAL ILMU SHOROF', 'Hamzah pada fi’il amr untuk semua wazan merupakan hamzah?', 20, '[{\"key\": \"A\", \"value\": \"Washl\"}, {\"key\": \"B\", \"value\": \"Qathi \"}, {\"key\": \"C\", \"value\": \"Alif\"}, {\"key\": \"D\", \"value\": \"Mamdudah\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'adf9870d-bd23-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('1eb28682-bd6c-11ef-8196-00163e047c76', 'MENGENAL ILMU SHOROF', 'Kata مَسْجِدٌ termasuk dalam contoh', 20, '[{\"key\": \"A\", \"value\": \"Isim zaman\"}, {\"key\": \"B\", \"value\": \"Isim makan\"}, {\"key\": \"C\", \"value\": \"Isim Alat\"}, {\"key\": \"D\", \"value\": \"Mashdar\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'adf9870d-bd23-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('1eb297cf-bd6c-11ef-8196-00163e047c76', 'MENGENAL ILMU SHOROF', 'Isim maf’ul dari ذَهَبَ adalah?', 20, '[{\"key\": \"A\", \"value\": \" مَذْهُوْبٌ\"}, {\"key\": \"B\", \"value\": \" مَهْذُوْبٌ \"}, {\"key\": \"C\", \"value\": \" مَبْهُوْذٌ\"}, {\"key\": \"D\", \"value\": \"Tidak ada\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'adf9870d-bd23-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('1eb2a359-bd6c-11ef-8196-00163e047c76', 'MENGENAL ILMU SHOROF', 'Jumlah wazan tsulatsy mujarrad adalah?', 20, '[{\"key\": \"A\", \"value\": \"12 Wazan\"}, {\"key\": \"B\", \"value\": \"6 Wazan\"}, {\"key\": \"C\", \"value\": \"35 Wazan\"}, {\"key\": \"D\", \"value\": \"22 wazan\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'adf9870d-bd23-11ef-8196-00163e047c76', 3, 'D', NULL, NULL),
('1f85f851-bb1b-11ef-8196-00163e047c76', 'MABNI DAN MU\'ROB', 'Apa yang dimaksud dengan i’rob pada isim?', 20, '[{\"key\": \"A\", \"value\": \"Perubahan bentuk kata akibat penggunaan harf jar\"}, {\"key\": \"B\", \"value\": \"Perubahan bunyi akhir kata karena pengaruh amil\"}, {\"key\": \"C\", \"value\": \"Penambahan prefiks pada kata benda\"}, {\"key\": \"D\", \"value\": \"Penyesuaian kata dengan struktur kalimat\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'db2e8050-bd22-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('1f860bac-bb1b-11ef-8196-00163e047c76', 'MABNI DAN MU\'ROB', 'Apa ciri umum i’rob rofa’ pada isim?', 20, '[{\"key\": \"A\", \"value\": \"Bunyi akhir kata fathah\"}, {\"key\": \"B\", \"value\": \"Bunyi akhir kata kasroh\"}, {\"key\": \"C\", \"value\": \"Bunyi akhir kata dhommah\"}, {\"key\": \"D\", \"value\": \"Bunyi akhir kata sukun\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'db2e8050-bd22-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('1f8649f4-bb1b-11ef-8196-00163e047c76', 'MABNI DAN MU\'ROB', 'Bagaimana i’rob dari isim yang berfungsi sebagai maf’ul bih (obyek) dalam kalimat?', 20, '[{\"key\": \"A\", \"value\": \"Rofa’ dengan dhommah\"}, {\"key\": \"B\", \"value\": \"Nashob dengan fathah\"}, {\"key\": \"C\", \"value\": \"Jar dengan kasroh\"}, {\"key\": \"D\", \"value\": \"Mabni dengan sukun\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'db2e8050-bd22-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('1f867703-bb1b-11ef-8196-00163e047c76', 'MABNI DAN MU\'ROB', 'Dalam posisi apakah i’rob jar diterapkan pada isim?', 20, '[{\"key\": \"A\", \"value\": \"Isim didahului huruf nida\"}, {\"key\": \"B\", \"value\": \"Isim didahului harf jar atau dhorof\"}, {\"key\": \"C\", \"value\": \"Isim sebagai fail\"}, {\"key\": \"D\", \"value\": \"Isim sebagai mubtada\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'db2e8050-bd22-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('1f869b3a-bb1b-11ef-8196-00163e047c76', 'MABNI DAN MU\'ROB', 'Apa tanda i’rob pada isim yang dipengaruhi huruf nida’ (panggilan)?', 20, '[{\"key\": \"A\", \"value\": \"Dhommah\"}, {\"key\": \"B\", \"value\": \"Kasroh\"}, {\"key\": \"C\", \"value\": \"Fathah\"}, {\"key\": \"D\", \"value\": \"Sukun\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'db2e8050-bd22-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('21260ec9-bb0f-11ef-8196-00163e047c76', 'ISIM SIFAT MAUSHUF', 'Dalam struktur Sifat Maushuf, mana yang merupakan maushuf (yang disifati)?', 20, '[{\"key\": \"A\", \"value\": \"Kata kedua dalam rangkaian\"}, {\"key\": \"B\", \"value\": \"Kata pertama dalam rangkaian\"}, {\"key\": \"C\", \"value\": \"Kata yang mengikuti alif dan lam\"}, {\"key\": \"D\", \"value\": \"Kata yang diakhiri dengan tanwin\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('21262123-bb0f-11ef-8196-00163e047c76', 'ISIM SIFAT MAUSHUF', 'Kata \"جَدِيْدٌ\" dalam kalimat بَيْتٌ جَدِيْدٌ berfungsi sebagai?', 20, '[{\"key\": \"A\", \"value\": \"Maushuf\"}, {\"key\": \"B\", \"value\": \"Sifat\"}, {\"key\": \"C\", \"value\": \"Isim Jamak\"}, {\"key\": \"D\", \"value\": \"Isim Mufrod\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('21263224-bb0f-11ef-8196-00163e047c76', 'ISIM SIFAT MAUSHUF', 'Jika maushuf adalah obyek yang tidak berakal, bagaimana bentuk sifatnya dalam bentuk jamak?', 20, '[{\"key\": \"A\", \"value\": \"Sifat juga dalam bentuk jamak\"}, {\"key\": \"B\", \"value\": \"Sifat dalam bentuk mufrod\"}, {\"key\": \"C\", \"value\": \"Sifat dalam bentuk Mutsanna\"}, {\"key\": \"D\", \"value\": \"Sifat dalam bentuk Ma’rifah\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('212644cc-bb0f-11ef-8196-00163e047c76', 'ISIM SIFAT MAUSHUF', 'Apa ciri dari Sifat Maushuf pada isim jamak yang berakal?', 20, '[{\"key\": \"A\", \"value\": \"Sifat harus dalam bentuk mufrod\"}, {\"key\": \"B\", \"value\": \"Sifat harus dalam bentuk jamak\"}, {\"key\": \"C\", \"value\": \"Sifat harus dalam bentuk Mutsanna\"}, {\"key\": \"D\", \"value\": \"Sifat harus dalam bentuk Ma’rifah\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('21265985-bb0f-11ef-8196-00163e047c76', 'ISIM SIFAT MAUSHUF', 'Mana yang merupakan contoh Sifat Maushuf yang terdiri dari tiga rangkaian isim?', 20, '[{\"key\": \"A\", \"value\": \" بَيْتٌ جَدِيْدٌ\"}, {\"key\": \"B\", \"value\": \" الْبَيْتُ الْجَدِيْدُ\"}, {\"key\": \"C\", \"value\": \" بَيْتٌ كَبِيْرٌ وَاسِعٌ\"}, {\"key\": \"D\", \"value\": \" الطَّالِبُ الْجَدِيْدُ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('221c147f-baf5-11ef-8196-00163e047c76', 'ISIM NAKIRAH DAN MAKRIFAH', 'Pilihlah contoh berikut yang termasuk Isim ma’rifah', 20, '[{\"key\": \"A\", \"value\": \" كِتَابٌ\"}, {\"key\": \"B\", \"value\": \" الْكِتَابُ\"}, {\"key\": \"C\", \"value\": \" قَلَمٌ\"}, {\"key\": \"D\", \"value\": \" شَجَرَةٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'f4e744ac-bd21-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('221c2342-baf5-11ef-8196-00163e047c76', 'ISIM NAKIRAH DAN MAKRIFAH', 'Pilihlah contoh berikut yang termasuk Isim Nakirah', 20, '[{\"key\": \"A\", \"value\": \" فى\"}, {\"key\": \"B\", \"value\": \" هُوَ\"}, {\"key\": \"C\", \"value\": \" هَذَا\"}, {\"key\": \"D\", \"value\": \" أُسْتَاذٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'f4e744ac-bd21-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('221c2f61-baf5-11ef-8196-00163e047c76', 'ISIM NAKIRAH DAN MAKRIFAH', 'Manakah yang termasuk dalam isim ma’rifah yang menggunakan Isim alam?', 20, '[{\"key\": \"A\", \"value\": \" ذَالِكَ\"}, {\"key\": \"B\", \"value\": \" الَّذِيْ \"}, {\"key\": \"C\", \"value\": \" هُوَ\"}, {\"key\": \"D\", \"value\": \" إِبْرَاهِيْمٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'f4e744ac-bd21-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('221c3d3e-baf5-11ef-8196-00163e047c76', 'ISIM NAKIRAH DAN MAKRIFAH', 'Manakah yang termasuk dalam isim ma’rifah yang menggunakan Isim Isyaroh?', 20, '[{\"key\": \"A\", \"value\": \" تِلْكَ\"}, {\"key\": \"B\", \"value\": \" مُحَمَّدٌ\"}, {\"key\": \"C\", \"value\": \" الَّتِي\"}, {\"key\": \"D\", \"value\": \" أَنْتَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'f4e744ac-bd21-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('221c47fa-baf5-11ef-8196-00163e047c76', 'ISIM NAKIRAH DAN MAKRIFAH', 'Manakah yang termasuk dalam isim ma’rifah yang menggunakan Isim dhomir muttasil', 20, '[{\"key\": \"A\", \"value\": \" أَنْتَ\"}, {\"key\": \"B\", \"value\": \" هُنَاكَ\"}, {\"key\": \"C\", \"value\": \" الْكِتَابُ\"}, {\"key\": \"D\", \"value\": \" قَلَمُكَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'f4e744ac-bd21-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('22690886-bb29-11ef-8196-00163e047c76', 'FIIL AMR DAN NAHYI', 'Hamzah yang digunakan dalam Fi’il Amr disebut dengan ...', 20, '[{\"key\": \"A\", \"value\": \"Hamzah Washal\"}, {\"key\": \"B\", \"value\": \"Hamzah Qathi\"}, {\"key\": \"C\", \"value\": \"Hamzah Isyarah\"}, {\"key\": \"D\", \"value\": \"Hamzah Istifham\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '60065b85-bd23-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('22692687-bb29-11ef-8196-00163e047c76', 'FIIL AMR DAN NAHYI', 'Fi’il Nahyi terbentuk dari ...', 20, '[{\"key\": \"A\", \"value\": \"Fiil Madhi ditambah harf jar\"}, {\"key\": \"B\", \"value\": \"Fiil Mudhari ditambah (لا) Nahiyah\"}, {\"key\": \"C\", \"value\": \"Fiil Amr ditambah huruf mudhariah\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '60065b85-bd23-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('226939d4-bb29-11ef-8196-00163e047c76', 'FIIL AMR DAN NAHYI', 'Manakah bentuk yang benar dari Fi’il Nahyi?', 20, '[{\"key\": \"A\", \"value\": \" لاَ تَفْتَحْ\"}, {\"key\": \"B\", \"value\": \" اُفْتَحْ\"}, {\"key\": \"C\", \"value\": \" يَفْتَحُ\"}, {\"key\": \"D\", \"value\": \" فَتَحَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '60065b85-bd23-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('22694559-bb29-11ef-8196-00163e047c76', 'FIIL AMR DAN NAHYI', 'Bentuk Fi’il Amr dari kata “سَمِعَ - يَسْمَعُ” adalah ...', 20, '[{\"key\": \"A\", \"value\": \" اِسْمَعْ\"}, {\"key\": \"B\", \"value\": \" سَمَعَ\"}, {\"key\": \"C\", \"value\": \" لاَ تَسْمَعْ\"}, {\"key\": \"D\", \"value\": \" يَسْمَعُ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '60065b85-bd23-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('22695ac4-bb29-11ef-8196-00163e047c76', 'FIIL AMR DAN NAHYI', 'Bentuk Fi’il Nahyi dari kata “شَرِبَ - يَشْرَبُ” adalah ...', 20, '[{\"key\": \"A\", \"value\": \" لاَ تَشْرَبْ\"}, {\"key\": \"B\", \"value\": \" اِشْرَبْ\"}, {\"key\": \"C\", \"value\": \" لاَ يَشْرَبُ\"}, {\"key\": \"D\", \"value\": \" شَرِبَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '60065b85-bd23-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('257c668e-bb22-11ef-8196-00163e047c76', 'KAANA DAN SAUDARINYA', 'Apa makna dari Kaana?', 20, '[{\"key\": \"A\", \"value\": \"Keadaan\"}, {\"key\": \"B\", \"value\": \"Kejadian\"}, {\"key\": \"C\", \"value\": \"Kematian\"}, {\"key\": \"D\", \"value\": \"Kebetulan\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '2500c400-bd23-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('257c7c84-bb22-11ef-8196-00163e047c76', 'KAANA DAN SAUDARINYA', 'Apa fungsi Kaana di dalam kalimat?', 20, '[{\"key\": \"A\", \"value\": \"Penegas\"}, {\"key\": \"B\", \"value\": \"Sesuatu yang terjadi di masa lampau\"}, {\"key\": \"C\", \"value\": \"Menyatakan kebiasaan\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '2500c400-bd23-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('257c8cda-bb22-11ef-8196-00163e047c76', 'KAANA DAN SAUDARINYA', 'Bagaimana keadaan suatu kata jika dimasuki oleh Kaana dan saudari-saudarinya?', 20, '[{\"key\": \"A\", \"value\": \"Khobar kaana irobnya menjadi nashob\"}, {\"key\": \"B\", \"value\": \"Isim kaana irobnya menjadi nashob\"}, {\"key\": \"C\", \"value\": \"Isim kaana irobnya menjadi Jarr\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '2500c400-bd23-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('257c9980-bb22-11ef-8196-00163e047c76', 'KAANA DAN SAUDARINYA', 'Manakah berikut yang \"bukan\" termasuk saudari-saudari Kaana?', 20, '[{\"key\": \"A\", \"value\": \" لَيْشَ\"}, {\"key\": \"B\", \"value\": \" أَمْسَى\"}, {\"key\": \"C\", \"value\": \" ظَلَّ\"}, {\"key\": \"D\", \"value\": \" لَعَلَّ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '2500c400-bd23-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('257ca6b6-bb22-11ef-8196-00163e047c76', 'KAANA DAN SAUDARINYA', 'Suadari Kaana “صَارَ ” memiliki makna?', 20, '[{\"key\": \"A\", \"value\": \"Terus-menerus\"}, {\"key\": \"B\", \"value\": \"Meniadakan\"}, {\"key\": \"C\", \"value\": \"Menggambarkan dari satu keadaan menjadi keadaan lain\"}, {\"key\": \"D\", \"value\": \"Menjelaskan frekuensi\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '2500c400-bd23-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('28f7ab12-bb16-11ef-8196-00163e047c76', 'JUMLAH ISMIYAH', 'Berikut ini merupakan contoh dari jumlah ismiyyah yang terdiri dari Isim jamak mudzakkar salim', 20, '[{\"key\": \"A\", \"value\": \" الأُسْتَاذُ جَمِيْلٌ\"}, {\"key\": \"B\", \"value\": \" ذَلِكَ فَصْلٌ\"}, {\"key\": \"C\", \"value\": \" المُدَرِّسُوْنَ مَاهِرُوْنَ\"}, {\"key\": \"D\", \"value\": \" تِلكَ مَدْرَسَةٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b59eca84-bd22-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('28f7be75-bb16-11ef-8196-00163e047c76', 'JUMLAH ISMIYAH', 'Berikut ini merupakan contoh dari jumlah ismiyyah yang terdiri dari Isim mutsanna muannats', 20, '[{\"key\": \"A\", \"value\": \" الطَّالِبُ مَاهِرٌ\"}, {\"key\": \"B\", \"value\": \" الطَّالِبَانِ مَاهِرَانِ\"}, {\"key\": \"C\", \"value\": \" الطَّالِبَةُ مَاهِرَةٌ\"}, {\"key\": \"D\", \"value\": \" الطَّالِبَتَانِ مَاهِرَتَانِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b59eca84-bd22-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('28f7d36a-bb16-11ef-8196-00163e047c76', 'JUMLAH ISMIYAH', 'Berikut ini merupakan contoh dari jumlah fi’liyyah yang terdiri dari fail jamak taksir', 20, '[{\"key\": \"A\", \"value\": \" مِنَ المَدْرَسَةِ\"}, {\"key\": \"B\", \"value\": \" تَعَلَّمَ المُتَلِّمُ تَعْلِيْمًا\"}, {\"key\": \"C\", \"value\": \" ذَهَبَ الرِّجَالُ إِلىَ السُّوْقِ\"}, {\"key\": \"D\", \"value\": \" أًحْمَدُ قَائِم\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b59eca84-bd22-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('28f7e2d4-bb16-11ef-8196-00163e047c76', 'JUMLAH ISMIYAH', 'Berikut ini merupakan contoh dari jumlah ismiyyah yang terdiri dari Isim mutsanna mudzakkar', 20, '[{\"key\": \"A\", \"value\": \" الطَّالِبَانِ مَاهِرَانِ\"}, {\"key\": \"B\", \"value\": \" الطَّالِبَتَانِ مَاهِرَتَانِ\"}, {\"key\": \"C\", \"value\": \" تَعَلَّمَ المُتَلِّمُ تَعْلِيْمًا\"}, {\"key\": \"D\", \"value\": \" الأُسْتَاذُ جَمِيْلٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b59eca84-bd22-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('28f7f88b-bb16-11ef-8196-00163e047c76', 'JUMLAH ISMIYAH', 'Berikut ini merupakan contoh dari jumlah ismiyyah yang terdiri dari fail jamak muannats salim', 20, '[{\"key\": \"A\", \"value\": \" المُدَرِّسُوْنَ مَاهِرُوْنَ\"}, {\"key\": \"B\", \"value\": \" المُدَرِّسَاتُ مَاهِرُوْنَ\"}, {\"key\": \"C\", \"value\": \" المُدَرِّسَاتُ مَاهِرَاتُ\"}, {\"key\": \"D\", \"value\": \" المُدَرِّسُوْنَ مَاهِرَةٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b59eca84-bd22-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('2ed7b6bd-bae1-11ef-8196-00163e047c76', 'Isim Berdasarkan Gender', 'Berikut merupakan contoh dari Isim Muannats, kecuali..', 20, '[{\"key\": \"A\", \"value\": \"نًامًتْ عَائِشَةُ\"}, {\"key\": \"B\", \"value\": \" تِلْكَ الْمَدْرَسَةُ\"}, {\"key\": \"C\", \"value\": \"مُحَمَّدٌ مُدَرِّسٌ\"}, {\"key\": \"D\", \"value\": \"هَذِهِ السَّبُّوْرَةُ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '8526b927-bd21-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('2ed7c4ef-bae1-11ef-8196-00163e047c76', 'Isim Berdasarkan Gender', 'Berikut merupakan contoh dari Isim Mudzakkar, kecuali..', 20, '[{\"key\": \"A\", \"value\": \"هَذَا كِتَابٌ\"}, {\"key\": \"B\", \"value\": \"فَاطِمَةُ مُتَعَلِّمَةٌ\"}, {\"key\": \"C\", \"value\": \"جَاءَ المُدَرِّسُ\"}, {\"key\": \"D\", \"value\": \"ذَلِكَ مَسْجِدٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '8526b927-bd21-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('2ed7d158-bae1-11ef-8196-00163e047c76', 'Isim Berdasarkan Gender', 'Pilihlah susunan kalimat yang benar pada pilihan berikut …', 20, '[{\"key\": \"A\", \"value\": \"تِلْكَ فَصْلٌ\"}, {\"key\": \"B\", \"value\": \"هَذِهِ قلَمٌ\"}, {\"key\": \"C\", \"value\": \"قَرَأَ مَرْيَمُ الرِّسَالَةَ\"}, {\"key\": \"D\", \"value\": \"عَلَّمَ الْمُدَرِّسُ الطّالِبَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '8526b927-bd21-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('2ed7dc0e-bae1-11ef-8196-00163e047c76', 'Isim Berdasarkan Gender', 'Kata “يَدٌ” adalah isim muannats dikarenakan …', 20, '[{\"key\": \"A\", \"value\": \"Berpasangan\"}, {\"key\": \"B\", \"value\": \"Benda langit\"}, {\"key\": \"C\", \"value\": \"Kata kerja\"}, {\"key\": \"D\", \"value\": \"Kata isyarat\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '8526b927-bd21-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('2ed7e67d-bae1-11ef-8196-00163e047c76', 'Isim Berdasarkan Gender', 'Manakah dari kalimat berikut ini yang merupakan contoh kalimat yang benar?', 20, '[{\"key\": \"A\", \"value\": \"عَائِشَةُ نَائِمٌ\"}, {\"key\": \"B\", \"value\": \"مُحَمَّدٌ يَجْرِى إِلَى الْمَيْدَانِ\"}, {\"key\": \"C\", \"value\": \"الطَّالِبُ جَالِسَةٌ\"}, {\"key\": \"D\", \"value\": \"رَجَعَتْ إِبْرَاهِيْمُ مِنَ الْمَدْرَسَةِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '8526b927-bd21-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('30e4bafc-baeb-11ef-8196-00163e047c76', 'ISIM MAUSHUL', 'Isim Maushul adalah….', 20, '[{\"key\": \"A\", \"value\": \"Isim yang menerangkan kalimat\"}, {\"key\": \"B\", \"value\": \"Isim yang menunjukkan pada kuantitas\"}, {\"key\": \"C\", \"value\": \"isim yang berfungsi untuk menghubungkan beberapa kalimat menjadi satu kalimat\"}, {\"key\": \"D\", \"value\": \"Isim yang dapat berdiri sendiri\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b6c897f6-bd21-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('30e4cb50-baeb-11ef-8196-00163e047c76', 'ISIM MAUSHUL', 'Berikut merupakan contoh isim maushul, kecuali..', 20, '[{\"key\": \"A\", \"value\": \" الَّذِيْ\"}, {\"key\": \"B\", \"value\": \" الَّتِيْ\"}, {\"key\": \"C\", \"value\": \" الَّذِيْنَ\"}, {\"key\": \"D\", \"value\": \" الْحَمْدُ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b6c897f6-bd21-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('30e4d73c-baeb-11ef-8196-00163e047c76', 'ISIM MAUSHUL', 'Jika isim maushul berbentuk mufrod mudzakkar maka menggunakan…', 20, '[{\"key\": \"A\", \"value\": \" الَّذِيْ\"}, {\"key\": \"B\", \"value\": \" الَّتِيْ\"}, {\"key\": \"C\", \"value\": \" الَّذِيْنَ\"}, {\"key\": \"D\", \"value\": \" اللَّاتِيْ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b6c897f6-bd21-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('30e4e262-baeb-11ef-8196-00163e047c76', 'ISIM MAUSHUL', 'Jika isim maushul berbentuk mufrod muannats maka menggunakan…', 20, '[{\"key\": \"A\", \"value\": \" الَّذِيْ\"}, {\"key\": \"B\", \"value\": \" الَّتِيْ\"}, {\"key\": \"C\", \"value\": \" الَّذَان\"}, {\"key\": \"D\", \"value\": \" الَّتَانِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b6c897f6-bd21-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('30e4ecfb-baeb-11ef-8196-00163e047c76', 'ISIM MAUSHUL', 'Jika isim maushul berbentuk Mutsanna mudzakkar maka menggunakan…', 20, '[{\"key\": \"A\", \"value\": \" الَّذِيْ\"}, {\"key\": \"B\", \"value\": \" الَّذَان\"}, {\"key\": \"C\", \"value\": \" الَّتَانِ\"}, {\"key\": \"D\", \"value\": \" الَّذِيْنَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b6c897f6-bd21-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('3664df76-badd-11ef-8196-00163e047c76', 'Unsur pembentuk kalimat (الْجُمْلاَةُ المُفِيْدَةُ)', 'Berikut ini adalah macam - macam dari kata ( أنواع الكلمة ), kecuali..', 20, '[{\"key\": \"A\", \"value\": \"إسم\"}, {\"key\": \"B\", \"value\": \"جملة\"}, {\"key\": \"C\", \"value\": \"فعل\"}, {\"key\": \"D\", \"value\": \"حرف\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '68477fd4-bd21-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('3664eebd-badd-11ef-8196-00163e047c76', 'Unsur pembentuk kalimat (الْجُمْلاَةُ المُفِيْدَةُ)', 'Manakah kata dibawah ini yang merupakan isim?', 20, '[{\"key\": \"A\", \"value\": \"أُسْتَاذٌ\"}, {\"key\": \"B\", \"value\": \"قَرَآ\"}, {\"key\": \"C\", \"value\": \"جَلَس\"}, {\"key\": \"D\", \"value\": \"فِي\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '68477fd4-bd21-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('3664fe2e-badd-11ef-8196-00163e047c76', 'Unsur pembentuk kalimat (الْجُمْلاَةُ المُفِيْدَةُ)', 'Apakah yang dimaksud dengan fi’il', 20, '[{\"key\": \"A\", \"value\": \"kata yang menunjukan kata benda\"}, {\"key\": \"B\", \"value\": \"Kata yang menunjukan suatu peristiwa\"}, {\"key\": \"C\", \"value\": \"Kata menunjukan perintahKata menunjukan perintah\"}, {\"key\": \"D\", \"value\": \"Kata yang menunjukan suatu tugas \"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '68477fd4-bd21-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('36650c6e-badd-11ef-8196-00163e047c76', 'Unsur pembentuk kalimat (الْجُمْلاَةُ المُفِيْدَةُ)', 'Manakah contoh berikut yang terdapat harf jar?', 20, '[{\"key\": \"A\", \"value\": \" اَلرَّحْمٰنُ عَلَى الْعَرْشِ اسْتَوٰى\"}, {\"key\": \"B\", \"value\": \"أَكَلْتُ الْخُبْز\"}, {\"key\": \"C\", \"value\": \"حَضَرَتْ مَرْيَم\"}, {\"key\": \"D\", \"value\": \"قَرَأَ إِبْرَاهِيْمُ الْكِتَابَ \"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '68477fd4-bd21-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('366517d5-badd-11ef-8196-00163e047c76', 'Unsur pembentuk kalimat (الْجُمْلاَةُ المُفِيْدَةُ)', 'Dibawah  ini  yang termasuk dalam Harf Jar adalah ?', 20, '[{\"key\": \"A\", \"value\": \"نَظَر\"}, {\"key\": \"B\", \"value\": \"جَمُل\"}, {\"key\": \"C\", \"value\": \"قَرُب\"}, {\"key\": \"D\", \"value\": \"فِي\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '68477fd4-bd21-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('37667ed3-bae6-11ef-8196-00163e047c76', 'ISIM BERDASARKAN KUANTITAS', 'Manakah yang merupakan contoh isim mufrod?', 20, '[{\"key\": \"A\", \"value\": \" كِتَابٌ\"}, {\"key\": \"B\", \"value\": \" كِتَابَانِ\"}, {\"key\": \"C\", \"value\": \" كُتُبٌ\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '9c62d709-bd21-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('37668db9-bae6-11ef-8196-00163e047c76', 'ISIM BERDASARKAN KUANTITAS', 'Manakah yang merupakan contoh isim mutsanna?', 20, '[{\"key\": \"A\", \"value\": \" مُسْلِمٌ\"}, {\"key\": \"B\", \"value\": \"مُسْلِمَانِ\"}, {\"key\": \"C\", \"value\": \" مُسْلِمُوْنَ\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '9c62d709-bd21-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('376699f0-bae6-11ef-8196-00163e047c76', 'ISIM BERDASARKAN KUANTITAS', 'Manakah yang merupakan contoh isim jamak taksir?', 20, '[{\"key\": \"A\", \"value\": \" قَلَمٌ\"}, {\"key\": \"B\", \"value\": \" قَلَمَانِ\"}, {\"key\": \"C\", \"value\": \" أَقْلَامٌ\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '9c62d709-bd21-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('3766a952-bae6-11ef-8196-00163e047c76', 'ISIM BERDASARKAN KUANTITAS', 'Salah satu ciri Isim Jamak mudzakkar salim diakhiri \"ون\", kecuali …', 20, '[{\"key\": \"A\", \"value\": \"Ketika dalam keadaan rafa’\"}, {\"key\": \"B\", \"value\": \"Ketika posisinya menjadi subjek\"}, {\"key\": \"C\", \"value\": \"Ketika posisinya menjadi pelaku\"}, {\"key\": \"D\", \"value\": \"Ketika dalam keadaan nasab atau jar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '9c62d709-bd21-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('3766b46f-bae6-11ef-8196-00163e047c76', 'ISIM BERDASARKAN KUANTITAS', 'Manakah yang merupakan contoh isim jamak muannats salim?', 20, '[{\"key\": \"A\", \"value\": \" مُسْلِمٌ\"}, {\"key\": \"B\", \"value\": \" مُسْلِمَةٌ\"}, {\"key\": \"C\", \"value\": \" مُسْلِمَاتُ\"}, {\"key\": \"D\", \"value\": \" مُسْلِمُوْنَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '9c62d709-bd21-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('3aeb3b11-bb28-11ef-8196-00163e047c76', 'FIIL AMR DAN NAHYI', 'Apa yang dimaksud dengan Fi’il Nahyi?', 20, '[{\"key\": \"A\", \"value\": \"Kata kerja perintah\"}, {\"key\": \"B\", \"value\": \"Kata sambung\"}, {\"key\": \"C\", \"value\": \"Kata bantu\"}, {\"key\": \"D\", \"value\": \"Kata kerja larangan\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '60065b85-bd23-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('3aeb4a9e-bb28-11ef-8196-00163e047c76', 'FIIL AMR DAN NAHYI', 'Berikut merupakan contoh dari fi’il nahyi..', 20, '[{\"key\": \"A\", \"value\": \" لَا تَضْرِبْ\"}, {\"key\": \"B\", \"value\": \" لاَ يَجْلِسُ\"}, {\"key\": \"C\", \"value\": \" جَلَسَ\"}, {\"key\": \"D\", \"value\": \" اُكْتُبْ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '60065b85-bd23-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('3aeb59e5-bb28-11ef-8196-00163e047c76', 'FIIL AMR DAN NAHYI', 'Bentuk fi’il amri dari kata “نَصَرَ - يَنْصُرُ” adalah..', 20, '[{\"key\": \"A\", \"value\": \" نَنْصُرُ\"}, {\"key\": \"B\", \"value\": \" اُنْصُرْ\"}, {\"key\": \"C\", \"value\": \" أَنْصُرُ\"}, {\"key\": \"D\", \"value\": \" اِنْصَرْ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '60065b85-bd23-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('3aeb65cd-bb28-11ef-8196-00163e047c76', 'FIIL AMR DAN NAHYI', 'Bentuk fi’il amri dari kata “مَزَحَ - يَمْزَحُ” adalah..', 20, '[{\"key\": \"A\", \"value\": \" أَمْزَحُ\"}, {\"key\": \"B\", \"value\": \" تًمْزَحُ\"}, {\"key\": \"C\", \"value\": \" اِمْزَحْ\"}, {\"key\": \"D\", \"value\": \" لَا تَمْزَحْ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '60065b85-bd23-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('3aeb72e8-bb28-11ef-8196-00163e047c76', 'FIIL AMR DAN NAHYI', 'Berikut merupakan contoh dari fi’il amri…..', 20, '[{\"key\": \"A\", \"value\": \" ذَهَبْتُ إلَى المَدْرَسَةِ\"}, {\"key\": \"B\", \"value\": \" كَتَبَ كَاتِبٌ الْكِتَابَةَ\"}, {\"key\": \"C\", \"value\": \" قُمِ اللَّيْلَ إِلَّا قَلِيْلًا\"}, {\"key\": \"D\", \"value\": \" لَا تَحْزَنْ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '60065b85-bd23-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('3e6871f6-bafe-11ef-8196-00163e047c76', 'ISIM IDHOFAT', 'Isim Idhofat adalah..', 20, '[{\"key\": \"A\", \"value\": \"Suatu isim yang menunjukkan Isyarat\"}, {\"key\": \"B\", \"value\": \"Suatu isim yang menunjukkan jumlah\"}, {\"key\": \"C\", \"value\": \"Suatu isim yang disandarkan kepada isim lain sehingga menimbulkan makna yang lebih spesifik\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '4a91f951-bd22-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('3e688497-bafe-11ef-8196-00163e047c76', 'ISIM IDHOFAT', 'Idhofat juga memiliki beberapa makna yaitu .....', 20, '[{\"key\": \"A\", \"value\": \"Bermakna dari\"}, {\"key\": \"B\", \"value\": \"Bermakna kepemilikan\"}, {\"key\": \"C\", \"value\": \"Bermakna di dalam\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '4a91f951-bd22-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('3e6890fd-bafe-11ef-8196-00163e047c76', 'ISIM IDHOFAT', 'Syarat aturan Mudhof ada berapa?', 20, '[{\"key\": \"A\", \"value\": \"1\"}, {\"key\": \"B\", \"value\": \"2\"}, {\"key\": \"C\", \"value\": \"3\"}, {\"key\": \"D\", \"value\": \"4\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '4a91f951-bd22-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('3e689bcd-bafe-11ef-8196-00163e047c76', 'ISIM IDHOFAT', 'Berikut syarat aturan mudhof..', 20, '[{\"key\": \"A\", \"value\": \"Boleh di-tanwin\"}, {\"key\": \"B\", \"value\": \"Tidak boleh tanwin\"}, {\"key\": \"C\", \"value\": \"Mengandung alif lam\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '4a91f951-bd22-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('3e68a684-bafe-11ef-8196-00163e047c76', 'ISIM IDHOFAT', 'Manakah pernyataan berikut yang benar mengenai syarat aturan Mudhof Ilaihi?', 20, '[{\"key\": \"A\", \"value\": \"Mudhof Ilaihi tidak boleh mengandung alif lam\"}, {\"key\": \"B\", \"value\": \"Huruf terakhir isim Mudhof Ilaihi harus berharakat kasroh\"}, {\"key\": \"C\", \"value\": \"Mudhof Ilaihi tidak boleh di-tanwin\"}, {\"key\": \"D\", \"value\": \"Mudhof Ilaihi selalu menggunakan nun mutsanna\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '4a91f951-bd22-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('4141659c-baf3-11ef-8196-00163e047c76', 'ISIM NAKIRAH DAN MAKRIFAH', 'Isim Nakirah adalah ….', 20, '[{\"key\": \"A\", \"value\": \"Isim yang menunjukkan kata kerja\"}, {\"key\": \"B\", \"value\": \"isim yang menunjukkan sesuatu yang belum jelas pengertiannya.\"}, {\"key\": \"C\", \"value\": \"Isim yang menunjukkan lokasi\"}, {\"key\": \"D\", \"value\": \"Isim yang menunjukkan sesuatu yang khusus dan jelas\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'f4e744ac-bd21-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('414176d7-baf3-11ef-8196-00163e047c76', 'ISIM NAKIRAH DAN MAKRIFAH', 'Isim Ma’rifah adalah ….', 20, '[{\"key\": \"A\", \"value\": \"Isim yang bersifat khusus dan menunjuk pada benda tertentu\"}, {\"key\": \"B\", \"value\": \"Isim yang menunjukkan kata perintah\"}, {\"key\": \"C\", \"value\": \"Isim yang menunjukkan kata kerja\"}, {\"key\": \"D\", \"value\": \"Isim yang menunjukkan pada sesuatu yang bersifat umum\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'f4e744ac-bd21-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('414182aa-baf3-11ef-8196-00163e047c76', 'ISIM NAKIRAH DAN MAKRIFAH', 'Berikut merupakan ciri-ciri isim Nakirah..', 20, '[{\"key\": \"A\", \"value\": \"Tidak memiliki alif-lam di awal kata \"}, {\"key\": \"B\", \"value\": \"Digunakan untuk menunjukkan sesuatu yang umum \"}, {\"key\": \"C\", \"value\": \"Biasanya berakhiran tanwin \"}, {\"key\": \"D\", \"value\": \"Semua jawaban benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'f4e744ac-bd21-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('41418dc1-baf3-11ef-8196-00163e047c76', 'ISIM NAKIRAH DAN MAKRIFAH', 'Berikut merupakan ciri isim Ma’rifah…', 20, '[{\"key\": \"A\", \"value\": \"Diawali huruf alif dan lam (ال)\"}, {\"key\": \"B\", \"value\": \"Tidak diawali huruf alif dan lam (ال)\"}, {\"key\": \"C\", \"value\": \"Isim yang wajib berakhiran harakat tanwin\"}, {\"key\": \"D\", \"value\": \"Semua Benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'f4e744ac-bd21-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('414198de-baf3-11ef-8196-00163e047c76', 'ISIM NAKIRAH DAN MAKRIFAH', 'Berikut merupakan macam-macam isim Ma’rifah, kecuali ….', 20, '[{\"key\": \"A\", \"value\": \"Isim dhomir\"}, {\"key\": \"B\", \"value\": \"Isim Mudhof\"}, {\"key\": \"C\", \"value\": \"Harf Jar\"}, {\"key\": \"D\", \"value\": \"Isim alam\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'f4e744ac-bd21-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('51ab77b7-bb12-11ef-8196-00163e047c76', 'HARF DHOROF,SYIBHUL JUMLAH', 'Berikut adalah harf yang digunakan pada fiil, kecuali', 20, '[{\"key\": \"A\", \"value\": \"Harf Jazm\"}, {\"key\": \"B\", \"value\": \"Harf Nashab\"}, {\"key\": \"C\", \"value\": \"Harf qad (قَدْ)\"}, {\"key\": \"D\", \"value\": \"Harf nida\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('51ab8696-bb12-11ef-8196-00163e047c76', 'HARF DHOROF,SYIBHUL JUMLAH', 'Harf apa saja yang masuk pada isim dan fi’il ....', 20, '[{\"key\": \"A\", \"value\": \" Harf Athaf\"}, {\"key\": \"B\", \"value\": \"Wawul hal\"}, {\"key\": \"C\", \"value\": \"Wawul qosam\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('51ab9410-bb12-11ef-8196-00163e047c76', 'HARF DHOROF,SYIBHUL JUMLAH', 'Manakah kata berikut yang merupakan syibhul jumlah dhzorof zaman\r\nأًكًلْتُ التُّفَّاحَةَ فِى الْبَيْتِ بَعْدَ الْعِشَأءِ\r\n\r\n', 20, '[{\"key\": \"A\", \"value\": \" أًكًلْتُ\"}, {\"key\": \"B\", \"value\": \" التُّفَّاحَةَ\"}, {\"key\": \"C\", \"value\": \" فِى الْبَيْتِ\"}, {\"key\": \"D\", \"value\": \" بَعْدَ الْعِشَأءِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('51aba574-bb12-11ef-8196-00163e047c76', 'HARF DHOROF,SYIBHUL JUMLAH', 'Manakah contoh berikut yang merupakan syibhul jumlah dhzorof makan', 20, '[{\"key\": \"A\", \"value\": \" فَوْقَ الْشَّجَرَةِ\"}, {\"key\": \"B\", \"value\": \" قَبْلَ الظُّهْر\"}, {\"key\": \"C\", \"value\": \" ضَرَبَ الْكَلْبُ\"}, {\"key\": \"D\", \"value\": \" بَعْدَ صَلَاةِ اْلعِشَاءِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('51abb0d4-bb12-11ef-8196-00163e047c76', 'HARF DHOROF,SYIBHUL JUMLAH', 'Manakah kata berikut yang merupakan dhorof makan\r\nقَامَ الأُسْتَاذُ أَمَامَ الْفصْلِ\r\n', 20, '[{\"key\": \"A\", \"value\": \" قَامَ  \"}, {\"key\": \"B\", \"value\": \" الأُسْتَاذُ\"}, {\"key\": \"C\", \"value\": \" أَمَامَ\"}, {\"key\": \"D\", \"value\": \" الْفصْلِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('529ccb40-baed-11ef-8196-00163e047c76', 'ISIM MAUSHUL', 'Apa bentuk Isim Maushul yang digunakan untuk Muannats (perempuan) dalam kalimat?', 20, '[{\"key\": \"A\", \"value\": \" الَّذِيْ\"}, {\"key\": \"B\", \"value\": \" الَّتِيْ\"}, {\"key\": \"C\", \"value\": \" الَّذَانِ\"}, {\"key\": \"D\", \"value\": \" الَّتَانِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b6c897f6-bd21-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('529cdb19-baed-11ef-8196-00163e047c76', 'ISIM MAUSHUL', 'Apa kedudukan الَّذَانِ dalam kalimat “جَاءَ الطَّالِبَانِ الَّذَانِ يَدْرُسَانِ الشَّرِيْعَةَ”?', 20, '[{\"key\": \"A\", \"value\": \"Isim Isyarah\"}, {\"key\": \"B\", \"value\": \"Isim Maushul yang menunjukkan dua orang\"}, {\"key\": \"C\", \"value\": \"Sifat untuk kata sebelumnya\"}, {\"key\": \"D\", \"value\": \"Keterangan waktu\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'd342457a-bd21-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('529ce715-baed-11ef-8196-00163e047c76', 'ISIM MAUSHUL', 'Apa bentuk Isim Maushul yang digunakan untuk Jama\' (banyak) dari Muannats (perempuan)?', 20, '[{\"key\": \"A\", \"value\": \" الَّذِيْ\"}, {\"key\": \"B\", \"value\": \" اللَّاتِيْ\"}, {\"key\": \"C\", \"value\": \" الَّذَانِ\"}, {\"key\": \"D\", \"value\": \" الَّتَانِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b6c897f6-bd21-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('529cf448-baed-11ef-8196-00163e047c76', 'ISIM MAUSHUL', 'Dalam kalimat Al-Quran “اَرَءَيْتَ الَّذِيْ يُكَذِّبُ بِالدِّيْنِۗ,” bentuk mana yang digunakan untuk Isim Maushul?', 20, '[{\"key\": \"A\", \"value\": \" الَّذِيْ\"}, {\"key\": \"B\", \"value\": \" اللَّاتِيْ\"}, {\"key\": \"C\", \"value\": \" الَّذَانِ\"}, {\"key\": \"D\", \"value\": \" الَّتَانِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b6c897f6-bd21-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('577b8132-bb19-11ef-8196-00163e047c76', 'MABNI DAN MU\'ROB', 'Berikut merupakan contoh I\'rob nashob pada isim mutsanna adalah', 20, '[{\"key\": \"A\", \"value\": \" طاَلِبٌ\"}, {\"key\": \"B\", \"value\": \" طاَلِبَانِ\"}, {\"key\": \"C\", \"value\": \" طاَلِبَيْنِ\"}, {\"key\": \"D\", \"value\": \" طُلَّابٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'db2e8050-bd22-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('577b9660-bb19-11ef-8196-00163e047c76', 'MABNI DAN MU\'ROB', 'Manakah contoh yang benar dari I’rob nashob pada isim jamak Mudzakkar salim', 20, '[{\"key\": \"A\", \"value\": \" صَالِحُوْنَ\"}, {\"key\": \"B\", \"value\": \" صَالِحٌ\"}, {\"key\": \"C\", \"value\": \" صَالِحَاتُ\"}, {\"key\": \"D\", \"value\": \" صَالِحِيْنَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'db2e8050-bd22-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('596f12d3-bafc-11ef-8196-00163e047c76', 'DHOMIR MUTTASIL DAN DHOMIR MUNFASIL', 'Apa yang dimaksud dengan Dhomir Muttashil?', 20, '[{\"key\": \"A\", \"value\": \"Kata ganti yang berdiri terpisah dari kata lain\"}, {\"key\": \"B\", \"value\": \"Kata ganti yang menunjukkan subyek atau pelaku  \"}, {\"key\": \"C\", \"value\": \"Kata ganti yang ditulis bersambung dengan kata lain  \"}, {\"key\": \"D\", \"value\": \"Kata ganti yang tidak bisa menunjukkan kepemilikan  \"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '1624ab69-bd22-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('596f2100-bafc-11ef-8196-00163e047c76', 'DHOMIR MUTTASIL DAN DHOMIR MUNFASIL', 'Manakah dari berikut ini yang merupakan contoh Dhomir Munfashil?', 20, '[{\"key\": \"A\", \"value\": \" كِتَابُكَ  \"}, {\"key\": \"B\", \"value\": \" قَلَمُهُ  \"}, {\"key\": \"C\", \"value\": \" هُوَ طَالِبٌ  \"}, {\"key\": \"D\", \"value\": \" كِتَابُنَا  \"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '1624ab69-bd22-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('596f2cea-bafc-11ef-8196-00163e047c76', 'DHOMIR MUTTASIL DAN DHOMIR MUNFASIL', 'Apa fungsi utama Dhomir Muttashil dalam kalimat?', 20, '[{\"key\": \"A\", \"value\": \"Menunjukkan subyek atau pelaku  \"}, {\"key\": \"B\", \"value\": \"Menunjukkan kepemilikan\"}, {\"key\": \"C\", \"value\": \"Menunjukkan lokasi\"}, {\"key\": \"D\", \"value\": \"Menunjukkan objek\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '1624ab69-bd22-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('596f3781-bafc-11ef-8196-00163e047c76', 'DHOMIR MUTTASIL DAN DHOMIR MUNFASIL', 'Manakah dari contoh berikut ini yang merupakan Dhomir Munfashil?', 20, '[{\"key\": \"A\", \"value\": \" هُوَ  \"}, {\"key\": \"B\", \"value\": \" قَلَمِي  \"}, {\"key\": \"C\", \"value\": \" كِتَابُهُ  \"}, {\"key\": \"D\", \"value\": \" رِسَالَتُكُمْ  \"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '1624ab69-bd22-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('596f43b3-bafc-11ef-8196-00163e047c76', 'DHOMIR MUTTASIL DAN DHOMIR MUNFASIL', 'Bagaimana cara membedakan Dhomir Muttashil dari Dhomir Munfashil?', 20, '[{\"key\": \"A\", \"value\": \"Dhomir Muttashil ditulis terpisah, sementara Dhomir Munfashil bersambung  \"}, {\"key\": \"B\", \"value\": \"Dhomir Muttashil menunjukkan subjek, sementara Dhomir Munfashil menunjukkan kepemilikan \"}, {\"key\": \"C\", \"value\": \"Dhomir Muttashil ditulis bersambung, sementara Dhomir Munfashil terpisah  \"}, {\"key\": \"D\", \"value\": \"Dhomir Muttashil tidak dapat digunakan untuk menunjukkan kepemilikan  \"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '1624ab69-bd22-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('59f275f9-bae4-11ef-8196-00163e047c76', 'ISIM BERDASARKAN KUANTITAS', 'Berikut ini adalah pembagian isim berdasarkan kuantitasnya..', 20, '[{\"key\": \"A\", \"value\": \" مُفْرَدٌ\"}, {\"key\": \"B\", \"value\": \" مُثَنَّى\"}, {\"key\": \"C\", \"value\": \" جَمْعٌ\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '9c62d709-bd21-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('59f28723-bae4-11ef-8196-00163e047c76', 'ISIM BERDASARKAN KUANTITAS', 'Isim mufrod menunjukkan bilangan benda sebanyak?', 20, '[{\"key\": \"A\", \"value\": \"Tunggal\"}, {\"key\": \"B\", \"value\": \"Dua\"}, {\"key\": \"C\", \"value\": \"Lebih dari dua\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '9c62d709-bd21-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('59f2933a-bae4-11ef-8196-00163e047c76', 'ISIM BERDASARKAN KUANTITAS', 'Isim mutsanna menunjukkan bilangan benda sebanyak?', 20, '[{\"key\": \"A\", \"value\": \"Tunggal\"}, {\"key\": \"B\", \"value\": \"Dua\"}, {\"key\": \"C\", \"value\": \"Lebih dari dua\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '9c62d709-bd21-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('59f29e18-bae4-11ef-8196-00163e047c76', 'ISIM BERDASARKAN KUANTITAS', 'Isim Jamak menunjukkan bilangan benda sebanyak?', 20, '[{\"key\": \"A\", \"value\": \"Tunggal\"}, {\"key\": \"B\", \"value\": \"Dua\"}, {\"key\": \"C\", \"value\": \"Lebih dari dua\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '9c62d709-bd21-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('59f2a926-bae4-11ef-8196-00163e047c76', 'ISIM BERDASARKAN KUANTITAS', 'Isim jama’ dibagi menjadi?', 20, '[{\"key\": \"A\", \"value\": \"1\"}, {\"key\": \"B\", \"value\": \"2\"}, {\"key\": \"C\", \"value\": \"3\"}, {\"key\": \"D\", \"value\": \"4\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '9c62d709-bd21-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('5e639f2e-bade-11ef-8196-00163e047c76', 'Unsur pembentuk kalimat (الْجُمْلاَةُ المُفِيْدَةُ)', 'Manakah yang merupakan “Kata Kerja” (Predikat) dalam contoh berikut: قَرَأَ إِبْرَاهِيْمُ الْكِتَابَ?', 20, '[{\"key\": \"A\", \"value\": \" إِبْرَاهِيْمُ\"}, {\"key\": \"B\", \"value\": \" الْكِتَابَ \"}, {\"key\": \"C\", \"value\": \" قَرُبَ\"}, {\"key\": \"D\", \"value\": \" فِيْ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '68477fd4-bd21-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('5e63ae75-bade-11ef-8196-00163e047c76', 'Unsur pembentuk kalimat (الْجُمْلاَةُ المُفِيْدَةُ)', 'Berikut macam-macam kata, kecuali..', 20, '[{\"key\": \"A\", \"value\": \"Kata benda\"}, {\"key\": \"B\", \"value\": \"Kata perintah\"}, {\"key\": \"C\", \"value\": \"Kata kerja\"}, {\"key\": \"D\", \"value\": \"Kata tugas\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '68477fd4-bd21-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('5e63ba89-bade-11ef-8196-00163e047c76', 'Unsur pembentuk kalimat (الْجُمْلاَةُ المُفِيْدَةُ)', 'Apa yang menjadi ciri utama dari sebuah Isim?', 20, '[{\"key\": \"A\", \"value\": \"Diawali dengan huruf قد  Diawali dengan huruf قد\"}, {\"key\": \"B\", \"value\": \"Diakhiri dengan Ta\' sukun\"}, {\"key\": \"C\", \"value\": \"Terdapat tanwin di akhir kata\"}, {\"key\": \"D\", \"value\": \"Tidak memiliki arti yang jelas tanpa kata-kata lain\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '68477fd4-bd21-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('5e63c5fb-bade-11ef-8196-00163e047c76', 'Unsur pembentuk kalimat (الْجُمْلاَةُ المُفِيْدَةُ)', 'Dalam kalimat “نَظَرَ” menunjukan fi’il (kata kerja) pada waktu?', 20, '[{\"key\": \"A\", \"value\": \"Masa waktu  (fi’il zaman)\"}, {\"key\": \"B\", \"value\": \"Masa kini ( fi’il mudhore’)\"}, {\"key\": \"C\", \"value\": \"Masa depan (fi’il amr)\"}, {\"key\": \"D\", \"value\": \"Masa lampau ( fi’il madhi)\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '68477fd4-bd21-11ef-8196-00163e047c76', 3, 'D', NULL, NULL);
INSERT INTO `quis` (`id`, `title`, `question`, `point`, `option`, `kategori_materi_id`, `materi_id`, `batch`, `answer_key`, `created_at`, `updated_at`) VALUES
('5e63d0d9-bade-11ef-8196-00163e047c76', 'Unsur pembentuk kalimat (الْجُمْلاَةُ المُفِيْدَةُ)', 'Dalam contoh kalimat \"مِنَ الْفَصْلِ\", kata \"الْفَصْلِ\" adalah Isim,karena..', 20, '[{\"key\": \"A\", \"value\": \"Diawali dengan huruf hijaiyah tunggal\"}, {\"key\": \"B\", \"value\": \"Diawali oleh harf jar  \"}, {\"key\": \"C\", \"value\": \"Mengandung huruf hijaiyah yang tersusun\"}, {\"key\": \"D\", \"value\": \"Terletak di awal kalimat\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '68477fd4-bd21-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('5e958aa1-baee-11ef-8196-00163e047c76', 'ISIM ISYAROH', 'Isim Isyarah adalah..', 20, '[{\"key\": \"A\", \"value\": \"Kata kerja\"}, {\"key\": \"B\", \"value\": \"Kata perintah\"}, {\"key\": \"C\", \"value\": \"Kata tunjuk\"}, {\"key\": \"D\", \"value\": \"Kata tugas\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'd342457a-bd21-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('5e959956-baee-11ef-8196-00163e047c76', 'ISIM ISYAROH', 'Yang manakah berikut yang merupakan rincian pembagian isim Isyarah?', 20, '[{\"key\": \"A\", \"value\": \"Kata tunjuk untuk yang dekat\"}, {\"key\": \"B\", \"value\": \"Kata tunjuk untuk yang jauh\"}, {\"key\": \"C\", \"value\": \"Kata tunjuk untuk menunjukan lokasi\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'd342457a-bd21-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('5e95a841-baee-11ef-8196-00163e047c76', 'ISIM ISYAROH', 'Berikut merupakan contoh dari Isim isyaroh kecuali?', 20, '[{\"key\": \"A\", \"value\": \" هَذَا\"}, {\"key\": \"B\", \"value\": \" ذَلِكَ\"}, {\"key\": \"C\", \"value\": \" هُنَاكَ\"}, {\"key\": \"D\", \"value\": \" فِي\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'd342457a-bd21-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('5e95b363-baee-11ef-8196-00163e047c76', 'ISIM ISYAROH', 'Berikut merupakan contoh dari isim isyarah untuk menunjuk yang dekat adalah..', 20, '[{\"key\": \"A\", \"value\": \" هَذَا\"}, {\"key\": \"B\", \"value\": \" ذَلِكَ\"}, {\"key\": \"C\", \"value\": \" هُنَاكَ\"}, {\"key\": \"D\", \"value\": \" semua benar \"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'd342457a-bd21-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('5e95be2b-baee-11ef-8196-00163e047c76', 'ISIM ISYAROH', 'Berikut merupakan contoh dari isim isyarah untuk menunjuk yang jauh adalah..', 20, '[{\"key\": \"A\", \"value\": \" هَذَا\"}, {\"key\": \"B\", \"value\": \" ذَلِكَ\"}, {\"key\": \"C\", \"value\": \" هُنَاكَ\"}, {\"key\": \"D\", \"value\": \" semua benar \"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'd342457a-bd21-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('64eae461-bae7-11ef-8196-00163e047c76', 'ISIM BERDASARKAN KUANTITAS', 'Apa ciri utama dari Isim Muannats?', 20, '[{\"key\": \"A\", \"value\": \"Tidak diakhiri dengan ta\' marbuthoh\"}, {\"key\": \"B\", \"value\": \"Digunakan untuk menyatakan jenis laki-laki\"}, {\"key\": \"C\", \"value\": \"Diakhiri dengan ta\' marbuthoh\"}, {\"key\": \"D\", \"value\": \"Digunakan untuk menyatakan jenis benda mati\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '9c62d709-bd21-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('64eaf312-bae7-11ef-8196-00163e047c76', 'ISIM BERDASARKAN KUANTITAS', 'Berikut ini adalah contoh dari Isim Muannats, kecuali..', 20, '[{\"key\": \"A\", \"value\": \" فَاطِمَةُ\"}, {\"key\": \"B\", \"value\": \" زَيْدُ\"}, {\"key\": \"C\", \"value\": \" أُسْتَاذَةٌ\"}, {\"key\": \"D\", \"value\": \"مَدْرَسَةٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '9c62d709-bd21-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('64eaffcb-bae7-11ef-8196-00163e047c76', 'ISIM BERDASARKAN KUANTITAS', 'Yang termasuk ke dalam contoh Isim Mudzakkar adalah..', 20, '[{\"key\": \"A\", \"value\": \" شَمْسٌ\"}, {\"key\": \"B\", \"value\": \" أَرْضٌ\"}, {\"key\": \"C\", \"value\": \" أَحْمَدُ\"}, {\"key\": \"D\", \"value\": \" مَدْرَسَةٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '9c62d709-bd21-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('64eb0abb-bae7-11ef-8196-00163e047c76', 'ISIM BERDASARKAN KUANTITAS', 'Isim berikut ini menyatakan anggota badan yang berpasangan, kecuali..', 20, '[{\"key\": \"A\", \"value\": \" يَدٌ\"}, {\"key\": \"B\", \"value\": \" عَيْنٌ\"}, {\"key\": \"C\", \"value\": \"أُذُنٌ\"}, {\"key\": \"D\", \"value\": \" قَمَرٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '9c62d709-bd21-11ef-8196-00163e047c76', 3, 'D', NULL, NULL),
('64eb1572-bae7-11ef-8196-00163e047c76', 'ISIM BERDASARKAN KUANTITAS', 'Benda langit yang termasuk dalam kategori Isim Muannats adalah..', 20, '[{\"key\": \"A\", \"value\": \" شَمْسٌ\"}, {\"key\": \"B\", \"value\": \"كِتَابٌ\"}, {\"key\": \"C\", \"value\": \" قَلَمٌ\"}, {\"key\": \"D\", \"value\": \" رَجُلٌ\"}]', '', '165b4fe3-ba74-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('6ac52c6a-bb01-11ef-8196-00163e047c76', 'ISIM IDHOFAT', 'Apa pengertian dari Idhofat dalam bahasa Arab?', 20, '[{\"key\": \"A\", \"value\": \"Penyandaran suatu isim kepada isim yang lain untuk mengubah makna  \"}, {\"key\": \"B\", \"value\": \"Penggabungan dua kalimat menjadi satu\"}, {\"key\": \"C\", \"value\": \"Penggunaan kata sambung dalam kalimat  \"}, {\"key\": \"D\", \"value\": \"Penentuan jenis kata dalam kalimat\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '4a91f951-bd22-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('6ac53c5b-bb01-11ef-8196-00163e047c76', 'ISIM IDHOFAT', 'Manakah dari berikut ini yang merupakan syarat untuk Mudhof?', 20, '[{\"key\": \"A\", \"value\": \"Boleh menggunakan tanwin  \"}, {\"key\": \"B\", \"value\": \"Boleh mengandung alif lam  \"}, {\"key\": \"C\", \"value\": \"Harus berakhiran dengan kasroh  \"}, {\"key\": \"D\", \"value\": \"Tidak boleh menggunakan tanwin\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '4a91f951-bd22-11ef-8196-00163e047c76', 3, 'D', NULL, NULL),
('6ac54e19-bb01-11ef-8196-00163e047c76', 'ISIM IDHOFAT', 'Dalam struktur Isim Idhofat, apa yang menjadi Mudhof Ilaihi?', 20, '[{\"key\": \"A\", \"value\": \"Isim yang terletak di awal  \"}, {\"key\": \"B\", \"value\": \"Isim yang terletak di tengah  \"}, {\"key\": \"C\", \"value\": \"Isim yang terletak di akhir  \"}, {\"key\": \"D\", \"value\": \"Isim yang mengandung tanwin\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '4a91f951-bd22-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('6ac55b3f-bb01-11ef-8196-00163e047c76', 'ISIM IDHOFAT', 'Contoh manakah yang benar untuk Isim Idhofat dari bentuk mufrod?', 20, '[{\"key\": \"A\", \"value\": \" مِفْتَاحُ الْبَيْتِ  \"}, {\"key\": \"B\", \"value\": \" مُسْلِمُو الْإِنْدُوْنِسِيَّا  \"}, {\"key\": \"C\", \"value\": \" صَلَاتِهِمْ  \"}, {\"key\": \"D\", \"value\": \" كِتَابُ مُحَمَّدُ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '4a91f951-bd22-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('6ac56d2b-bb01-11ef-8196-00163e047c76', 'ISIM IDHOFAT', 'Bagaimana cara pembentukan Isim Idhofat jika Mudhof Ilaihi adalah dhomir muttashil?', 20, '[{\"key\": \"A\", \"value\": \"Menyandarkan Mudhof kepada isim dengan tanwin  \"}, {\"key\": \"B\", \"value\": \"Menyandarkan Mudhof Ilaihi kepada isim tanpa alif lam  \"}, {\"key\": \"C\", \"value\": \"Menyandarkan Mudhof kepada dhomir muttashil dan mengubah makna menjadi kepemilikan  \"}, {\"key\": \"D\", \"value\": \"Menyandarkan Mudhof Ilaihi dengan menggunakan tanwin\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '4a91f951-bd22-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('6d3f13b4-bb17-11ef-8196-00163e047c76', 'JUMLAH ISMIYAH', 'Apa yang dimaksud dengan Jumlah Ismiyyah?', 20, '[{\"key\": \"A\", \"value\": \"Kalimat yang dimulai dengan fi\'il\"}, {\"key\": \"B\", \"value\": \"Kalimat yang dimulai dengan isim\"}, {\"key\": \"C\", \"value\": \"Kalimat yang tidak memiliki makna\"}, {\"key\": \"D\", \"value\": \"Kalimat yang hanya terdiri dari satu kata\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b59eca84-bd22-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('6d3f2984-bb17-11ef-8196-00163e047c76', 'JUMLAH ISMIYAH', 'Apa yang berfungsi sebagai Mubtada dalam Jumlah Ismiyyah?', 20, '[{\"key\": \"A\", \"value\": \"Kata yang menerangkan subyek\"}, {\"key\": \"B\", \"value\": \"Kata yang terletak di akhir kalimat\"}, {\"key\": \"C\", \"value\": \"Isim yang terletak di awal kalimat dan menjadi subyek\"}, {\"key\": \"D\", \"value\": \"Kata yang menghubungkan kalimat\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b59eca84-bd22-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('6d3f3a7b-bb17-11ef-8196-00163e047c76', 'JUMLAH ISMIYAH', 'Apa yang dimaksud dengan Khobar dalam Jumlah Ismiyyah?', 20, '[{\"key\": \"A\", \"value\": \"Kata yang menunjukkan waktu\"}, {\"key\": \"B\", \"value\": \"Kata yang berfungsi sebagai subyek\"}, {\"key\": \"C\", \"value\": \"Kata yang menerangkan Mubtada\'\"}, {\"key\": \"D\", \"value\": \"Kata yang menggantikan Mubtada  \"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b59eca84-bd22-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('6d3f4d15-bb17-11ef-8196-00163e047c76', 'JUMLAH ISMIYAH', 'Apa yang harus dilakukan jika Mubtada adalah jamak dan khobar berfungsi sebagai deskripsi makhluk yang tidak berakal?', 20, '[{\"key\": \"A\", \"value\": \"Khobar harus mengikuti Mubtada dalam bentuk jamak\"}, {\"key\": \"B\", \"value\": \"Khobar harus kembali ke bentuk mufrod\"}, {\"key\": \"C\", \"value\": \"Khobar harus dihilangkan\"}, {\"key\": \"D\", \"value\": \"Mubtada harus diubah ke bentuk mufrod\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b59eca84-bd22-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('6d3f5caa-bb17-11ef-8196-00163e047c76', 'JUMLAH ISMIYAH', 'Manakah dari kalimat berikut ini yang merupakan contoh Jumlah Ismiyyah dalam Al-Qur\'an?', 20, '[{\"key\": \"A\", \"value\": \" لَيْلَةُ الْقَدْرِ خَيْرٌ  \"}, {\"key\": \"B\", \"value\": \" اللهُ يَسْتَهْزِئُ بِهِمْ  \"}, {\"key\": \"C\", \"value\": \" أَخُوْ زَيْنَبَ جانِبَ الْفَصْلِ  \"}, {\"key\": \"D\", \"value\": \" زَيْدٌ قَائِمٌ  \"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b59eca84-bd22-11ef-8196-00163e047c76', 3, 'D', NULL, NULL),
('79ec533d-bada-11ef-8196-00163e047c76', 'Unsur pembentuk kalimat (الْجُمْلاَةُ المُفِيْدَةُ)\r\n\r\n', 'Apa yang dimaksud dengan الْكَلِمَةُ ?', 20, '[{\"key\": \"A\", \"value\": \"Kata\"}, {\"key\": \"B\", \"value\": \"Kalimat\"}, {\"key\": \"C\", \"value\": \"Kata kerja\"}, {\"key\": \"D\", \"value\": \"Kata Perintah\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '68477fd4-bd21-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('7a10687c-bb1f-11ef-8196-00163e047c76', 'INNA DAN SAUDARINYA', 'Apa makna dari إِنَّ  dalam sebuah kalimat?', 20, '[{\"key\": \"A\", \"value\": \"Tetapi\"}, {\"key\": \"B\", \"value\": \"Sesungguhnya\"}, {\"key\": \"C\", \"value\": \"Seakan-akan\"}, {\"key\": \"D\", \"value\": \"Semoga\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '0438fff3-bd23-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('7a107785-bb1f-11ef-8196-00163e047c76', 'INNA DAN SAUDARINYA', 'Pilihlah khobar inna dari kalimat berikut: إِنَّ الصَّلاَةَ مَفْرُوْضَةٌ عَلَى الْمُسْلِمِيْنَ', 20, '[{\"key\": \"A\", \"value\": \"إِنَّ\"}, {\"key\": \"B\", \"value\": \"الصَّلاَةَ\"}, {\"key\": \"C\", \"value\": \"مَفْرُوْضَةٌ\"}, {\"key\": \"D\", \"value\": \"عَلَى\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '0438fff3-bd23-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('7a108806-bb1f-11ef-8196-00163e047c76', 'INNA DAN SAUDARINYA', 'Pilihlah kata yang sesuai untuk melengkapi kalimat berikut: \"أَنَّ....... فِي الْمَسْجِدِ\"', 20, '[{\"key\": \"A\", \"value\": \"الطَّالِبُ\"}, {\"key\": \"B\", \"value\": \"يَكْتُبُ\"}, {\"key\": \"C\", \"value\": \"كِتَابًا\"}, {\"key\": \"D\", \"value\": \"الكُرْسِيُّ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '0438fff3-bd23-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('7a1095e5-bb1f-11ef-8196-00163e047c76', 'INNA DAN SAUDARINYA', 'Pilihlah bentuk yang benar untuk melengkapi kalimat berikut: \"لَيْتَ الطَّالِبُ.........\".', 20, '[{\"key\": \"A\", \"value\": \"يَدْرُسُ\"}, {\"key\": \"B\", \"value\": \"يَدْرُسَ\"}, {\"key\": \"C\", \"value\": \"يَدْرُسُوْنَ\"}, {\"key\": \"D\", \"value\": \"يَدْرُسَانِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '0438fff3-bd23-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('7a10a7d6-bb1f-11ef-8196-00163e047c76', 'INNA DAN SAUDARINYA', 'Pilihlah kata yang sesuai untuk melengkapi kalimat berikut, \"الطَّالِبُ نَشِيْطٌ........ الطَّالِبَ كَسْلَانٌ\"', 20, '[{\"key\": \"A\", \"value\": \"إِنَّ\"}, {\"key\": \"B\", \"value\": \"لَعَلَّ\"}, {\"key\": \"C\", \"value\": \"لَكِنَّ\"}, {\"key\": \"D\", \"value\": \"لَيْتَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '0438fff3-bd23-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('7b7974ac-bb13-11ef-8196-00163e047c76', 'HARF DHOROF,SYIBHUL JUMLAH', 'Apa yang dimaksud dengan Syibhul Jumlah?', 20, '[{\"key\": \"A\", \"value\": \"Kata yang dapat berdiri sendiri tanpa bantuan kata lain.\"}, {\"key\": \"B\", \"value\": \"Kata yang memiliki arti khusus dalam kalimat.\"}, {\"key\": \"C\", \"value\": \"Sesuatu yang (mirip) dengan kalimat dan terdiri dari Harf atau Dhorof ditambah Isim.\"}, {\"key\": \"D\", \"value\": \"Kata yang hanya digunakan untuk menunjukkan keterangan waktu.\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('7b798c0a-bb13-11ef-8196-00163e047c76', 'HARF DHOROF,SYIBHUL JUMLAH', 'Manakah dari kata berikut ini yang merupakan contoh Harf Jar?', 20, '[{\"key\": \"A\", \"value\": \" إِلَى\"}, {\"key\": \"B\", \"value\": \" كَ\"}, {\"key\": \"C\", \"value\": \" لِمَنْ\"}, {\"key\": \"D\", \"value\": \" أَمْ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('7b799c6d-bb13-11ef-8196-00163e047c76', 'HARF DHOROF,SYIBHUL JUMLAH', 'Apa perbedaan antara Dhorof Zaman dan Dhorof Makan?', 20, '[{\"key\": \"A\", \"value\": \"Dhorof Zaman menunjukkan tempat, sedangkan Dhorof Makan menunjukkan waktu.\"}, {\"key\": \"B\", \"value\": \"Dhorof Zaman menunjukkan waktu, sedangkan Dhorof Makan menunjukkan tempat.\"}, {\"key\": \"C\", \"value\": \"Keduanya menunjukkan makna yang sama.\"}, {\"key\": \"D\", \"value\": \"Dhorof Zaman hanya digunakan dalam kalimat tanya.\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('7b79aa55-bb13-11ef-8196-00163e047c76', 'HARF DHOROF,SYIBHUL JUMLAH', 'Bagaimana penggunaan Harf Qosam mempengaruhi huruf setelahnya?', 20, '[{\"key\": \"A\", \"value\": \"Membuat huruf setelahnya menjadi fataḥah.\"}, {\"key\": \"B\", \"value\": \"Membuat huruf setelahnya menjadi dammah.\"}, {\"key\": \"C\", \"value\": \"Membuat huruf setelahnya menjadi kasrah.\"}, {\"key\": \"D\", \"value\": \"Membuat huruf setelahnya tidak berubah.\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('7b79b5fe-bb13-11ef-8196-00163e047c76', 'HARF DHOROF,SYIBHUL JUMLAH', 'Contoh manakah yang merupakan Syibhul Jumlah dari jenis Dhorof + Isim?', 20, '[{\"key\": \"A\", \"value\": \" فِي الْمَنْزِلِ\"}, {\"key\": \"B\", \"value\": \" مِنْ الْبَيْتِ\"}, {\"key\": \"C\", \"value\": \" إِلَى الْمَدْرَسَةِ\"}, {\"key\": \"D\", \"value\": \" خَلْفِهِمْ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('837141ab-bb27-11ef-8196-00163e047c76', 'FIIL AMR DAN NAHYI', 'Wazan Fi’il Amr terdiri dari berapa bentuk?', 20, '[{\"key\": \"A\", \"value\": \"1\"}, {\"key\": \"B\", \"value\": \"2\"}, {\"key\": \"C\", \"value\": \"3\"}, {\"key\": \"D\", \"value\": \"4\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '60065b85-bd23-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('8371500e-bb27-11ef-8196-00163e047c76', 'FIIL AMR DAN NAHYI', 'Fi’il amri merupakan..', 20, '[{\"key\": \"A\", \"value\": \"Kata isyarah\"}, {\"key\": \"B\", \"value\": \"Kata sambung\"}, {\"key\": \"C\", \"value\": \"Kata kerja perintah\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '60065b85-bd23-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('8371615f-bb27-11ef-8196-00163e047c76', 'FIIL AMR DAN NAHYI', 'Untuk mengetahui fi’il amri, maka harus melihat dari bentuk ….', 20, '[{\"key\": \"A\", \"value\": \"Fiil Madhi\"}, {\"key\": \"B\", \"value\": \"Fiil Mudhori\"}, {\"key\": \"C\", \"value\": \"Fiil nahyi\"}, {\"key\": \"D\", \"value\": \"Harf jar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '60065b85-bd23-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('83716f28-bb27-11ef-8196-00163e047c76', 'FIIL AMR DAN NAHYI', 'Hamzah yang digunakan dalam fi’il amri adalah hamzah?', 20, '[{\"key\": \"A\", \"value\": \"Washal\"}, {\"key\": \"B\", \"value\": \"Qathi\"}, {\"key\": \"C\", \"value\": \"Isyarah\"}, {\"key\": \"D\", \"value\": \"Idhofah\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '60065b85-bd23-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('8371803d-bb27-11ef-8196-00163e047c76', 'FIIL AMR DAN NAHYI', 'Bentuk fi’il amri dari kata “جَلَسَ - يَجْلِسُ” adalah', 20, '[{\"key\": \"A\", \"value\": \" أَجْلِسُ\"}, {\"key\": \"B\", \"value\": \" يَجْلِسُ\"}, {\"key\": \"C\", \"value\": \" اِجْلَسْ\"}, {\"key\": \"D\", \"value\": \" اِجْلِسْ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '60065b85-bd23-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('84b89b42-bb00-11ef-8196-00163e047c76', 'ISIM IDHOFAT', 'Ada berapa cara pembentukan Isim idhofat ...', 20, '[{\"key\": \"A\", \"value\": \"1\"}, {\"key\": \"B\", \"value\": \"2\"}, {\"key\": \"C\", \"value\": \"3\"}, {\"key\": \"D\", \"value\": \"4\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '4a91f951-bd22-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('84b8ad6f-bb00-11ef-8196-00163e047c76', 'ISIM IDHOFAT', 'Contoh berikut merupakan isim idhofat di mana mudhof ilaih-nya merupakan dhomir muttasil', 20, '[{\"key\": \"A\", \"value\": \" أَبُوْ زَيْدٍ\"}, {\"key\": \"B\", \"value\": \" كِتَابُكَ\"}, {\"key\": \"C\", \"value\": \" نَامَ أَحْمَدُ\"}, {\"key\": \"D\", \"value\": \" زَيْدٌ مُدَرِّسٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '4a91f951-bd22-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('84b8bef1-bb00-11ef-8196-00163e047c76', 'ISIM IDHOFAT', 'Kapan bentuk isim idhofat untuk mudhaf harus menghilangkan huruf nun-nya', 20, '[{\"key\": \"A\", \"value\": \"Ketika dalam bentuk mutsanna\"}, {\"key\": \"B\", \"value\": \"Ketika dalam bentuk jamak mudzakkar salim\"}, {\"key\": \"C\", \"value\": \"Ketika dalam bentuk jamak taksir\"}, {\"key\": \"D\", \"value\": \"A & B benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '4a91f951-bd22-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('84b8cb01-bb00-11ef-8196-00163e047c76', 'ISIM IDHOFAT', 'Berikut merupakan contoh dari isim idhofat untuk mudhof mutsanna', 20, '[{\"key\": \"A\", \"value\": \" أَحْمَدُ قَائِمٌ\"}, {\"key\": \"B\", \"value\": \" أَحْمَدُ يَجْلِسُ عَلَى الكُرْسِيِّ\"}, {\"key\": \"C\", \"value\": \" مُسْلِمَا الإِنْدُوْنِسِيَّا\"}, {\"key\": \"D\", \"value\": \" غُلَامُ زَيْدٍ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '4a91f951-bd22-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('84b8d79d-bb00-11ef-8196-00163e047c76', 'ISIM IDHOFAT', 'Berikut merupakan contoh dari isim idhofat untuk jamak', 20, '[{\"key\": \"A\", \"value\": \" مُسْلِمُ الإِنْدُوْنِسِيَّا\"}, {\"key\": \"B\", \"value\": \" مُسْلِمَا الإِنْدُوْنِسِيَّا\"}, {\"key\": \"C\", \"value\": \" مُسْلِمُو الإِنْدُوْنِسِيَّا\"}, {\"key\": \"D\", \"value\": \" مُسْلِمَةُ الإِنْدُوْنِسِيَّا\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '4a91f951-bd22-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('97448723-bada-11ef-8196-00163e047c76', 'Unsur pembentuk kalimat (الْجُمْلاَةُ المُفِيْدَةُ)', 'Isim (الْإِسْمُ) adalah kata yang menunjukan kepada ....', 20, '[{\"key\": \"A\", \"value\": \"Benda hidup dan Benda Mati\"}, {\"key\": \"B\", \"value\": \"Kata Kerja\"}, {\"key\": \"C\", \"value\": \"Kata bantu\"}, {\"key\": \"D\", \"value\": \"Kata sambung\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '68477fd4-bd21-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('97449262-bada-11ef-8196-00163e047c76', 'Unsur pembentuk kalimat (الْجُمْلاَةُ المُفِيْدَةُ)', 'Berikut ini contoh yang termasuk fiil adalah .....', 20, '[{\"key\": \"A\", \"value\": \" كِتَابٌ , الْقَلَمُ , يَذْهَب\"}, {\"key\": \"B\", \"value\": \" مُدَرِّسٌ , شَجَرَةٌ , الْغَنَم\"}, {\"key\": \"C\", \"value\": \"أَكَلَ , عَلَّمَ , يُعَلِّم\"}, {\"key\": \"D\", \"value\": \"مِنْ , إِلَى , عَن\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '68477fd4-bd21-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('97449f06-bada-11ef-8196-00163e047c76', 'Unsur pembentuk kalimat (الْجُمْلاَةُ المُفِيْدَةُ)', 'Harf jar dalam kalimat berikut **\"اَلرَّحْمٰنُ عَلَى الْعَرْشِ اسْتَوٰى\"** adalah:', 20, '[{\"key\": \"A\", \"value\": \"اَلرَّحْمٰنُ\"}, {\"key\": \"B\", \"value\": \"عَلَى\"}, {\"key\": \"C\", \"value\": \"الْعَرْشِ\"}, {\"key\": \"D\", \"value\": \"اسْتَوٰى\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '68477fd4-bd21-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('9b5cc3a0-bdba-11ef-8196-00163e047c76', 'ISIM MAUSHUL', 'Apa fungsi utama dari Isim Maushul dalam kalimat?', 20, '[{\"key\": \"A\", \"value\": \"Menunjukkan kata benda\"}, {\"key\": \"B\", \"value\": \"Menghubungkan beberapa kalimat atau pokok pikiran menjadi satu kalimat\"}, {\"key\": \"C\", \"value\": \"Menunjukkan kata kerja\"}, {\"key\": \"D\", \"value\": \"Menunjukkan kata tugas\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b6c897f6-bd21-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('a0d27fc8-bb1d-11ef-8196-00163e047c76', 'INNA DAN SAUDARINYA', 'Bagaimana keadaan suatu kata jika dimasuki oleh Inna dan saudari-saudarinya?', 20, '[{\"key\": \"A\", \"value\": \"Khobar inna irobnya menjadi nashob\"}, {\"key\": \"B\", \"value\": \"Isim inna irobnya menjadi nashob\"}, {\"key\": \"C\", \"value\": \"Isim inna irobnya menjadi Jarr\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '0438fff3-bd23-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('a0d294e0-bb1d-11ef-8196-00163e047c76', 'INNA DAN SAUDARINYA', 'Manakah yang termasuk khobar inna dari kalimat berikut “إِنَّ النَّظَافَةَ وَاجِبَةٌ لِلمُسْلِمِيْنَ”', 20, '[{\"key\": \"A\", \"value\": \" إِنَّ\"}, {\"key\": \"B\", \"value\": \" النَّظَافَةَ\"}, {\"key\": \"C\", \"value\": \" وَاجِبَةٌ\"}, {\"key\": \"D\", \"value\": \" لِلمُسْلِمِيْنَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '0438fff3-bd23-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('a0d2a11e-bb1d-11ef-8196-00163e047c76', 'INNA DAN SAUDARINYA', 'Pilihlah kata yang sesuai dengan kalimat berikut, “ كَأَنَّ........عَاقِلٌ ”', 20, '[{\"key\": \"A\", \"value\": \"المَسْجِدُ\"}, {\"key\": \"B\", \"value\": \" الكِتَابُ\"}, {\"key\": \"C\", \"value\": \" يَضْرِبُ\"}, {\"key\": \"D\", \"value\": \" الطَّالِبَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '0438fff3-bd23-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('a0d2b745-bb1d-11ef-8196-00163e047c76', 'INNA DAN SAUDARINYA', 'Pilihlah kata yang sesuai dengan kalimat berikut, “ …….. لَعَلَّ الطَّالِبُ”', 20, '[{\"key\": \"A\", \"value\": \" نَاجِحًا\"}, {\"key\": \"B\", \"value\": \" نَاجِحٌ\"}, {\"key\": \"C\", \"value\": \" ناَجِحَةً\"}, {\"key\": \"D\", \"value\": \"d. نَاجِحَةٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '0438fff3-bd23-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('a0d2c760-bb1d-11ef-8196-00163e047c76', 'INNA DAN SAUDARINYA', 'Pilihlah kata yang sesuai dengan kalimat berikut, “المَقْعَدَ وَسِخٌ …….. الْفَصْلُ نَظِيْفٌ”', 20, '[{\"key\": \"A\", \"value\": \" إِنَّ\"}, {\"key\": \"B\", \"value\": \" لَعَلَّ\"}, {\"key\": \"C\", \"value\": \" لَكِنَّ\"}, {\"key\": \"D\", \"value\": \" لَيْتَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '0438fff3-bd23-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('a115853b-bd75-11ef-8196-00163e047c76', 'TASHRIF LUGHOWI', 'Perubahan suatu kata berdasarkan jenis dan jumlah subjek atau pelakunya disebut dengan?', 20, '[{\"key\": \"A\", \"value\": \"Tashrif Lughawi\"}, {\"key\": \"B\", \"value\": \"Tashrif Ishtilahi\"}, {\"key\": \"C\", \"value\": \"Tashrif Qiyasiy\"}, {\"key\": \"D\", \"value\": \"Tashrif Samaiy\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'c099f35b-bd23-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('a1159786-bd75-11ef-8196-00163e047c76', 'TASHRIF LUGHOWI', 'Tashrif Lughawi dibagi menjadi berapa?', 20, '[{\"key\": \"A\", \"value\": \"1\"}, {\"key\": \"B\", \"value\": \"2\"}, {\"key\": \"C\", \"value\": \"3\"}, {\"key\": \"D\", \"value\": \"4\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'c099f35b-bd23-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('a115a3ff-bd75-11ef-8196-00163e047c76', 'TASHRIF LUGHOWI', 'Tashrif Lughawi bentuk isim mencakup apa saja?', 20, '[{\"key\": \"A\", \"value\": \"Isim fail dan isim maful\"}, {\"key\": \"B\", \"value\": \"Isim makan dan isim zaman\"}, {\"key\": \"C\", \"value\": \"Harf\"}, {\"key\": \"D\", \"value\": \"Isim isyarah\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'c099f35b-bd23-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('a115b50d-bd75-11ef-8196-00163e047c76', 'TASHRIF LUGHOWI', 'Kapan tashrif lughawi fi’il madhy memiliki huruf tambahan نَا ketika diawali dhamir', 20, '[{\"key\": \"A\", \"value\": \"أْتَ\"}, {\"key\": \"B\", \"value\": \"أَنَا\"}, {\"key\": \"C\", \"value\": \"أَنْتُمْ\"}, {\"key\": \"D\", \"value\": \"نَحنُ\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'c099f35b-bd23-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('a115c553-bd75-11ef-8196-00163e047c76', 'TASHRIF LUGHOWI', 'Hamzah yang ada pada wazan infa\'ala, ifta\'ala, istaf\'ala adalah hamzah?', 20, '[{\"key\": \"A\", \"value\": \"Washl \"}, {\"key\": \"B\", \"value\": \"Qathi \"}, {\"key\": \"C\", \"value\": \"Alif\"}, {\"key\": \"D\", \"value\": \"Mamdudah\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'c099f35b-bd23-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('a115d9f8-bd75-11ef-8196-00163e047c76', 'TASHRIF LUGHOWI', 'Berikut ini yang termasul fi\'il tsulatsy mazid dengan huruf tambahan 3 huruf, kecuali..', 20, '[{\"key\": \"A\", \"value\": \"اسْتَفْهَمَ \"}, {\"key\": \"B\", \"value\": \"أَجْلَسَ\"}, {\"key\": \"C\", \"value\": \"نَظَّمَ\"}, {\"key\": \"D\", \"value\": \"اِفْعَا\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'c099f35b-bd23-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('a115e9ed-bd75-11ef-8196-00163e047c76', 'TASHRIF LUGHOWI', 'Berikut ini yang termasul fi\'il tsulatsy mazid dengan huruf tambahan 3 huruf,\r\nkecuali..\r\n', 20, '[{\"key\": \"A\", \"value\": \"عَلَّمَ\"}, {\"key\": \"B\", \"value\": \"سَلْسَلَ\"}, {\"key\": \"C\", \"value\": \"اِسْتَفْهَمَ\"}, {\"key\": \"D\", \"value\": \"أَعْلَنَ\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'c099f35b-bd23-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('a115f5bc-bd75-11ef-8196-00163e047c76', 'TASHRIF LUGHOWI', 'Manakah berikut yang merupakan tashrif lughawi isim fa’il dari fi’il ruba’i mujarrad', 20, '[{\"key\": \"A\", \"value\": \"تَسَلْسَلَ\"}, {\"key\": \"B\", \"value\": \"بَسْمَلَ\"}, {\"key\": \"C\", \"value\": \"مُسَلْسَلٌ\"}, {\"key\": \"D\", \"value\": \"مُسَلْسِلٌ\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'c099f35b-bd23-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('a1160427-bd75-11ef-8196-00163e047c76', 'TASHRIF LUGHOWI', 'Ada berapa jumlah dhamir untuk fi’il madhi dan dan fi’il mudhari’ ada berapa', 20, '[{\"key\": \"A\", \"value\": \"6 dhamir\"}, {\"key\": \"B\", \"value\": \"10 dhamir\"}, {\"key\": \"C\", \"value\": \"15 dhamir\"}, {\"key\": \"D\", \"value\": \"14 dhamir\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'c099f35b-bd23-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('a1161509-bd75-11ef-8196-00163e047c76', 'TASHRIF LUGHOWI', 'Manakah contoh berikut yang merupakan tashrif lughawi fi’il madhi dengan dhamir “أَنْتُنَّ”', 20, '[{\"key\": \"A\", \"value\": \"أَكْتُبُ\"}, {\"key\": \"B\", \"value\": \"كَتَبَ\"}, {\"key\": \"C\", \"value\": \"كَتَبْتَ\"}, {\"key\": \"D\", \"value\": \"كَتَبْتُنَّ\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'c099f35b-bd23-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('a1162f86-bd75-11ef-8196-00163e047c76', 'TASHRIF LUGHOWI', 'Berikut merupakan contoh dari tashrif lughawi fi’il amri', 20, '[{\"key\": \"A\", \"value\": \"نَصَرَ\"}, {\"key\": \"B\", \"value\": \"نَقْرَأُ\"}, {\"key\": \"C\", \"value\": \"اِقْرَأْ\"}, {\"key\": \"D\", \"value\": \"جَلَسْتَ\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'c099f35b-bd23-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('a1163c5e-bd75-11ef-8196-00163e047c76', 'TASHRIF LUGHOWI', 'Berikut merupakan salah satu ciri fi’il mudhari’, kecuali', 20, '[{\"key\": \"A\", \"value\": \"Alif\"}, {\"key\": \"B\", \"value\": \"Nun\"}, {\"key\": \"C\", \"value\": \"Ya\"}, {\"key\": \"D\", \"value\": \"Ba\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'c099f35b-bd23-11ef-8196-00163e047c76', 3, 'D', NULL, NULL),
('a1164780-bd75-11ef-8196-00163e047c76', 'TASHRIF LUGHOWI', 'Manakah yang merupakan tasrif lughawi isim fail dari rubaiy mazid 1 huruf dengan dhamir “هُوَ”', 20, '[{\"key\": \"A\", \"value\": \"تَدَحْرَجَ\"}, {\"key\": \"B\", \"value\": \"نَاصِرٌ\"}, {\"key\": \"C\", \"value\": \"مُسْتَعْمِلٌ\"}, {\"key\": \"D\", \"value\": \"مُتَدَحْرِجٌ\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'c099f35b-bd23-11ef-8196-00163e047c76', 3, 'D', NULL, NULL),
('a1165b76-bd75-11ef-8196-00163e047c76', 'TASHRIF LUGHOWI', 'Huruf tambahan dari tasrif lughawi fi’il madhi dhamir “أَنَا”', 20, '[{\"key\": \"A\", \"value\": \"Ta bersukun\"}, {\"key\": \"B\", \"value\": \"Ta berfathah\"}, {\"key\": \"C\", \"value\": \"Ta berkasrah\"}, {\"key\": \"D\", \"value\": \"Ta berdommah\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'c099f35b-bd23-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('a116683a-bd75-11ef-8196-00163e047c76', 'TASHRIF LUGHOWI', 'Berikut merupakan contoh tashrif lughawi wazan fi’il mudhari’ dhamir “نَحْنُ”', 20, '[{\"key\": \"A\", \"value\": \"نَصَرَ\"}, {\"key\": \"B\", \"value\": \"أَنْصُرُ\"}, {\"key\": \"C\", \"value\": \"تَنْصُرُ\"}, {\"key\": \"D\", \"value\": \"نَنْصُرُ\"}]', 'ca84af01-ba1e-11ef-8196-00163e047c76', 'c099f35b-bd23-11ef-8196-00163e047c76', 3, 'D', NULL, NULL),
('a236c5ab-badf-11ef-8196-00163e047c76', 'Isim Berdasarkan Gender', 'Isim Mudzakkar (إِسْمُ الْمُذَكَّرُ) adalah kata benda yang menunjukkan kepada ....', 20, '[{\"key\": \"A\", \"value\": \"Satu benda\"}, {\"key\": \"B\", \"value\": \"Laki-laki\"}, {\"key\": \"C\", \"value\": \"Dua benda\"}, {\"key\": \"D\", \"value\": \"Perempuan\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '8526b927-bd21-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('a236d3ef-badf-11ef-8196-00163e047c76', 'Isim Berdasarkan Gender', 'Berikut ini yang termasuk contoh Isim Mudzakkar (إِسْمُ الْمُذَكَّرُ) adalah ....', 20, '[{\"key\": \"A\", \"value\": \"كِتَاب\"}, {\"key\": \"B\", \"value\": \"الْشَمْس\"}, {\"key\": \"C\", \"value\": \"سَبُّوْرَة\"}, {\"key\": \"D\", \"value\": \"مَرْيَم\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '8526b927-bd21-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('a236df99-badf-11ef-8196-00163e047c76', 'Isim Berdasarkan Gender', 'Isim Muannats (إِسْمُ الْمُؤَنَّثُ) adalah kata benda yang menunjukkan kepada ....', 20, '[{\"key\": \"A\", \"value\": \"Satu benda\"}, {\"key\": \"B\", \"value\": \"Laki-laki\"}, {\"key\": \"C\", \"value\": \"Dua benda\"}, {\"key\": \"D\", \"value\": \"Perempuan\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '8526b927-bd21-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('a236ea85-badf-11ef-8196-00163e047c76', 'Isim Berdasarkan Gender', 'Ciri-ciri Isim Muannats (إِسْمُ الْمُؤَنَّثُ) sebagai berikut, kecuali .....', 20, '[{\"key\": \"A\", \"value\": \"Menggunakan (Ta Marbutha)\"}, {\"key\": \"B\", \"value\": \"Berpasangan\"}, {\"key\": \"C\", \"value\": \"Bertanwin\"}, {\"key\": \"D\", \"value\": \"Hanya satu-satunya di dunia\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '8526b927-bd21-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('a236f5f6-badf-11ef-8196-00163e047c76', 'Isim Berdasarkan Gender', 'Manakah salah satu ciri-ciri Isim Mudzakkar (إِسْمُ الْمُذَكَّرُ) ?', 20, '[{\"key\": \"A\", \"value\": \"Isim tidak diakhiri ta\' marbuthoh \"}, {\"key\": \"B\", \"value\": \"Wajib didahului harf jar\"}, {\"key\": \"C\", \"value\": \"Isim hanya digunakan untuk menyatakan jenis perempuan\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '8526b927-bd21-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('a53c2017-bb10-11ef-8196-00163e047c76', 'HARF DHOROF,SYIBHUL JUMLAH\r\n\r\n', 'Kapan huruf jar menyebabkan harakat akhir pada isim berubah menjadi ya’?', 20, '[{\"key\": \"A\", \"value\": \"Jamak mudzakkar salim\"}, {\"key\": \"B\", \"value\": \"Jamak muannats salim\"}, {\"key\": \"C\", \"value\": \"Jamak taksir\"}, {\"key\": \"D\", \"value\": \"Mufrod\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('a53c3108-bb10-11ef-8196-00163e047c76', 'HARF DHOROF,SYIBHUL JUMLAH', 'Contoh dari syibhul jumlah yang berupa huruf jar adalah ….', 20, '[{\"key\": \"A\", \"value\": \" الزَّيْدَانِ قَائِمَانِ\"}, {\"key\": \"B\", \"value\": \" الجَوَّالُ عَلَى المَكْتَبِ\"}, {\"key\": \"C\", \"value\": \" زَيْدٌ قَائِمٌ\"}, {\"key\": \"D\", \"value\": \" مُدَرَّسُوْنَ قَائِمُوْنَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('a53c456e-bb10-11ef-8196-00163e047c76', 'HARF DHOROF,SYIBHUL JUMLAH', 'Berikut merupakan harf atof, kecuali..', 20, '[{\"key\": \"A\", \"value\": \" أَمْ\"}, {\"key\": \"B\", \"value\": \" ثُمَّ\"}, {\"key\": \"C\", \"value\": \" كَمْ\"}, {\"key\": \"D\", \"value\": \" فَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('a53c524d-bb10-11ef-8196-00163e047c76', 'HARF DHOROF,SYIBHUL JUMLAH', 'Berikut merupakan harf istifham, kecuali..', 20, '[{\"key\": \"A\", \"value\": \" كَمْ\"}, {\"key\": \"B\", \"value\": \" كَيْفَ\"}, {\"key\": \"C\", \"value\": \" لِمَنْ\"}, {\"key\": \"D\", \"value\": \" وَرَاءَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('a53c5e09-bb10-11ef-8196-00163e047c76', 'HARF DHOROF,SYIBHUL JUMLAH', 'Tambahan Harfu Jar pada kalimat berikut!\r\n تَقْطَعُ أُمِّى الدَّجَاجَةَ _____  السِّكِّيْنَ	\r\n', 20, '[{\"key\": \"A\", \"value\": \" عَلَى\"}, {\"key\": \"B\", \"value\": \" أَمَامَ\"}, {\"key\": \"C\", \"value\": \" كَثِيْرٌ\"}, {\"key\": \"D\", \"value\": \" بِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('ab8c1eab-baf9-11ef-8196-00163e047c76', 'DHOMIR MUTTASIL DAN DHOMIR MUNFASIL', 'Dhomir memiliki arti..', 20, '[{\"key\": \"A\", \"value\": \"Yang tersembunyi\"}, {\"key\": \"B\", \"value\": \"Rahasia\"}, {\"key\": \"C\", \"value\": \"Perasaan\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '1624ab69-bd22-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('ab8c2cec-baf9-11ef-8196-00163e047c76', 'DHOMIR MUTTASIL DAN DHOMIR MUNFASIL', 'Dhomir secara istilah merupakan..', 20, '[{\"key\": \"A\", \"value\": \"Kata ganti untuk orang pertama\"}, {\"key\": \"B\", \"value\": \"Kata ganti untuk orang kedua\"}, {\"key\": \"C\", \"value\": \"Kata ganti untuk orang ketiga\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '1624ab69-bd22-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('ab8c38db-baf9-11ef-8196-00163e047c76', 'DHOMIR MUTTASIL DAN DHOMIR MUNFASIL', 'Berikut merupakan pembagian dhomir, kecuali ….', 20, '[{\"key\": \"A\", \"value\": \"Muttasil\"}, {\"key\": \"B\", \"value\": \"Munfasil\"}, {\"key\": \"C\", \"value\": \"Mustatir\"}, {\"key\": \"D\", \"value\": \"Mustaqim\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '1624ab69-bd22-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('ab8c43c7-baf9-11ef-8196-00163e047c76', 'DHOMIR MUTTASIL DAN DHOMIR MUNFASIL', 'Dhomir dari segi persambungannya dibagi menjadi berapa …', 20, '[{\"key\": \"A\", \"value\": \"1\"}, {\"key\": \"B\", \"value\": \"2\"}, {\"key\": \"C\", \"value\": \"3\"}, {\"key\": \"D\", \"value\": \"4\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '1624ab69-bd22-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('ab8c4e04-baf9-11ef-8196-00163e047c76', 'DHOMIR MUTTASIL DAN DHOMIR MUNFASIL', 'Apa yang dimaksud dengan dhomir muttasil?', 20, '[{\"key\": \"A\", \"value\": \"Kata ganti yang ditulis terpisah dengan kata lain\"}, {\"key\": \"B\", \"value\": \"Kata ganti yang ditulis bersambung dengan kata lain\"}, {\"key\": \"C\", \"value\": \"Kata ganti berjumlah tunggal\"}, {\"key\": \"D\", \"value\": \"Kata ganti berjumlah lebih dari dua\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '1624ab69-bd22-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('b0e4ced3-baf6-11ef-8196-00163e047c76', 'ISIM NAKIRAH DAN MAKRIFAH', 'Apa yang dimaksud dengan Isim Nakirah?', 20, '[{\"key\": \"A\", \"value\": \"Kata yang khusus menunjukan benda tertentu\"}, {\"key\": \"B\", \"value\": \"Kata yang bersifat umum dan belum jelas pengertiannya\"}, {\"key\": \"C\", \"value\": \"Kata yang digunakan untuk menunjukkan lokasi\"}, {\"key\": \"D\", \"value\": \"Kata yang diawali huruf alif dan lam (ال)\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'f4e744ac-bd21-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('b0e4deb0-baf6-11ef-8196-00163e047c76', 'ISIM NAKIRAH DAN MAKRIFAH', 'Ciri khas dari Isim Ma\'rifah adalah:', 20, '[{\"key\": \"A\", \"value\": \"Tidak diawali huruf alif dan lam (ال)\"}, {\"key\": \"B\", \"value\": \"Berakhiran tanwin ( ٌ ٍ ً )\"}, {\"key\": \"C\", \"value\": \"Diawali huruf alif dan lam (ال)\"}, {\"key\": \"D\", \"value\": \"Bisa menerima tanwin  \"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'f4e744ac-bd21-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('b0e4ea71-baf6-11ef-8196-00163e047c76', 'ISIM NAKIRAH DAN MAKRIFAH', 'Mana di bawah ini yang merupakan contoh Isim Nakirah?', 20, '[{\"key\": \"A\", \"value\": \"اْلكِتَابُ  \"}, {\"key\": \"B\", \"value\": \"رَجُلٌ\"}, {\"key\": \"C\", \"value\": \"هُوَ\"}, {\"key\": \"D\", \"value\": \"ذَالِكَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'f4e744ac-bd21-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('b0e4f521-baf6-11ef-8196-00163e047c76', 'ISIM NAKIRAH DAN MAKRIFAH', 'Isim mana yang termasuk dalam kategori Isim Ma\'rifah dengan Alif-Lam?', 20, '[{\"key\": \"A\", \"value\": \" كِتَابٌ  \"}, {\"key\": \"B\", \"value\": \" ذَلِكَ  \"}, {\"key\": \"C\", \"value\": \" الْمَسْجِدُ  \"}, {\"key\": \"D\", \"value\": \" هَذَا  \"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'f4e744ac-bd21-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('b0e50045-baf6-11ef-8196-00163e047c76', 'ISIM NAKIRAH DAN MAKRIFAH', 'Apa yang terjadi pada Isim Nakirah ketika disandarkan pada Dhomir Muttashil?', 20, '[{\"key\": \"A\", \"value\": \"Tetap sebagai Isim Nakirah  \"}, {\"key\": \"B\", \"value\": \"Berubah menjadi Isim Ma\'rifah  \"}, {\"key\": \"C\", \"value\": \"Tidak dapat digunakan  \"}, {\"key\": \"D\", \"value\": \"Menjadi kata tunjuk  \"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'f4e744ac-bd21-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('bb4fca7f-bb18-11ef-8196-00163e047c76', 'MABNI DAN MU\'ROB', 'Berikut merupakan I\'rob yang masuk pada isim adalah..', 20, '[{\"key\": \"A\", \"value\": \"Irob rofa\"}, {\"key\": \"B\", \"value\": \"Irob Nashob\"}, {\"key\": \"C\", \"value\": \"Irob jar\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'db2e8050-bd22-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('bb4fd878-bb18-11ef-8196-00163e047c76', 'MABNI DAN MU\'ROB', 'Kapan kondisi I’rob rofa’ pada isim?', 20, '[{\"key\": \"A\", \"value\": \"Mubtada - khobar pada jumlah Ismiyyah\"}, {\"key\": \"B\", \"value\": \"Isim kana dan saudari-saudarinya serta khobar Inna dan saudari-saudarinya\"}, {\"key\": \"C\", \"value\": \"Fa’il pada jumlah fi’liyyah\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'db2e8050-bd22-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('bb4fea00-bb18-11ef-8196-00163e047c76', 'MABNI DAN MU\'ROB', 'Berikut merupakan kondisi I’rob nashob pada Isim, kecuali', 20, '[{\"key\": \"A\", \"value\": \"Ketika menjadi fa’il pada jumlah fi’liyyah\"}, {\"key\": \"B\", \"value\": \"Isim Inna dan saudarinya serta khobar kaana dan saudarinya\"}, {\"key\": \"C\", \"value\": \"Maf’ul pada jumlah fi’liyyah\"}, {\"key\": \"D\", \"value\": \"Setelah bertemu huruf nida’\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'db2e8050-bd22-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('bb4ff537-bb18-11ef-8196-00163e047c76', 'MABNI DAN MU\'ROB', 'Berikut merupakan kondisi I’rob jar pada isim, kecuali', 20, '[{\"key\": \"A\", \"value\": \"Isim didahului huruf jar\"}, {\"key\": \"B\", \"value\": \"Isim didahului dhzorof zaman\"}, {\"key\": \"C\", \"value\": \"Isim didahului fiil\"}, {\"key\": \"D\", \"value\": \"Isim didahului dhzorof makan\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'db2e8050-bd22-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('bb5005b5-bb18-11ef-8196-00163e047c76', 'MABNI DAN MU\'ROB', 'Berikut merupakan contoh Irob rofa’ pada isim mutsanna adalah', 20, '[{\"key\": \"A\", \"value\": \" مُسْلِمٌ\"}, {\"key\": \"B\", \"value\": \" مُسْلِمَانِ\"}, {\"key\": \"C\", \"value\": \" مُسْلِمَيْنِ\"}, {\"key\": \"D\", \"value\": \" مُسْلِمُوْنَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'db2e8050-bd22-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('bea2fb6d-bae2-11ef-8196-00163e047c76', 'Isim Berdasarkan Gender', 'Manakah di antara berikut ini yang merupakan contoh “Isim Muannats”?', 20, '[{\"key\": \"A\", \"value\": \"أَحْمَدُ\"}, {\"key\": \"B\", \"value\": \"يُوْسُفُ\"}, {\"key\": \"C\", \"value\": \"فَاطِمَةُ\"}, {\"key\": \"D\", \"value\": \"زَيْدُ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '8526b927-bd21-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('bea30bef-bae2-11ef-8196-00163e047c76', 'Isim Berdasarkan Gender', 'Isim Muannats sering diakhiri dengan huruf?', 20, '[{\"key\": \"A\", \"value\": \"أ\"}, {\"key\": \"B\", \"value\": \"ة\"}, {\"key\": \"C\", \"value\": \"و\"}, {\"key\": \"D\", \"value\": \"ي\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '8526b927-bd21-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('bea318dd-bae2-11ef-8196-00163e047c76', 'Isim Berdasarkan Gender', 'Manakah yang merupakan “Isim Mudzakkar”?', 20, '[{\"key\": \"A\", \"value\": \" شَمْسٌ  \"}, {\"key\": \"B\", \"value\": \" أَرْضٌ  \"}, {\"key\": \"C\", \"value\": \" قَلَمٌ  \"}, {\"key\": \"D\", \"value\": \" مَدْرَسَةٌ  \"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '8526b927-bd21-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('bea323ff-bae2-11ef-8196-00163e047c76', 'Isim Berdasarkan Gender', 'Yang termasuk ke dalam kategori “Isim Muannats” karena merupakan anggota badan yang berpasangan adalah..', 20, '[{\"key\": \"A\", \"value\": \" قَلَمٌ  \"}, {\"key\": \"B\", \"value\": \" عَيْنٌ  \"}, {\"key\": \"C\", \"value\": \" قَمَرٌ  \"}, {\"key\": \"D\", \"value\": \" كِتَابٌ  \"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '8526b927-bd21-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('bea32eb4-bae2-11ef-8196-00163e047c76', 'Isim Berdasarkan Gender', 'Isim yang tidak diakhiri dengan Ta\' marbuthoh dan hanya digunakan untuk menyatakan jenis laki-laki disebut?', 20, '[{\"key\": \"A\", \"value\": \"Isim Muannats\"}, {\"key\": \"B\", \"value\": \"Isim Nakirah\"}, {\"key\": \"C\", \"value\": \"Isim Mudzakkar\"}, {\"key\": \"D\", \"value\": \"Isim Ma\'rifah\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '8526b927-bd21-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('cbde013e-baef-11ef-8196-00163e047c76', 'ISIM ISYAROH', 'Berikut merupakan contoh dari isim isyarah untuk menunjuk lokasi adalah ..', 20, '[{\"key\": \"A\", \"value\": \" هَذَا\"}, {\"key\": \"B\", \"value\": \" ذَلِكَ\"}, {\"key\": \"C\", \"value\": \" هُنَاكَ\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'd342457a-bd21-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('cbde101b-baef-11ef-8196-00163e047c76', 'ISIM ISYAROH', 'Manakah contoh berikut yang merupakan contoh dari Isim Isyaroh yang berakal mudzakar tunggal', 20, '[{\"key\": \"A\", \"value\": \" تِلْكَ مَدْرَسَةٌ\"}, {\"key\": \"B\", \"value\": \" هَذَا مُدَرِّسٌ\"}, {\"key\": \"C\", \"value\": \" هَذِهِ مَجَلَّةٌ\"}, {\"key\": \"D\", \"value\": \" تِلْكَ شَجَرَةٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'd342457a-bd21-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('cbde1bce-baef-11ef-8196-00163e047c76', 'ISIM ISYAROH', 'Manakah contoh berikut yang merupakan contoh dari Isim Isyaroh yang tidak berakal', 20, '[{\"key\": \"A\", \"value\": \" هَذَا كِتَابٌ\"}, {\"key\": \"B\", \"value\": \" ذَلِكَ مُحَمَّدٌ\"}, {\"key\": \"C\", \"value\": \" زَيْدٌ نَائِمٌ\"}, {\"key\": \"D\", \"value\": \" هَذِهِ فَاطِمَةٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'd342457a-bd21-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('cbde26c4-baef-11ef-8196-00163e047c76', 'ISIM ISYAROH', 'Manakah contoh berikut yang merupakan isim isyarah untuk benda mutsanna', 20, '[{\"key\": \"A\", \"value\": \" هَذِهِ فَاطِمَةُ\"}, {\"key\": \"B\", \"value\": \" هَذَانِ كِتَابَانِ\"}, {\"key\": \"C\", \"value\": \" ذَالِكَ حَمِيْدٌ\"}, {\"key\": \"D\", \"value\": \" نَامَ مُحَمَّدٌ فىِ بَيْتِهِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'd342457a-bd21-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('cbde339a-baef-11ef-8196-00163e047c76', 'ISIM ISYAROH', 'Manakah contoh berikut yang merupakan isim isyarah untuk Jamak', 20, '[{\"key\": \"A\", \"value\": \" هُنَاكَ مَسْجِدٌ\"}, {\"key\": \"B\", \"value\": \" هَتاَنِ قَلَمَانِ\"}, {\"key\": \"C\", \"value\": \" هَوُلاَءِ مُسْلِمُوْنَ\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'd342457a-bd21-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('d137fc3c-bb23-11ef-8196-00163e047c76', 'KAANA DAN SAUDARINYA', 'Manakah kalimat berikut yang merupakan contoh penggunaan kaana dengan benar?', 20, '[{\"key\": \"A\", \"value\": \" كَانَ زَيْدٌ سَرِيعٌ\"}, {\"key\": \"B\", \"value\": \" كَانَ مُحَمَّدٌ صَالِحاً\"}, {\"key\": \"C\", \"value\": \" كَانَتْ السَّيَّارَةِ جَمِيلٌ\"}, {\"key\": \"D\", \"value\": \" كَانَ الأُسْتَاذُ مُمْتَازٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '2500c400-bd23-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('d1380ea6-bb23-11ef-8196-00163e047c76', 'KAANA DAN SAUDARINYA', 'Saudari Kaana “لَيْسَ” digunakan untuk menyatakan apa?', 20, '[{\"key\": \"A\", \"value\": \"Waktu tertentu\"}, {\"key\": \"B\", \"value\": \"Penegasan\"}, {\"key\": \"C\", \"value\": \"Peniadaan\"}, {\"key\": \"D\", \"value\": \"Perubahan keadaan\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '2500c400-bd23-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('d1382420-bb23-11ef-8196-00163e047c76', 'KAANA DAN SAUDARINYA', 'Pilih kata yang sesuai dengan kalimat berikut:\r\n\"...... أَصْبَحَ الأَطْفَالُ\"', 20, '[{\"key\": \"A\", \"value\": \" نَائِمَةٌ\"}, {\"key\": \"B\", \"value\": \" نَائِمًا\"}, {\"key\": \"C\", \"value\": \" نَائِمِينَ\"}, {\"key\": \"D\", \"value\": \" نَائِمَاتٍ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '2500c400-bd23-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('d138352c-bb23-11ef-8196-00163e047c76', 'KAANA DAN SAUDARINYA', 'Apa yang terjadi pada khobar kaana dalam kalimat berikut?\r\n”كَانَ البَيْتُ نَظِيفًا”\r\n', 20, '[{\"key\": \"A\", \"value\": \"Irabnya rafa\"}, {\"key\": \"B\", \"value\": \"Irabnya jar\"}, {\"key\": \"C\", \"value\": \"Irabnya nashob\"}, {\"key\": \"D\", \"value\": \"Tidak berubah\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '2500c400-bd23-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('d13844c6-bb23-11ef-8196-00163e047c76', 'KAANA DAN SAUDARINYA', 'Pilih kalimat yang sesuai dengan penggunaan saudari Kaana \"مَا زَالَ\":', 20, '[{\"key\": \"A\", \"value\": \" مَازَلَ السَّلَامُ عَمَلاً حَسَناً\"}, {\"key\": \"B\", \"value\": \" مَا زَالَ الطَّالِبِ مُجْتَهِدٌ\"}, {\"key\": \"C\", \"value\": \" مَا زَالَ العَامِلَ مُجْتَهِدًا\"}, {\"key\": \"D\", \"value\": \" مَا زَالَتْ الطَّالِبَةَ نَائِمٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '2500c400-bd23-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('d6e39d79-bb26-11ef-8196-00163e047c76', 'FIIL MADLI DAN MUDHORE', 'Manakah ciri berikut yang bukan termasuk ciri Fi’il Madhi?', 20, '[{\"key\": \"A\", \"value\": \"Menunjukkan perbuatan di masa lampau\"}, {\"key\": \"B\", \"value\": \"Biasanya berakhiran fathah\"}, {\"key\": \"C\", \"value\": \"Didahului oleh huruf mudhari’ah (أ - ن - ي - ت)\"}, {\"key\": \"D\", \"value\": \"Dapat diakhiri Ta Tanits\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '461783da-bd23-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('d6e3b1be-bb26-11ef-8196-00163e047c76', 'FIIL MADLI DAN MUDHORE', 'Fi’il Mudhari’ biasanya dimulai dengan huruf berikut, kecuali ...', 20, '[{\"key\": \"A\", \"value\": \" أ\"}, {\"key\": \"B\", \"value\": \"ن\"}, {\"key\": \"C\", \"value\": \"ي\"}, {\"key\": \"D\", \"value\": \"ك\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '461783da-bd23-11ef-8196-00163e047c76', 3, 'D', NULL, NULL),
('d6e3c19c-bb26-11ef-8196-00163e047c76', 'FIIL MADLI DAN MUDHORE', 'Manakah kalimat berikut yang menunjukkan contoh Fi’il Mudhari’?', 20, '[{\"key\": \"A\", \"value\": \" كَتَبْنَا\"}, {\"key\": \"B\", \"value\": \" كَتَبَ الطَّالِبُ دَرْسَهُ\"}, {\"key\": \"C\", \"value\": \" الطَّالِبُ كَاتِبٌ\"}, {\"key\": \"D\", \"value\": \" الطَّالِبُ فِى الْفَصْلِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '461783da-bd23-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('d6e3d167-bb26-11ef-8196-00163e047c76', 'FIIL MADLI DAN MUDHORE', 'Manakah Fi’il Madhi yang diakhiri dengan Ta’ Ta’nits?', 20, '[{\"key\": \"A\", \"value\": \" كَتَبْنَا\"}, {\"key\": \"B\", \"value\": \" كَتَبْتُ\"}, {\"key\": \"C\", \"value\": \" كَتَبَتْ\"}, {\"key\": \"D\", \"value\": \" كَتَبَا\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '461783da-bd23-11ef-8196-00163e047c76', 3, 'C', NULL, NULL);
INSERT INTO `quis` (`id`, `title`, `question`, `point`, `option`, `kategori_materi_id`, `materi_id`, `batch`, `answer_key`, `created_at`, `updated_at`) VALUES
('d6e3e08e-bb26-11ef-8196-00163e047c76', 'FIIL MADLI DAN MUDHORE', 'Berikut merupakan contoh Fi’il Mudhari’ untuk bentuk jamak perempuan..', 20, '[{\"key\": \"A\", \"value\": \" تَكْتُبُونَ\"}, {\"key\": \"B\", \"value\": \" تَكْتُبْنَ\"}, {\"key\": \"C\", \"value\": \" تَكْتُبَانِ\"}, {\"key\": \"D\", \"value\": \" يَكْتُبْنَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '461783da-bd23-11ef-8196-00163e047c76', 3, 'B', NULL, NULL),
('d9129b33-bb0b-11ef-8196-00163e047c76', 'ISIM SIFAT MAUSHUF', 'Apa yang dimaksud dengan Isim Sifat Maushuf (Na\'at)?', 20, '[{\"key\": \"A\", \"value\": \"Kata Sifat\"}, {\"key\": \"B\", \"value\": \"Subyek\"}, {\"key\": \"C\", \"value\": \"Sesuatu yang disifati\"}, {\"key\": \"D\", \"value\": \"Predikat\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('d912a9ea-bb0b-11ef-8196-00163e047c76', 'ISIM SIFAT MAUSHUF', 'Dalam kalimat \"طَالِبٌ جَدِيْدٌ,\" apakah kata \"جَدِيْدٌ\" berfungsi sebagai?', 20, '[{\"key\": \"A\", \"value\": \"Maushuf\"}, {\"key\": \"B\", \"value\": \"Mudhof\"}, {\"key\": \"C\", \"value\": \"Sifat\"}, {\"key\": \"D\", \"value\": \"Isim Ma’rifah\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('d912bd96-bb0b-11ef-8196-00163e047c76', 'ISIM SIFAT MAUSHUF', 'Berikut merupakan syarat dan aturan sifat mausuf …..', 20, '[{\"key\": \"A\", \"value\": \"Sifat tidak mengikuti keadaan mausuf\"}, {\"key\": \"B\", \"value\": \"Harus didahului harf jar\"}, {\"key\": \"C\", \"value\": \"Wajib berharakat dhommah\"}, {\"key\": \"D\", \"value\": \"Sifat mengikuti keadaan mausuf\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('d912c969-bb0b-11ef-8196-00163e047c76', 'ISIM SIFAT MAUSHUF', 'Tentukan sifat pada kalimat berikut\r\n\"الْوَلَدُ الصَّالِحُ يَذْهَبُ إِلَى المَسْجِدِ\"\r\n', 20, '[{\"key\": \"A\", \"value\": \" الْوَلَدُ\"}, {\"key\": \"B\", \"value\": \"  الصَّالِحُ\"}, {\"key\": \"C\", \"value\": \" يَذْهَبُ\"}, {\"key\": \"D\", \"value\": \" إِلَى المَسْجِدِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('d912da45-bb0b-11ef-8196-00163e047c76', 'ISIM SIFAT MAUSHUF', 'Jika Maushuf Mudzakkar maka Sifat harus ….', 20, '[{\"key\": \"A\", \"value\": \"Nakiroh\"}, {\"key\": \"B\", \"value\": \"Ma’rifah\"}, {\"key\": \"C\", \"value\": \"Mudzakkar\"}, {\"key\": \"D\", \"value\": \"Muannats\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('dc9f71d4-bb0d-11ef-8196-00163e047c76', 'ISIM SIFAT MAUSHUF', 'Dalam kalimat طَيَّارَتَانِ كَبِيْرَتَانِ, apakah kata \"كَبِيْرَتَانِ\" berfungsi sebagai?', 20, '[{\"key\": \"A\", \"value\": \"Maushuf\"}, {\"key\": \"B\", \"value\": \"Sifat\"}, {\"key\": \"C\", \"value\": \"Isim Jamak\"}, {\"key\": \"D\", \"value\": \"Isim Mufrod\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('dc9f89e3-bb0d-11ef-8196-00163e047c76', 'ISIM SIFAT MAUSHUF', 'Pilihlah kata yg tepat agar terbentuk sifat maushuf\r\n ______هَذِهِ مَدْرَسَةٌ \r\n', 20, '[{\"key\": \"A\", \"value\": \" مَشْهُورٌ\"}, {\"key\": \"B\", \"value\": \" مشْهُوْرَةٌ\"}, {\"key\": \"C\", \"value\": \" مَشْهُورُوْنَ\"}, {\"key\": \"D\", \"value\": \" مَشْهُورَاتُ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('dc9f9d9e-bb0d-11ef-8196-00163e047c76', 'ISIM SIFAT MAUSHUF', 'Tentukan Maushuf pada kalimat berikut\r\nالْوَلَدُ الصَّالِحُ يَذْهَبُ إِلَى المَسْجِدِ\r\n', 20, '[{\"key\": \"A\", \"value\": \" الْوَلَدُ\"}, {\"key\": \"B\", \"value\": \" الصَّالِحُ\"}, {\"key\": \"C\", \"value\": \" يَذْهَبُ\"}, {\"key\": \"D\", \"value\": \"  إِلَى المَسْجِدِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('dc9faefe-bb0d-11ef-8196-00163e047c76', 'ISIM SIFAT MAUSHUF', 'Mana yang menunjukkan Isim Maushuf yang berbentuk Jamak?ِ', 20, '[{\"key\": \"A\", \"value\": \"الطَّالِبُ جَدِيْدٌ\"}, {\"key\": \"B\", \"value\": \"الطَّالِبَاتُ جَدِيْدَاتٌ\"}, {\"key\": \"C\", \"value\": \"طَالِبٌ جَدِيْدٌ\"}, {\"key\": \"D\", \"value\": \"الْجَامِعَةُ جَدِيْدَةٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('dc9fbafa-bb0d-11ef-8196-00163e047c76', 'ISIM SIFAT MAUSHUF', 'Manakah kalimat yang memiliki Isim Sifat Maushuf yang berbentuk Muannats-Mufrod-Nakiroh?', 20, '[{\"key\": \"A\", \"value\": \"الطَّالِبُ اْلجَدِيْدُ\"}, {\"key\": \"B\", \"value\": \"طَالِبَةٌ جَدِيْدَةٌ\"}, {\"key\": \"C\", \"value\": \"طَالِبٌ جَدِيْدٌ\"}, {\"key\": \"D\", \"value\": \"بَيْتٌ جَدِيْدٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('e0562206-bb25-11ef-8196-00163e047c76', 'FIIL MADLI DAN MUDHORE', 'Fi’il Mudhari’ adalah..', 20, '[{\"key\": \"A\", \"value\": \"Kata kerja yang menunjukkan perbuatan yang sedang atau akan dilakukan\"}, {\"key\": \"B\", \"value\": \"Kata kerja yang menunjukkan perbuatan di masa lampau\"}, {\"key\": \"C\", \"value\": \"Kata kerja yang menunjukkan perintah\"}, {\"key\": \"D\", \"value\": \"Kata kerja yang tidak menunjukkan waktu tertentu\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '461783da-bd23-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('e0563879-bb25-11ef-8196-00163e047c76', 'FIIL MADLI DAN MUDHORE', 'Berikut merupakan ciri-ciri dari fi’il mudhari’, kecuali …..', 20, '[{\"key\": \"A\", \"value\": \"Pasti dimulai dengan salah satu huruf mudhoro’ah ( أ - ن - ي - ت )\"}, {\"key\": \"B\", \"value\": \"Huruf sin ( س ) artinya sebentar lagi. Menunjukkan waktu sedang atau yang akan datang.\"}, {\"key\": \"C\", \"value\": \"Huruf saufa ( سوف ) artinya agar/supaya/kelak. Menunjukkan waktu yang akan datang tetapi lebih lama.\"}, {\"key\": \"D\", \"value\": \"Didahului huruf قَدْ \"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '461783da-bd23-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('e05649ba-bb25-11ef-8196-00163e047c76', 'FIIL MADLI DAN MUDHORE', 'Berikut merupakan contoh fi’il mudhori', 20, '[{\"key\": \"A\", \"value\": \" ضَرَبَ أَحْمَدُ\"}, {\"key\": \"B\", \"value\": \" هَذَا طَبِيْبٌ\"}, {\"key\": \"C\", \"value\": \" أنَا أًجْلِسُ فِى الْفَصْلِ\"}, {\"key\": \"D\", \"value\": \" قَلَمُ زَيْدٍ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '461783da-bd23-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('e05655af-bb25-11ef-8196-00163e047c76', 'FIIL MADLI DAN MUDHORE', 'Berikut merupakan contoh dari fi’il madhi yang diakhiri Ta’ Ta’nits..', 20, '[{\"key\": \"A\", \"value\": \" ضَرَبَ\"}, {\"key\": \"B\", \"value\": \" ضَرَبَا\"}, {\"key\": \"C\", \"value\": \" ضَرَبَتْ\"}, {\"key\": \"D\", \"value\": \" تَضْرِبُ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '461783da-bd23-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('e05660a0-bb25-11ef-8196-00163e047c76', 'FIIL MADLI DAN MUDHORE', 'Berikut merupakan contoh dari fi’il mudhari’ untuk jamak, kecuali ….', 20, '[{\"key\": \"A\", \"value\": \" يَكْتُبُ\"}, {\"key\": \"B\", \"value\": \" يَكْتُبُوْنَ\"}, {\"key\": \"C\", \"value\": \" تَكْتُبُوْنَ\"}, {\"key\": \"D\", \"value\": \" تَكْتُبْنَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '461783da-bd23-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('e2cffe07-bb19-11ef-8196-00163e047c76', 'MABNI DAN MU\'ROB', 'Penerapan I’rob rofa’ pada jama’ mudzakkar salim adalah menggunakan…', 20, '[{\"key\": \"A\", \"value\": \"Alif\"}, {\"key\": \"B\", \"value\": \"Wawu\"}, {\"key\": \"C\", \"value\": \"Fathah\"}, {\"key\": \"D\", \"value\": \"Dhommah\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'db2e8050-bd22-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('e2d00d44-bb19-11ef-8196-00163e047c76', 'MABNI DAN MU\'ROB', 'Berikut merupakan penerapan I\'rob nashob pada Isim Munada…', 20, '[{\"key\": \"A\", \"value\": \" نَامَ أَحْمَدُ\"}, {\"key\": \"B\", \"value\": \" يَا رَسُوْلَ اللهِ\"}, {\"key\": \"C\", \"value\": \" ضَرَبْتُ الْكَلْبَ\"}, {\"key\": \"D\", \"value\": \" جَاءَ مُحَمَّدٌ مُنْفَرِدًا\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'db2e8050-bd22-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('e2d01f13-bb19-11ef-8196-00163e047c76', 'MABNI DAN MU\'ROB', 'Berikut ini merupakan penerapan Irob nashob pada maf’ul..', 20, '[{\"key\": \"A\", \"value\": \" زَيْدٌ مُعَلِّمٌ\"}, {\"key\": \"B\", \"value\": \" أَكَلْتُ الْبُرْتُقَـالَ\"}, {\"key\": \"C\", \"value\": \" جَلَسَ أَحْمَدُ عَلى الكُرْسِيِّ\"}, {\"key\": \"D\", \"value\": \" ياَ حَبِيْبَ الْقَلْبِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'db2e8050-bd22-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('e8fa0358-baf0-11ef-8196-00163e047c76', 'ISIM ISYAROH', 'Apa bentuk Isim Isyaroh yang digunakan untuk menunjukkan objek yang dekat dan berjenis laki-laki dalam bentuk tunggal?', 20, '[{\"key\": \"A\", \"value\": \" هَاتَانِ\"}, {\"key\": \"B\", \"value\": \" هَؤُلَاءِ\"}, {\"key\": \"C\", \"value\": \" هَذَا\"}, {\"key\": \"D\", \"value\": \" تِلْكَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'd342457a-bd21-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('e8fa1314-baf0-11ef-8196-00163e047c76', 'ISIM ISYAROH', 'Manakah dari berikut ini yang merupakan bentuk Isim Isyaroh untuk objek yang jauh dan berjenis perempuan dalam bentuk jamak?', 20, '[{\"key\": \"A\", \"value\": \" هَاتَانِ\"}, {\"key\": \"B\", \"value\": \" ذَلِكَ\"}, {\"key\": \"C\", \"value\": \" تِلْكَ\"}, {\"key\": \"D\", \"value\": \" اللَّاتِي\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'd342457a-bd21-11ef-8196-00163e047c76', 3, 'D', NULL, NULL),
('e8fa1e90-baf0-11ef-8196-00163e047c76', 'ISIM ISYAROH', 'Isim Isyaroh mana yang digunakan untuk menunjuk objek tidak berakal dalam bentuk ganda?', 20, '[{\"key\": \"A\", \"value\": \" ذَانِكَ\"}, {\"key\": \"B\", \"value\": \" هَذَانِ\"}, {\"key\": \"C\", \"value\": \" هَؤُلَاءِ\"}, {\"key\": \"D\", \"value\": \" ذَلِكَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'd342457a-bd21-11ef-8196-00163e047c76', 3, 'A', NULL, NULL),
('e8fa29d7-baf0-11ef-8196-00163e047c76', 'ISIM ISYAROH', 'Apa bentuk Isim Isyaroh untuk objek yang dekat dalam bentuk jamak dan berjenis perempuan?', 20, '[{\"key\": \"A\", \"value\": \" هَذَا\"}, {\"key\": \"B\", \"value\": \" هَاتَانِ\"}, {\"key\": \"C\", \"value\": \" هَذِهِ\"}, {\"key\": \"D\", \"value\": \" هَؤُلَاءِ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'd342457a-bd21-11ef-8196-00163e047c76', 3, 'D', NULL, NULL),
('e8fa362a-baf0-11ef-8196-00163e047c76', 'ISIM ISYAROH', 'Dalam kalimat “هُنَاكَ كِتَابٌ,” kata “هُنَاكَ” digunakan untuk menunjukkan:', 20, '[{\"key\": \"A\", \"value\": \"Lokasi di sini\"}, {\"key\": \"B\", \"value\": \"Objek dekat\"}, {\"key\": \"C\", \"value\": \"Lokasi di sana\"}, {\"key\": \"D\", \"value\": \"Objek jauh\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'd342457a-bd21-11ef-8196-00163e047c76', 3, 'C', NULL, NULL),
('e9f56cbe-bafa-11ef-8196-00163e047c76', 'DHOMIR MUTTASIL DAN DHOMIR MUNFASIL', 'Apa yang dimaksud dengan dhomir munfasil?', 20, '[{\"key\": \"A\", \"value\": \"Kata ganti yang ditulis terpisah dengan kata lain\"}, {\"key\": \"B\", \"value\": \"Kata ganti yang ditulis bersambung dengan kata lain\"}, {\"key\": \"C\", \"value\": \"Kata ganti jamak\"}, {\"key\": \"D\", \"value\": \"Kata ganti berjumlah ganda\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '1624ab69-bd22-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('e9f57dd5-bafa-11ef-8196-00163e047c76', 'DHOMIR MUTTASIL DAN DHOMIR MUNFASIL', 'Berikut merupakan contoh dari dhomir muttasil', 20, '[{\"key\": \"A\", \"value\": \" كِتَابُكَ\"}, {\"key\": \"B\", \"value\": \" هُوَ أُسْتَاذٌ\"}, {\"key\": \"C\", \"value\": \"حَمِيْدٌ جَالِسٌ\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '1624ab69-bd22-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('e9f589a7-bafa-11ef-8196-00163e047c76', 'DHOMIR MUTTASIL DAN DHOMIR MUNFASIL', 'Berikut merupakan contoh dari dhomir munfasil, kecuali', 20, '[{\"key\": \"A\", \"value\": \" قَلَمُكَ\"}, {\"key\": \"B\", \"value\": \" هُوَ أُسْتَاذٌ\"}, {\"key\": \"C\", \"value\": \" هُمًا طًالِبَانِ\"}, {\"key\": \"D\", \"value\": \" زَيْدٌ نَائِمٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '1624ab69-bd22-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('e9f59476-bafa-11ef-8196-00163e047c76', 'DHOMIR MUTTASIL DAN DHOMIR MUNFASIL', 'Manakah yang merupakan contoh dari dhomir yang berkedudukan sebagai subjek dari contoh ini “ هُوَ يَأْخُذُ كِتَاَبَكَ”', 20, '[{\"key\": \"A\", \"value\": \" هُوَ\"}, {\"key\": \"B\", \"value\": \" يَأْخُذُ \"}, {\"key\": \"C\", \"value\": \" كِتَاَبَكَ\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '1624ab69-bd22-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('e9f59f69-bafa-11ef-8196-00163e047c76', 'DHOMIR MUTTASIL DAN DHOMIR MUNFASIL', 'Manakah yang merupakan contoh dari dhomir yang berkedudukan sebagai subjek dari contoh ini “وَكُنْتُمْ أَمْواَتًا فَأَحْيَاكُمْ”', 20, '[{\"key\": \"A\", \"value\": \" وَكُنْتُمْ\"}, {\"key\": \"B\", \"value\": \" أَمْواَتًا\"}, {\"key\": \"C\", \"value\": \" فَأَحْيَاكُمْ\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '1624ab69-bd22-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('f5c1e105-bb1b-11ef-8196-00163e047c76', 'INNA DAN SAUDARINYA', 'Apakah fungsi dari Inna?', 20, '[{\"key\": \"A\", \"value\": \"Penjelasan\"}, {\"key\": \"B\", \"value\": \"Penegas\"}, {\"key\": \"C\", \"value\": \"Keterangan\"}, {\"key\": \"D\", \"value\": \"Kata tunjuk\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '0438fff3-bd23-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('f5c1f684-bb1b-11ef-8196-00163e047c76', 'INNA DAN SAUDARINYA', 'Berikut merupakan saudari inna, kecuali', 20, '[{\"key\": \"A\", \"value\": \" لَكِنَّ\"}, {\"key\": \"B\", \"value\": \" لَيْتَ\"}, {\"key\": \"C\", \"value\": \" لَعَلَّ\"}, {\"key\": \"D\", \"value\": \" لَيْسَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '0438fff3-bd23-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('f5c202be-bb1b-11ef-8196-00163e047c76', 'INNA DAN SAUDARINYA', 'Saudari Inna “لَيْتَ ” memiliki makna..', 20, '[{\"key\": \"A\", \"value\": \"Menguatkan\"}, {\"key\": \"B\", \"value\": \"Membetulkan pembicaraan\"}, {\"key\": \"C\", \"value\": \"Menginginkan sesuatu tapi tidak mungkin tercapai\"}, {\"key\": \"D\", \"value\": \"Menginginkan sesuatu tapi masih mungkin tercapai\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '0438fff3-bd23-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('f5c2168a-bb1b-11ef-8196-00163e047c76', 'INNA DAN SAUDARINYA', 'Suadari Inna “كَأَنَّ ” memiliki makna..', 20, '[{\"key\": \"A\", \"value\": \"Menguatkan\"}, {\"key\": \"B\", \"value\": \"Membetulkan pembicaraan\"}, {\"key\": \"C\", \"value\": \"Menginginkan sesuatu tapi tidak mungkin tercapai\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '0438fff3-bd23-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('f5c2259d-bb1b-11ef-8196-00163e047c76', 'INNA DAN SAUDARINYA', 'Saudari Inna “لَعَلَّ ” memiliki makna..', 20, '[{\"key\": \"A\", \"value\": \"Menguatkan\"}, {\"key\": \"B\", \"value\": \"Membetulkan pembicaraan\"}, {\"key\": \"C\", \"value\": \"Menginginkan sesuatu tapi tidak mungkin tercapai\"}, {\"key\": \"D\", \"value\": \"Menginginkan sesuatu tapi masih mungkin tercapai\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '0438fff3-bd23-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('fcc2e947-bb14-11ef-8196-00163e047c76', 'JUMLAH ISMIYAH', 'Jumlah mufidah (kalimat sempurna) dibagi menjadi?', 20, '[{\"key\": \"A\", \"value\": \"1\"}, {\"key\": \"B\", \"value\": \"2\"}, {\"key\": \"C\", \"value\": \"3\"}, {\"key\": \"D\", \"value\": \"4\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b59eca84-bd22-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('fcc30440-bb14-11ef-8196-00163e047c76', 'JUMLAH ISMIYAH', 'Apa yang dimaksud jumlah Ismiyyah?', 20, '[{\"key\": \"A\", \"value\": \"Kalimat yang dimulai dengan kata kerja (fi’il)\"}, {\"key\": \"B\", \"value\": \"Kalimat yang dimulai dengan harf jar\"}, {\"key\": \"C\", \"value\": \"Kalimat yang dimulai dengan isim\"}, {\"key\": \"D\", \"value\": \"Kalimat yang dimulai dengan kata keterangan\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b59eca84-bd22-11ef-8196-00163e047c76', 1, 'C', NULL, NULL),
('fcc31ca0-bb14-11ef-8196-00163e047c76', 'JUMLAH ISMIYAH', 'Apa yang dimaksud jumlah Fi’liyyah?', 20, '[{\"key\": \"A\", \"value\": \"Kalimat yang dimulai dengan kata kerja (fi’il)\"}, {\"key\": \"B\", \"value\": \"Kalimat yang dimulai dengan harf jar\"}, {\"key\": \"C\", \"value\": \"Kalimat yang dimulai dengan isim\"}, {\"key\": \"D\", \"value\": \"Kalimat yang dimulai dengan kata keterangan\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b59eca84-bd22-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('fcc329a7-bb14-11ef-8196-00163e047c76', 'JUMLAH ISMIYAH', ' “زَيْدٌ قَأئِمٌ” merupakan contoh dari', 20, '[{\"key\": \"A\", \"value\": \"Jumlah fi’liyyah\"}, {\"key\": \"B\", \"value\": \"Jumlah Ismiyyah\"}, {\"key\": \"C\", \"value\": \"Harf Jar\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b59eca84-bd22-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('fcc33535-bb14-11ef-8196-00163e047c76', 'JUMLAH ISMIYAH', 'Berikut merupakan contoh dari jumlah fi’liyyah..', 20, '[{\"key\": \"A\", \"value\": \" الطَّالِبُ مَاهِرٌ\"}, {\"key\": \"B\", \"value\": \" هُنَاكَ مَسْجِدٌ\"}, {\"key\": \"C\", \"value\": \" ذَلِكَ أُسْتَاذٌ\"}, {\"key\": \"D\", \"value\": \" قَرَأَتْ مَرْيَمُ القُرْآنَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b59eca84-bd22-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('fd1d8f6d-bb24-11ef-8196-00163e047c76', 'FIIL MADLI DAN MUDHORE', 'Fi’il adalah kata kerja yang menunjukkan perbuatan yang dilakukan pada waktu tertentu. Fi’il dibagi menjadi?', 20, '[{\"key\": \"A\", \"value\": \"Fiil Madhi dan Fiil Mudhari\"}, {\"key\": \"B\", \"value\": \"Fiil Madhi, Fiil Mudhari, Fiil Nahy dan Fiil Amr\"}, {\"key\": \"C\", \"value\": \"Fiil Mudhari, Fiil Amr dan Fiil Madhi\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '461783da-bd23-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('fd1d9f5d-bb24-11ef-8196-00163e047c76', 'FIIL MADLI DAN MUDHORE', 'Berikut merupakan ciri fi’il, kecuali', 20, '[{\"key\": \"A\", \"value\": \"Diawali dengan harf jar\"}, {\"key\": \"B\", \"value\": \"Didahului huruf سَوْفَ \"}, {\"key\": \"C\", \"value\": \"Didahului huruf  قَدْ \"}, {\"key\": \"D\", \"value\": \"Diakhiri Ta Tanits\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '461783da-bd23-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('fd1db1c8-bb24-11ef-8196-00163e047c76', 'FIIL MADLI DAN MUDHORE', 'Fi’il Madhi merupakan..', 20, '[{\"key\": \"A\", \"value\": \"Kata kerja yang menunjukkan suatu perbuatan dikerjakan di masa lampau.\"}, {\"key\": \"B\", \"value\": \"Kata kerja yang menunjukkan suatu perbuatan dikerjakan di masa mendatang\"}, {\"key\": \"C\", \"value\": \"Kata kerja yang menunjukkan suatu perbuatan dikerjakan di masa sekarang\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '461783da-bd23-11ef-8196-00163e047c76', 1, 'A', NULL, NULL),
('fd1dbd4d-bb24-11ef-8196-00163e047c76', 'FIIL MADLI DAN MUDHORE', 'Apa saja ciri-ciri fi’il madhi?', 20, '[{\"key\": \"A\", \"value\": \"Berakhiran fathah\"}, {\"key\": \"B\", \"value\": \"Mengandung makna pekerjaan\"}, {\"key\": \"C\", \"value\": \"Diakhiri dengan نَأ، وا، تْ، تَأ،  dkk\"}, {\"key\": \"D\", \"value\": \"Semua benar\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '461783da-bd23-11ef-8196-00163e047c76', 1, 'D', NULL, NULL),
('fd1dc855-bb24-11ef-8196-00163e047c76', 'FIIL MADLI DAN MUDHORE', 'Berikut merupakan contoh fi’il madhi', 20, '[{\"key\": \"A\", \"value\": \" يَأْكُلُ\"}, {\"key\": \"B\", \"value\": \" كَتَبَ\"}, {\"key\": \"C\", \"value\": \" جَالِسٌ\"}, {\"key\": \"D\", \"value\": \" مُحَمَّدٌ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', '461783da-bd23-11ef-8196-00163e047c76', 1, 'B', NULL, NULL),
('fd958c80-baeb-11ef-8196-00163e047c76', 'ISIM MAUSHUL', 'Jika isim maushul berbentuk Mutsanna Muannats maka menggunakan…', 20, '[{\"key\": \"A\", \"value\": \" اللَّاتِيْ\"}, {\"key\": \"B\", \"value\": \" الَّذَانِ\"}, {\"key\": \"C\", \"value\": \" الَّتَانِ\"}, {\"key\": \"D\", \"value\": \" الَّذِيْنَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b6c897f6-bd21-11ef-8196-00163e047c76', 2, 'C', NULL, NULL),
('fd959db9-baeb-11ef-8196-00163e047c76', 'ISIM MAUSHUL', 'Jika isim maushul berbentuk jamak mudzakkar maka menggunakan…', 20, '[{\"key\": \"A\", \"value\": \" اللَّاتِيْ\"}, {\"key\": \"B\", \"value\": \" الَّذَانِ\"}, {\"key\": \"C\", \"value\": \" الَّتَانِ\"}, {\"key\": \"D\", \"value\": \" الَّذِيْنَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b6c897f6-bd21-11ef-8196-00163e047c76', 2, 'D', NULL, NULL),
('fd95a9e0-baeb-11ef-8196-00163e047c76', 'ISIM MAUSHUL', 'Jika isim maushul berbentuk jamak Muannats maka menggunakan…', 20, '[{\"key\": \"A\", \"value\": \" اللَّاتِيْ\"}, {\"key\": \"B\", \"value\": \" الَّذَانِ\"}, {\"key\": \"C\", \"value\": \" الَّتَانِ\"}, {\"key\": \"D\", \"value\": \" الَّذِيْنَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b6c897f6-bd21-11ef-8196-00163e047c76', 2, 'A', NULL, NULL),
('fd95bd12-baeb-11ef-8196-00163e047c76', 'ISIM MAUSHUL', 'Manakah Contoh isim maushul berikut yang benar…', 20, '[{\"key\": \"A\", \"value\": \" رَأَيْتُ مُحَمَّدًا الَّتِي يَجْلِسُ\"}, {\"key\": \"B\", \"value\": \" ضَرَبَ الأُسْتَاذُ الطَّالِبُ الّذِي يَنَامُ فىِ الْفَصْلِ\"}, {\"key\": \"C\", \"value\": \" زَيْدٌ قَائِمٌ\"}, {\"key\": \"D\", \"value\": \" كَتَبَ أَحْمَدُ الرِّسَالَةَ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b6c897f6-bd21-11ef-8196-00163e047c76', 2, 'B', NULL, NULL),
('fd95c8be-baeb-11ef-8196-00163e047c76', 'ISIM MAUSHUL', 'Berikut merupakan contoh isim maushul jamak mudzakkar', 20, '[{\"key\": \"A\", \"value\": \"  نَظَرَتْ الْمُسْلِمَاتُ الكِتَابَ الَّذِي فىِ الفَصْلِ\"}, {\"key\": \"B\", \"value\": \" نَامَ إِبْرَاهِيْمُ عَلَى فِرَاشِهِ\"}, {\"key\": \"C\", \"value\": \" جَاءَ الْمُسْلِمُوْنَ الّذِيْنَ يَقْرَؤُوْنَ الْقُرْآنَ\"}, {\"key\": \"D\", \"value\": \" يَجْلِسُ أَبِي عَلَى الْكُرْسِيِّ\"}]', 'c376e864-ba1e-11ef-8196-00163e047c76', 'b6c897f6-bd21-11ef-8196-00163e047c76', 2, 'C', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quis_answer`
--

CREATE TABLE `quis_answer` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `point` int NOT NULL,
  `batch` int NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quis_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_materi_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `materi_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quis_answer`
--

INSERT INTO `quis_answer` (`id`, `point`, `batch`, `answer`, `quis_id`, `kategori_materi_id`, `materi_id`, `users_id`, `created_at`, `updated_at`) VALUES
('21260ec9-bb0f-11ef-8196-00163e047c76', 0, 3, 'C', '21260ec9-bb0f-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 2, NULL, NULL),
('21262123-bb0f-11ef-8196-00163e047c76', 0, 3, 'D', '21262123-bb0f-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 2, NULL, NULL),
('21263224-bb0f-11ef-8196-00163e047c76', 0, 3, 'C', '21263224-bb0f-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 2, NULL, NULL),
('212644cc-bb0f-11ef-8196-00163e047c76', 0, 3, 'D', '212644cc-bb0f-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 2, NULL, NULL),
('21265985-bb0f-11ef-8196-00163e047c76', 0, 3, 'D', '21265985-bb0f-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', '61977613-bd22-11ef-8196-00163e047c76', 2, NULL, NULL),
('a53c2017-bb10-11ef-8196-00163e047c76', 20, 1, 'A', 'a53c2017-bb10-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 2, NULL, NULL),
('a53c3108-bb10-11ef-8196-00163e047c76', 20, 1, 'B', 'a53c3108-bb10-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 2, NULL, NULL),
('a53c456e-bb10-11ef-8196-00163e047c76', 20, 1, 'C', 'a53c456e-bb10-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 2, NULL, NULL),
('a53c524d-bb10-11ef-8196-00163e047c76', 0, 1, 'A', 'a53c524d-bb10-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 2, NULL, NULL),
('a53c5e09-bb10-11ef-8196-00163e047c76', 0, 1, 'B', 'a53c5e09-bb10-11ef-8196-00163e047c76', 'c376e864-ba1e-11ef-8196-00163e047c76', '83fcdb9e-bd22-11ef-8196-00163e047c76', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `request_header`
--

CREATE TABLE `request_header` (
  `id` bigint UNSIGNED NOT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `request_header`
--

INSERT INTO `request_header` (`id`, `platform`, `client_key`, `version`, `created_at`, `updated_at`) VALUES
(1, 'web', 'c5767c13-c13e-44ff-a2bc-139f16b12bec', '1.0', '2024-12-13 13:34:54', '2024-12-13 13:34:54'),
(2, 'internal-tools', 'fc7e7647-934a-40c8-b0ea-4502b2998c6e', '1.0', '2024-12-13 13:34:54', '2024-12-13 13:34:54'),
(3, 'mobile', 'd40056ba-fc84-4a19-9cea-50cf3beeb658', '1.0', '2024-12-13 13:34:54', '2024-12-13 13:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'user', '2024-12-13 13:34:54', '2024-12-13 13:34:54'),
(2, 'admin', '2024-12-13 13:34:54', '2024-12-13 13:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0QBfBovudkaWlNM9XrEqXGZAmDouq0remftlT6Dc', NULL, '162.158.90.145', 'Mozilla/5.0 (Linux; Android 9; ASUS_X00TD; Flow) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/359.0.0.288 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmJDZjNJb0lXOE5nQnFST0xwVk54bmNHeTlLcVJzSmZnaTZOYUhacCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734654534),
('1smZUkU5ODjtx0spjtuoDagC7kdJbmwiIBkJvwKS', NULL, '162.158.108.108', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVh1dGdsMzdmWmFlNUVvQld1MXRwdzducUNWem41akdXSnB6a3l2bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734707596),
('2Y8eKiLssC4XE2NiU5q54STaVyuPfWTbZJy4jIga', NULL, '172.70.210.104', 'Mozilla/5.0 (Linux; Android 9; ASUS_X00TD; Flow) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/359.0.0.288 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY09LR3YwN0k2Snc0YWptQTVGUUhkdWJwd0RLMTk4NGdrTTlmRTVXNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734745410),
('3CmfslEk1dtXzRlSS44QBP7WC5GCc0gS6iehIqGm', NULL, '162.158.90.237', 'Mozilla/5.0 (Windows NT 10.0; WOW64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.5666.197 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3dMcEZTaEJ6ZVR4ZlRQNDVVaDhhTVNoYWdMQUR3ZHZlUjRYY21tcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734567704),
('3fBNhNhzNVAGVhzQBuGDBdzVflb8MXUHNcVdBdux', NULL, '172.70.214.31', 'WhatsApp/2.23.20.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXVNTk5vc0hPb1JNbTZEcDdsZGhvUWFZMndPVUkyd2Y1dHNQU2lISyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734394790),
('5lwkJZqVRoKRmVDXfBYDSnwWn79Ntfmawp9Pev8y', NULL, '172.71.81.48', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3Q2M1ZYbG1SNEtIZklxUHJSS1oxWG9IUzJGQ21RNnZFenE2VjlxRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734702942),
('6JbcOUNdU5PBGXI2c4bl2PhQMYGrlLYQmd25Tu2C', NULL, '172.70.207.122', 'Mozilla/5.0 (Linux; Android 9; ASUS_X00TD; Flow) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/359.0.0.288 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialo1NVREaHRDY0tzd0xlRzYwVjF1VHl5MTAyVzJHaFNkVzl6M2ZGaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734189756),
('7pNXJbPo52LKo83qxqQXorKOKBdBXAZXqqdR3qB4', NULL, '172.71.81.48', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3BQTThOenpxMUFYMG1ETVp6d2JQeFplSVNocHptYjllZU44SnRzdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734703101),
('8D8fIEJWgv0IG7kX3lo7G5Qx71Fyhh6O09uYKp7r', NULL, '162.158.108.108', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiazFLSUY2YkJBaUFBN1YybXY0YjYxclFOUEZEcjRZdHdpdFRvVWdaMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734702807),
('9YRkU5LGTl8zx3WnegFonOzU21vfTOvnaQdi4Vht', NULL, '162.158.186.76', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjlEeTFpTlVBdDBOcUVyMURmaVdNTXNqbG5ORWIyMjgwbjZwTTdtbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fX0=', 1734467043),
('AeJkYFrTNA0k7XIUDWrFAyUQ70p50QCyKR7SawUS', NULL, '172.70.214.175', 'Mozilla/5.0 (Linux; Android 9; ASUS_X00TD; Flow) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/359.0.0.288 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmhBWGlrNFhrZGIzbll5WGxId2RxVllkOGNkNzJlMFhsWDQ1NEJFayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734388315),
('aU8xLbuTGGAF6k8WBKy7UzRdawtDyVPFy8pFZnwi', NULL, '162.158.187.41', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODVPTFB5dWpMNzZCMkE3NW1XN2ExWFFpQmVsUWhEWlA5OW9Wa3JqZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734469600),
('AyPEmfnghUE5HOIweManbEEM0PmgwTEiFXJ0GD6p', NULL, '172.70.211.111', 'Mozilla/5.0 (Windows NT 10.0; WOW64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.5666.197 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUE1PSDFwaXNlbDNqNEp4RG1sdnJwRHFyeFlaZENjODdMZ2d5Mmd5MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734654553),
('bIRPuvLY8GhNl7B4ENHFgepbPUOEYBJi6Hiz4kiL', NULL, '162.158.91.77', 'Mozilla/5.0 (Linux; Android 9; ASUS_X00TD; Flow) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/359.0.0.288 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemNjczlPeGY0d0lrWjNFckxaSW56WWZtOGJUMU1yQ1RZcW5wQW1hdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734190516),
('bl2P0wBc1FqksBJvPpC7Y3rYb2QU7Pq4vpGUnlAy', NULL, '172.71.81.48', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2JiNUVkbFlDRFYxUlVPRHhnVjk5elZvenI5d0Z0clYwOGJtMmNyNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734702939),
('CKiR9HKyVcGvIdnPoagQsV7MHzuJ7oho85hHbzlf', NULL, '172.70.215.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidms4OENhRThDcG44cW1BTk9NZERGbWN3Y1Y1bVpaSUIwREhuOVEyVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1734394767),
('CrVSrFqYofYJOEU4ElbBvN2srETyxUDbfiMxskLk', NULL, '162.158.90.77', 'Mozilla/5.0 (Linux; Android 9; ASUS_X00TD; Flow) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/359.0.0.288 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjNRSmdETW1pbTZsQ2htQnlyUDZQQ1RrMHBvRWs1eWo4dFBZZ0U3NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734745436),
('EUM5MHJFD72JafIDH9QpnecQPwcUmfWYpnQzq16p', NULL, '172.70.214.175', 'Mozilla/5.0 (Windows NT 10.0; WOW64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.5666.197 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3RQN05hanZ0UnlXMGdUWFRhcGNtTjBuUzdsSHVWV3BSWmlxd3VkTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734745879),
('fVDge84HZsUDgyhr9d81IRz1kRW141eusXQZ6D1S', NULL, '162.158.91.57', 'Mozilla/5.0 (Windows NT 10.0; WOW64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.5666.197 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXdxbHNueUNFV3ExVGhMUjdWV0ZNdUVlNkdMQmNYUzdLNlJtSGpSOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734190585),
('GTN0ol4JLqFd0gsmdCNHMFpiIIV27CgbdPLNUbfM', NULL, '162.158.108.108', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianNFa1NwTEI1NTN3WUVOM0ZoelhEWFRvQlBXSkY5ejlwektPOXBNNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734707504),
('gz3kvqRmTderPeFvNzF36imtZ5fRIJRFR5lDhiew', NULL, '162.158.108.108', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzJSSGZXTkVhZGg2V25qNURxS0lxVTNDTGh3UlR4dUl1bHU5RXh6dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734707536),
('Hi4m4Iyz7Q9wk3NpMczE1guQD3Z2QNZcJ3KYt6qT', NULL, '162.158.108.108', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWklQeDVySERrR0FoelhjWkYwWjhOcklLc2RjTm44dGJYNTRjcHB4QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734707560),
('i1Anu2UrfaGywDmTzFCtH8ScRGLFDo8sB1dHktXB', NULL, '172.70.214.31', 'WhatsApp/2.23.20.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1pDaWdqc2NYeUZrZVU1cVJmOGdSeGlUV3F3eVZpSEpzRVA5dkE0RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734394777),
('isUjyUfArMSyrsYJfUF1XZbX4AbmJgFIXXbKjZgJ', NULL, '172.69.58.3', 'ReactorNetty/1.1.22', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzZ4d1NxWEtEUmphRnhQSWwwU203UVBjbDJXcGdzUmpoT3k2T0RGUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734467118),
('jEKPFoTNAkDnIzvkyzP0fYeRv7fZiDInA19QocJ6', NULL, '172.70.210.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicVo1MXVHUmdxVUJlcnBDcUYyT1FZMEs4Q3QwWjhkNXY5Q2pJZFlkciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1734482365),
('jQWa9fyj0gQR03HBRnKiq4TMoRUG5i8juhqSzlNb', NULL, '172.69.34.96', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWW1ScG5RQmk4bjJoelBBOFFFcTh6OWsweTJBcHFOZTVMbERNY3pSaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1734565130),
('k4dPiSMpBxR3HkuvEBhUW04EjxJtWPr71c70LcnW', NULL, '172.71.81.48', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3VDWndIVm9yaElCd21jTXhPcUxDb3FUUFphUjYzUGZpQms1ZVI0byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734702948),
('KApi7f1oOX5bJWkqGIkiUP3oON2ocVChJocukZsR', NULL, '172.71.81.48', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlo5OHBhb1NwRURPT0tDZmNUTjh1endmVnpMVE1TMkdmV0I2TnB1QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734702934),
('kFabkmqVsN4FHzHTngq2yOSPzPoMUqbxWxKftG8L', NULL, '172.71.81.48', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3VTSHA5Ynp6UDJYWW1oMmt2Q3M3b1F5TXprS1lkU0NOT0Q5UGNxNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734703136),
('kKLB5bQUc16LyE4NQ6FNsnlbr5JE2MG6QIPhgEOn', NULL, '172.71.81.48', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWhGRWtjMHJSbXExQnFDdmthc08zTUNoZ0FCNVI5ZnBDSDZ2OERJViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734703102),
('lEyFYtaTmDGn4QLBwsM7iTAXnGLmFWNWMydJTeRx', NULL, '172.71.81.48', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVNaT05UcVJYZWxqRlhTd2lHSFJjY1JaSTRqRWxMTmY5Wko5QTc2ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734703102),
('LJfkw2zCfpb8r3JIBlZI5vfbGUTVguepS6hSy06z', NULL, '172.70.214.123', 'Mozilla/5.0 (Linux; Android 9; ASUS_X00TD; Flow) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/359.0.0.288 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienU3N3Z6U3BwRWhzR2dvYXhURnRTTmZkZVM4NjF5a0l2cDM2UDI4NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734302897),
('LmFu9mfWuamr2nrlTZi36SH1whED5OwiHNm7mlpr', NULL, '172.70.215.40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiU0JSWXRNV0sydXJhU0Z4cHc3MTZ4Vjl4RkZzUmJLNU9vOEhtbHptQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1734579963),
('LulewxY39QFCAs6cLwQjwjoI9hhjYpmz8FoDoxaG', NULL, '172.70.215.40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWZWZVphS0VhWU5YTk9OeHJ1aTY0MGU0ZllWcldoYlRaeWhKYXNuMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734101550),
('MAyBNhHpCfFy2qqHGD8n43oDn8l2sK194gdVQB24', NULL, '162.158.90.36', 'Mozilla/5.0 (Linux; Android 9; ASUS_X00TD; Flow) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/359.0.0.288 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibDZyUEdYbE5FVG5QelJYVzdqaTdtWldLWmZjaFpIZXFPS3VHNzd0WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734104897),
('mQNjvPA5JsInfNo4YGk2OyauFEBkggfETwA31i6I', NULL, '172.70.207.143', 'Mozilla/5.0 (Linux; Android 9; ASUS_X00TD; Flow) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/359.0.0.288 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3VrdnlsQU1jZWNKVE1Wc0gycFg2dWRCT052QURkMzJMM3B5WGNPMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734567762),
('mrOse9kfYHjft4mDz6QDZwVUfn7rXGEvifPMNdcR', NULL, '172.69.34.96', 'Mozilla/5.0 (Linux; Android 9; ASUS_X00TD; Flow) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/359.0.0.288 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVhSTm9kY2s0WTFTbkNPb0RFWUlTT0hkdVBLYmtPbm9kWXBKekpIYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734654513),
('NII4IgxAkSmNcO8ZsSSrNx2uXX6yxkxrio6Ge5YE', NULL, '172.71.81.48', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFZqSTZyVjdnV3B1Q0xRNmNFZ1RTblh2NldxakpZOWpVMGRYQmxoNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734703102),
('nTcQAMVTtROvWCobOxofdesMm4dRXs3g0xTaVQ2U', NULL, '162.158.108.108', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoickRJMmpvZ1Rra1FhR3VsQzdHZzlFY0kzNjRWVW9Dc3JQRGlxTW50biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734702804),
('o55EAeGp92WG42CCiRGZyzRlq2BUUKxZiSR8wtF5', NULL, '172.71.255.101', 'ReactorNetty/1.1.22', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieEd4MGlHa3NQeHFiM3NIMEZQNTdUR0VNWmRmeDVrWnlJa3ZEbGZoSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734467107),
('PgyNXa561ZJ968ZZ2kBAYRkf1SOlRYaGjxGrvWuE', NULL, '172.70.211.126', 'Mozilla/5.0 (Linux; Android 9; ASUS_X00TD; Flow) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/359.0.0.288 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTlHVkVLd0ZIS2h5RTc3YW5wOTRmNXkwM2tVRm01ejVTY1JzaU5qViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734301897),
('sfBkkQNaFGK8Cj5RxdCjnb0VmYXLx3aAC0MOBdpT', NULL, '162.158.108.108', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVBBaGh6THh6TzBYQk5neUlKZGVnS2RYdmhWSzB1d3hqZ1loZlFSNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734707612),
('sPnOVDXv1bDb1g1gyk9Z2Pv19ta9DnmvULVQzLjn', NULL, '162.158.108.108', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGp6N05nOUVWb2hYUDBWbGNRYnlPajM5V2VPaW1pVW81VUdzS1drTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734702785),
('TWVzPZHBtoBFSvvKA4DjarvYxZdxprnotwkhLPS4', NULL, '172.71.81.48', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVpsb0EybVV4N3c3U1NhcWZPRm5Ya05FNDlCY05KOXV2WklKUnZ3VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734703100),
('ufFwRNdjzBeDpDy9UFKXKcFNsIvwzU4WlIuaAPXg', NULL, '162.158.108.108', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWhUWlVkWWNZYjA3RWQ5TEF6NkFhdHFjc0JYendzNGFSeVJPN2E0NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734707624),
('x4A9bvi3OIL774gnCL7MUeEmyQC78x9ysatrCjUI', NULL, '172.70.210.201', 'Mozilla/5.0 (Linux; Android 9; ASUS_X00TD; Flow) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/359.0.0.288 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2Z4ZGlNa0RXQU9SSlBnMkFLUkFnSFFNcTNJdTVnOFVMV2lWb3kxZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734388200),
('XTAxcpecUokfWXzVKwTl9tPymSjN0SEsn6VloBYM', NULL, '162.158.108.108', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUhZUUFFd2ZDYTNzeEplZGdpQzJOY2o5Z3JyS0xaQVdGY05XQVFxcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734702810),
('ylxYPD4Btr3a1Hi8ZtrCemNYSAKiYY42isElwCc5', NULL, '172.70.210.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2pUeFpXcmRLY0J2bTlGQTJTdTRMNjBrNnNKZVp5dVkzTG13RHNiNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734186031),
('yZhCRKRHRdBCTHVFvrIk4kgVjKwPecP6wyBOVsQ3', NULL, '172.71.81.48', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlJKaG91TjA5VGhSWE9pMGJ0aG9tR0g5QmhVNlU1THliOTlmRzgxOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734703102),
('Z6Xw7XgHSOagVxWrYB7m1O0WoXT6gwFJkdoIex09', NULL, '172.70.127.70', 'ReactorNetty/1.1.22', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDIxbWliMzh4bVRCWDJua29BRUhSTGVoY3JxRExpa2xvb2dlUlZIRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734467130),
('ZUDcP9vx84Ky7HpuxeKGGtd47ctZR99jGzb6LoBE', NULL, '162.158.108.108', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzh0bmhuc29ZWm03aHFPOXVuUE9KWU05dHYzOVZFWmVISFlueEVpYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734702773),
('zwF3mut4xmr0Bhv5Ukbxy5Y7PLFfpWOuYWbjMxsb', NULL, '172.71.82.123', 'okhttp/4.11.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzd0czkzcWRBcTJBUHhFSmdLV1hlUjJReVdyUTBJSk4yMzZHQWxRbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZGV2LWFwaS5uYXNob2xlYXJuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734739537);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_lengkap` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_lengkap`, `email`, `username`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin nasho learn', 'adminnasho@gmail.com', 'adminnasholearn', '$2y$12$MhuVeQJx8KImSuDx88f1a.QnQhBz9hzMKLWcmpR3IRy0GUhEFiqJK', 2, NULL, '2024-12-13 13:34:55', '2024-12-13 13:34:55'),
(2, 'ihsan', 'ihsan@gmail.com', NULL, '$2y$12$TLiyl7OIuSYVZ4IQqfj38uUAR9HwLPZBKZe55sG34JE7Mz2RZX9HK', 1, NULL, '2024-12-14 12:15:10', '2024-12-14 12:15:10'),
(3, 'Muhammad Syamsul Ma\'rif', 'samsul.marif100@gmail.com', NULL, '$2y$12$HakCgnUyaE/trRVMLXxlDOgCYZqpZEB5MCGiz7mLLQsCfJ26fADzC', 1, NULL, '2024-12-14 13:29:20', '2024-12-14 13:29:20'),
(4, 'khanif@gmail.com', 'khanif@gmail.com', NULL, '$2y$12$ZU20mUzfFdIo5SI8MehRYODfegOxHUccNWK20l/PCP/DNkVhuzAcm', 1, NULL, '2024-12-16 02:52:32', '2024-12-16 02:52:32'),
(5, 'ibog', 'ibog@gmail.com', NULL, '$2y$12$hpC0SawEwTP.C/fgbBJVTOB0ose/gWv6QRcPuAdkqY7xW.4lKZHe.', 1, NULL, '2024-12-19 23:18:27', '2024-12-19 23:18:27'),
(6, 'fiqi', 'fiqi@gmail.com', NULL, '$2y$12$o5R/gP1dGpqH0Unz5XTHwOxqTTgp6t.IQDVxzeD4Eor1/ecw1pZDW', 1, NULL, '2024-12-20 12:12:45', '2024-12-20 12:12:45'),
(7, 'Sansan', 'sansan@gmail.com', NULL, '$2y$12$YkluzgEX1xyTTPc.TisiV.YoaB06.X/25lChg6QZRoiwEknSnlTde', 1, NULL, '2024-12-20 12:53:41', '2024-12-20 12:53:41'),
(8, 'Celeng', 'Celeng@gmail.com', NULL, '$2y$12$j1UJSjVstI1BfRpk/AIFX.NDtfzAf5mNEy4go1/mf3bNe7fBLqC3K', 1, NULL, '2024-12-20 12:59:12', '2024-12-20 12:59:12'),
(9, 'halo', 'halo@gmail.com', NULL, '$2y$12$IBAiMwoXic1ek8yk44v2uOKx70f/xn68YSm6yU0JQ.c3WA3wgThEy', 1, NULL, '2024-12-20 14:13:55', '2024-12-20 14:13:55'),
(10, 'arnold', 'arnold@gmail.com', NULL, '$2y$12$Cq0WOl1i6njE1pSeVTU3cu7/t4orDKvhqUnakpM5J/WV8yO8dWOgK', 1, NULL, '2024-12-20 23:06:30', '2024-12-20 23:06:30'),
(11, 'cek', 'cek@gmail.com', NULL, '$2y$12$rsSRqOkIocZHwQ6zSF13fuu6Vj1F16Td6wCWkdaXBLVmIO3ZziqaW', 1, NULL, '2024-12-21 00:53:44', '2024-12-21 00:53:44'),
(12, 'FINALTEST10', 'FINALTEST@GMAIL.COM', NULL, '$2y$12$g3RLQczo3A.pyznpMHoob.P2foU.lLeFOKvC6K8tNLtSC9AzKmKKK', 1, NULL, '2024-12-21 02:54:52', '2024-12-21 02:54:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
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
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_answer`
--
ALTER TABLE `exam_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_answer_users_id_foreign` (`users_id`);

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
-- Indexes for table `kategori_materi`
--
ALTER TABLE `kategori_materi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_materi_detail`
--
ALTER TABLE `kategori_materi_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_materi_detail_users_id_foreign` (`users_id`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

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
-- Indexes for table `quis`
--
ALTER TABLE `quis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quis_answer`
--
ALTER TABLE `quis_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quis_answer_users_id_foreign` (`users_id`);

--
-- Indexes for table `request_header`
--
ALTER TABLE `request_header`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_materi_detail`
--
ALTER TABLE `kategori_materi_detail`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_header`
--
ALTER TABLE `request_header`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exam_answer`
--
ALTER TABLE `exam_answer`
  ADD CONSTRAINT `exam_answer_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `kategori_materi_detail`
--
ALTER TABLE `kategori_materi_detail`
  ADD CONSTRAINT `kategori_materi_detail_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `quis_answer`
--
ALTER TABLE `quis_answer`
  ADD CONSTRAINT `quis_answer_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

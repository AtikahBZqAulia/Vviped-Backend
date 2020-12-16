-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 16, 2020 at 11:24 PM
-- Server version: 10.3.25-MariaDB-log-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jakart44_vvipeddb`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaign_list`
--

CREATE TABLE `campaign_list` (
  `id` int(11) NOT NULL,
  `path` varchar(256) NOT NULL,
  `campaign_category` varchar(256) NOT NULL,
  `campaign_title` varchar(256) NOT NULL,
  `campaign_desc` varchar(512) NOT NULL,
  `campaign_receiver` varchar(256) NOT NULL,
  `usage_details` varchar(512) NOT NULL,
  `phone_campaign` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campaign_list`
--

INSERT INTO `campaign_list` (`id`, `path`, `campaign_category`, `campaign_title`, `campaign_desc`, `campaign_receiver`, `usage_details`, `phone_campaign`, `user_id`) VALUES
(1, 'uploads/5fa247880789d.JPG', 'pendidikan', 'Bantu Adik Misya untuk Sekolah', 'Membantu adik misya yang putus sekolah karena tidak adanya biaya', 'Adik Misya', 'Untuk membayar uang SPP, seragam, dan buku', '087584585249', 2),
(4, 'uploads/5facab192fa87.jpeg', 'Bantuan Pendidikan', 'Bantu Anak Keluarga Pak Dono untuk Bersekolah', 'Pak Dono yang merupakan tulang punggung keluarga tertimpa musibah saat sedang bekerja yang mengakibatkan kehilangan kakinya. Pak Dono yang kini sudah tidak bisa bekerja membuat anak-anaknya putus sekolah karena tidak ada biaya', 'anak keluarga Pak Dono', 'membeli seragam, buku, dan keperluan sekolah lainnya', '08225556443', 2),
(3, 'uploads/5fa253ff96644.jpg', 'sosial', 'berbagi makanan', 'donasi akan disalurkan ke pedagang jalanan', 'pedagang keliling di lingkungan bintara', 'paket makanan, minuman, buah', '087883520021', 1),
(5, 'uploads/5facabdb247d7.jpeg', 'Kegiatan Sosial', 'Berbagi Makanan', 'donasi akan dibagikan kepada para pemulung', 'para pemulung di lingkungan mustikajaya bekasi', 'membeli paket makanan, minuman, dan buah', '085542266842', 1),
(6, 'uploads/5facac8c08911.jpeg', 'Kegiatan Sosial', 'berbagi makanan', 'berbagi sembako kepada orang-orang kurang mampu yang tinggal di lingkungan TPST Bantargebang', 'Orang-orang kurang mampu yang tinggal di lingkungan TPST Bantargebang', 'pembelian sembako', '085273173192', 2),
(7, 'uploads/5facad87a4152.jpeg', 'Kegiatan Sosial', 'Berbagi sembako', 'Berbagi sembako kepada orang-orang yang kurang mampu yang tinggal di bantaran sungai Ciliwung', 'orang-orang yang kurang mampu yang tinggal di bantaran sungai Ciliwung', 'pembelian sembako', '082316464319', 2),
(15, 'uploads/5fc93a1cec8a5.jpg', 'Pendidikan', 'Renovasi Rumah Belajar', 'Mari bantu anak-anak desa harapan untuk memiliki rumah belajar yang  nyaman di lingkungan mereka', 'Rumah Belajar Harapan Bangsa', 'Membeli semu keperluan untuk merenovasi rumah belajar', '085777885465', 16),
(16, 'uploads/5fc9e07223063.jpg', 'bantu anak yatim', 'membantu anak yatim untuk membayar uang sekolah', 'karena dalam masa pandemi dan banyak anak yatim yang hanya tinggal bersama kerabatnya yang memiliki ekonomi yang pas-pasan. dan tidak berpenghasilan sama sekali', 'anak yatim kelurahan rawa terate', 'pembelian sembako dan membantu biaya sekolah', '085694760270', 17),
(14, 'uploads/5fc8f4f2c215e.jpg', 'Lingkungan', 'Membantu kucing terlantar di jalanan', 'kasian kucing2 yg di jalanan butuh asupan yg cukup', 'kucing di jalanan di bintara bekasi barat', 'paket hemat berisi makanan kucing kering, basah, & air aqua gelas', '087886954900', 14),
(17, 'uploads/5fc9e072b2681.jpg', 'bantu anak yatim', 'membantu anak yatim untuk membayar uang sekolah', 'karena dalam masa pandemi dan banyak anak yatim yang hanya tinggal bersama kerabatnya yang memiliki ekonomi yang pas-pasan. dan tidak berpenghasilan sama sekali', 'anak yatim kelurahan rawa terate', 'pembelian sembako dan membantu biaya sekolah', '085694760270', 17);

-- --------------------------------------------------------

--
-- Table structure for table `logging`
--

CREATE TABLE `logging` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `activity` varchar(256) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logging`
--

INSERT INTO `logging` (`id`, `user_id`, `username`, `activity`, `datetime`) VALUES
(24, 1, 'octarinasls', 'Click add new campaign button', '2020-12-16 16:59:31'),
(23, 1, 'octarinasls', 'Click Logout button', '2020-12-16 16:59:29'),
(22, 1, 'octarinasls', 'Click Logout button', '2020-12-16 16:56:09'),
(20, 1, 'octarinasls', 'Click Beli for product chocodot (chocolate dodol garut)', '2020-12-16 16:01:12'),
(21, 1, 'octarinasls', 'Click add new campaign button', '2020-12-16 16:28:26'),
(19, 1, 'octarinasls', 'Click Jual Produk Saya for campaign  membantu anak yatim untuk membayar uang sekolah', '2020-12-16 15:46:08'),
(18, 1, 'octarinasls', 'Buy Product toner hada labo', '2020-12-16 14:42:12'),
(17, 1, 'octarinasls', 'Buy Product chocodot (chocolate dodol garut)', '2020-12-16 14:42:06'),
(25, 1, 'octarinasls', 'Click Logout button', '2020-12-16 17:02:12'),
(26, 1, 'octarinasls', 'Logout from apps', '2020-12-16 17:02:17'),
(27, 1, 'octarinasls', 'Click Jual Produk Saya for campaign  membantu anak yatim untuk membayar uang sekolah', '2020-12-16 21:07:31'),
(28, 1, 'octarinasls', 'Upload new product for campaign membantu anak yatim untuk membayar uang sekolah', '2020-12-16 21:10:20'),
(29, 1, 'octarinasls', 'Click add new campaign button', '2020-12-16 21:11:41'),
(30, 1, 'octarinasls', 'Upload new campaign', '2020-12-16 21:12:31'),
(31, 1, 'octarinasls', 'Click Ubah Profil button', '2020-12-16 21:38:21'),
(32, 1, 'octarinasls', 'Click Ubah Profil button', '2020-12-16 21:40:31'),
(33, 1, 'octarinasls', 'Saving profile update', '2020-12-16 21:40:42'),
(34, 1, 'octarinasls', 'Click Beli for product chocodot (chocolate dodol garut)', '2020-12-16 21:47:15'),
(35, 1, 'octarinasls', 'Chat seller for product chocodot (chocolate dodol garut)', '2020-12-16 21:47:17'),
(36, 1, 'octarinasls', 'Click Logout button', '2020-12-16 21:53:15'),
(37, 1, 'octarinasls', 'Logout from apps', '2020-12-16 21:53:15'),
(38, 1, 'octarinasls', 'Login apps', '2020-12-16 21:53:28'),
(39, 1, 'octarinasls', 'Click Logout button', '2020-12-16 22:31:13'),
(40, 1, 'octarinasls', 'Logout from apps', '2020-12-16 22:31:14');

-- --------------------------------------------------------

--
-- Table structure for table `selling_posts`
--

CREATE TABLE `selling_posts` (
  `id` int(11) NOT NULL,
  `path` varchar(256) NOT NULL,
  `product_price` varchar(128) NOT NULL,
  `product_name` varchar(256) NOT NULL,
  `product_condition` varchar(10) NOT NULL,
  `product_desc` varchar(512) NOT NULL,
  `seller_loc` varchar(256) NOT NULL,
  `selling_status` varchar(10) NOT NULL,
  `whatsapp` varchar(15) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selling_posts`
--

INSERT INTO `selling_posts` (`id`, `path`, `product_price`, `product_name`, `product_condition`, `product_desc`, `seller_loc`, `selling_status`, `whatsapp`, `user_id`, `campaign_id`) VALUES
(3, 'uploads/5f9e859b26b00.jpeg', '30000', 'Tanaman Hijau', 'New', 'Tanaman dalam kondisi bagus. Panjang daun 60cm. \r\n\r\nBisa COD daerah Rawamangun dan sekitarnya.', 'Bekasi', 'SALE', '6287883520021', 2, 1),
(5, 'uploads/5f9e8ac95197e.jpg', '20000', 'Mouse Gaming Logitech G PRO', 'Second', 'Logitech G PRO dengan box. \r\n\r\nPemakaian dari Januari 2020.\r\n\r\nSebelah kanan karet sudah terkikis. \r\n\r\nNo double klik. \r\nSemua sensor aman. \r\nSoftware logitech aman.', 'bekasi', 'SALE', '6282117250190', 1, 1),
(7, 'uploads/5f9e9e0e3c5bc.jpg', '50000', 'Buah', 'New', 'Buah', 'Bekasi', 'SALE', '6282117250190', 1, 1),
(31, 'uploads/5fa11d35a429b.jpg', '110000', 'Helm ', 'New', 'Kondisi baru, size L', 'Jl. Raya Bintara 6 Bekasi barat', 'SALE', '6282117250190', 1, 1),
(33, 'uploads/5fa17b064394b.jpeg', '70000', 'Pampers MamyPoko', 'New', 'Masih baru', 'Bekasi', 'SALE', '6282117250190', 1, 1),
(34, 'uploads/5fa2312c50c98.jpeg', '15000', 'Garnier Micellar Water', 'Second', 'isi produk masih banyak, kondisi sekitar 80%', 'Kecamatan Mustika Jaya, Bekasi, Jawa Barat', 'SOLD', '6287883520021', 1, 1),
(36, 'uploads/5fae12b1e1a9f.jpeg', '30000', 'Bebek', 'New', 'kondisi bebek sehat 100%', 'Bekasi', 'SALE', '6282117250190', 1, 1),
(37, 'uploads/5fae9031510a2.jpeg', '20000', 'Dompet', 'Second', 'kondisi dompet masih 80%', 'Bekasi', 'SOLD', '6282117250190', 1, 1),
(44, 'uploads/5fbe7de266f79.png', '35000', 'spotify premium', 'New', 'memberikan skip tak terbatas dan melampauinya', 'bintara', 'SALE', '6287883520021', 1, 1),
(45, 'uploads/5fc35e15542c2.jpeg', '40000', 'Cardigan Hitam', 'Used', 'Kualitas masih 90%, bahan adem', 'Bekasi Timur', 'SALE', '6282117250190', 1, 4),
(46, 'uploads/5fc8f3404d311.jpg', '20000', 'Vitamin C', 'New', 'bagus utk daya tahan tubuh', 'bintara', 'SALE', '6287886954900', 14, 9),
(47, 'uploads/5fc8f722dc31c.jpg', '35000', 'toner hada labo', 'Used', 'kondisi 95% baru dipake 10 tetes', 'bintara', 'SALE', '6287886954900', 14, 14),
(48, 'uploads/5fc9e0a41af41.jpg', '10000', 'Pare Segar', 'New', 'Baru panen dari ladang', 'Bogor', 'SALE', '6285777885465', 16, 15),
(49, 'uploads/5fc9e0ebc96ab.jpg', '30000', 'chocodot (chocolate dodol garut)', 'New', 'peduli anak yatim', 'cakung', 'SALE', '6285694760270', 17, 17);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `fullname` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `user_profpic` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `fullname`, `username`, `password`, `user_profpic`) VALUES
(1, 'octarinasalsabila@gmail.com', 'Octarina Salsabila', 'octarinasls', '$2y$10$ERBi4/SZB/wHrok48acaDuV2By/gvtES5Y3tCU5SopgDYEgMVH23W', 'uploads/5fd1ed4dc145c.jpeg'),
(2, 'mauraqoonitah@gmail.com', 'Maura Qoonitah', 'mauraputri', '$2y$10$imYzemY8uVX9Gw1u9JXmRe.4IdqjRLyiSEKDGI5qCblz5L4KpWAz.', 'uploads/5fd24e801595c.jpg'),
(3, 'atikahap.yes@gmail.com', 'Atikah Aulia', 'atikahlogic', '$2y$10$CLSJ1PiNlBbBTOkF.usp8.ABogcBFrUovdagQBtAwukVphbw0coLe', 'profpic/profpic_default.png'),
(0, 'salsa9929@gmail.com', 'Salsa Rahmadati', 'salsarahmadati', '$2y$10$erjU.m/2y2WxBi6Vk7OiLueUZOnAw472aQ1BuIlhQP0FsA66CbzR6', 'profpic/profpic_default.png'),
(6, 'rinaa7756@gmail.com', 'rina agustina', 'rinaagst', '$2y$10$uZ2oLtrKIYqo4zzLsnTk/O.YZpN.EyPGiHcnC5NYdsczLxxKkTfGO', 'profpic/profpic_default.png'),
(7, 'mohamadadli030@gmail.com', 'Mohamad Adli ', 'mohamadadli', '$2y$10$JFLoUN5kfyHDL0tTD1cTsezd4Y2AkgTS1916bOVnzvKY3Daxq/IFy', 'profpic/profpic_default.png'),
(19, 'adinigufroni06@gmail.com', 'adini g', 'adinigf', '$2y$10$x89OdHyrsh2sSJ93hDdzo.Db2fnh0qi6t1kuSGslnwYpYGOEGspQS', 'profpic/profpic_default.png'),
(9, 'ardianperdanaputra@gmail.com', 'Ardian Perdana Putra', 'ardee123', '$2y$10$9kn/wUVl877pnxoYEHD22eckigYj3KwcjS7fPnDtlZsq7XPKxc1tK', 'profpic/profpic_default.png'),
(18, 'legendhanzo@gmail.com', 'muhammad hafidh oktanevaldi', 'legendhanzo', '$2y$10$FVuT43xCuGCzKWyyPz5L/eb9Co.ZLjbXWzfMC3ZcV850uS8gmEpjW', 'profpic/profpic_default.png'),
(17, 'novitanovnov321@gmail.com', 'Novitasari', 'novita11', '$2y$10$by.eoBJ/q2hPTmNe5xVVXOOsnJBj9XBUPvGpVGd3XiVEcVmVffaMe', 'profpic/profpic_default.png'),
(16, 'farahtest@gmail.com', 'farah', 'farah12', '$2y$10$jpjT1/HRl0mOtBfrVeMXAemeKNrF.hA5XwuRTf.FZ8syOBQNU9Vvi', 'profpic/profpic_default.png'),
(13, 'privatin19unj@gmail.com', 'privatin', 'privatin', '$2y$10$tc6hqKy31R458EfqttqsnO2oKE9snpX2VeHsTN88t/kXZgywL7012', 'profpic/profpic_default.png'),
(14, 'nurzaakiahulfah@gmail.com', 'Ulfah Nurzaakiah', 'ulfahnr', '$2y$10$VaPEfHDmlTTBMhtIHb1VDuiMxCFhURjs0RshuQfr53lzeHfQ1S2Ka', 'profpic/profpic_default.png'),
(15, 'ronggopiero08@gmail.com', 'ronggo piero putra', 'gooogoo', '$2y$10$0pW7LcQ5ZUBMf9bIdmxPUe893IgDyTXAbnZITwLxLfpqEUb6Lg8gm', 'profpic/profpic_default.png'),
(20, 'aji.tutorial86@gmail.com', 'Aji Tutorial', 'AjiTutorial', '$2y$10$KdlpiOtp5WK8hzJ3hdN7jO1a7delNRXKxgpRNh/ZzulhK.txvAmKC', 'profpic/profpic_default.png');

-- --------------------------------------------------------

--
-- Stand-in structure for view `VIEW_CAMPAIGNLIST`
-- (See below for the actual view)
--
CREATE TABLE `VIEW_CAMPAIGNLIST` (
`id` int(11)
,`path` varchar(256)
,`campaign_category` varchar(256)
,`campaign_title` varchar(256)
,`campaign_desc` varchar(512)
,`campaign_receiver` varchar(256)
,`usage_details` varchar(512)
,`phone_campaign` varchar(128)
,`user_id` int(11)
,`username` varchar(128)
,`fullname` varchar(128)
,`email` varchar(128)
,`user_profpic` varchar(256)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `VIEW_SELLINGPOSTS`
-- (See below for the actual view)
--
CREATE TABLE `VIEW_SELLINGPOSTS` (
`id` int(11)
,`path` varchar(256)
,`product_price` varchar(128)
,`product_name` varchar(256)
,`product_condition` varchar(10)
,`product_desc` varchar(512)
,`seller_loc` varchar(256)
,`selling_status` varchar(10)
,`whatsapp` varchar(15)
,`user_id` int(11)
,`email` varchar(128)
,`fullname` varchar(128)
,`username` varchar(128)
,`user_profpic` varchar(256)
,`campaign_id` int(11)
,`campaign_title` varchar(256)
);

-- --------------------------------------------------------

--
-- Structure for view `VIEW_CAMPAIGNLIST`
--
DROP TABLE IF EXISTS `VIEW_CAMPAIGNLIST`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jakart44`@`localhost` SQL SECURITY DEFINER VIEW `VIEW_CAMPAIGNLIST`  AS  select `cl`.`id` AS `id`,`cl`.`path` AS `path`,`cl`.`campaign_category` AS `campaign_category`,`cl`.`campaign_title` AS `campaign_title`,`cl`.`campaign_desc` AS `campaign_desc`,`cl`.`campaign_receiver` AS `campaign_receiver`,`cl`.`usage_details` AS `usage_details`,`cl`.`phone_campaign` AS `phone_campaign`,`cl`.`user_id` AS `user_id`,`u`.`username` AS `username`,`u`.`fullname` AS `fullname`,`u`.`email` AS `email`,`u`.`user_profpic` AS `user_profpic` from (`campaign_list` `cl` left join `user` `u` on(`cl`.`user_id` = `u`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `VIEW_SELLINGPOSTS`
--
DROP TABLE IF EXISTS `VIEW_SELLINGPOSTS`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jakart44`@`localhost` SQL SECURITY DEFINER VIEW `VIEW_SELLINGPOSTS`  AS  select `sp`.`id` AS `id`,`sp`.`path` AS `path`,`sp`.`product_price` AS `product_price`,`sp`.`product_name` AS `product_name`,`sp`.`product_condition` AS `product_condition`,`sp`.`product_desc` AS `product_desc`,`sp`.`seller_loc` AS `seller_loc`,`sp`.`selling_status` AS `selling_status`,`sp`.`whatsapp` AS `whatsapp`,`sp`.`user_id` AS `user_id`,`u`.`email` AS `email`,`u`.`fullname` AS `fullname`,`u`.`username` AS `username`,`u`.`user_profpic` AS `user_profpic`,`sp`.`campaign_id` AS `campaign_id`,`cl`.`campaign_title` AS `campaign_title` from ((`selling_posts` `sp` left join `user` `u` on(`sp`.`user_id` = `u`.`id`)) left join `campaign_list` `cl` on(`sp`.`campaign_id` = `cl`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campaign_list`
--
ALTER TABLE `campaign_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `logging`
--
ALTER TABLE `logging`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `selling_posts`
--
ALTER TABLE `selling_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campaign_list`
--
ALTER TABLE `campaign_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `logging`
--
ALTER TABLE `logging`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `selling_posts`
--
ALTER TABLE `selling_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

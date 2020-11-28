-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 25, 2020 at 08:36 PM
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
(1, 'uploads/5fa247880789d.JPG', 'pendidikan', 'Bantu Adik Misya untuk Sekolah', 'jfafh affhegfh', 'Adik Misya', 'Untuk membayar uang SPP, seragam, dan buku', '087584585249', 123),
(4, 'uploads/5facab192fa87.jpeg', 'Bantuan Pendidikan', 'Bantu Anak Keluarga Pak Dono untuk Bersekolah', 'Pak Dono yang merupakan tulang punggung keluarga tertimpa musibah saat sedang bekerja yang mengakibatkan kehilangan kakinya. Pak Dono yang kini sudah tidak bisa bekerja membuat anak-anaknya putus sekolah karena tidak ada biaya', 'anak keluarga Pak Dono', 'membeli seragam, buku, dan keperluan sekolah lainnya', '08225556443', 9),
(3, 'uploads/5fa253ff96644.jpg', 'sosial', 'berbagi makanan', 'donasi akan disalurkan ke pedagang jalanan', 'pedagang keliling di lingkungan bintara', 'paket makanan, minuman, buah', '087883520021', 1),
(5, 'uploads/5facabdb247d7.jpeg', 'Kegiatan Sosial', 'Berbagi Makanan', 'donasi akan dibagikan kepada para pemulung', 'para pemulung di lingkungan mustikajaya bekasi', 'membeli paket makanan, minuman, dan buah', '085542266842', 1),
(6, 'uploads/5facac8c08911.jpeg', 'Kegiatan Sosial', 'berbagi makanan', 'berbagi sembako kepada orang-orang kurang mampu yang tinggal di lingkungan TPST Bantargebang', 'Orang-orang kurang mampu yang tinggal di lingkungan TPST Bantargebang', 'pembelian sembako', '085273173192', 123),
(7, 'uploads/5facad87a4152.jpeg', 'Kegiatan Sosial', 'Berbagi sembako', 'Berbagi sembako kepada orang-orang yang kurang mampu yang tinggal di bantaran sungai Ciliwung', 'orang-orang yang kurang mampu yang tinggal di bantaran sungai Ciliwung', 'pembelian sembako', '082316464319', 9),
(8, 'uploads/5fb2bbdeb7b89.png', 'test1', 'test2', 'test3', 'test4', 'test5', '087883520021', 1),
(9, 'uploads/5fbd0c27858f3.JPG', 'pendidikan', 'Bantu Adik Misya untuk Sekolah', 'jfafh affhegfh', 'Adik Misya', 'Untuk membayar uang SPP, seragam, dan buku', '087584585249', 1);

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
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selling_posts`
--

INSERT INTO `selling_posts` (`id`, `path`, `product_price`, `product_name`, `product_condition`, `product_desc`, `seller_loc`, `selling_status`, `user_id`) VALUES
(1, 'uploads/5f9d11505c612.jpeg', '15000', 'nasi box', 'New', 'murah dan yummy!', 'bekasi', 'SOLD', 1),
(2, 'uploads/5f9d11e1339dd.JPG', '30000', 'No-bake cake', 'New', 'menggunakan bahan premium dan lezat', 'bekasi', 'SOLD', 1),
(3, 'uploads/5f9e859b26b00.jpeg', '30000', 'Tanaman Hijau', 'New', 'Tanaman dalam kondisi bagus', 'Bekasi', 'SALE', 1),
(4, 'uploads/5f9e85e576b8a.jpeg', '30000', 'Ayam Jago', 'New', 'Ayam sangat sehat dan gemuk', 'Bekasi, Jawa Barat', 'SALE', 1),
(5, 'uploads/5f9e8ac95197e.jpg', '20000', 'mouse', 'Second', 'mouse mantab ada lampu nya punya nya si bagus ', 'bekasi', 'SALE', 1),
(6, 'uploads/5f9e8adc04329.jpg', '20000', 'mouse', 'Second', 'mouse mantab ada lampu nya punya nya si bagus ', 'bekasi', 'SOLD', 1),
(7, 'uploads/5f9e9e0e3c5bc.jpg', '50000', 'Buah', 'New', 'Buah', 'Bekasi', 'SALE', 1),
(35, 'uploads/5fa26ee7ec2cf.jpeg', '15000', 'Micellar Water', 'Second', 'kondisi produk 90%', 'Bekasi, Jawa Barat', 'SALE', 1),
(38, 'uploads/5fb2bef50cf1d.png', '250000', 'hape', 'Second', 'test4', 'test ', 'SALE', 1),
(39, 'uploads/5fb2bf300968d.png', '250000', 'hape', 'Second', 'test4', 'test ', 'SALE', 1),
(29, 'uploads/5f9ec52e4b3c2.jpg', '696969', 'ban dalam ', 'New', 'ban dalam buatan zimbabwe', 'zimbabwe', 'SALE', 1),
(30, 'uploads/5f9ec5335f55c.jpg', '696969', 'ban dalam ', 'New', 'ban dalam buatan zimbabwe', 'zimbabwe', 'SOLD', 1),
(31, 'uploads/5fa11d35a429b.jpg', '110000', 'Helm ', 'New', 'Kondisi baru, size L', 'Jl. Raya Bintara 6 Bekasi barat', 'SALE', 1),
(33, 'uploads/5fa17b064394b.jpeg', '70000', 'Pampers MamyPoko', 'New', 'Masih baru', 'Bekasi', 'SALE', 1),
(34, 'uploads/5fa2312c50c98.jpeg', '15000', 'Garnier Micellar Water', 'Second', 'isi produk masih banyak, kondisi sekitar 80%', 'Kecamatan Mustika Jaya, Bekasi, Jawa Barat', 'SOLD', 1),
(36, 'uploads/5fae12b1e1a9f.jpeg', '30000', 'Bebek', 'New', 'kondisi bebek sehat 100%', 'Bekasi', 'SALE', 1),
(37, 'uploads/5fae9031510a2.jpeg', '20000', 'Dompet', 'Second', 'kondisi dompet masih 80%', 'Bekasi', 'SOLD', 1),
(40, 'uploads/5fbd0dff1d1ce.JPG', '20000', 'oreo cake', 'New', 'enakkkk masih baru', 'Jakarta', 'SALE', NULL),
(41, 'uploads/5fbe1e839097f.jpeg', '20000', 'Dompet', 'Second', 'kondisi masih 90%, bahan bagus', 'Jakarta Timur', 'SALE', NULL);

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
(9, 'mauraa@gmail.com', 'mora', 'mora123', '$2y$10$oU1/D/3NH/HlKaA1jMAyBOREQVh0IYAiXQPTIWDa/S0gcTZdboSPq', ''),
(123, 'mauraqoonitah@gmail.com', 'mora', 'mauraqoonitah', '$2y$10$3S2W2HKrWaTOQQ6JNv2SSOc7aQXtIp6dILMHdynl2u8fhJQrZvF6y', 'profpic'),
(124, 'coba@gmail.com', 'cobain', 'cobain', '$2y$10$ZOnXmtBTCyPiouNE3ivr5ONyHfShVkUUSWrpqKoAOapTM4ARwRlh.', ''),
(125, 'maaauraqoonitah@gmail.com', 'maura qipi', 'mauraptr', '$2y$10$W9H5djaWFVJQRjmQj3HkGuVesvD4ikwHTvdAp0Uc1uPFFJqhmSCOO', ''),
(126, 'mauaaaraqoonitah15@gmail.com', 'test', 'testtttt', '$2y$10$AAQ.RXiZsBXGK1PUleSvj.X/mdX/M8xv8x80CeIBM1GgynuF5Xo5a', ''),
(127, 'tesssst@gmail.com', 'lagi test', 'lagitest', '$2y$10$1xsKJFBhwDFfzfxBVTGYlO5jywofq45yBh/IRjkTLClx6cvP8Ilca', ''),
(128, 'mauraqaaoonitah@gmail.com', 'maoaokaka', 'maura123', '$2y$10$7RnZlTEkK3AGu.OBrHjS4O3h.8vuxsc98U0M8BuAGFl7UKdGbmOG2', ''),
(129, 'octarinasalsabila@gmail.com', 'Octarina Salsa', 'octarina00', '$2y$10$9z3ONmVVHluAaj4xynwG..b4MM02urEud/nzPejbukIhtbV9pw54e', ''),
(130, 'mauraqooniaatah@gmail.com', 'nsksskso', 'testt123', '$2y$10$UuSulMFDBQjhkZaCYEvU/ufeOIvDhjcxGUsRJubuSeyouK7x4FnC.', ''),
(137, 'aakkadmmauraqoonitah@gmail.com', 'mora', 'llmauraqada', '$2y$10$u2A15YoEzeLpQ1ZYYRr6ouqAzYmPmFs9RKg8wim4YTndxGcX5JQJa', ''),
(132, 'taest@gmail.com', 'akakkala', 'akalalala', '$2y$10$IDSPqoyGUqDRb0ac3eC1J.1umkPme50aZZPwgI.g34WFcWkRln346', ''),
(133, 'ammauraqoonitah@gmail.com', 'mora', 'mauraq', '$2y$10$KFejgLEtUdGR2AE9G5IVxOeM6.tCl1z2Aala/L/BqIDRnSGzjg4mW', ''),
(134, 'aammauraqoonitah@gmail.com', 'mora', 'mauraqa', '$2y$10$YuU/Pd6/awOGXxY8.iSBc.fOrXSNCqpcfajg6icPEC9JJuioWaeGa', 'https://jakartaqurban.com/'),
(135, 'aadmmauraqoonitah@gmail.com', 'mora', 'mauraqad', '$2y$10$HxlqT.95aOgTEuOfvVBg5eAY91CpRYsxA3NbzrQXQBWsLpv7RdKa6', 'https://jakartaqurban.com/https://jakartaqurban.com/'),
(136, 'aaadmmauraqoonitah@gmail.com', 'mora', 'mauraqada', '$2y$10$UE5dhM3UnSE4E4CjettJRO9R69V.5LBX0qloX.lWtfuvEQozodBp6', 'https://jakartaqurban.com/https://jakartaqurban.com/https://jakartaqurban.com/'),
(138, 'aaakkadmmauraqoonitah@gmail.com', 'mora', 'llamauraqada', '$2y$10$Hpdgz3.jlo2dVgOIRyNy5uOW.BWzFcfeoMOmAdBDccpUEfnQYg3BS', ''),
(139, 'aaaskkadmmauraqoonitah@gmail.com', 'mora', 'llasmauraqadaa', '$2y$10$jRabjQbeM09.n7pC4CzZwOvDeITgrZidYU222HYNbOdG8voi82sCC', 'kokokok'),
(140, 'aaaskkaddmmauraqoonitah@gmail.com', 'mora', 'ddddddddddddddddddddd', '$2y$10$/ByEC1ZZDcSuVkVHakftvejLbJ6WQZS.zssJ.Rr9RdiqX1BBmMob6', ''),
(141, 'majdjddjuraqoonitah15@gmail.com', 'jzjzjsksiaia', 'cobaaaa', '$2y$10$0yPX0jTb..c3HFzmkYYKGuCyLVfyYXSBLgL.9FGg6oN5ew.Zst2Au', ''),
(142, 'mwhwhauraqoonitah15@gmail.com', 'jajaajajajn', 'apanyaa', '$2y$10$RNbRjnK3B9S5i.Jwr/Qv2e0z8a73SlkPSBQB70yqGoYZtlClxdw.K', ''),
(143, 'aaaaaaaaaaaaaaaaaaa@gmail.com', 'mora', 'ddaaaaa', '$2y$10$S10vJZNH0clxc/lAFEl3guOXXRwZKfSFY1alrwH.kaqe6Jp25Onm2', ''),
(144, 'octarina@gmail.com', 'octarina', 'octarsalsa', '$2y$10$YPIrYe.AF3GQZVE5ixuY.ePR.S5bdDE3XA8j0jkINw0be4FcOYwrO', 'upload/profpic_default.png'),
(145, 'privatiahaan19unj@gmail.com', 'cobaaaa', 'bisadong', '$2y$10$.24VfWvX5bQZoNIgv/vBXuHwRVlBMGtLJkW8Bz089KLfmopzEP01W', 'profpic/profpic_default.png'),
(146, 'testtt@gmail.com', 'testnih', 'bisakek', '$2y$10$ifp6Z5ew027E2k8Sh9jf..1L/rFeWVHaA7QA7ziL9jGU0BG0A7wu6', 'profpic/profpic_default');

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
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `VIEW_SELLINGPRODUCT`
-- (See below for the actual view)
--
CREATE TABLE `VIEW_SELLINGPRODUCT` (
`id_product` int(11)
,`path_product` varchar(256)
,`product_price` varchar(128)
,`product_name` varchar(256)
,`product_condition` varchar(10)
,`product_desc` varchar(512)
,`seller_loc` varchar(256)
,`selling_status` varchar(10)
,`user_id` int(11)
,`username` varchar(128)
,`fullname` varchar(128)
,`email` varchar(128)
);

-- --------------------------------------------------------

--
-- Structure for view `VIEW_CAMPAIGNLIST`
--
DROP TABLE IF EXISTS `VIEW_CAMPAIGNLIST`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jakart44`@`localhost` SQL SECURITY DEFINER VIEW `VIEW_CAMPAIGNLIST`  AS  select `cl`.`id` AS `id`,`cl`.`path` AS `path`,`cl`.`campaign_category` AS `campaign_category`,`cl`.`campaign_title` AS `campaign_title`,`cl`.`campaign_desc` AS `campaign_desc`,`cl`.`campaign_receiver` AS `campaign_receiver`,`cl`.`usage_details` AS `usage_details`,`cl`.`phone_campaign` AS `phone_campaign`,`cl`.`user_id` AS `user_id`,`u`.`username` AS `username`,`u`.`fullname` AS `fullname`,`u`.`email` AS `email` from (`campaign_list` `cl` left join `user` `u` on(`cl`.`user_id` = `u`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `VIEW_SELLINGPRODUCT`
--
DROP TABLE IF EXISTS `VIEW_SELLINGPRODUCT`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jakart44`@`localhost` SQL SECURITY DEFINER VIEW `VIEW_SELLINGPRODUCT`  AS  select `sp`.`id` AS `id_product`,`sp`.`path` AS `path_product`,`sp`.`product_price` AS `product_price`,`sp`.`product_name` AS `product_name`,`sp`.`product_condition` AS `product_condition`,`sp`.`product_desc` AS `product_desc`,`sp`.`seller_loc` AS `seller_loc`,`sp`.`selling_status` AS `selling_status`,`sp`.`user_id` AS `user_id`,`u`.`username` AS `username`,`u`.`fullname` AS `fullname`,`u`.`email` AS `email` from (`selling_posts` `sp` left join `user` `u` on(`sp`.`user_id` = `u`.`id`)) ;

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
-- Indexes for table `selling_posts`
--
ALTER TABLE `selling_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `selling_posts`
--
ALTER TABLE `selling_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

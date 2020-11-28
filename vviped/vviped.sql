-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2020 at 09:07 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vviped`
--

-- --------------------------------------------------------

--
-- Table structure for table `selling_posts`
--

CREATE TABLE `selling_posts` (
  `id` int(11) NOT NULL,
  `path` varchar(252) NOT NULL,
  `product_price` varchar(128) NOT NULL,
  `product_name` varchar(256) NOT NULL,
  `product_desc` varchar(512) NOT NULL,
  `seller_loc` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selling_posts`
--

INSERT INTO `selling_posts` (`id`, `path`, `product_price`, `product_name`, `product_desc`, `seller_loc`) VALUES
(1, 'uploads/5f950d7000ccd.jpg', '0', '', '', ''),
(2, 'uploads/5f950f72978ed.jpg', '70000', 'vsrfgrwe', 'wfcwcf', 'wfwfcw'),
(3, 'uploads/5f95137e4de5b.jpeg', '15000', 'nasi box', 'murah dan yummy!', 'bekasi'),
(4, 'uploads/5f951529c26b7.jpeg', '4000', 'tanaman', 'tanaman sehat', ''),
(5, 'uploads/5f95189b44f84.jpeg', '15000', 'Micellar Water Garnier', 'Isi masih banyak', 'Bekasi'),
(6, 'uploads/5f9519c207d12.jpeg', '30000', 'ayam', 'ayam sehat', 'bekasi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `selling_posts`
--
ALTER TABLE `selling_posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `selling_posts`
--
ALTER TABLE `selling_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

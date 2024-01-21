-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2024 at 02:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `checked`
--

CREATE TABLE `checked` (
  `id` int(30) NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `room_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `date_in` datetime NOT NULL,
  `date_out` datetime NOT NULL,
  `booked_cid` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1=checked in , 2 = checked out',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checked`
--

INSERT INTO `checked` (`id`, `ref_no`, `room_id`, `name`, `contact_no`, `date_in`, `date_out`, `booked_cid`, `status`, `date_updated`) VALUES
(21, '7797314537\n', 15, 'Alung', '081299345456', '2023-11-20 10:36:00', '2023-11-23 10:36:00', 4, 1, '2023-12-24 19:43:22'),
(23, '521080246\n', 12, 'Jhonson', '081254342345', '2023-11-20 10:40:00', '2023-11-21 10:40:00', 0, 2, '2023-11-20 16:41:46'),
(24, '9292044348\n', 10, 'Satria', '081254342345', '2023-11-20 10:41:00', '2023-11-21 10:41:00', 0, 1, '2023-11-20 16:41:25'),
(25, '4429581924\n', 14, 'Jen', '081299345456', '2023-12-24 03:41:00', '2023-12-27 03:41:00', 0, 1, '2023-12-24 09:41:51'),
(26, '3564047619\n', 8, 'Joe', '081477654876', '2023-12-30 10:58:00', '2024-01-02 10:58:00', 3, 1, '2024-01-14 15:19:04'),
(27, '364206893\n', 9, 'Munir', '081477654876', '2024-01-14 15:26:00', '2024-01-17 15:26:00', 3, 2, '2024-01-15 14:58:04'),
(28, '930383565\n', 9, 'Daus', '081299345456', '2024-01-16 08:15:00', '2024-01-18 08:15:00', 0, 2, '2024-01-15 14:16:55'),
(29, '6039361945\n', 18, 'Bob', '085155876434', '2024-01-20 10:18:00', '2024-01-23 10:18:00', 2, 1, '2024-01-20 16:29:31');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `iduser` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`iduser`, `email`, `password`) VALUES
(1, 'abc@gmail.com', 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(30) NOT NULL,
  `room` varchar(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Available , 1= Unvailables'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room`, `category_id`, `status`) VALUES
(8, 'Room-21', 3, 1),
(9, 'Room-22', 3, 0),
(10, 'Room-23', 3, 1),
(11, 'Room-31', 6, 0),
(12, 'Room-32', 6, 0),
(13, 'Room-33', 6, 0),
(14, 'Room-41', 4, 1),
(15, 'Room-42', 4, 1),
(16, 'Room-43', 4, 0),
(17, 'Room-51', 2, 0),
(18, 'Room-52', 2, 1),
(19, 'Room-53', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `room_categories`
--

CREATE TABLE `room_categories` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `price` float NOT NULL,
  `cover_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_categories`
--

INSERT INTO `room_categories` (`id`, `name`, `price`, `cover_img`) VALUES
(2, 'Deluxe Room', 5000000, '1600480260_4.jpg'),
(3, 'Single Room', 1200000, '1600480680_2.jpg'),
(4, 'Family Room', 3500000, '1600480680_room-1.jpg'),
(6, 'Twin Bed Room', 2000000, '1600482780_3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `hotel_name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `hotel_name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Hotel Mulia Bersih Jaya ', 'muliaber@sample.com', '021 8542 623', '1700489940_hotel_cover.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative; font-size: 16px; color: rgb(0, 0, 0);&quot;&gt;&lt;/p&gt;&lt;span style=&quot;font-size:16px;text-align: center; margin-bottom: 15px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; color: rgb(0, 0, 0);&quot;&gt;&lt;p class=&quot;MsoNormal&quot;&gt;Tentang Hotel Mulia Bersih&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;Selamat datang di Hotel Mulia Bersih, tempat di manakenyamanan dan kebersihan menyatu untuk menciptakan pengalaman menginap yangtak terlupakan. Sebagai destinasi pilihan untuk para wisatawan dan pelancongbisnis, Hotel Mulia Bersih berkomitmen untuk memberikan layanan terbaik denganstandar kebersihan yang tinggi.&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;Visi Kami&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;Visi Hotel Mulia Bersih adalah menjadi pilihan utama bagimereka yang menghargai kesejukan, ketertiban, dan kenyamanan. Kami bertekaduntuk menciptakan lingkungan yang bersih, aman, dan ramah, sehingga setiap tamumerasa seperti di rumah sendiri.&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;Fasilitas Terbaik&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;Hotel Mulia Bersih menawarkan berbagai fasilitas terbaikyang dirancang untuk memenuhi kebutuhan dan keinginan tamu. Dari kamar yangnyaman dan luas hingga restoran yang menyajikan hidangan lezat, setiap aspekperjalanan Anda menjadi prioritas utama bagi kami.&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;Kebersihan yang Diutamakan&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;Kami mengerti betapa pentingnya kebersihan dalam membuattamu merasa aman dan nyaman. Oleh karena itu, Hotel Mulia Bersih menjalankanprotokol kebersihan yang ketat untuk memastikan setiap sudut hotel tetap bersihdan steril. Tim pembersih kami berdedikasi untuk menjaga kebersihan setiapkamar, area umum, dan fasilitas lainnya, sehingga tamu dapat menikmatilingkungan yang sehat dan bersih.&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;Pelayanan Ramah dan Profesional&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;Ketenangan dan keramahan adalah nilai inti dari layanankami. Staf Hotel Mulia Bersih terlatih dengan baik, ramah, dan siap membantuuntuk memastikan setiap kebutuhan tamu terpenuhi. Dari saat kedatangan hinggakepergian, layanan profesional kami akan membuat Anda merasa istimewa.&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;Lokasi Strategis&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;Hotel Mulia Bersih terletak di lokasi strategis, memudahkanakses ke pusat bisnis, tempat wisata, dan area perbelanjaan. Dengan lokasi yangnyaman, tamu dapat dengan mudah menjelajahi dan menikmati berbagai keindahankota ini.&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;Bergabunglah dengan Kami&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;p style=&quot;background: transparent; position: relative; font-size: 16px; color: rgb(0, 0, 0);&quot;&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;Kami mengundang Anda untuk bergabung dan merasakankeistimewaan menginap di Hotel Mulia Bersih. Nikmati kenyamanan, kebersihan,dan pelayanan terbaik yang kami tawarkan. Jadikan perjalanan Anda takterlupakan dengan menginap di tempat kami, di mana kebersihan dan kenyamananadalah prioritas utama.&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;/span&gt;&lt;p style=&quot;text-align: center; margin-bottom: 15px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; color: rgb(0, 0, 0); font-size: 16px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; margin-bottom: 15px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 16px; color: rgb(0, 0, 0);&quot;&gt;&lt;/p&gt;&lt;p style=&quot;font-weight: 400; text-align: center; margin-bottom: 15px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 16px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; margin-bottom: 15px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; font-size: 14px;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', 'admin123', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checked`
--
ALTER TABLE `checked`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`iduser`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_categories`
--
ALTER TABLE `room_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checked`
--
ALTER TABLE `checked`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `room_categories`
--
ALTER TABLE `room_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

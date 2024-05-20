-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2024 at 08:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buisnessdirectory`
--

-- --------------------------------------------------------

--
-- Table structure for table `businesses`
--

CREATE TABLE `businesses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `businesses`
--

INSERT INTO `businesses` (`id`, `name`, `address`, `phone`, `website`, `email`, `contact`) VALUES
(1, 'SAP Show Partner', '1/941 ,Shri Venkateshwara Housing Colony, OOPP AshokLeyland Unit 2 Kumudepalli Hosur -635109', '+91 8667502290', 'www.kamionscs.com', 'info@kamionscs.com', 'NAGASUBRAMANIAN N (Product Marketing)'),
(2, 'Babji Lamitraonics Mfrs. Electrical Transformer Limination', '#119A, Bommasandra Industrial Area , Hebbagodi, Banglore -560 099', '+91 9663133995', 'www.babjilamitronics.com', 'babji.l@gmail.com', 'Jamuna'),
(3, 'Proventus Life sciences Pvt . Ltd', 'c-9, Industrial Area II (CMDA) MAraimalai Nagar-603 209 Chengalpattu district, Tamil Nadu -India', '+91 7200291836 , +91', 'www.proventuslife.com', 'purchase@proventuslife.com', 'R. Karthik Manager-Purchase'),
(4, 'LifeWell Hydraulics PVT.LTD', 'Gondal Road Highway, Near Old Toll NAka, Beside Rudra Quater,Rajkot-360022 (Gujarat) India', '+91 9099085901', 'www.lifewellhydrauilics.com', 'info@lifewellhydrauilics.com', 'Ashish Bhatt'),
(5, 'Alkraft Thermotechnologies Private Ltd', '35-A & B/1 , ambattur Industrial Estate, Chennai- 600058 India', '+91 4426258770, +91 ', 'www.alkraft.com', 'kannan@alkraft.com', 'T.Kannan Sr. Executive -Marketing'),
(6, 'MOTORINDIA', 'No. 38. Thomas Road.2nd Street, T.Nagar, Chennai - 600 017.INDIA', '044-24330979/4202495', 'www.motorindiaonline.in', 'motorindiamagazine@gmail.com', 'R. NATARAJAN Managing Editor & Publisher'),
(7, 'OBSS', 'No.22/1, Venkitaps 641-062, Tamil Nadu.', '+91 93646 36227', 'www.obss.in', 'aktharhussain@obss.in', 'Akthar Hussain Regional Manager - Sales'),
(8, 'KYOKUTO', '#127, Sompura Industrial Area, Dabaspet 3rd Phase, Nidavanda Village, lamangala, Bangalore-562 132.', '+91 73383 34567', 'www.SATRAC.com', 'anand@satrac.com', 'R ANAND Manager-Sales & Marketing-Tamilnadu'),
(9, 'CAULDRON', 'E-227, RIICO Industrial Area Bagru(Extn.), Jaipur 303007 INDIA', '+91-78772 12664', 'www.oleumlubricants.com', 'cpetrotech@gmail.com', 'YOGESH AGARWAL'),
(10, 'NAM LORRY TODAY', 'AIMTC AUTHORISED FIRST TAMIL TRANSPORT MAGAZINE #78 / 208 - C, Ram Plaza, S.P.Pudur, Paramathi Road, Namakkal - 637001.', '95666-99799', '-', 'indianroadwaysnkl@gmail.com', 'K. Jayakumar Editor, Publisher & Founder'),
(11, 'Buisness New', '2/294b 3e ezhil nagar', '987766553', 'www.go.com', 'divya@gmail.com', 'Divya'),
(12, 'New buisness 2', 'Chennai 20233', '973739389', 'wwww.gnhidij.com', 'divya@gmail.com', 'Dhivya'),
(13, 'New buisness 3', 'buisness939', '98833212', 'www.bsdkj.com', 'gask@gmail.com', 'eeee'),
(14, 'new buisnes ede', 'deeded', '0983333311', 'swded@ksjks', 'divya@gmail.com', 'ssssssssssssss');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `rating` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 'Dhivya', 'dhivya.sv@zohocpr.com', 'hai I am fine', '2024-05-01 11:02:25'),
(2, 'a', 'dhivya.sv@gmail.com', 'a', '2024-05-01 12:15:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'Dhivya', '$2y$10$9mABrKyP4Kvz4BhwHI1d9eOpDjlUZA676Pv/n9k6rgYPQ.mvj6SjC'),
(2, 'shri', '$2y$10$.k32rSkRxnSYf4F68boPsOv2xydxCUKDY6RY/hZ.hQR9/bK8fb81O'),
(3, 'Saravanan', '$2y$10$l95G.Dph9Ih4/n4XpZVeruFlY41WpEKgU1JcST/3dsfeAJAuSLDqe'),
(5, 'a', '$2y$10$y8VGTl/cJTfe42Fe9Yw68OvMsUQKzqCLyghDfEcoWoMPSSKWz/2fS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `businesses`
--
ALTER TABLE `businesses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `businesses`
--
ALTER TABLE `businesses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

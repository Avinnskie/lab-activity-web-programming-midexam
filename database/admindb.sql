-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2026 at 05:34 PM
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
-- Database: `dbnilai`
--

-- --------------------------------------------------------

--
-- Table structure for table `gambar`
--

CREATE TABLE `gambar` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `tgl_unggah` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gambar`
--

INSERT INTO `gambar` (`id`, `nama_file`, `tgl_unggah`) VALUES
(1, 'Screenshot 2026-08-15 at 16.26.11 1.png', '2026-10-20 14:00:09'),
(2, 'blue-toned pattern.jpg', '2026-10-20 14:00:28'),
(3, 'logo lansara.png', '2026-10-20 14:02:30'),
(5, 'Doodles wallpaper.jpg', '2026-10-20 14:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `nim` varchar(20) NOT NULL,
  `nm_lengkap` varchar(100) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `nilai_akhir` decimal(5,2) NOT NULL,
  `nilai_huruf` char(1) DEFAULT NULL,
  `predikat` varchar(50) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`nim`, `nm_lengkap`, `foto`, `nilai_akhir`, `nilai_huruf`, `predikat`, `created_date`, `modified_date`) VALUES
('312312312', '21312321', '6cbe1124771cbd1933404a2bd8c4ec41.png', 56.00, 'C', NULL, '2026-10-26 10:00:51', '2026-10-26 10:00:51'),
('3202310001', 'Ferry Faisal', NULL, 45.65, NULL, NULL, '2026-10-13 07:58:01', '2026-10-13 07:58:01'),
('3202310002', 'Ferry', NULL, 78.50, NULL, NULL, '2026-10-13 07:58:01', '2026-10-13 07:58:01'),
('3202310003', 'Habib', NULL, 60.75, NULL, NULL, '2026-10-13 07:58:01', '2026-10-13 07:58:01'),
('3202310004', 'Irka', NULL, 87.50, 'A', 'Sangat Memuaskan', '2026-10-13 07:58:01', '2026-10-13 07:58:01'),
('3202310005', 'Aqi', NULL, 77.75, 'B', 'Memuaskan', '2026-10-13 07:58:01', '2026-10-13 07:58:01'),
('3202416064', 'Abyan', NULL, 89.96, 'A', 'Sangat Memuaskan', '2026-10-15 07:04:17', '2026-10-15 07:04:17'),
('3202416067', 'Dimasss Pierce', '07688e9c5b9b374e5e0fe1fa56dfb000.jpg', 99.00, 'A', 'Sangat Memuaskan', '2026-10-13 08:03:20', '2026-10-26 10:01:26');

-- --------------------------------------------------------

--
-- Table structure for table `nilaimhsw`
--

CREATE TABLE `nilaimhsw` (
  `nim` varchar(20) NOT NULL,
  `nm_lengkap` varchar(100) NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `nilai_akhir` decimal(5,2) NOT NULL,
  `nilai_huruf` char(1) DEFAULT NULL,
  `predikat` varchar(50) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nilaimhsw`
--

INSERT INTO `nilaimhsw` (`nim`, `nm_lengkap`, `file_path`, `nilai_akhir`, `nilai_huruf`, `predikat`, `created_date`, `modified_date`) VALUES
('312312312', '21312321', 'img/mahasiswa/6cbe1124771cbd1933404a2bd8c4ec41.png', 56.00, 'C', NULL, '2026-10-26 10:00:51', '2026-10-26 10:00:51'),
('3202310001', 'Ferry Faisal', NULL, 45.65, NULL, NULL, '2026-10-13 07:58:01', '2026-10-13 07:58:01'),
('3202310002', 'Ferry', NULL, 78.50, NULL, NULL, '2026-10-13 07:58:01', '2026-10-13 07:58:01'),
('3202310003', 'Habib', NULL, 60.75, NULL, NULL, '2026-10-13 07:58:01', '2026-10-13 07:58:01'),
('3202310004', 'Irka', NULL, 87.50, 'A', 'Sangat Memuaskan', '2026-10-13 07:58:01', '2026-10-13 07:58:01'),
('3202310005', 'Aqi', NULL, 77.75, 'B', 'Memuaskan', '2026-10-13 07:58:01', '2026-10-13 07:58:01'),
('3202416064', 'Abyan', NULL, 89.96, 'A', 'Sangat Memuaskan', '2026-10-15 07:04:17', '2026-10-15 07:04:17'),
('3202416067', 'Dimasss Pierce', 'img/mahasiswa/07688e9c5b9b374e5e0fe1fa56dfb000.jpg', 99.00, 'A', 'Sangat Memuaskan', '2026-10-13 08:03:20', '2026-10-26 10:01:26'),
('UTS2026001', 'Andi Pratama', 'assets/demo/avatar-01.svg', 87.50, 'A', 'Sangat Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026002', 'Siti Nurhaliza', 'assets/demo/avatar-02.svg', 72.50, 'B', 'Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026003', 'Rizky Hidayat', 'assets/demo/avatar-03.svg', 57.50, 'C', 'Cukup', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026004', 'Dewi Lestari', 'assets/demo/avatar-04.svg', 37.50, 'E', 'Tidak Lulus', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026005', 'Fajar Ramadhan', 'assets/demo/avatar-05.svg', 88.50, 'A', 'Sangat Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026006', 'Nadia Putri', 'assets/demo/avatar-06.svg', 73.50, 'B', 'Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026007', 'Budi Santoso', 'assets/demo/avatar-01.svg', 58.50, 'C', 'Cukup', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026008', 'Rina Wulandari', 'assets/demo/avatar-02.svg', 38.50, 'E', 'Tidak Lulus', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026009', 'Agus Setiawan', 'assets/demo/avatar-03.svg', 89.50, 'A', 'Sangat Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026010', 'Intan Permata', 'assets/demo/avatar-04.svg', 74.50, 'B', 'Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026011', 'Dimas Saputra', 'assets/demo/avatar-05.svg', 59.50, 'C', 'Cukup', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026012', 'Fitri Handayani', 'assets/demo/avatar-06.svg', 39.50, 'E', 'Tidak Lulus', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026013', 'Arif Rahman', 'assets/demo/avatar-01.svg', 90.50, 'A', 'Sangat Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026014', 'Maya Sari', 'assets/demo/avatar-02.svg', 75.50, 'B', 'Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026015', 'Bayu Nugroho', 'assets/demo/avatar-03.svg', 60.50, 'C', 'Cukup', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026016', 'Putri Maharani', 'assets/demo/avatar-04.svg', 40.50, 'E', 'Tidak Lulus', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026017', 'Eko Susanto', 'assets/demo/avatar-05.svg', 91.50, 'A', 'Sangat Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026018', 'Lina Marlina', 'assets/demo/avatar-06.svg', 76.50, 'B', 'Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026019', 'Reza Maulana', 'assets/demo/avatar-01.svg', 61.50, 'C', 'Cukup', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026020', 'Ayu Kartika', 'assets/demo/avatar-02.svg', 41.50, 'E', 'Tidak Lulus', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026021', 'Hendra Wijaya', 'assets/demo/avatar-03.svg', 92.50, 'A', 'Sangat Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026022', 'Nisa Aulia', 'assets/demo/avatar-04.svg', 77.50, 'B', 'Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026023', 'Wahyu Firmansyah', 'assets/demo/avatar-05.svg', 62.50, 'C', 'Cukup', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026024', 'Dian Puspita', 'assets/demo/avatar-06.svg', 42.50, 'E', 'Tidak Lulus', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026025', 'Ilham Akbar', 'assets/demo/avatar-01.svg', 93.50, 'A', 'Sangat Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026026', 'Sarah Amelia', 'assets/demo/avatar-02.svg', 78.50, 'B', 'Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026027', 'Yoga Saputra', 'assets/demo/avatar-03.svg', 63.50, 'C', 'Cukup', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026028', 'Tiara Safitri', 'assets/demo/avatar-04.svg', 43.50, 'E', 'Tidak Lulus', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026029', 'Rudi Hartono', 'assets/demo/avatar-05.svg', 94.50, 'A', 'Sangat Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026030', 'Anisa Rahma', 'assets/demo/avatar-06.svg', 79.50, 'B', 'Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026031', 'Farhan Hakim', 'assets/demo/avatar-01.svg', 64.50, 'C', 'Cukup', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026032', 'Citra Anggraini', 'assets/demo/avatar-02.svg', 44.50, 'E', 'Tidak Lulus', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026033', 'Aldi Kurniawan', 'assets/demo/avatar-03.svg', 95.50, 'A', 'Sangat Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026034', 'Vina Oktaviani', 'assets/demo/avatar-04.svg', 80.50, 'B', 'Memuaskan', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026035', 'Doni Irawan', 'assets/demo/avatar-05.svg', 65.50, 'C', 'Cukup', '2026-10-26 16:10:48', '2026-10-26 16:10:48'),
('UTS2026036', 'Yulia Salsabila', 'assets/demo/avatar-06.svg', 45.50, 'E', 'Tidak Lulus', '2026-10-26 16:10:48', '2026-10-26 16:10:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gambar`
--
ALTER TABLE `gambar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gambar_nama_file_unique` (`nama_file`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `nilai_nama_index` (`nm_lengkap`),
  ADD KEY `nilai_predikat_index` (`predikat`);

--
-- Indexes for table `nilaimhsw`
--
ALTER TABLE `nilaimhsw`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `nilaimhsw_nama_index` (`nm_lengkap`),
  ADD KEY `nilaimhsw_predikat_index` (`predikat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gambar`
--
ALTER TABLE `gambar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

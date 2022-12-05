-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 05, 2022 at 08:22 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbPekerjaDesa`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbcikareoselatan`
--

CREATE TABLE `tbcikareoselatan` (
  `idPekerjaan` int(11) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `jumlahPekerjaan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbcikareoselatan`
--

INSERT INTO `tbcikareoselatan` (`idPekerjaan`, `pekerjaan`, `jumlahPekerjaan`) VALUES
(1, 'pertanian tanaman padi & palawija', 316),
(2, 'listrik & gas', 1),
(3, 'bangunan konstruksi', 53),
(4, 'perdagangan', 113),
(5, 'hotel & rumah makan', 1),
(6, 'transportasi & pergudangan', 7),
(7, 'informasi & komunikasi', 1),
(8, 'keuangan & asuransi', 2),
(9, 'jasa pendidikan', 34),
(10, 'jasa kesehatan', 5),
(11, 'jasa Kemasyarakatan, pemerintahan, perorangan', 11),
(12, 'kortikultura', 1),
(13, 'dan lainnya', 443),
(14, 'perikanan tangkap', 1),
(15, 'peternakan', 3),
(16, 'kehutanan & pertanian lainnya', 2),
(17, 'pertambangan', 1),
(18, 'industri pengolahan', 21);

-- --------------------------------------------------------

--
-- Table structure for table `tbcikareoutara`
--

CREATE TABLE `tbcikareoutara` (
  `idPekerjaan` int(11) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `jumlahPekerja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbcikareoutara`
--

INSERT INTO `tbcikareoutara` (`idPekerjaan`, `pekerjaan`, `jumlahPekerja`) VALUES
(1, 'pertanian tanaman padi & palawija', 127),
(2, 'listrik & gas', 4),
(3, 'bangunan konstruksi', 21),
(4, 'perdagangan', 189),
(5, 'hotel & rumah makan', 3),
(6, 'transportasi & pergudangan', 34),
(7, 'Informasi & Komunikasi', 1),
(8, 'Keuangan & Asuransii', 2),
(9, 'jasa pendidikan', 35),
(10, 'jasa kesehatan', 10),
(11, 'jasa Kemasyarakatan, pemerintahan, perorangan', 42),
(12, 'pemulung', 4),
(13, 'dan lainnya', 579),
(14, 'Perikanan Tangkap', 2),
(15, 'Peternakan', 1),
(16, 'Kehutanan & Pertanian lainnya', 11),
(17, 'Pertambanganya', 1),
(18, 'Industri Pengolahan', 41);

-- --------------------------------------------------------

--
-- Table structure for table `tbcilengkrang`
--

CREATE TABLE `tbcilengkrang` (
  `idPekerjaan` int(11) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `jumlahPekerja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbcilengkrang`
--

INSERT INTO `tbcilengkrang` (`idPekerjaan`, `pekerjaan`, `jumlahPekerja`) VALUES
(1, 'pertanian tanaman padi & palawija', 315),
(2, 'Bangunan Konstruksi', 17),
(3, 'Perdagangan', 182),
(4, 'Hotel & Rumah Makan', 1),
(5, 'Transportasi & Pergudangan', 13),
(6, 'Jasa Pendidikan', 41),
(7, 'Jasa Kesehatan', 7),
(8, 'Jasa Kemasyarakatan, pemerintahan, perorangan', 12),
(9, 'Pemulung', 1),
(10, 'Dan lainnya', 818),
(11, 'Perkebunan', 53),
(12, 'Peternakan', 5),
(13, 'Kehutanan & Pertanian lainnya', 8),
(14, 'Industri Pengolahan', 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbcimungkal`
--

CREATE TABLE `tbcimungkal` (
  `idPekerjaan` int(11) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `jumlahPekerja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbcimungkal`
--

INSERT INTO `tbcimungkal` (`idPekerjaan`, `pekerjaan`, `jumlahPekerja`) VALUES
(1, 'pertanian tanaman padi & palawija', 91),
(2, 'listrik & gas', 2),
(3, 'bangunan konstruksi', 23),
(4, 'perdagangan', 67),
(5, 'hotel & rumah makan', 3),
(6, 'transportasi & pergudangan', 5),
(7, 'jasa pendidikan', 12),
(8, 'jasa kesehatan', 1),
(9, 'jasa Kemasyarakatan, pemerintahan, perorangan', 10),
(10, 'kortikultura', 1),
(11, 'dan lainnya', 80),
(12, 'perkebunan', 35),
(13, 'kehutanan & pertanian lainnya', 6),
(14, 'pertambangan', 2),
(15, 'industri pengolahan', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbcisurat`
--

CREATE TABLE `tbcisurat` (
  `idPekerjaan` int(11) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `jumlahPekerja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbcisurat`
--

INSERT INTO `tbcisurat` (`idPekerjaan`, `pekerjaan`, `jumlahPekerja`) VALUES
(1, 'pertanian tanaman padi & palawija', 471),
(2, 'Bangunan Konstruksi', 14),
(3, 'Perdagangan', 54),
(4, 'Hotel & Rumah Makan', 4),
(5, 'Transportasi & Pergudangan', 21),
(6, 'Informasi & Komunikasi', 3),
(7, 'Keuangan & Asuransi', 2),
(8, 'Jasa Pendidikan', 35),
(9, 'Jasa Kemasyarakatan, pemerintahan, perorangan', 41),
(10, 'Dan lainnya', 69),
(11, 'Perkebunan', 3),
(12, 'Peternakan', 2),
(13, 'Kehutanan & Pertanian lainnya', 9),
(14, 'Pertambangan', 1),
(15, 'Industri Pengolahan', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbganjaresik`
--

CREATE TABLE `tbganjaresik` (
  `idPekerjaan` int(11) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `jumlahPekerja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbganjaresik`
--

INSERT INTO `tbganjaresik` (`idPekerjaan`, `pekerjaan`, `jumlahPekerja`) VALUES
(1, 'pertanian tanaman padi & palawija', 245),
(2, 'bangunan konstruksi', 77),
(3, 'Perdagangan', 60),
(4, 'Hotel & Rumah Makan', 1),
(5, 'Transportasi & Pergudangan', 4),
(6, 'Jasa Pendidikan', 13),
(7, 'Jasa Kesehatan', 3),
(8, 'Jasa Kesehatan', 17),
(9, 'dan lainnya', 405),
(10, 'Perkebunan', 1),
(11, 'Perkebunan', 1),
(12, 'Perkebunan', 4),
(13, 'Industri Pengolahan', 11);

-- --------------------------------------------------------

--
-- Table structure for table `tbmulyajaya`
--

CREATE TABLE `tbmulyajaya` (
  `idPekerjaan` int(11) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `jumlahPekerja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbmulyajaya`
--

INSERT INTO `tbmulyajaya` (`idPekerjaan`, `pekerjaan`, `jumlahPekerja`) VALUES
(1, 'pertanian tanaman padi & palawija', 1),
(2, 'Jasa Kemasyarakatan, pemerintahan, perorangan', 1),
(3, 'Dan lainnya', 2),
(4, 'Perkebunan', 3),
(5, 'Industri Pengolahan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbsukajadi`
--

CREATE TABLE `tbsukajadi` (
  `idPekerjaan` int(11) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `jumlahPekerja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbsukajadi`
--

INSERT INTO `tbsukajadi` (`idPekerjaan`, `pekerjaan`, `jumlahPekerja`) VALUES
(1, 'pertanian tanaman padi & palawija', 3),
(2, 'Bangunan Konstruksi', 15),
(3, 'Perdagangan', 61),
(4, 'Transportasi & Pergudangan', 9),
(5, 'Keuangan & Asuransi', 1),
(6, 'Jasa Pendidikan', 18),
(7, 'Jasa Kesehatan', 2),
(8, 'Jasa Kemasyarakatan, pemerintahan, perorangan', 17),
(9, 'Pemulung', 4),
(10, 'Dan lainnya', 572),
(11, 'Perkebunan', 393),
(12, 'Perikanan Tangkap', 5),
(13, 'Peternakan', 2),
(14, 'Kehutanan & Pertanian lainnya', 3),
(15, 'Industri Pengolahan', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbsukapura`
--

CREATE TABLE `tbsukapura` (
  `idPekerjaan` int(11) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `jumlahPekerja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbsukapura`
--

INSERT INTO `tbsukapura` (`idPekerjaan`, `pekerjaan`, `jumlahPekerja`) VALUES
(1, 'pertanian tanaman padi & palawija', 48),
(2, 'Listrik & Gas', 1),
(3, 'Bangunan Konstruksi', 9),
(4, 'Perdagangan', 69),
(5, 'Hotel & Rumah Makan', 1),
(6, 'Transportasi & Pergudangan', 12),
(7, 'Jasa Pendidikan', 9),
(8, 'Jasa Kesehatan', 1),
(9, 'Jasa Kemasyarakatan, pemerintahan, perorangan', 15),
(10, 'Dan lainnya', 502),
(11, 'Perkebunan', 37),
(12, 'Peternakan', 2),
(13, 'Kehutanan & Pertanian lainnya', 3),
(14, 'Industri Pengolahan', 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbcikareoselatan`
--
ALTER TABLE `tbcikareoselatan`
  ADD PRIMARY KEY (`idPekerjaan`);

--
-- Indexes for table `tbcikareoutara`
--
ALTER TABLE `tbcikareoutara`
  ADD PRIMARY KEY (`idPekerjaan`);

--
-- Indexes for table `tbcilengkrang`
--
ALTER TABLE `tbcilengkrang`
  ADD PRIMARY KEY (`idPekerjaan`);

--
-- Indexes for table `tbcimungkal`
--
ALTER TABLE `tbcimungkal`
  ADD PRIMARY KEY (`idPekerjaan`);

--
-- Indexes for table `tbcisurat`
--
ALTER TABLE `tbcisurat`
  ADD PRIMARY KEY (`idPekerjaan`);

--
-- Indexes for table `tbganjaresik`
--
ALTER TABLE `tbganjaresik`
  ADD PRIMARY KEY (`idPekerjaan`);

--
-- Indexes for table `tbmulyajaya`
--
ALTER TABLE `tbmulyajaya`
  ADD PRIMARY KEY (`idPekerjaan`);

--
-- Indexes for table `tbsukajadi`
--
ALTER TABLE `tbsukajadi`
  ADD PRIMARY KEY (`idPekerjaan`);

--
-- Indexes for table `tbsukapura`
--
ALTER TABLE `tbsukapura`
  ADD PRIMARY KEY (`idPekerjaan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

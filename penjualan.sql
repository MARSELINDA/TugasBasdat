-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2023 at 07:59 AM
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
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `Kode_brg` varchar(50) NOT NULL,
  `Nama_brg` varchar(50) DEFAULT NULL,
  `harga` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `costumer`
--

CREATE TABLE `costumer` (
  `id_customer` varchar(50) NOT NULL,
  `nama_costumer` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan_brg`
--

CREATE TABLE `detail_penjualan_brg` (
  `no_jual` varchar(50) NOT NULL,
  `Kode_brg` varchar(50) DEFAULT NULL,
  `qty_jualan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_brg`
--

CREATE TABLE `penjualan_brg` (
  `no_jual` varchar(50) NOT NULL,
  `tgl_jual` varchar(50) DEFAULT NULL,
  `id_customer` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`Kode_brg`);

--
-- Indexes for table `costumer`
--
ALTER TABLE `costumer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `detail_penjualan_brg`
--
ALTER TABLE `detail_penjualan_brg`
  ADD PRIMARY KEY (`no_jual`),
  ADD KEY `no_jual` (`no_jual`,`Kode_brg`),
  ADD KEY `Kode_brg` (`Kode_brg`);

--
-- Indexes for table `penjualan_brg`
--
ALTER TABLE `penjualan_brg`
  ADD PRIMARY KEY (`no_jual`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_penjualan_brg`
--
ALTER TABLE `detail_penjualan_brg`
  ADD CONSTRAINT `detail_penjualan_brg_ibfk_1` FOREIGN KEY (`Kode_brg`) REFERENCES `barang` (`Kode_brg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan_brg`
--
ALTER TABLE `penjualan_brg`
  ADD CONSTRAINT `penjualan_brg_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `costumer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_brg_ibfk_2` FOREIGN KEY (`no_jual`) REFERENCES `detail_penjualan_brg` (`no_jual`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2023 at 07:01 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gsushare_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `USERNAME` varchar(100) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `AUTHORIZATION` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`USERNAME`, `PASSWORD`, `EMAIL`, `AUTHORIZATION`) VALUES
('janethoward', '*59A213C802C34B99E19729E416BD47444F743A05', 'jhoward53@student.gsu.edu', 'admin'),
('sallyjones', '*E0E53FD0F66AA985766C9C528D80071E6426D681', 'sjones60@student.gsu.edu', 'moderator'),
('markdouglas', '*1BBBE5726B5EA6F8CDEA0119301386297482C577', 'mdouglas44@student.gsu.edu', 'moderator'),
('kevinlee', '*1DFE326D4479F1B64D9DD8ABF770F49ED9C62392', 'klee86@student.gsu.edu', 'moderator'),
('lisaadams', '*C0280CA80B3E752A52A881AA2752C5574A3EAB58', 'ladams34@student.gsu.edu', 'user'),
('amandasmith', '*F2474827CE94C6E358B13CEB75068FFB2A25BB46', 'asmith56@student.gsu.edu', 'user'),
('davidwilson', '*4F4ABA7B9423F217A37B8FC19BDE057E8A3BBB9E', 'dwilson@student.gsu.edu', 'user'),
('sarahjohnson', '*39B6CFF748026F532EB468EADC2CBE6DCDACAF8F', 'sjohnson10@student.gsu.edu', 'user'),
('johndoe', '*873597B11E6A6C69D41A98A03DB74F406B7BADB1', 'jdoe@student.gsu.edu', 'user'),
('lisawang', '*23BFF55BF27025C5AF116F3DC8E394B8E523EF53', 'lwang22@student.gsu.edu', 'user'),
('charlesbrown', '*BD12C6BF0629DBB7D06C5C51F3D03E41A5764542', 'cbrown28@student.gsu.edu', 'user'),
('annetaylor', '*DC65D3D12DA3AE2AC34D5B3F5509BE3D166B15D2', 'ataylor76@student.gsu.edu', 'user'),
('mikesmith', '*6BFB6B001CC9D4A2DAA16BE81227DC228A109920', 'msmith15@student.gsu.edu', 'user'),
('rachelcarter', '*F5B1CD2B6E065126648A6A88F0057882689D2B12', 'rcarter47@student.gsu.edu', 'user'),
('stephenjohns', '*58A72EAD27204212540DB61124CCECCA0A3A68A1', 'sjohns@student.gsu.edu', 'user'),
('ericbaker', '*566820C3E8756E08C6F2F4049DACE37ADE051EDC', 'ebaker11@student.gsu.edu', 'user'),
('chrisjackson', '*5100C75E3C1D67991092BEECBEFD4FA21C35544B', 'cjackson12@student.gsu.edu', 'user'),
('jennythomas', '*1574EEAF544B28436DF50E3A3E750E549D37D84B', 'jthomas@student.gsu.edu', 'user'),
('kristinbrown', '*4D8D1668F246EE843F112ADE606A9BFBC7D64234', 'kbrown68@student.gsu.edu', 'user'),
('joewilliams', '*D862FD2DA423A3940082D92CD562DC881CEEBE32', 'jwilliams13@student.gsu.edu', 'user');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2023 at 04:46 PM
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
  `PASSWORD` varchar(32) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `AUTHORIZATION` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`USERNAME`, `PASSWORD`, `EMAIL`, `AUTHORIZATION`) VALUES
('janethoward', 'Y8*f#z3q4K', 'jhoward53@student.gsu.edu', 'admin'),
('sallyjones', 'bG9@x2Tc6F', 'sjones60@student.gsu.edu', 'moderator'),
('markdouglas', 'D5h*E7p1zA', 'mdouglas44@student.gsu.edu', 'moderator'),
('kevinlee', 'V6t*H2m7fR', 'klee86@student.gsu.edu', 'moderator'),
('lisaadams', 'P1y&G5u9cX', 'ladams34@student.gsu.edu', 'user'),
('amandasmith', 'N9s#U6j3kF', 'asmith56@student.gsu.edu', 'user'),
('davidwilson', 'F2g*T4b6zE', 'dwilson@student.gsu.edu', 'user'),
('sarahjohnson', 'R8f#N4m5qJ', 'sjohnson10@student.gsu.edu', 'user'),
('johndoe', 'W6j*G4h9tM', 'jdoe@student.gsu.edu', 'user'),
('lisawang', 'Y2k*S7n6jF', 'lwang22@student.gsu.edu', 'user'),
('charlesbrown', 'B7f#P5s8tZ', 'cbrown28@student.gsu.edu', 'user'),
('annetaylor', 'X9r*K7h2gM', 'ataylor76@student.gsu.edu', 'user'),
('mikesmith', 'H6p&N8k2zL', 'msmith15@student.gsu.edu', 'user'),
('rachelcarter', 'T7f&K2g8dE', 'rcarter47@student.gsu.edu', 'user'),
('stephenjohns', 'J3h#B5n9mR', 'sjohns@student.gsu.edu', 'user'),
('ericbaker', 'Z2s&Y4e7gF', 'ebaker11@student.gsu.edu', 'user'),
('chrisjackson', 'L9t@K3n6zG', 'cjackson12@student.gsu.edu', 'user'),
('jennythomas', 'C7g*N2m4fT', 'jthomas@student.gsu.edu', 'user'),
('kristinbrown', 'A5f*G7r9pJ', 'kbrown68@student.gsu.edu', 'user'),
('joewilliams', 'Q2d&L5t6kR', 'jwilliams13@student.gsu.edu', 'user');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

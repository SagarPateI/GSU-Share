-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2023 at 06:14 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gsushare`
--

-- --------------------------------------------------------

--
-- Table structure for table `contenttable`
--

CREATE TABLE `contenttable` (
  `id` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `author` varchar(20) NOT NULL,
  `body` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `tag` varchar(20) NOT NULL,
  `image` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contenttable`
--

INSERT INTO `contenttable` (`id`, `title`, `author`, `body`, `date`, `tag`, `image`) VALUES
(3, 'game', 'jack', 'game play', '2023-04-26', 'esport', 0),
(5, 'free tutor', 'alex', 'free physics tutor', '2023-04-16', 'acadamic', 0),
(6, 'camping', 'daniel', 'camping in the mountains', '2023-04-28', 'adventure', 0),
(8, 'Reserve a Space: Fre', 'Carlos F. Mower\r\n', 'The Library offers a variety of spaces for Georgia State students, faculty, and staff that can be bo', '2022-12-08', 'library, productivit', 0),
(9, 'Borrowing Services: ', 'Evelyn B. Stevenson\r', 'Any actively enrolled student receives borrowing privileges. See the University Policy on Continuous', '2023-01-03', 'library, productivit', 0),
(10, 'Free Passport Progra', 'Ricky T. Williams', 'Take the First Step. Get a Free Passport! Become a Global Citizen.\r\n\r\nWith this one little book, get', '2022-08-16', 'travel', 0),
(11, 'Resume and Cover Let', 'Janet W. Cano', 'At the GSU Career Services center, students can drop in Monday–Friday, 11 a.m.–3 p.m. and receive he', '2023-02-07', 'career services', 0),
(12, 'Free Professional He', 'Edward T. Telles', 'Get your free headshot taken today: https://career.gsu.edu/students/', '2022-11-28', 'career services', 0),
(13, 'Panther Career Close', 'Karly C. Best', 'Preparing for an interview or an upcoming career fair? Need fancy clothes for a professional headsho', '2022-12-21', 'career services', 0),
(14, 'Free Tutoring', 'Betty D. Robles', '\"The Learning & Tutoring Center is committed to your success. The LTC will continue to provide free,', '2022-11-12', 'productivity', 0),
(15, 'Counseling Services', 'Shawn C. Warner', 'The Georgia State Counseling Center is committed to ensuring access to mental health support service', '2023-02-20', 'health', 0),
(16, 'Free software licens', 'Betty H. Bradley', 'Students have access to free software, technology equipment, and other resources to support their ac', '2023-03-29', 'software, productivi', 0),
(17, 'PantherMail student ', 'Wanda J. Poe', 'Get started using your university student email account, including additional tools like OneDrive on', '2022-08-02', 'software, productivi', 0),
(18, 'Free Wifi: GSU Wirel', 'Dave E. Gordon', 'Connect to the Internet On Campus\r\n\r\nGSU Wireless provides wireless access to students, faculty, and', '2023-03-12', 'software, productivi', 0),
(19, 'Cybersecurity Awaren', 'Eric S. Keating', 'Protect Yourself and Related Computer Systems\r\n\r\nAll Georgia State faculty and staff are required by', '2022-12-05', 'training, productivi', 0),
(20, 'Technology and Profe', 'Christopher T. James', 'LinkedIn Learning offers an online library of business, software, technology and creative skills tra', '2022-11-09', 'training, productivi', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contenttable`
--
ALTER TABLE `contenttable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contenttable`
--
ALTER TABLE `contenttable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

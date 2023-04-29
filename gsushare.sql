-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2023 at 05:27 AM
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
  `tag` varchar(30) NOT NULL,
  `image` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contenttable`
-- table data with id, title author, body, date, tag and image

INSERT INTO `contenttable` (`id`, `title`, `author`, `body`, `date`, `tag`, `image`) VALUES
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

-- --------------------------------------------------------

--
-- Table structure for table `users`
-- user table with username, email, privilage and password
-- privilage have 1 as user and 0 as admin

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `privilage` tinyint(1) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `privilage`, `password`) VALUES
(1, 'janethoward', 'jhoward53@student.gsu.edu', 1, 'Y8*f#z3q4K'),
(2, 'sallyjones', 'sjones60@student.gsu.edu', 0, 'bG9@x2Tc6F'),
(3, 'markdouglas', 'mdouglas44@student.gsu.edu', 0, 'D5h*E7p1zA'),
(4, 'kevinlee', 'klee86@student.gsu.edu', 0, 'V6t*H2m7fR'),
(5, 'lisaadams', 'ladams34@student.gsu.edu', 1, 'P1y&G5u9cX'),
(6, 'amandasmith', 'asmith56@student.gsu.edu', 1, 'N9s#U6j3kF'),
(7, 'davidwilson', 'dwilson@student.gsu.edu', 1, 'F2g*T4b6zE'),
(8, 'sarahjohnson', 'sjohnson10@student.gsu.edu', 1, 'R8f#N4m5qJ'),
(9, 'johndoe', 'jdoe@student.gsu.edu', 1, 'W6j*G4h9tM'),
(10, 'lisawang', 'lwang22@student.gsu.edu', 1, 'Y2k*S7n6jF'),
(11, 'charlesbrown', 'cbrown28@student.gsu.edu', 1, 'B7f#P5s8tZ'),
(12, 'annetaylor', 'ataylor76@student.gsu.edu', 1, 'X9r*K7h2gM'),
(13, 'mikesmith', 'msmith15@student.gsu.edu', 1, 'H6p&N8k2zL'),
(14, 'rachelcarter', 'rcarter47@student.gsu.edu', 1, 'T7f&K2g8dE'),
(15, 'stephenjohns', 'sjohns@student.gsu.edu', 1, 'J3h#B5n9mR'),
(16, 'ericbaker', 'ebaker11@student.gsu.edu', 1, 'Z2s&Y4e7gF'),
(17, 'chrisjackson', 'cjackson12@student.gsu.edu', 1, 'L9t@K3n6zG'),
(18, 'jennythomas', 'jthomas@student.gsu.edu', 1, 'C7g*N2m4fT'),
(19, 'kristinbrown', 'kbrown68@student.gsu.edu', 1, 'A5f*G7r9pJ'),
(20, 'joewilliams', 'jwilliams13@student.gsu.edu', 1, 'Q2d&L5t6kR');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contenttable`
--
ALTER TABLE `contenttable`
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
-- AUTO_INCREMENT for table `contenttable`
--
ALTER TABLE `contenttable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2023 at 09:39 PM
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
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `TITLE` varchar(200) NOT NULL,
  `IMAGE` varchar(200) NOT NULL,
  `BODY` longtext NOT NULL,
  `AUTHOR` varchar(200) NOT NULL,
  `DATE` date NOT NULL,
  `TAGS` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`TITLE`, `IMAGE`, `BODY`, `AUTHOR`, `DATE`, `TAGS`) VALUES
('Reserve a Space: Free Access to Group Study Rooms\r\n', '', 'The Library offers a variety of spaces for Georgia State students, faculty, and staff that can be booked online. Use of University Library facilities by GSU students, faculty, and staff is limited to study and research that is directly related to the individual or group’s academic coursework, research related to their field of scholarship, or within the scope of their applicable job duties at GSU. https://rooms.library.gsu.edu/reserve/atlanta\r\n', 'Carlos F. Mower\r\n', '2022-12-08', 'library, study, productivity\r\n'),
('Borrowing Services: Books, Media, Periodicals, Equipment\r\n', '', 'Any actively enrolled student receives borrowing privileges. See the University Policy on Continuous Enrollment for details regarding graduate students. See the Equipment Borrowing page for details about checking out Chromebooks and other equipment: https://library.gsu.edu/services-and-spaces/borrowing-services/borrowing-policies/#1559236345989-a9fb4470-68f9\r\n', 'Evelyn B. Stevenson\r\n', '2023-01-03', 'library, books, media, journals, research\r\n'),
('Free Passport Program', '', 'Take the First Step. Get a Free Passport! Become a Global Citizen.\r\n\r\nWith this one little book, get access to infinite experiences around the world. Whether you’re traveling abroad to study a new culture, practice a different language, or start an international career, you will need a passport to explore these opportunities. When you’re ready to safely catch flights, not you know what… Where do you want to go? Hold that thought.\r\n\r\nOver 1,000 GSU students have received a passport; apply for yours today!\r\nhttps://mystudyabroad.gsu.edu/students/free-passport-program/', 'Ricky T. Williams', '2022-08-16', 'passport, citizenship, travel'),
('Resume and Cover Letter Reviews', '', 'At the GSU Career Services center, students can drop in Monday–Friday, 11 a.m.–3 p.m. and receive help from our many specialists that are there with the main task of helping students find jobs! \r\nhttps://career.gsu.edu/students/', 'Janet W. Cano', '2023-02-07', 'career services, jobs, resume'),
('Free Professional Headshots and access to the panther Career Closet', '', 'Get your free headshot taken today: https://career.gsu.edu/students/', 'Edward T. Telles', '2022-11-28', 'picture, resume, career services'),
('Borrow Formal Clothes: Panther Career Closet', '', 'Preparing for an interview or an upcoming career fair? Need fancy clothes for a professional headshot? The Panther Career Closet has you covered: https://gsucareercloset.com/password', 'Karly C. Best', '2022-12-21', 'clothes, career services'),
('Free Tutoring', '', '\"The Learning & Tutoring Center is committed to your success. The LTC will continue to provide free, online tutoring seven days a week starting January 9. By clicking the blue Online Tutoring button below, you will gain access to live tutors who are ready to assist you. Campus LTCs will be open for computer use and on-campus tutoring. Check Locations & Hours to find out about tutoring on your campus.\r\n\r\nYou have been to class. You have taken the notes. You have the assignment, but you do not know where to begin. Maybe you are just having a hard time putting it all together. You need  FREE TUTORING!\r\n\r\nhttps://success.students.gsu.edu/learning-tutoring-center/\r\n\r\nFree STEM tutoring (Biol, Chem, CSC, Math, Phys): https://gsu-as.tutorocean.com/home\"', 'Betty D. Robles', '2022-11-12', 'study, productivity, tutoring'),
('Counceling Services', '', 'The Georgia State Counseling Center is committed to ensuring access to mental health support services. Through innovative practices and effective intervention, over the past six years, the center has increased access to serve 65 percent more students. In 2019-20, the center conducted more than 12,000 appointments.\r\n\r\nThis year, students will not only be eligible to utilize the suite of services offered by the Counseling Center, students will also benefit from expanded mental health services funded by and provided through the University System of Georgia Mental Health Initiative. This includes a partnership to expand counseling services through Christie Campus Health (CCH) as well as comprehensive suicide prevention consultation in partnership with the Jed Foundation. \r\n\r\nhttps://counselingcenter.gsu.edu/\r\n', 'Shawn C. Warner', '2023-02-20', 'counceling, mental health, self care'),
('Technology resources: Free software licenses for currently enrolled students! Save thousands of dollars!', '', 'Students have access to free software, technology equipment, and other resources to support their academic work. University-licensed software is available to download for free to assist students, faculty and staff with academic, research and productivity. Faculty and staff can also submit a help request for software to be installed on their workstations.\r\n\r\nAdobe Creative Cloud\r\nAntivirus\r\nArcGIS\r\nAutoCad\r\nChemDraw\r\nCisco Virtual Private Network\r\nDropbox\r\nEndnote\r\nMathematica\r\nMatlab\r\nMicrosoft ProPlus Office Suite \r\nNVivo\r\nSAS\r\nSPSS\r\nSTATA\r\n\r\nhttps://technology.gsu.edu/technology-services/software-equipment/university-licensed-software/', 'Betty H. Bradley', '2023-03-29', 'software, study, productivity'),
('PantherMail student email access, get reminded by GSU board members about the latest opportunities on campass!', '', 'Get started using your university student email account, including additional tools like OneDrive online storage and access to Microsoft Office suite.\r\n\r\nhttps://technology.gsu.edu/technology-services/email/panthermail-student-email/', 'Wanda J. Poe', '2022-08-02', 'software, productivity'),
('Free Wifi: GSU Wireless Access', '', 'Connect to the Internet On Campus\r\n\r\nGSU Wireless provides wireless access to students, faculty, and staff using CampusID and password.\r\n\r\nEduroam is an academic, community wireless network that allows you to connect to the internet at any other institution that hosts Eduroam by logging in with your campus email address and CampusID password.\r\n\r\nGSU-Guest allows campus guests temporary access to the network for an event or when sponsored by a faculty or staff member. Faculty, staff, and students can also sign on to the guest network for temporary wireless access.\r\n\r\nhttps://technology.gsu.edu/technology-services/gsu-wireless-network/', 'Dave E. Gordon', '2023-03-12', 'software, productivity'),
('Cybersecurity Awareness Training', '', 'Protect Yourself and Related Computer Systems\r\n\r\nAll Georgia State faculty and staff are required by the University System of Georgia policy to complete cybersecurity awareness twice annually. Georgia State’s cybersecurity team will conduct university-wide online training during fall and spring.\r\n\r\nThe online training, conducted using the KnowBe4 training system, helps you recognize and protect against increasingly common cyber threats that can compromise your and others’ sensitive personal and financial information as well as cause damage to computer and information systems. It contains a series of video modules and interactive quizzes that will help you learn how you can better protect yourself from cyber threats both at work and at home.\r\n\r\nhttps://technology.gsu.edu/technology-services/cybersecurity/security-awareness-training/', 'Eric S. Keating', '2022-12-05', 'study, productivity, training'),
('Technology and Professional Training: LinkedIn Learning', '', 'LinkedIn Learning offers an online library of business, software, technology and creative skills training. Learn anywhere using the app, with downloadable courses and access on most mobile devices, and connect your personal LinkedIn account for improved personalization and course suggestions.\r\n\r\n- Free to Georgia State students, faculty and staff\r\n- Make playlists, bookmark lectures and get recommendations based on your goals, or what\'s popular at Georgia State\r\n- Connect your LinkedIn profile to your campus LinkedIn Learning account to get more personalized course suggestions\r\n- Earn Completion Certificates to verify that you\'ve finished courses\r\n- New courses added weekly\r\n\r\nhttps://technology.gsu.edu/technology-services/technology-professional-training/linkedin-learning/', 'Christopher T. James', '2022-11-09', 'training, career services');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

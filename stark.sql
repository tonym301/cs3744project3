-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2018 at 06:03 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stark`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `year` int(11) NOT NULL,
  `description` text,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `title`, `year`, `description`, `member_id`) VALUES
(1, 'Birth', 43, 'This was the toughest battle in history', 17),
(9, 'Birth', 2018, 'Robb was born in the castle of Winterfell. He was the first son of Eddard Satrk and the rightful heir to the northern throne. His birth was in the middle of the summer years.', 25),
(10, 'Battle of the Twin Rivers', 801, 'Robb\'s first battle was also his first victory. He wore his own plated armor and commanded the bannermen that pledged to house Stark. He fought bravely and had a comfirmed kill count of 5.', 20),
(11, 'Battle of Winterfell', 810, 'Robb was forced to fight savages that teamed up against his home castle. This was an especially important event to Robb because he had the chance to prove his stength to his family and earn the honor of the Stark name. The defence was successful and Robb ws awarded a new set of armor.', 20);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `deathdate` date DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `father_firstname` varchar(50) DEFAULT NULL,
  `father_lastname` varchar(50) DEFAULT NULL,
  `mother_firstname` varchar(50) DEFAULT NULL,
  `mother_lastname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `firstname`, `lastname`, `birthdate`, `deathdate`, `image`, `father_firstname`, `father_lastname`, `mother_firstname`, `mother_lastname`) VALUES
(20, 'Robb', 'Stark', '1967-07-13', '2018-03-15', 'Robb.jpg', 'Liene', 'Stark', 'Eddard', 'Stark'),
(21, 'Sansa', 'Stark', '2018-03-13', NULL, 'Sansa.jpg', 'Eddard', 'Stark', 'Liene', 'Stark'),
(23, 'Anthony', 'Medovar', '2017-12-06', NULL, NULL, NULL, NULL, 'CS', '3744'),
(24, 'My ', 'Test', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'Joel', 'Stark', '2018-03-15', '2017-11-24', NULL, 'Hello', 'Stark', 'World', 'Stark');

-- --------------------------------------------------------

--
-- Table structure for table `relationships`
--

CREATE TABLE `relationships` (
  `relation_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `relation` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relationships`
--

INSERT INTO `relationships` (`relation_id`, `member_id`, `relation`, `name`) VALUES
(3, 15, 'Brother', 'Anthony Medovar'),
(4, 20, 'Brother', 'Bran Stark'),
(5, 20, 'Sister', 'Sansa'),
(6, 20, 'Sister', 'Arya Stark'),
(7, 20, 'Sister', 'Sansa Stark'),
(8, 22, 'Mother', 'Sansa Stark'),
(9, 22, 'Brother', 'Lewis Stark'),
(10, 23, 'Cousin', 'Robb Stark');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `relationships`
--
ALTER TABLE `relationships`
  ADD PRIMARY KEY (`relation_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `relationships`
--
ALTER TABLE `relationships`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

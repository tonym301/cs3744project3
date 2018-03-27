-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 12, 2018 at 07:43 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `9thpa`
--

-- --------------------------------------------------------

--
-- Table structure for table `life_event`
--

CREATE TABLE `life_event` (
  `id` int(11) NOT NULL,
  `year` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(300) NOT NULL,
  `details` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `soldier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `life_event`
--

INSERT INTO `life_event` (`id`, `year`, `title`, `details`, `date_created`, `soldier_id`) VALUES
(1, 1861, 'Enlisted', 'Barnes enlisted in the 9th PA Reserves on May 1, 1861.', '2018-03-12 03:16:52', 2),
(2, 1863, 'Promoted to Major', 'Barnes was promoted to the rank of Major on April 1, 1863.', '2018-03-12 03:17:28', 2),
(3, 1863, 'Battle of Gettysburg', 'Barnes fought in the Battle of Gettysburg on July 1-3, 1863.', '2018-03-12 03:17:50', 2),
(4, 1864, 'Mustered out', 'Barnes mustered out of the army on May 12, 1864.', '2018-03-12 03:18:14', 2),
(5, 1861, 'Enlisted', 'Monshaur enlisted in the 9th PA Reserves on May 1, 1861.', '2018-03-12 03:18:48', 1),
(6, 1863, 'Battle of Gettysburg', 'Monshaur fought in the Battle of Gettysburg on July 1-3, 1863.', '2018-03-12 03:18:48', 1),
(7, 1864, 'Mustered out', 'Monshaur mustered out of the army on May 11, 1864.', '2018-03-12 03:19:02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `soldier`
--

CREATE TABLE `soldier` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `rank` varchar(50) DEFAULT NULL,
  `enlisted` date DEFAULT NULL,
  `muster_out` date DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soldier`
--

INSERT INTO `soldier` (`id`, `first_name`, `last_name`, `rank`, `enlisted`, `muster_out`, `file_name`, `date_created`, `creator_id`) VALUES
(1, 'Charles', 'Monshaur', 'Sergeant', '1861-05-01', '1864-05-11', 'monshaur.jpg', '2018-02-26 20:28:12', 1),
(2, 'Charles', 'Barnes', 'Captain', '1861-05-01', '1864-05-12', 'barnes.png', '2018-02-26 20:29:01', 1),
(3, 'Test', 'Test2', NULL, NULL, NULL, NULL, '2018-02-26 20:41:44', 1),
(4, 'Foo', 'Bar', 'Private', NULL, NULL, NULL, '2018-02-28 20:27:01', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `life_event`
--
ALTER TABLE `life_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soldier`
--
ALTER TABLE `soldier`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `life_event`
--
ALTER TABLE `life_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `soldier`
--
ALTER TABLE `soldier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2024 at 04:08 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `it24-api`
--

-- --------------------------------------------------------

--
-- Table structure for table `maps`
--

CREATE TABLE `maps` (
  `map_id` varchar(10) NOT NULL,
  `map_name` varchar(255) DEFAULT NULL,
  `map_lat` decimal(9,6) DEFAULT NULL,
  `map_lng` decimal(9,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maps`
--

INSERT INTO `maps` (`map_id`, `map_name`, `map_lat`, `map_lng`) VALUES
('0001', 'Northern Bukidnon State College', 8.361277, 124.867941);

-- --------------------------------------------------------

--
-- Table structure for table `map_pins`
--

CREATE TABLE `map_pins` (
  `pin_id` varchar(10) NOT NULL,
  `map_id` varchar(10) DEFAULT NULL,
  `pin_name` varchar(255) DEFAULT NULL,
  `pin_lat` decimal(9,6) DEFAULT NULL,
  `pin_lng` decimal(9,6) DEFAULT NULL,
  `pin_created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `map_pins`
--

INSERT INTO `map_pins` (`pin_id`, `map_id`, `pin_name`, `pin_lat`, `pin_lng`, `pin_created_by`) VALUES
('0001', '0001', 'NBSC Covered Court', 8.360219, 124.868828, 'Cliff'),
('0002', '0001', 'NBSC Student Center', 8.360590, 124.867669, 'Cliff');

-- --------------------------------------------------------

--
-- Table structure for table `map_polygon_vertices`
--

CREATE TABLE `map_polygon_vertices` (
  `map_id` varchar(10) NOT NULL,
  `vertex_id` int(11) NOT NULL,
  `vertex_lat` decimal(9,6) DEFAULT NULL,
  `vertex_lng` decimal(9,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `map_polygon_vertices`
--

INSERT INTO `map_polygon_vertices` (`map_id`, `vertex_id`, `vertex_lat`, `vertex_lng`) VALUES
('0001', 1, 8.361277, 124.867941),
('0001', 2, 8.359046, 124.867357),
('0001', 3, 8.358547, 124.869059),
('0001', 4, 8.360850, 124.869553);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`map_id`);

--
-- Indexes for table `map_pins`
--
ALTER TABLE `map_pins`
  ADD PRIMARY KEY (`pin_id`),
  ADD KEY `map_id` (`map_id`);

--
-- Indexes for table `map_polygon_vertices`
--
ALTER TABLE `map_polygon_vertices`
  ADD PRIMARY KEY (`map_id`,`vertex_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `map_pins`
--
ALTER TABLE `map_pins`
  ADD CONSTRAINT `map_pins_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`map_id`);

--
-- Constraints for table `map_polygon_vertices`
--
ALTER TABLE `map_polygon_vertices`
  ADD CONSTRAINT `map_polygon_vertices_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`map_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

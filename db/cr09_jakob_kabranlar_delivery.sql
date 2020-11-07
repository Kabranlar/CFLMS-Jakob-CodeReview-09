-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2020 at 02:39 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_jakob_kabranlar_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_jakob_kabranlar_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_jakob_kabranlar_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `top` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `country`, `city`, `street`, `number`, `top`) VALUES
(1, 'Austria', 'Vienna', 'Schönbrunnerstraße', '2', '4'),
(2, 'Germany', 'Berlin', 'Hermannstraße', '44', '8'),
(3, 'Turkey', 'Istanbul', 'Caddebostan Sahili', '67', '32'),
(4, 'Austria', 'Vienna', 'Mariahilferstraße', '87', '26'),
(5, 'Austria', 'Vienna', 'Haberlgasse', '93', '3a'),
(6, 'Austria', 'Graz', 'Mariahilferstraße', '51', '8c'),
(7, 'Germany', 'Berlin', 'Sonnenallee', '52', '2'),
(8, 'Austria', 'Vienna', 'Marswiese', '75', '76'),
(9, 'Germany', 'Hamburg', 'Hopfenmarkt', '12', '2'),
(10, 'Austria', 'Vienna', 'Gagastraße', '5', NULL),
(11, 'Austria', 'Vienna', 'Hinniggasse', '5', NULL),
(12, 'Austria', 'Vienna', 'Miadstraße', '62', NULL),
(13, 'Austria', 'Vienna', 'Mariahilferstraße', '86', NULL),
(14, 'Austria', 'Vienna', 'Haberlgasse', '91', NULL),
(15, 'Austria', 'Vienna', 'Hungrygasse', '83', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `fk_person_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `fk_person_id`) VALUES
(2, 1),
(3, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE `mail` (
  `mail_id` int(11) NOT NULL,
  `deposit_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `fk_sender_id` int(11) DEFAULT NULL,
  `fk_recipient_id` int(11) DEFAULT NULL,
  `fk_postal_service_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mail`
--

INSERT INTO `mail` (`mail_id`, `deposit_date`, `delivery_date`, `fk_sender_id`, `fk_recipient_id`, `fk_postal_service_id`) VALUES
(1, '2019-12-09', '2019-12-12', 1, 3, 1),
(2, '2018-04-21', '2018-04-22', 3, 1, 2),
(3, '2019-09-09', '2019-09-09', 2, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `firstName`, `lastName`) VALUES
(1, 'Toni', 'Bubli'),
(2, 'Maria', 'Rochelle'),
(3, 'Alex', 'Maurer'),
(4, 'Ruth', 'Boller'),
(5, 'Francesco', 'Hueueue'),
(6, 'Hertha', 'Hummel'),
(7, 'Ringo', 'Star'),
(8, 'Emilia', 'Earhart'),
(9, 'Sabiha', 'Gökcen');

-- --------------------------------------------------------

--
-- Table structure for table `pickup_location`
--

CREATE TABLE `pickup_location` (
  `pickup_location_id` int(11) NOT NULL,
  `fk_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pickup_location`
--

INSERT INTO `pickup_location` (`pickup_location_id`, `fk_address_id`) VALUES
(3, 13),
(2, 14),
(1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `postal_service`
--

CREATE TABLE `postal_service` (
  `postal_service_id` int(11) NOT NULL,
  `fk_pickup_location_id` int(11) DEFAULT NULL,
  `fk_address_id` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postal_service`
--

INSERT INTO `postal_service` (`postal_service_id`, `fk_pickup_location_id`, `fk_address_id`, `fk_employee_id`) VALUES
(1, 1, 12, 3),
(2, 2, 11, 2),
(3, 3, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `recipient_id` int(11) NOT NULL,
  `fk_person_id` int(11) DEFAULT NULL,
  `fk_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`recipient_id`, `fk_person_id`, `fk_address_id`) VALUES
(1, 6, 2),
(2, 5, 8),
(3, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `sender`
--

CREATE TABLE `sender` (
  `sender_id` int(11) NOT NULL,
  `fk_person_id` int(11) DEFAULT NULL,
  `fk_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sender`
--

INSERT INTO `sender` (`sender_id`, `fk_person_id`, `fk_address_id`) VALUES
(1, 9, 3),
(2, 8, 9),
(3, 7, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_person_id` (`fk_person_id`);

--
-- Indexes for table `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`mail_id`),
  ADD KEY `fk_sender_id` (`fk_sender_id`),
  ADD KEY `fk_recipient_id` (`fk_recipient_id`),
  ADD KEY `fk_postal_service_id` (`fk_postal_service_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `pickup_location`
--
ALTER TABLE `pickup_location`
  ADD PRIMARY KEY (`pickup_location_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indexes for table `postal_service`
--
ALTER TABLE `postal_service`
  ADD PRIMARY KEY (`postal_service_id`),
  ADD KEY `fk_pickup_location_id` (`fk_pickup_location_id`),
  ADD KEY `fk_address_id` (`fk_address_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipient_id`),
  ADD KEY `fk_person_id` (`fk_person_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indexes for table `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`sender_id`),
  ADD KEY `fk_person_id` (`fk_person_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mail`
--
ALTER TABLE `mail`
  MODIFY `mail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pickup_location`
--
ALTER TABLE `pickup_location`
  MODIFY `pickup_location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `postal_service`
--
ALTER TABLE `postal_service`
  MODIFY `postal_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recipient`
--
ALTER TABLE `recipient`
  MODIFY `recipient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sender`
--
ALTER TABLE `sender`
  MODIFY `sender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `mail`
--
ALTER TABLE `mail`
  ADD CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`fk_sender_id`) REFERENCES `sender` (`sender_id`),
  ADD CONSTRAINT `mail_ibfk_2` FOREIGN KEY (`fk_recipient_id`) REFERENCES `recipient` (`recipient_id`),
  ADD CONSTRAINT `mail_ibfk_3` FOREIGN KEY (`fk_postal_service_id`) REFERENCES `postal_service` (`postal_service_id`);

--
-- Constraints for table `pickup_location`
--
ALTER TABLE `pickup_location`
  ADD CONSTRAINT `pickup_location_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `postal_service`
--
ALTER TABLE `postal_service`
  ADD CONSTRAINT `postal_service_ibfk_1` FOREIGN KEY (`fk_pickup_location_id`) REFERENCES `pickup_location` (`pickup_location_id`),
  ADD CONSTRAINT `postal_service_ibfk_2` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `postal_service_ibfk_3` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`fk_person_id`) REFERENCES `person` (`person_id`),
  ADD CONSTRAINT `recipient_ibfk_2` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `sender`
--
ALTER TABLE `sender`
  ADD CONSTRAINT `sender_ibfk_1` FOREIGN KEY (`fk_person_id`) REFERENCES `person` (`person_id`),
  ADD CONSTRAINT `sender_ibfk_2` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

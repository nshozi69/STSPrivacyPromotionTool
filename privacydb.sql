-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2021 at 11:14 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `privacydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_factorlevels`
--

CREATE TABLE `tbl_factorlevels` (
  `FactorLevelID` int(11) NOT NULL,
  `LevelName` varchar(50) NOT NULL,
  `LevelValue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_factorlevels`
--

INSERT INTO `tbl_factorlevels` (`FactorLevelID`, `LevelName`, `LevelValue`) VALUES
(1, 'Low', 1),
(2, 'Moderate', 2),
(3, 'High', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_factors`
--

CREATE TABLE `tbl_factors` (
  `FactorID` int(11) NOT NULL,
  `FactorName` varchar(50) NOT NULL,
  `FactorNode` int(11) NOT NULL,
  `IndividualFactorPrivacyRisk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_factors`
--

INSERT INTO `tbl_factors` (`FactorID`, `FactorName`, `FactorNode`, `IndividualFactorPrivacyRisk`) VALUES
(1, 'Language', 1, 6),
(2, 'Basic Education', 1, 6),
(3, 'Basic Literacy', 1, 6),
(4, 'Socio-Economic Status', 1, 4),
(5, 'Device Used', 2, 4),
(6, 'Security Settings', 2, 9),
(7, 'Privacy Settings', 2, 9),
(8, 'Cyber awareness and training', 4, 9),
(9, 'Personal Identifiable Information (PII)', 6, 9),
(10, 'Characteristics of Data/Information', 6, 4),
(11, 'Privacy Laws', 5, 4),
(12, 'Privacy Policy', 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stsnodes`
--

CREATE TABLE `tbl_stsnodes` (
  `NodesID` int(50) NOT NULL,
  `NodesName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_stsnodes`
--

INSERT INTO `tbl_stsnodes` (`NodesID`, `NodesName`) VALUES
(1, 'People'),
(2, 'Technology'),
(3, 'Goals'),
(4, 'Culture'),
(5, 'Processes / Procedures'),
(6, 'Information');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_factorlevels`
--
ALTER TABLE `tbl_factorlevels`
  ADD PRIMARY KEY (`FactorLevelID`);

--
-- Indexes for table `tbl_factors`
--
ALTER TABLE `tbl_factors`
  ADD PRIMARY KEY (`FactorID`),
  ADD KEY `FactorNode` (`FactorNode`);

--
-- Indexes for table `tbl_stsnodes`
--
ALTER TABLE `tbl_stsnodes`
  ADD PRIMARY KEY (`NodesID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_factorlevels`
--
ALTER TABLE `tbl_factorlevels`
  MODIFY `FactorLevelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_factors`
--
ALTER TABLE `tbl_factors`
  MODIFY `FactorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_stsnodes`
--
ALTER TABLE `tbl_stsnodes`
  MODIFY `NodesID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_factors`
--
ALTER TABLE `tbl_factors`
  ADD CONSTRAINT `tbl_factors_ibfk_1` FOREIGN KEY (`FactorNode`) REFERENCES `tbl_stsnodes` (`NodesID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 05:48 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helth_care`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `AID` int(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nic` varchar(20) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `reportID` int(11) DEFAULT NULL,
  `sessionID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `DID` int(50) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `DocID` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`DID`, `LastName`, `FirstName`, `Email`, `Role`, `DocID`, `password`) VALUES
(1, 'Mallawa', 'Sandun', 'sandnm@gmail.com', 'eye', 'eye', '96655'),
(2, 'perera', 'janith', 'janithp@gmail.com', 'open', 'H112', '78945'),
(3, 'chamara', 'shonal', 'shonalcha@gmail.com', 'manager', '5689', '96548');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `HID` int(50) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `StreetNo` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Postalcode` varchar(255) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `AccNo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`HID`, `Name`, `StreetNo`, `City`, `Postalcode`, `Email`, `AccNo`) VALUES
(1, 'Nawaloka', '10', 'colombo', '772233', 'nawalokacolombo@gmail.com', 'HNB0022'),
(2, 'nawaloka', '18', 'Galle', '25112233', 'nawalokagalle@gmail.com', 'SAM008833');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_doctor`
--

CREATE TABLE `hospital_doctor` (
  `HID` int(11) NOT NULL,
  `DID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hospital_manager`
--

CREATE TABLE `hospital_manager` (
  `HMID` int(50) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `HospitalID` int(11) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `PID` int(50) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `StreetNo` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Postalcode` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PayID` int(50) NOT NULL,
  `cardName` varchar(255) DEFAULT NULL,
  `cardNo` int(20) DEFAULT NULL,
  `zipCode` int(11) DEFAULT NULL,
  `secCode` varchar(25) DEFAULT NULL,
  `hospitalID` int(11) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `RID` int(50) NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `sessions` int(11) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `SID` int(50) NOT NULL,
  `startTime` varchar(30) NOT NULL,
  `endTime` varchar(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `hospitalID` int(11) NOT NULL,
  `doctorID` int(11) NOT NULL,
  `noOfPatients` int(10) DEFAULT NULL,
  `patientLimit` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`SID`, `startTime`, `endTime`, `date`, `hospitalID`, `doctorID`, `noOfPatients`, `patientLimit`) VALUES
(1, '15.15', '17.00', '27.04.2020', 1, 1, 0, 30),
(2, '12.15', '17.00', '27.04.2020', 2, 3, 15, 30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`AID`),
  ADD KEY `reportID` (`reportID`),
  ADD KEY `sessionID` (`sessionID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DID`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`HID`);

--
-- Indexes for table `hospital_doctor`
--
ALTER TABLE `hospital_doctor`
  ADD PRIMARY KEY (`HID`,`DID`),
  ADD KEY `DID` (`DID`);

--
-- Indexes for table `hospital_manager`
--
ALTER TABLE `hospital_manager`
  ADD PRIMARY KEY (`HMID`),
  ADD KEY `FK_Hospital` (`HospitalID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PayID`),
  ADD KEY `hospitalID` (`hospitalID`),
  ADD KEY `patientID` (`patientID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`RID`),
  ADD KEY `sessions` (`sessions`),
  ADD KEY `patientID` (`patientID`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`SID`),
  ADD KEY `hospitalID` (`hospitalID`),
  ADD KEY `doctorID` (`doctorID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `AID` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `DID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `HID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hospital_manager`
--
ALTER TABLE `hospital_manager`
  MODIFY `HMID` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `PID` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PayID` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `RID` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `SID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`reportID`) REFERENCES `report` (`RID`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`sessionID`) REFERENCES `sessions` (`SID`) ON DELETE CASCADE;

--
-- Constraints for table `hospital_doctor`
--
ALTER TABLE `hospital_doctor`
  ADD CONSTRAINT `hospital_doctor_ibfk_1` FOREIGN KEY (`HID`) REFERENCES `hospital` (`HID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `hospital_doctor_ibfk_2` FOREIGN KEY (`DID`) REFERENCES `doctor` (`DID`) ON UPDATE CASCADE;

--
-- Constraints for table `hospital_manager`
--
ALTER TABLE `hospital_manager`
  ADD CONSTRAINT `FK_Hospital` FOREIGN KEY (`HospitalID`) REFERENCES `hospital` (`HID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`hospitalID`) REFERENCES `hospital` (`HID`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`patientID`) REFERENCES `patient` (`PID`) ON DELETE CASCADE;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`sessions`) REFERENCES `sessions` (`SID`) ON DELETE CASCADE,
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`patientID`) REFERENCES `patient` (`PID`) ON DELETE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`hospitalID`) REFERENCES `hospital` (`HID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sessions_ibfk_2` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`DID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

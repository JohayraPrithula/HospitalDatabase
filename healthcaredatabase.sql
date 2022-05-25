-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2021 at 07:52 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthcaredatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor informations`
--

CREATE TABLE `doctor informations` (
  `ID` int(100) NOT NULL,
  `Name` text NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `Age` int(11) NOT NULL,
  `Speciality` text NOT NULL,
  `Degrees` text NOT NULL,
  `Weekly Practice` text NOT NULL,
  `Practice Times` time NOT NULL,
  `Date of Birth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor informations`
--

INSERT INTO `doctor informations` (`ID`, `Name`, `Gender`, `Age`, `Speciality`, `Degrees`, `Weekly Practice`, `Practice Times`, `Date of Birth`) VALUES
(1, 'Antik Chowdhury', 'M', 65, 'Neurologist', 'MBBS', 'Sunday-Monday', '10:00:00', '1956-04-05'),
(2, 'Ayesha Tanzim', 'F', 23, 'Neurosergeon', 'MBBS', 'Friday-Saturday', '20:00:00', '1998-06-04'),
(3, 'Mahboob Jahan Ahmed\r\n', 'M', 59, 'Ophthalmology', 'MBBS/1983,MCPS(Ophthalmology)/2001,MS(Ophthalmology)/2002\r\n', 'Sunday-Wednesday', '15:00:00', '1962-10-15'),
(4, 'Bipad Bhanjan Karmakar', 'M', 53, 'Pediatrics', 'DCH(Pediatrics)/2002', 'Sunday-Thursday', '21:00:00', '1968-03-23'),
(5, 'Md. Shahid-ul-islam Khan\r\n', 'M', 26, 'Surgery', 'MBBS/2004,FCPS(Surgery)/2014', 'Friday-Saturday', '10:00:00', '1995-04-10'),
(6, 'Ayesha Julekha', 'F', 46, 'Orthopedic Surgery', 'MBBS(General Surgery)/2004', 'Thrusday-Sunday', '11:00:00', '1975-06-21'),
(7, 'Mst. Ilham Munira', 'F', 56, 'Obstetrics & Gynecology', 'MCPS(Obstetrics & Gynecology)/2014,MCPS(Obstetrics & Gynecology),S.S.C./1996,H.S.C./1998,MBBS/2004,MCPS(Obstetrics & Gynecology)/2014', 'Tuesday-Thursday', '18:00:00', '1965-08-06'),
(8, 'Md. Masud Rana', 'M', 26, 'Medical Officer', 'MBBS/2010\r\n', 'Saturday-Thursday', '22:00:00', '1995-06-17'),
(9, 'Md. Abul Ehsan', 'M', 53, 'Anesthesiology', 'MBBS/2007,DA/', 'Sunday', '14:00:00', '1968-01-29'),
(10, 'Rusab Sarmun', 'M', 23, 'Radiology', 'MBBS-2019, FRCS', 'Friday-Saturday', '10:00:00', '1998-03-29'),
(11, 'Humayra Zaman', 'F', 29, 'Cardiologist', 'MBBS(2013)', 'Monday', '09:00:00', '1991-08-06');

-- --------------------------------------------------------

--
-- Table structure for table `medicine informations`
--

CREATE TABLE `medicine informations` (
  `ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Available` text NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine informations`
--

INSERT INTO `medicine informations` (`ID`, `Name`, `Available`, `Quantity`, `Price`) VALUES
(1, 'Parcetamol', 'Yes', 15, 10),
(2, 'Alatrol', 'Yes', 63, 20),
(3, 'Napa', 'Yes', 140, 8),
(4, 'Ace', 'Yes', 78, 6),
(5, 'Omidon', 'No', 0, 15),
(6, 'Filmet', 'Yes', 50, 10),
(7, 'LK.50', 'Yes', 80, 25),
(8, 'D-Cold', 'Yes', 30, 70),
(9, 'Entacyd', 'Yes', 300, 15),
(10, 'Astragen', 'No', 0, 65);

-- --------------------------------------------------------

--
-- Table structure for table `patient informations`
--

CREATE TABLE `patient informations` (
  `ID` int(100) NOT NULL,
  `Name` text NOT NULL,
  `Date of Birth` date NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `Admission Date` date NOT NULL,
  `Sugery` text NOT NULL,
  `Attending Doctor` text NOT NULL,
  `Bill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient informations`
--

INSERT INTO `patient informations` (`ID`, `Name`, `Date of Birth`, `Gender`, `Admission Date`, `Sugery`, `Attending Doctor`, `Bill`) VALUES
(1, 'Rokeya Begum', '1995-05-02', 'F', '2021-01-15', 'N/A', 'Ayesha Tanzim', 2150),
(2, 'Jayba Nanjeeba', '2000-07-16', 'F', '2021-03-08', 'N/A', 'Mahbubul Haque', 1850),
(3, 'Rasel Muhammad', '1966-05-10', 'M', '2020-06-08', 'Open Heart Surgery', 'Humayra Zaman', 50890),
(4, 'Mabub Alam', '1988-05-07', 'M', '2020-07-23', 'Gall Bladder Stone Removal', 'Shahidul Islam', 30500),
(5, 'Malek Hassan', '1995-04-10', 'M', '2020-06-27', 'N/A', 'Abul Ehsan', 8500);

-- --------------------------------------------------------

--
-- Table structure for table `stuff informations`
--

CREATE TABLE `stuff informations` (
  `ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `Position` text NOT NULL,
  `Salary` int(11) NOT NULL,
  `Leaves` int(11) NOT NULL,
  `Date of Birth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stuff informations`
--

INSERT INTO `stuff informations` (`ID`, `Name`, `Gender`, `Position`, `Salary`, `Leaves`, `Date of Birth`) VALUES
(1, 'Aaditi Kumar', 'F', 'Nurse', 15000, 3, '1962-08-10'),
(2, 'Suparna Akter', 'F', 'Nurse', 15000, 7, '1979-08-06'),
(3, 'Rahim Alam', 'M', 'Cleaner', 5000, 5, '1955-08-06'),
(4, 'Ramjan Haque', 'M', 'Receptionist', 20000, 8, '1985-08-06'),
(5, 'Razia Khanom', 'F', 'Senior Nurse', 20000, 3, '1964-08-13'),
(6, 'Mahe Razzak', 'M', 'Cleaner', 5000, 7, '1975-06-21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor informations`
--
ALTER TABLE `doctor informations`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `medicine informations`
--
ALTER TABLE `medicine informations`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `patient informations`
--
ALTER TABLE `patient informations`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `stuff informations`
--
ALTER TABLE `stuff informations`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor informations`
--
ALTER TABLE `doctor informations`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `medicine informations`
--
ALTER TABLE `medicine informations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `patient informations`
--
ALTER TABLE `patient informations`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stuff informations`
--
ALTER TABLE `stuff informations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

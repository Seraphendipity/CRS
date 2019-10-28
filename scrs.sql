-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2019 at 08:10 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scrs`
--

-- --------------------------------------------------------

--
-- Table structure for table `acourses`
--

CREATE TABLE `acourses` (
  `id` int(11) NOT NULL,
  `bActive` tinyint(1) NOT NULL DEFAULT 1,
  `departmentId` int(11) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `icourses`
--

CREATE TABLE `icourses` (
  `id` int(11) NOT NULL,
  `bActive` tinyint(1) NOT NULL DEFAULT 0,
  `aCourseId` int(11) DEFAULT NULL,
  `semesterId` int(11) DEFAULT NULL,
  `sectionId` int(11) DEFAULT NULL,
  `instructorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `id` int(11) NOT NULL,
  `bActive` tinyint(1) DEFAULT 1,
  `firstName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `blazerName` varchar(255) DEFAULT NULL,
  `imageId` int(11) DEFAULT NULL,
  `dateBirth` date DEFAULT NULL,
  `dateEmploy` date NOT NULL DEFAULT current_timestamp(),
  `departmentId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` int(11) NOT NULL,
  `bActive` tinyint(1) NOT NULL DEFAULT 1,
  `iCourseId` int(11) DEFAULT NULL,
  `studentId` int(11) DEFAULT NULL,
  `dateRegister` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `timeStart` time DEFAULT NULL,
  `timeEnd` time DEFAULT NULL,
  `days` varchar(7) DEFAULT NULL COMMENT 'e.g. SMTWRFS',
  `code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` int(11) NOT NULL,
  `dateStart` date DEFAULT NULL,
  `dateEnd` date DEFAULT NULL,
  `initials` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `bActive` tinyint(1) NOT NULL DEFAULT 1,
  `firstName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `blazerName` varchar(255) DEFAULT NULL,
  `imageId` int(11) DEFAULT NULL,
  `dateBirth` date DEFAULT NULL,
  `dateEnroll` date NOT NULL DEFAULT current_timestamp(),
  `declaredMajorsIds` varchar(255) DEFAULT NULL,
  `declaredMinorsIds` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acourses`
--
ALTER TABLE `acourses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `icourses`
--
ALTER TABLE `icourses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CO-iCourse-aCourse` (`aCourseId`),
  ADD KEY `CO-iCourse-Semester` (`semesterId`),
  ADD KEY `CO-iCourse-Section` (`sectionId`),
  ADD KEY `CO-iCourse-Instructor` (`instructorId`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CO-Registration-iCourse` (`iCourseId`),
  ADD KEY `CO-Registration-Student` (`studentId`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `icourses`
--
ALTER TABLE `icourses`
  ADD CONSTRAINT `CO-iCourse-Instructor` FOREIGN KEY (`instructorId`) REFERENCES `instructors` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `CO-iCourse-Section` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `CO-iCourse-Semester` FOREIGN KEY (`semesterId`) REFERENCES `semesters` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `CO-iCourse-aCourse` FOREIGN KEY (`aCourseId`) REFERENCES `acourses` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `CO-Registration-Student` FOREIGN KEY (`studentId`) REFERENCES `students` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `CO-Registration-iCourse` FOREIGN KEY (`iCourseId`) REFERENCES `icourses` (`id`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

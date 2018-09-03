
-- Host: 127.0.0.1
-- Generation Time: jan 10, 2018 at 08:47 AM


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `adm_id` int(20) NOT NULL,
  `adm_name` varchar(100) NOT NULL,
  `adm_pass` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adm_id`, `adm_name`, `adm_pass`) VALUES
(1, 'admin', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
CREATE TABLE IF NOT EXISTS `application` (
  `apply_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `emp_id` int(20) DEFAULT NULL,
  `job_id` int(20) DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  `date_applied` varchar(20) NOT NULL,
  PRIMARY KEY (`apply_id`),
  KEY `user_id` (`user_id`),
  KEY `emp_id` (`emp_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `application`
--


-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
CREATE TABLE IF NOT EXISTS `employer` (
  `eid` int(20) NOT NULL AUTO_INCREMENT,
  `log_id` int(20) NOT NULL,
  `ename` varchar(100) DEFAULT NULL,
  `etype` varchar(100) DEFAULT NULL,
  `industry` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `executive` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `profile` varchar(700) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `log_id` (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `jobid` int(20) NOT NULL AUTO_INCREMENT,
  `eid` int(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `jobdesc` varchar(700) NOT NULL,
  `vacno` int(20) DEFAULT NULL,
  `experience` varchar(100) DEFAULT NULL,
  `basicpay` varchar(100) DEFAULT NULL,
  `fnarea` varchar(100) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `industry` varchar(200) DEFAULT NULL,
  `ugqual` varchar(100) DEFAULT NULL,
  `pgqual` varchar(100) DEFAULT NULL,
  `profile` varchar(700) DEFAULT NULL,
  `postdate` varchar(20) NOT NULL,
  PRIMARY KEY (`jobid`),
  KEY `eid` (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `jobseeker`
--

DROP TABLE IF EXISTS `jobseeker`;
CREATE TABLE IF NOT EXISTS `jobseeker` (
  `user_id` int(20) NOT NULL AUTO_INCREMENT,
  `log_id` int(20) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `experience` varchar(100) DEFAULT NULL,
  `skills` varchar(100) DEFAULT NULL,
  `basic_edu` varchar(100) DEFAULT NULL,
  `master_edu` varchar(100) DEFAULT NULL,
  `other_qual` varchar(100) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `Resume` varchar(100) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `log_id` (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobseeker`
--


-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `log_id` int(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `usertype` varchar(20) NOT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `email` (`email`),
  KEY `log_id` (`log_id`),
  KEY `log_id_2` (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

- --------------------------------------------------------

--
-- Table structure for table `selection`
--

DROP TABLE IF EXISTS `selection`;
CREATE TABLE IF NOT EXISTS `selection` (
  `sel_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `emp_id` int(20) DEFAULT NULL,
  `job_id` int(20) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`sel_id`),
  KEY `user_id` (`user_id`),
  KEY `emp_id` (`emp_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `fk_empid` FOREIGN KEY (`emp_id`) REFERENCES `employer` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_job` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`jobid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_userid` FOREIGN KEY (`user_id`) REFERENCES `jobseeker` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employer`
--
ALTER TABLE `employer`
  ADD CONSTRAINT `fk_log_id` FOREIGN KEY (`log_id`) REFERENCES `login` (`log_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `fk_eid` FOREIGN KEY (`eid`) REFERENCES `employer` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jobseeker`
--
ALTER TABLE `jobseeker`
  ADD CONSTRAINT `fk_login` FOREIGN KEY (`log_id`) REFERENCES `login` (`log_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `selection`
--
ALTER TABLE `selection`
  ADD CONSTRAINT `fk_emp` FOREIGN KEY (`emp_id`) REFERENCES `employer` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jobs` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`jobid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `jobseeker` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

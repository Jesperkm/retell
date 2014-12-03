-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 02, 2014 at 10:59 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `retell`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `albumID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`albumID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `categoriesID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `category` varchar(60) NOT NULL,
  PRIMARY KEY (`categoriesID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(60) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE IF NOT EXISTS `color` (
  `colorID` int(11) NOT NULL AUTO_INCREMENT,
  `colorName` varchar(60) NOT NULL,
  PRIMARY KEY (`colorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE IF NOT EXISTS `colors` (
  `colorsID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `colorID` int(11) NOT NULL,
  PRIMARY KEY (`colorsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `countryID` int(11) NOT NULL AUTO_INCREMENT,
  `countryName` varchar(60) NOT NULL,
  PRIMARY KEY (`countryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fair`
--

CREATE TABLE IF NOT EXISTS `fair` (
  `fairID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `fairName` varchar(60) NOT NULL,
  `fairDate` date NOT NULL,
  `country` varchar(60) NOT NULL,
  PRIMARY KEY (`fairID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE IF NOT EXISTS `holiday` (
  `seasonID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`seasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `manufactor`
--

CREATE TABLE IF NOT EXISTS `manufactor` (
  `manufactorID` int(11) NOT NULL AUTO_INCREMENT,
  `manufactorName` varchar(60) NOT NULL,
  PRIMARY KEY (`manufactorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `manufactors`
--

CREATE TABLE IF NOT EXISTS `manufactors` (
  `manufactorsID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `manufactors` varchar(60) NOT NULL,
  PRIMARY KEY (`manufactorsID`),
  KEY `productID` (`productID`),
  KEY `manufactorsID` (`manufactorsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE IF NOT EXISTS `material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material` varchar(120) NOT NULL,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE IF NOT EXISTS `materials` (
  `materialsID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `materials` varchar(60) NOT NULL,
  PRIMARY KEY (`materialsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `seasonID` int(11) NOT NULL,
  `product_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL,
  `tags` varchar(60) CHARACTER SET latin1 COLLATE latin1_danish_ci NOT NULL,
  `dato` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `countryArea` varchar(60) CHARACTER SET utf8 COLLATE utf8_danish_ci DEFAULT NULL,
  `fair` varchar(60) CHARACTER SET utf16 COLLATE utf16_danish_ci DEFAULT NULL,
  `material` varchar(60) CHARACTER SET utf8 COLLATE utf8_danish_ci DEFAULT NULL,
  `img` varchar(120) NOT NULL,
  `beskrivelse` varchar(360) NOT NULL,
  PRIMARY KEY (`productID`),
  KEY `seasonID` (`seasonID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `seasonID`, `product_name`, `tags`, `dato`, `countryArea`, `fair`, `material`, `img`, `beskrivelse`) VALUES
(34, 4, 'Koala', '', '2014-12-02 21:03:00', NULL, NULL, NULL, 'Koala.jpg', 'Koala desc'),
(35, 3, 'Lighthouse', '', '2014-12-02 21:05:45', NULL, NULL, NULL, 'Lighthouse.jpg', 'lighthouse desc'),
(36, 1, 'Pingviner', '', '2014-12-02 21:07:42', NULL, NULL, NULL, 'Penguins.jpg', 'Pingviner desc'),
(37, 2, 'Desert', '', '2014-12-02 21:07:51', NULL, NULL, NULL, 'Desert.jpg', 'desert desc');

-- --------------------------------------------------------

--
-- Table structure for table `producttags`
--

CREATE TABLE IF NOT EXISTS `producttags` (
  `productTagsID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `tags` varchar(60) NOT NULL,
  PRIMARY KEY (`productTagsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `season`
--

CREATE TABLE IF NOT EXISTS `season` (
  `seasonID` int(11) NOT NULL AUTO_INCREMENT,
  `season_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_danish_ci NOT NULL,
  PRIMARY KEY (`seasonID`),
  KEY `season_name` (`season_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `season`
--

INSERT INTO `season` (`seasonID`, `season_name`) VALUES
(4, 'Fall'),
(3, 'Spring'),
(2, 'Summer'),
(1, 'Winter');

-- --------------------------------------------------------

--
-- Stand-in structure for view `season_product_view`
--
CREATE TABLE IF NOT EXISTS `season_product_view` (
`productID` int(11)
,`product_name` varchar(60)
,`product_beskrivelse` varchar(360)
,`product_img` varchar(120)
,`season_name` varchar(30)
,`seasonID` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE IF NOT EXISTS `size` (
  `sizeID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `sizes` int(11) NOT NULL,
  PRIMARY KEY (`sizeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE IF NOT EXISTS `sizes` (
  `sizesID` int(11) NOT NULL AUTO_INCREMENT,
  `size_name` varchar(60) NOT NULL,
  PRIMARY KEY (`sizesID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `tagsID` int(11) NOT NULL AUTO_INCREMENT,
  `tagsName` varchar(60) NOT NULL,
  PRIMARY KEY (`tagsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `companyName` varchar(60) NOT NULL,
  `companyAdress` varchar(120) NOT NULL,
  `zipCode` int(10) NOT NULL,
  `city` varchar(60) NOT NULL,
  `country` varchar(60) NOT NULL,
  `phoneNumber` int(20) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for view `season_product_view`
--
DROP TABLE IF EXISTS `season_product_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `season_product_view` AS select `product`.`productID` AS `productID`,`product`.`product_name` AS `product_name`,`product`.`beskrivelse` AS `product_beskrivelse`,`product`.`img` AS `product_img`,`season`.`season_name` AS `season_name`,`season`.`seasonID` AS `seasonID` from (`product` join `season` on((`product`.`seasonID` = `season`.`seasonID`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`seasonID`) REFERENCES `season` (`seasonID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

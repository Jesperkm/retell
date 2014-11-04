-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Vært: 127.0.0.1
-- Genereringstid: 04. 11 2014 kl. 20:26:46
-- Serverversion: 5.6.17
-- PHP-version: 5.5.12

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
-- Struktur-dump for tabellen `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `albumID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`albumID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `categoriesID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `category` varchar(60) NOT NULL,
  PRIMARY KEY (`categoriesID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(60) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `color`
--

CREATE TABLE IF NOT EXISTS `color` (
  `colorID` int(11) NOT NULL AUTO_INCREMENT,
  `colorName` varchar(60) NOT NULL,
  PRIMARY KEY (`colorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `colors`
--

CREATE TABLE IF NOT EXISTS `colors` (
  `colorsID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `colorID` int(11) NOT NULL,
  PRIMARY KEY (`colorsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `countryID` int(11) NOT NULL AUTO_INCREMENT,
  `countryName` varchar(60) NOT NULL,
  PRIMARY KEY (`countryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `fair`
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
-- Struktur-dump for tabellen `holiday`
--

CREATE TABLE IF NOT EXISTS `holiday` (
  `seasonID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`seasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `holidayproducts`
--

CREATE TABLE IF NOT EXISTS `holidayproducts` (
  `HolidayProductsID` int(11) NOT NULL AUTO_INCREMENT,
  `seasonID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`HolidayProductsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `manufactor`
--

CREATE TABLE IF NOT EXISTS `manufactor` (
  `manufactorID` int(11) NOT NULL AUTO_INCREMENT,
  `manufactorName` varchar(60) NOT NULL,
  PRIMARY KEY (`manufactorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `manufactors`
--

CREATE TABLE IF NOT EXISTS `manufactors` (
  `manufactorsID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `manufactors` varchar(60) NOT NULL,
  PRIMARY KEY (`manufactorsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `material`
--

CREATE TABLE IF NOT EXISTS `material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material` varchar(120) NOT NULL,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `materials`
--

CREATE TABLE IF NOT EXISTS `materials` (
  `materialsID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `materials` varchar(60) NOT NULL,
  PRIMARY KEY (`materialsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_danish_ci DEFAULT NULL,
  `tags` varchar(60) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `countryArea` varchar(60) CHARACTER SET utf8 COLLATE utf8_danish_ci DEFAULT NULL,
  `fair` varchar(60) CHARACTER SET utf16 COLLATE utf16_danish_ci DEFAULT NULL,
  `material` varchar(60) CHARACTER SET utf8 COLLATE utf8_danish_ci DEFAULT NULL,
  `img` varchar(120) NOT NULL,
  `beskrivelse` varchar(360) DEFAULT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=141 ;

--
-- Data dump for tabellen `product`
--

INSERT INTO `product` (`productID`, `product_name`, `tags`, `date`, `countryArea`, `fair`, `material`, `img`, `beskrivelse`) VALUES
(136, NULL, NULL, '2014-11-04 19:18:09', NULL, NULL, NULL, 'bg.jpg', 'Hej jeg er en baggrund'),
(137, NULL, NULL, '2014-11-04 19:18:09', NULL, NULL, NULL, 'bg5.jpg', 'aseeaseaaseaes'),
(139, NULL, NULL, '2014-11-04 19:18:09', NULL, NULL, NULL, 'mustache-web.jpeg', 'im a mustache'),
(140, NULL, NULL, '2014-11-04 19:18:34', NULL, NULL, NULL, 'forside.png', 'aseaseseaeaseease');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `producttags`
--

CREATE TABLE IF NOT EXISTS `producttags` (
  `productTagsID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `tags` varchar(60) NOT NULL,
  PRIMARY KEY (`productTagsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `season`
--

CREATE TABLE IF NOT EXISTS `season` (
  `seasonID` int(11) NOT NULL AUTO_INCREMENT,
  `season_name` varchar(60) NOT NULL,
  `season_products` int(11) NOT NULL,
  PRIMARY KEY (`seasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `seasonproducts`
--

CREATE TABLE IF NOT EXISTS `seasonproducts` (
  `Season ProductsID` int(11) NOT NULL AUTO_INCREMENT,
  `seasonID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`Season ProductsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `size`
--

CREATE TABLE IF NOT EXISTS `size` (
  `sizeID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `sizes` int(11) NOT NULL,
  PRIMARY KEY (`sizeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `sizes`
--

CREATE TABLE IF NOT EXISTS `sizes` (
  `sizesID` int(11) NOT NULL AUTO_INCREMENT,
  `size_name` varchar(60) NOT NULL,
  PRIMARY KEY (`sizesID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `tagsID` int(11) NOT NULL AUTO_INCREMENT,
  `tagsName` varchar(60) NOT NULL,
  PRIMARY KEY (`tagsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `user`
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2025 at 05:23 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paramparaevents`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `Booking_ID` int(11) NOT NULL,
  `BookingDate` date NOT NULL,
  `BookingStatus` enum('Pending','Confirmed','Cancelled') NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Venue_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bookingservice`
--

CREATE TABLE `bookingservice` (
  `Booking_ID` int(11) NOT NULL,
  `Service_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone_Number` varchar(30) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` varchar(255) NOT NULL DEFAULT 'Customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `Username`, `Email`, `Phone_Number`, `Password`, `Role`) VALUES
(2, 'katyani', 'katyani@gmail.com', '9861819546', 'TTbXlIcIJoVARPQnHbngi6oGCiaKhRHQQrxI64NZPeqJnFiugY1vx0uLNx2r7kTgqtbFhampbw==', 'Customer'),
(3, 'sneha', 'sneha@gmail.com', '9876543210', 'pI0QxRaPwzFq/pVonf6e2qSbBj/WxV6leUSUR4VEAv03o435Og6LxNGgGeue9j0o/Lizdhc=', 'admin'),
(14, 'sneha', 'pragunmaskeyofficial@gmail.com', '9861819546', 'gtNF5eznwadR7nTlfUwKCXtp3NLWW9zIjKNsA2VuwI8xqBqVm9ksynLKVODurXDUP1MCofo=', 'Customer'),
(16, 'Krijalasdf', 'krijal@gmail.com', '9876543211', 'z/0XMl8YPHfkkht9PyCOW2Qro2nQl5RnKHqJeEYj57UMBehfzgVd0hIzdknYZy2JwZEdUgsE', 'Customer'),
(17, 'maskey', 'pragunmaskeyofficial@gmail.com', '9876543211', 'xUpdEzCXWn+gmSKyyi6mV4Y1viXZStpxw8X3kb5bnOF9Jil/DX/0YRRMeCe4kmViVpA+AbTp', 'Customer'),
(19, 'maskey', 'pragunmaskeyofficial@gmail.com', '9876543211', 'BGron4PRZvKFXQqJq+QcNj2o/7LpmI1y3J81NlcgPeU8lZXNQ+AviEFjwdhKUr7r0zyi/Qo1', 'Customer'),
(20, 'santosh', 'santosh@gmail.com', '9876543211', '7+wVoj02Tw4ZT0EZVAW8OoujbBYfeEyuKd9MFqD96LSsmwDEfgV4W+LMzPIJoNPr2qsVA9XIkw==', 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `customerbooking`
--

CREATE TABLE `customerbooking` (
  `Customer_ID` int(11) NOT NULL,
  `Booking_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL,
  `PaymentDate` date NOT NULL,
  `PaymentMethod` enum('Credit Card','Debit Card','cash','Online') NOT NULL,
  `PaymentAmount` decimal(10,2) NOT NULL,
  `PaymentStatus` enum('Pending','Completed','Failed') NOT NULL,
  `Booking_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `Review_ID` int(11) NOT NULL,
  `ReviewText` text NOT NULL,
  `Rating` int(11) NOT NULL,
  `ReviewDate` date NOT NULL,
  `Booking_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `Service_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Cost` int(15) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `ServiceTags` text NOT NULL,
  `ImgPath` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`Service_ID`, `Name`, `Description`, `Cost`, `Type`, `ServiceTags`, `ImgPath`) VALUES
(1, 'Beach Venue', 'Sukute Beach', 25000, 'Venue', 'Beach, Riverside, Open', 'dhaka.png'),
(2, 'Alice', 'Big stage area and production.', 60000, 'Venue', 'Indoor, Big', 'dhaka.png'),
(3, 'Photography', 'Professional wedding and event photography', 15000, 'Service', 'Photography,Candid', 'photo.png'),
(4, 'DJ Setup', 'Full sound and DJ setup for parties', 12000, 'Service', 'Music,Party', 'dj.png'),
(5, 'Decoration', 'Theme-based event decorations', 18000, 'Service', 'Decoration,Theme', 'decor.png');

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `Venue_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` text NOT NULL,
  `Capacity` int(11) NOT NULL,
  `Facilities` text NOT NULL,
  `Availability` varchar(50) NOT NULL,
  `VenueTags` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`Venue_ID`, `Name`, `Address`, `Capacity`, `Facilities`, `Availability`, `VenueTags`) VALUES
(1, 'Royal Banquet', 'Kathmandu, Nepal', 500, 'AC, Parking, Catering', '1', 'Luxury,Indoor'),
(2, 'Garden Retreat', 'Pokhara, Lakeside', 300, 'Garden, Stage, Catering', '1', 'Outdoor,Nature'),
(3, 'Sunrise Palace', 'Bhaktapur, Nepal', 200, 'Indoor, Music System, Generator', '1', 'Classic,Indoor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Booking_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Venue_ID` (`Venue_ID`);

--
-- Indexes for table `bookingservice`
--
ALTER TABLE `bookingservice`
  ADD PRIMARY KEY (`Booking_ID`,`Service_ID`),
  ADD KEY `Service_ID` (`Service_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `customerbooking`
--
ALTER TABLE `customerbooking`
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Booking_ID` (`Booking_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Booking_ID` (`Booking_ID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Review_ID`),
  ADD KEY `Booking_ID` (`Booking_ID`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`Service_ID`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`Venue_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `Booking_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `Review_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `Service_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `Venue_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Venue_ID`) REFERENCES `venue` (`Venue_ID`);

--
-- Constraints for table `bookingservice`
--
ALTER TABLE `bookingservice`
  ADD CONSTRAINT `bookingservice_ibfk_1` FOREIGN KEY (`Booking_ID`) REFERENCES `booking` (`Booking_ID`),
  ADD CONSTRAINT `bookingservice_ibfk_2` FOREIGN KEY (`Service_ID`) REFERENCES `service` (`Service_ID`);

--
-- Constraints for table `customerbooking`
--
ALTER TABLE `customerbooking`
  ADD CONSTRAINT `customerbooking_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `customerbooking_ibfk_2` FOREIGN KEY (`Booking_ID`) REFERENCES `booking` (`Booking_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Booking_ID`) REFERENCES `booking` (`Booking_ID`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`Booking_ID`) REFERENCES `booking` (`Booking_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

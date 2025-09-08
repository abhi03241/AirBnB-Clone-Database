# ************************************************************
# Antares - SQL Client
# Version 0.7.35
# 
# https://antares-sql.app/
# https://github.com/antares-sql/antares
# 
# Host: 127.0.0.1 (MySQL Community Server - GPL 8.0.43)
# Database: AirBnB_Clone
# Generation time: 2025-09-08T15:35:52+05:30
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table BOOKINGS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `BOOKINGS`;

CREATE TABLE `BOOKINGS` (
  `bookingId` int NOT NULL,
  `guestId` int NOT NULL,
  `listingId` int NOT NULL,
  `checkInDate` date NOT NULL,
  `checkOutDate` date NOT NULL,
  `no_of_guest` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`bookingId`),
  CONSTRAINT `BOOKINGS_chk_1` CHECK ((`no_of_guest` > 0)),
  CONSTRAINT `BOOKINGS_chk_2` CHECK ((`status` in (_utf8mb4'pending',_utf8mb4'confirmed',_utf8mb4'completed',_utf8mb4'cancelled')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `BOOKINGS` WRITE;
/*!40000 ALTER TABLE `BOOKINGS` DISABLE KEYS */;

INSERT INTO `BOOKINGS` (`bookingId`, `guestId`, `listingId`, `checkInDate`, `checkOutDate`, `no_of_guest`, `total_price`, `status`) VALUES
	(301, 104, 201, "2025-09-10", "2025-09-12", 2, 2400, "confirmed"),
	(302, 105, 202, "2025-09-15", "2025-09-18", 4, 15000, "pending"),
	(303, 106, 203, "2025-09-20", "2025-09-23", 2, 9000, "completed"),
	(304, 107, 204, "2025-09-25", "2025-09-26", 1, 800, "cancelled"),
	(305, 108, 205, "2025-09-28", "2025-09-30", 2, 3000, "completed"),
	(306, 109, 206, "2025-10-02", "2025-10-05", 3, 21000, "confirmed"),
	(307, 110, 207, "2025-10-07", "2025-10-09", 1, 2000, "pending"),
	(308, 104, 208, "2025-10-12", "2025-10-15", 5, 13500, "completed"),
	(309, 105, 209, "2025-10-18", "2025-10-21", 4, 24000, "confirmed"),
	(310, 106, 210, "2025-10-25", "2025-10-26", 1, 1000, "completed");

/*!40000 ALTER TABLE `BOOKINGS` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table EXPERIENCE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EXPERIENCE`;

CREATE TABLE `EXPERIENCE` (
  `experienceId` int NOT NULL AUTO_INCREMENT,
  `hostId` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `max_group_size` int DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `images` varchar(500) DEFAULT NULL,
  `categories` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`experienceId`),
  KEY `hostId` (`hostId`),
  CONSTRAINT `EXPERIENCE_ibfk_1` FOREIGN KEY (`hostId`) REFERENCES `USERS` (`userId`),
  CONSTRAINT `EXPERIENCE_chk_1` CHECK ((`max_group_size` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `EXPERIENCE` WRITE;
/*!40000 ALTER TABLE `EXPERIENCE` DISABLE KEYS */;

INSERT INTO `EXPERIENCE` (`experienceId`, `hostId`, `title`, `description`, `city`, `country`, `language`, `max_group_size`, `price`, `images`, `categories`) VALUES
	(501, 101, "Old City Tour", "Guided walk through heritage sites", "Jaipur", "India", "en", 10, 800, "[\"tour1.jpg\"]", "culture,history"),
	(502, 101, "Cooking Class", "Learn traditional Indian food", "Delhi", "India", "en", 6, 1500, "[\"cook1.jpg\"]", "food,culture"),
	(503, 102, "Trekking Adventure", "Guided trek in Himalayas", "Manali", "India", "en", 12, 2000, "[\"trek1.jpg\"]", "adventure,nature"),
	(504, 102, "Yoga Retreat", "Morning yoga in the hills", "Rishikesh", "India", "en", 15, 1200, "[\"yoga.jpg\"]", "wellness"),
	(505, 103, "Beach Party", "Evening party on the beach", "Goa", "India", "en", 30, 2500, "[\"beachparty.jpg\"]", "fun,nightlife"),
	(506, 103, "Scuba Diving", "Explore underwater life", "Goa", "India", "en", 8, 3500, "[\"scuba.jpg\"]", "adventure,water"),
	(507, 101, "Cycling Tour", "Cycle through pink city", "Jaipur", "India", "en", 20, 600, "[\"cycle.jpg\"]", "adventure,city"),
	(508, 102, "Snow Camping", "Camp under snowy mountains", "Manali", "India", "en", 10, 3000, "[\"snowcamp.jpg\"]", "adventure"),
	(509, 103, "Cooking Seafood", "Learn Goan seafood dishes", "Goa", "India", "en", 6, 1800, "[\"seafood.jpg\"]", "food"),
	(510, 101, "Temple Tour", "Visit ancient temples", "Khajuraho", "India", "en", 15, 1000, "[\"temple.jpg\"]", "culture,history");

/*!40000 ALTER TABLE `EXPERIENCE` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table LISTINGS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LISTINGS`;

CREATE TABLE `LISTINGS` (
  `listingId` int NOT NULL,
  `hostId` int DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `accomodation` varchar(20) NOT NULL,
  `amenities` varchar(500) DEFAULT NULL,
  `availability` varchar(10) DEFAULT NULL,
  `max_no_guest` int DEFAULT NULL,
  `images` varchar(500) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency` char(3) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`listingId`),
  KEY `hostId` (`hostId`),
  CONSTRAINT `LISTINGS_ibfk_1` FOREIGN KEY (`hostId`) REFERENCES `USERS` (`userId`),
  CONSTRAINT `LISTINGS_chk_1` CHECK ((`accomodation` in (_utf8mb4'room',_utf8mb4'entire home',_utf8mb4'all'))),
  CONSTRAINT `LISTINGS_chk_2` CHECK ((`currency` in (_utf8mb4'USD',_utf8mb4'INR',_utf8mb4'CNY',_utf8mb4'EUR')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `LISTINGS` WRITE;
/*!40000 ALTER TABLE `LISTINGS` DISABLE KEYS */;

INSERT INTO `LISTINGS` (`listingId`, `hostId`, `title`, `description`, `location`, `accomodation`, `amenities`, `availability`, `max_no_guest`, `images`, `price`, `currency`, `city`, `country`) VALUES
	(201, 101, "Cozy Room", "Small cozy room with balcony", "MG Road", "room", "[\"wifi\",\"AC\"]", "Yes", 2, "[\"room1.jpg\"]", 1200, "INR", "Indore", "India"),
	(202, 101, "Luxury Villa", "Spacious villa with pool", "Palm Beach Road", "entire home", "[\"pool\",\"wifi\",\"kitchen\"]", "Yes", 6, "[\"villa1.jpg\"]", 5000, "INR", "Mumbai", "India"),
	(203, 102, "Mountain Cabin", "Wooden cabin in hills", "Manali Hills", "entire home", "[\"fireplace\",\"wifi\"]", "Yes", 4, "[\"cabin1.jpg\"]", 3000, "INR", "Manali", "India"),
	(204, 102, "Budget Room", "Affordable stay near station", "Civil Lines", "room", "[\"fan\",\"wifi\"]", "Yes", 2, "[\"room2.jpg\"]", 800, "INR", "Delhi", "India"),
	(205, 103, "Beach Hut", "Hut near the seashore", "Anjuna Beach", "room", "[\"wifi\",\"balcony\"]", "Yes", 2, "[\"hut1.jpg\"]", 1500, "INR", "Goa", "India"),
	(206, 103, "Penthouse Suite", "Top-floor luxury suite", "Banjara Hills", "entire home", "[\"AC\",\"wifi\",\"bar\"]", "Yes", 5, "[\"pent1.jpg\"]", 7000, "INR", "Hyderabad", "India"),
	(207, 101, "City Apartment", "Modern apartment in center", "Connaught Place", "room", "[\"AC\",\"wifi\"]", "Yes", 3, "[\"apt1.jpg\"]", 2000, "INR", "Delhi", "India"),
	(208, 102, "Heritage Haveli", "Stay in 18th century haveli", "Pink City", "entire home", "[\"wifi\",\"AC\"]", "Yes", 8, "[\"haveli.jpg\"]", 4500, "INR", "Jaipur", "India"),
	(209, 103, "Lake View Villa", "Villa with private lake view", "Dal Lake", "entire home", "[\"wifi\",\"boat\"]", "Yes", 6, "[\"lakevilla.jpg\"]", 6000, "INR", "Srinagar", "India"),
	(210, 101, "Studio Apartment", "Compact studio for solo stay", "MG Road", "room", "[\"AC\",\"wifi\"]", "Yes", 1, "[\"studio.jpg\"]", 1000, "INR", "Indore", "India");

/*!40000 ALTER TABLE `LISTINGS` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table REVIEWS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REVIEWS`;

CREATE TABLE `REVIEWS` (
  `reviewId` int NOT NULL,
  `bookingId` int NOT NULL,
  `userId` int NOT NULL,
  `listingId` int NOT NULL,
  `ratings` tinyint NOT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `reviewDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reviewId`),
  KEY `fk_reviews_booking` (`bookingId`),
  KEY `fk_reviews_user` (`userId`),
  KEY `fk_reviews_listing` (`listingId`),
  CONSTRAINT `fk_reviews_booking` FOREIGN KEY (`bookingId`) REFERENCES `BOOKINGS` (`bookingId`),
  CONSTRAINT `fk_reviews_listing` FOREIGN KEY (`listingId`) REFERENCES `LISTINGS` (`listingId`),
  CONSTRAINT `fk_reviews_user` FOREIGN KEY (`userId`) REFERENCES `USERS` (`userId`),
  CONSTRAINT `REVIEWS_chk_1` CHECK ((`ratings` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `REVIEWS` WRITE;
/*!40000 ALTER TABLE `REVIEWS` DISABLE KEYS */;

INSERT INTO `REVIEWS` (`reviewId`, `bookingId`, `userId`, `listingId`, `ratings`, `comments`, `reviewDate`) VALUES
	(401, 301, 104, 201, 5, "Amazing cozy room!", "2025-09-05 00:00:00"),
	(402, 302, 105, 202, 4, "Villa was great, check-in delayed.", "2025-09-05 00:00:00"),
	(403, 303, 106, 203, 5, "Cabin was peaceful and scenic.", "2025-09-05 00:00:00"),
	(404, 304, 107, 204, 2, "Room not very clean.", "2025-09-05 00:00:00"),
	(405, 305, 108, 205, 4, "Loved the beach hut experience.", "2025-09-05 00:00:00"),
	(406, 306, 109, 206, 5, "Penthouse was luxurious!", "2025-09-05 00:00:00"),
	(407, 307, 110, 207, 3, "Apartment was okay for solo stay.", "2025-09-05 00:00:00"),
	(408, 308, 104, 208, 5, "Heritage haveli was beautiful.", "2025-09-05 00:00:00"),
	(409, 309, 105, 209, 5, "Lake villa view was stunning.", "2025-09-05 00:00:00"),
	(410, 310, 106, 210, 4, "Studio was compact but nice.", "2025-09-05 00:00:00");

/*!40000 ALTER TABLE `REVIEWS` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table USERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USERS`;

CREATE TABLE `USERS` (
  `userId` int NOT NULL,
  `emailID` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phno` varchar(20) DEFAULT NULL,
  `bio` varchar(50) DEFAULT NULL,
  `userType` varchar(10) NOT NULL,
  `language` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `USERS_chk_1` CHECK ((`userType` in (_utf8mb4'host',_utf8mb4'guest')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;

INSERT INTO `USERS` (`userId`, `emailID`, `name`, `phno`, `bio`, `userType`, `language`, `password`) VALUES
	(101, "host1@example.com", "Ravi Host", "9876543210", "Love hosting people!", "host", "en", "pwd101"),
	(102, "host2@example.com", "Sneha Host", "9123456780", "Mountain cabins expert", "host", "en", "pwd102"),
	(103, "host3@example.com", "Amit Host", "9988776655", "Beachside villas owner", "host", "en", "pwd103"),
	(104, "guest1@example.com", "Anita Guest", "9000000001", "Traveler and foodie", "guest", "en", "pwd104"),
	(105, "guest2@example.com", "John Guest", "9000000002", "Backpacker from US", "guest", "en", "pwd105"),
	(106, "guest3@example.com", "Priya Guest", "9000000003", "Love heritage stays", "guest", "en", "pwd106"),
	(107, "guest4@example.com", "Alex Guest", "9000000004", "Tech nomad", "guest", "en", "pwd107"),
	(108, "guest5@example.com", "Sara Guest", "9000000005", "Exploring India", "guest", "en", "pwd108"),
	(109, "guest6@example.com", "Raj Guest", "9000000006", "Budget traveler", "guest", "en", "pwd109"),
	(110, "guest7@example.com", "Emily Guest", "9000000007", "Adventure seeker", "guest", "en", "pwd110");

/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of views
# ------------------------------------------------------------

# Creating temporary tables to overcome VIEW dependency errors


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# Dump completed on 2025-09-08T15:35:52+05:30

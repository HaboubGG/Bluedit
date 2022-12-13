-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 11 déc. 2022 à 15:25
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `todo`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `comment` text NOT NULL,
  `postId` int(11) NOT NULL,
  `commentedBy` text NOT NULL,
  `commentDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `commentedByImage` varchar(300) NOT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`comment`, `postId`, `commentedBy`, `commentDate`, `commentId`, `commentedByImage`) VALUES
('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus labore, voluptatem reiciendis quod illum quos. Expedita atque, voluptatum voluptatibus, iure illum tenetur fugit neque eveniet earum doloribus saepe, incidunt sunt.', 204, 'Taher', '2022-12-10 13:48:43', 53, 'FjkkdmPWAAMtdK0.jpg'),
('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus labore, voluptatem reiciendis quod illum quos. Expedita atque, voluptatum voluptatibus, iure illum tenetur fugit neque eveniet earum doloribus saepe, incidunt sunt.', 200, 'Taher', '2022-12-10 13:48:47', 54, 'FjkkdmPWAAMtdK0.jpg'),
('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus labore, voluptatem reiciendis quod illum quos. Expedita atque, voluptatum voluptatibus, iure illum tenetur fugit neque eveniet earum doloribus saepe, incidunt sunt.', 204, 'med habib', '2022-12-10 13:49:44', 55, 'default_pic.png'),
('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus labore, voluptatem reiciendis quod illum quos. Expedita atque, voluptatum voluptatibus, iure illum tenetur fugit neque eveniet earum doloribus saepe, incidunt sunt.', 207, 'flen', '2022-12-10 13:51:00', 56, 'meme2.jpg'),
('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus labore, voluptatem reiciendis quod illum quos. Expedita atque, voluptatum voluptatibus, iure illum tenetur fugit neque eveniet earum doloribus saepe, incidunt sunt.', 209, 'Dsi21', '2022-12-10 13:58:50', 57, 'FjkkdmPWAAMtdK0.jpg'),
('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus labore, voluptatem reiciendis quod illum quos. Expedita atque, voluptatum voluptatibus, iure illum tenetur fugit neque eveniet earum doloribus saepe, incidunt sunt.', 205, 'Dsi21', '2022-12-10 13:58:55', 58, 'FjkkdmPWAAMtdK0.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `jaimeverif`
--

DROP TABLE IF EXISTS `jaimeverif`;
CREATE TABLE IF NOT EXISTS `jaimeverif` (
  `postId` int(100) NOT NULL,
  `userId` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `jaimeverif`
--

INSERT INTO `jaimeverif` (`postId`, `userId`) VALUES
(123, 35),
(122, 35),
(121, 35),
(120, 35),
(124, 35),
(131, 35),
(131, 31),
(130, 31),
(133, 31),
(133, 35),
(130, 35),
(130, 36),
(133, 36),
(131, 36),
(129, 36),
(134, 38),
(129, 38),
(131, 38),
(130, 38),
(135, 38),
(135, 35),
(135, 31),
(136, 35),
(134, 35),
(140, 41),
(141, 41),
(142, 41),
(143, 41),
(138, 41),
(138, 42),
(144, 42),
(144, 41),
(143, 42),
(141, 42),
(145, 42),
(147, 42),
(148, 42),
(149, 42),
(150, 42),
(151, 42),
(153, 42),
(154, 42),
(142, 42),
(154, 41),
(155, 43),
(154, 43),
(138, 43),
(140, 43),
(154, 44),
(156, 44),
(175, 41),
(196, 45),
(199, 45),
(197, 45),
(200, 48),
(201, 48),
(202, 48),
(203, 49),
(202, 49),
(201, 49),
(200, 49),
(204, 49),
(204, 48),
(206, 50),
(204, 50),
(205, 50),
(200, 50),
(201, 50),
(210, 51),
(208, 51),
(209, 51),
(201, 51),
(211, 51),
(207, 51),
(205, 51),
(205, 52),
(207, 52),
(201, 52),
(209, 52),
(212, 52);

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `userIdNotification` int(100) NOT NULL,
  `notificationType` int(100) NOT NULL,
  `notificationByName` text NOT NULL,
  `NotificationId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`NotificationId`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `notification`
--

INSERT INTO `notification` (`userIdNotification`, `notificationType`, `notificationByName`, `NotificationId`) VALUES
(48, 1, 'flen', 48),
(48, 1, 'flen', 47),
(49, 1, 'flen', 46),
(50, 1, 'flen', 45),
(49, 1, 'med habib', 44),
(49, 0, 'med habib', 43),
(49, 1, 'Taher', 42),
(48, 0, 'Taher', 41),
(49, 0, 'Taher', 40),
(48, 1, 'Taher', 39),
(48, 1, 'Taher', 38),
(48, 1, 'Taher', 37),
(49, 1, 'Taher', 36),
(48, 1, 'med habib', 35),
(48, 1, 'med habib', 34),
(48, 1, 'med habib', 33),
(50, 0, 'flen', 49),
(48, 1, 'flen', 50),
(51, 1, 'artist', 51),
(50, 1, 'artist', 52),
(51, 1, 'artist', 53),
(48, 1, 'artist', 54),
(51, 1, 'artist', 55),
(50, 1, 'artist', 56),
(48, 1, 'artist', 57),
(48, 1, 'Dsi21', 58),
(50, 1, 'Dsi21', 59),
(48, 1, 'Dsi21', 60),
(51, 1, 'Dsi21', 61),
(51, 0, 'Dsi21', 62),
(48, 0, 'Dsi21', 63),
(52, 1, 'Dsi21', 64);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `description` text NOT NULL,
  `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
  `postDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `postPhoto` varchar(100) NOT NULL,
  `postedBy` text NOT NULL,
  `postedById` int(100) NOT NULL,
  `jaime` int(100) NOT NULL DEFAULT '0',
  `postedByImage` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`description`, `id`, `postDate`, `postPhoto`, `postedBy`, `postedById`, `jaime`, `postedByImage`) VALUES
('âœ¨NEW updates coming to Facebook Groupsâœ¨ You can now create Reels in Groups to connect with others in a creative way, use new tools in Admin Assist to further support and build your communities, and so much more. Check out all the features here:', 200, '2022-12-10 13:50:28', 'bonV3GYB.jpg', 'med habib', 48, 3, 'default_pic.png'),
('For all our fans , share with us your favorite moment of our team or player during the IAC prestige Matches #IAC2022 #PlayForIAC #LEIP22', 201, '2022-12-10 13:58:41', 'Mona_Lisa-restored.jpg', 'med habib', 48, 5, 'default_pic.png'),
('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus labore, voluptatem reiciendis quod illum quos. Expedita atque, voluptatum voluptatibus, iure illum tenetur fugit neque eveniet earum doloribus saepe, incidunt sunt.\r\n\r\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus labore, voluptatem reiciendis quod illum quos. Expedita atque, voluptatum voluptatibus, iure illum tenetur fugit neque eveniet earum doloribus saepe, incidunt sunt.\r\n', 202, '2022-12-10 13:48:15', 'FjkkdmPWAAMtdK0.jpg', 'med habib', 48, 2, 'default_pic.png'),
('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus labore, voluptatem reiciendis quod illum quos. Expedita atque, voluptatum voluptatibus, iure illum tenetur fugit neque eveniet earum doloribus saepe, incidunt sunt.\r\n', 203, '2022-12-10 13:48:13', '308267565_846856183013700_5917099368450062726_n.jpg', 'Taher', 49, 1, 'FjkkdmPWAAMtdK0.jpg'),
('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus labore, voluptatem reiciendis quod illum quos. Expedita atque, voluptatum voluptatibus, iure illum tenetur fugit neque eveniet earum doloribus saepe, incidunt sunt.\r\n', 204, '2022-12-10 13:50:22', '', 'Taher', 49, 3, 'FjkkdmPWAAMtdK0.jpg'),
('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus labore, voluptatem reiciendis quod illum quos. Expedita atque, voluptatum voluptatibus, iure illum tenetur fugit neque eveniet earum doloribus saepe, incidunt sunt.\r\n', 205, '2022-12-10 13:58:37', '39-390702_gaming-thumbnail-background-hd.jpg', 'med habib', 48, 3, 'default_pic.png'),
('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus labore, voluptatem reiciendis quod illum quos. Expedita atque, voluptatum voluptatibus, iure illum tenetur fugit neque eveniet earum doloribus saepe, incidunt sunt.\r\n', 206, '2022-12-10 13:50:20', '67-672684_cs-go-wallpaper-4k.ico', 'flen', 50, 1, 'default_pic.png'),
('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus labore, voluptatem reiciendis quod illum quos. Expedita atque, voluptatum voluptatibus, iure illum tenetur fugit neque eveniet earum doloribus saepe, incidunt sunt.\r\n', 207, '2022-12-10 13:58:39', 'child_night_tree_129606_3840x2160.jpg', 'flen', 50, 2, 'meme2.jpg'),
('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus labore, voluptatem reiciendis quod illum quos. Expedita atque, voluptatum voluptatibus, iure illum tenetur fugit neque eveniet earum doloribus saepe, incidunt sunt.\r\n', 208, '2022-12-10 13:54:38', 'Haboub_queen_elizabeth_9317a61e-b4f6-40d8-9353-613b7cb2c9cd.png', 'flen', 50, 1, 'meme2.jpg'),
('\r\nHello ', 209, '2022-12-10 13:58:44', 'unnamed.jpg', 'artist', 51, 2, 'Haboub_chedi_rojla_39bcc055-71e3-4a65-b771-4420d0485103.png'),
('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus labore, voluptatem reiciendis quod illum quos. Expedita atque, voluptatum voluptatibus, iure illum tenetur fugit neque eveniet earum doloribus saepe, incidunt sunt.\r\n', 210, '2022-12-10 13:54:36', 'radical-art-of-young-people.jpg', 'artist', 51, 1, 'Haboub_chedi_rojla_39bcc055-71e3-4a65-b771-4420d0485103.png'),
('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus labore, voluptatem reiciendis quod illum quos. Expedita atque, voluptatum voluptatibus, iure illum tenetur fugit neque eveniet earum doloribus saepe, incidunt sunt.\r\n', 211, '2022-12-10 13:55:18', '', 'artist', 51, 1, 'Haboub_chedi_rojla_39bcc055-71e3-4a65-b771-4420d0485103.png'),
('Good Morning Students', 212, '2022-12-10 14:25:16', 'radical-art-of-young-people.jpg', 'Dsi21', 52, 1, 'FjkkdmPWAAMtdK0.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email` text NOT NULL,
  `picture` varchar(300) NOT NULL DEFAULT 'default_pic.png',
  `organisation` text,
  `location` text,
  `phone` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `date`, `email`, `picture`, `organisation`, `location`, `phone`) VALUES
(48, 'med habib', '$2y$10$kO9myChlNcG5HfoLSNV0beqj8cGMs/aMHBcExjavebT0FZWSXI2Aq', '2022-12-11 15:21:23', 'dhaouadimedhbib@gmail.com', 'default_pic.png', '', '', ''),
(49, 'Taher', '$2y$10$Ah9awq4HlfDzGFTICyuhfOP6c5Pg4vn6Z8hdtUVPhgZw2jYy9/dAi', '2022-12-10 13:48:00', 'taher@gmail.com', 'FjkkdmPWAAMtdK0.jpg', NULL, NULL, NULL),
(50, 'flen', '$2y$10$mGQ257s6vTKnpudJ5uJ3Gu515IvDsX93Ux138lWA9rHJzwwhoUGv6', '2022-12-10 13:51:24', 'flen@gmail.com', 'meme2.jpg', 'habibOrganization', 'bizerte', ''),
(51, 'artist', '$2y$10$FMSn4jQm7zAA.6nxFi7qJOm/rmWN2TB6PCgcFsgrr8qwtW.kFGgMe', '2022-12-10 13:53:15', 'artist@gmail.com', 'Haboub_chedi_rojla_39bcc055-71e3-4a65-b771-4420d0485103.png', NULL, NULL, NULL),
(52, 'Dsi21', '$2y$10$IOindZUWQ3ylQZgVFvbBmu9.W52p.dVqyk5BKxYjI.bV4E4QRNPNu', '2022-12-10 13:58:18', 'Dsi21@gmail.com', 'FjkkdmPWAAMtdK0.jpg', NULL, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 28 jan. 2021 à 08:38
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `immob`
--

-- --------------------------------------------------------

--
-- Structure de la table `bien`
--

DROP TABLE IF EXISTS `bien`;
CREATE TABLE IF NOT EXISTS `bien` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` int(11) NOT NULL,
  `typebien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periode` date NOT NULL,
  `etat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_45EDC386A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bien`
--

INSERT INTO `bien` (`id`, `description`, `prix`, `typebien`, `periode`, `etat`, `statut`, `user_id`) VALUES
(1, 'ff', 78, 'Chambre', '2016-01-01', 'f', 'depublier', 3);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210114082341', '2021-01-27 13:55:34', 76),
('DoctrineMigrations\\Version20210120162217', '2021-01-27 13:55:34', 22),
('DoctrineMigrations\\Version20210124152747', '2021-01-27 13:55:56', 65),
('DoctrineMigrations\\Version20210124153334', '2021-01-27 13:55:56', 31),
('DoctrineMigrations\\Version20210124155747', '2021-01-27 13:56:16', 82),
('DoctrineMigrations\\Version20210124160425', '2021-01-27 13:56:16', 198),
('DoctrineMigrations\\Version20210124165025', '2021-01-27 13:56:16', 92),
('DoctrineMigrations\\Version20210125084235', '2021-01-27 13:56:16', 187);

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

DROP TABLE IF EXISTS `profil`;
CREATE TABLE IF NOT EXISTS `profil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `profil`
--

INSERT INTO `profil` (`id`, `libelle`) VALUES
(1, 'Gestionnaire'),
(2, 'Client'),
(3, 'Propriétaire');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profil_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  KEY `IDX_8D93D649275ED078` (`profil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `nom`, `prenom`, `adresse`, `profil_id`) VALUES
(1, 'Gestionnaire1d@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$ajNjTnZsQ29tRC54eXRYSA$J0RnMupQ7df3PyMshAoxx4vlxLxtW83jnOV4kjrd9Fw', 'daniel', 'Messan', 'Gueule Tapée', 1),
(2, 'Gestionnaire2d@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$amFsckhGRGtScTlhYXJURw$mwUXmCT3ksJCCnJbe4fVm1khoB8xrR4M9OFH/5spHI0', 'daniel', 'Messan', 'Gueule Tapée', 1),
(3, 'Client1d@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$VnFRMkNqUW1OYVNxdWhkMQ$4l8D6D3DQLBZFhkEfEYojZRQLvAP2G6ZP6FFmuopvDU', 'daniel', 'Messan', 'Gueule Tapée', 2),
(4, 'Client2d@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$TW1ibUlvai8wc1JTQWtuUA$TOgk6Z/d1YgUKbs9R0t8DnOGVV7oYExLSoJr1f5DOVI', 'daniel', 'Messan', 'Gueule Tapée', 2),
(5, 'Propriétaire1d@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$ZndVZG5kYVZiRWdGQU5jZw$cfLQK6LDZQysvhlQn7gLM/tzn+O/qniaXDHtquuMzwg', 'daniel', 'Messan', 'Gueule Tapée', 3),
(6, 'Propriétaire2d@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$eUV4VVhabnEwc3p5ZGxoQQ$O4niQyjsFefdPHkIBiMAjRGcRS7uFflK/Ue37gplNhU', 'daniel', 'Messan', 'Gueule Tapée', 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bien`
--
ALTER TABLE `bien`
  ADD CONSTRAINT `FK_45EDC386A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D649275ED078` FOREIGN KEY (`profil_id`) REFERENCES `profil` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 16, 2020 at 09:38 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminforum`
--

DROP TABLE IF EXISTS `adminforum`;
CREATE TABLE IF NOT EXISTS `adminforum` (
  `idadminForum` int(11) NOT NULL AUTO_INCREMENT,
  `adresseMail` varchar(45) COLLATE utf8_bin NOT NULL,
  `MotDePasse` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idadminForum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `appareil`
--

DROP TABLE IF EXISTS `appareil`;
CREATE TABLE IF NOT EXISTS `appareil` (
  `idAppareil` int(11) NOT NULL AUTO_INCREMENT,
  `NumCarte` int(11) DEFAULT NULL,
  `test_n°test` int(11) NOT NULL,
  PRIMARY KEY (`idAppareil`),
  KEY `fk_Appareil_test1` (`test_n°test`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `capteur`
--

DROP TABLE IF EXISTS `capteur`;
CREATE TABLE IF NOT EXISTS `capteur` (
  `n°capteur` int(11) NOT NULL AUTO_INCREMENT,
  `seuilMin` int(11) NOT NULL,
  `seuilMax` int(11) NOT NULL,
  `UniteMesure` varchar(45) COLLATE utf8_bin NOT NULL,
  `modeleCapteur` varchar(45) COLLATE utf8_bin NOT NULL,
  `Appareil_idAppareil` int(11) NOT NULL,
  PRIMARY KEY (`n°capteur`),
  KEY `fk_Capteur_Appareil1` (`Appareil_idAppareil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
CREATE TABLE IF NOT EXISTS `commentaires` (
  `idCommentaires` int(11) NOT NULL AUTO_INCREMENT,
  `contenuCommentaire` multilinestring NOT NULL,
  `topic_idTopic` int(11) NOT NULL,
  PRIMARY KEY (`idCommentaires`),
  KEY `fk_Commentaires_topic1` (`topic_idTopic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `entreprise`
--

DROP TABLE IF EXISTS `entreprise`;
CREATE TABLE IF NOT EXISTS `entreprise` (
  `idEntreprise` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) COLLATE utf8_bin NOT NULL,
  `adresse` varchar(45) COLLATE utf8_bin NOT NULL,
  `dateInscription` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idEntreprise`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `entreprise`
--

INSERT INTO `entreprise` (`idEntreprise`, `nom`, `adresse`, `dateInscription`) VALUES
(1, 'vejlab', '10 rue de vanves issy-les-moulineaux', '14/01/2020');

-- --------------------------------------------------------

--
-- Table structure for table `mesures`
--

DROP TABLE IF EXISTS `mesures`;
CREATE TABLE IF NOT EXISTS `mesures` (
  `Valeurs` int(11) NOT NULL,
  `Temps` datetime NOT NULL,
  `Capteur_n°capteur` int(11) NOT NULL,
  `Capteur_test_n°test` int(11) NOT NULL,
  PRIMARY KEY (`Temps`),
  KEY `fk_Mesures_Capteur1` (`Capteur_n°capteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `pageweb`
--

DROP TABLE IF EXISTS `pageweb`;
CREATE TABLE IF NOT EXISTS `pageweb` (
  `numéroPageWeb` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`numéroPageWeb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `paragraphemodifiable`
--

DROP TABLE IF EXISTS `paragraphemodifiable`;
CREATE TABLE IF NOT EXISTS `paragraphemodifiable` (
  `idparagrapheModifiable` int(11) NOT NULL AUTO_INCREMENT,
  `contenu` multilinestring NOT NULL,
  `pageWeb_numéroPageWeb` int(11) NOT NULL,
  PRIMARY KEY (`idparagrapheModifiable`),
  KEY `fk_paragrapheModifiable_pageWeb1` (`pageWeb_numéroPageWeb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `permisconduire`
--

DROP TABLE IF EXISTS `permisconduire`;
CREATE TABLE IF NOT EXISTS `permisconduire` (
  `idNationalPermisConduire` int(11) NOT NULL,
  `typePermis` varchar(45) COLLATE utf8_bin NOT NULL,
  `Personne_N°Inscription` int(11) NOT NULL,
  PRIMARY KEY (`idNationalPermisConduire`),
  KEY `fk_permisConduire_Personne1` (`Personne_N°Inscription`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `nom` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `prenom` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `adresseMail` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `N°Inscription` int(11) NOT NULL AUTO_INCREMENT,
  `motDePasse` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Poid` int(11) DEFAULT NULL,
  `Taille` int(11) DEFAULT NULL,
  `âge` int(11) DEFAULT NULL,
  `Entreprise_idEntreprise` int(11) DEFAULT NULL,
  `role` varchar(45) COLLATE utf8_bin DEFAULT 'invite',
  PRIMARY KEY (`N°Inscription`),
  KEY `fk_Personne_Entreprise1` (`Entreprise_idEntreprise`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `personne`
--

INSERT INTO `personne` (`nom`, `prenom`, `adresseMail`, `N°Inscription`, `motDePasse`, `Poid`, `Taille`, `âge`, `Entreprise_idEntreprise`, `role`) VALUES
('berthet', 'alexis', 'alexis.berthet@isep.fr', 1, 'vejlab98', NULL, NULL, NULL, NULL, 'admin'),
('jollet', 'valentin', 'valentin.jollet@isep.fr', 2, 'vejlab98', NULL, NULL, NULL, 1, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `date` date NOT NULL,
  `n°test` int(11) NOT NULL AUTO_INCREMENT,
  `Personne_N°Inscription` int(11) NOT NULL,
  PRIMARY KEY (`n°test`),
  KEY `fk_test_Personne` (`Personne_N°Inscription`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
CREATE TABLE IF NOT EXISTS `topic` (
  `idTopic` int(11) NOT NULL AUTO_INCREMENT,
  `contenu topic` multilinestring NOT NULL,
  PRIMARY KEY (`idTopic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `typepermisconduire`
--

DROP TABLE IF EXISTS `typepermisconduire`;
CREATE TABLE IF NOT EXISTS `typepermisconduire` (
  `typ` int(11) NOT NULL,
  PRIMARY KEY (`typ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `typescapteurs`
--

DROP TABLE IF EXISTS `typescapteurs`;
CREATE TABLE IF NOT EXISTS `typescapteurs` (
  `idtypesCapteurs` int(11) NOT NULL AUTO_INCREMENT,
  `typeCapteur` varchar(45) COLLATE utf8_bin NOT NULL,
  `Capteur_n°capteur` int(11) NOT NULL,
  PRIMARY KEY (`idtypesCapteurs`),
  KEY `fk_typesCapteurs_Capteur1` (`Capteur_n°capteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appareil`
--
ALTER TABLE `appareil`
  ADD CONSTRAINT `fk_Appareil_test1` FOREIGN KEY (`test_n°test`) REFERENCES `test` (`n°test`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `capteur`
--
ALTER TABLE `capteur`
  ADD CONSTRAINT `fk_Capteur_Appareil1` FOREIGN KEY (`Appareil_idAppareil`) REFERENCES `appareil` (`idAppareil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `fk_Commentaires_topic1` FOREIGN KEY (`topic_idTopic`) REFERENCES `topic` (`idTopic`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mesures`
--
ALTER TABLE `mesures`
  ADD CONSTRAINT `fk_Mesures_Capteur1` FOREIGN KEY (`Capteur_n°capteur`) REFERENCES `capteur` (`n°capteur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `paragraphemodifiable`
--
ALTER TABLE `paragraphemodifiable`
  ADD CONSTRAINT `fk_paragrapheModifiable_pageWeb1` FOREIGN KEY (`pageWeb_numéroPageWeb`) REFERENCES `pageweb` (`numéroPageWeb`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `permisconduire`
--
ALTER TABLE `permisconduire`
  ADD CONSTRAINT `fk_permisConduire_Personne1` FOREIGN KEY (`Personne_N°Inscription`) REFERENCES `personne` (`N°Inscription`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `fk_Personne_Entreprise1` FOREIGN KEY (`Entreprise_idEntreprise`) REFERENCES `entreprise` (`idEntreprise`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `fk_test_Personne` FOREIGN KEY (`Personne_N°Inscription`) REFERENCES `personne` (`N°Inscription`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `typescapteurs`
--
ALTER TABLE `typescapteurs`
  ADD CONSTRAINT `fk_typesCapteurs_Capteur1` FOREIGN KEY (`Capteur_n°capteur`) REFERENCES `capteur` (`n°capteur`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

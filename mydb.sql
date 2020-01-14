-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 14 jan. 2020 à 08:51
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
-- Base de données :  `mydb`
--

-- --------------------------------------------------------

--
-- Structure de la table `adminforum`
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
-- Structure de la table `appareil`
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
-- Structure de la table `capteur`
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
-- Structure de la table `commentaires`
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
-- Structure de la table `entreprise`
--

DROP TABLE IF EXISTS `entreprise`;
CREATE TABLE IF NOT EXISTS `entreprise` (
  `idEntreprise` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) COLLATE utf8_bin NOT NULL,
  `adresse` varchar(45) COLLATE utf8_bin NOT NULL,
  `dateInscription` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idEntreprise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `mesures`
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
-- Structure de la table `pageweb`
--

DROP TABLE IF EXISTS `pageweb`;
CREATE TABLE IF NOT EXISTS `pageweb` (
  `numéroPageWeb` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`numéroPageWeb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `paragraphemodifiable`
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
-- Structure de la table `permisconduire`
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
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `nom` varchar(45) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(45) COLLATE utf8_bin NOT NULL,
  `adresse mail` varchar(45) COLLATE utf8_bin NOT NULL,
  `N°Inscription` int(11) NOT NULL AUTO_INCREMENT,
  `Mot de passe` varchar(45) COLLATE utf8_bin NOT NULL,
  `Poid` int(11) NOT NULL,
  `Taille` int(11) NOT NULL,
  `âge` int(11) NOT NULL,
  `Entreprise_idEntreprise` int(11) NOT NULL,
  `role` varchar(45) COLLATE utf8_bin DEFAULT 'invite',
  PRIMARY KEY (`N°Inscription`),
  KEY `fk_Personne_Entreprise1` (`Entreprise_idEntreprise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `test`
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
-- Structure de la table `topic`
--

DROP TABLE IF EXISTS `topic`;
CREATE TABLE IF NOT EXISTS `topic` (
  `idTopic` int(11) NOT NULL AUTO_INCREMENT,
  `contenu topic` multilinestring NOT NULL,
  PRIMARY KEY (`idTopic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `typepermisconduire`
--

DROP TABLE IF EXISTS `typepermisconduire`;
CREATE TABLE IF NOT EXISTS `typepermisconduire` (
  `typ` int(11) NOT NULL,
  PRIMARY KEY (`typ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `typescapteurs`
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
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appareil`
--
ALTER TABLE `appareil`
  ADD CONSTRAINT `fk_Appareil_test1` FOREIGN KEY (`test_n°test`) REFERENCES `test` (`n°test`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `capteur`
--
ALTER TABLE `capteur`
  ADD CONSTRAINT `fk_Capteur_Appareil1` FOREIGN KEY (`Appareil_idAppareil`) REFERENCES `appareil` (`idAppareil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `fk_Commentaires_topic1` FOREIGN KEY (`topic_idTopic`) REFERENCES `topic` (`idTopic`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `mesures`
--
ALTER TABLE `mesures`
  ADD CONSTRAINT `fk_Mesures_Capteur1` FOREIGN KEY (`Capteur_n°capteur`) REFERENCES `capteur` (`n°capteur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `paragraphemodifiable`
--
ALTER TABLE `paragraphemodifiable`
  ADD CONSTRAINT `fk_paragrapheModifiable_pageWeb1` FOREIGN KEY (`pageWeb_numéroPageWeb`) REFERENCES `pageweb` (`numéroPageWeb`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `permisconduire`
--
ALTER TABLE `permisconduire`
  ADD CONSTRAINT `fk_permisConduire_Personne1` FOREIGN KEY (`Personne_N°Inscription`) REFERENCES `personne` (`N°Inscription`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `fk_Personne_Entreprise1` FOREIGN KEY (`Entreprise_idEntreprise`) REFERENCES `entreprise` (`idEntreprise`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `fk_test_Personne` FOREIGN KEY (`Personne_N°Inscription`) REFERENCES `personne` (`N°Inscription`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `typescapteurs`
--
ALTER TABLE `typescapteurs`
  ADD CONSTRAINT `fk_typesCapteurs_Capteur1` FOREIGN KEY (`Capteur_n°capteur`) REFERENCES `capteur` (`n°capteur`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

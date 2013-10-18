-- phpMyAdmin SQL Dump
-- version 3.3.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2013 at 11:43 AM
-- Server version: 5.1.49
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `imprilac`
--

-- --------------------------------------------------------

--
-- Table structure for table `caissier`
--

CREATE TABLE IF NOT EXISTS `caissier` (
  `Idcaissier` int(11) NOT NULL,
  `Diplome` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Idcaissier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `caissier`
--

INSERT INTO `caissier` (`Idcaissier`, `Diplome`) VALUES
(13, 'D6'),
(19, '');

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE IF NOT EXISTS `charges` (
  `Idcharge` int(11) NOT NULL AUTO_INCREMENT,
  `Designation` varchar(20) NOT NULL,
  `PU` float NOT NULL,
  PRIMARY KEY (`Idcharge`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `charges`
--


-- --------------------------------------------------------

--
-- Table structure for table `chef_production`
--

CREATE TABLE IF NOT EXISTS `chef_production` (
  `Idcheprod` int(11) NOT NULL,
  `Bureau` varchar(20) DEFAULT NULL,
  `Diplome` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Idcheprod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chef_production`
--

INSERT INTO `chef_production` (`Idcheprod`, `Bureau`, `Diplome`) VALUES
(1, 'A2', 'D'),
(3, 'nn', 'nn'),
(4, 'E', 'E'),
(5, 'D', 'D'),
(6, 'F', 'G'),
(7, 'A', 'D6'),
(8, 'nn', 'nn');

-- --------------------------------------------------------

--
-- Table structure for table `chemin`
--

CREATE TABLE IF NOT EXISTS `chemin` (
  `Idchemin` int(11) NOT NULL AUTO_INCREMENT,
  `Designation` varchar(20) NOT NULL,
  PRIMARY KEY (`Idchemin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `chemin`
--


-- --------------------------------------------------------

--
-- Table structure for table `chemin_etapes`
--

CREATE TABLE IF NOT EXISTS `chemin_etapes` (
  `Idetape` int(11) NOT NULL,
  `idchemin` int(11) NOT NULL,
  PRIMARY KEY (`Idetape`,`idchemin`),
  KEY `fkchemi` (`idchemin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chemin_etapes`
--


-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `Idclient` int(11) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Idclient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`Idclient`, `tel`) VALUES
(11, 'tt'),
(18, '');

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `Idcmd` int(11) NOT NULL AUTO_INCREMENT,
  `Idclient` int(11) NOT NULL,
  `NIF` varchar(20) DEFAULT NULL,
  `Societe` varchar(20) DEFAULT NULL,
  `Datecmd` datetime NOT NULL,
  `Datecloture` datetime DEFAULT NULL,
  PRIMARY KEY (`Idcmd`),
  KEY `fkclient` (`Idclient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `commande`
--


-- --------------------------------------------------------

--
-- Table structure for table `compte`
--

CREATE TABLE IF NOT EXISTS `compte` (
  `Idpersonne` int(11) NOT NULL,
  `Login` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Profil` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Login`),
  KEY `fk_personn` (`Idpersonne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compte`
--

INSERT INTO `compte` (`Idpersonne`, `Login`, `Password`, `Profil`) VALUES
(15, 'gege', 'gege', NULL),
(1, 'kkkkk', 'kkkkkk', NULL),
(13, 'kokokoko', '', NULL),
(13, 'kukuku', 'kukuku', NULL),
(9, 'm1m1m', 'm1m1m1', NULL),
(9, 'm1m1m1', 'm1m1m1', NULL),
(9, 'mmmm', 'mmmm', NULL),
(3, 'mmmmm', 'mmmmmm', NULL),
(10, 'mmmmr', 'mmmm', NULL),
(3, 'MOMO', 'MOMO', NULL),
(9, 'momomom', 'mamamam', NULL),
(1, 'nnnnnn', 'nnnnnnnn', NULL),
(9, 'sssss', 'ssssss', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `demande`
--

CREATE TABLE IF NOT EXISTS `demande` (
  `Iddemande` int(11) NOT NULL AUTO_INCREMENT,
  `Idchefprod` int(11) NOT NULL,
  `Datedmd` datetime NOT NULL,
  `Etatdmd` tinyint(1) NOT NULL,
  PRIMARY KEY (`Iddemande`),
  KEY `fkchef_produ` (`Idchefprod`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `demande`
--

INSERT INTO `demande` (`Iddemande`, `Idchefprod`, `Datedmd`, `Etatdmd`) VALUES
(1, 1, '2013-10-15 11:33:44', 0),
(2, 1, '2013-10-15 11:38:52', 0),
(3, 1, '2013-10-15 11:40:27', 0),
(4, 1, '2013-10-15 11:50:38', 0),
(5, 1, '2013-10-15 11:54:26', 0),
(6, 1, '2013-10-15 11:58:38', 0),
(7, 1, '2013-10-15 12:01:04', 0),
(8, 1, '2013-10-15 12:07:23', 0),
(9, 1, '2013-10-15 12:24:59', 0),
(10, 1, '2013-10-15 12:33:24', 0),
(11, 1, '2013-10-15 12:36:07', 0),
(12, 1, '2013-10-15 20:36:11', 0),
(13, 1, '2013-10-16 09:22:32', 0);

-- --------------------------------------------------------

--
-- Table structure for table `disposer`
--

CREATE TABLE IF NOT EXISTS `disposer` (
  `Idfigure` int(11) NOT NULL,
  `Idcharge` int(11) NOT NULL,
  `Qtite_tot_charge` int(11) NOT NULL,
  `PU_charge` float NOT NULL,
  PRIMARY KEY (`Idfigure`,`Idcharge`),
  KEY `fkcha` (`Idcharge`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disposer`
--


-- --------------------------------------------------------

--
-- Table structure for table `etapes`
--

CREATE TABLE IF NOT EXISTS `etapes` (
  `Idetape` int(11) NOT NULL AUTO_INCREMENT,
  `Designation` varchar(20) NOT NULL,
  PRIMARY KEY (`Idetape`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `etapes`
--


-- --------------------------------------------------------

--
-- Table structure for table `figurer`
--

CREATE TABLE IF NOT EXISTS `figurer` (
  `Idfigurer` int(11) NOT NULL AUTO_INCREMENT,
  `Idcmd` int(11) NOT NULL,
  `Idprod` int(11) NOT NULL,
  `Idchemin` int(11) NOT NULL,
  `Titre` varchar(20) NOT NULL,
  `Nbreexemplr` int(11) NOT NULL,
  `Avecmaqt` tinyint(1) NOT NULL,
  `qtite_total_paye` int(11) NOT NULL,
  `MontantTot` float NOT NULL,
  `Mont_deja_paye` float DEFAULT NULL,
  PRIMARY KEY (`Idfigurer`),
  UNIQUE KEY `fkprodu` (`Idprod`),
  UNIQUE KEY `fkcom` (`Idcmd`),
  UNIQUE KEY `fkchem` (`Idchemin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `figurer`
--


-- --------------------------------------------------------

--
-- Table structure for table `gerant`
--

CREATE TABLE IF NOT EXISTS `gerant` (
  `Idgerant` int(11) NOT NULL,
  `Bureau` varchar(20) DEFAULT NULL,
  `Diplome` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Idgerant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gerant`
--

INSERT INTO `gerant` (`Idgerant`, `Bureau`, `Diplome`) VALUES
(9, 'mm', 'mm'),
(14, 'gg', 'gg');

-- --------------------------------------------------------

--
-- Table structure for table `gestionnaire`
--

CREATE TABLE IF NOT EXISTS `gestionnaire` (
  `Idgestion` int(11) NOT NULL,
  `Diplome` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Idgestion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gestionnaire`
--

INSERT INTO `gestionnaire` (`Idgestion`, `Diplome`) VALUES
(10, 'mm'),
(15, 'ge'),
(17, '');

-- --------------------------------------------------------

--
-- Table structure for table `groupe`
--

CREATE TABLE IF NOT EXISTS `groupe` (
  `Idgroupe` int(11) NOT NULL AUTO_INCREMENT,
  `Idchefprod` int(11) NOT NULL,
  `Idfigure` int(11) DEFAULT NULL,
  `Dte_prov_debut` datetime DEFAULT NULL,
  `Dte_prov_fin` datetime DEFAULT NULL,
  `Dte_fin` datetime DEFAULT NULL,
  PRIMARY KEY (`Idgroupe`),
  KEY `fkchef_produc` (`Idchefprod`),
  KEY `fkfigur` (`Idfigure`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `groupe`
--


-- --------------------------------------------------------

--
-- Table structure for table `groupe_producteur`
--

CREATE TABLE IF NOT EXISTS `groupe_producteur` (
  `Idgroupe` int(11) NOT NULL,
  `Idproduct` int(11) NOT NULL,
  PRIMARY KEY (`Idgroupe`,`Idproduct`),
  KEY `fkproduct` (`Idproduct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groupe_producteur`
--


-- --------------------------------------------------------

--
-- Table structure for table `historique_etapes`
--

CREATE TABLE IF NOT EXISTS `historique_etapes` (
  `Idhisto_etape` int(11) NOT NULL AUTO_INCREMENT,
  `Idfigure` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `Designation` varchar(20) NOT NULL,
  PRIMARY KEY (`Idhisto_etape`),
  KEY `fkfigu` (`Idfigure`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `historique_etapes`
--


-- --------------------------------------------------------

--
-- Table structure for table `maquette`
--

CREATE TABLE IF NOT EXISTS `maquette` (
  `Idmaquette` int(11) NOT NULL AUTO_INCREMENT,
  `Idfigurer` int(11) NOT NULL,
  `Photo` multipoint NOT NULL,
  `Dtecreation` datetime NOT NULL,
  PRIMARY KEY (`Idmaquette`),
  KEY `fkfig` (`Idfigurer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `maquette`
--


-- --------------------------------------------------------

--
-- Table structure for table `materiel`
--

CREATE TABLE IF NOT EXISTS `materiel` (
  `Idmateriel` int(11) NOT NULL AUTO_INCREMENT,
  `Designation` varchar(20) NOT NULL,
  `Historisation` varchar(21) NOT NULL,
  PRIMARY KEY (`Idmateriel`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `materiel`
--

INSERT INTO `materiel` (`Idmateriel`, `Designation`, `Historisation`) VALUES
(1, 'ffff', 'OUI'),
(2, 'Papier', 'OUI'),
(3, 'feuilles', 'NON'),
(4, 'Chance', 'OUI'),
(5, 'Film', 'NON'),
(6, 'Machine de Finition', 'OUI'),
(7, 'ma', 'OUI'),
(8, ',n,n,lk', 'OUI'),
(9, 'bbnk,', 'NON'),
(10, 'feuilles', 'OUI'),
(11, 'IMPRIMANTE', 'OUI'),
(12, 'DESIGNATION', 'OUI');

-- --------------------------------------------------------

--
-- Table structure for table `payement`
--

CREATE TABLE IF NOT EXISTS `payement` (
  `Idpayement` int(11) NOT NULL AUTO_INCREMENT,
  `Idcmd` int(11) NOT NULL,
  `Idcaissier` int(11) NOT NULL,
  `Dte_payement` datetime NOT NULL,
  `Signature` multipoint DEFAULT NULL,
  `Montant_paye` float DEFAULT NULL,
  PRIMARY KEY (`Idpayement`),
  KEY `fkcoma` (`Idcmd`),
  KEY `fkcai` (`Idcaissier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `payement`
--


-- --------------------------------------------------------

--
-- Table structure for table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
  `Idpersonne` int(11) NOT NULL AUTO_INCREMENT,
  `Nompersonne` varchar(20) NOT NULL,
  `Prenompersonne` varchar(20) NOT NULL,
  `Datenaissance` date DEFAULT NULL,
  PRIMARY KEY (`Idpersonne`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `personne`
--

INSERT INTO `personne` (`Idpersonne`, `Nompersonne`, `Prenompersonne`, `Datenaissance`) VALUES
(1, '+this.selected.nomPe', '+this.selected.preno', '2015-10-06'),
(2, 'KANA', 'Jean', NULL),
(3, 'MUCO', 'nn', '2013-10-08'),
(4, 'MUHIRE', 'Emmanuel', NULL),
(5, 'MUHIRE', 'Emmanuel', NULL),
(6, 'kami', 'Anicet', '2013-10-09'),
(7, 'mmm', 'mmm', '2013-10-08'),
(8, 'nn', 'nn', '2013-10-08'),
(9, 'mm', 'mm', '2013-10-01'),
(10, 'mm', 'mm', '2013-10-01'),
(11, 'mm', 'mm', '2013-10-02'),
(12, 'mm', 'mm', '2013-10-01'),
(13, 'HAKIZA', 'Eddy', '2013-10-09'),
(14, 'gg', 'gg', '2013-10-02'),
(15, 'ge', 'ge', '2013-10-01'),
(16, 'pro', 'pro', '2013-10-01'),
(17, 'ges', 'ges', NULL),
(18, 'cli', 'cli', NULL),
(19, 'NGANJI', 'Eic', '2013-10-08');

-- --------------------------------------------------------

--
-- Table structure for table `producteur`
--

CREATE TABLE IF NOT EXISTS `producteur` (
  `Idproduct` int(11) NOT NULL,
  `Bureau` varchar(20) DEFAULT NULL,
  `Diplome` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Idproduct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `producteur`
--

INSERT INTO `producteur` (`Idproduct`, `Bureau`, `Diplome`) VALUES
(12, 'mm', 'mm'),
(16, 'pro', 'pro');

-- --------------------------------------------------------

--
-- Table structure for table `produits`
--

CREATE TABLE IF NOT EXISTS `produits` (
  `Idprod` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(20) NOT NULL,
  PRIMARY KEY (`Idprod`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `produits`
--

INSERT INTO `produits` (`Idprod`, `Type`) VALUES
(1, 'kj'),
(2, 'Invitation'),
(3, 'IGITABO'),
(4, 'CARTE'),
(5, 'Film'),
(6, 'produit'),
(7, 'IYINDI'),
(8, 'ISUKA');

-- --------------------------------------------------------

--
-- Table structure for table `prod_paye`
--

CREATE TABLE IF NOT EXISTS `prod_paye` (
  `Idprod_paye` int(11) NOT NULL AUTO_INCREMENT,
  `Idpayement` int(11) NOT NULL,
  `Designation` varchar(20) NOT NULL,
  `Qtite_paye` int(11) NOT NULL,
  PRIMARY KEY (`Idprod_paye`),
  KEY `fkpaye` (`Idpayement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `prod_paye`
--


-- --------------------------------------------------------

--
-- Table structure for table `unites`
--

CREATE TABLE IF NOT EXISTS `unites` (
  `Idunite` int(11) NOT NULL AUTO_INCREMENT,
  `Idunitedmd` int(11) NOT NULL,
  `etat` varchar(20) NOT NULL,
  `Date` datetime NOT NULL,
  PRIMARY KEY (`Idunite`),
  KEY `fkunite_dmd` (`Idunitedmd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `unites`
--


-- --------------------------------------------------------

--
-- Table structure for table `unite_dmde`
--

CREATE TABLE IF NOT EXISTS `unite_dmde` (
  `Idunitedmd` int(11) NOT NULL AUTO_INCREMENT,
  `Idgerant` int(11) DEFAULT NULL,
  `Iddmd` int(11) NOT NULL,
  `Idmateriel` int(11) NOT NULL,
  `Idgestion` int(11) DEFAULT NULL,
  `Qtitedmd` int(11) NOT NULL,
  `Autorisation` varchar(3) NOT NULL,
  `Motivation` varchar(50) DEFAULT NULL,
  `Historise` tinyint(1) DEFAULT NULL,
  `Dateanalyse` datetime DEFAULT NULL,
  `Qtiteaccorde` int(11) DEFAULT NULL,
  PRIMARY KEY (`Idunitedmd`),
  UNIQUE KEY `cle_unik` (`Iddmd`,`Idmateriel`),
  KEY `fkmat` (`Idmateriel`),
  KEY `fkdmd` (`Iddmd`),
  KEY `fkgerant` (`Idgerant`),
  KEY `fkgestion` (`Idgestion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `unite_dmde`
--

INSERT INTO `unite_dmde` (`Idunitedmd`, `Idgerant`, `Iddmd`, `Idmateriel`, `Idgestion`, `Qtitedmd`, `Autorisation`, `Motivation`, `Historise`, `Dateanalyse`, `Qtiteaccorde`) VALUES
(1, NULL, 8, 2, NULL, 90, 'NON', NULL, NULL, NULL, NULL),
(2, NULL, 8, 4, NULL, 45, 'NON', NULL, NULL, NULL, NULL),
(3, NULL, 9, 2, NULL, 56, 'NON', NULL, NULL, NULL, NULL),
(4, NULL, 9, 1, NULL, 5, 'NON', NULL, NULL, NULL, NULL),
(5, NULL, 10, 2, NULL, 46, 'NON', NULL, NULL, NULL, NULL),
(6, NULL, 10, 3, NULL, 23, 'NON', NULL, NULL, NULL, NULL),
(7, NULL, 11, 3, NULL, 73, 'NON', NULL, NULL, NULL, NULL),
(8, NULL, 11, 5, NULL, 6, 'NON', NULL, NULL, NULL, NULL),
(9, NULL, 11, 2, NULL, 10, 'NON', NULL, NULL, NULL, NULL),
(10, NULL, 12, 1, NULL, 67, 'NON', NULL, NULL, NULL, NULL),
(11, NULL, 13, 2, NULL, 40, 'NON', NULL, NULL, NULL, NULL),
(12, NULL, 13, 5, NULL, 30, 'NON', NULL, NULL, NULL, NULL),
(13, NULL, 13, 6, NULL, 20, 'NON', NULL, NULL, NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `caissier`
--
ALTER TABLE `caissier`
  ADD CONSTRAINT `caissier_ibfk_1` FOREIGN KEY (`Idcaissier`) REFERENCES `personne` (`Idpersonne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chef_production`
--
ALTER TABLE `chef_production`
  ADD CONSTRAINT `chef_production_ibfk_1` FOREIGN KEY (`Idcheprod`) REFERENCES `personne` (`Idpersonne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chemin_etapes`
--
ALTER TABLE `chemin_etapes`
  ADD CONSTRAINT `fkchemi` FOREIGN KEY (`idchemin`) REFERENCES `chemin` (`Idchemin`),
  ADD CONSTRAINT `fketap` FOREIGN KEY (`Idetape`) REFERENCES `etapes` (`Idetape`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`Idclient`) REFERENCES `personne` (`Idpersonne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fkclient` FOREIGN KEY (`Idclient`) REFERENCES `client` (`Idclient`);

--
-- Constraints for table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `fk_personn` FOREIGN KEY (`Idpersonne`) REFERENCES `personne` (`Idpersonne`);

--
-- Constraints for table `demande`
--
ALTER TABLE `demande`
  ADD CONSTRAINT `fkchef_produ` FOREIGN KEY (`Idchefprod`) REFERENCES `chef_production` (`Idcheprod`);

--
-- Constraints for table `disposer`
--
ALTER TABLE `disposer`
  ADD CONSTRAINT `fkcha` FOREIGN KEY (`Idcharge`) REFERENCES `charges` (`Idcharge`),
  ADD CONSTRAINT `fkfi` FOREIGN KEY (`Idfigure`) REFERENCES `figurer` (`Idfigurer`);

--
-- Constraints for table `figurer`
--
ALTER TABLE `figurer`
  ADD CONSTRAINT `fkchem` FOREIGN KEY (`Idchemin`) REFERENCES `chemin` (`Idchemin`),
  ADD CONSTRAINT `fkcom` FOREIGN KEY (`Idcmd`) REFERENCES `commande` (`Idcmd`),
  ADD CONSTRAINT `fkprodu` FOREIGN KEY (`Idprod`) REFERENCES `produits` (`Idprod`);

--
-- Constraints for table `gerant`
--
ALTER TABLE `gerant`
  ADD CONSTRAINT `gerant_ibfk_1` FOREIGN KEY (`Idgerant`) REFERENCES `personne` (`Idpersonne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gestionnaire`
--
ALTER TABLE `gestionnaire`
  ADD CONSTRAINT `gestionnaire_ibfk_1` FOREIGN KEY (`Idgestion`) REFERENCES `personne` (`Idpersonne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `fkchef_produc` FOREIGN KEY (`Idchefprod`) REFERENCES `chef_production` (`Idcheprod`),
  ADD CONSTRAINT `fkfigur` FOREIGN KEY (`Idfigure`) REFERENCES `figurer` (`Idfigurer`);

--
-- Constraints for table `groupe_producteur`
--
ALTER TABLE `groupe_producteur`
  ADD CONSTRAINT `fkgroup` FOREIGN KEY (`Idgroupe`) REFERENCES `groupe` (`Idgroupe`),
  ADD CONSTRAINT `fkproduct` FOREIGN KEY (`Idproduct`) REFERENCES `producteur` (`Idproduct`);

--
-- Constraints for table `historique_etapes`
--
ALTER TABLE `historique_etapes`
  ADD CONSTRAINT `fkfigu` FOREIGN KEY (`Idfigure`) REFERENCES `figurer` (`Idfigurer`);

--
-- Constraints for table `maquette`
--
ALTER TABLE `maquette`
  ADD CONSTRAINT `fkfig` FOREIGN KEY (`Idfigurer`) REFERENCES `figurer` (`Idfigurer`);

--
-- Constraints for table `payement`
--
ALTER TABLE `payement`
  ADD CONSTRAINT `fkcai` FOREIGN KEY (`Idcaissier`) REFERENCES `caissier` (`Idcaissier`),
  ADD CONSTRAINT `fkcoma` FOREIGN KEY (`Idcmd`) REFERENCES `commande` (`Idcmd`);

--
-- Constraints for table `producteur`
--
ALTER TABLE `producteur`
  ADD CONSTRAINT `producteur_ibfk_1` FOREIGN KEY (`Idproduct`) REFERENCES `personne` (`Idpersonne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prod_paye`
--
ALTER TABLE `prod_paye`
  ADD CONSTRAINT `fkpaye` FOREIGN KEY (`Idpayement`) REFERENCES `payement` (`Idpayement`);

--
-- Constraints for table `unites`
--
ALTER TABLE `unites`
  ADD CONSTRAINT `fkunite_dmd` FOREIGN KEY (`Idunitedmd`) REFERENCES `unite_dmde` (`Idunitedmd`);

--
-- Constraints for table `unite_dmde`
--
ALTER TABLE `unite_dmde`
  ADD CONSTRAINT `fkdmd` FOREIGN KEY (`Iddmd`) REFERENCES `demande` (`Iddemande`),
  ADD CONSTRAINT `fkgerant` FOREIGN KEY (`Idgerant`) REFERENCES `gerant` (`Idgerant`),
  ADD CONSTRAINT `fkgestion` FOREIGN KEY (`Idgestion`) REFERENCES `gestionnaire` (`Idgestion`),
  ADD CONSTRAINT `fkmat` FOREIGN KEY (`Idmateriel`) REFERENCES `materiel` (`Idmateriel`);

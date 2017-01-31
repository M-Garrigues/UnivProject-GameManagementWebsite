-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 17 Décembre 2015 à 09:44
-- Version du serveur :  10.0.17-MariaDB
-- Version de PHP :  5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projetmg`
--

DROP DATABASE IF EXISTS `projetmg`;
CREATE DATABASE projetmg CHARACTER SET 'utf8';
GRANT ALL PRIVILEGES ON projetmg.* TO "admin"@"localhost" IDENTIFIED BY 'adminLIF4';
FLUSH PRIVILEGES;


 USE projetmg;

--
-- Structure de la table `appartient`
--

CREATE TABLE `appartient` (
  `IdJx` int(11) NOT NULL,
  `IdC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `appartient`
--

INSERT INTO `appartient` (`IdJx`, `IdC`) VALUES
(1, 2),
(1, 4),
(2, 1),
(3, 3),
(4, 1),
(5, 3),
(6, 5),
(7, 7),
(8, 8),
(9, 4),
(10, 2);

-- --------------------------------------------------------

--
-- Structure de la table `auteurs`
--

CREATE TABLE `auteurs` (
  `IdA` int(11) NOT NULL,
  `prenomA` varchar(30) NOT NULL,
  `nomA` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `auteurs`
--

INSERT INTO `auteurs` (`IdA`, `prenomA`, `nomA`) VALUES
(1, 'Robbins', 'Merle'),
(2, 'Charles', 'Darrow'),
(3, 'Peter', 'Sarret'),
(4, 'Albert', 'Lamorisse'),
(5, 'Phikippe', 'Pallieres'),
(6, 'Alfred', 'Butts'),
(7, 'Anthony', 'Pratt'),
(8, 'Chris', 'Haney'),
(9, 'Paul', 'Gruen'),
(10, 'Herve', 'Marly'),
(11, 'Scott', 'Abbott'),
(12, 'inconnu', 'inconnu');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `IdC` int(11) NOT NULL,
  `nomC` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`IdC`, `nomC`) VALUES
(6, 'Jeu d''adresse'),
(3, 'Jeu d''ambiance'),
(2, 'Jeu de cartes'),
(8, 'Jeu de culture'),
(5, 'Jeu de lettre'),
(7, 'Jeu de réflexion'),
(1, 'Jeu de stratégie'),
(4, 'Jeu familial');

-- --------------------------------------------------------

--
-- Structure de la table `creent`
--

CREATE TABLE `creent` (
  `IdJx` int(11) NOT NULL,
  `IdA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `creent`
--

INSERT INTO `creent` (`IdJx`, `IdA`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(5, 10),
(6, 6),
(7, 7),
(8, 8),
(8, 11),
(9, 9),
(10, 12);

-- --------------------------------------------------------

--
-- Structure de la table `equipes`
--

CREATE TABLE `equipes` (
  `IdE` int(11) NOT NULL,
  `nomE` varchar(30) NOT NULL,
  `dateCreatE` date NOT NULL,
  `deviseE` varchar(50) NOT NULL,
  `publiqueE` tinyint(1) NOT NULL,
  `mdpE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `equipes`
--

INSERT INTO `equipes` (`IdE`, `nomE`, `dateCreatE`, `deviseE`, `publiqueE`, `mdpE`) VALUES
(1, 'Les meilleurs', '1987-12-12', 'Lorem Ipsum', 1, 'azdyfvayu'),
(2, 'Chocolate lovers', '2016-05-04', 'Le chocolat c''est bon', 1, 'uaubiadoanz211851'),
(3, 'Monopoly winners', '2012-04-25', 'In monopoly there is "only"', 0, ''),
(4, 'Random access memory', '1996-11-13', 'Parce qu''on aime daft punk', 0, ''),
(5, 'Au pif', '2012-01-02', 'La créativité a disparu', 1, '513dczza'),
(6, 'La famille', '2010-04-04', 'Le scrabble avec grand-mère', 0, ''),
(7, 'La LIF4', '2014-03-30', 'Parce qu''on finit pas le projet', 0, ''),
(28, 'Equipe bleue', '2015-12-16', 'bleu', 0, ''),
(29, 'Equipe rouge', '2015-12-16', 'rouge', 0, ''),
(30, 'Equipe violette', '2015-12-16', 'violet', 0, ''),
(31, 'Les aventuriers de Bamako', '2015-12-17', 'Akuna Matata', 1, 'Ilfautcroquerleschenilles'),
(32, 'Joueurs de la Creuse', '2015-12-17', 'Plus beau département de France!', 0, ''),
(33, 'Les forestiers', '2015-12-17', 'Sans jouer, on prend racines', 0, ''),
(34, 'Les musiciens', '2015-12-17', 'Il faut bien varier', 0, ''),
(35, 'Jesus est en nous', '2015-12-17', 'Et il veut jouer.', 0, ''),
(36, 'Equipe verte', '2015-12-17', 'vert', 0, ''),
(37, 'Les pros du cluedo', '2015-12-17', 'J''accuse le colonel moutarde', 0, ''),
(38, 'Les philosophes', '2015-12-17', 'Kant a théorisé le tarot', 1, 'Kantislove'),
(39, 'Entre amis', '2015-12-17', 'Beberte et Francoise', 0, ''),
(40, 'Pole emploi', '2015-12-17', 'Parce qu''il vaut mieux en jouer', 0, '');

-- --------------------------------------------------------

--
-- Structure de la table `extensions`
--

CREATE TABLE `extensions` (
  `IdEx` int(11) NOT NULL,
  `numeroEx` int(11) NOT NULL,
  `nomEx` varchar(30) NOT NULL,
  `dateSortieEx` date NOT NULL,
  `IdJx` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `extensions`
--

INSERT INTO `extensions` (`IdEx`, `numeroEx`, `nomEx`, `dateSortieEx`, `IdJx`) VALUES
(1, 3, 'Personnages', '2010-06-05', 5),
(2, 1, 'Celebrity', '2008-05-06', 3),
(3, 2, 'Frontline', '2010-12-13', 4),
(4, 3, 'Super', '1995-06-01', 9),
(5, 1, 'Mega', '1976-08-05', 2),
(6, 2, 'Family', '1985-06-25', 2);

-- --------------------------------------------------------

--
-- Structure de la table `jeux`
--

CREATE TABLE `jeux` (
  `IdJx` int(11) NOT NULL,
  `nomJx` varchar(30) NOT NULL,
  `dateSortieJx` date NOT NULL,
  `publicJx` int(11) DEFAULT NULL,
  `joueursMinJx` int(11) NOT NULL,
  `joueursMaxJx` int(11) NOT NULL,
  `editeurJx` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `jeux`
--

INSERT INTO `jeux` (`IdJx`, `nomJx`, `dateSortieJx`, `publicJx`, `joueursMinJx`, `joueursMaxJx`, `editeurJx`) VALUES
(1, 'Uno', '1971-08-05', 6, 2, 10, 'Mattel'),
(2, 'Monopoly', '1935-02-06', 8, 2, 6, 'Hasbro'),
(3, 'Times up', '2005-07-02', 12, 4, 12, 'Asmodée'),
(4, 'Risk', '1959-11-02', 10, 2, 6, 'Miro'),
(5, 'Loups garous', '2001-01-12', 10, 8, 18, 'Miro'),
(6, 'Scrabble', '1948-11-22', 10, 2, 4, 'Hasbro'),
(7, 'Cluedo', '1949-09-05', 9, 3, 6, 'Miro'),
(8, 'Trivial poursuit', '1979-11-02', 10, 2, 6, 'Hasbro'),
(9, 'La bonne paye', '1975-08-15', 8, 3, 6, 'Parker'),
(10, 'Tarot', '1930-12-05', 12, 2, 6, 'inconnu');

-- --------------------------------------------------------

--
-- Structure de la table `joueequipe`
--

CREATE TABLE `joueequipe` (
  `ScoreEquipes` varchar(40) NOT NULL,
  `gagneE` int(11) DEFAULT NULL,
  `IdE` int(11) NOT NULL,
  `IdP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `joueequipe`
--

INSERT INTO `joueequipe` (`ScoreEquipes`, `gagneE`, `IdE`, `IdP`) VALUES
('324', 30, 1, 185),
('82', 32, 1, 187),
('188', 30, 2, 178),
('324', 30, 2, 185),
('82', 32, 2, 187),
('87', 38, 2, 191),
('332', 3, 2, 193),
('341', 29, 2, 200),
('329', 2, 2, 201),
('324', 30, 3, 185),
('332', 3, 3, 193),
('92', 40, 3, 194),
('188', 30, 4, 178),
('240', 36, 4, 180),
('324', 30, 4, 185),
('329', 2, 4, 201),
('357', 28, 4, 202),
('135', 34, 4, 210),
('324', 30, 5, 185),
('87', 38, 5, 191),
('150', 34, 5, 199),
('93', 5, 5, 204),
('117', 5, 5, 214),
('92', 40, 6, 194),
('341', 29, 7, 200),
('117', 5, 7, 214),
('87', 38, 28, 191),
('357', 28, 28, 202),
('188', 30, 29, 178),
('240', 36, 29, 180),
('324', 30, 29, 185),
('341', 29, 29, 200),
('369', 35, 29, 207),
('117', 5, 29, 214),
('188', 30, 30, 178),
('324', 30, 30, 185),
('324', 30, 31, 185),
('87', 38, 31, 191),
('240', 36, 32, 180),
('82', 32, 32, 187),
('135', 34, 32, 210),
('240', 36, 33, 180),
('324', 30, 33, 185),
('150', 34, 33, 199),
('369', 35, 33, 207),
('135', 34, 33, 210),
('87', 38, 34, 191),
('92', 40, 34, 194),
('150', 34, 34, 199),
('341', 29, 34, 200),
('93', 5, 34, 204),
('369', 35, 34, 207),
('135', 34, 34, 210),
('240', 36, 35, 180),
('324', 30, 35, 185),
('274', 35, 35, 188),
('341', 29, 35, 200),
('369', 35, 35, 207),
('270', 39, 35, 213),
('240', 36, 36, 180),
('82', 32, 36, 187),
('274', 35, 36, 188),
('150', 34, 36, 199),
('135', 34, 36, 210),
('324', 30, 37, 185),
('87', 38, 37, 191),
('82', 32, 38, 187),
('87', 38, 38, 191),
('150', 34, 38, 199),
('270', 39, 38, 213),
('270', 39, 39, 213),
('92', 40, 40, 194),
('357', 28, 40, 202);

-- --------------------------------------------------------

--
-- Structure de la table `jouesolo`
--

CREATE TABLE `jouesolo` (
  `ScoreSolo` varchar(40) NOT NULL,
  `gagneJ` int(11) DEFAULT NULL,
  `IdJ` int(11) NOT NULL,
  `IdP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `jouesolo`
--

INSERT INTO `jouesolo` (`ScoreSolo`, `gagneJ`, `IdJ`, `IdP`) VALUES
('286', 233, 2, 182),
('185', 401, 4, 184),
('113', 397, 4, 195),
('135', 470, 5, 173),
('338', 7, 7, 203),
('171', 9, 9, 181),
('371', 533, 10, 215),
('271', 233, 11, 169),
('127', 16, 16, 208),
('171', 9, 19, 181),
('359', 24, 24, 174),
('90', 546, 26, 167),
('371', 533, 26, 215),
('250', 27, 27, 196),
('324', 320, 29, 212),
('135', 470, 31, 173),
('90', 546, 32, 167),
('318', 32, 32, 179),
('281', 32, 32, 205),
('135', 470, 35, 173),
('255', 336, 35, 183),
('240', 84, 36, 209),
('80', 44, 44, 177),
('243', 274, 45, 168),
('185', 401, 52, 184),
('206', 531, 52, 198),
('318', 32, 59, 179),
('306', 61, 61, 189),
('80', 44, 69, 177),
('80', 44, 70, 177),
('243', 274, 77, 168),
('222', 386, 82, 172),
('116', 421, 82, 216),
('240', 84, 84, 209),
('236', 422, 89, 192),
('359', 468, 91, 190),
('171', 9, 99, 181),
('169', 202, 99, 197),
('250', 27, 104, 196),
('185', 401, 110, 184),
('359', 468, 112, 190),
('102', 121, 117, 170),
('255', 336, 118, 183),
('102', 121, 121, 170),
('127', 16, 122, 208),
('306', 61, 124, 189),
('80', 44, 135, 177),
('185', 401, 136, 184),
('240', 84, 154, 209),
('116', 421, 157, 216),
('318', 32, 163, 179),
('286', 233, 173, 182),
('359', 24, 179, 174),
('85', 431, 182, 211),
('236', 422, 188, 192),
('271', 233, 189, 169),
('206', 531, 192, 198),
('102', 121, 199, 170),
('85', 431, 200, 211),
('243', 274, 201, 168),
('169', 202, 202, 197),
('240', 84, 203, 209),
('324', 320, 207, 212),
('222', 386, 210, 172),
('250', 27, 226, 196),
('271', 233, 233, 169),
('286', 233, 233, 182),
('250', 27, 240, 196),
('222', 386, 243, 172),
('324', 320, 243, 212),
('255', 336, 246, 183),
('243', 274, 252, 168),
('306', 61, 252, 189),
('271', 233, 255, 169),
('243', 274, 256, 168),
('116', 421, 263, 216),
('371', 533, 266, 215),
('102', 121, 268, 170),
('116', 421, 273, 216),
('243', 274, 274, 168),
('132', 504, 276, 175),
('309', 286, 286, 186),
('281', 32, 287, 205),
('318', 32, 288, 179),
('127', 16, 290, 208),
('85', 431, 290, 211),
('255', 336, 304, 183),
('116', 421, 306, 216),
('116', 421, 312, 216),
('116', 421, 313, 216),
('324', 320, 320, 212),
('240', 84, 322, 209),
('132', 504, 325, 175),
('359', 468, 335, 190),
('255', 336, 336, 183),
('359', 24, 337, 174),
('286', 233, 339, 182),
('301', 492, 343, 171),
('222', 386, 343, 172),
('255', 336, 343, 183),
('243', 274, 350, 168),
('286', 233, 357, 182),
('338', 7, 360, 203),
('271', 233, 366, 169),
('255', 336, 368, 183),
('127', 16, 374, 208),
('261', 377, 377, 176),
('206', 531, 378, 198),
('338', 7, 378, 203),
('261', 377, 379, 176),
('324', 320, 379, 212),
('261', 377, 384, 176),
('250', 27, 385, 196),
('222', 386, 386, 172),
('113', 397, 397, 195),
('349', 435, 400, 206),
('185', 401, 401, 184),
('281', 32, 408, 205),
('135', 470, 409, 173),
('243', 274, 413, 168),
('318', 32, 414, 179),
('116', 421, 421, 216),
('236', 422, 422, 192),
('306', 61, 423, 189),
('85', 431, 427, 211),
('85', 431, 431, 211),
('255', 336, 433, 183),
('349', 435, 435, 206),
('271', 233, 442, 169),
('359', 24, 442, 174),
('171', 9, 442, 181),
('309', 286, 442, 186),
('306', 61, 448, 189),
('271', 233, 457, 169),
('132', 504, 463, 175),
('318', 32, 463, 179),
('324', 320, 465, 212),
('359', 468, 468, 190),
('135', 470, 470, 173),
('85', 431, 475, 211),
('255', 336, 476, 183),
('271', 233, 479, 169),
('371', 533, 479, 215),
('359', 468, 480, 190),
('359', 24, 487, 174),
('309', 286, 491, 186),
('301', 492, 492, 171),
('359', 468, 492, 190),
('371', 533, 494, 215),
('222', 386, 495, 172),
('132', 504, 504, 175),
('349', 435, 505, 206),
('85', 431, 505, 211),
('85', 431, 507, 211),
('306', 61, 512, 189),
('206', 531, 512, 198),
('250', 27, 520, 196),
('80', 44, 521, 177),
('301', 492, 525, 171),
('113', 397, 525, 195),
('359', 24, 530, 174),
('206', 531, 531, 198),
('371', 533, 533, 215),
('338', 7, 535, 203),
('85', 431, 536, 211),
('243', 274, 539, 168),
('90', 546, 546, 167);

-- --------------------------------------------------------

--
-- Structure de la table `joueuses`
--

CREATE TABLE `joueuses` (
  `IdJ` int(11) NOT NULL,
  `pseudoJ` varchar(30) NOT NULL,
  `prenomJ` varchar(30) NOT NULL,
  `nomJ` varchar(30) NOT NULL,
  `dateNJ` date NOT NULL,
  `rueJ` varchar(30) NOT NULL,
  `villeJ` varchar(30) NOT NULL,
  `regionJ` varchar(30) NOT NULL,
  `codePJ` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `joueuses`
--

INSERT INTO `joueuses` (`IdJ`, `pseudoJ`, `prenomJ`, `nomJ`, `dateNJ`, `rueJ`, `villeJ`, `regionJ`, `codePJ`) VALUES
(1, 'Gothis', 'Dorene', 'Durepos', '1953-02-21', '88 rue Ernest Renan', 'CHAUMONT', 'Champagne-Ardenne', '52000'),
(2, 'Heake1945', 'Maryse', 'Lizotte', '1945-01-28', '48 boulevard d''Alsace', 'VÉNISSIEUX', 'Rhône-Alpes', '69200'),
(3, 'Floracer', 'Arnaude', 'Lamy', '1955-01-01', '5 rue Léon Dierx', 'LIMOGES', 'Limousin', '87280'),
(4, 'Witena', 'Catherine', 'Bousquet', '1940-04-14', '87 Rue de Strasbourg', 'CLICHY', 'Île-de-France', '92110'),
(5, 'Hishoss', 'Searlait', 'Lagueux', '1962-02-24', '69 rue du Château', 'SAINT-GERMAIN-EN-LAYE', 'Île-de-France', '78100'),
(6, 'Mortang', 'Michèle', 'Rhéaume', '1966-06-14', '56 cours Franklin Roosevelt', 'MARSEILLE', 'Provence-Alpes-Côte d''Azur', '13006'),
(7, 'Thuskultor', 'Aimée', 'Gabriaux', '1995-03-02', '92 Place de la Gare', 'COLOMIERS', 'Midi-Pyrénées', '31770'),
(8, 'Swervat', 'France', 'Caron', '1982-05-13', '28 rue du Général Ailleret', 'LES ABYMES', 'Guadeloupe', '97139'),
(9, 'Nothome', 'Paulette', 'Patel', '1998-07-11', '22 rue Ernest Renan', 'CHOLET', 'Pays de la Loire', '49300'),
(10, 'Elike1941', 'Ophelia', 'Pinneau', '1941-05-19', '39 quai Saint-Nicolas', 'TOURCOING', 'Nord-Pas-de-Calais', '59200'),
(11, 'Wheive57', 'Brie', 'Lemaître', '1957-11-10', '15 rue de Groussay', 'ROSNY-SOUS-BOIS', 'Île-de-France', '93110'),
(12, 'Friese', 'Chantal', 'Noël', '1966-09-26', '92 avenue Voltaire', 'MAISONS-ALFORT', 'Île-de-France', '64700'),
(13, 'Thistility', 'Aubrey', 'Labelle', '1940-10-25', '42 rue Léon Dierx', 'LOMME', 'Nord-Pas-de-Calais', '59160'),
(14, 'Aloyard', 'Fauna', 'Jetté', '1975-07-17', '3 avenue de Bouvines', 'SÈTE', 'Languedoc-Roussillon', '34200'),
(15, 'Rought', 'Frédérique', 'Beaudouin', '1948-11-25', '35 rue des Nations Unies', 'SAINT-DENIS', 'Île-de-France', '93200'),
(16, 'Forneirdis', 'Erembourg', 'Tougas', '1972-04-06', '90 Boulevard de Normandie', 'FORBACH', 'Lorraine', '57600'),
(17, 'Sirche', 'Maureen', 'Hébert', '1966-05-09', '4 rue du Château', 'SAINT-ÉTIENNE-DU-ROUVRAY', 'Haute-Normandie', '76800'),
(18, 'Sicert', 'Roux', 'Veilleux', '1933-05-31', '39 rue Petite Fusterie', 'BOULOGNE-SUR-MER', 'Nord-Pas-de-Calais', '62200'),
(19, 'Withromb', 'Madelene', 'Lauzier', '1989-09-13', '3 place Stanislas', 'NANCY', 'Lorraine', '54000'),
(20, 'Suchibiant', 'Caroline', 'Rossignol', '1959-10-02', '61 Boulevard de Normandie', 'FORBACH', 'Lorraine', '57600'),
(21, 'Goom1936', 'Noelle', 'Richard', '1936-04-16', '18 boulevard Bryas', 'DAMMARIE-LES-LYS', 'Île-de-France', '77190'),
(22, 'Tink1997', 'Joanna', 'Corbin', '1997-06-09', '68 boulevard Bryas', 'CRÉTEIL', 'Île-de-France', '94000'),
(23, 'Lowas1990', 'Alexandrie', 'Daviau', '1990-02-26', '92 rue des Chaligny', 'NICE', 'Provence-Alpes-Côte d''Azur', '06300'),
(24, 'CoÃ¶ped', 'Marphisa', 'Lemieux', '1994-10-31', '74 rue des Soeurs', 'JUAN-LES-PINS', 'Provence-Alpes-Côte d''Azur', '06160'),
(25, 'Seeck1975', 'Colette', 'Audibert', '1975-12-31', '87 Faubourg Saint Honoré', 'PARIS', 'Île-de-France', '75018'),
(26, 'Sumbing', 'Orlene', 'Deschamps', '1947-07-15', '42 rue de la République', 'LUNÉVILLE', 'Lorraine', '54300'),
(27, 'Ourprome', 'Carine', 'Cormier', '1948-09-29', '63 avenue Ferdinand de Lesseps', 'GRADIGNAN', 'Aquitaine', '33170'),
(28, 'Fetwerivid1942', 'Blanche', 'Bureau', '1942-09-27', '2 rue Léon Dierx', 'LIMOGES', 'Limousin', '87280'),
(29, 'Botiory', 'Alacoque', 'Lavallée', '1950-05-14', '78 avenue de Bouvines', 'SEVRAN', 'Île-de-France', '93270'),
(30, 'Quir1937', 'Madeleine', 'Chnadonnet', '1937-05-29', '38 avenue Jules Ferry', 'STAINS', 'Île-de-France', '93240'),
(31, 'Ackwoure', 'Fealty', 'Tétrault', '1985-01-15', '76 Rue Roussy', 'NOISY-LE-SEC', 'Île-de-France', '93130'),
(32, 'Vollivind', 'Brigitte', 'Charpentier', '1940-12-14', '14 rue Marie de Médicis', 'BEZONS', 'Île-de-France', '95870'),
(33, 'Anatuother1977', 'Jessamine', 'Marier', '1977-02-27', '51 Rue Bonnet', 'VITRY-SUR-SEINE', 'Île-de-France', '94400'),
(34, 'Woreat', 'Dielle', 'Busson', '1957-09-23', '96 Avenue des Pr''es', 'MONTPELLIER', 'Languedoc-Roussillon', '34000'),
(35, 'Beforge', 'Georgette', 'Gilbert', '1973-04-10', '78 Place de la Gare', 'COLOMBES', 'Île-de-France', '92700'),
(36, 'Histered99', 'Charlotte', 'Desnoyer', '1999-07-12', '78 Place Napoléon', 'LAVAL', 'Pays de la Loire', '53000'),
(37, 'Mastakill', 'Dominique', 'Chrétien', '1934-03-18', '21 Avenue des Pr''es', 'MONTLUÇON', 'Auvergne', '03100'),
(38, 'Whisconce', 'Pénélope', 'Chauvet', '1951-03-27', '9 rue des lieutemants Thomazo', 'DRAGUIGNAN', 'Provence-Alpes-Côte d''Azur', '83300'),
(39, 'Ingichis', 'Mireille', 'Brochu', '1995-01-30', '16 rue Jean Vilar', 'BESANÇON', 'Franche-Comté', '25000'),
(40, 'Bord1943', 'Aceline', 'Fugère', '1943-09-06', '48 rue de Lille', 'ATHIS-MONS', 'Île-de-France', '91200'),
(41, 'Uposs1988', 'Linette', 'Croteau', '1988-04-27', '46 Chemin Des Bateliers', 'ANGOULÊME', 'Poitou-Charentes', '16000'),
(42, 'Doomplast1948', 'Julienne', 'Sorel', '1948-10-29', '6 Rue Marie De Médicis', 'CAMBRAI', 'Nord-Pas-de-Calais', '59400'),
(43, 'Lotes1989', 'Olivie', 'Senneville', '1989-11-29', '14 rue de la Mare aux Carats', 'MONTROUGE', 'Île-de-France', '92120'),
(44, 'Plinted', 'Marthe', 'Lejeune', '1990-01-31', '24 Avenue De Marlioz', 'ARGENTEUIL', 'Île-de-France', '95100'),
(45, 'Necanat', 'Danielle', 'Doiron', '1930-06-30', '64 Rue Joseph Vernet', 'BAGNEUX', 'Île-de-France', '92220'),
(46, 'Hatiagoorah', 'Fabienne', 'Davignon', '1953-01-12', '16 boulevard Albin Durand', 'CHÂLONS-EN-CHAMPAGNE', 'Champagne-Ardenne', '51000'),
(47, 'Fento1976', 'Parnella', 'Faubert', '1976-04-14', '57 rue La Boétie', 'PARIS', 'Île-de-France', '75016'),
(48, 'Formaded', 'Fauna', 'Gauvin', '1970-06-20', '96 rue du Gue Jacquet', 'CHÂTEAUROUX', 'Centre', '36000'),
(49, 'Haroven', 'Gallia', 'Noël', '1961-07-20', '33 rue Jean Vilar', 'BEAUVAIS', 'Picardie', '60000'),
(50, 'Sentes', 'Comforte', 'Parrot', '1945-11-02', '81 rue du Château', 'SAINT-JOSEPH', 'Guyane', '97480'),
(51, 'Migh1989', 'Isabelle', 'Tachel', '1989-09-08', '23 Faubourg Saint Honoré', 'PARIS', 'Île-de-France', '75020'),
(52, 'Oball1986', 'Maureen', 'Lazure', '1986-01-25', '66 avenue Jules Ferry', 'SOTTEVILLE-LÈS-ROUEN', 'Haute-Normandie', '76300'),
(53, 'Thereves', 'Édith', 'Boncoeur', '1962-10-09', '28 rue Saint Germain', 'GIF-SUR-YVETTE', 'Île-de-France', '91190'),
(54, 'Proutiting66', 'Charline', 'Bourgouin', '1966-10-27', '61 rue de Penthièvre', 'QUIMPER', 'Bretagne', '29000'),
(55, 'Haveran', 'Christiane', 'Bazin', '1983-10-05', '83 place Maurice-Charretier', 'CHARENTON-LE-PONT', 'Île-de-France', '94220'),
(56, 'Feliked1933', 'Philippine', 'Goudreau', '1933-09-28', '72 rue de Lille', 'ARRAS', 'Nord-Pas-de-Calais', '62000'),
(57, 'Iniand', 'Agate', 'Dupuy', '1956-11-05', '47 Chemin Challet', 'LIMOGES', 'Limousin', '87000'),
(58, 'Sooreaver', 'Fanette', 'Salois', '1930-10-06', '91 Chemin Challet', 'LILLE', 'Nord-Pas-de-Calais', '59000'),
(59, 'Agnumpting', 'Erembourg', 'Lalonde', '1999-06-05', '81 Rue du Palais', 'ERMONT', 'Île-de-France', '95120'),
(60, 'Cled1982', 'Marine', 'Paquin', '1982-01-30', '18 rue de Groussay', 'ROMANS-SUR-ISÈRE', 'Rhône-Alpes', '26100'),
(61, 'Youscinfecto', 'Melodie', 'Barrientos', '1985-02-01', '18 Rue de Verdun', 'MONTCEAU-LES-MINES', 'Bourgogne', '71300'),
(62, 'Supothosula', 'Martine', 'Poirier', '1957-02-28', '66 Cours Marechal-Joffre', 'DÉCINES-CHARPIEU', 'Rhône-Alpes', '69150'),
(63, 'Wasucence64', 'Coralie', 'Tardif', '1964-08-24', '36 Avenue des Pr''es', 'MONTMORENCY', 'Île-de-France', '95160'),
(64, 'Gant1981', 'Maureen', 'Leclair', '1981-09-03', '15 cours Franklin Roosevelt', 'MARSEILLE', 'Provence-Alpes-Côte d''Azur', '13006'),
(65, 'Zouketaboule', 'Melisande', 'Garreau', '1954-02-21', '85 Rue du Limas', 'BASTIA', 'Corse', '20200'),
(66, 'Upold1969', 'Laurene', 'Bernard', '1969-08-13', '5 rue Pierre Motte', 'SAINTE-ANNE', 'Guadeloupe', '97180'),
(67, 'Andust', 'Orva', 'Meilleur', '1958-07-04', '93 Chemin Du Lavarin Sud', 'CAHORS', 'Midi-Pyrénées', '46000'),
(68, 'Didellp', 'Juliette', 'Fongemie', '1962-01-08', '32 place Stanislas', 'NANTES', 'Pays de la Loire', '44100'),
(69, 'Forideare', 'Gay', 'Courtemanche', '1996-10-31', '72 avenue de l''Amandier', 'BOBIGNY', 'Île-de-France', '93000'),
(70, 'Gaceaddly35', 'Camille', 'Lacharité', '1935-10-17', '39 Place de la Gare', 'COLMAR', 'Alsace', '68000'),
(71, 'Spricand', 'Caroline', 'Villeneuve', '1963-05-08', '17 rue des six frères Ruellan', 'SANNOIS', 'Île-de-France', '95110'),
(72, 'Efins1991', 'Noémi', 'Dandonneau', '1991-09-02', '48 rue Gouin de Beauchesne', 'SAINT-NAZAIRE', 'Pays de la Loire', '44600'),
(73, 'Logne1956', 'Dominique', 'Charbonneau', '1956-11-08', '49 rue du Clair Bocage', 'LA ROCHE-SUR-YON', 'Pays de la Loire', '85000'),
(74, 'Delent36', 'Agate', 'Paquet', '1936-01-25', '35 rue de l''Aigle', 'LA POSSESSION', 'La Réunion', '97419'),
(75, 'Anste1966', 'Diane', 'Gingras', '1966-01-11', '17 Rue St Ferréol', 'MEUDON-LA-FORÊT', 'Île-de-France', '92360'),
(76, 'Sping1979', 'Marie', 'Lanoie', '1979-03-28', '61 Rue de la Pompe', 'MARCQ-EN-BAROEUL', 'Nord-Pas-de-Calais', '59700'),
(77, 'Gint1938', 'Élisabeth', 'Harquin', '1938-02-20', '40 rue Adolphe Wurtz', 'LE PETIT-QUEVILLY', 'Haute-Normandie', '76140'),
(78, 'Thalketithed', 'Adrienne', 'Chandonnet', '1953-12-08', '94 rue Jean-Monnet', 'GONESSE', 'Île-de-France', '95500'),
(79, 'Butimand', 'Elita', 'Pelchat', '1962-12-08', '58 Rue Frédéric Chopin', 'VICHY', 'Auvergne', '03200'),
(80, 'Hictedy', 'Christabel', 'Ruel', '1973-03-08', '67 rue Goya', 'LE MANS', 'Pays de la Loire', '72100'),
(81, 'Desi1937', 'Ambra', 'Barteaux', '1937-12-22', '6 boulevard Albin Durand', 'CHALON-SUR-SAÔNE', 'Bourgogne', '71100'),
(82, 'Morke1932', 'Martine', 'Doyon', '1932-05-18', '31 Avenue De Marlioz', 'ARGENTEUIL', 'Île-de-France', '95100'),
(83, 'Diguest', 'Anaïs', 'Routhier', '1968-01-25', '42 rue Reine Elisabeth', 'MENTON', 'Provence-Alpes-Côte d''Azur', '06500'),
(84, 'Captungthe', 'Maureen', 'Laberge', '1993-01-10', '62 Chemin Du Lavarin Sud', 'CAEN', 'Basse-Normandie', '14000'),
(85, 'Werawn1934', 'Orane', 'Rouze', '1934-01-06', '42 rue Bonneterie', 'MONTBÉLIARD', 'Franche-Comté', '25200'),
(86, 'Plive1989', 'Faye', 'Sevier', '1989-02-19', '25 rue Gouin de Beauchesne', 'SAINT-PIERRE', 'Guyane', '97410'),
(87, 'Fourpried', 'Lucille', 'Joly', '1943-04-04', '88 rue des six frères Ruellan', 'SALON-DE-PROVENCE', 'Provence-Alpes-Côte d''Azur', '13300'),
(88, 'Dawas1963', 'Oriel', 'Labrecque', '1963-05-19', '18 rue Victor Hugo', 'CONFLANS-SAINTE-HONORINE', 'Île-de-France', '78700'),
(89, 'Whimad', 'Édith', 'Charlesbois', '1951-03-31', '16 avenue Jules Ferry', 'SIX-FOURS-LES-PLAGES', 'Provence-Alpes-Côte d''Azur', '83140'),
(90, 'Coulth', 'Aiglentina', 'Grenier', '1951-02-19', '88 rue des Lacs', 'HYÈRES', 'Provence-Alpes-Côte d''Azur', '83400'),
(91, 'Himmem94', 'Voleta', 'Leclerc', '1994-01-30', '40 rue des Soeurs', 'LA GARDE', 'Provence-Alpes-Côte d''Azur', '83130'),
(92, 'Harbiang', 'Blondelle', 'Sevier', '1977-02-01', '58 Rue Bonnet', 'VOIRON', 'Rhône-Alpes', '38500'),
(93, 'Youce1945', 'Anouk', 'Caouette', '1945-08-07', '22 Rue St Ferréol', 'METZ', 'Lorraine', '57070'),
(94, 'Nowles', 'La Roux', 'Dupont', '1941-07-15', '24 boulevard Bryas', 'CREIL', 'Picardie', '60100'),
(95, 'Pasuded', 'Isabelle', 'Foucault', '1958-04-10', '63 rue Jean Vilar', 'BEAUVAIS', 'Picardie', '60000'),
(96, 'Brible', 'Adrienne', 'Beaulac', '1986-04-26', '63 Rue Bonnet', 'VITRY-SUR-SEINE', 'Île-de-France', '94400'),
(97, 'Waskeend1954', 'Blondelle', 'Bourgouin', '1954-10-08', '5 Chemin Challet', 'LIMOGES', 'Limousin', '87100'),
(98, 'Bectise', 'Apolline', 'Giroux', '1944-04-07', '32 Avenue des Tuileries', 'GUÉRET', 'Limousin', '23000'),
(99, 'Nattighe', 'Audrey', 'Cadieux', '1983-08-22', '79 rue Saint Germain', 'GIF-SUR-YVETTE', 'Île-de-France', '91190'),
(100, 'Saway1991', 'Pauline', 'Pelchat', '1991-04-12', '58 avenue de Bouvines', 'SEVRAN', 'Île-de-France', '93270'),
(101, 'Matur1986', 'Afrodille', 'Chevrette', '1986-04-09', '18 rue Léon Dierx', 'LOMME', 'Nord-Pas-de-Calais', '59160'),
(102, 'Whigelp', 'Romaine', 'De La Vergne', '1997-12-16', '18 Rue Hubert de Lisle', 'LOOS', 'Nord-Pas-de-Calais', '59120'),
(103, 'Anythest', 'Adélaïde', 'Lessard', '1935-10-26', '48 rue Pierre Motte', 'SAINTE-ANNE', 'Guadeloupe', '97180'),
(104, 'Twean1955', 'Fleurette', 'Allain', '1955-01-05', '87 rue Gustave Eiffel', 'RILLIEUX-LA-PAPE', 'Rhône-Alpes', '69140'),
(105, 'Rommed', 'Marveille', 'Plante', '1964-08-31', '60 rue de Groussay', 'ROMANS-SUR-ISÈRE', 'Rhône-Alpes', '26100'),
(106, 'Beetch', 'Mirabelle', 'Royer', '1991-11-08', '94 boulevard Aristide Briand', 'LE BOUSCAT', 'Aquitaine', '33110'),
(107, 'Hicis1967', 'Solaine', 'Galarneau', '1967-08-07', '73 rue Isambard', 'FRÉJUS', 'Provence-Alpes-Côte d''Azur', '83600'),
(108, 'Auneance', 'Afrodille', 'Godin', '1948-09-17', '36 cours Franklin Roosevelt', 'MARSEILLE', 'Provence-Alpes-Côte d''Azur', '13009'),
(109, 'Wisford', 'Melusina', 'Lizotte', '1985-03-20', '64 avenue Jules Ferry', 'SOTTEVILLE-LÈS-ROUEN', 'Haute-Normandie', '76300'),
(110, 'Womustand', 'Oriel', 'Barrière', '1969-02-14', '75 Rue du Limas', 'BASTIA', 'Corse', '20200'),
(111, 'Notheir', 'Dalmace', 'Bouchard', '1936-03-19', '49 rue des Soeurs', 'LA CELLE-SAINT-CLOUD', 'Île-de-France', '78170'),
(112, 'Bants1968', 'Allyriane', 'Pouliotte', '1968-01-09', '11 rue des Dunes', 'SAINT-MARTIN-D''HÈRES', 'Rhône-Alpes', '38400'),
(113, 'Upolliveng', 'Patricia', 'Benjamin', '1956-08-17', '72 rue de l''Aigle', 'LA POSSESSION', 'La Réunion', '97419'),
(114, 'Entaid1937', 'Aya', 'de Chateaub', '1937-06-13', '23 avenue Jean Portalis', 'TULLE', 'Limousin', '19000'),
(115, 'Crusuppeas', 'Alacoque', 'Grenier', '1969-10-10', '53 boulevard Amiral Courbet', 'OULLINS', 'Rhône-Alpes', '69600'),
(116, 'Hompsed', 'Raina', 'Thivierge', '1930-08-27', '97 rue du Faubourg National', 'TAVERNY', 'Île-de-France', '95150'),
(117, 'Maraver', 'Belisarda', 'Girard', '1947-05-30', '57 rue de Geneve', 'AMIENS', 'Picardie', '80080'),
(118, 'Hisilat', 'Yolande', 'Cadieux', '1997-05-22', '51 Rue de la Pompe', 'MAMOUDZOU', 'Mayotte', '97600'),
(119, 'Anfood', 'Natalie', 'Lemieux', '1933-05-22', '1 boulevard Albin Durand', 'CHÂLONS-EN-CHAMPAGNE', 'Champagne-Ardenne', '51000'),
(120, 'Sirint76', 'Nicolette', 'Simon', '1976-07-11', '59 rue des Lacs', 'HOUILLES', 'Île-de-France', '78800'),
(121, 'Whould', 'Pénélope', 'Plaisance', '1948-02-10', '83 Place Charles de Gaulle', 'VILLEMOMBLE', 'Île-de-France', '93250'),
(122, 'Thentins', 'Genevre', 'Huppé', '1952-11-29', '46 rue des Soeurs', 'LA CELLE-SAINT-CLOUD', 'Île-de-France', '78170'),
(123, 'Hologe1929', 'Romaine', 'Bousquet', '1929-12-19', '48 rue Goya', 'LE PERREUX-SUR-MARNE', 'Île-de-France', '94170'),
(124, 'Shoemah', 'Villette', 'Cyr', '1956-12-11', '29 rue Pierre Motte', 'SAINTE-ANNE', 'Guadeloupe', '97180'),
(125, 'Wanding', 'Aubrey', 'St-Jean', '1933-03-30', '91 rue de Raymond Poincaré', 'NEUILLY-SUR-MARNE', 'Île-de-France', '93330'),
(126, 'Voymaiden', 'Odelette', 'Frappier', '1981-03-01', '71 rue du Paillle en queue', 'LES ULIS', 'Île-de-France', '91940'),
(127, 'Swerown', 'Geneviève', 'Lacasse', '1937-11-03', '56 rue Pierre Motte', 'SAINT-DENIS', 'Île-de-France', '97400'),
(128, 'Stoud1970', 'Antoinette', 'Josseaume', '1970-07-16', '71 rue des Soeurs', 'JUAN-LES-PINS', 'Provence-Alpes-Côte d''Azur', '06160'),
(129, 'Easpost98', 'Favor', 'Chatigny', '1998-08-22', '87 rue Beauvau', 'MARSEILLE', 'Provence-Alpes-Côte d''Azur', '13004'),
(130, 'Robjecia1965', 'Philippine', 'Croteau', '1965-10-15', '92 rue de l''Epeule', 'RUEIL-MALMAISON', 'Île-de-France', '92500'),
(131, 'Unte1959', 'Logistilla', 'Baril', '1959-08-19', '65 rue des Chaligny', 'NICE', 'Provence-Alpes-Côte d''Azur', '06000'),
(132, 'Ofore1956', 'Victoire', 'Clément', '1956-12-24', '17 Place de la Gare', 'COLOMBES', 'Île-de-France', '92700'),
(133, 'Acess1974', 'Arnaude', 'Gaulin', '1974-04-15', '70 rue Pierre De Coubertin', 'TOULOUSE', 'Midi-Pyrénées', '31200'),
(134, 'Rothentome', 'Alita', 'Ayot', '1965-04-09', '74 rue Lenotre', 'RAMBOUILLET', 'Île-de-France', '78120'),
(135, 'Cign1949', 'Mireille', 'Truchon', '1949-11-02', '79 Rue Marie De Médicis', 'CALUIRE-ET-CUIRE', 'Rhône-Alpes', '69300'),
(136, 'Somys1954', 'Aurélie', 'Laforest', '1954-09-17', '96 avenue du Marechal Juin', 'SAINT-LAURENT-DU-VAR', 'Provence-Alpes-Côte d''Azur', '06700'),
(137, 'Overs1968', 'Claude', 'Laux', '1968-11-06', '81 rue de Penthièvre', 'PRIVAS', 'Rhône-Alpes', '07000'),
(138, 'Doemput', 'Iva', 'Labelle', '1954-05-12', '36 Place Charles de Gaulle', 'VILLENEUVE-D''ASCQ', 'Nord-Pas-de-Calais', '59491'),
(139, 'Judiction', 'Zoé', 'D''Aubigné', '1930-05-16', '61 Rue Frédéric Chopin', 'VERTOU', 'Pays de la Loire', '44120'),
(140, 'Foromed', 'Falerina', 'Lavoie', '1942-07-25', '18 Rue de Verdun', 'MONTÉLIMAR', 'Rhône-Alpes', '26200'),
(141, 'Hisquam', 'Hedvige', 'Bourdette', '1995-06-01', '78 Place du Jeu de Paume', 'VIGNEUX-SUR-SEINE', 'Île-de-France', '91270'),
(142, 'Evet1960', 'Clarimunda', 'Givry', '1960-07-04', '19 Faubourg Saint Honoré', 'PAU', 'Île-de-France', '64000'),
(143, 'Thollady', 'Henriette', 'Hétu', '1936-10-05', '37 boulevard Albin Durand', 'CERGY', 'Île-de-France', '95000'),
(144, 'Gloold1936', 'Pensee', 'Bazinet', '1936-03-30', '58 boulevard Aristide Briand', 'LE CANNET', 'Provence-Alpes-Côte d''Azur', '06110'),
(145, 'Ourns1983', 'Alita', 'Tisserand', '1983-12-11', '71 rue des Dunes', 'SAINT-MARTIN', 'Guadeloupe', '97150'),
(146, 'Spard1945', 'Fleur', 'Lamour', '1945-11-16', '79 boulevard Aristide Briand', 'LE GRAND-QUEVILLY', 'Haute-Normandie', '76120'),
(147, 'Veteady', 'Clarice', 'Sacré', '1997-04-27', '89 boulevard Bryas', 'COURBEVOIE', 'Île-de-France', '92400'),
(148, 'Arinue', 'Fanette', 'Deschênes', '1981-12-10', '63 avenue de Bouvines', 'SEVRAN', 'Île-de-France', '93270'),
(149, 'Thadd1958', 'Ambra', 'Gabriaux', '1958-12-15', '87 Avenue des Pr''es', 'MONTIGNY-LÈS-METZ', 'Lorraine', '57158'),
(150, 'Illaxy', 'Gaetane', 'Garreau', '1969-02-08', '95 rue Charles Corbeau', 'ÉVREUX', 'Haute-Normandie', '27000'),
(151, 'Therace', 'Capucine', 'Michaud', '1946-07-26', '6 Square de la Couronne', 'OZOIR-LA-FERRIÈRE', 'Île-de-France', '77330'),
(152, 'Spip1948', 'Linette', 'Viens', '1948-05-26', '70 Rue Roussy', 'OLIVET', 'Centre', '45160'),
(153, 'Thre1990', 'Nicolette', 'Briard', '1990-06-28', '75 Place Charles de Gaulle', 'VILLENEUVE-D''ASCQ', 'Nord-Pas-de-Calais', '59491'),
(154, 'Thren1945', 'Avelaine', 'Monrency', '1945-12-18', '82 Chemin des Bateliers', 'AJACCIO', 'Corse', '20000'),
(155, 'Thempt', 'Julienne', 'Lapresse', '1988-12-27', '57 rue Petite Fusterie', 'BOURGOIN-JALLIEU', 'Rhône-Alpes', '38300'),
(156, 'Commoodle', 'Harriette', 'Roussel', '1979-06-29', '56 rue de l''Epeule', 'ROUEN', 'Haute-Normandie', '76000'),
(157, 'Cenry1933', 'Simone', 'Proulx', '1933-12-29', '89 cours Jean Jaures', 'BORDEAUX', 'Aquitaine', '33800'),
(158, 'Deping', 'Morgana', 'Tessier', '1963-05-28', '1 Rue Joseph Vernet', 'BAIE-MAHAULT', 'Guadeloupe', '97122'),
(159, 'Antaked', 'Adrienne', 'Deschamps', '1952-01-11', '22 Place Charles de Gaulle', 'VILLENAVE-D''ORNON', 'Aquitaine', '33140'),
(160, 'Thumbell', 'Germaine', 'Édouard', '1974-11-19', '5 boulevard d''Alsace', 'VAULX-EN-VELIN', 'Rhône-Alpes', '69120'),
(161, 'Colize', 'Merci', 'Lacombe', '1949-03-01', '80 rue Gustave Eiffel', 'REZÉ', 'Pays de la Loire', '44400'),
(162, 'Ithey1948', 'Clementine', 'Dostie', '1948-09-20', '45 place Stanislas', 'NANTERRE', 'Île-de-France', '92000'),
(163, 'Thare1964', 'Pénélope', 'Lapresse', '1964-11-25', '60 Chemin Du Lavarin Sud', 'CAEN', 'Basse-Normandie', '14000'),
(164, 'Therb1948', 'Raina', 'Lussier', '1948-04-22', '3 Chemin Du Lavarin Sud', 'CAEN', 'Basse-Normandie', '14000'),
(165, 'Blanne', 'Mirabelle', 'Plourde', '1965-06-10', '92 Place de la Gare', 'COLOMBES', 'Île-de-France', '92700'),
(166, 'Theyne', 'Patience', 'Tisserand', '1933-03-16', '68 rue Léon Dierx', 'LIVRY-GARGAN', 'Île-de-France', '93190'),
(167, 'Racter', 'Fifi', 'Gregoire', '1949-08-02', '30 rue de Lille', 'ARRAS', 'Nord-Pas-de-Calais', '62000'),
(168, 'Cring1968', 'Maryse', 'Lamoureux', '1968-08-30', '3 rue Jean-Monnet', 'GOUSSAINVILLE', 'Île-de-France', '95190'),
(169, 'Poing1940', 'Corinne', 'Verreau', '1940-12-12', '59 Rue du Limas', 'BASTIA', 'Corse', '20600'),
(170, 'Woulles', 'Didiane', 'Bernard', '1989-03-09', '24 avenue de Bouvines', 'SCHOELCHER', 'Martinique', '97233'),
(171, 'Saittely', 'Joséphine', 'Méthot', '1974-08-20', '71 route de Lyon', 'ISSY-LES-MOULINEAUX', 'Île-de-France', '92130'),
(172, 'Popecriente', 'Methena', 'Dupuis', '1987-12-09', '69 rue des lieutemants Thomazo', 'DIJON', 'Bourgogne', '21000'),
(173, 'Ples1963', 'Dielle', 'Tougas', '1963-12-04', '54 rue des Chaligny', 'NICE', 'Provence-Alpes-Côte d''Azur', '06000'),
(174, 'Scang1995', 'Susanne', 'Plaisance', '1995-08-07', '95 Rue du Palais', 'ERMONT', 'Île-de-France', '95120'),
(175, 'Armare', 'Crescent', 'Bisson', '1974-01-07', '54 Faubourg Saint Honoré', 'PARIS', 'Île-de-France', '75116'),
(176, 'Woutentes96', 'Anouk', 'Larocque', '1996-02-27', '12 rue Goya', 'LE MOULE', 'Guadeloupe', '97160'),
(177, 'Onoten', 'Frédérique', 'St-Jacques', '1958-12-03', '65 rue Michel Ange', 'LE HAVRE', 'Haute-Normandie', '76600'),
(178, 'Zoukedecale', 'Prunella', 'Dupont', '1962-05-07', '88 rue des Nations Unies', 'SAINT-BRIEUC', 'Bretagne', '22000'),
(179, 'Hounat', 'Pensee', 'Leroy', '1966-10-16', '16 Rue du Limas', 'BAYONNE', 'Aquitaine', '64100'),
(180, 'Thespery', 'Albertine', 'Gaudreau', '1960-09-10', '58 boulevard Bryas', 'DAMMARIE-LES-LYS', 'Île-de-France', '77190'),
(181, 'Otelinise', 'Thérèse', 'Primeau', '1974-03-20', '91 rue Sadi Carnot', 'AUCH', 'Midi-Pyrénées', '32000'),
(182, 'Tiese1937', 'Babette', 'Quenneville', '1937-06-27', '12 rue de la Boétie', 'PONTAULT-COMBAULT', 'Île-de-France', '77340'),
(183, 'Didolent65', 'Adorlee', 'Lanteigne', '1965-07-16', '56 rue Gontier-Patin', 'AIX-EN-PROVENCE', 'Provence-Alpes-Côte d''Azur', '13100'),
(184, 'Sionsay', 'Mirabelle', 'Sicard', '1998-09-13', '26 rue du Général Ailleret', 'LES ABYMES', 'Guadeloupe', '97139'),
(185, 'Rainkinste', 'Laverne', 'Guédry', '1936-07-10', '57 Rue de Strasbourg', 'CLICHY-SOUS-BOIS', 'Île-de-France', '93390'),
(186, 'Wiflutay', 'Delmare', 'Gagné', '1930-08-31', '14 rue des Nations Unies', 'SAINT-CLOUD', 'Île-de-France', '92210'),
(187, 'Theried', 'Inès', 'Bourgeau', '1980-12-03', '5 boulevard Aristide Briand', 'LE CHESNAY', 'Île-de-France', '78150'),
(188, 'Tuptionvill1932', 'Patricia', 'Arnoux', '1932-09-04', '22 avenue de l''Amandier', 'BOBIGNY', 'Île-de-France', '93000'),
(189, 'Mustithe', 'Fifi', 'Achin', '1980-12-28', '92 boulevard de Prague', 'NOISY-LE-GRAND', 'Île-de-France', '93160'),
(190, 'Suat1961', 'Favor', 'Grivois', '1961-10-12', '18 Chemin Du Lavarin Sud', 'CAGNES-SUR-MER', 'Provence-Alpes-Côte d''Azur', '06800'),
(191, 'Twold1960', 'Monique', 'Fréchette', '1960-08-28', '26 rue de la République', 'LYON', 'Rhône-Alpes', '69003'),
(192, 'Lartax52', 'Sydney', 'Généreux', '1952-11-13', '1 Quai des Belges', 'MEAUX', 'Île-de-France', '77100'),
(193, 'Whisele', 'Emmeline', 'Brunault', '1938-11-05', '43 boulevard Albin Durand', 'CERGY', 'Île-de-France', '95000'),
(194, 'Fonly1976', 'Andrée', 'Poisson', '1976-10-21', '72 rue de Penthièvre', 'PONTOISE', 'Île-de-France', '95000'),
(195, 'Bulget1973', 'Corinne', 'Foucault', '1973-08-10', '24 Rue Hubert de Lisle', 'LUNEL', 'Languedoc-Roussillon', '34400'),
(196, 'Warrot', 'Charmaine', 'Bélair', '1962-06-15', '93 quai Saint-Nicolas', 'TOURNEFEUILLE', 'Midi-Pyrénées', '31170'),
(197, 'Tures1946', 'Xavierre', 'Laderoute', '1946-11-16', '30 place de Miremont', 'VILLENEUVE-SUR-LOT', 'Aquitaine', '47300'),
(198, 'Humodys', 'Claire', 'Chabot', '1941-02-14', '81 rue Pierre Motte', 'SAINT-DENIS', 'Île-de-France', '97400'),
(199, 'Pontliatich', 'Calandre', 'Boileau', '1993-10-24', '76 rue de la République', 'LYON', 'Rhône-Alpes', '69002'),
(200, 'Ardess', 'Clarice', 'Simon', '1989-06-18', '98 avenue Jean Portalis', 'TRAPPES', 'Île-de-France', '78190'),
(201, 'Rith1946', 'Dorothée', 'Pépin', '1946-12-03', '97 rue du Faubourg National', 'TAVERNY', 'Île-de-France', '95150'),
(202, 'Stessiging1945', 'Amorette', 'Duranseau', '1945-12-23', '88 avenue Voltaire', 'MAISONS-LAFFITTE', 'Île-de-France', '78600'),
(203, 'Wayincer', 'Marjolaine', 'Daoust', '1931-08-09', '76 Rue St Ferréol', 'MEUDON', 'Île-de-France', '92190'),
(204, 'Fersuche', 'Renée', 'Saurel', '1985-08-13', '51 rue du Château', 'SAINT-HERBLAIN', 'Pays de la Loire', '44800'),
(205, 'Ligicest98', 'Avice', 'Champagne', '1998-05-09', '60 rue Adolphe Wurtz', 'LE ROBERT', 'Martinique', '97231'),
(206, 'Coubithe', 'Minette', 'Laframboise', '1972-08-22', '16 boulevard de la Liberation', 'MARSEILLE', 'Provence-Alpes-Côte d''Azur', '13012'),
(207, 'Theirsen', 'Juliette', 'Asselin', '1953-03-12', '96 avenue de l''Amandier', 'BORDEAUX', 'Aquitaine', '33000'),
(208, 'Arded1979', 'Adélaïde', 'Legault', '1979-02-10', '86 Chemin Du Lavarin Sud', 'CAGNES-SUR-MER', 'Provence-Alpes-Côte d''Azur', '06800'),
(209, 'Arkly1940', 'Arnaude', 'Fontaine', '1940-05-17', '90 boulevard Amiral Courbet', 'ORLY', 'Île-de-France', '94310'),
(210, 'Bilart', 'Eugenia', 'Adler', '1963-10-26', '5 cours Franklin Roosevelt', 'MARSEILLE', 'Provence-Alpes-Côte d''Azur', '13008'),
(211, 'Tuddly1996', 'Pauline', 'Courcelle', '1996-03-28', '65 Chemin Challet', 'LILLE', 'Nord-Pas-de-Calais', '59800'),
(212, 'Ansionatter', 'Inès', 'Rousseau', '1940-05-23', '15 boulevard de la Liberation', 'MARSEILLE', 'Provence-Alpes-Côte d''Azur', '13013'),
(213, 'Difebath', 'Isabelle', 'Grandpré', '1951-07-28', '88 rue de la Hulotais', 'SAINT-QUENTIN', 'Picardie', '02100'),
(214, 'Douner', 'Marine', 'Primeau', '1956-03-06', '72 rue de la Mare aux Carats', 'MONTPELLIER', 'Languedoc-Roussillon', '34070'),
(215, 'Obleas1952', 'Jeanette', 'St-Jean', '1952-05-18', '53 Avenue Millies Lacroix', 'ÉCHIROLLES', 'Rhône-Alpes', '38130'),
(216, 'Misho1977', 'Élodie', 'Côté', '1977-09-24', '58 Place du Jeu de Paume', 'VIENNE', 'Rhône-Alpes', '38200'),
(217, 'Suden1944', 'Sylvie', 'Guilmette', '1944-08-24', '80 boulevard Albin Durand', 'CHÂLONS-EN-CHAMPAGNE', 'Champagne-Ardenne', '51000'),
(218, 'Antiou', 'Amarante', 'Beaulac', '1985-09-01', '70 rue Adolphe Wurtz', 'LE ROBERT', 'Martinique', '97231'),
(219, 'Inteldrour', 'Honore', 'Des Meaux', '1973-11-17', '51 rue de Raymond Poincaré', 'NEUILLY-SUR-MARNE', 'Île-de-France', '93330'),
(220, 'Mentumer', 'Valentine', 'Jodion', '1984-01-10', '84 Chemin Des Bateliers', 'ANGERS', 'Pays de la Loire', '49000'),
(221, 'Foraors', 'Matilda', 'Ferland', '1977-03-07', '32 rue Ernest Renan', 'CHELLES', 'Île-de-France', '77500'),
(222, 'Thavy1964', 'Claire', 'Beauchemin', '1964-06-17', '69 rue Gustave Eiffel', 'RIS-ORANGIS', 'Île-de-France', '91000'),
(223, 'Courand1983', 'Agathe', 'Daigneault', '1983-10-27', '85 rue Marie de Médicis', 'BEZONS', 'Île-de-France', '95870'),
(224, 'Whistooday', 'Éléonore', 'Trottier', '1971-11-25', '74 rue de l''Aigle', 'LA GARENNE-COLOMBES', 'Île-de-France', '92250'),
(225, 'Herus1983', 'Cher', 'Babin', '1983-10-26', '98 route de Lyon', 'ISTRES', 'Provence-Alpes-Côte d''Azur', '13800'),
(226, 'Pokentedidly', 'Olivie', 'Quessy', '1970-05-01', '29 Rue de la Pompe', 'MARIGNANE', 'Provence-Alpes-Côte d''Azur', '13700'),
(227, 'Botellould', 'Maurelle', 'Chastain', '1954-11-21', '89 quai Saint-Nicolas', 'TOURNEFEUILLE', 'Midi-Pyrénées', '31170'),
(228, 'Moker1984', 'Brunella', 'Dupont', '1984-01-31', '32 Avenue De Marlioz', 'ARLES', 'Provence-Alpes-Côte d''Azur', '13200'),
(229, 'Quity1977', 'Michèle', 'Mouet', '1977-06-02', '79 cours Jean Jaures', 'BORDEAUX', 'Aquitaine', '33800'),
(230, 'Mageting', 'Falerina', 'Dupéré', '1979-03-23', '34 boulevard Bryas', 'CROIX', 'Nord-Pas-de-Calais', '59170'),
(231, 'Youstelying', 'Laure', 'Barrientos', '1965-04-01', '12 Rue St Ferréol', 'MEUDON', 'Île-de-France', '92190'),
(232, 'Yound1952', 'Ophelia', 'Beaujolie', '1952-10-08', '64 Rue St Ferréol', 'MEUDON-LA-FORÊT', 'Île-de-France', '92360'),
(233, 'Therewo1934', 'Caroline', 'Ratté', '1934-08-08', '77 rue des Lacs', 'HÉNIN-BEAUMONT', 'Nord-Pas-de-Calais', '62110'),
(234, 'Greped', 'Chantal', 'Royer', '1964-10-31', '94 rue Bonneterie', 'MONTAUBAN', 'Midi-Pyrénées', '82000'),
(235, 'Bections', 'Gabrielle', 'Mailhot', '1973-04-30', '47 rue des Soeurs', 'LA CIOTAT', 'Provence-Alpes-Côte d''Azur', '13600'),
(236, 'Huragnional', 'Zoé', 'Duperré', '1974-09-20', '5 rue de Lille', 'ARMENTIÈRES', 'Nord-Pas-de-Calais', '59280'),
(237, 'Sesee1948', 'Pénélope', 'Ailleboust', '1948-09-22', '50 rue des Soeurs', 'LA CELLE-SAINT-CLOUD', 'Île-de-France', '78170'),
(238, 'Reand1997', 'Yolette', 'Asselin', '1997-02-12', '84 Rue de la Pompe', 'MANOSQUE', 'Provence-Alpes-Côte d''Azur', '04100'),
(239, 'Crivair', 'Isabelle', 'Deblois', '1947-06-17', '93 rue de la Boétie', 'POISSY', 'Île-de-France', '78300'),
(240, 'Marproduch', 'Elita', 'Lévesque', '1968-02-12', '71 Rue de la Pompe', 'MANTES-LA-JOLIE', 'Île-de-France', '78200'),
(241, 'Brat1965', 'Falerina', 'Bouchard', '1965-05-21', '19 avenue de l''Amandier', 'BONDY', 'Île-de-France', '93140'),
(242, 'Sonterver', 'Fifi', 'Béland', '1991-05-11', '52 Chemin Des Bateliers', 'ANGOULÊME', 'Poitou-Charentes', '16000'),
(243, 'Pariginal', 'Arlette', 'Chaussée', '1951-08-22', '92 rue des lieutemants Thomazo', 'DIJON', 'Bourgogne', '21000'),
(244, 'Prilder55', 'Matilda', 'Caron', '1955-03-23', '48 rue du Paillle en queue', 'LES ULIS', 'Île-de-France', '91940'),
(245, 'Wasitas', 'Kari', 'Ruel', '1958-05-28', '42 avenue Jean Portalis', 'TREMBLAY-EN-FRANCE', 'Île-de-France', '93290'),
(246, 'Wiford', 'Ruby', 'Pirouet', '1931-06-24', '23 rue de Groussay', 'ROMAINVILLE', 'Île-de-France', '93230'),
(247, 'Donentolon1967', 'Melodie', 'Salmons', '1967-01-18', '5 Place Charles de Gaulle', 'VILLENEUVE-D''ASCQ', 'Nord-Pas-de-Calais', '59650'),
(248, 'Morant1996', 'Prunella', 'Salmons', '1996-03-13', '28 rue Pierre Motte', 'SAINTE-ANNE', 'Guadeloupe', '97180'),
(249, 'Eply1950', 'Noémi', 'Du Trieux', '1950-10-19', '65 Square de la Couronne', 'PALAISEAU', 'Île-de-France', '91120'),
(250, 'Sull1942', 'Isabelle', 'Généreux', '1942-09-03', '90 Rue du Limas', 'BEAUNE', 'Bourgogne', '21200'),
(251, 'Shaterinew', 'Pierrette', 'Chevrette', '1949-04-12', '49 rue Victor Hugo', 'COUDEKERQUE-BRANCHE', 'Nord-Pas-de-Calais', '59210'),
(252, 'Liveres', 'Erembourg', 'Douffet', '1974-10-14', '76 rue Gouin de Beauchesne', 'SAINT-PAUL', 'Guyane', '97460'),
(253, 'Swuzzy', 'Nathalie', 'Gareau', '1963-06-01', '33 rue Clement Marot', 'PÉRIGUEUX', 'Aquitaine', '24000'),
(254, 'Penceff', 'Faye', 'Mailly', '1999-08-07', '36 rue du Fossé des Tanneurs', 'TOULON', 'Provence-Alpes-Côte d''Azur', '83200'),
(255, 'Seced1947', 'Ruby', 'Loiseau', '1947-08-29', '69 rue La Boétie', 'PARIS', 'Île-de-France', '75015'),
(256, 'Spid1974', 'Fantina', 'Gosselin', '1974-06-24', '98 rue Petite Fusterie', 'BOURGES', 'Centre', '18000'),
(257, 'Amence', 'Capucine', 'Pinneau', '1965-08-11', '27 rue Reine Elisabeth', 'METZ', 'Lorraine', '57000'),
(258, 'Actoluesce', 'Esmeraude', 'Rochon', '1945-01-12', '63 rue des Lacs', 'HYÈRES', 'Provence-Alpes-Côte d''Azur', '83400'),
(259, 'Sionsenme', 'Sylvie', 'Lagacé', '1994-02-03', '44 rue Sébastopol', 'SAINTE-MARIE', 'Guyane', '97438'),
(260, 'Toger1998', 'Gaetane', 'Grandpré', '1998-01-31', '90 avenue de l''Amandier', 'BOIS-COLOMBES', 'Île-de-France', '92270'),
(261, 'Mostaks', 'Searlait', 'Belisle', '1989-01-10', '80 rue de l''Epeule', 'SAINT-ANDRÉ', 'Guyane', '97440'),
(262, 'Expregiat1946', 'Cosette', 'Lebel', '1946-12-17', '90 rue des Nations Unies', 'SAINT-BENOÎT', 'Guyane', '97470'),
(263, 'Giss1978', 'Claudette', 'Labelle', '1978-02-01', '52 Chemin des Bateliers', 'ALBI', 'Midi-Pyrénées', '81000'),
(264, 'Forgest1977', 'Virginie', 'Aubin', '1977-10-06', '17 rue de l''Epeule', 'ROUEN', 'Haute-Normandie', '76100'),
(265, 'Beftelf', 'Azura', 'Goddu', '1941-09-13', '98 rue Descartes', 'SUCY-EN-BRIE', 'Île-de-France', '94370'),
(266, 'Uselp1952', 'Jewel', 'Hughes', '1952-06-08', '86 rue Saint Germain', 'GENNEVILLIERS', 'Île-de-France', '92230'),
(267, 'Manselits', 'Royale', 'Paquin', '1955-08-18', '67 Rue Joseph Vernet', 'BAIE-MAHAULT', 'Guadeloupe', '97122'),
(268, 'Ints1933', 'Laure', 'Pelchat', '1933-01-12', '54 rue du Château', 'SAINT-HERBLAIN', 'Pays de la Loire', '44800'),
(269, 'Rouresing', 'Pauline', 'Caron', '1957-08-19', '3 Place de la Madeleine', 'PARIS', 'Île-de-France', '75012'),
(270, 'Nink1947', 'Eglantine', 'Talon', '1947-05-26', '96 rue Victor Hugo', 'COMPIÈGNE', 'Picardie', '60200'),
(271, 'Maidest52', 'Eglantine', 'Fremont', '1952-03-20', '89 boulevard Bryas', 'CRÉTEIL', 'Île-de-France', '94000'),
(272, 'Contich', 'Lucille', 'Duranseau', '1961-05-31', '58 rue des lieutemants Thomazo', 'DOLE', 'Franche-Comté', '39100'),
(273, 'Therstrons', 'Denise', 'Pelchat', '1981-03-31', '44 boulevard Aristide Briand', 'LE CREUSOT', 'Bourgogne', '71200'),
(274, 'Livictere', 'Nicolette', 'Couture', '1990-05-16', '17 rue Isambard', 'FRÉJUS', 'Provence-Alpes-Côte d''Azur', '83600'),
(275, 'Plest1929', 'Alaine', 'Lebrun', '1929-10-09', '28 rue Bonneterie', 'MONS-EN-BAROEUL', 'Nord-Pas-de-Calais', '59370'),
(276, 'Whaverearld', 'Yolette', 'Laderoute', '1942-02-24', '16 rue du Faubourg National', 'TARBES', 'Midi-Pyrénées', '65000'),
(277, 'Sakents', 'Agnès', 'Lagueux', '1943-07-11', '9 avenue du Marechal Juin', 'SAINT-LOUIS', 'Guyane', '97450'),
(278, 'Hatemaked', 'Gaetane', 'Gendron', '1996-12-23', '50 Cours Marechal-Joffre', 'DIEPPE', 'Haute-Normandie', '76200'),
(279, 'Lonater', 'Holly', 'Chauvin', '1964-03-29', '99 rue Saint Germain', 'GIF-SUR-YVETTE', 'Île-de-France', '91190'),
(280, 'Coord1979', 'Coralie', 'Vernadeau', '1979-06-20', '91 Rue du Limas', 'BAYONNE', 'Aquitaine', '64100'),
(281, 'Donts1954', 'Aubrette', 'Marchesseault', '1954-09-22', '85 boulevard Albin Durand', 'CERGY', 'Île-de-France', '95800'),
(282, 'Althe1953', 'Françoise', 'Coudert', '1953-02-03', '49 rue Nationale', 'PARIS', 'Île-de-France', '75004'),
(283, 'Lighly', 'Agathe', 'Lajeunesse', '1999-05-13', '43 rue du Faubourg National', 'THIAIS', 'Île-de-France', '94320'),
(284, 'Prach1933', 'Laetitia', 'Gauthier', '1933-05-05', '27 avenue du Marechal Juin', 'SAINT-LEU', 'Guyane', '97436'),
(285, 'Promes', 'Dorothée', 'Achin', '1938-03-02', '95 rue Grande Fusterie', 'BRÉTIGNY-SUR-ORGE', 'Île-de-France', '91220'),
(286, 'Dich1985', 'Dielle', 'Gaillou', '1985-02-21', '88 Place de la Gare', 'COLOMBES', 'Île-de-France', '92700'),
(287, 'Befousped', 'Anastasie', 'Primeau', '1986-12-18', '76 Rue de Verdun', 'MONTFERMEIL', 'Île-de-France', '93370'),
(288, 'Rusoody', 'Amedee', 'Therriault', '1966-06-16', '63 boulevard de la Liberation', 'MARSEILLE', 'Provence-Alpes-Côte d''Azur', '13011'),
(289, 'Prucestras1978', 'Mavise', 'Guay', '1978-11-11', '70 rue des Soeurs', 'LA CIOTAT', 'Provence-Alpes-Côte d''Azur', '13600'),
(290, 'Roak1990', 'Inès', 'Robitaille', '1990-11-21', '29 rue du Clair Bocage', 'LA SEYNE-SUR-MER', 'Provence-Alpes-Côte d''Azur', '83500'),
(291, 'Selinglese', 'Aceline', 'Deslauriers', '1942-02-26', '3 avenue Ferdinand de Lesseps', 'GRASSE', 'Provence-Alpes-Côte d''Azur', '06130'),
(292, 'Upoudiles', 'Genevre', 'Lépicier', '1968-07-21', '48 rue de Groussay', 'ROSNY-SOUS-BOIS', 'Île-de-France', '93110'),
(293, 'Pria1999', 'Didiane', 'Déziel', '1999-02-17', '73 place Maurice-Charretier', 'CHAMPS-SUR-MARNE', 'Île-de-France', '77420'),
(294, 'Blearly', 'Madeleine', 'Austin', '1949-10-01', '21 boulevard Bryas', 'COURBEVOIE', 'Île-de-France', '92400'),
(295, 'Evelostrues', 'Ancelote', 'Meilleur', '1990-08-21', '18 Rue Hubert de Lisle', 'LORMONT', 'Aquitaine', '33310'),
(296, 'Theity', 'Logistilla', 'Desruisseaux', '1949-02-04', '80 rue Marguerite', 'VINCENNES', 'Île-de-France', '94300'),
(297, 'Whostravion', 'Dixie', 'Robillard', '1932-11-04', '66 avenue de Provence', 'VANNES', 'Bretagne', '56000'),
(298, 'Hood1977', 'Rosemarie', 'Rocheleau', '1977-04-21', '6 place de Miremont', 'VILLENEUVE-LA-GARENNE', 'Île-de-France', '92390'),
(299, 'Toonde', 'Charmaine', 'Thivierge', '1985-04-29', '3 Rue du Limas', 'BAYONNE', 'Aquitaine', '64100'),
(300, 'Arehouria', 'Capucine', 'Rossignol', '1930-12-08', '82 rue Michel Ange', 'LE HAVRE', 'Haute-Normandie', '76620'),
(301, 'Therecting', 'Fayme', 'Paulet', '1966-04-12', '49 avenue de Bouvines', 'SEVRAN', 'Île-de-France', '93270'),
(302, 'Betmadvand80', 'Marthe', 'Chatigny', '1980-06-01', '80 Rue Frédéric Chopin', 'VICHY', 'Auvergne', '03200'),
(303, 'Mortard45', 'Andrée', 'Rocheleau', '1945-02-11', '76 rue de Penthièvre', 'QUIMPER', 'Bretagne', '29000'),
(304, 'Thily1990', 'Yolette', 'Bergeron', '1990-05-14', '51 rue Sadi Carnot', 'AURILLAC', 'Auvergne', '15000'),
(305, 'Sillux59', 'Pansy', 'Charette', '1959-09-05', '65 rue des lieutemants Thomazo', 'DOLE', 'Franche-Comté', '39100'),
(306, 'Camonwarld', 'Susanne', 'Givry', '1972-08-26', '65 quai Saint-Nicolas', 'TOULOUSE', 'Midi-Pyrénées', '31500'),
(307, 'Evenever', 'Louise', 'Vincent', '1929-12-26', '70 Place de la Gare', 'COGNAC', 'Poitou-Charentes', '16100'),
(308, 'Ratoctore1946', 'Allyriane', 'Gauthier', '1946-12-07', '81 boulevard Bryas', 'COURBEVOIE', 'Île-de-France', '92400'),
(309, 'Seensess', 'Maryse', 'Méthot', '1970-05-11', '48 rue de Geneve', 'ALFORTVILLE', 'Île-de-France', '94140'),
(310, 'Vally1988', 'Marjolaine', 'Lajoie', '1988-08-25', '23 rue de l''Aigle', 'LA MADELEINE', 'Nord-Pas-de-Calais', '59110'),
(311, 'Edmis1961', 'Roux', 'Chouinard', '1961-01-20', '43 rue Jean Vilar', 'BÈGLES', 'Aquitaine', '33130'),
(312, 'Fident', 'Brice', 'Parizeau', '1992-11-23', '46 Chemin des Bateliers', 'AJACCIO', 'Corse', '20000'),
(313, 'Whily1929', 'Céline', 'Gaulin', '1929-09-26', '68 rue Pierre De Coubertin', 'TOULOUSE', 'Midi-Pyrénées', '31100'),
(314, 'Ortogs', 'Fifine', 'Grignon', '1992-12-21', '85 rue du Faubourg National', 'THIONVILLE', 'Lorraine', '57100'),
(315, 'Wifforge', 'Clothilde', 'Plourde', '1962-03-01', '80 Cours Marechal-Joffre', 'DENAIN', 'Nord-Pas-de-Calais', '59220'),
(316, 'Stentor', 'Manon', 'Arcouet', '1968-01-08', '53 rue de Lille', 'ATHIS-MONS', 'Île-de-France', '91200'),
(317, 'Thromen', 'Estelle', 'Authier', '1969-05-11', '26 quai Saint-Nicolas', 'TOURCOING', 'Nord-Pas-de-Calais', '59200'),
(318, 'Murets', 'Blanchefle', 'Clément', '1984-07-29', '50 Chemin Challet', 'LIÉVIN', 'Nord-Pas-de-Calais', '62800'),
(319, 'Fromme', 'Michèle', 'Lafond', '1963-09-27', '66 rue Sébastopol', 'SAINTE-MARIE', 'Martinique', '97230'),
(320, 'Motifews', 'Alexandrie', 'Gilbert', '1987-08-23', '5 rue des Soeurs', 'LA COURNEUVE', 'Île-de-France', '93120'),
(321, 'Whanterrene', 'Minette', 'Moreau', '1931-09-30', '88 Square de la Couronne', 'PARIS', 'Île-de-France', '75001'),
(322, 'Popop1937', 'Blondelle', 'Bordeleau', '1937-10-14', '56 rue Goya', 'LE MANS', 'Pays de la Loire', '72100'),
(323, 'Kinkin33', 'Leala', 'Chenard', '1933-04-17', '60 Boulevard de Normandie', 'FONTENAY-AUX-ROSES', 'Île-de-France', '92260'),
(324, 'Havell', 'Alita', 'Poulin', '1952-01-31', '57 rue Clement Marot', 'PERPIGNAN', 'Languedoc-Roussillon', '66100'),
(325, 'Mights1996', 'Marguerite', 'Perreault', '1996-05-19', '91 Rue de Verdun', 'MONT-DE-MARSAN', 'Aquitaine', '40000'),
(326, 'Suresse', 'Laurette', 'Gauvin', '1954-10-19', '65 rue Saint Germain', 'GARGES-LÈS-GONESSE', 'Île-de-France', '95140'),
(327, 'Hisk1970', 'Amitee', 'Lamoureux', '1970-12-13', '76 boulevard Bryas', 'CROIX', 'Nord-Pas-de-Calais', '59170'),
(328, 'Shosine', 'Marthe', 'Rocheleau', '1992-05-31', '39 rue Saint Germain', 'GARGES-LÈS-GONESSE', 'Île-de-France', '95140'),
(329, 'Dinly1996', 'Nathalie', 'Monjeau', '1996-06-18', '72 rue Lenotre', 'RENNES', 'Bretagne', '35700'),
(330, 'Pillike', 'Marine', 'Desilets', '1948-01-21', '59 Rue Marie De Médicis', 'CANNES', 'Provence-Alpes-Côte d''Azur', '06400'),
(331, 'Frove1964', 'Agathe', 'Sciverit', '1964-12-11', '63 place Maurice-Charretier', 'CHAMPIGNY-SUR-MARNE', 'Île-de-France', '94500'),
(332, 'Sert1987', 'Delit', 'Leclerc', '1987-03-11', '8 Place du Jeu de Paume', 'VIENNE', 'Rhône-Alpes', '38200'),
(333, 'Harse1988', 'Ila', 'Richard', '1988-07-13', '83 Place de la Gare', 'COLOMIERS', 'Midi-Pyrénées', '31770'),
(334, 'Wought', 'Joy', 'Arsenault', '1949-09-04', '18 Rue Joseph Vernet', 'AVIGNON', 'Provence-Alpes-Côte d''Azur', '84000'),
(335, 'Buttere', 'Musette', 'Charlebois', '1986-06-25', '23 rue de Penthièvre', 'PRIVAS', 'Rhône-Alpes', '07000'),
(336, 'Havir1983', 'Aurélie', 'Guimond', '1983-08-03', '28 Rue de Strasbourg', 'CLERMONT-FERRAND', 'Auvergne', '63000'),
(337, 'Histiamseent94', 'Corinne', 'Patel', '1994-08-29', '60 rue Isambard', 'FRANCONVILLE-LA-GARENNE', 'Île-de-France', '95130'),
(338, 'Vingligneedn', 'Matilda', 'Guilmette', '1991-09-19', '2 rue de Penthièvre', 'PONTOISE', 'Île-de-France', '95000'),
(339, 'Mameniecs', 'Aurélie', 'Leclerc', '1982-04-05', '46 rue de Lille', 'ARRAS', 'Nord-Pas-de-Calais', '62000'),
(340, 'Rowend', 'Vedette', 'de Chateaub', '1960-05-17', '57 Cours Marechal-Joffre', 'DIEPPE', 'Haute-Normandie', '76200'),
(341, 'Fropmed', 'Blanchefle', 'Corbeil', '1975-08-13', '57 rue des lieutemants Thomazo', 'DRAGUIGNAN', 'Provence-Alpes-Côte d''Azur', '83300'),
(342, 'Theretualk', 'Lorraine', 'Plouffe', '1981-11-04', '59 avenue Voltaire', 'MAISONS-LAFFITTE', 'Île-de-France', '78600'),
(343, 'Himer1945', 'Heloise', 'Laboissonnière', '1945-03-17', '26 boulevard Albin Durand', 'CHAMBÉRY', 'Rhône-Alpes', '73000'),
(344, 'Thonee', 'Corinne', 'Gamelin', '1935-02-16', '8 Place Charles de Gaulle', 'VILLENEUVE-D''ASCQ', 'Nord-Pas-de-Calais', '59491'),
(345, 'Ticamin', 'Danielle', 'Riel', '1947-10-02', '67 rue des Lacs', 'HYÈRES', 'Provence-Alpes-Côte d''Azur', '83400'),
(346, 'Rensell', 'Sylvie', 'Chnadonnet', '1931-09-19', '79 rue de l''Aigle', 'LA MADELEINE', 'Nord-Pas-de-Calais', '59110'),
(347, 'Sull1936', 'Afrodille', 'Despins', '1936-11-23', '16 rue Charles Corbeau', 'FOIX', 'Midi-Pyrénées', '09000'),
(348, 'Glat1964', 'Mavise', 'Marois', '1964-02-18', '61 rue Petite Fusterie', 'BOULOGNE-SUR-MER', 'Nord-Pas-de-Calais', '62200'),
(349, 'Georded', 'Lundy', 'Gingras', '1938-03-08', '15 rue Pierre De Coubertin', 'TOULOUSE', 'Midi-Pyrénées', '31200'),
(350, 'Decithe1984', 'Eulalie', 'Chaloux', '1984-03-22', '71 Avenue Millies Lacroix', 'DUNKERQUE', 'Nord-Pas-de-Calais', '59640'),
(351, 'Amirs1946', 'Olivie', 'Piedalue', '1946-07-11', '74 rue des Chaligny', 'NICE', 'Provence-Alpes-Côte d''Azur', '06100'),
(352, 'Copecers', 'Victoire', 'Binet', '1956-02-18', '3 avenue Jean Portalis', 'TULLE', 'Limousin', '19000'),
(353, 'Stabothe', 'Mavise', 'Charlesbois', '1941-11-18', '92 rue Grande Fusterie', 'BRIVE-LA-GAILLARDE', 'Limousin', '19100'),
(354, 'Brod1965', 'Anouk', 'Turgeon', '1965-09-03', '51 rue Marie de Médicis', 'BÉTHUNE', 'Nord-Pas-de-Calais', '62400'),
(355, 'Aturneve', 'Etoile', 'St-Jean', '1977-02-05', '24 rue de la Mare aux Carats', 'MONTPELLIER', 'Languedoc-Roussillon', '34090'),
(356, 'Beivat', 'Delphine', 'Abril', '1929-10-14', '58 rue Jean Vilar', 'BEAUVAIS', 'Picardie', '60000'),
(357, 'Dunneve', 'Élodie', 'Gendron', '1998-10-04', '49 Faubourg Saint Honoré', 'PARIS', 'Île-de-France', '75019'),
(358, 'Hingst', 'Hélène', 'Martel', '1996-09-18', '27 rue Isambard', 'FORT-DE-FRANCE', 'Martinique', '97234'),
(359, 'Haper1989', 'Laure', 'Méthot', '1989-05-06', '41 Rue du Palais', 'ÉTAMPES', 'Île-de-France', '91150'),
(360, 'Himn1959', 'Anouk', 'Barjavel', '1959-06-22', '42 rue de Penthièvre', 'QUIMPER', 'Bretagne', '29000'),
(361, 'Hoorld', 'Marie', 'Gaillard', '1963-05-29', '76 rue des six frères Ruellan', 'SANNOIS', 'Île-de-France', '95110'),
(362, 'Litty1999', 'Christabel', 'Sauriol', '1999-05-26', '4 quai Saint-Nicolas', 'TOURS', 'Centre', '37000'),
(363, 'Hadergoorm', 'Isabelle', 'Huot', '1986-12-28', '42 rue des Chaligny', 'NICE', 'Provence-Alpes-Côte d''Azur', '06300'),
(364, 'Heraved', 'Charline', 'Blanc', '1993-10-21', '13 rue des Dunes', 'SAINT-MAUR-DES-FOSSÈS', 'Île-de-France', '94100'),
(365, 'Wourearels', 'Nicole', 'Chalut', '1960-07-31', '20 Place de la Madeleine', 'PARIS', 'Île-de-France', '75009'),
(366, 'Boas1981', 'Lundy', 'Brisebois', '1981-01-14', '26 rue des six frères Ruellan', 'SARREGUEMINES', 'Lorraine', '57200'),
(367, 'Beadis49', 'Armina', 'Fouquet', '1949-04-25', '39 rue du Général Ailleret', 'LE TAMPON', 'Guyane', '97430'),
(368, 'Agettle', 'Alexandrie', 'Dufour', '1993-11-20', '16 cours Jean Jaures', 'BORDEAUX', 'Aquitaine', '33100'),
(369, 'Chereappleas44', 'Caroline', 'Corbin', '1944-12-28', '29 Rue du Palais', 'ÉPERNAY', 'Champagne-Ardenne', '51200'),
(370, 'Trocce', 'Phillipa', 'Gingras', '1946-06-21', '63 rue de Lille', 'ARRAS', 'Nord-Pas-de-Calais', '62000'),
(371, 'Fackbey92', 'Claudette', 'Jacques', '1992-03-19', '44 cours Jean Jaures', 'BORDEAUX', 'Aquitaine', '33300'),
(372, 'Hatimon', 'Felicienne', 'Rocher', '1960-09-24', '83 avenue Jean Portalis', 'TOURS', 'Centre', '37200'),
(373, 'Maideared1935', 'Bradamate', 'Sanschagrin', '1935-03-07', '29 quai Saint-Nicolas', 'TOURNEFEUILLE', 'Midi-Pyrénées', '31170'),
(374, 'Warrhatiou', 'Bradamate', 'Sirois', '1983-10-24', '95 rue des Soeurs', 'LA GARDE', 'Provence-Alpes-Côte d''Azur', '83130'),
(375, 'Ronce1977', 'Josephe', 'De La Vergne', '1977-05-24', '42 rue Nationale', 'PARIS', 'Île-de-France', '75005'),
(376, 'Somon1965', 'Julie', 'Paquet', '1965-09-03', '33 avenue de Bouvines', 'SÈTE', 'Languedoc-Roussillon', '34200'),
(377, 'Dity1971', 'Josette', 'Laisné', '1971-01-10', '23 rue de la Hulotais', 'SAINT-RAPHAËL', 'Provence-Alpes-Côte d''Azur', '83700'),
(378, 'Teruccur', 'Fifi', 'Dufresne', '1987-06-30', '53 rue Léon Dierx', 'LIMOGES', 'Limousin', '87280'),
(379, 'Sandint', 'France', 'Auger', '1945-07-16', '50 rue de Lille', 'AUBAGNE', 'Provence-Alpes-Côte d''Azur', '13400'),
(380, 'Romer1940', 'Lucille', 'Fresne', '1940-04-29', '86 Avenue des Pr''es', 'MONTPELLIER', 'Languedoc-Roussillon', '34000'),
(381, 'Fict1974', 'Belle', 'Bienvenue', '1974-04-28', '77 rue du Paillle en queue', 'LEVALLOIS-PERRET', 'Île-de-France', '92300'),
(382, 'Caphisentan', 'Emmeline', 'Vallée', '1996-05-11', '89 Chemin Challet', 'LIÉVIN', 'Nord-Pas-de-Calais', '62800'),
(383, 'Hisho1941', 'Albertine', 'Tougas', '1941-09-03', '77 rue de Penthièvre', 'PRIVAS', 'Rhône-Alpes', '07000'),
(384, 'Wornibrink1967', 'Laurene', 'Lanteigne', '1967-05-14', '95 rue Porte d''Orange', 'CENON', 'Aquitaine', '33150'),
(385, 'Obsing', 'Josette', 'Covillon', '1958-09-08', '28 rue du Château', 'SAINT-JOSEPH', 'Guyane', '97480'),
(386, 'Mempeng', 'Nathalie', 'Dufresne', '1969-03-04', '20 Rue de la Pompe', 'MARCQ-EN-BAROEUL', 'Nord-Pas-de-Calais', '59700'),
(387, 'Twomithe', 'Brigitte', 'Théberge', '1930-08-22', '98 Place du Jeu de Paume', 'VILLEJUIF', 'Île-de-France', '94800'),
(388, 'Stagazen', 'Vignette', 'Doyon', '1977-03-19', '17 Rue St Ferréol', 'METZ', 'Lorraine', '57070'),
(389, 'Groul1973', 'Amorette', 'Rodrigue', '1973-06-25', '99 rue de la République', 'LYON', 'Rhône-Alpes', '69004'),
(390, 'Carchabself', 'Maurelle', 'Bélanger', '1949-08-21', '13 rue des Lacs', 'HYÈRES', 'Provence-Alpes-Côte d''Azur', '83400'),
(391, 'Dayin1973', 'Chantal', 'Trépanier', '1973-10-30', '91 boulevard Albin Durand', 'CERGY', 'Île-de-France', '95800'),
(392, 'Utall1965', 'Rosamonde', 'Babin', '1965-08-15', '17 Rue Marie De Médicis', 'CALUIRE-ET-CUIRE', 'Rhône-Alpes', '69300'),
(393, 'Lichent', 'Demi', 'Provencher', '1947-10-31', '4 rue La Boétie', 'PARIS', 'Île-de-France', '75014'),
(394, 'Suildrued', 'Laurette', 'Roy', '1978-12-02', '11 Quai des Belges', 'MARSEILLE', 'Provence-Alpes-Côte d''Azur', '13016'),
(395, 'Togeres', 'Trinette', 'Dufresne', '1984-03-11', '98 rue Saint Germain', 'GARGES-LÈS-GONESSE', 'Île-de-France', '95140'),
(396, 'Artmer', 'Ruby', 'Pelchat', '1995-11-27', '70 Place de la Gare', 'COLMAR', 'Alsace', '68000'),
(397, 'Sposithier', 'Chantal', 'Robillard', '1953-09-01', '11 Rue Marie De Médicis', 'CAMBRAI', 'Nord-Pas-de-Calais', '59400'),
(398, 'Beasay', 'Brice', 'Bonnet', '1993-08-15', '28 Place de la Madeleine', 'PARIS', 'Île-de-France', '75011'),
(399, 'Annot1953', 'Antoinette', 'Charest', '1953-04-11', '97 rue Nationale', 'PARIS', 'Île-de-France', '75005'),
(400, 'Inower1985', 'Morgana', 'Marseau', '1985-05-09', '86 Square de la Couronne', 'PARIS', 'Île-de-France', '75002'),
(401, 'Whough', 'Virginie', 'Sirois', '1955-08-12', '10 Rue St Ferréol', 'MEUDON-LA-FORÊT', 'Île-de-France', '92360'),
(402, 'Hiscam', 'Patience', 'Bertrand', '1974-07-04', '34 Rue de Verdun', 'MONTCEAU-LES-MINES', 'Bourgogne', '71300'),
(403, 'Waaked78', 'Charline', 'Sabourin', '1978-09-20', '1 rue du Fossé des Tanneurs', 'TOULON', 'Provence-Alpes-Côte d''Azur', '83100'),
(404, 'Colad1948', 'Creissant', 'Avare', '1948-06-24', '31 rue Victor Hugo', 'CONFLANS-SAINTE-HONORINE', 'Île-de-France', '78700'),
(405, 'Torcer', 'Merci', 'Brault', '1945-07-15', '67 avenue Voltaire', 'MALAKOFF', 'Île-de-France', '92240'),
(406, 'Haring', 'Oriel', 'Laprise', '1970-02-11', '26 Place Charles de Gaulle', 'VILLENEUVE-D''ASCQ', 'Nord-Pas-de-Calais', '59650'),
(407, 'Notivat', 'Anouk', 'Cadieux', '1988-12-10', '77 Rue de Strasbourg', 'CLERMONT-FERRAND', 'Auvergne', '63100'),
(408, 'Cose1990', 'Margaux', 'Salmons', '1990-12-30', '36 avenue de Bouvines', 'SCHOELCHER', 'Martinique', '97233'),
(409, 'Hintailging', 'Astrid', 'Chenard', '1975-07-19', '84 Boulevard de Normandie', 'FORT-DE-FRANCE', 'Martinique', '97200'),
(410, 'Objecoung42', 'Christiane', 'Echeverri', '1942-11-23', '4 rue Saint Germain', 'GIF-SUR-YVETTE', 'Île-de-France', '91190'),
(411, 'Vencer', 'Germaine', 'Piedalue', '1949-05-03', '75 rue Marguerite', 'VILLIERS-LE-BEL', 'Île-de-France', '95400'),
(412, 'Ques1982', 'Caresse', 'Chartier', '1982-10-16', '37 Rue Joseph Vernet', 'BAGNEUX', 'Île-de-France', '92220'),
(413, 'Ussighboult', 'Christelle', 'Cressac', '1987-10-15', '97 rue Beauvau', 'MARSEILLE', 'Provence-Alpes-Côte d''Azur', '13002'),
(414, 'Preple1989', 'Vedette', 'Vachon', '1989-03-14', '5 rue Clement Marot', 'PERPIGNAN', 'Languedoc-Roussillon', '66000'),
(415, 'Hinguad', 'Constance', 'Brault', '1946-06-21', '55 Avenue De Marlioz', 'ANTONY', 'Île-de-France', '92160'),
(416, 'Frompard', 'Orva', 'Petrie', '1945-08-21', '79 boulevard d''Alsace', 'VAULX-EN-VELIN', 'Rhône-Alpes', '69120'),
(417, 'Sheys1950', 'Damiane', 'Beaupré', '1950-10-10', '88 rue de la République', 'LYON', 'Rhône-Alpes', '69004'),
(418, 'Mosooving', 'Heloise', 'Tollmache', '1944-12-26', '96 Avenue des Pr''es', 'MONTPELLIER', 'Languedoc-Roussillon', '34000'),
(419, 'Forome', 'Creissant', 'Lamothe', '1966-04-03', '93 avenue Voltaire', 'MAISONS-LAFFITTE', 'Île-de-France', '78600');
INSERT INTO `joueuses` (`IdJ`, `pseudoJ`, `prenomJ`, `nomJ`, `dateNJ`, `rueJ`, `villeJ`, `regionJ`, `codePJ`) VALUES
(420, 'Mors1987', 'Voleta', 'Parent', '1987-11-05', '85 rue de la Hulotais', 'SAINT-PIERRE-ET-MIQUELON', 'Île-de-France', '97500'),
(421, 'Eirdivemong', 'Blanche', 'Duplanty', '1953-07-31', '61 rue du Clair Bocage', 'LA VARENNE-SAINT-HILAIRE', 'Île-de-France', '94210'),
(422, 'Selcobad1979', 'Edmee', 'Audet', '1979-10-23', '76 rue Isambard', 'FRÉJUS', 'Provence-Alpes-Côte d''Azur', '83600'),
(423, 'Areast', 'Albertine', 'Lafond', '1969-04-22', '9 rue Isambard', 'FRANCONVILLE-LA-GARENNE', 'Île-de-France', '95130'),
(424, 'Acket1985', 'Charline', 'Patry', '1985-05-22', '53 cours Franklin Roosevelt', 'MARSEILLE', 'Provence-Alpes-Côte d''Azur', '13010'),
(425, 'Thopecive', 'Durandana', 'Marchesseault', '1948-03-16', '71 rue des Nations Unies', 'SAINT-DENIS', 'Île-de-France', '93200'),
(426, 'Alongthe', 'Trinette', 'Brasseur', '1936-05-02', '34 rue Gontier-Patin', 'AGDE', 'Languedoc-Roussillon', '34300'),
(427, 'Whadearbary', 'Paige', 'Chouinard', '1948-07-12', '64 Rue Roussy', 'NOUMÉA', 'Île-de-France', '98800'),
(428, 'Larearrive', 'Alita', 'Duval', '1931-12-09', '86 Rue Frédéric Chopin', 'VESOUL', 'Franche-Comté', '70000'),
(429, 'Conwhod', 'Joséphine', 'Hervieux', '1989-06-06', '83 rue Beauvau', 'MARSEILLE', 'Provence-Alpes-Côte d''Azur', '13005'),
(430, 'Hiscrive', 'Felicienne', 'Cousteau', '1955-08-17', '23 rue Léon Dierx', 'LIVRY-GARGAN', 'Île-de-France', '93190'),
(431, 'Inglacrievor34', 'Élodie', 'Jardine', '1934-05-16', '89 Chemin Des Bateliers', 'ANNECY', 'Rhône-Alpes', '74000'),
(432, 'Goeve1942', 'Élise', 'Clavet', '1942-04-04', '33 rue de Groussay', 'ROMANS-SUR-ISÈRE', 'Rhône-Alpes', '26100'),
(433, 'Honte1946', 'Jeannine', 'Lanctot', '1946-06-26', '62 rue Pierre De Coubertin', 'TOULOUSE', 'Midi-Pyrénées', '31100'),
(434, 'Mext1964', 'Clementine', 'Beaujolie', '1964-07-13', '60 rue de la Hulotais', 'SAINT-QUENTIN', 'Picardie', '02100'),
(435, 'Scrick', 'Morgana', 'Gaillard', '1955-04-23', '51 Rue de Verdun', 'MONTGERON', 'Île-de-France', '91230'),
(436, 'Ofeent', 'Mignonette', 'Allain', '1964-03-19', '73 Rue Roussy', 'OLIVET', 'Centre', '45160'),
(437, 'Ansered', 'Frédérique', 'Tétrault', '1952-06-08', '62 cours Franklin Roosevelt', 'MARSEILLE', 'Provence-Alpes-Côte d''Azur', '13006'),
(438, 'Aways1960', 'Joy', 'Perillard', '1960-11-06', '27 Avenue De Marlioz', 'ANTIBES', 'Provence-Alpes-Côte d''Azur', '06600'),
(439, 'Justed', 'Philippine', 'Garceau', '1961-03-12', '12 rue des Nations Unies', 'SAINT-BRIEUC', 'Bretagne', '22000'),
(440, 'Leativuld', 'Blanche', 'Forest', '1994-08-12', '4 rue Clement Marot', 'PERPIGNAN', 'Languedoc-Roussillon', '66000'),
(441, 'Whippyraton', 'Dixie', 'Quirion', '1973-10-28', '16 Rue Roussy', 'OLIVET', 'Centre', '45160'),
(442, 'Thatten', 'Manon', 'Guilmette', '1937-06-03', '12 rue Reine Elisabeth', 'MENDE', 'Languedoc-Roussillon', '48000'),
(443, 'Hosly1945', 'Stéphanie', 'Rouleau', '1945-05-26', '6 Avenue des Pr''es', 'MONTIGNY-LE-BRETONNEUX', 'Île-de-France', '78180'),
(444, 'Lithent34', 'Delmare', 'Saucier', '1934-02-22', '43 Rue Frédéric Chopin', 'VICHY', 'Auvergne', '03200'),
(445, 'Whant1954', 'Raison', 'Bordeaux', '1954-10-26', '56 rue des Dunes', 'SAINT-MAUR-DES-FOSSÈS', 'Île-de-France', '94100'),
(446, 'Sird1950', 'Renée', 'Savoie', '1950-11-10', '15 Rue du Limas', 'BAYONNE', 'Aquitaine', '64100'),
(447, 'Knotans1949', 'Auda', 'Piedalue', '1949-03-10', '42 Rue de Verdun', 'MONTCEAU-LES-MINES', 'Bourgogne', '71300'),
(448, 'Prioned', 'Holly', 'Petit', '1964-08-08', '20 rue de l''Epeule', 'ROUBAIX', 'Nord-Pas-de-Calais', '59100'),
(449, 'Hoppen', 'Orane', 'Perreault', '1949-06-21', '91 Avenue De Marlioz', 'ARGENTEUIL', 'Île-de-France', '95100'),
(450, 'Couret', 'Delmare', 'St-Pierre', '1993-05-21', '70 boulevard Albin Durand', 'CERGY', 'Île-de-France', '95000'),
(451, 'Atephy', 'Alexandrie', 'Ruais', '1964-11-04', '30 rue Bonneterie', 'MONTAUBAN', 'Midi-Pyrénées', '82000'),
(452, 'Pultand1940', 'Clémence', 'Chalut', '1940-01-02', '76 Rue de Strasbourg', 'CLERMONT-FERRAND', 'Auvergne', '63000'),
(453, 'Gainglaing', 'Amélie', 'Deserres', '1973-02-22', '10 rue Petite Fusterie', 'BOURGES', 'Centre', '18000'),
(454, 'Zoukepousse', 'Fanette', 'Bellemare', '1937-01-04', '82 boulevard Amiral Courbet', 'ORLY', 'Île-de-France', '94310'),
(455, 'Dory1971', 'Gemma', 'Ricard', '1971-08-23', '28 Rue Frédéric Chopin', 'VICHY', 'Auvergne', '03200'),
(456, 'Starountor', 'Searlait', 'Truchon', '1929-09-20', '80 rue Porte d''Orange', 'CASTRES', 'Midi-Pyrénées', '81100'),
(457, 'Spenth1957', 'Geneviève', 'Hughes', '1957-08-02', '78 Place Napoléon', 'LAON', 'Picardie', '02000'),
(458, 'Nighty', 'Madelene', 'Laisné', '1955-07-17', '26 rue Clement Marot', 'PIERREFITTE-SUR-SEINE', 'Île-de-France', '93380'),
(459, 'Youraid', 'Erembourg', 'Dubé', '1969-11-22', '8 rue Sébastopol', 'SAINTE-MARIE', 'Guyane', '97438'),
(460, 'Theon1931', 'Adèle', 'Bussière', '1931-07-19', '46 Rue de Verdun', 'MONTCEAU-LES-MINES', 'Bourgogne', '71300'),
(461, 'Meas1941', 'Stéphanie', 'Bazinet', '1941-09-17', '50 rue Gontier-Patin', 'ABBEVILLE', 'Picardie', '80100'),
(462, 'Nuffeamed', 'Victorine', 'Lauzier', '1932-05-20', '62 Place de la Madeleine', 'PARIS', 'Île-de-France', '75011'),
(463, 'Deall1993', 'Romaine', 'Lévesque', '1993-05-22', '67 avenue Jules Ferry', 'SOISSONS', 'Picardie', '02200'),
(464, 'Amer1961', 'Alexandrin', 'Descoteaux', '1961-01-01', '35 avenue du Marechal Juin', 'SAINT-LÔ', 'Basse-Normandie', '50000'),
(465, 'Papined', 'Roxanne', 'Flamand', '1990-08-09', '46 rue Charles Corbeau', 'FÉCAMP', 'Haute-Normandie', '76400'),
(466, 'Ontomprods', 'Lucille', 'L''Anglais', '1958-06-25', '27 Place de la Madeleine', 'PARIS', 'Île-de-France', '75009'),
(467, 'Ondood', 'Gabrielle', 'Rossignol', '1989-02-27', '24 rue de Geneve', 'AMIENS', 'Picardie', '80080'),
(468, 'Sessood71', 'Claire', 'Mireault', '1971-10-23', '79 rue du Château', 'SAINT-GERMAIN-EN-LAYE', 'Île-de-France', '78100'),
(469, 'Andith', 'Alice', 'Compagnon', '1941-12-21', '46 avenue Ferdinand de Lesseps', 'GRENOBLE', 'Rhône-Alpes', '38000'),
(470, 'Prephred', 'Roux', 'Grivois', '1951-04-03', '11 Place de la Madeleine', 'PARIS', 'Île-de-France', '75012'),
(471, 'Didolent', 'Brie', 'Meilleur', '1961-02-27', '3 rue Descartes', 'STRASBOURG', 'Alsace', '67000'),
(472, 'Aborear', 'Calandre', 'Patel', '1997-01-05', '91 Avenue des Tuileries', 'GUÉRET', 'Limousin', '23000'),
(473, 'Olew1963', 'Calandre', 'Duplessis', '1963-03-21', '65 rue Sadi Carnot', 'AUCH', 'Midi-Pyrénées', '32000'),
(474, 'Wifecing', 'Roux', 'Fontaine', '1935-07-06', '5 Rue Bonnet', 'VOIRON', 'Rhône-Alpes', '38500'),
(475, 'Fich1968', 'Blanchefle', 'Coupart', '1968-12-02', '45 Chemin Du Lavarin Sud', 'CACHAN', 'Île-de-France', '94230'),
(476, 'Nothead', 'Afrodille', 'Cantin', '1973-11-25', '19 rue Pierre Motte', 'SAINT-DENIS', 'Île-de-France', '97400'),
(477, 'Feellen', 'Fifine', 'Guédry', '1956-07-29', '25 rue de la République', 'LYON', 'Rhône-Alpes', '69001'),
(478, 'Castis', 'Ormazd', 'Blanc', '1981-11-04', '70 Rue Hubert de Lisle', 'LONS-LE-SAUNIER', 'Franche-Comté', '39000'),
(479, 'Tereme1949', 'Élodie', 'Charpie', '1949-08-25', '55 rue Gustave Eiffel', 'RIS-ORANGIS', 'Île-de-France', '91000'),
(480, 'Theiren', 'Ophelia', 'Vachon', '1944-07-28', '94 Rue de Strasbourg', 'CLERMONT-FERRAND', 'Auvergne', '63100'),
(481, 'Ladjunybox1994', 'Etoile', 'Gervais', '1994-06-06', '66 rue Pierre Motte', 'SAINTE-ANNE', 'Guadeloupe', '97180'),
(482, 'Withy1996', 'Crescent', 'Bellemare', '1996-11-20', '18 place de Miremont', 'VILLEPARISIS', 'Île-de-France', '77270'),
(483, 'Epre1994', 'Madelene', 'Drouin', '1994-05-01', '45 Avenue De Marlioz', 'ANTIBES', 'Provence-Alpes-Côte d''Azur', '06600'),
(484, 'Justral', 'Tilly', 'Lépicier', '1960-12-05', '33 rue Nationale', 'PARIS', 'Île-de-France', '75005'),
(485, 'Eattelf', 'Orva', 'Bonnet', '1955-02-25', '94 boulevard Amiral Courbet', 'ORLY', 'Île-de-France', '94310'),
(486, 'Tooffer1950', 'Pensee', 'Dufour', '1950-12-14', '58 rue des Soeurs', 'LA GARDE', 'Provence-Alpes-Côte d''Azur', '83130'),
(487, 'Cometwou', 'Rachelle', 'Boucher', '1973-10-22', '77 Rue St Ferréol', 'MEUDON-LA-FORÊT', 'Île-de-France', '92360'),
(488, 'Misficear', 'Demi', 'Laforest', '1958-05-18', '3 rue de la République', 'LUNÉVILLE', 'Lorraine', '54300'),
(489, 'Willet', 'Aubrey', 'Belisle', '1972-06-04', '34 rue Isambard', 'FRANCONVILLE-LA-GARENNE', 'Île-de-France', '95130'),
(490, 'Donchat', 'Zara', 'Veronneau', '1933-12-05', '14 rue Bonneterie', 'MONTBÉLIARD', 'Franche-Comté', '25200'),
(491, 'Butil1953', 'Esperanza', 'Lang', '1953-10-13', '44 rue de Groussay', 'ROSNY-SOUS-BOIS', 'Île-de-France', '93110'),
(492, 'Themblent', 'Mavise', 'Cloutier', '1966-05-18', '34 Quai des Belges', 'MARSEILLE', 'Provence-Alpes-Côte d''Azur', '13016'),
(493, 'Cliveher', 'Mariette', 'Pellerin', '1987-01-23', '55 rue de l''Aigle', 'LA GARENNE-COLOMBES', 'Île-de-France', '92250'),
(494, 'Gratelver', 'Fealty', 'Goudreau', '1956-04-27', '42 rue Gustave Eiffel', 'RIS-ORANGIS', 'Île-de-France', '91000'),
(495, 'Nany1938', 'Eleanor', 'Cotuand', '1938-03-27', '79 rue Banaudon', 'LYON', 'Rhône-Alpes', '69008'),
(496, 'Dowast', 'Lirienne', 'Sylvain', '1993-01-16', '53 Place de la Madeleine', 'PARIS', 'Île-de-France', '75008'),
(497, 'Whantem', 'Odelette', 'Poirier', '1965-11-22', '88 Place Napoléon', 'LANESTER', 'Bretagne', '56600'),
(498, 'Terew1949', 'Jacqueline', 'Bonneville', '1949-04-07', '31 Avenue De Marlioz', 'ANNEMASSE', 'Rhône-Alpes', '74100'),
(499, 'Cardearty', 'Dominique', 'Compagnon', '1989-05-19', '36 rue du Clair Bocage', 'LA TESTE-DE-BUCH', 'Aquitaine', '33260'),
(500, 'Hingthat', 'Jewel', 'Adler', '1941-01-30', '46 rue des Chaligny', 'NICE', 'Provence-Alpes-Côte d''Azur', '06100'),
(501, 'Whimints', 'Brier', 'Perillard', '1956-02-07', '22 avenue Ferdinand de Lesseps', 'GRENOBLE', 'Rhône-Alpes', '38100'),
(502, 'Plaids', 'Magnolia', 'Collin', '1964-01-15', '91 rue Adolphe Wurtz', 'LE PETIT-QUEVILLY', 'Haute-Normandie', '76140'),
(503, 'Spromilt', 'Julienne', 'Provencher', '1979-05-15', '51 boulevard de Prague', 'NOISY-LE-GRAND', 'Île-de-France', '93160'),
(504, 'Riney1973', 'Virginie', 'Berthelette', '1973-10-24', '40 Boulevard de Normandie', 'FORT-DE-FRANCE', 'Martinique', '97200'),
(505, 'Hichatentir', 'Aubine', 'Bizier', '1973-10-13', '25 boulevard Albin Durand', 'CERGY', 'Île-de-France', '95800'),
(506, 'Sume1992', 'Natalie', 'Beaulé', '1992-04-07', '31 rue Pierre Motte', 'SAINTE-FOY-LÈS-LYON', 'Rhône-Alpes', '69110'),
(507, 'Nower1961', 'Simone', 'Duranseau', '1961-08-25', '90 Rue de Verdun', 'MONTCEAU-LES-MINES', 'Bourgogne', '71300'),
(508, 'Forsel', 'Villette', 'Migneault', '1942-07-12', '46 Rue de la Pompe', 'MARIGNANE', 'Provence-Alpes-Côte d''Azur', '13700'),
(509, 'Simpal54', 'Margaux', 'Duffet', '1954-05-08', '2 rue Isambard', 'FOUGÈRES', 'Bretagne', '35300'),
(510, 'Anducce', 'Bradamate', 'Fréchette', '1949-09-17', '95 rue du Gue Jacquet', 'CHÂTEAUROUX', 'Centre', '36000'),
(511, 'Cappon', 'Émilie', 'Courtemanche', '1973-11-22', '92 rue Reine Elisabeth', 'METZ', 'Lorraine', '57000'),
(512, 'Poseveropme', 'Patricia', 'Favreau', '1941-05-03', '88 Chemin Challet', 'LIMOGES', 'Limousin', '87100'),
(513, 'Dene1978', 'Alexandrie', 'Bouchard', '1978-09-24', '70 Place Charles de Gaulle', 'VILLENEUVE-D''ASCQ', 'Nord-Pas-de-Calais', '59650'),
(514, 'Eltains', 'Agnès', 'Corbeil', '1932-04-05', '57 Rue Frédéric Chopin', 'VICHY', 'Auvergne', '03200'),
(515, 'Hiscaralls', 'Rachelle', 'Blondlot', '1934-02-22', '97 avenue Ferdinand de Lesseps', 'GRENOBLE', 'Rhône-Alpes', '38000'),
(516, 'Shenton', 'Claudette', 'Poirier', '1965-02-02', '73 place Stanislas', 'NANCY', 'Lorraine', '54100'),
(517, 'Prions', 'Eglantine', 'Bossé', '1980-12-10', '22 rue Jean Vilar', 'BERGERAC', 'Aquitaine', '24100'),
(518, 'Gualterfing', 'Sophie', 'L''Hiver', '1975-03-19', '33 rue du Général Ailleret', 'LES ABYMES', 'Guadeloupe', '97139'),
(519, 'Efivishereme', 'Emmanuelle', 'Lévesque', '1944-08-31', '53 avenue du Marechal Juin', 'SAINT-LEU', 'Guyane', '97436'),
(520, 'Whiddespeat', 'Arnaude', 'Bériault', '1975-09-22', '6 rue Ernest Renan', 'CHERBOURG', 'Basse-Normandie', '50100'),
(521, 'Vilials', 'Fifine', 'Paré', '1992-06-02', '63 rue du Général Ailleret', 'LES ABYMES', 'Guadeloupe', '97142'),
(522, 'Univelf', 'Sylvie', 'Binet', '1953-01-04', '87 rue Banaudon', 'LYON', 'Rhône-Alpes', '69009'),
(523, 'Nark1972', 'Belle', 'Lépicier', '1972-11-19', '31 Rue Frédéric Chopin', 'VERTOU', 'Pays de la Loire', '44120'),
(524, 'Wasight', 'Dalmace', 'Couture', '1931-11-24', '6 rue des Lacs', 'HÉNIN-BEAUMONT', 'Nord-Pas-de-Calais', '62110'),
(525, 'Ordear1990', 'Mignonette', 'Duclos', '1990-02-25', '40 rue des lieutemants Thomazo', 'DOUAI', 'Nord-Pas-de-Calais', '59500'),
(526, 'Coursocied', 'Royale', 'Abril', '1952-03-29', '63 Rue Hubert de Lisle', 'LORMONT', 'Aquitaine', '33310'),
(527, 'Magas1974', 'Raison', 'Paré', '1974-01-27', '76 rue Descartes', 'SURESNES', 'Île-de-France', '92150'),
(528, 'Qualwas', 'Cécile', 'Godin', '1975-04-18', '11 rue Descartes', 'STRASBOURG', 'Alsace', '67000'),
(529, 'Reque1966', 'Harriette', 'Lampron', '1966-07-23', '8 avenue Jules Ferry', 'SIX-FOURS-LES-PLAGES', 'Provence-Alpes-Côte d''Azur', '83140'),
(530, 'Selamudder', 'Kari', 'Narcisse', '1944-06-22', '71 rue Bonneterie', 'MILLAU', 'Midi-Pyrénées', '12100'),
(531, 'Satince', 'Patricia', 'Busque', '1983-05-24', '78 Rue Marie De Médicis', 'CANNES-LA-BOCCA', 'Provence-Alpes-Côte d''Azur', '06150'),
(532, 'Thromparsus', 'Vignette', 'Giroux', '1966-10-09', '92 place Stanislas', 'NANCY', 'Lorraine', '54000'),
(533, 'Witund', 'Amabella', 'Cloutier', '1984-07-07', '95 rue Grande Fusterie', 'BRIVE-LA-GAILLARDE', 'Limousin', '19100'),
(534, 'Thisheack', 'Ormazd', 'L''Anglais', '1940-04-14', '96 rue du Fossé des Tanneurs', 'TOULON', 'Provence-Alpes-Côte d''Azur', '83000'),
(535, 'Stics1948', 'Olivie', 'Séguin', '1948-09-27', '12 rue des Soeurs', 'LA CELLE-SAINT-CLOUD', 'Île-de-France', '78170'),
(536, 'Refore', 'Chantal', 'Flamand', '1951-04-16', '82 cours Franklin Roosevelt', 'MARSEILLE', 'Provence-Alpes-Côte d''Azur', '13007'),
(537, 'Shaltarea', 'Ninette', 'Dufresne', '1984-01-15', '45 avenue de Provence', 'VALLAURIS', 'Provence-Alpes-Côte d''Azur', '06220'),
(538, 'Zoukedecole', 'Adélaïde', 'Vertefeuille', '1938-09-29', '27 cours Jean Jaures', 'BORDEAUX', 'Aquitaine', '33200'),
(539, 'Wartind', 'Leone', 'Huot', '1950-10-18', '21 rue Léon Dierx', 'LONGJUMEAU', 'Île-de-France', '91160'),
(546, 'vilipende', 'Ana', 'Zök', '1996-12-12', 'rue des fleurs', 'LYON', 'Rhône-Alpes', '69001'),
(547, 'Boulgour', 'adolphine', 'hore', '2005-12-02', 'rue des magnolias', 'LYON', 'Rhône-Alpes', '69001');

-- --------------------------------------------------------

--
-- Structure de la table `lieuj`
--

CREATE TABLE `lieuj` (
  `IdL` int(11) NOT NULL,
  `lieuJ` varchar(30) NOT NULL,
  `lattitudeJ` float DEFAULT NULL,
  `longitudeJ` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `lieuj`
--

INSERT INTO `lieuj` (`IdL`, `lieuJ`, `lattitudeJ`, `longitudeJ`) VALUES
(2967113, 'Zudausques', 50.7488, 2.14762),
(2967146, 'Zévaco', 41.8833, 9.05),
(2967282, 'Wylder', 50.9101, 2.49443),
(2967378, 'Widensolen', 48.0629, 7.48057),
(2967445, 'Warnecque', 50.6358, 2.12225),
(2967525, 'Wacquinghen', 50.783, 1.66687),
(2967559, 'Vroil', 48.8423, 4.91179),
(2967673, 'Vouarces', 48.5913, 3.89681),
(2967726, 'Volnay', 47.0011, 4.78179),
(2967841, 'Vittonville', 48.965, 6.05776),
(2968014, 'Vinzelles', 45.9254, 3.39656),
(2968043, 'Vindelonde', 49.3265, -1.3269),
(2968084, 'Vilsoul', 46.4083, 2.66278),
(2968205, 'Villiers', 47.5993, 4.33488),
(2968297, 'Villeservine', 46.1582, 1.95234),
(2968692, 'Villelongue-d''Aude', 43.0538, 2.09568),
(2968836, 'Villechétif', 48.3118, 4.1433),
(2968857, 'Villebout', 47.9899, 1.17698),
(2968979, 'Villard-Joli', 44.7284, 5.88728),
(2969171, 'Vieux-Vy-sur-Couesnon', 48.3418, -1.48912),
(2969318, 'Vieillevigne', 43.4019, 1.65495),
(2969388, 'Vic-le-Comte', 45.6432, 3.24638),
(2969644, 'Vertault', 47.9161, 4.35139),
(2969645, 'Vertamboz', 46.596, 5.7407),
(2969692, 'Verrières-le-Buisson', 48.7457, 2.26796),
(2969701, 'Verrières', 46.4131, 0.59154),
(2969759, 'Vernonvilliers', 48.3151, 4.67895),
(2970013, 'Verchales-Soutro', 45.3667, 2.51667),
(2970448, 'Vaumoise', 49.2352, 2.98077),
(2970679, 'Varennes-sur-Seine', 48.373, 2.92571),
(2970692, 'Varennes-le-Grand', 46.7187, 4.86872),
(2970817, 'Valz-sous-Châteauneuf', 45.4333, 3.41667),
(2970962, 'Vallauris', 43.578, 7.05451),
(2971033, 'Valensole', 43.838, 5.98323),
(2971043, 'Valence-sur-Baïse', 43.8827, 0.38111),
(2971056, 'Valençay', 47.1621, 1.56852),
(2971260, 'Uzer', 44.5196, 4.3263),
(2971350, 'Urepel', 43.0691, -1.41748),
(2971388, 'Ulcot', 47.0264, -0.39943),
(2972117, 'Toy-Viam', 45.6484, 1.93181),
(2972328, 'Toulon', 43.1167, 5.93333),
(2972343, 'Toulat', 45.2875, 2.45424),
(2972437, 'Torcy-le-Petit', 49.8147, 1.17279),
(2972570, 'Tilloy-lez-Marchiennes', 50.4204, 3.31748),
(2972910, 'They-sous-Montfort', 48.2314, 5.98449),
(2973113, 'Terradineuf', 47.6049, -1.65409),
(2973178, 'Tendron', 46.9731, 2.84374),
(2973219, 'Teillé', 47.4617, -1.2781),
(2973292, 'Tauriac-de-Camarès', 43.7784, 3.02937),
(2973439, 'Tanavelle', 45.0229, 2.99888),
(2973446, 'Tamisac', 44.4379, 5.39897),
(2973841, 'Stains', 48.95, 2.38333),
(2973856, 'Spincourt', 49.3306, 5.66684),
(2973940, 'Sourniac', 45.2833, 2.35),
(2973963, 'Souppes-sur-Loing', 48.183, 2.73521),
(2974280, 'Sommette-Eaucourt', 49.7404, 3.11882),
(2974315, 'Sommaisne', 48.9457, 5.16672),
(2974470, 'Siracourt', 50.3727, 2.27058),
(2974524, 'Simandres', 45.6198, 4.87087),
(2974646, 'Seyssinet', 45.1674, 5.68636),
(2974678, 'Sèvres', 48.8229, 2.21757),
(2974752, 'Servins', 50.4103, 2.634),
(2974936, 'Sergy', 46.2526, 6.00058),
(2975269, 'Seilh', 43.6947, 1.35509),
(2975309, 'Ségrie-Fontaine', 48.8258, -0.40761),
(2975998, 'Saron-sur-Aube', 48.5693, 3.7314),
(2976034, 'Sarcy', 49.207, 3.82547),
(2976105, 'Santigny', 47.5682, 4.12071),
(2976179, 'Sannois', 48.9667, 2.25),
(2976444, 'Salies-de-Béarn', 43.4742, -0.92448),
(2976624, 'Saint-Vincent', 47.7303, -0.88206),
(2976646, 'Saint-Victor-sur-Ouche', 47.2351, 4.74679),
(2976693, 'Saint-Varent', 46.8893, -0.2321),
(2976808, 'Saint-Symphorien-le-Château', 48.5172, 1.7612),
(2977147, 'Saint-Romain-de-Benet', 45.6915, -0.84765),
(2977308, 'Saint-Pryvé-Saint-Mesmin', 47.8818, 1.8695),
(2977361, 'Saint-Préjet-d''Allier', 44.916, 3.62401),
(2977465, 'Saint-Pierre-du-Jonquet', 49.169, -0.12646),
(2977605, 'Saint-Phalier', 46.9803, 1.65514),
(2977780, 'Saint-Pabu', 48.5667, -4.6),
(2977812, 'Saint-Ouen-des-Champs', 49.3844, 0.54471),
(2977818, 'Saint-Ouen-de-la-Cour', 48.4167, 0.58333),
(2977874, 'Saint-Nicolas-des-Motets', 47.5855, 1.03772),
(2977931, 'Saint-Myon', 45.9926, 3.1296),
(2977947, 'Saint-Mitre-les-Remparts', 43.4549, 5.01702),
(2978311, 'Saint-Martin-d''Oydes', 43.1699, 1.49586),
(2978506, 'Saint-Martial-d''Artenset', 45.0167, 0.18333),
(2978766, 'Saint-Lézin', 47.2499, -0.77357),
(2978862, 'Saint-Lazare', 45.1229, 1.22857),
(2978936, 'Saint-Laurent-de-Chamousset', 45.7393, 4.4634),
(2978966, 'Saint-Laurent', 46.1663, 1.96235),
(2979067, 'Saint-Julien-en-Vercors', 45.05, 5.44882),
(2979091, 'Saint-Julien-des-Chazes', 45.047, 3.58426),
(2979275, 'Saint-Jean-des-Vignes', 45.8754, 4.67966),
(2979398, 'Saint-Jans-Cappel', 50.7639, 2.72228),
(2979427, 'Saint-Jacques', 43.65, 6.91667),
(2979451, 'Saint-Idult', 48.0863, -3.27375),
(2979487, 'Saint-Hippolyte', 43.6394, 4.75595),
(2979648, 'Saint-Gobain', 49.5957, 3.3775),
(2979671, 'Saint-Gilles', 49.2804, 3.67679),
(2979800, 'Saint-Germain-de-Varreville', 49.4373, -1.2575),
(2979848, 'Saint-Germain-Beaupré', 46.3075, 1.54553),
(2980119, 'Saint-Firmin-des-Vignes', 47.9742, 2.7417),
(2980151, 'Saint-Félix-de-Lunel', 44.5622, 2.5399),
(2980327, 'Saint-Sixte', 44.1333, 0.78333),
(2980652, 'Sainte-Croix-du-Verdon', 43.75, 6.15),
(2980673, 'Sainte-Colombe-sur-Gand', 45.8794, 4.27497),
(2981029, 'Saint-Côme', 48.7703, 1.63717),
(2981368, 'Saint-Blancard', 43.3437, 0.64372),
(2981521, 'Saint-Aunès', 43.6408, 3.96583),
(2981679, 'Saint-Antoine', 49.586, 0.8767),
(2981768, 'Saint-André-de-Bâgé', 46.2998, 4.91557),
(2981832, 'Saint-Amans', 43.1571, 1.54786),
(2982077, 'Sables-d''Or-les-Pins', 48.6396, -2.40629),
(2982155, 'Rumilly-lès-Vaudes', 48.1433, 4.21789),
(2982398, 'Rouvres', 49.004, -0.17333),
(2982413, 'Rouvray', 48.5263, 1.20721),
(2982647, 'Rouère', 46.6473, 3.02229),
(2982852, 'Roquemaure', 43.8124, 1.62469),
(2982902, 'Rontalon', 45.6601, 4.63076),
(2982953, 'Roncevaux', 48.2782, 2.42622),
(2983131, 'Rogna', 46.3273, 5.74817),
(2983209, 'Rochetaillée-sur-Saône', 45.85, 4.85),
(2983251, 'Roche-la-Molière', 45.4341, 4.32276),
(2983543, 'Rilhac-Lastours', 45.6612, 1.10694),
(2983595, 'Rieutort', 44.6694, 3.10394),
(2983639, 'Richeville', 49.2672, 1.53513),
(2983714, 'Ribault', 46.9669, 0.70246),
(2983878, 'Retournaque', 45.1973, 4.03107),
(2984104, 'Reithouse', 46.5589, 5.55559),
(2984436, 'Rangen', 48.6662, 7.47731),
(2984594, 'Racquinghem', 50.6925, 2.35736),
(2984671, 'Quinquis', 47.9333, -3.7),
(2984691, 'Quincey', 47.6116, 6.18556),
(2984715, 'Quillien', 48.05, -3.8),
(2984795, 'Querriaux', 46.1242, 2.88636),
(2984802, 'Quérigut', 42.6975, 2.09764),
(2985064, 'Pulnoy', 48.7029, 6.25792),
(2985168, 'Prusly-sur-Ource', 47.8707, 4.6629),
(2985219, 'Prugnanes', 42.8236, 2.43182),
(2985677, 'Prabert', 45.2502, 5.97282),
(2985762, 'Pourhon', 48.3258, -2.73156),
(2985766, 'Pourchoie', 44.9254, 4.47126),
(2985773, 'Poupry', 48.0998, 1.83707),
(2985880, 'Poudenx', 43.5793, -0.58248),
(2986057, 'Porquerolles', 43.0012, 6.20265),
(2986283, 'Pont-Bancet', 45.7173, 5.57776),
(2986561, 'Poggio-Mezzana', 42.3971, 9.49404),
(2986822, 'Pleaux', 45.1333, 2.23333),
(2987264, 'Pierregot', 50.002, 2.37893),
(2987303, 'Pierrecourt', 49.8977, 1.6608),
(2987618, 'Petit Saint-Chéreau', 48.1421, 0.34218),
(2987677, 'Petit Keryéau', 48.2833, -3.95),
(2987682, 'Petit Jard', 48.5713, 2.65098),
(2987706, 'Petite-Rosselle', 49.2118, 6.85607),
(2987719, 'Petit Égrefin', 48.4, 0.36667),
(2987799, 'Pessat-Villeneuve', 45.914, 3.15742),
(2987841, 'Persquen', 48.0291, -3.19621),
(2987863, 'Perros-Guirec', 48.8145, -3.43963),
(2987912, 'Perquelin', 45.3321, 5.84618),
(2988339, 'Paulhan', 43.5394, 3.4576),
(2988351, 'Pauilhac', 43.8764, 0.61269),
(2988527, 'Pargny-les-Bois', 49.7167, 3.61667),
(2988989, 'Ourches', 44.805, 5.04755),
(2989135, 'Osmoy', 47.0728, 2.52274),
(2989188, 'Orthevielle', 43.5524, -1.14825),
(2989288, 'Ormeaux', 48.7187, 2.9893),
(2989407, 'Ordonnac', 45.3066, -0.83489),
(2989686, 'Ohnenheim', 48.1835, 7.50722),
(2989896, 'Noyelles-sur-Escaut', 50.1333, 3.18333),
(2990426, 'Niderhoff', 48.6372, 7.00448),
(2990625, 'Neuilly-le-Bisson', 48.4997, 0.23263),
(2990857, 'Naves', 50.2029, 3.3165),
(2991039, 'Nailly', 47.5805, 3.78),
(2991125, 'Murtin-et-Bogny', 49.8171, 4.53839),
(2991332, 'Mouthier-en-Bresse', 46.8591, 5.38869),
(2991488, 'Moulineux', 48.3925, 2.02688),
(2991720, 'Morsan', 49.1829, 0.59156),
(2991747, 'Mornac', 45.6833, 0.26667),
(2991894, 'Morancourt', 48.4318, 5.00182),
(2992242, 'Montmirail', 46.245, 2.8915),
(2992268, 'Montmartin-en-Graignes', 49.2749, -1.14798),
(2992614, 'Montfermy', 45.8809, 2.80976),
(2992760, 'Montdidier', 49.65, 2.56667),
(2992771, 'Mont-de-Marsan', 43.8902, -0.49713),
(2992773, 'Mont-de-l''If', 49.5833, 0.81667),
(2992847, 'Montcey', 47.6563, 6.23722),
(2992886, 'Montbron', 45.6667, 0.5),
(2992950, 'Montbarla', 44.2228, 1.09853),
(2993047, 'Montancy', 47.3638, 7.02253),
(2993250, 'Monnetier-Mornex', 46.1603, 6.20667),
(2993418, 'Moncé-en-Saosnois', 48.2737, 0.38879),
(2993443, 'Monblanc', 43.4638, 0.99035),
(2993506, 'Molinot', 47.0127, 4.59011),
(2993644, 'Mœrnach', 47.5, 7.25),
(2993936, 'Mieussy', 46.1337, 6.52416),
(2994054, 'Meyssac', 45.0557, 1.67386),
(2994217, 'Mesnil-sous-Vienne', 49.3857, 1.66703),
(2994631, 'Menades', 47.444, 3.8238),
(2994916, 'Mayres-Savel', 44.8667, 5.71667),
(2994918, 'Mayrègne', 42.8438, 0.53991),
(2994938, 'Mayen', 45.8305, 3.87947),
(2995194, 'Matelis', 44.5878, 0.39515),
(2995337, 'Marvignes', 44.4235, 4.11492),
(2995542, 'Marquéglise', 49.5168, 2.76349),
(2996356, 'Malons-et-Elze', 44.4174, 4.02321),
(2996496, 'Malatray', 45.1754, 4.40749),
(2996512, 'Malancourt', 49.2425, 5.17968),
(2997388, 'Lourenties', 43.2833, -0.16667),
(2997471, 'L''Ouche-Mouchand', 46.9739, -2.02852),
(2997757, 'Longcochon', 46.7757, 6.06958),
(2998103, 'Lissey', 49.3732, 5.34743),
(2998288, 'Limeyrat', 45.1598, 0.98014),
(2998398, 'Lignères', 48.736, 0.31088),
(2998506, 'Lichen', 48.5333, -4.28333),
(2998581, 'L''Hôpital', 45.35, 2.45),
(2998679, 'L''Eyssalles', 44.7333, 1.25),
(2998705, 'Leycuras', 45.6667, 1.21667),
(2998873, 'Le Vernet', 46.6075, 2.5979),
(2998952, 'Le Varene', 44.7875, 6.94761),
(2998991, 'Le Val-de-Gouhenans', 47.6202, 6.48446),
(2999049, 'Leubringhen', 50.8579, 1.72174),
(2999078, 'Le Tronc', 47.1332, 2.32057),
(2999135, 'Le Tourne', 44.7107, -0.40512),
(2999197, 'Le Theix', 46.1667, 2.53333),
(2999284, 'L''Étang', 47.56, 2.80352),
(2999557, 'Les Taillères', 46.7643, 3.37857),
(2999588, 'Les Sias', 44.2581, 5.34443),
(2999819, 'Les Rases', 45.6646, 4.84924),
(3000028, 'Lespesses', 50.5626, 2.42267),
(3000630, 'Les Hôpitaux', 45.8692, 5.53349),
(3000691, 'Les Hallais', 49.7327, 1.5131),
(3000909, 'Les Georges', 46.1564, 3.08457),
(3001041, 'Les Fontaines-de-Presles', 48.7027, 2.75596),
(3001138, 'Les Essards', 47.0492, 2.78257),
(3001192, 'Les Écharmeaux', 46.167, 4.44352),
(3001415, 'Les Chusins', 44.9159, 5.77644),
(3001468, 'Les Chemineaux', 47.3024, 1.51043),
(3001535, 'Les Chapelles', 48.0338, 1.91336),
(3001702, 'Les Brosses', 48.5983, 2.49985),
(3001785, 'Les Bouchets', 47.5833, 3.66667),
(3002080, 'Le Saussay', 48.1796, 1.17012),
(3002099, 'Les Audiberts', 44.671, 6.32244),
(3002251, 'Lervily', 48.0062, -4.56184),
(3002455, 'Lepuy', 48.2074, 2.7791),
(3002832, 'Le Pic', 44.9989, 0.37597),
(3003040, 'Lépanges-sur-Vologne', 48.1667, 6.66667),
(3003041, 'L''Epalud', 45.4034, 6.34193),
(3003156, 'Lempzours', 45.3616, 0.81826),
(3003270, 'Le Mont', 46.658, 3.01104),
(3003614, 'Le Maisnil', 50.6151, 2.88528),
(3004285, 'Le Faux', 46.2115, 2.38187),
(3004382, 'Lect', 46.3896, 5.6765),
(3004528, 'Le Collet', 44.5981, 6.18229),
(3004559, 'Le Clos', 48.4598, 0.97218),
(3004941, 'Le Brusquet', 44.1614, 6.31143),
(3005102, 'el Voló', 42.5242, 2.83336),
(3005171, 'Le Bouchage', 46.0451, 0.39264),
(3005284, 'Le Bigeau', 45.2678, 1.2935),
(3005529, 'La Villedieu', 46.7952, 4.42496),
(3005560, 'La Villard', 43.55, 6.35),
(3005772, 'Lavans-Vuillafans', 47.0868, 6.24373),
(3005784, 'La Vancelle', 48.2854, 7.3014),
(3005915, 'Lauzerte', 44.2553, 1.13817),
(3005975, 'Lauret', 43.5624, -0.34256),
(3005998, 'L''Aupillon', 44.3719, 6.70754),
(3006096, 'La Tuilière', 45.1, 4.8),
(3006351, 'Lassouts', 44.4859, 2.86363),
(3006454, 'La Séguinière', 47.0636, -0.93857),
(3006590, 'La Rue', 48.15, -0.81667),
(3006731, 'La Ronce', 45.6167, 4.5),
(3006791, 'La Rochegiron', 44.0778, 5.65548),
(3006816, 'La Roche', 48.0833, 1.05),
(3007103, 'La Queue-d''Haye', 49.129, 1.54149),
(3007216, 'La Pommeraie', 48.3438, 0.60664),
(3007568, 'La Noue Peguille', 47.4786, -1.6194),
(3007745, 'La Neuville-sur-Essonne', 48.1873, 2.37636),
(3007978, 'La Mouthe', 44.9251, 1.01757),
(3007985, 'La Moulinerie', 45.4773, 1.13149),
(3008104, 'La Monta', 44.7667, 6.98333),
(3008120, 'Lamnay', 48.1175, 0.70676),
(3008215, 'Lambert', 45, -0.53333),
(3008221, 'Lambel', 47.837, -3.02942),
(3008563, 'Lalage', 44.9667, 0.9),
(3008856, 'La Guerche-sur-l''Aubois', 46.9489, 2.94524),
(3008942, 'Lagrange', 47.6807, 6.97728),
(3008975, 'La Grande Pra', 46.6501, 2.3082),
(3009355, 'La Forêt-de-Tessé', 46.0802, 0.08371),
(3009413, 'La Fonderie', 49.3459, 1.88082),
(3009419, 'La Folie Godot', 48.6081, 4.16572),
(3009425, 'Lafolie', 48.4091, 5.0841),
(3009442, 'La Flèche', 47.9772, -1.18408),
(3009451, 'Lafitole', 43.4449, 0.07504),
(3009459, 'Laffix', 45.4352, 3.90913),
(3009733, 'La Croix-en-Champagne', 49.0668, 4.64848),
(3010477, 'La Chalarderie', 48.5832, 0.84242),
(3010502, 'La Chabrouillie', 45.2487, 1.13221),
(3010780, 'La Broche', 49.75, 1.48333),
(3010996, 'La Boissière', 48.1748, 1.84904),
(3011275, 'Labastide-de-Lévis', 43.9277, 2.00964),
(3011287, 'Labastide-Castel-Amouroux', 44.35, 0.11667),
(3011433, 'Kœur-la-Petite', 48.85, 5.5),
(3011476, 'Keryel', 48.4604, -3.86189),
(3011481, 'Kervran', 47.8833, -3.68333),
(3011875, 'Kerdevot', 48.0062, -3.97728),
(3011917, 'Kerbarguin', 48.3819, -3.86145),
(3012013, 'Jutigny-le-Petit', 48.2469, 1.21985),
(3012344, 'Jeune', 45.2123, 1.91946),
(3012838, 'Illiers-l''Évêque', 48.8211, 1.2671),
(3012959, 'Hurt', 50.1718, 1.52673),
(3013097, 'Houilles', 48.9216, 2.19263),
(3013199, 'Hombourg', 47.7581, 7.50564),
(3013323, 'Heuqueville', 49.6162, 0.14555),
(3013351, 'Hétomesnil', 49.6259, 2.03333),
(3013385, 'Herry', 47.2167, 2.95386),
(3013496, 'Herbault', 47.605, 1.13934),
(3013542, 'Hémilly', 49.0621, 6.5016),
(3013669, 'Haut Penhors', 47.9423, -4.4035),
(3013854, 'Haudainville', 49.1266, 5.42171),
(3013922, 'Harfleur', 49.5066, 0.19827),
(3013977, 'Han-sur-Nied', 48.9889, 6.43696),
(3014024, 'Hamblain-les-Prés', 50.2925, 2.96133),
(3014157, 'Gurcy-le-Châtel', 48.4702, 3.08649),
(3014161, 'Guny', 49.5191, 3.26905),
(3014240, 'Guilmesnil', 49.5658, 1.48657),
(3014241, 'Guilmécourt', 49.9667, 1.3022),
(3014440, 'Guebenhouse', 49.0745, 6.94246),
(3014545, 'Gros Chêne', 48.0764, -1.33486),
(3014663, 'Griesheim-près-Molsheim', 48.503, 7.53027),
(3014681, 'Grèzes', 44.6271, 1.82095),
(3014826, 'Grauves', 48.9742, 3.96388),
(3014963, 'Grands Marmiers', 45.9926, 1.49103),
(3015551, 'Gourdan', 45.8281, 5.2252),
(3015614, 'Goudelin', 48.6037, -3.01842),
(3015686, 'Gonfaron', 43.3207, 6.28806),
(3016637, 'Garennes-sur-Eure', 48.9112, 1.43836),
(3016800, 'Gainneville', 49.5185, 0.26164),
(3016907, 'Fumay', 49.9913, 4.70771),
(3016959, 'Frontenay-Rohan-Rohan', 46.2528, -0.53833),
(3017715, 'Formigny', 49.3369, -0.89885),
(3017916, 'Fontenay-lès-Briis', 48.6196, 2.15276),
(3018055, 'Fontainejean', 47.8478, 2.96075),
(3018453, 'Fismes', 49.3077, 3.68607),
(3018665, 'Ferrassières-de-Barret', 44.1407, 5.52745),
(3018695, 'Fèrebrianges', 48.8667, 3.85),
(3019165, 'Fabas', 43.8589, 1.3509),
(3019250, 'Exermont', 49.2942, 5.00645),
(3019342, 'Étroussat', 46.2195, 3.22022),
(3019361, 'Étrépigny', 49.6856, 4.75285),
(3019564, 'Estarvielle', 42.8209, 0.41485),
(3019840, 'Escamps', 44.4, 1.58333),
(3019953, 'Équirre', 50.4736, 2.23513),
(3020224, 'Enchanet', 45.0889, 2.20394),
(3020581, 'Ébaty', 46.9296, 4.78393),
(3020599, 'Eauchaudes', 44.25, 6.46667),
(3020611, 'Duvy', 49.2354, 2.85766),
(3020865, 'Dozulé', 49.2313, -0.04454),
(3020961, 'Doueneix', 45.9167, 1.52894),
(3020985, 'Douchapt', 45.2428, 0.4427),
(3021054, 'Donzy-le-Pertuis', 46.4504, 4.7204),
(3021150, 'Domont', 49.0278, 2.32638),
(3021195, 'Domfaing', 48.2353, 6.75003),
(3021249, 'Dolmont', 48.426, 1.36192),
(3021316, 'Dissé-sous-le-Lude', 47.6097, 0.15467),
(3021463, 'Dhuilet', 48.3999, 2.1774),
(3021616, 'Demangevelle', 47.9262, 6.03548),
(3021634, 'Delain', 47.5814, 5.63647),
(3021731, 'Dardennes', 43.1663, 5.92881),
(3021790, 'Dancé', 48.3629, 0.75961),
(3022089, 'Culvreuse', 49.7686, 1.66544),
(3022200, 'Cubas', 45.2948, 1.12652),
(3022206, 'Cruzy', 43.3554, 2.94101),
(3022946, 'Coursier', 46.3167, 2.5),
(3023088, 'Courcelles-sur-Aujon', 47.8937, 5.09321),
(3023341, 'Coudray', 48.272, 2.36788),
(3023349, 'Coudeville-sur-Mer', 48.8815, -1.52744),
(3023359, 'Coudeau', 45.1211, -0.61553),
(3023990, 'La Condamine-Châtelard', 44.4589, 6.74639),
(3024531, 'Clussais-la-Pommeraie', 46.1966, 0.04779),
(3024577, 'Clitourps', 49.6564, -1.37388),
(3024673, 'Clémery', 48.8946, 6.18778),
(3024858, 'Citry', 48.9682, 3.23977),
(3025666, 'Chazeloux', 45.1965, 3.11837),
(3025972, 'Chaudron-en-Mauges', 47.2881, -0.98548),
(3025983, 'Chaudes-Aigues', 44.8534, 3.00364),
(3026605, 'Charly', 46.8994, 2.74822),
(3026657, 'Charencey Bas', 47.4222, 4.67242),
(3026987, 'Chanac', 44.4661, 3.34326),
(3027263, 'Champagne', 46.7447, 0.88222),
(3027498, 'Chalmazel', 45.7014, 3.85042),
(3027663, 'Chadeleuf', 45.5871, 3.17864),
(3027745, 'Ceyreste', 43.2133, 5.63111),
(3028116, 'Cavarc', 44.6894, 0.64159),
(3028140, 'Caux', 46.4328, 2.5557),
(3028290, 'Castifao', 42.504, 9.11244),
(3028311, 'Castéra-Lou', 43.3167, 0.15),
(3028470, 'Casapitti', 42.4478, 9.28691),
(3028778, 'Canteloup', 49.132, -0.13168),
(3029076, 'Camais', 47.3213, -2.12786),
(3029084, 'Calviac', 44.9222, 2.04782),
(3029091, 'Calves', 44.8634, 2.57915),
(3029203, 'Cailhavel', 43.1626, 2.1268),
(3029280, 'Cabrunas', 44.3509, 3.37021),
(3029310, 'Cabara', 44.8273, -0.15905),
(3029583, 'Bulcy', 47.2423, 3.02857),
(3029584, 'Bulat-Pestivien', 48.4284, -3.33008),
(3029585, 'Bulan', 43.0403, 0.27766),
(3029711, 'Bruzelles', 48.1537, 2.69177),
(3030084, 'Brierette', 46.2146, 3.87887),
(3030440, 'Brech', 47.7213, -2.99862),
(3030453, 'Bréandes', 47.8268, 3.54511),
(3030492, 'Braux-le-Châtel', 48.0991, 4.94445),
(3030776, 'Bout d''Amont', 49.8725, 1.24988),
(3030841, 'Bousquet', 45.0938, 1.06975),
(3030842, 'Bousogle', 45.9333, 1.75),
(3030843, 'Bousignies-sur-Roc', 50.2632, 4.18206),
(3031077, 'Bourcia', 46.3533, 5.40819),
(3031451, 'Bossée', 47.1121, 0.72944),
(3031552, 'Bords', 45.8972, -0.79528),
(3031714, 'Bonneuil', 46.3745, 1.23111),
(3031773, 'Bonneçon', 47.3805, 3.72321),
(3032075, 'Bois-Bruneau', 48.7, 1.25),
(3032157, 'Bodister', 48.4904, -3.799),
(3032694, 'Bièvres', 49.4936, 3.71226),
(3032714, 'Bierville', 48.3801, 2.14551),
(3032847, 'Bezannes', 49.2234, 3.98892),
(3032874, 'Beynat', 45.5398, 2.06597),
(3032935, 'Beurey-Bauguay', 47.2324, 4.42382),
(3032959, 'Bettwiller', 48.884, 7.18105),
(3033236, 'Berrien', 48.4028, -3.75266),
(3033812, 'Belbèse', 43.9016, 1.07071),
(3034291, 'Beaugouyan', 48.6477, -2.90383),
(3034317, 'Beaufort', 45.3293, 5.12708),
(3034588, 'Batut', 45, 1.03333),
(3034680, 'Basses Sièyes', 44.0835, 6.20375),
(3034756, 'Bas-Chainq', 48.0327, 3.76445),
(3034831, 'Barriac', 44.4685, 2.66202),
(3034965, 'Bard-lès-Pesmes', 47.2719, 5.63341),
(3034966, 'Bard-lès-Époisses', 47.5315, 4.21542),
(3035000, 'Barbuise', 48.5504, 3.57842),
(3035309, 'Bais', 48.0096, -1.28983),
(3035401, 'Bagnols', 45.4993, 2.63252),
(3035408, 'Bagneux', 49.4571, 3.27786),
(3035467, 'Badant', 46.1249, 1.88457),
(3036104, 'Aumont', 45.4333, 2.18333),
(3036391, 'Auberville', 49.3062, -0.0269),
(3036935, 'Arles', 42.4565, 2.63457),
(3036971, 'Argut-Dessus', 42.8911, 0.72958),
(3037453, 'Antichan', 42.9943, 0.58254),
(3037979, 'Amailloux', 46.7466, -0.31812),
(3038097, 'Alliquerville', 49.5945, 0.60292),
(3038219, 'Alette', 50.518, 1.82836),
(3038466, 'Aiguillon', 44.2989, 0.3402),
(3038485, 'Aiguevive', 47.2908, 1.21228),
(3038493, 'Aigues-Mortes', 43.5668, 4.19068),
(3231497, 'Kerziguénou', 48.2562, -4.54049),
(3232410, 'Quilisoy', 47.725, -3.38139),
(3232705, 'La Manon', 46.1042, -1.11528),
(3233611, 'Le Plessis', 47.2545, -2.15079),
(3295276, 'Capecure', 50.7208, 1.59667),
(6615539, 'Bourgoin-Jallieu', 45.5861, 5.27361),
(6619617, 'Plaisance', 44.7045, 0.56331),
(6620027, 'Ucel', 44.6265, 4.3964),
(6620129, 'Mathons', 48.4182, 5.0444),
(6620133, 'Dommartin-sous-Amance', 48.7413, 6.2558),
(6620152, 'Canteleux', 50.2155, 2.3084),
(6620221, 'Olmeta-di-Capocorso', 42.7689, 9.3716),
(6639958, 'Le Mollard', 45.208, 6.33396),
(6956508, 'Mont July', 46.1836, 5.33085),
(6956509, 'Chez moi', 45.7067, 4.78776),
(6956510, 'le troquet', 45.7583, 4.79908),
(6956511, 'pérou', -12.1831, -76.9285),
(6956512, 'Bar à jeux', 45.7689, 4.85034);

-- --------------------------------------------------------

--
-- Structure de la table `parties`
--

CREATE TABLE `parties` (
  `IdP` int(11) NOT NULL,
  `dateP` date NOT NULL,
  `equipeP` char(1) NOT NULL,
  `IdJx` int(11) NOT NULL,
  `IdL` int(11) NOT NULL,
  `dureeP` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `parties`
--

INSERT INTO `parties` (`IdP`, `dateP`, `equipeP`, `IdJx`, `IdL`, `dureeP`) VALUES
(167, '2010-06-02', 'j', 1, 3016907, '00:50:26'),
(168, '2015-10-27', 'j', 3, 3029711, '03:45:00'),
(169, '2003-04-18', 'j', 3, 3029583, '01:28:03'),
(170, '2009-02-05', 'j', 4, 3029583, '01:28:45'),
(171, '2013-07-05', 'j', 4, 3014240, '00:27:05'),
(172, '2004-07-18', 'j', 2, 3028470, '03:00:41'),
(173, '2005-06-05', 'j', 3, 2972328, '03:24:09'),
(174, '2014-10-31', 'j', 7, 2994918, '02:31:04'),
(175, '2012-09-06', 'j', 10, 3006454, '02:48:17'),
(176, '2010-09-05', 'j', 1, 3012013, '01:32:45'),
(177, '2013-10-10', 'j', 9, 3019250, '01:01:02'),
(178, '2007-07-30', 'e', 10, 6619617, '00:01:02'),
(179, '2003-09-12', 'j', 9, 3001415, '01:16:29'),
(180, '2001-09-13', 'e', 10, 3004285, '03:13:45'),
(181, '2005-03-31', 'j', 7, 3032157, '02:41:12'),
(182, '2011-05-15', 'j', 9, 3018055, '00:51:10'),
(183, '2004-12-06', 'j', 1, 3029583, '03:14:14'),
(184, '2012-12-15', 'j', 8, 2989896, '01:56:08'),
(185, '2009-07-13', 'e', 3, 2976444, '02:47:09'),
(186, '2012-07-15', 'j', 2, 2987719, '01:53:57'),
(187, '2012-02-23', 'e', 7, 2981029, '02:04:00'),
(188, '2011-12-07', 'e', 6, 3004528, '01:32:26'),
(189, '2003-07-15', 'j', 9, 3006791, '01:41:22'),
(190, '2004-12-16', 'j', 10, 3029091, '02:01:53'),
(191, '2013-07-23', 'e', 1, 2998506, '01:08:19'),
(192, '2003-10-23', 'j', 7, 3021463, '03:55:09'),
(193, '2001-11-13', 'e', 6, 3009442, '01:46:23'),
(194, '2005-02-15', 'e', 8, 3001138, '02:07:29'),
(195, '2004-12-04', 'j', 1, 2969645, '01:49:39'),
(196, '2001-04-23', 'j', 2, 3035408, '00:56:45'),
(197, '2011-08-08', 'j', 2, 3038466, '03:24:41'),
(198, '2006-11-30', 'j', 2, 3013542, '01:03:14'),
(199, '2004-08-18', 'e', 9, 2984671, '03:30:32'),
(200, '2009-08-15', 'e', 3, 3011481, '02:29:46'),
(201, '2002-02-06', 'e', 6, 3037979, '00:58:45'),
(202, '2011-09-26', 'e', 7, 3026605, '03:41:39'),
(203, '2008-06-05', 'j', 2, 2984671, '03:33:26'),
(204, '2011-04-22', 'e', 8, 2969171, '00:26:41'),
(205, '2010-08-06', 'j', 8, 3011275, '02:51:06'),
(206, '2013-06-18', 'j', 6, 2976179, '00:55:12'),
(207, '2004-07-15', 'e', 6, 2980119, '01:20:51'),
(208, '2011-07-19', 'j', 8, 2977605, '00:40:01'),
(209, '2006-06-16', 'j', 10, 2982647, '03:24:15'),
(210, '2013-07-06', 'e', 4, 3030842, '01:36:26'),
(211, '2003-10-20', 'j', 5, 3027263, '02:15:19'),
(212, '2007-12-28', 'j', 1, 3021249, '03:02:16'),
(213, '2011-10-30', 'e', 4, 3001702, '03:00:39'),
(214, '2005-10-03', 'e', 8, 2977812, '00:37:48'),
(215, '2009-07-06', 'j', 7, 3013854, '01:39:18'),
(216, '2005-10-25', 'j', 5, 2989686, '01:25:54');

-- --------------------------------------------------------

--
-- Structure de la table `rejoint`
--

CREATE TABLE `rejoint` (
  `dateRejoint` date NOT NULL,
  `IdJ` int(11) NOT NULL,
  `IdE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `rejoint`
--

INSERT INTO `rejoint` (`dateRejoint`, `IdJ`, `IdE`) VALUES
('2012-04-25', 1, 3),
('1987-12-12', 5, 1),
('1987-12-12', 8, 1),
('1996-11-13', 10, 4),
('2014-03-30', 10, 7),
('2012-04-25', 14, 3),
('1987-12-12', 18, 1),
('1987-12-12', 20, 1),
('2016-05-04', 26, 2),
('2014-03-30', 28, 7),
('2015-12-16', 33, 30),
('2010-04-04', 36, 6),
('2010-04-04', 41, 6),
('2015-12-17', 41, 37),
('2015-12-16', 43, 29),
('2015-12-17', 51, 34),
('2016-05-04', 54, 2),
('2015-12-17', 54, 36),
('2014-03-30', 56, 7),
('2015-12-17', 57, 38),
('1996-11-13', 63, 4),
('2015-12-17', 65, 31),
('2012-01-02', 77, 5),
('2015-12-17', 79, 33),
('2012-04-25', 84, 3),
('2012-01-02', 89, 5),
('2014-03-30', 93, 7),
('1996-11-13', 98, 4),
('2015-12-17', 112, 39),
('2015-12-16', 171, 28),
('2015-12-17', 175, 39),
('2015-12-17', 178, 31),
('2015-12-17', 196, 35),
('2015-12-17', 199, 33),
('2010-04-04', 201, 6),
('2010-04-04', 203, 6),
('2014-03-30', 246, 7),
('2012-04-25', 250, 3),
('2015-12-17', 288, 32),
('2015-12-16', 289, 29),
('2015-12-17', 292, 38),
('2015-12-17', 295, 36),
('2015-12-17', 307, 38),
('2014-03-30', 321, 7),
('2015-12-17', 331, 35),
('2015-12-17', 340, 37),
('2015-12-17', 389, 40),
('2015-12-16', 399, 30),
('2015-12-17', 423, 37),
('2015-12-17', 432, 32),
('2015-12-16', 438, 28),
('2015-12-17', 454, 31),
('2015-12-17', 481, 34),
('2015-12-17', 483, 38),
('2015-12-17', 483, 40),
('2015-12-17', 538, 31),
('2015-12-16', 546, 28),
('2015-12-16', 547, 28);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD PRIMARY KEY (`IdJx`,`IdC`),
  ADD KEY `FK_Appartient_IdC` (`IdC`);

--
-- Index pour la table `auteurs`
--
ALTER TABLE `auteurs`
  ADD PRIMARY KEY (`IdA`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`IdC`),
  ADD UNIQUE KEY `nomC` (`nomC`);

--
-- Index pour la table `creent`
--
ALTER TABLE `creent`
  ADD PRIMARY KEY (`IdJx`,`IdA`),
  ADD KEY `FK_Creent_IdA` (`IdA`);

--
-- Index pour la table `equipes`
--
ALTER TABLE `equipes`
  ADD PRIMARY KEY (`IdE`),
  ADD UNIQUE KEY `nomE` (`nomE`);

--
-- Index pour la table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`IdEx`),
  ADD KEY `FK_Extensions_IdJx` (`IdJx`);

--
-- Index pour la table `jeux`
--
ALTER TABLE `jeux`
  ADD PRIMARY KEY (`IdJx`),
  ADD UNIQUE KEY `nomJx` (`nomJx`);

--
-- Index pour la table `joueequipe`
--
ALTER TABLE `joueequipe`
  ADD PRIMARY KEY (`IdE`,`IdP`),
  ADD KEY `FK_JoueEquipe_IdP` (`IdP`);

--
-- Index pour la table `jouesolo`
--
ALTER TABLE `jouesolo`
  ADD PRIMARY KEY (`IdJ`,`IdP`),
  ADD KEY `FK_JoueSolo_IdP` (`IdP`);

--
-- Index pour la table `joueuses`
--
ALTER TABLE `joueuses`
  ADD PRIMARY KEY (`IdJ`),
  ADD UNIQUE KEY `pseudoJ` (`pseudoJ`);

--
-- Index pour la table `lieuj`
--
ALTER TABLE `lieuj`
  ADD PRIMARY KEY (`IdL`),
  ADD UNIQUE KEY `lieuJ` (`lieuJ`);

--
-- Index pour la table `parties`
--
ALTER TABLE `parties`
  ADD PRIMARY KEY (`IdP`),
  ADD KEY `FK_Parties_IdJx` (`IdJx`),
  ADD KEY `FK_Parties_IdL` (`IdL`);

--
-- Index pour la table `rejoint`
--
ALTER TABLE `rejoint`
  ADD PRIMARY KEY (`IdJ`,`IdE`),
  ADD KEY `FK_Rejoint_IdE` (`IdE`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `auteurs`
--
ALTER TABLE `auteurs`
  MODIFY `IdA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `IdC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `equipes`
--
ALTER TABLE `equipes`
  MODIFY `IdE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT pour la table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `IdEx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `jeux`
--
ALTER TABLE `jeux`
  MODIFY `IdJx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `joueuses`
--
ALTER TABLE `joueuses`
  MODIFY `IdJ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=548;
--
-- AUTO_INCREMENT pour la table `lieuj`
--
ALTER TABLE `lieuj`
  MODIFY `IdL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6956513;
--
-- AUTO_INCREMENT pour la table `parties`
--
ALTER TABLE `parties`
  MODIFY `IdP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `FK_Appartient_IdC` FOREIGN KEY (`IdC`) REFERENCES `categories` (`IdC`),
  ADD CONSTRAINT `FK_Appartient_IdJx` FOREIGN KEY (`IdJx`) REFERENCES `jeux` (`IdJx`);

--
-- Contraintes pour la table `creent`
--
ALTER TABLE `creent`
  ADD CONSTRAINT `FK_Creent_IdA` FOREIGN KEY (`IdA`) REFERENCES `auteurs` (`IdA`),
  ADD CONSTRAINT `FK_Creent_IdJx` FOREIGN KEY (`IdJx`) REFERENCES `jeux` (`IdJx`);

--
-- Contraintes pour la table `extensions`
--
ALTER TABLE `extensions`
  ADD CONSTRAINT `FK_Extensions_IdJx` FOREIGN KEY (`IdJx`) REFERENCES `jeux` (`IdJx`);

--
-- Contraintes pour la table `joueequipe`
--
ALTER TABLE `joueequipe`
  ADD CONSTRAINT `FK_JoueEquipe_IdE` FOREIGN KEY (`IdE`) REFERENCES `equipes` (`IdE`),
  ADD CONSTRAINT `FK_JoueEquipe_IdP` FOREIGN KEY (`IdP`) REFERENCES `parties` (`IdP`);

--
-- Contraintes pour la table `jouesolo`
--
ALTER TABLE `jouesolo`
  ADD CONSTRAINT `FK_JoueSolo_IdJ` FOREIGN KEY (`IdJ`) REFERENCES `joueuses` (`IdJ`),
  ADD CONSTRAINT `FK_JoueSolo_IdP` FOREIGN KEY (`IdP`) REFERENCES `parties` (`IdP`);

--
-- Contraintes pour la table `parties`
--
ALTER TABLE `parties`
  ADD CONSTRAINT `FK_Parties_IdJx` FOREIGN KEY (`IdJx`) REFERENCES `jeux` (`IdJx`),
  ADD CONSTRAINT `FK_Parties_IdL` FOREIGN KEY (`IdL`) REFERENCES `lieuj` (`IdL`);

--
-- Contraintes pour la table `rejoint`
--
ALTER TABLE `rejoint`
  ADD CONSTRAINT `FK_Rejoint_IdE` FOREIGN KEY (`IdE`) REFERENCES `equipes` (`IdE`),
  ADD CONSTRAINT `FK_Rejoint_IdJ` FOREIGN KEY (`IdJ`) REFERENCES `joueuses` (`IdJ`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

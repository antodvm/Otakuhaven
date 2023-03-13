-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 13, 2023 at 10:24 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `otakuhaven_fr`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `categorie` varchar(100) NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ordre` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categorie`, `description`, `ordre`) VALUES
(1, 'figurine', ' figurines originales', 1),
(2, 'statue', 'Statue originale en résines', 2),
(3, 'goodies', 'Goodies en tout genre', 3);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int NOT NULL,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_connexion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `login`, `email`, `password`, `date_connexion`) VALUES
(1, 'Toto', 'toto@toto.fr', '$2y$10$SuzhebVF6tYBQxpsTqFK3uS17MimJAkTf0EEmzxnFuvsFUWeOLcfS', '2022-01-28 16:09:34');

-- --------------------------------------------------------

--
-- Table structure for table `clients_old`
--

CREATE TABLE `clients_old` (
  `id` int NOT NULL,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_connexion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `id` int NOT NULL,
  `date_creation` datetime NOT NULL,
  `user_id` int NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `status` int NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `cp` varchar(5) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `reduction` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`id`, `date_creation`, `user_id`, `session_id`, `status`, `total`, `prenom`, `nom`, `email`, `telephone`, `adresse`, `cp`, `ville`, `reduction`) VALUES
(16, '2022-01-31 21:21:06', 1, 'huk84tctv95enpi49s4val4006', 1, '7.47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commande_produits`
--

CREATE TABLE `commande_produits` (
  `id` int NOT NULL,
  `id_commande` int NOT NULL,
  `id_produit` int NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `qte` int NOT NULL,
  `date_creation` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commande_produits`
--

INSERT INTO `commande_produits` (`id`, `id_commande`, `id_produit`, `prix`, `qte`, `date_creation`) VALUES
(22, 16, 8, '0.87', 1, '2022-01-31 21:21:06'),
(23, 16, 18, '2.20', 3, '2022-01-31 21:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `panier`
--

CREATE TABLE `panier` (
  `id` int NOT NULL,
  `id_produit` int NOT NULL,
  `quantite` int NOT NULL,
  `prix_unitaire` decimal(5,2) NOT NULL,
  `session` varchar(255) DEFAULT NULL,
  `id_client` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `panier`
--

INSERT INTO `panier` (`id`, `id_produit`, `quantite`, `prix_unitaire`, `session`, `id_client`) VALUES
(1, 8, 1, '0.87', 'huk84tctv95enpi49s4val4006', 1),
(2, 18, 3, '2.20', 'huk84tctv95enpi49s4val4006', 1);

-- --------------------------------------------------------

--
-- Table structure for table `produits`
--

CREATE TABLE `produits` (
  `id` int NOT NULL,
  `ref` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nom` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_souscat` int UNSIGNED NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_roman_ci NOT NULL,
  `prix` decimal(5,2) DEFAULT NULL,
  `img` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `poids` decimal(3,3) DEFAULT NULL,
  `marque` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_roman_ci NOT NULL,
  `licence` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_roman_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_roman_ci;

--
-- Dumping data for table `produits`
--

INSERT INTO `produits` (`id`, `ref`, `nom`, `id_souscat`, `description`, `prix`, `img`, `poids`, `marque`, `licence`) VALUES
(1, NULL, 'MY HERO ACADEMIA - UNITED STATES OF SMASH HQS TSUME', 7, 'My Hero Academia Statue United States of Smash HQS Tsume. Figurine en résine et PVC sur socle décor en édition limité de All Might en plein combat contre All for One.', '471.00', 'my-hero-academia-united-states-of-smash-hqs-tsume.jpg', NULL, 'tsume', 'MyHeroAcademia'),
(2, NULL, 'My Hero Academia - Statue Izuku Midoriya VS Stain', 7, 'Statue en PVC de Izuku Midoriya VS Stain. Incroyable diorama mettant en scène le jeune Izuku à la détermination évidente et tenace, face au redoutable tueur de Heros, Stain. Une figurine qui dégage énormement de puissance avec les postures adoptées et les expressions sur leurs visages. Cette scène emblématique à marqué les esprits de fans de cette licence. Les détails sont impressionnants de réalismes, vous entrainant dans l\'univers de My Hero Academia. ', '599.90', 'my-hero-academia-statue-izuku-midoriya-vs-stain.jpg', NULL, 'Takara Tomy', 'MyHeroAcademia'),
(3, NULL, 'My Hero Academia Bakugo & Deku Two One For All Statue en résine', 8, 'Échelle du produit : 1/6\r\nHauteur : 38,3 cm\r\nLargeur : 36,1 cm\r\nProfondeur : 34,3 cm\r\nLivraison prévue : deuxième trimestre 2023', '595.00', 'Bakugo & Deku Two One For All.jpg', NULL, '73Collectibles', 'MyHeroAcademia'),
(4, NULL, 'One Piece - Figurine Yamato Senkouzekkei', 5, 'Retrouvez Yamato de l\'univers One Piece dans cette figurine de la superbe gamme Senkozekkei de chez Banpresto ! Elle mesure 11 cm ! La figurine est inspirée du combat Ace Vs. Yamato ! Portgas D. Ace est d\'ailleurs également disponible à la précommande sur le site !', '34.90', 'one-piece-figurine-yamato-senkouzekkei.jpg', NULL, 'Bampresto', 'One Piece'),
(5, NULL, 'Tengen Uzui - Vibration Stars - Demon Slayer Kimetsu no Yaiba', 5, 'La gamme de figurine Banpresto Vibration Stars propose des depictions des personnage en situation d\'action intense.\r\n\r\nLe puissant pilier du son, Tengen Uzui, rejoint la serie a succes du fabriquant avec une figurine au sculpt des plus charismatique.\r\n\r\nTengen est immortalisé en pleine charge, ses deux epées Nishirin prêtes a frapper.\r\n\r\nCool et classe.\r\n\r\nMesure environ 13cm.', '32.90', 'banpresto-tengen-uzui-vibration-stars-demon-slayer-kimetsu-no-yaiba-13cm.jpg', NULL, 'Banpresto', 'Demon Slayer Kimetsu no Yaiba'),
(6, NULL, 'Demon Slayer - Akaza (Upper Tree) - FIGUARTS ZERO', 6, 'Voici la Figuarts Zero de Akaza (Upper Tree) de Kimetsu No Yaiba par Tamashii Nation.\n\nIl y a des siècles, Akaza était un humain du nom de Hakuji avant d\'être personnellement transformé en démon par Muzan Kibutsuji.\n\nC\'est un des principaux antagonistes de la serie, démon affilié aux Douze Kizuki, occupant le poste de Troisième Rang Supérieur.\n\nMesure environ 18cm.', '74.90', 'tamashii-demon-slayer-akaza-upper-tree-figuarts-zero-0-18cm.jpg', NULL, 'Tamashii', 'Demon Slayer Kimetsu no Yaiba'),
(7, NULL, 'Porte-clé Jujutsu Kaisen : Satoru\r\n', 1, 'Porte-clé Jujutsu Kaisen : Satoru Gojo exorciste de classe S', '9.90', 'satoru.jpg', NULL, 'Porte-clé', 'Jujutsu Kaisen'),
(8, NULL, 'Porte-clé Jujutsu Kaisen : Yuji\r\n', 1, 'Porte-clé Jujutsu Kaisen : Yuji Itadori, personnage principal de Jujutsu Kaisen', '9.90', 'yuji.jpg', NULL, 'Porte-clé', 'Jujutsu Kaisen'),
(9, NULL, 'Porte-clé Jujutsu Kaisen : Yuji Itadori\r\n', 1, 'Porte-clé Jujutsu Kaisen : Yuji Itadori, personnage principal de Jujutsu Kaisen', '9.90', 'yuji-itadori.jpg', NULL, 'Porte-clé', 'Jujutsu Kaisen'),
(10, NULL, 'Grande Peluche Naruto Uzumaki\r\n', 2, 'Livraison gratuite\r\nTaille 28 cm', '29.95', '0-cm-anime-naruto-uzumaki-naruto-peluche_main-0.jpg', NULL, 'pepe', 'Naruto'),
(11, NULL, 'MAKAYA Anime Manga T-Shirt pour Hommeanches Courtes - Death by Ryuk - Col Rond Coton Note Vert', 4, 'Style : Casual\r\nCol : Col classique\r\nType de manches : Manches courtes\r\nSaison : Été', '22.50', 'makaya-anime-manga-t-shirt-pour-hommeanches-courte.jpg', NULL, 'makaya', 'DeathNote'),
(12, NULL, 'Affiche imprimée HD Naruto Uzumaki Anime - 51.5 x 36 cm (Style 25)', 3, 'Les affiches murales Pas De Deux sont le décor de chambre préféré de tous ! Nos posters sont créés à partir de dessins en haute résolution et sont imprimés sur du papier brillant qui met en valeur les couleurs afin de créer une décoration murale audacieuse dans n\'importe quelle pièce. Décorez la chambre à coucher, la salle de bain, la chambre d\'enfant, le salon, le bureau, le dortoir, et plus encore ! Nos tirages d\'art sont légers et prêts à être encadrés ou peuvent être accrochés au mur à l\'aide de supports d\'affiche', '7.86', 'Affiche-imprimee-HD-Naruto-Uzumaki-Anime-51-5-x-36-cm-Style-25.jpg', NULL, 'W199054', 'Naruto');

-- --------------------------------------------------------

--
-- Table structure for table `produits_mis_en_avant`
--

CREATE TABLE `produits_mis_en_avant` (
  `id` int NOT NULL,
  `id_produit` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produits_mis_en_avant`
--

INSERT INTO `produits_mis_en_avant` (`id`, `id_produit`) VALUES
(1, 13),
(2, 16),
(3, 22);

-- --------------------------------------------------------

--
-- Table structure for table `sous_categorie`
--

CREATE TABLE `sous_categorie` (
  `id` int UNSIGNED NOT NULL,
  `sous_categorie` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_cat` int UNSIGNED NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ordre` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sous_categorie`
--

INSERT INTO `sous_categorie` (`id`, `sous_categorie`, `id_cat`, `description`, `ordre`) VALUES
(1, 'Porte-clés', 3, 'Porte-clés', 1),
(2, 'Peluches', 3, 'Peluches d\'anime', 2),
(3, 'Posters', 3, 'Posters d\'anime', 3),
(4, 'T-shirts', 3, 'T-shirts d\'anime', 4),
(5, 'Figurines de héros', 1, 'Figurines de héros', 5),
(6, 'Figurines de vilains', 1, 'Figurines de vilains', 6),
(7, 'Statues de héros', 2, 'Statues de héros', 7),
(8, 'Statues de vilains', 2, 'Statues de vilains', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_old`
--
ALTER TABLE `clients_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_2` (`user_id`);

--
-- Indexes for table `commande_produits`
--
ALTER TABLE `commande_produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_commande` (`id_commande`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Indexes for table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Indexes for table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_souscat` (`id_souscat`);

--
-- Indexes for table `produits_mis_en_avant`
--
ALTER TABLE `produits_mis_en_avant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Indexes for table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cat` (`id_cat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clients_old`
--
ALTER TABLE `clients_old`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `commande_produits`
--
ALTER TABLE `commande_produits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `panier`
--
ALTER TABLE `panier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `produits_mis_en_avant`
--
ALTER TABLE `produits_mis_en_avant`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande` FOREIGN KEY (`user_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits` FOREIGN KEY (`id_souscat`) REFERENCES `sous_categorie` (`id`);

--
-- Constraints for table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  ADD CONSTRAINT `sous_categorie` FOREIGN KEY (`id_cat`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

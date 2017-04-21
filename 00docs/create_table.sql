--
-- Structure de la table `livres`
--
DROP TABLE IF EXISTS `livres`;
CREATE TABLE `livres` (
  `LivreID` int(11) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `prix_unitaire` decimal(10,0) DEFAULT NULL,
  `actif` int(1) DEFAULT NULL,
  `idAuteur` INT(8) UNSIGNED NOT NULL,
  `idCategorie` INT(8) UNSIGNED NOT NULL,
  `idEditeur` INT(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Structure de la table `utilisateurs`
--
DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE `utilisateurs` (
  `utilisateur` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `admin` int(1) DEFAULT NULL,
  `actif` int(1) DEFAULT NULL,
  `idRole` INT(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Structure de la table `ventes`
--
DROP TABLE IF EXISTS `ventes`;
CREATE TABLE `ventes` (
  `idvente` int(11) NOT NULL,
  `datevente` int(11) DEFAULT NULL,
  `etat` varchar(255) DEFAULT NULL,
  `utilisateurs_utilisateur` varchar(255) NOT NULL,
  `idLivraison` INT(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `vente_details`
--
DROP TABLE IF EXISTS `ventes_details`;
CREATE TABLE `vente_details` (
  `idvente_detail` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  `prix_unitaire` decimal(10,0) DEFAULT NULL,
  `vente_idvente` int(11) NOT NULL,
  `livres_LivreID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `auteurs`
--
DROP TABLE IF EXISTS `auteurs`;
CREATE TABLE `auteurs` (
	idAuteur INT(8) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(30) NOT NULL,
	prenom VARCHAR(30) NOT NULL,
	nationalite VARCHAR(30)
);

--
-- Structure de la table `categories`
--
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
	idCategorie INT(8) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    genre VARCHAR(30) NOT NULL
);

--
-- Structure de la table `editeurs`
--
DROP TABLE IF EXISTS `editeurs`;
CREATE TABLE `editeurs` (
	idEditeur INT(8) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(30) NOT NULL,
    adresse VARCHAR(30) NOT NULL
);

--
-- Structure de la table `roles`
--
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `role` (
	idRole INT(8) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(30) NOT NULL
);

--
-- Structure de la table `livraisons`
--
DROP TABLE IF EXISTS `livraisons`;
CREATE TABLE `livraison` (
	idLivraison INT(8) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    modeLivraison VARCHAR(30) NOT NULL
);

--
-- Index
--

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`LivreID`),
  ADD KEY `fk_auteur` (`idAuteur`);
  ADD KEY `fk_categorie` (`idCategorie`);
  ADD KEY `fk_editeur` (`idEditeur`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`utilisateur`);
  ADD KEY `fk_role` (`idRole`);

--
-- Index pour la table `ventes`
--
ALTER TABLE `ventes`
  ADD PRIMARY KEY (`idvente`,`utilisateurs_utilisateur`),
  ADD KEY `fk_vente_utilisateurs_idx` (`utilisateurs_utilisateur`),
  ADD KEY `fk_livraison` (`idLivraison`);

--
-- Index pour la table `vente_details`
--
ALTER TABLE `vente_details`
  ADD PRIMARY KEY (`idvente_detail`,`vente_idvente`),
  ADD KEY `fk_vente_detail_livres1_idx` (`livres_LivreID`),
  ADD KEY `fk_vente_detail_vente1_idx` (`vente_idvente`);

ALTER TABLE `auteurs`
	ADD PRIMARY KEY (`idAuteur`);

ALTER TABLE `categories`
	ADD PRIMARY KEY (`idCategorie`);

ALTER TABLE `editeurs`
	ADD PRIMARY KEY (`idEditeur`);

ALTER TABLE `roles`
	ADD PRIMARY KEY (`idRole`);

ALTER TABLE `livraisons`
	ADD PRIMARY KEY (`idLivraison`);

--
-- AUTO_INCREMENT
--

--
-- AUTO_INCREMENT pour la table `livres`
--
ALTER TABLE `livres`
  MODIFY `LivreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `ventes`
--
ALTER TABLE `ventes`
  MODIFY `idvente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `vente_details`
--
ALTER TABLE `vente_details`
  MODIFY `idvente_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
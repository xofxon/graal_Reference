-- phpMyAdmin SQL Dump
-- version 2.11.8.1deb5
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 11 Novembre 2022 à 10:18
-- Version du serveur: 5.0.51
-- Version de PHP: 5.2.6-1+lenny3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `graal_reference`
--

-- --------------------------------------------------------

--
-- Structure de la table `nc_2009_autosuffisant`
--

CREATE TABLE IF NOT EXISTS `nc_2009_autosuffisant` (
  `cleunik` int(10) NOT NULL,
  `code` varchar(255) default NULL,
  `libelle` varchar(255) default NULL,
  `col_03` varchar(255) default NULL,
  `code_sans_espace` varchar(12) default NULL COMMENT 'Code sans espace',
  PRIMARY KEY  USING BTREE (`cleunik`),
  KEY `CODES` (`code`),
  KEY `code_nosp` (`code_sans_espace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='NC 2009 autosuffisants';

-- --------------------------------------------------------

--
-- Structure de la table `nc_2009_officiel`
--

CREATE TABLE IF NOT EXISTS `nc_2009_officiel` (
  `cleunik` int(10) NOT NULL,
  `code` varchar(255) default NULL,
  `nombre_tirets` tinyint(4) default NULL,
  `tirets` varchar(255) default NULL,
  `libelle` varchar(255) default NULL,
  `us` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`cleunik`),
  KEY `CODES` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='NC 2009 officielle';

-- --------------------------------------------------------

--
-- Structure de la table `ngp_2009_autosuffisant`
--

CREATE TABLE IF NOT EXISTS `ngp_2009_autosuffisant` (
  `cleunik` int(10) NOT NULL,
  `code_ngp9` varchar(255) default NULL,
  `libelle` longtext,
  PRIMARY KEY  USING BTREE (`cleunik`),
  KEY `CODE NGP9` (`code_ngp9`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='NGP 2009 autosuffisants';

-- --------------------------------------------------------

--
-- Structure de la table `ngp_2009_officiel`
--

CREATE TABLE IF NOT EXISTS `ngp_2009_officiel` (
  `cleunik` int(10) NOT NULL,
  `code_ngp9` varchar(255) default NULL,
  `libelle_officiel` varchar(255) default NULL,
  PRIMARY KEY  USING BTREE (`cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='NGP 2009 officielle';

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_baronnat_01`
--
CREATE TABLE IF NOT EXISTS `vue_baronnat_01` (
`act_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Structure de la table `_acteurs`
--

CREATE TABLE IF NOT EXISTS `_acteurs` (
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé Unik',
  `codealphanum15` varchar(15) default NULL COMMENT 'Code Type Notes',
  `raisonsoc` varchar(100) default NULL COMMENT 'Raison Sociale',
  `nomcommercial` varchar(100) default NULL COMMENT 'Nom commercial',
  `siret` varchar(23) default NULL COMMENT 'SIRET/SIREN',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut pour recherche',
  `blocnotertf` longtext COMMENT 'Bloc note au format RTF',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheurevalidite` datetime default '2061-01-23 12:00:00' COMMENT 'Date de "péremption"',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `typeacteur` bigint(20) default NULL COMMENT 'Type dacteur',
  `c_uuid` varchar(36) NOT NULL default '',
  `mnemotechnique` varchar(20) default NULL COMMENT 'Identification mnémotechnique',
  `modegestion` bigint(20) default '121500' COMMENT 'Mode de gestion',
  `actif` tinyint(4) default '1' COMMENT 'Acteur actif 1->Oui, 2->Non',
  `devise` bigint(20) default '122047' COMMENT 'Devise privilégiée de l''acteur',
  `langue` bigint(20) default '120131' COMMENT 'Langue privilégiée de l''acteur',
  UNIQUE KEY `act_cleunik` (`act_cleunik`),
  KEY `raisonsoc` (`raisonsoc`),
  KEY `nomcommercial` (`nomcommercial`),
  KEY `siret` (`siret`),
  KEY `typeacteur` (`typeacteur`),
  KEY `FK__acteurs_1` (`modegestion`),
  KEY `FK__acteurs_2` (`devise`),
  KEY `Index_8` (`actif`),
  KEY `FK__acteurs_3` (`langue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Acteur';

-- --------------------------------------------------------

--
-- Structure de la table `_acteurs_blanc`
--

CREATE TABLE IF NOT EXISTS `_acteurs_blanc` (
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique des acteurs',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé unique des utilisateurs',
  UNIQUE KEY `act_cleunikuti_cleunik` USING BTREE (`act_cleunik`,`uti_cleunik`),
  KEY `act_cleunik` (`act_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Liste blanche des acteurs par utilisateur';

-- --------------------------------------------------------

--
-- Structure de la table `_acteurs_favoris`
--

CREATE TABLE IF NOT EXISTS `_acteurs_favoris` (
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé Unique acteur',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé unique utilisateur',
  `genre` bigint(20) default NULL COMMENT '1 Favori, 2 liste noire',
  UNIQUE KEY `Index_3` (`act_cleunik`,`uti_cleunik`,`genre`),
  KEY `act_cleunik` (`act_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Acteurs favoris par utilisateur';

-- --------------------------------------------------------

--
-- Structure de la table `_acteurs_noire`
--

CREATE TABLE IF NOT EXISTS `_acteurs_noire` (
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique des acteurs',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé unique des utilisateurs',
  UNIQUE KEY `act_cleunikuti_cleunik` USING BTREE (`act_cleunik`,`uti_cleunik`),
  KEY `act_cleunik` (`act_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Liste noire des acteurs par utilisateur';

-- --------------------------------------------------------

--
-- Structure de la table `_acteurs_relations`
--

CREATE TABLE IF NOT EXISTS `_acteurs_relations` (
  `act_cleunik_gauche` bigint(20) default NULL COMMENT 'Clé Unique acteur',
  `choix_cleunik_gauche` bigint(20) default NULL COMMENT 'Intitulé de la relation Clé unique table choix ',
  `choix_cleunik_droite` bigint(20) default NULL COMMENT 'Intitulé de la relation Clé unique table choix ',
  `blocnotebrut` longtext COMMENT 'Bloc note brut',
  `blocnoteriche` longtext COMMENT 'Bloc note riche',
  `act_cleunik_droite` bigint(20) default NULL COMMENT 'Clé Unique acteur',
  KEY `act_cleunik_gauche` (`act_cleunik_gauche`),
  KEY `choix_cleunik_gauche` (`choix_cleunik_gauche`),
  KEY `choix_cleunik_droite` (`choix_cleunik_droite`),
  KEY `act_cleunik_droite` (`act_cleunik_droite`),
  KEY `Index_4` (`act_cleunik_gauche`,`choix_cleunik_gauche`,`choix_cleunik_droite`,`act_cleunik_droite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relations entre acteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_acteurs_representants`
--

CREATE TABLE IF NOT EXISTS `_acteurs_representants` (
  `act_cleunik_gauche` bigint(20) default NULL COMMENT 'Acteur',
  `choix_cleunik_gauche` bigint(20) default NULL COMMENT 'Intitulé de la relation Clé unique table choix ',
  `choix_cleunik_droite` bigint(20) default NULL COMMENT 'Intitulé de la relation Clé unique table choix ',
  `blocnotebrut` longtext COMMENT 'Bloc note brut',
  `blocnoteriche` longtext COMMENT 'Bloc note riche',
  `act_cleunik_droite` bigint(20) default NULL COMMENT 'Représentant',
  `commission_typ` tinyint(4) default '1' COMMENT 'Type de commission : 1-> taux,2->fixe,3->mixte',
  `commission_taux` decimal(15,4) default NULL COMMENT 'Taux de commission',
  `commission_fixe` decimal(15,4) default NULL COMMENT 'Montant fixe de commission',
  `commission_regle` bigint(20) default '1' COMMENT 'Règle de calcul des commission',
  KEY `act_cleunik_gauche` (`act_cleunik_gauche`),
  KEY `choix_cleunik_gauche` (`choix_cleunik_gauche`),
  KEY `choix_cleunik_droite` (`choix_cleunik_droite`),
  KEY `act_cleunik_droite` (`act_cleunik_droite`),
  KEY `Index_4` (`act_cleunik_gauche`,`choix_cleunik_gauche`,`choix_cleunik_droite`,`act_cleunik_droite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Représentants des acteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_acteurs_soundex_fr`
--

CREATE TABLE IF NOT EXISTS `_acteurs_soundex_fr` (
  `act_cleunik` bigint(20) NOT NULL default '0',
  `raisonsoc` char(4) NOT NULL default '' COMMENT 'Raison sociale',
  `nomcommercial` char(4) NOT NULL default '' COMMENT 'Nom commercial',
  UNIQUE KEY `Index_1` USING HASH (`act_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sondex français des acteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_actions`
--

CREATE TABLE IF NOT EXISTS `_actions` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Clé unique table choix ',
  `dateheuredebut` datetime default NULL COMMENT 'Date et heure de début de laction',
  `dateheurefin` datetime default NULL COMMENT 'Date et heure de fin de laction',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `blocnote_brut` longtext,
  `blocnote_riche` longtext,
  `position` tinyint(4) default NULL COMMENT 'Position de laction',
  `description` longtext COMMENT 'Description',
  `c_uuid` varchar(40) default NULL COMMENT 'Identifiant unique',
  `action_type` tinyint(4) default '1' COMMENT 'Type d''action : 1 Evènement, 2 Tâches',
  `lieu` longtext COMMENT 'Lieu',
  `confidentialite` bigint(20) default '-21' COMMENT 'Confidentialité de laction',
  `priorite` bigint(20) default '-22' COMMENT 'Priorité de laction',
  `statut` bigint(20) default '-23' COMMENT 'Statut de l''action',
  `dateheureprevue` datetime default NULL COMMENT 'Date et heure prévue de début de l''action',
  `realisation` decimal(8,4) default NULL COMMENT 'Pourcentage de réalisation de l''action',
  `sujet` longtext COMMENT 'Sujet',
  `reference` longtext COMMENT 'Référence',
  `gestion_duree` tinyint(4) default '2' COMMENT 'Gestion de la durée',
  UNIQUE KEY `action_cleunik` (`action_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `FK__actions_2` (`confidentialite`),
  KEY `FK__actions_3` (`priorite`),
  KEY `FK__actions_4` (`statut`),
  KEY `Index_6` (`dateheuredebut`),
  KEY `Index_7` (`dateheurefin`),
  KEY `index_8` (`c_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Actions';

--
-- Déclencheurs `_actions`
--
DROP TRIGGER IF EXISTS `graal_emailing_reference`.`TGRI_actions`;
DELIMITER //
CREATE TRIGGER `graal_emailing_reference`.`TGRI_actions` AFTER INSERT ON `graal_emailing_reference`.`_actions`
 FOR EACH ROW BEGIN
	INSERT INTO _actions_texte (action_cleunik, description) VALUES (new.action_cleunik, new.description);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `graal_emailing_reference`.`TGRU_actions`;
DELIMITER //
CREATE TRIGGER `graal_emailing_reference`.`TGRU_actions` AFTER UPDATE ON `graal_emailing_reference`.`_actions`
 FOR EACH ROW BEGIN
	UPDATE _actions_texte SET description=new.description where action_cleunik=new.action_cleunik;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `graal_emailing_reference`.`TGRD_actions`;
DELIMITER //
CREATE TRIGGER `graal_emailing_reference`.`TGRD_actions` AFTER DELETE ON `graal_emailing_reference`.`_actions`
 FOR EACH ROW BEGIN	
	DELETE FROM _actions_texte where action_cleunik=old.action_cleunik;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `_actions_blanc`
--

CREATE TABLE IF NOT EXISTS `_actions_blanc` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé unique des actions',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé unique des utilisateurs',
  UNIQUE KEY `action_cleunikuti_cleunik` USING BTREE (`action_cleunik`,`uti_cleunik`),
  KEY `action_cleunik` (`action_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Liste blanche des actions par utilisateur';

-- --------------------------------------------------------

--
-- Structure de la table `_actions_choix_fixes`
--

CREATE TABLE IF NOT EXISTS `_actions_choix_fixes` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Clé unique table choix ',
  `critere_cleunik` bigint(20) default NULL COMMENT 'Clé unique de critère',
  `uti_cleunik` bigint(20) default '0' COMMENT 'Clé unique de l''utilisateur (0) -> entreprise',
  UNIQUE KEY `UK_01` (`action_cleunik`,`choix_cleunik`,`critere_cleunik`,`uti_cleunik`),
  KEY `action_cleunik` (`action_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `act_cleunikchoix_cleunik` (`action_cleunik`,`choix_cleunik`),
  KEY `critere_cleunik` (`critere_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Actions_Choix_fixes';

-- --------------------------------------------------------

--
-- Structure de la table `_actions_commentaires`
--

CREATE TABLE IF NOT EXISTS `_actions_commentaires` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé Unique action',
  `commentaire_cleunik` bigint(20) default NULL COMMENT 'Clé Unique commentaire',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé Unik acteur',
  `int_cleunik` bigint(20) default NULL COMMENT 'Clé unique interlocuteur',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de derniere modification',
  `blocnote_brut` longtext COMMENT 'Commentaire',
  UNIQUE KEY `_actions_commentaires_u1` (`commentaire_cleunik`),
  KEY `_actions_commentaires_ibfk_1` (`action_cleunik`),
  KEY `_actions_commentaires_ibfk_2` (`act_cleunik`),
  KEY `_actions_commentaires_ibfk_3` (`int_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Commentaires des actions';

-- --------------------------------------------------------

--
-- Structure de la table `_actions_favorites`
--

CREATE TABLE IF NOT EXISTS `_actions_favorites` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé Unique action',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé unique utilisateur',
  `genre` bigint(20) default NULL COMMENT '1 Favori, 2 liste noire',
  UNIQUE KEY `Index_3` (`action_cleunik`,`uti_cleunik`,`genre`),
  KEY `action_cleunik` (`action_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Actions favorites par utilisateur';

-- --------------------------------------------------------

--
-- Structure de la table `_actions_noire`
--

CREATE TABLE IF NOT EXISTS `_actions_noire` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé unique des actions',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé unique des utilisateurs',
  UNIQUE KEY `action_cleunikuti_cleunik` USING BTREE (`action_cleunik`,`uti_cleunik`),
  KEY `action_cleunik` (`action_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Liste noire des actions par utilisateur';

-- --------------------------------------------------------

--
-- Structure de la table `_actions_texte`
--

CREATE TABLE IF NOT EXISTS `_actions_texte` (
  `action_cleunik` bigint(20) default NULL COMMENT 'action_cleunik',
  `description` longtext COMMENT 'Description',
  UNIQUE KEY `action_cleunik` (`action_cleunik`),
  FULLTEXT KEY `description` (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Texte brut des descriptions des actions';

-- --------------------------------------------------------

--
-- Structure de la table `_act_adresses`
--

CREATE TABLE IF NOT EXISTS `_act_adresses` (
  `adr_cleunik` bigint(20) default NULL COMMENT 'Clé unique adresse',
  `adr_cod` varchar(15) default NULL COMMENT 'Code adresse',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé Unik acteur',
  `adr_complementnom` varchar(50) default NULL COMMENT 'Eventuel complément de nom',
  `adr_ligne1` varchar(50) default NULL COMMENT 'Ligne 1 adresse',
  `adr_ligne2` varchar(50) default NULL COMMENT 'Ligne 2 adresse',
  `adr_ligne3` varchar(50) default NULL COMMENT 'Ligne 3 adresse',
  `adr_cp` varchar(10) default NULL COMMENT 'Code postal',
  `adr_ville` varchar(50) default NULL COMMENT 'Ville',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Pays (Clé unique table choix)',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `adr_latitude` double(9,6) default NULL COMMENT 'Latitude',
  `adr_longitude` double(9,6) default NULL COMMENT 'Longitude',
  `adr_typecoordonnees` bigint(20) default NULL COMMENT 'Type d''adresse',
  `adr_type` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Type d''adresse : 1 france, 2 étranger',
  UNIQUE KEY `adr_cleunik` (`adr_cleunik`),
  KEY `adr_cod` (`adr_cod`),
  KEY `act_cleunik` (`act_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `adr_typecoordonnees` (`adr_typecoordonnees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses des acteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_act_choix_fixes`
--

CREATE TABLE IF NOT EXISTS `_act_choix_fixes` (
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé Unik',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Clé unique table choix ',
  `critere_cleunik` bigint(20) default NULL COMMENT 'Clé unique de critère',
  `typeacteur` bigint(20) default NULL COMMENT 'Type acteur',
  `uti_cleunik` bigint(20) default '0' COMMENT 'Clé unique de l''utilisateur (0) -> entreprise',
  UNIQUE KEY `UK_01` (`act_cleunik`,`choix_cleunik`,`critere_cleunik`,`uti_cleunik`),
  KEY `act_cleunik` (`act_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `act_cleunikchoix_cleunik` (`act_cleunik`,`choix_cleunik`),
  KEY `critere_cleunik` (`critere_cleunik`),
  KEY `FK__act_choix_fixes_4` (`typeacteur`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Choix fixes des acteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_act_compta`
--

CREATE TABLE IF NOT EXISTS `_act_compta` (
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé Unik',
  `compte` varchar(15) default NULL COMMENT 'OBSOLETE NE SERT PLUS (18 mars 2008)',
  `tvaintracommunautaire` varchar(18) default NULL COMMENT 'N° de TVA intracommunautaire',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `encours_autorise` decimal(15,4) default NULL COMMENT 'Encours autorisé',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `escompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''escompte',
  `escompte_type` tinyint(4) default '1' COMMENT '1-> Taux, 2 Montant',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `reg_cleunik` bigint(20) default '-1' COMMENT 'Mode de règlement',
  `pc_cleunik` bigint(20) default '-1' COMMENT 'Clé unique plan comptable',
  `assujetti_tpf` tinyint(4) default '1' COMMENT 'Assujetti aux taxes parafiscales 1->Oui (défault),2->Non',
  `montant_port` decimal(15,4) default '0.0000' COMMENT 'Montant du port',
  `seuil_franco` decimal(15,4) default '0.0000' COMMENT 'Seuil pour franco de port',
  `commande_mini` decimal(15,4) default '0.0000' COMMENT 'Minimum de commande',
  UNIQUE KEY `act_cleunik` (`act_cleunik`),
  KEY `_act_compta_ibfk_1` (`catcompta_cleunik`),
  KEY `FK__act_compta_2` (`tarif_cleunik`),
  KEY `_act_compta_ibfk_4` (`reg_cleunik`),
  KEY `_act_compta_ibfk_5` (`pc_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informations comptable des acteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_act_iban`
--

CREATE TABLE IF NOT EXISTS `_act_iban` (
  `iban_cleunik` bigint(20) default NULL COMMENT 'Clé Unique',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `iban_info` varchar(34) default NULL COMMENT 'Représentation informatique de l''IBAN',
  `iban_papi` varchar(50) default NULL COMMENT 'Représentation papier de l''IBAN',
  `iban_bic` varchar(50) default NULL COMMENT 'BIC (Bank Identifier Code)',
  `iban_pay` bigint(20) default '121500' COMMENT 'Pays de référence',
  UNIQUE KEY `act_cleunik` (`iban_cleunik`),
  KEY `FK__act_iban_1` (`act_cleunik`),
  KEY `iban_unik_1` (`act_cleunik`,`iban_info`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='I.B.A.N des acteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_act_interlo`
--

CREATE TABLE IF NOT EXISTS `_act_interlo` (
  `int_cleunik` bigint(20) default NULL COMMENT 'Clé unique interlocuteur',
  `codealphanum15` varchar(15) default NULL COMMENT 'Code Type Notes',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `patronyme` varchar(100) default NULL COMMENT 'Nom',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `prenom` varchar(100) default NULL COMMENT 'Prénom',
  `blocnotertf` longtext COMMENT 'Bloc notes RTF',
  `dateheuremodif` datetime default NULL COMMENT 'Date de création/modification',
  `infodefaut` tinyint(4) default NULL COMMENT 'Contact principal',
  `dateheurevalidite` datetime default NULL COMMENT 'Date de péremption',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Civilité (Clé unique table choix )',
  `actif` tinyint(4) default '1' COMMENT 'Interlocuteur actif : 1 -> Oui, 2 Non',
  `patronyme_autre` varchar(100) default NULL COMMENT 'Eventuel autre patronyme, actif ou ancien, de linterlocuteur',
  UNIQUE KEY `int_cleunik` (`int_cleunik`),
  KEY `codealphanum15` (`codealphanum15`),
  KEY `act_cleunik` (`act_cleunik`),
  KEY `patronyme` (`patronyme`),
  KEY `choix_cleunik` (`choix_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Interlocuteurs dacteur';

-- --------------------------------------------------------

--
-- Structure de la table `_act_interlo_adresses`
--

CREATE TABLE IF NOT EXISTS `_act_interlo_adresses` (
  `adr_cleunik` bigint(20) default NULL COMMENT 'Clé unique adresse',
  `adr_cod` varchar(15) default NULL COMMENT 'Code adresse',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé Unik acteur',
  `int_cleunik` bigint(20) default NULL COMMENT 'Clé Unik interlocuteur acteur',
  `adr_complementnom` varchar(50) default NULL COMMENT 'Eventuel complément de nom',
  `adr_ligne1` varchar(50) default NULL COMMENT 'Ligne 1 adresse',
  `adr_ligne2` varchar(50) default NULL COMMENT 'Ligne 2 adresse',
  `adr_ligne3` varchar(50) default NULL COMMENT 'Ligne 3 adresse',
  `adr_cp` varchar(10) default NULL COMMENT 'Code postal',
  `adr_ville` varchar(50) default NULL COMMENT 'Ville',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Pays (Clé unique table choix)',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `adr_latitude` double(9,6) default NULL COMMENT 'Latitude',
  `adr_longitude` double(9,6) default NULL COMMENT 'Longitude',
  `adr_typecoordonnees` bigint(20) default NULL COMMENT 'Type d''adresse',
  `adr_type` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Type d''adresse : 1 france, 2 étranger',
  UNIQUE KEY `adr_cleunik` (`adr_cleunik`),
  KEY `adr_cod` (`adr_cod`),
  KEY `act_cleunik` (`act_cleunik`),
  KEY `int_cleunik` (`int_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `adr_typecoordonnees` (`adr_typecoordonnees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses des interlocuteurs d''acteurs (entreprise seulement ';

-- --------------------------------------------------------

--
-- Structure de la table `_act_interlo_choix_fixes`
--

CREATE TABLE IF NOT EXISTS `_act_interlo_choix_fixes` (
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `int_cleunik` bigint(20) default NULL COMMENT 'Clé unique interlocuteur',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Clé unique table choix ',
  `critere_cleunik` bigint(20) default NULL COMMENT 'Clé unique de critère',
  `typeacteur` bigint(20) default NULL COMMENT 'Type d''acteur',
  `uti_cleunik` bigint(20) default '0' COMMENT 'Clé unique de l''utilisateur (0) -> entreprise',
  UNIQUE KEY `UK_01` (`act_cleunik`,`int_cleunik`,`choix_cleunik`,`critere_cleunik`,`uti_cleunik`),
  KEY `act_cleunik` (`act_cleunik`),
  KEY `int_cleunik` (`int_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `critere_cleunik` (`critere_cleunik`),
  KEY `FK__act_interlo_choix_fixes_4` (`typeacteur`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Choix fixes des interlocuteurs dacteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_act_interlo_favoris`
--

CREATE TABLE IF NOT EXISTS `_act_interlo_favoris` (
  `int_cleunik` bigint(20) default NULL COMMENT 'Clé Unique interlocuteur acteur',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé unique utilisateur',
  `genre` bigint(20) default NULL COMMENT '1 Favori, 2 liste noire,3 liste blanche',
  UNIQUE KEY `Index_3` (`int_cleunik`,`uti_cleunik`,`genre`),
  KEY `int_cleunik` (`int_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Interlocuteurs d''acteurs favoris par utilisateur';

-- --------------------------------------------------------

--
-- Structure de la table `_act_interlo_fax`
--

CREATE TABLE IF NOT EXISTS `_act_interlo_fax` (
  `intel_cleunik` bigint(20) default NULL COMMENT 'Clé Unique',
  `int_cleunik` bigint(20) default NULL COMMENT 'Clé Unik',
  `telformate` varchar(50) default NULL COMMENT 'Numéro Téléphone formaté',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `blocnotertf` longtext COMMENT 'Bloc note RTF',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `intel_05` varchar(50) default NULL COMMENT 'N° téléphone texte "Brut"',
  `intel_06` bigint(20) unsigned default NULL COMMENT 'N° téléphone numérique',
  `infofavori` tinyint(4) default NULL COMMENT 'Fax favori',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Type de téléphone (Clé unique table choix)',
  `prefixe_choix_cleunik` bigint(20) default NULL COMMENT 'Préfixe international',
  `valide` tinyint(4) default '1' COMMENT '1-> Oui, 2-> Non, 3-> Ne sais pas',
  UNIQUE KEY `intel_cleunik` (`intel_cleunik`),
  KEY `int_cleunik` (`int_cleunik`),
  KEY `act_cleunik` (`act_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `FK__act_interlo_fax_2` (`prefixe_choix_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Fax des interlocuteurs dacteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_act_interlo_mail`
--

CREATE TABLE IF NOT EXISTS `_act_interlo_mail` (
  `intweb_cleunik` bigint(20) default NULL COMMENT 'Clé Unique',
  `int_cleunik` bigint(20) default NULL COMMENT 'Clé Unik',
  `refweb` varchar(255) default NULL COMMENT 'Courriel',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `blocnotertf` longtext COMMENT 'Bloc note RTF',
  `veuxpasdemail` tinyint(4) default NULL COMMENT 'Ne pas utiliser cet e-mail',
  `infofavori` tinyint(4) default NULL COMMENT 'Courriel favori',
  `utilisable` tinyint(4) default NULL COMMENT 'Utilisable',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé Unik',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Type de courriel',
  `valide` tinyint(4) default NULL COMMENT 'Adresse Valide (Oui/Non)',
  `c_uuid` varchar(36) default NULL COMMENT 'Identifiant unique au monde !?',
  `dateheureverification` datetime default NULL COMMENT 'Date de la dernière vérification',
  `cr_verification` longtext COMMENT 'Compte-rendu de la dernière vérification',
  UNIQUE KEY `intweb_cleunik` (`intweb_cleunik`),
  KEY `int_cleunik` (`int_cleunik`),
  KEY `refweb` (`refweb`),
  KEY `act_cleunik` (`act_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Courriels des interlocuteurs des acteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_act_interlo_mesinst`
--

CREATE TABLE IF NOT EXISTS `_act_interlo_mesinst` (
  `mesinst_cleunik` bigint(20) default NULL COMMENT 'Clé Unique Messagerie instantanée',
  `int_cleunik` bigint(20) default NULL COMMENT 'Clé Unik interlocuteur',
  `mesinst` varchar(255) default NULL COMMENT 'Identifiant pour Messagerie instantanée',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `blocnotertf` longtext COMMENT 'Bloc note RTF',
  `veuxpasdecontact` tinyint(4) default NULL COMMENT 'Ne pas utiliser cette adresse',
  `infofavori` tinyint(4) default NULL COMMENT 'Identifiant favori',
  `utilisable` tinyint(4) default NULL COMMENT 'Utilisable',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé Unik',
  `choix_cleunik_type` bigint(20) default '-96' COMMENT 'Type d''adresse',
  `choix_cleunik_prot` bigint(20) default '-99' COMMENT 'Protocole d''adresse',
  `valide` tinyint(4) default NULL COMMENT 'Identifiant Valide (Oui/Non)',
  `c_uuid` varchar(36) default NULL COMMENT 'Identifiant unique au monde !?',
  `dateheureverification` datetime default NULL COMMENT 'Date de la dernière vérification',
  `cr_verification` longtext COMMENT 'Compte-rendu de la dernière vérification',
  UNIQUE KEY `mesinst_cleunik` (`mesinst_cleunik`),
  KEY `int_cleunik` (`int_cleunik`),
  KEY `mesinst` (`mesinst`),
  KEY `act_cleunik` (`act_cleunik`),
  KEY `choix_cleunik_type` (`choix_cleunik_type`),
  KEY `choix_cleunik_genr` (`choix_cleunik_prot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Messageries instantanée des interlocuteurs des acteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_act_interlo_relations`
--

CREATE TABLE IF NOT EXISTS `_act_interlo_relations` (
  `int_cleunik_gauche` bigint(20) default NULL COMMENT 'Clé Unique interlocuteur acteur',
  `choix_cleunik_gauche` bigint(20) default NULL COMMENT 'Intitulé de la relation Clé unique table choix ',
  `choix_cleunik_droite` bigint(20) default NULL COMMENT 'Intitulé de la relation Clé unique table choix ',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `blocnoteriche` longtext COMMENT 'Bloc Note riche',
  `int_cleunik_droite` bigint(20) default NULL COMMENT 'Clé Unique interlocuteur acteur',
  UNIQUE KEY `Index_4` (`int_cleunik_gauche`,`choix_cleunik_gauche`,`choix_cleunik_droite`,`int_cleunik_droite`),
  KEY `int_cleunik_gauche` (`int_cleunik_gauche`),
  KEY `choix_cleunik_gauche` (`choix_cleunik_gauche`),
  KEY `choix_cleunik_droite` (`choix_cleunik_droite`),
  KEY `int_cleunik_droite` (`int_cleunik_droite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relations entre interlocuteurs d''acteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_act_interlo_tel`
--

CREATE TABLE IF NOT EXISTS `_act_interlo_tel` (
  `intel_cleunik` bigint(20) default NULL COMMENT 'Clé Unique',
  `int_cleunik` bigint(20) default NULL COMMENT 'Clé Unik',
  `telformate` varchar(50) default NULL COMMENT 'Numéro Téléphone formaté',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `blocnotertf` longtext COMMENT 'Bloc note RTF',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `intel_05` varchar(50) default NULL COMMENT 'N° téléphone texte "Brut"',
  `intel_06` bigint(20) unsigned default NULL COMMENT 'N° téléphone numérique',
  `infofavori` tinyint(4) default NULL COMMENT 'Téléphone favori',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Type de téléphone (Clé unique table choix)',
  `prefixe_choix_cleunik` bigint(20) default NULL COMMENT 'Préfixe international',
  `valide` tinyint(4) default '1' COMMENT '1-> Oui, 2-> Non, 3-> Ne sais pas',
  `portable` tinyint(4) default '2' COMMENT 'Portable 1-> Oui, 2-> Non',
  `sms` tinyint(4) default '2' COMMENT 'Reçoit les SMS 1-> Oui, 2-> Non',
  UNIQUE KEY `intel_cleunik` (`intel_cleunik`),
  KEY `int_cleunik` (`int_cleunik`),
  KEY `act_cleunik` (`act_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `FK__act_interlo_tel_2` (`prefixe_choix_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ressources "phones" des interlocuteurs des acteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_act_rib`
--

CREATE TABLE IF NOT EXISTS `_act_rib` (
  `rib_cleunik` bigint(20) default NULL COMMENT 'Clé Unique',
  `domiciliation` varchar(25) default NULL COMMENT 'Domiciliation',
  `etablissement` varchar(5) default NULL COMMENT 'Code Etablissement',
  `guichet` varchar(5) default NULL COMMENT 'Code guichet',
  `compte` varchar(11) default NULL COMMENT 'Numéro de compte',
  `cle` varchar(2) default NULL COMMENT 'Clé de contrôle',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `blocnotertf` longtext COMMENT 'Bloc note RTF',
  `dateheurevalidite` datetime default NULL COMMENT 'Date de "péremption"',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé Unik acteur',
  `principal` tinyint(1) NOT NULL default '0' COMMENT 'Compte principal',
  UNIQUE KEY `rib_cleunik` (`rib_cleunik`),
  UNIQUE KEY `codenumero` (`etablissement`,`guichet`,`compte`,`cle`,`act_cleunik`),
  KEY `act_cleunik` (`act_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RIB des acteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_act_sites`
--

CREATE TABLE IF NOT EXISTS `_act_sites` (
  `site_cleunik` bigint(20) default NULL COMMENT 'Clé Unique',
  `refweb` varchar(255) default NULL COMMENT 'Site',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `blocnotertf` longtext COMMENT 'Bloc note RTF',
  `dateheurevalidite` datetime default NULL COMMENT 'Date de "péremption"',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé Unik',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Type de Site',
  UNIQUE KEY `site_cleunik` (`site_cleunik`),
  KEY `refweb` (`refweb`),
  KEY `act_cleunik` (`act_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sites web ds acteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_article`
--

CREATE TABLE IF NOT EXISTS `_article` (
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé Unique',
  `code` varchar(20) default NULL COMMENT 'Code',
  `indice` varchar(10) default NULL COMMENT 'Indice',
  `mnemotechnique` varchar(20) default NULL COMMENT 'Identification mnémotechnique',
  `description` varchar(100) default NULL COMMENT 'Description courte',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `blocnotertf` longtext COMMENT 'Bloc note RTF',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de création',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheurevalidite` datetime default '2061-01-23 00:00:00' COMMENT 'Date de "péremption"',
  `types_gestion` bigint(20) unsigned default NULL COMMENT 'Types de gestion',
  `actif` tinyint(4) default '1' COMMENT 'Article actif 1->Oui, 2->Non',
  `nbdec_prix` tinyint(4) default '2' COMMENT 'Nombre de décimales gérées pour les prix de l''article',
  `pr_generique` decimal(15,4) default '0.0000' COMMENT 'Prix de revient générique',
  `nbdec_qte` tinyint(4) default '2' COMMENT 'Nombre de décimales pour les quantités (4 maxi)',
  `nc_2009_autosuffisant_cleunik` int(10) default '-1' COMMENT 'NC 2009 pour deb',
  UNIQUE KEY `artcleunik` (`art_cleunik`),
  UNIQUE KEY `code` (`code`,`indice`),
  KEY `mnemo` (`mnemotechnique`),
  KEY `descri` (`description`),
  KEY `Index_5` (`actif`),
  KEY `_art_nc2009_auto` (`nc_2009_autosuffisant_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Articles';

-- --------------------------------------------------------

--
-- Structure de la table `_art_achats`
--

CREATE TABLE IF NOT EXISTS `_art_achats` (
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé Unique article',
  `delai_reappro` bigint(20) unsigned default NULL COMMENT 'Délai moyen de réapprovisionnement',
  `unite_reappro` bigint(20) default NULL COMMENT 'Unité de temps du délai moyen de réapprovisionnement',
  `der_pa` decimal(15,4) default NULL COMMENT 'Dernier Prix d''achat',
  `pamp` decimal(15,4) default NULL COMMENT 'Prix d''achat moyen pondéré',
  `dateheure_der_achat` datetime default NULL COMMENT 'Date/Heure du dernier achat',
  `unite_achat` bigint(20) default NULL COMMENT 'Unité dachat',
  UNIQUE KEY `indunik_1` (`art_cleunik`),
  KEY `_art_achats_ibfk_3` (`unite_reappro`),
  KEY `_art_achats_ibfk_4` (`unite_achat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Articles (partie achats)';

-- --------------------------------------------------------

--
-- Structure de la table `_art_acteur`
--

CREATE TABLE IF NOT EXISTS `_art_acteur` (
  `art_acteur_cleunik` bigint(20) default NULL COMMENT 'Clé Unique article acteur',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé Unique article',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé Unique acteur',
  `code` varchar(20) default NULL COMMENT 'Code chez l''acteur',
  `description` varchar(100) default NULL COMMENT 'Description courte chez l''acteur',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `blocnotertf` longtext COMMENT 'Bloc note RTF',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de création',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheurevalidite` datetime default NULL COMMENT 'Date de "péremption"',
  `delai_reappro` bigint(20) unsigned default NULL COMMENT 'Délai de réapprovisionnement (fournisseur)',
  `unite_reappro` bigint(20) default '-20' COMMENT 'Unité de temps du délai de réapprovisionnement(fournisseur) ',
  `minimum_commande` decimal(19,4) default NULL COMMENT 'Quantité minimale de commande',
  `unite_achat` bigint(20) default '-36' COMMENT 'Unité d''achat',
  UNIQUE KEY `indunik_1` (`art_acteur_cleunik`),
  KEY `descri` (`description`),
  KEY `_art_fournis_ibfk_1` (`art_cleunik`),
  KEY `_art_fournis_ibfk_2` (`act_cleunik`),
  KEY `_art_fournis_ibfk_3` (`unite_reappro`),
  KEY `_art_fournis_ibfk_4` (`unite_achat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Articles des acteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_art_choix_fixes`
--

CREATE TABLE IF NOT EXISTS `_art_choix_fixes` (
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé Unik de l''article',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Clé unique table choix ',
  `critere_cleunik` bigint(20) default NULL COMMENT 'Clé unique de critère',
  `uti_cleunik` bigint(20) default '0' COMMENT 'Clé unique de l''utilisateur (0) -> entreprise',
  UNIQUE KEY `UK_01` (`art_cleunik`,`choix_cleunik`,`critere_cleunik`,`uti_cleunik`),
  KEY `art_cleunik` (`art_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `art_cleunikchoix_cleunik` (`art_cleunik`,`choix_cleunik`),
  KEY `critere_cleunik` (`critere_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Choix fixes des articles';

-- --------------------------------------------------------

--
-- Structure de la table `_art_compta`
--

CREATE TABLE IF NOT EXISTS `_art_compta` (
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé Unik article',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `pc_cleunik_vente` bigint(20) default '-1' COMMENT 'Clé unique plan comptable (vente)',
  `pc_cleunik_achat` bigint(20) default '-1' COMMENT 'Clé unique plan comptable (achat)',
  `taxes_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxes',
  `tpf_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxes parafiscale',
  `tpf_cleunik_01` bigint(20) default '-1' COMMENT 'Clé unique 2° taxe parafiscale',
  UNIQUE KEY `U_K_01` (`art_cleunik`,`catcompta_cleunik`),
  KEY `_art_compta_ibfk_1` (`pc_cleunik_vente`),
  KEY `_art_compta_ibfk_2` (`pc_cleunik_achat`),
  KEY `FK_art_compta_2` (`catcompta_cleunik`),
  KEY `FK_art_compta_5` (`taxes_cleunik`),
  KEY `FK_art_compta_6` (`tpf_cleunik`),
  KEY `FK_art_compta_7` (`tpf_cleunik_01`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informations comptable des articles';

-- --------------------------------------------------------

--
-- Structure de la table `_art_dep_emp`
--

CREATE TABLE IF NOT EXISTS `_art_dep_emp` (
  `art_depemp_cleunik` bigint(20) default NULL COMMENT 'Clé unique article Dépot Emplacement',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé Unique article',
  `qte_stock` decimal(15,3) default NULL COMMENT 'Quantité en stock',
  `choix_depot` bigint(20) default NULL COMMENT 'Dépôt principal',
  `choix_empla` bigint(20) default NULL COMMENT 'Emplacement principal',
  `qte_inven` decimal(15,3) default NULL COMMENT 'Quantité du dernier inventaire',
  `dateheure_invent` datetime default NULL COMMENT 'Date/Heure du dernier inventaire',
  UNIQUE KEY `Index_4` USING BTREE (`art_depemp_cleunik`),
  UNIQUE KEY `u_index1` (`art_cleunik`,`choix_depot`,`choix_empla`),
  KEY `_art_dep_emp_ibfk_2` (`choix_depot`),
  KEY `_art_dep_emp_ibfk_3` (`choix_empla`),
  KEY `_art_dep_emp_ibfk_1` (`art_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Articles (Informations dépôt/Emplacement)';

-- --------------------------------------------------------

--
-- Structure de la table `_art_dimensions`
--

CREATE TABLE IF NOT EXISTS `_art_dimensions` (
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé Unique article',
  `capacite` decimal(15,4) default NULL COMMENT 'Capacité',
  `unite_capacite` bigint(20) default NULL COMMENT 'Unité de capacité',
  `poids_brut` decimal(15,4) default NULL COMMENT 'Poids brut',
  `poids_net` decimal(15,4) default NULL COMMENT 'Poids net',
  `unite_poids` bigint(20) default NULL COMMENT 'Unité de poids',
  `tare` decimal(15,4) default '0.0000' COMMENT 'tare',
  `longueur` decimal(15,4) default '0.0000' COMMENT 'Longueur',
  `largeur` decimal(15,4) default '0.0000' COMMENT 'Largeur',
  `epaisseur` decimal(15,4) default '0.0000' COMMENT 'Epaisseur',
  `unite_longueur` bigint(20) default '-90' COMMENT 'Unité de longueur',
  UNIQUE KEY `indunik_1` (`art_cleunik`),
  KEY `_art_dimensions_ibfk_2` (`unite_capacite`),
  KEY `_art_dimensions_ibfk_3` (`unite_poids`),
  KEY `_art_dimensions_ibfk_4` (`unite_longueur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Articles (partie dimensions)';

-- --------------------------------------------------------

--
-- Structure de la table `_art_fabs`
--

CREATE TABLE IF NOT EXISTS `_art_fabs` (
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé Unique article',
  `multiple_base` decimal(15,4) default '1.0000' COMMENT 'Multiple de base de fabrication',
  `pr` decimal(19,4) default '0.0000' COMMENT 'Prix de revient',
  `nbdec_pr` tinyint(4) default '2' COMMENT 'Nombre de décimales du prix de revient',
  UNIQUE KEY `indunik_1` (`art_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Articles (partie fabrication)';

-- --------------------------------------------------------

--
-- Structure de la table `_art_favoris`
--

CREATE TABLE IF NOT EXISTS `_art_favoris` (
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé Unique article',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé unique utilisateur',
  `genre` bigint(20) default NULL COMMENT '1 Favori, 2 liste noire,3 liste blanche',
  UNIQUE KEY `Index_3` (`art_cleunik`,`uti_cleunik`,`genre`),
  KEY `art_cleunik` (`art_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Articles favoris par utilisateur';

-- --------------------------------------------------------

--
-- Structure de la table `_art_libelle`
--

CREATE TABLE IF NOT EXISTS `_art_libelle` (
  `art_cleunik` bigint(20) NOT NULL default '0' COMMENT 'Clé unique article',
  `descriptif_brut` longtext character set latin1 NOT NULL COMMENT 'Descriptif brut',
  `descriptif_riche` longtext character set latin1 NOT NULL COMMENT 'Descriptif riche',
  `langue` bigint(20) NOT NULL default '120131',
  `genre` bigint(20) NOT NULL default '0' COMMENT 'Genre de libellé',
  UNIQUE KEY `Index_1` (`art_cleunik`,`langue`,`genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Libellés des articles';

-- --------------------------------------------------------

--
-- Structure de la table `_art_relations`
--

CREATE TABLE IF NOT EXISTS `_art_relations` (
  `art_cleunik_gauche` bigint(20) default NULL COMMENT 'Clé Unique article',
  `choix_cleunik_gauche` bigint(20) default NULL COMMENT 'Intitulé de la relation Clé unique table choix ',
  `choix_cleunik_droite` bigint(20) default NULL COMMENT 'Intitulé de la relation Clé unique table choix ',
  `blocnotebrut` longtext COMMENT 'Bloc note brut',
  `blocnoteriche` longtext COMMENT 'Bloc note riche',
  `art_cleunik_droite` bigint(20) default NULL COMMENT 'Clé Unique article',
  KEY `art_cleunik_gauche` (`art_cleunik_gauche`),
  KEY `choix_cleunik_gauche` (`choix_cleunik_gauche`),
  KEY `choix_cleunik_droite` (`choix_cleunik_droite`),
  KEY `art_cleunik_droite` (`art_cleunik_droite`),
  KEY `Index_4` (`art_cleunik_gauche`,`choix_cleunik_gauche`,`choix_cleunik_droite`,`art_cleunik_droite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relations entre articles';

-- --------------------------------------------------------

--
-- Structure de la table `_art_stock`
--

CREATE TABLE IF NOT EXISTS `_art_stock` (
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé Unique article',
  `qte_stock` decimal(15,4) default NULL COMMENT 'Quantité en stock',
  `unite_stock` bigint(20) default NULL COMMENT 'Unité de stock',
  `qte_inven` decimal(15,4) default NULL COMMENT 'Quantité du dernier inventaire',
  `dateheure_invent` datetime default NULL COMMENT 'Date/Heure du dernier inventaire',
  `pu_reference` decimal(15,4) default NULL COMMENT 'Prix de référence pour la valorisation',
  `gestion` tinyint(4) default NULL COMMENT 'Gestion des dépots et emplacements',
  `qte_mini` decimal(15,4) default NULL COMMENT 'Quantité minimale',
  `qte_maxi` decimal(15,4) default NULL COMMENT 'Quantité maximale',
  `qte_securite` decimal(15,4) default NULL COMMENT 'Stock de sécurité',
  `qte_alerte` decimal(15,4) default NULL COMMENT 'Seuil d''alerte',
  `cumul_entrees` decimal(15,4) default NULL COMMENT 'Cumul des entrées',
  `cumul_sorties` decimal(15,4) default NULL COMMENT 'Cumul des sorties',
  `nb_decimales_qte` tinyint(4) default NULL COMMENT 'Nombre de décimales gérées pour les quantités de stock',
  `dateheure_dermvt` datetime default NULL COMMENT 'Date/heure du dernier mouvement de stock',
  `unite_condi` bigint(20) default '-37' COMMENT 'Unité de conditionnement',
  `nb_stock_in_condi` decimal(15,4) default NULL COMMENT 'Nombre d''unités de stock dans une unité de conditionnement',
  UNIQUE KEY `artcleunik` (`art_cleunik`),
  KEY `FK__art_stock_2` (`unite_stock`),
  KEY `_art_stock_ibfk_3` (`unite_condi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Articles (informations de stock)';

-- --------------------------------------------------------

--
-- Structure de la table `_art_tarifs`
--

CREATE TABLE IF NOT EXISTS `_art_tarifs` (
  `tar_cleunik` bigint(20) default NULL COMMENT 'Clé Unique tarif',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé Unique article',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Clé tarif (choix de critere 101 pour tarifs généraux ventes)',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé Unique acteur (0 pour tarifs généraux)',
  `pu_reference` decimal(15,4) default NULL COMMENT 'Prix unitaire de référence',
  `actif` tinyint(4) default NULL COMMENT 'Tarif actif',
  `dateheure_dermaj` datetime default NULL COMMENT 'Date/heure de la derniere MAJ',
  `dateheure_validite` datetime default NULL COMMENT 'Date/Heure de validité',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut pour recherche',
  `blocnotertf` longtext COMMENT 'Bloc note au format RTF',
  `type` tinyint(4) default NULL COMMENT 'Type ->1 ventes,2->achats',
  `quantite_basse` decimal(15,4) default NULL COMMENT 'Quantité basse (borne mini)',
  `quantite_haute` decimal(15,4) default NULL COMMENT 'Quantité haute (borne maxi)',
  `unite_quantite` decimal(15,4) default '1.0000' COMMENT 'Unité de PU (au cent-> 100, au mille-> 1000 etc)',
  `nb_dec` smallint(5) default '2' COMMENT 'Nombre de décimales pour le prix unitaire',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  UNIQUE KEY `tar_cleunik` (`tar_cleunik`),
  KEY `K_art_tarif_1` (`actif`),
  KEY `K_art_tarif_2` (`type`),
  KEY `FK_art_tarif_1` (`tarif_cleunik`),
  KEY `FK_art_tarif_2` (`art_cleunik`),
  KEY `FK_art_tarif_3` (`act_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tarif des articles';

-- --------------------------------------------------------

--
-- Structure de la table `_art_ventes`
--

CREATE TABLE IF NOT EXISTS `_art_ventes` (
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé Unique article',
  `unite_vente` bigint(20) default NULL COMMENT 'Unité de vente',
  UNIQUE KEY `art_cleunik` (`art_cleunik`),
  KEY `_art_ventes_ibfk_1` (`unite_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Articles (partie ventes)';

-- --------------------------------------------------------

--
-- Structure de la table `_avocli_adresses`
--

CREATE TABLE IF NOT EXISTS `_avocli_adresses` (
  `adr_cleunik` bigint(20) default NULL COMMENT 'Clé unique adresse',
  `adr_cod` varchar(15) default NULL COMMENT 'Code adresse',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `adr_nom` varchar(50) default NULL COMMENT 'Nom de la société',
  `adr_complementnom` varchar(50) default NULL COMMENT 'Eventuel complément de nom',
  `adr_ligne1` varchar(50) default NULL COMMENT 'Ligne 1 adresse',
  `adr_ligne2` varchar(50) default NULL COMMENT 'Ligne 2 adresse',
  `adr_ligne3` varchar(50) default NULL COMMENT 'Ligne 3 adresse',
  `adr_cp` varchar(10) default NULL COMMENT 'Code postal',
  `adr_ville` varchar(50) default NULL COMMENT 'Ville',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Pays (Clé unique table choix)',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `adr_latitude` double(9,6) default NULL COMMENT 'Latitude',
  `adr_longitude` double(9,6) default NULL COMMENT 'Longitude',
  `adr_typecoordonnees` bigint(20) default NULL COMMENT 'Type d''adresse',
  `adr_type` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Type d''adresse : 1 france, 2 étranger',
  UNIQUE KEY `adr_cleunik` (`adr_cleunik`),
  KEY `adr_cod` (`adr_cod`),
  KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `adr_typecoordonnees` (`adr_typecoordonnees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses des avoirs clients';

-- --------------------------------------------------------

--
-- Structure de la table `_avocli_consignes`
--

CREATE TABLE IF NOT EXISTS `_avocli_consignes` (
  `action_consi_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/consigne',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''acteur consignant l''article',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''article consigné',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité',
  `qte_nbdec` tinyint(4) default '0' COMMENT 'Nombre de décimales',
  `qte_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis sur la consigne',
  UNIQUE KEY `_avocli_consignes_ibfk_0` (`action_consi_cleunik`),
  KEY `_avocli_consignes_ibfk_1` (`act_cleunik`),
  KEY `_avocli_consignes_ibfk_2` (`commercial_cleunik`),
  KEY `_avocli_consignes_ibfk_3` (`art_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Consignes liées aux avoirs clients';

-- --------------------------------------------------------

--
-- Structure de la table `_avocli_entetes`
--

CREATE TABLE IF NOT EXISTS `_avocli_entetes` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `code` varchar(25) default NULL COMMENT 'N° du document',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `blocnotebrut_entete` longtext COMMENT 'Bloc Note entête',
  `reference_acteur` longtext COMMENT 'Référence(s) de la commande chez le client',
  `devise` bigint(20) default NULL COMMENT 'Devise de l''action commerciale',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `escompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''escompte',
  `escompte_type` tinyint(4) default '1' COMMENT '1-> Taux, 2 Montant',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `reg_cleunik` bigint(20) default '-1' COMMENT 'Mode de règlement',
  `blocnotebrut_pied` longtext COMMENT 'Bloc Note pied',
  `rendezvous` longtext COMMENT 'Rendez-vous',
  `modliv` bigint(20) default '-94' COMMENT 'Modalités de livraison',
  `typpor` bigint(20) default '-93' COMMENT 'Type de port',
  `dateheureexpedition` datetime default NULL COMMENT 'Date et heure d''expédition',
  `dateheurelivraison` datetime default NULL COMMENT 'Date et heure de livraison',
  `frais_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `frais_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant des frais',
  `port_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `port_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant du port',
  `acompte_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `acompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''acompte',
  `type_avoir` tinyint(4) default '2' COMMENT '1-> Avoir financier,2-> Avoir marchandise',
  `date_avoi` date default NULL COMMENT 'Date d''avoir',
  `compta_etat` bigint(20) default '1' COMMENT 'Etat comptable (cumulable) 1->A comptabiliser,2->Comptabilisation simulée,4->A ne pas comptabiliser(proforma),8->Totalement réglé,16->Partiellement réglé,32->à transférer',
  `modliv_bis` bigint(20) default '-94' COMMENT 'Modalités de livraison sur date livraison',
  `assujetti_tpf` tinyint(4) default '1' COMMENT 'Assujetti aux taxes parafiscales 1->Oui (défault),2->Non',
  UNIQUE KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `avocli_entetes_1` (`action_cleunik`),
  KEY `avocli_entetes_2` (`act_cleunik`),
  KEY `avocli_entetes_3` (`devise`),
  KEY `avocli_entetes_4` (`catcompta_cleunik`),
  KEY `avocli_entetes_5` (`reg_cleunik`),
  KEY `avocli_entete_6` (`modliv`),
  KEY `avocli_entete_7` (`typpor`),
  KEY `avocli_entete_8` (`tarif_cleunik`),
  KEY `avocli_entete_9` (`modliv_bis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des entêtes de avoirs clients';

-- --------------------------------------------------------

--
-- Structure de la table `_avocli_lignes`
--

CREATE TABLE IF NOT EXISTS `_avocli_lignes` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique article',
  `code_interne` varchar(20) default NULL COMMENT 'Code interne',
  `indice_interne` varchar(10) default NULL COMMENT 'Indice interne',
  `mnemotechnique_interne` varchar(20) default NULL COMMENT 'Identification mnémotechnique interne',
  `description_interne` varchar(100) default NULL COMMENT 'Description courte interne',
  `code_acteur` varchar(20) default NULL COMMENT 'Code chez l''acteur',
  `mnemotechnique_acteur` varchar(20) default NULL COMMENT 'Identification mnémotechnique chez lacteur',
  `description_acteur` varchar(100) default NULL COMMENT 'Description courte chez l''acteur',
  `typeligne` varchar(1) default NULL COMMENT 'Type de ligne',
  `pu` decimal(19,4) default NULL COMMENT 'Prix unitaire ou forfait',
  `pu_portee` decimal(19,4) default NULL COMMENT 'Portée du prix unitaire',
  `pu_type` decimal(19,4) default NULL COMMENT 'Type du prix unitaire 1->Prix unitaire,2->Forfait',
  `nbdec_pu` smallint(5) default NULL COMMENT 'Nombre de décimales pour le prix unitaire',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `poidsbrut` decimal(19,4) default NULL COMMENT 'Poids brut',
  `tare` decimal(19,4) default NULL COMMENT 'Tare',
  `poidsnet` decimal(19,4) default NULL COMMENT 'Poids net',
  `devise_taux` double(15,5) default NULL COMMENT 'Taux de la devise (1 pour doc en euros)',
  `pr` decimal(19,4) default NULL COMMENT 'Prix de revient',
  `blocnotebrut` longtext COMMENT 'Bloc note brut',
  `blocnoteriche` longtext COMMENT 'Bloc note riche',
  `devise` bigint(20) default NULL COMMENT 'Devise',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `pc_cleunik` bigint(20) default '-1' COMMENT 'Clé unique plan comptable (vente)',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `coef_facture` tinyint(4) default '1' COMMENT '1-> Facturable,0->Non facturable',
  `taxes_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxes',
  `longueur` decimal(15,4) default '0.0000' COMMENT 'Longueur',
  `largeur` decimal(15,4) default '0.0000' COMMENT 'Largeur',
  `epaisseur` decimal(15,4) default '0.0000' COMMENT 'Epaisseur',
  `unite_longueur` bigint(20) default '-90',
  `tpf_cleunik` bigint(20) default '-1' COMMENT 'Taxe parafiscale',
  `tpf_cleunik_01` bigint(20) default '-1' COMMENT '2° taxe parafiscale',
  UNIQUE KEY `artcleunik` (`commercial_ligne_cleunik`),
  UNIQUE KEY `code_ligne` (`commercial_cleunik`,`ligne_cleunik`),
  KEY `mnemo` (`art_cleunik`),
  KEY `FK_avocli_ligne_3` (`pc_cleunik`),
  KEY `FK_avocli_ligne_4` (`catcompta_cleunik`),
  KEY `FK_avocli_ligne_5` (`devise`),
  KEY `FK_avocli_ligne_6` (`tarif_cleunik`),
  KEY `FK_avocli_ligne_7` (`taxes_cleunik`),
  KEY `_FK_avocli_ligne_8` (`unite_longueur`),
  KEY `_FK_avocli_ligne_9` (`tpf_cleunik`),
  KEY `_fk_avocli_ligne_10` (`tpf_cleunik_01`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes de avoirs clients';

-- --------------------------------------------------------

--
-- Structure de la table `_avocli_lignes_qte`
--

CREATE TABLE IF NOT EXISTS `_avocli_lignes_qte` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité livrée',
  `qte_unite` bigint(20) default NULL COMMENT 'Unité de la quantité',
  `qte_nbdec` smallint(5) default NULL COMMENT 'Nombre de décimales pour la quantité',
  `dateheure_demande` datetime default NULL COMMENT 'Délai Date/Heure demandé',
  `dateheure_confirm` datetime default NULL COMMENT 'Délai Date/Heure confirmé',
  `statut` bigint(20) default NULL COMMENT 'Statut de la ligne',
  `unite_condi` bigint(20) default '-112' COMMENT 'Unité de conditionnement',
  `qte_condi` decimal(19,4) default NULL COMMENT 'Quantité de conditionnements',
  `nb_stock_in_condi` decimal(15,5) default NULL COMMENT 'Nombre d''unités de stock dans une unité de conditionnement',
  `cdecli_ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité de _cdecli_lignes_qte',
  `livcli_ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité de _livcli_lignes_qte',
  `mvt_cleunik` bigint(20) default NULL COMMENT 'Clé unique mouvement de stock',
  `choix_depot` bigint(20) default '-15' COMMENT 'Eventuel dépot',
  `choix_empla` bigint(20) default '-16' COMMENT 'Eventuel emplacement',
  `qte_deja` decimal(19,4) default NULL COMMENT 'Quantité déjà livrée ou réceptionnée',
  UNIQUE KEY `code_ligne` (`commercial_ligne_cleunik`,`ligne_cleunik`),
  UNIQUE KEY `uk9` (`ligne_qte_cleunik`),
  KEY `FK_avocli_ligne_qte_2` (`qte_unite`),
  KEY `FK_avocli_ligne_qte_3` (`statut`),
  KEY `FK_avocli_ligne_qte_4` (`unite_condi`),
  KEY `FK_avocli_ligne_qte_5` (`choix_depot`),
  KEY `FK_avocli_ligne_qte_6` (`choix_empla`),
  KEY `ligne_cleunik` (`commercial_ligne_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quantités des lignes d''avoirs clients';

-- --------------------------------------------------------

--
-- Structure de la table `_avocli_representants`
--

CREATE TABLE IF NOT EXISTS `_avocli_representants` (
  `action_rep_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_rep_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant de référence (avocli éventuellement)',
  `act_cleunik_rep` bigint(20) default NULL COMMENT 'Représentant',
  `commission_typ` tinyint(4) default NULL COMMENT 'Type de commission (1->Taux,2-Fixe,3->Mixte)',
  `commission_taux` decimal(15,4) default NULL COMMENT 'Taux de commission',
  `commission_fixe` decimal(15,4) default NULL COMMENT 'Montant fixe de commission',
  `commission_regle` bigint(20) default '1' COMMENT 'Règle de calcul des commission',
  KEY `_avocli_representants_ibfk_1` (`act_cleunik_rep`),
  KEY `_avocli_representants_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Représentants liés aux avoirs clients';

-- --------------------------------------------------------

--
-- Structure de la table `_avocli_transporteurs`
--

CREATE TABLE IF NOT EXISTS `_avocli_transporteurs` (
  `action_trans_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_trans_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur de référence (avocli éventuellement)',
  `act_cleunik_trans` bigint(20) default NULL COMMENT 'Transporteur',
  `poids_net` decimal(15,4) default NULL COMMENT 'Poids net',
  `poids_bru` decimal(15,4) default NULL COMMENT 'Poids brut',
  `volum_net` decimal(15,4) default NULL COMMENT 'Volume net',
  `volum_bru` decimal(15,4) default NULL COMMENT 'Volume brut',
  `surfa_net` decimal(15,4) default NULL COMMENT 'Surface nette',
  `surfa_bru` decimal(15,4) default NULL COMMENT 'Surface brute',
  `nombre_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis mémorisés',
  UNIQUE KEY `_avocli_transporteur_ibfk_0` (`action_trans_cleunik`),
  KEY `_avocli_transporteur_ibfk_1` (`act_cleunik_trans`),
  KEY `_avocli_transporteur_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transporteurs liés aux avoirs clients';

-- --------------------------------------------------------

--
-- Structure de la table `_avofou_adresses`
--

CREATE TABLE IF NOT EXISTS `_avofou_adresses` (
  `adr_cleunik` bigint(20) default NULL COMMENT 'Clé unique adresse',
  `adr_cod` varchar(15) default NULL COMMENT 'Code adresse',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `adr_nom` varchar(50) default NULL COMMENT 'Nom de la société',
  `adr_complementnom` varchar(50) default NULL COMMENT 'Eventuel complément de nom',
  `adr_ligne1` varchar(50) default NULL COMMENT 'Ligne 1 adresse',
  `adr_ligne2` varchar(50) default NULL COMMENT 'Ligne 2 adresse',
  `adr_ligne3` varchar(50) default NULL COMMENT 'Ligne 3 adresse',
  `adr_cp` varchar(10) default NULL COMMENT 'Code postal',
  `adr_ville` varchar(50) default NULL COMMENT 'Ville',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Pays (Clé unique table choix)',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `adr_latitude` double(9,6) default NULL COMMENT 'Latitude',
  `adr_longitude` double(9,6) default NULL COMMENT 'Longitude',
  `adr_typecoordonnees` bigint(20) default NULL COMMENT 'Type d''adresse',
  `adr_type` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Type d''adresse : 1 france, 2 étranger',
  UNIQUE KEY `adr_cleunik` (`adr_cleunik`),
  KEY `adr_cod` (`adr_cod`),
  KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `adr_typecoordonnees` (`adr_typecoordonnees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses des avoirs fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_avofou_consignes`
--

CREATE TABLE IF NOT EXISTS `_avofou_consignes` (
  `action_consi_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/consigne',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''acteur consignant l''article',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''article consigné',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité',
  `qte_nbdec` tinyint(4) default '0' COMMENT 'Nombre de décimales',
  `qte_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis sur la consigne',
  UNIQUE KEY `_avofou_consignes_ibfk_0` (`action_consi_cleunik`),
  KEY `_avofou_consignes_ibfk_1` (`act_cleunik`),
  KEY `_avofou_consignes_ibfk_2` (`commercial_cleunik`),
  KEY `_avofou_consignes_ibfk_3` (`art_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Consignes liées aux avoirs fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_avofou_entetes`
--

CREATE TABLE IF NOT EXISTS `_avofou_entetes` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `code` varchar(25) default NULL COMMENT 'N° du document',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `blocnotebrut_entete` longtext COMMENT 'Bloc Note entête',
  `reference_acteur` longtext COMMENT 'Référence(s) de la commande chez le fournisseur',
  `devise` bigint(20) default NULL COMMENT 'Devise de l''action commerciale',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `escompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''escompte',
  `escompte_type` tinyint(4) default '1' COMMENT '1-> Taux, 2 Montant',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `reg_cleunik` bigint(20) default '-1' COMMENT 'Mode de règlement',
  `blocnotebrut_pied` longtext COMMENT 'Bloc Note pied',
  `rendezvous` longtext COMMENT 'Rendez-vous',
  `modliv` bigint(20) default '-94' COMMENT 'Modalités de livraison',
  `typpor` bigint(20) default '-93' COMMENT 'Type de port',
  `dateheureexpedition` datetime default NULL COMMENT 'Date et heure d''expédition',
  `dateheurelivraison` datetime default NULL COMMENT 'Date et heure de livraison',
  `frais_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `frais_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant des frais',
  `port_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `port_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant du port',
  `acompte_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `acompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''acompte',
  `type_avoir` tinyint(4) default '2' COMMENT '1-> Avoir financier,2-> Avoir marchandise',
  `date_avoi` date default NULL COMMENT 'Date d''avoir',
  `compta_etat` bigint(20) default '1' COMMENT 'Etat comptable (cumulable) 1->A comptabiliser,2->Comptabilisation simulée,4->A ne pas comptabiliser(proforma),8->Totalement réglé,16->Partiellement réglé,32->à transférer',
  `modliv_bis` bigint(20) default '-94' COMMENT 'Modalités de livraison sur date livraison',
  `assujetti_tpf` tinyint(4) default '1' COMMENT 'Assujetti aux taxes parafiscales 1->Oui (défault),2->Non',
  UNIQUE KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `avofou_entetes_1` (`action_cleunik`),
  KEY `avofou_entetes_2` (`act_cleunik`),
  KEY `avofou_entetes_3` (`devise`),
  KEY `avofou_entetes_4` (`catcompta_cleunik`),
  KEY `avofou_entetes_5` (`reg_cleunik`),
  KEY `avofou_entete_6` (`modliv`),
  KEY `avofou_entete_7` (`typpor`),
  KEY `avofou_entete_8` (`tarif_cleunik`),
  KEY `avofou_entete_9` (`modliv_bis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des entêtes de avoirs fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_avofou_lignes`
--

CREATE TABLE IF NOT EXISTS `_avofou_lignes` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique article',
  `code_interne` varchar(20) default NULL COMMENT 'Code interne',
  `indice_interne` varchar(10) default NULL COMMENT 'Indice interne',
  `mnemotechnique_interne` varchar(20) default NULL COMMENT 'Identification mnémotechnique interne',
  `description_interne` varchar(100) default NULL COMMENT 'Description courte interne',
  `code_acteur` varchar(20) default NULL COMMENT 'Code chez l''acteur',
  `mnemotechnique_acteur` varchar(20) default NULL COMMENT 'Identification mnémotechnique chez lacteur',
  `description_acteur` varchar(100) default NULL COMMENT 'Description courte chez l''acteur',
  `typeligne` varchar(1) default NULL COMMENT 'Type de ligne',
  `pu` decimal(19,4) default NULL COMMENT 'Prix unitaire ou forfait',
  `pu_portee` decimal(19,4) default NULL COMMENT 'Portée du prix unitaire',
  `pu_type` decimal(19,4) default NULL COMMENT 'Type du prix unitaire 1->Prix unitaire,2->Forfait',
  `nbdec_pu` smallint(5) default NULL COMMENT 'Nombre de décimales pour le prix unitaire',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `poidsbrut` decimal(19,4) default NULL COMMENT 'Poids brut',
  `tare` decimal(19,4) default NULL COMMENT 'Tare',
  `poidsnet` decimal(19,4) default NULL COMMENT 'Poids net',
  `devise_taux` double(15,5) default NULL COMMENT 'Taux de la devise (1 pour doc en euros)',
  `pr` decimal(19,4) default NULL COMMENT 'Prix de revient',
  `blocnotebrut` longtext COMMENT 'Bloc note brut',
  `blocnoteriche` longtext COMMENT 'Bloc note riche',
  `devise` bigint(20) default NULL COMMENT 'Devise',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `pc_cleunik` bigint(20) default '-1' COMMENT 'Clé unique plan comptable (vente)',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `coef_facture` tinyint(4) default '1' COMMENT '1-> Facturable,0->Non facturable',
  `taxes_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxes',
  `longueur` decimal(15,4) default '0.0000' COMMENT 'Longueur',
  `largeur` decimal(15,4) default '0.0000' COMMENT 'Largeur',
  `epaisseur` decimal(15,4) default '0.0000' COMMENT 'Epaisseur',
  `unite_longueur` bigint(20) default '-90',
  `tpf_cleunik` bigint(20) default '-1' COMMENT 'Taxe parafiscale',
  `tpf_cleunik_01` bigint(20) default '-1' COMMENT '2° taxe parafiscale',
  UNIQUE KEY `artcleunik` (`commercial_ligne_cleunik`),
  UNIQUE KEY `code_ligne` (`commercial_cleunik`,`ligne_cleunik`),
  KEY `mnemo` (`art_cleunik`),
  KEY `FK_avofou_ligne_3` (`pc_cleunik`),
  KEY `FK_avofou_ligne_4` (`catcompta_cleunik`),
  KEY `FK_avofou_ligne_5` (`devise`),
  KEY `FK_avofou_ligne_6` (`tarif_cleunik`),
  KEY `FK_avofou_ligne_7` (`taxes_cleunik`),
  KEY `_FK_avofou_ligne_8` (`unite_longueur`),
  KEY `_FK_avofou_ligne_9` (`tpf_cleunik`),
  KEY `_fk_avofou_ligne_10` (`tpf_cleunik_01`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes de avoirs fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_avofou_lignes_qte`
--

CREATE TABLE IF NOT EXISTS `_avofou_lignes_qte` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité livrée',
  `qte_unite` bigint(20) default NULL COMMENT 'Unité de la quantité',
  `qte_nbdec` smallint(5) default NULL COMMENT 'Nombre de décimales pour la quantité',
  `dateheure_demande` datetime default NULL COMMENT 'Délai Date/Heure demandé',
  `dateheure_confirm` datetime default NULL COMMENT 'Délai Date/Heure confirmé',
  `statut` bigint(20) default NULL COMMENT 'Statut de la ligne',
  `unite_condi` bigint(20) default '-112' COMMENT 'Unité de conditionnement',
  `qte_condi` decimal(19,4) default NULL COMMENT 'Quantité de conditionnements',
  `nb_stock_in_condi` decimal(15,5) default NULL COMMENT 'Nombre d''unités de stock dans une unité de conditionnement',
  `cdefou_ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité de _cdefou_lignes_qte',
  `recfou_ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité de _recfou_lignes_qte',
  `mvt_cleunik` bigint(20) default NULL COMMENT 'Clé unique mouvement de stock',
  `choix_depot` bigint(20) default '-15' COMMENT 'Eventuel dépot',
  `choix_empla` bigint(20) default '-16' COMMENT 'Eventuel emplacement',
  `qte_deja` decimal(19,4) default NULL COMMENT 'Quantité déjà livrée ou réceptionnée',
  UNIQUE KEY `code_ligne` (`commercial_ligne_cleunik`,`ligne_cleunik`),
  UNIQUE KEY `uk9` (`ligne_qte_cleunik`),
  KEY `FK_avofou_ligne_qte_2` (`qte_unite`),
  KEY `FK_avofou_ligne_qte_3` (`statut`),
  KEY `FK_avofou_ligne_qte_4` (`unite_condi`),
  KEY `FK_avofou_ligne_qte_5` (`choix_depot`),
  KEY `FK_avofou_ligne_qte_6` (`choix_empla`),
  KEY `ligne_cleunik` (`commercial_ligne_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quantités des lignes d''avoirs fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_avofou_representants`
--

CREATE TABLE IF NOT EXISTS `_avofou_representants` (
  `action_rep_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_rep_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant de référence (avofou éventuellement)',
  `act_cleunik_rep` bigint(20) default NULL COMMENT 'Représentant',
  `commission_typ` tinyint(4) default NULL COMMENT 'Type de commission (1->Taux,2-Fixe,3->Mixte)',
  `commission_taux` decimal(15,4) default NULL COMMENT 'Taux de commission',
  `commission_fixe` decimal(15,4) default NULL COMMENT 'Montant fixe de commission',
  `commission_regle` bigint(20) default '1' COMMENT 'Règle de calcul des commission',
  KEY `_avofou_representants_ibfk_1` (`act_cleunik_rep`),
  KEY `_avofou_representants_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Représentants liés aux avoirs fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_avofou_transporteurs`
--

CREATE TABLE IF NOT EXISTS `_avofou_transporteurs` (
  `action_trans_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_trans_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur de référence (avofou éventuellement)',
  `act_cleunik_trans` bigint(20) default NULL COMMENT 'Transporteur',
  `poids_net` decimal(15,4) default NULL COMMENT 'Poids net',
  `poids_bru` decimal(15,4) default NULL COMMENT 'Poids brut',
  `volum_net` decimal(15,4) default NULL COMMENT 'Volume net',
  `volum_bru` decimal(15,4) default NULL COMMENT 'Volume brut',
  `surfa_net` decimal(15,4) default NULL COMMENT 'Surface nette',
  `surfa_bru` decimal(15,4) default NULL COMMENT 'Surface brute',
  `nombre_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis mémorisés',
  UNIQUE KEY `_avofou_transporteur_ibfk_0` (`action_trans_cleunik`),
  KEY `_avofou_transporteur_ibfk_1` (`act_cleunik_trans`),
  KEY `_avofou_transporteur_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transporteurs liés aux avoirs fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_bordereau_transporteurs`
--

CREATE TABLE IF NOT EXISTS `_bordereau_transporteurs` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `bordereau_cleunik` bigint(20) default NULL COMMENT 'Clé unique bordereau expedition',
  `act_cleunik_trans` bigint(20) default NULL COMMENT 'Transporteur',
  `code` varchar(12) default NULL COMMENT 'N° du document',
  `poids_net` decimal(15,4) default NULL COMMENT 'Poids net',
  `poids_bru` decimal(15,4) default NULL COMMENT 'Poids brut',
  `volum_net` decimal(15,4) default NULL COMMENT 'Volume net',
  `volum_bru` decimal(15,4) default NULL COMMENT 'Volume brut',
  `surfa_net` decimal(15,4) default NULL COMMENT 'Surface nette',
  `surfa_bru` decimal(15,4) default NULL COMMENT 'Surface brute',
  `nombre_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis mémorisés',
  UNIQUE KEY `action_cleunik` (`action_cleunik`),
  UNIQUE KEY `bordereau_cleunik` (`bordereau_cleunik`),
  KEY `_bordereau_transporteur_ibfk_0` (`act_cleunik_trans`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bordereaux d''expédition clients';

-- --------------------------------------------------------

--
-- Structure de la table `_bordereau_transporteurs_lignes`
--

CREATE TABLE IF NOT EXISTS `_bordereau_transporteurs_lignes` (
  `bordereau_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne bordereau expedition',
  `bordereau_cleunik` bigint(20) default NULL COMMENT 'Clé unique bordereau expedition',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  UNIQUE KEY `artcleunik` (`bordereau_ligne_cleunik`),
  UNIQUE KEY `code_ligne` (`commercial_cleunik`,`ligne_cleunik`),
  KEY `FK_bordereau_ligne_2` (`bordereau_cleunik`),
  KEY `FK_bordereau_ligne_3` (`action_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes de bordereaux d''expédition clients';

-- --------------------------------------------------------

--
-- Structure de la table `_cdecli_adresses`
--

CREATE TABLE IF NOT EXISTS `_cdecli_adresses` (
  `adr_cleunik` bigint(20) default NULL COMMENT 'Clé unique adresse',
  `adr_cod` varchar(15) default NULL COMMENT 'Code adresse',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `adr_nom` varchar(50) default NULL COMMENT 'Nom de la société',
  `adr_complementnom` varchar(50) default NULL COMMENT 'Eventuel complément de nom',
  `adr_ligne1` varchar(50) default NULL COMMENT 'Ligne 1 adresse',
  `adr_ligne2` varchar(50) default NULL COMMENT 'Ligne 2 adresse',
  `adr_ligne3` varchar(50) default NULL COMMENT 'Ligne 3 adresse',
  `adr_cp` varchar(10) default NULL COMMENT 'Code postal',
  `adr_ville` varchar(50) default NULL COMMENT 'Ville',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Pays (Clé unique table choix)',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `adr_latitude` double(9,6) default NULL COMMENT 'Latitude',
  `adr_longitude` double(9,6) default NULL COMMENT 'Longitude',
  `adr_typecoordonnees` bigint(20) default NULL COMMENT 'Type d''adresse',
  `adr_type` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Type d''adresse : 1 france, 2 étranger',
  UNIQUE KEY `adr_cleunik` (`adr_cleunik`),
  KEY `adr_cod` (`adr_cod`),
  KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `adr_typecoordonnees` (`adr_typecoordonnees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses des commandes clients';

-- --------------------------------------------------------

--
-- Structure de la table `_cdecli_consignes`
--

CREATE TABLE IF NOT EXISTS `_cdecli_consignes` (
  `action_consi_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/consigne',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''acteur consignant l''article',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''article consigné',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité',
  `qte_nbdec` tinyint(4) default '0' COMMENT 'Nombre de décimales',
  `qte_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis sur la consigne',
  UNIQUE KEY `_cdecli_consignes_ibfk_0` (`action_consi_cleunik`),
  KEY `_cdecli_consignes_ibfk_1` (`act_cleunik`),
  KEY `_cdecli_consignes_ibfk_2` (`commercial_cleunik`),
  KEY `_cdecli_consignes_ibfk_3` (`art_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Consignes liées aux commandes clients';

-- --------------------------------------------------------

--
-- Structure de la table `_cdecli_entetes`
--

CREATE TABLE IF NOT EXISTS `_cdecli_entetes` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `code` varchar(25) default NULL COMMENT 'N° du document',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `blocnotebrut_entete` longtext COMMENT 'Bloc Note entête',
  `reference_acteur` longtext COMMENT 'Référence(s) de la commande chez le client',
  `devise` bigint(20) default NULL COMMENT 'Devise de l''action commerciale',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `escompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''escompte',
  `escompte_type` tinyint(4) default '1' COMMENT '1-> Taux, 2 Montant',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `reg_cleunik` bigint(20) default '-1' COMMENT 'Mode de règlement',
  `blocnotebrut_pied` longtext COMMENT 'Bloc Note pied',
  `rendezvous` longtext COMMENT 'Rendez-vous',
  `modliv` bigint(20) default '-94' COMMENT 'Modalités de livraison',
  `typpor` bigint(20) default '-93' COMMENT 'Type de port',
  `dateheureexpedition` datetime default NULL COMMENT 'Date et heure d''expédition',
  `dateheurelivraison` datetime default NULL COMMENT 'Date et heure de livraison',
  `frais_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `frais_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant des frais',
  `port_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `port_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant du port',
  `acompte_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `acompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''acompte',
  `modliv_bis` bigint(20) default '-94' COMMENT 'Modalités de livraison sur date livraison',
  `assujetti_tpf` tinyint(4) default '1' COMMENT 'Assujetti aux taxes parafiscales 1->Oui (défault),2->Non',
  `compta_etat` bigint(20) default '1' COMMENT 'Etat comptable (cumulable) 1->A comptabiliser,2->Comptabilisation simulée,4->A ne pas comptabiliser(proforma),8->Totalement réglé,16->Partiellement réglé,32->à transférer',
  UNIQUE KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `cdecli_entetes_1` (`action_cleunik`),
  KEY `cdecli_entetes_2` (`act_cleunik`),
  KEY `cdecli_entetes_3` (`devise`),
  KEY `cdecli_entetes_4` (`catcompta_cleunik`),
  KEY `cdecli_entetes_5` (`reg_cleunik`),
  KEY `_cdecli_entete_6` (`modliv`),
  KEY `_cdecli_entete_7` (`typpor`),
  KEY `_cdecli_entete_8` (`tarif_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des entêtes de commandes clients';

-- --------------------------------------------------------

--
-- Structure de la table `_cdecli_lignes`
--

CREATE TABLE IF NOT EXISTS `_cdecli_lignes` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique article',
  `code_interne` varchar(20) default NULL COMMENT 'Code interne',
  `indice_interne` varchar(10) default NULL COMMENT 'Indice interne',
  `mnemotechnique_interne` varchar(20) default NULL COMMENT 'Identification mnémotechnique interne',
  `description_interne` varchar(100) default NULL COMMENT 'Description courte interne',
  `code_acteur` varchar(20) default NULL COMMENT 'Code chez l''acteur',
  `mnemotechnique_acteur` varchar(20) default NULL COMMENT 'Identification mnémotechnique chez lacteur',
  `description_acteur` varchar(100) default NULL COMMENT 'Description courte chez l''acteur',
  `typeligne` varchar(1) default NULL COMMENT 'Type de ligne',
  `pu` decimal(19,4) default NULL COMMENT 'Prix unitaire ou forfait',
  `pu_portee` decimal(19,4) default NULL COMMENT 'Portée du prix unitaire',
  `pu_type` decimal(19,4) default NULL COMMENT 'Type du prix unitaire 1->Prix unitaire,2->Forfait',
  `nbdec_pu` smallint(5) default NULL COMMENT 'Nombre de décimales pour le prix unitaire',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `poidsbrut` decimal(19,4) default NULL COMMENT 'Poids brut',
  `tare` decimal(19,4) default NULL COMMENT 'Tare',
  `poidsnet` decimal(19,4) default NULL COMMENT 'Poids net',
  `devise_taux` double(15,5) default NULL COMMENT 'Taux de la devise (1 pour doc en euros)',
  `pr` decimal(19,4) default NULL COMMENT 'Prix de revient',
  `blocnotebrut` longtext COMMENT 'Bloc note brut',
  `blocnoteriche` longtext COMMENT 'Bloc note riche',
  `devise` bigint(20) default NULL COMMENT 'Devise',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `pc_cleunik` bigint(20) default '-1' COMMENT 'Clé unique plan comptable (vente)',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `coef_facture` tinyint(4) default '1' COMMENT '1-> Facturable,0->Non facturable',
  `taxes_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxes',
  `longueur` decimal(15,4) default '0.0000' COMMENT 'Longueur',
  `largeur` decimal(15,4) default '0.0000' COMMENT 'Largeur',
  `epaisseur` decimal(15,4) default '0.0000' COMMENT 'Epaisseur',
  `unite_longueur` bigint(20) default '-90',
  `tpf_cleunik` bigint(20) default '-1' COMMENT 'Taxe parafiscale',
  `tpf_cleunik_01` bigint(20) default '-1' COMMENT '2° taxe parafiscale',
  UNIQUE KEY `artcleunik` (`commercial_ligne_cleunik`),
  UNIQUE KEY `code_ligne` (`commercial_cleunik`,`ligne_cleunik`),
  KEY `mnemo` (`art_cleunik`),
  KEY `FK_cdecli_ligne_3` (`pc_cleunik`),
  KEY `FK_cdecli_ligne_4` (`catcompta_cleunik`),
  KEY `FK_cdecli_ligne_5` (`devise`),
  KEY `FK_cdecli_ligne_6` (`tarif_cleunik`),
  KEY `FK_cdecli_ligne_7` (`taxes_cleunik`),
  KEY `_FK_cdecli_ligne_8` (`unite_longueur`),
  KEY `_FK_cdecli_ligne_9` (`tpf_cleunik`),
  KEY `_fk_cdecli_ligne_10` (`tpf_cleunik_01`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes de commandes clients';

-- --------------------------------------------------------

--
-- Structure de la table `_cdecli_lignes_qte`
--

CREATE TABLE IF NOT EXISTS `_cdecli_lignes_qte` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité commandée',
  `qte_unite` bigint(20) default NULL COMMENT 'Unité de la quantité',
  `qte_nbdec` smallint(5) default NULL COMMENT 'Nombre de décimales pour la quantité',
  `dateheure_demande` datetime default NULL COMMENT 'Délai Date/Heure demandé',
  `dateheure_confirm` datetime default NULL COMMENT 'Délai Date/Heure confirmé',
  `statut` bigint(20) default NULL COMMENT 'Statut de la ligne',
  `unite_condi` bigint(20) default '-112' COMMENT 'Unité de conditionnement',
  `qte_condi` decimal(19,4) default NULL COMMENT 'Quantité de conditionnements',
  `nb_stock_in_condi` decimal(15,5) default NULL COMMENT 'Nombre d''unités de stock dans une unité de conditionnement',
  `choix_depot` bigint(20) default '-15' COMMENT 'Eventuel dépot',
  `choix_empla` bigint(20) default '-16' COMMENT 'Eventuel emplacement',
  `qte_deja` decimal(19,4) default NULL COMMENT 'Quantité déjà livrée ou réceptionnée',
  UNIQUE KEY `code_ligne` (`commercial_ligne_cleunik`,`ligne_cleunik`),
  UNIQUE KEY `uk9` (`ligne_qte_cleunik`),
  KEY `FK_cdecli_ligne_qte_2` (`qte_unite`),
  KEY `FK_cdecli_ligne_qte_3` (`statut`),
  KEY `FK_cdecli_ligne_qte_4` (`unite_condi`),
  KEY `FK_cdecli_ligne_qte_5` (`choix_depot`),
  KEY `FK_cdecli_ligne_qte_6` (`choix_empla`),
  KEY `ligne_cleunik` (`commercial_ligne_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quantités des lignes de commandes clients';

-- --------------------------------------------------------

--
-- Structure de la table `_cdecli_representants`
--

CREATE TABLE IF NOT EXISTS `_cdecli_representants` (
  `action_rep_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_rep_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant de référence (offcli éventuellement)',
  `act_cleunik_rep` bigint(20) default NULL COMMENT 'Représentant',
  `commission_typ` tinyint(4) default NULL COMMENT 'Type de commission (1->Taux,2-Fixe,3->Mixte)',
  `commission_taux` decimal(15,4) default NULL COMMENT 'Taux de commission',
  `commission_fixe` decimal(15,4) default NULL COMMENT 'Montant fixe de commission',
  `commission_regle` bigint(20) default '1' COMMENT 'Règle de calcul des commission',
  KEY `_cdecli_representants_ibfk_1` (`act_cleunik_rep`),
  KEY `_cdecli_representants_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Représentants liés aux commandes clients';

-- --------------------------------------------------------

--
-- Structure de la table `_cdecli_transporteurs`
--

CREATE TABLE IF NOT EXISTS `_cdecli_transporteurs` (
  `action_trans_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_trans_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur de référence (offcli éventuellement)',
  `act_cleunik_trans` bigint(20) default NULL COMMENT 'Transporteur',
  `poids_net` decimal(15,4) default NULL COMMENT 'Poids net',
  `poids_bru` decimal(15,4) default NULL COMMENT 'Poids brut',
  `volum_net` decimal(15,4) default NULL COMMENT 'Volume net',
  `volum_bru` decimal(15,4) default NULL COMMENT 'Volume brut',
  `surfa_net` decimal(15,4) default NULL COMMENT 'Surface nette',
  `surfa_bru` decimal(15,4) default NULL COMMENT 'Surface brute',
  `nombre_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis mémorisés',
  UNIQUE KEY `_cdecli_transporteur_ibfk_0` (`action_trans_cleunik`),
  KEY `_cdecli_transporteur_ibfk_1` (`act_cleunik_trans`),
  KEY `_cdecli_transporteur_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transporteurs liés aux commandes clients';

-- --------------------------------------------------------

--
-- Structure de la table `_cdefou_adresses`
--

CREATE TABLE IF NOT EXISTS `_cdefou_adresses` (
  `adr_cleunik` bigint(20) default NULL COMMENT 'Clé unique adresse',
  `adr_cod` varchar(15) default NULL COMMENT 'Code adresse',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `adr_nom` varchar(50) default NULL COMMENT 'Nom de la société',
  `adr_complementnom` varchar(50) default NULL COMMENT 'Eventuel complément de nom',
  `adr_ligne1` varchar(50) default NULL COMMENT 'Ligne 1 adresse',
  `adr_ligne2` varchar(50) default NULL COMMENT 'Ligne 2 adresse',
  `adr_ligne3` varchar(50) default NULL COMMENT 'Ligne 3 adresse',
  `adr_cp` varchar(10) default NULL COMMENT 'Code postal',
  `adr_ville` varchar(50) default NULL COMMENT 'Ville',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Pays (Clé unique table choix)',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `adr_latitude` double(9,6) default NULL COMMENT 'Latitude',
  `adr_longitude` double(9,6) default NULL COMMENT 'Longitude',
  `adr_typecoordonnees` bigint(20) default NULL COMMENT 'Type d''adresse',
  `adr_type` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Type d''adresse : 1 france, 2 étranger',
  UNIQUE KEY `adr_cleunik` (`adr_cleunik`),
  KEY `adr_cod` (`adr_cod`),
  KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `adr_typecoordonnees` (`adr_typecoordonnees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses des commandes fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_cdefou_entetes`
--

CREATE TABLE IF NOT EXISTS `_cdefou_entetes` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `code` varchar(25) default NULL COMMENT 'N° du document',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `blocnotebrut_entete` longtext COMMENT 'Bloc Note entête',
  `reference_acteur` longtext COMMENT 'Référence(s) de la commande chez le client',
  `devise` bigint(20) default NULL COMMENT 'Devise de l''action commerciale',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `escompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''escompte',
  `escompte_type` tinyint(4) default '1' COMMENT '1-> Taux, 2 Montant',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `reg_cleunik` bigint(20) default '-1' COMMENT 'Mode de règlement',
  `blocnotebrut_pied` longtext COMMENT 'Bloc Note pied',
  `rendezvous` longtext COMMENT 'Rendez-vous',
  `modliv` bigint(20) default '-94' COMMENT 'Modalités de réception',
  `typpor` bigint(20) default '-93' COMMENT 'Type de port',
  `dateheureexpedition` datetime default NULL COMMENT 'Date et heure d''expédition',
  `dateheurelivraison` datetime default NULL COMMENT 'Date et heure de réception',
  `frais_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `frais_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant des frais',
  `port_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `port_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant du port',
  `acompte_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `acompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''acompte',
  `modliv_bis` bigint(20) default '-94' COMMENT 'Modalités de livraison sur date livraison',
  `assujetti_tpf` tinyint(4) default '1' COMMENT 'Assujetti aux taxes parafiscales 1->Oui (défault),2->Non',
  UNIQUE KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `cdefou_entetes_1` (`action_cleunik`),
  KEY `cdefou_entetes_2` (`act_cleunik`),
  KEY `cdefou_entetes_3` (`devise`),
  KEY `cdefou_entetes_4` (`catcompta_cleunik`),
  KEY `cdefou_entetes_5` (`reg_cleunik`),
  KEY `cdefou_entete_6` (`modliv`),
  KEY `cdefou_entete_7` (`typpor`),
  KEY `cdefou_entete_8` (`tarif_cleunik`),
  KEY `cdefou_entete_9` (`modliv_bis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des entêtes de commandes fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_cdefou_lignes`
--

CREATE TABLE IF NOT EXISTS `_cdefou_lignes` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique article',
  `code_interne` varchar(20) default NULL COMMENT 'Code interne',
  `indice_interne` varchar(10) default NULL COMMENT 'Indice interne',
  `mnemotechnique_interne` varchar(20) default NULL COMMENT 'Identification mnémotechnique interne',
  `description_interne` varchar(100) default NULL COMMENT 'Description courte interne',
  `code_acteur` varchar(20) default NULL COMMENT 'Code chez l''acteur',
  `mnemotechnique_acteur` varchar(20) default NULL COMMENT 'Identification mnémotechnique chez lacteur',
  `description_acteur` varchar(100) default NULL COMMENT 'Description courte chez l''acteur',
  `typeligne` varchar(1) default NULL COMMENT 'Type de ligne',
  `pu` decimal(19,4) default NULL COMMENT 'Prix unitaire ou forfait',
  `pu_portee` decimal(19,4) default NULL COMMENT 'Portée du prix unitaire',
  `pu_type` decimal(19,4) default NULL COMMENT 'Type du prix unitaire 1->Prix unitaire,2->Forfait',
  `nbdec_pu` smallint(5) default NULL COMMENT 'Nombre de décimales pour le prix unitaire',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `poidsbrut` decimal(19,4) default NULL COMMENT 'Poids brut',
  `tare` decimal(19,4) default NULL COMMENT 'Tare',
  `poidsnet` decimal(19,4) default NULL COMMENT 'Poids net',
  `devise_taux` double(15,5) default NULL COMMENT 'Taux de la devise (1 pour doc en euros)',
  `pr` decimal(19,4) default NULL COMMENT 'Prix de revient',
  `blocnotebrut` longtext COMMENT 'Bloc note brut',
  `blocnoteriche` longtext COMMENT 'Bloc note riche',
  `devise` bigint(20) default NULL COMMENT 'Devise',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `pc_cleunik` bigint(20) default '-1' COMMENT 'Clé unique plan comptable (vente)',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `coef_facture` tinyint(4) default '1' COMMENT '1-> Facturable,0->Non facturable',
  `taxes_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxes',
  `longueur` decimal(15,4) default '0.0000' COMMENT 'Longueur',
  `largeur` decimal(15,4) default '0.0000' COMMENT 'Largeur',
  `epaisseur` decimal(15,4) default '0.0000' COMMENT 'Epaisseur',
  `unite_longueur` bigint(20) default '-90',
  `tpf_cleunik` bigint(20) default '-1' COMMENT 'Taxe parafiscale',
  `tpf_cleunik_01` bigint(20) default '-1' COMMENT '2° taxe parafiscale',
  UNIQUE KEY `artcleunik` (`commercial_ligne_cleunik`),
  UNIQUE KEY `code_ligne` (`commercial_cleunik`,`ligne_cleunik`),
  KEY `mnemo` (`art_cleunik`),
  KEY `FK_cdefou_ligne_3` (`pc_cleunik`),
  KEY `FK_cdefou_ligne_4` (`catcompta_cleunik`),
  KEY `FK_cdefou_ligne_5` (`devise`),
  KEY `FK_cdefou_ligne_6` (`tarif_cleunik`),
  KEY `FK_cdefou_ligne_7` (`taxes_cleunik`),
  KEY `_FK_cdefou_ligne_8` (`unite_longueur`),
  KEY `_FK_cdefou_ligne_9` (`tpf_cleunik`),
  KEY `_fk_cdefou_ligne_10` (`tpf_cleunik_01`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes de commandes fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_cdefou_lignes_qte`
--

CREATE TABLE IF NOT EXISTS `_cdefou_lignes_qte` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité commandée',
  `qte_unite` bigint(20) default NULL COMMENT 'Unité de la quantité',
  `qte_nbdec` smallint(5) default NULL COMMENT 'Nombre de décimales pour la quantité',
  `dateheure_demande` datetime default NULL COMMENT 'Délai Date/Heure demandé',
  `dateheure_confirm` datetime default NULL COMMENT 'Délai Date/Heure confirmé',
  `statut` bigint(20) default NULL COMMENT 'Statut de la ligne',
  `unite_condi` bigint(20) default '-112' COMMENT 'Unité de conditionnement',
  `qte_condi` decimal(19,4) default NULL COMMENT 'Quantité de conditionnements',
  `nb_stock_in_condi` decimal(15,5) default NULL COMMENT 'Nombre d''unités de stock dans une unité de conditionnement',
  `choix_depot` bigint(20) default '-15' COMMENT 'Eventuel dépot',
  `choix_empla` bigint(20) default '-16' COMMENT 'Eventuel emplacement',
  `qte_deja` decimal(19,4) default NULL COMMENT 'Quantité déjà livrée ou réceptionnée',
  UNIQUE KEY `code_ligne` (`commercial_ligne_cleunik`,`ligne_cleunik`),
  UNIQUE KEY `uk9` (`ligne_qte_cleunik`),
  KEY `FK_cdefou_ligne_qte_2` (`qte_unite`),
  KEY `FK_cdefou_ligne_qte_3` (`statut`),
  KEY `FK_cdefou_ligne_qte_4` (`unite_condi`),
  KEY `FK_cdefou_ligne_qte_5` (`choix_depot`),
  KEY `FK_cdefou_ligne_qte_6` (`choix_empla`),
  KEY `ligne_cleunik` (`commercial_ligne_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quantités des lignes de commandes fournisseur';

-- --------------------------------------------------------

--
-- Structure de la table `_cedex`
--

CREATE TABLE IF NOT EXISTS `_cedex` (
  `codepostal` varchar(5) default NULL COMMENT 'CODEPOSTAL',
  `ville` varchar(40) default NULL COMMENT 'VILLE',
  KEY `codepostal` (`codepostal`),
  KEY `ville` (`ville`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cedex Français';

-- --------------------------------------------------------

--
-- Structure de la table `_choix`
--

CREATE TABLE IF NOT EXISTS `_choix` (
  `critere_cleunik` bigint(20) default NULL COMMENT 'Clé unique de critère',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Clé unique table choix ',
  `choix_code` varchar(50) default NULL COMMENT 'Code choix',
  `choix_valeur_texte_01` varchar(255) default NULL COMMENT 'Valeur texte 01',
  `choix_valeur_texte_02` longtext COMMENT 'Valeur texte 02',
  `choix_actif` tinyint(4) default NULL COMMENT 'Choix actif',
  `choix_image_associee` bigint(20) default NULL COMMENT 'Clé unique de limage associée',
  `choix_image_affichable` tinyint(4) default NULL COMMENT 'Image affichable',
  `choix_portee` bigint(20) default NULL,
  UNIQUE KEY `choix_cleunik` (`choix_cleunik`),
  KEY `critere_cleunik` (`critere_cleunik`),
  KEY `choix_code` (`choix_code`),
  KEY `choix_image_associee` (`choix_image_associee`),
  KEY `critere_cleunikchoix_code` (`critere_cleunik`,`choix_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Choix des critères';

-- --------------------------------------------------------

--
-- Structure de la table `_choix_couleur`
--

CREATE TABLE IF NOT EXISTS `_choix_couleur` (
  `choix_cleunik` bigint(20) default NULL COMMENT 'Clé unique table choix ',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé unique table choix ',
  `choix_couleur` varchar(50) default NULL COMMENT 'Code couleur',
  UNIQUE KEY `u_choix_couleur` (`choix_cleunik`,`uti_cleunik`),
  KEY `cont02_choix_couleur_uti` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='couleur des choix';

-- --------------------------------------------------------

--
-- Structure de la table `_courriel_en`
--

CREATE TABLE IF NOT EXISTS `_courriel_en` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé unique du message, de l''action',
  `courriel_en_mes_cleunik` bigint(20) default NULL COMMENT 'Clé unique du message',
  `sujet` longtext COMMENT 'Sujet',
  `header` longtext COMMENT 'Header du courriel',
  `destinataires` longtext COMMENT 'Liste des destinataires',
  `type` tinyint(4) default '1' COMMENT 'Type de courriel 1-> texte,2->html',
  `datas_vrac` longtext COMMENT 'Datas en vrac dans une structure xml',
  `mel_id` varchar(100) default NULL COMMENT 'Id du courriel',
  UNIQUE KEY `action_cleunik` (`action_cleunik`),
  KEY `mel_id` (`mel_id`),
  KEY `courriel_en_mes_cleunik` (`courriel_en_mes_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Courriels envoyés';

-- --------------------------------------------------------

--
-- Structure de la table `_courriel_en_mes`
--

CREATE TABLE IF NOT EXISTS `_courriel_en_mes` (
  `courriel_en_mes_cleunik` bigint(20) default NULL COMMENT 'Clé unique du message',
  `hash` varchar(40) default NULL COMMENT 'Hash',
  `message` longblob COMMENT 'Message du courriel envoyé',
  `message_texte` longblob COMMENT 'Message texte',
  UNIQUE KEY `courriel_en_mes_cleunik` (`courriel_en_mes_cleunik`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Messages des courriels envoyés';

-- --------------------------------------------------------

--
-- Structure de la table `_courriel_images`
--

CREATE TABLE IF NOT EXISTS `_courriel_images` (
  `hash` varchar(40) default NULL COMMENT 'Hash',
  `image` longblob COMMENT 'Pièce jointe du courriel',
  `mime` longtext COMMENT 'Mime de l''image',
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Images intégrées dans les courriels';

-- --------------------------------------------------------

--
-- Structure de la table `_courriel_re`
--

CREATE TABLE IF NOT EXISTS `_courriel_re` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé unique du message, de l''action',
  `courriel_re_mes_cleunik` bigint(20) default NULL COMMENT 'Clé unique du message',
  `sujet` longtext COMMENT 'Sujet',
  `header` longtext COMMENT 'Header du courriel',
  `type` tinyint(4) default '1' COMMENT 'Type de courriel 1-> texte,2->html',
  `datas_vrac` longtext COMMENT 'Datas en vrac dans une structure xml',
  `expediteurs` longtext COMMENT 'Liste des expéditeurs',
  `mel_id` varchar(255) default NULL COMMENT 'Id du courriel',
  `reponse` longtext COMMENT 'Adresse de réponse',
  `etat_ar` tinyint(4) default NULL COMMENT 'Etat de l''éventuelle demande d''accusé de réception',
  UNIQUE KEY `action_cleunik` (`action_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Courriels reçus';

-- --------------------------------------------------------

--
-- Structure de la table `_courriel_recus_brut`
--

CREATE TABLE IF NOT EXISTS `_courriel_recus_brut` (
  `courriel_brut_cleunik` bigint(20) default NULL COMMENT 'Clé unique du message',
  `courriel` longblob COMMENT 'Courriel',
  `hash` varchar(40) default NULL COMMENT 'Hash',
  `integre` tinyint(2) default '2' COMMENT 'Intégré dans les actions',
  `idpop` varchar(40) default NULL COMMENT 'Id  unique dans le pop',
  `sequence` bigint(20) default NULL COMMENT 'Séquence de réception',
  `uticptbal_cleunik` bigint(20) default NULL COMMENT 'Clé unique du compte courriel',
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''éventuelle action',
  `dateheurereception` datetime default NULL COMMENT 'Date et heure de réception du courriel',
  `dateheuremessage` datetime default NULL COMMENT 'Date et heure de du courriel',
  `marquage` tinyint(4) default NULL COMMENT 'Marquage du courriel',
  UNIQUE KEY `courriel_brut_cleunik` (`courriel_brut_cleunik`),
  KEY `sequence` (`sequence`),
  KEY `integre` (`integre`),
  KEY `dateheurereception` (`dateheurereception`),
  KEY `dateheuremessage` (`dateheuremessage`),
  KEY `idpop` (`idpop`),
  KEY `action_cleunik` (`action_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Courriels "bruts" reçus';

-- --------------------------------------------------------

--
-- Structure de la table `_courriel_re_listes`
--

CREATE TABLE IF NOT EXISTS `_courriel_re_listes` (
  `refweb` varchar(255) default NULL COMMENT 'Valeur (courriel, domaine,etc.)',
  `type` tinyint(4) default '1' COMMENT 'Type de valeur 1-> courriel,2->domaine',
  `genre` tinyint(4) default '1' COMMENT 'Genre de liste 1-> liste verte, 2->liste orange, 3-> liste rouge',
  UNIQUE KEY `refweb` (`refweb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Listes de filtres pour courriels reçus';

-- --------------------------------------------------------

--
-- Structure de la table `_courriel_re_mes`
--

CREATE TABLE IF NOT EXISTS `_courriel_re_mes` (
  `courriel_re_mes_cleunik` bigint(20) default NULL COMMENT 'Clé unique du message',
  `hash` varchar(40) default NULL COMMENT 'Hash du corpus texte et du corpus html',
  `message_html` longblob COMMENT 'Corpus html du courriel reçu',
  `message_text` longblob COMMENT 'Corpus texte du courriel reçu',
  UNIQUE KEY `courriel_re_mes_cleunik` (`courriel_re_mes_cleunik`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Corpus des courriels reçus';

-- --------------------------------------------------------

--
-- Structure de la table `_criteres`
--

CREATE TABLE IF NOT EXISTS `_criteres` (
  `critere_cleunik` bigint(20) default NULL COMMENT 'Clé unique de critère',
  `critere_code` varchar(15) default NULL COMMENT 'Code critère',
  `critere_denomination` varchar(100) default NULL COMMENT 'Dénomination',
  `critere_type` tinyint(4) default NULL COMMENT 'Type',
  `critere_impose` tinyint(4) default NULL COMMENT 'Critère imposé',
  `critere_choixmultiples` tinyint(4) default NULL COMMENT 'Choix multiples',
  `critere_imageassociee` bigint(20) default NULL COMMENT 'Clé unique de limage associée',
  `critere_imageaffichable` tinyint(4) default NULL COMMENT 'Image affichable',
  `critere_blocnotebrut` longtext COMMENT 'Bloc note Brut',
  `critere_blocnotertf` longtext COMMENT 'Bloc note Au format RTF',
  `critere_dateheurecreation` datetime default NULL COMMENT 'Date/Heure de création',
  `critere_dateheuremodification` datetime default NULL COMMENT 'Date/Heure de modification',
  `critere_actif` tinyint(4) default NULL COMMENT 'Critère actif en création',
  `critere_format` longtext COMMENT 'Format de saisie du critère',
  `critere_nombre` bigint(20) default NULL COMMENT 'Nombre dutilisation',
  `critere_great` tinyint(4) default NULL COMMENT 'Gestion GREAT',
  `critere_codechoixpertinent` tinyint(4) default NULL COMMENT 'Codes des choix pertinent ou pas (si oui, dupliqué dans copieCode)',
  `critere_portee` bigint(20) default NULL COMMENT 'Portée des critères',
  `critere_hl` tinyint(4) default '2' COMMENT 'Saisie hors liste autorisée',
  `critere_perso` tinyint(4) default '2' COMMENT 'Critère utilisable par un utilisateur',
  UNIQUE KEY `critere_cleunik` (`critere_cleunik`),
  UNIQUE KEY `critere_codecritere_great` (`critere_code`,`critere_great`),
  KEY `critere_code` (`critere_code`),
  KEY `critere_denomination` (`critere_denomination`),
  KEY `critere_type` (`critere_type`),
  KEY `critere_great` (`critere_great`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Critères';

-- --------------------------------------------------------

--
-- Structure de la table `_critere_pere_fils`
--

CREATE TABLE IF NOT EXISTS `_critere_pere_fils` (
  `cleunikchoixpere` bigint(20) default NULL COMMENT 'Clé unique du père',
  `cleunikcriterepere` bigint(20) default NULL COMMENT 'Clé unique de critère père',
  `cleunikchoixfils` bigint(20) default NULL COMMENT 'Clé unique du fils',
  `cleunikcriterefils` bigint(20) default NULL COMMENT 'Clé unique de critère fils',
  KEY `cleunikchoixpere` (`cleunikchoixpere`),
  KEY `cleunikcriterepere` (`cleunikcriterepere`),
  KEY `cleunikchoixfils` (`cleunikchoixfils`),
  KEY `cleunikcriterefils` (`cleunikcriterefils`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Critere_Pere_Fils';

-- --------------------------------------------------------

--
-- Structure de la table `_demfou_adresses`
--

CREATE TABLE IF NOT EXISTS `_demfou_adresses` (
  `adr_cleunik` bigint(20) default NULL COMMENT 'Clé unique adresse',
  `adr_cod` varchar(15) default NULL COMMENT 'Code adresse',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `adr_nom` varchar(50) default NULL COMMENT 'Nom de la société',
  `adr_complementnom` varchar(50) default NULL COMMENT 'Eventuel complément de nom',
  `adr_ligne1` varchar(50) default NULL COMMENT 'Ligne 1 adresse',
  `adr_ligne2` varchar(50) default NULL COMMENT 'Ligne 2 adresse',
  `adr_ligne3` varchar(50) default NULL COMMENT 'Ligne 3 adresse',
  `adr_cp` varchar(10) default NULL COMMENT 'Code postal',
  `adr_ville` varchar(50) default NULL COMMENT 'Ville',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Pays (Clé unique table choix)',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `adr_latitude` double(9,6) default NULL COMMENT 'Latitude',
  `adr_longitude` double(9,6) default NULL COMMENT 'Longitude',
  `adr_typecoordonnees` bigint(20) default NULL COMMENT 'Type d''adresse',
  `adr_type` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Type d''adresse : 1 france, 2 étranger',
  UNIQUE KEY `adr_cleunik` (`adr_cleunik`),
  KEY `adr_cod` (`adr_cod`),
  KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `adr_typecoordonnees` (`adr_typecoordonnees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses des demandes fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_demfou_entetes`
--

CREATE TABLE IF NOT EXISTS `_demfou_entetes` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `code` varchar(25) default NULL COMMENT 'N° du document',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `blocnotebrut_entete` longtext COMMENT 'Bloc Note entête',
  `reference_acteur` longtext COMMENT 'Référence(s) de la commande chez le client',
  `devise` bigint(20) default NULL COMMENT 'Devise de l''action commerciale',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `escompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''escompte',
  `escompte_type` tinyint(4) default '1' COMMENT '1-> Taux, 2 Montant',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `reg_cleunik` bigint(20) default '-1' COMMENT 'Mode de règlement',
  `blocnotebrut_pied` longtext COMMENT 'Bloc Note pied',
  `rendezvous` longtext COMMENT 'Rendez-vous',
  `modliv` bigint(20) default '-94' COMMENT 'Modalités de réception',
  `typpor` bigint(20) default '-93' COMMENT 'Type de port',
  `dateheureexpedition` datetime default NULL COMMENT 'Date et heure d''expédition',
  `dateheurelivraison` datetime default NULL COMMENT 'Date et heure de réception',
  `frais_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `frais_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant des frais',
  `port_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `port_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant du port',
  `acompte_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `acompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''acompte',
  `modliv_bis` bigint(20) default '-94' COMMENT 'Modalités de livraison sur date livraison',
  `assujetti_tpf` tinyint(4) default '1' COMMENT 'Assujetti aux taxes parafiscales 1->Oui (défault),2->Non',
  UNIQUE KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `demfou_entetes_1` (`action_cleunik`),
  KEY `demfou_entetes_2` (`act_cleunik`),
  KEY `demfou_entetes_3` (`devise`),
  KEY `demfou_entetes_4` (`catcompta_cleunik`),
  KEY `demfou_entetes_5` (`reg_cleunik`),
  KEY `demfou_entete_6` (`modliv`),
  KEY `demfou_entete_7` (`typpor`),
  KEY `demfou_entete_8` (`tarif_cleunik`),
  KEY `demfou_entete_9` (`modliv_bis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des entêtes de demandes fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_demfou_lignes`
--

CREATE TABLE IF NOT EXISTS `_demfou_lignes` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique article',
  `code_interne` varchar(20) default NULL COMMENT 'Code interne',
  `indice_interne` varchar(10) default NULL COMMENT 'Indice interne',
  `mnemotechnique_interne` varchar(20) default NULL COMMENT 'Identification mnémotechnique interne',
  `description_interne` varchar(100) default NULL COMMENT 'Description courte interne',
  `code_acteur` varchar(20) default NULL COMMENT 'Code chez l''acteur',
  `mnemotechnique_acteur` varchar(20) default NULL COMMENT 'Identification mnémotechnique chez lacteur',
  `description_acteur` varchar(100) default NULL COMMENT 'Description courte chez l''acteur',
  `typeligne` varchar(1) default NULL COMMENT 'Type de ligne',
  `pu` decimal(19,4) default NULL COMMENT 'Prix unitaire ou forfait',
  `pu_portee` decimal(19,4) default NULL COMMENT 'Portée du prix unitaire',
  `pu_type` decimal(19,4) default NULL COMMENT 'Type du prix unitaire 1->Prix unitaire,2->Forfait',
  `nbdec_pu` smallint(5) default NULL COMMENT 'Nombre de décimales pour le prix unitaire',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `poidsbrut` decimal(19,4) default NULL COMMENT 'Poids brut',
  `tare` decimal(19,4) default NULL COMMENT 'Tare',
  `poidsnet` decimal(19,4) default NULL COMMENT 'Poids net',
  `devise_taux` double(15,5) default NULL COMMENT 'Taux de la devise (1 pour doc en euros)',
  `pr` decimal(19,4) default NULL COMMENT 'Prix de revient',
  `blocnotebrut` longtext COMMENT 'Bloc note brut',
  `blocnoteriche` longtext COMMENT 'Bloc note riche',
  `devise` bigint(20) default NULL COMMENT 'Devise',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `pc_cleunik` bigint(20) default '-1' COMMENT 'Clé unique plan comptable (vente)',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `coef_facture` tinyint(4) default '1' COMMENT '1-> Facturable,0->Non facturable',
  `taxes_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxes',
  `longueur` decimal(15,4) default '0.0000' COMMENT 'Longueur',
  `largeur` decimal(15,4) default '0.0000' COMMENT 'Largeur',
  `epaisseur` decimal(15,4) default '0.0000' COMMENT 'Epaisseur',
  `unite_longueur` bigint(20) default '-90',
  `tpf_cleunik` bigint(20) default '-1' COMMENT 'Taxe parafiscale',
  `tpf_cleunik_01` bigint(20) default '-1' COMMENT '2° taxe parafiscale',
  UNIQUE KEY `artcleunik` (`commercial_ligne_cleunik`),
  UNIQUE KEY `code_ligne` (`commercial_cleunik`,`ligne_cleunik`),
  KEY `mnemo` (`art_cleunik`),
  KEY `FK_demfou_ligne_3` (`pc_cleunik`),
  KEY `FK_demfou_ligne_4` (`catcompta_cleunik`),
  KEY `FK_demfou_ligne_5` (`devise`),
  KEY `FK_demfou_ligne_6` (`tarif_cleunik`),
  KEY `FK_demfou_ligne_7` (`taxes_cleunik`),
  KEY `_FK_demfou_ligne_8` (`unite_longueur`),
  KEY `_FK_demfou_ligne_9` (`tpf_cleunik`),
  KEY `_fk_demfou_ligne_10` (`tpf_cleunik_01`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes de demandes fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_demfou_lignes_qte`
--

CREATE TABLE IF NOT EXISTS `_demfou_lignes_qte` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité commandée',
  `qte_unite` bigint(20) default NULL COMMENT 'Unité de la quantité',
  `qte_nbdec` smallint(5) default NULL COMMENT 'Nombre de décimales pour la quantité',
  `dateheure_demande` datetime default NULL COMMENT 'Délai Date/Heure demandé',
  `dateheure_confirm` datetime default NULL COMMENT 'Délai Date/Heure confirmé',
  `statut` bigint(20) default NULL COMMENT 'Statut de la ligne',
  `unite_condi` bigint(20) default '-112' COMMENT 'Unité de conditionnement',
  `qte_condi` decimal(19,4) default NULL COMMENT 'Quantité de conditionnements',
  `nb_stock_in_condi` decimal(15,5) default NULL COMMENT 'Nombre d''unités de stock dans une unité de conditionnement',
  `choix_depot` bigint(20) default '-15' COMMENT 'Eventuel dépot',
  `choix_empla` bigint(20) default '-16' COMMENT 'Eventuel emplacement',
  `qte_deja` decimal(19,4) default NULL COMMENT 'Quantité déjà livrée ou réceptionnée',
  UNIQUE KEY `code_ligne` (`commercial_ligne_cleunik`,`ligne_cleunik`),
  UNIQUE KEY `uk9` (`ligne_qte_cleunik`),
  KEY `FK_demfou_ligne_qte_2` (`qte_unite`),
  KEY `FK_demfou_ligne_qte_3` (`statut`),
  KEY `FK_demfou_ligne_qte_4` (`unite_condi`),
  KEY `FK_demfou_ligne_qte_5` (`choix_depot`),
  KEY `FK_demfou_ligne_qte_6` (`choix_empla`),
  KEY `ligne_cleunik` (`commercial_ligne_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quantités des lignes de demandes fournisseur';

-- --------------------------------------------------------

--
-- Structure de la table `_docciaux`
--

CREATE TABLE IF NOT EXISTS `_docciaux` (
  `doc_cleunik` bigint(20) default NULL COMMENT 'Clé unique document',
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé unique action',
  `code` varchar(25) default NULL COMMENT 'N° du document',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `blocnotebrut_entete` longtext COMMENT 'Bloc Note entête',
  KEY `_docciaux_1` (`action_cleunik`),
  KEY `doc_cleunik` USING BTREE (`doc_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des documents commerciaux';

-- --------------------------------------------------------

--
-- Structure de la table `_docciaux_montants`
--

CREATE TABLE IF NOT EXISTS `_docciaux_montants` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé Unik action',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé Unik commercial',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `taxes_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxes',
  `pc_cleunik` bigint(20) default '-1' COMMENT 'Clé unique compte comptable',
  `type` tinyint(4) default NULL COMMENT '1->HT marchandises',
  `montant` decimal(19,4) default NULL COMMENT 'Montant',
  `ordre` tinyint(4) default '1' COMMENT 'Ordre d''édition',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Genre de document commercial',
  UNIQUE KEY `U_K_01` (`action_cleunik`,`catcompta_cleunik`,`taxes_cleunik`,`pc_cleunik`,`type`),
  KEY `_docciaux_montants_ibfk_2` (`pc_cleunik`),
  KEY `_docciaux_montants_ibfk_3` (`catcompta_cleunik`),
  KEY `_docciaux_montants_ibfk_4` (`taxes_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes récap montant des documents commerciaux';

-- --------------------------------------------------------

--
-- Structure de la table `_documents`
--

CREATE TABLE IF NOT EXISTS `_documents` (
  `doc_cleunik` bigint(20) default NULL COMMENT 'Doc_cleunik',
  `emplacement` text COMMENT 'Emplacement',
  `titre` longtext COMMENT 'Titre du document',
  `hash` varchar(40) default NULL COMMENT 'Hash',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Clé unique table choix ',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `document` longblob,
  `typedoc` smallint(5) unsigned default NULL COMMENT 'Type (1->Document- 2->Note) ',
  `blocnote_riche` longtext COMMENT 'Bloc note riche',
  `blocnote_brut` longtext COMMENT 'Bloc Note brut',
  `hash_blocnote_riche` varchar(40) default NULL COMMENT 'Hash du bloc note riche',
  `tailledoc` bigint(20) default NULL COMMENT 'Taille du document',
  `descriptif_sommaire` longtext,
  `origine` longtext COMMENT 'Origine, source du document',
  `mime` longtext COMMENT 'Mime du fichier',
  `actif` tinyint(4) default '1' COMMENT 'Document actif 1-> Oui, 2-> Non',
  UNIQUE KEY `doc_cleunik` (`doc_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `typedoc` (`typedoc`),
  KEY `Index_9` (`titre`(9))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Documents';

-- --------------------------------------------------------

--
-- Structure de la table `_documents_choix_fixes`
--

CREATE TABLE IF NOT EXISTS `_documents_choix_fixes` (
  `doc_cleunik` bigint(20) default NULL COMMENT 'Doc_cleunik',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Clé unique table choix ',
  `critere_cleunik` bigint(20) default NULL COMMENT 'Clé unique de critère',
  `typedoc` tinyint(4) default NULL COMMENT 'Type de document',
  `uti_cleunik` bigint(20) default '0' COMMENT 'Clé unique de l''utilisateur (0) -> entreprise',
  UNIQUE KEY `UK_01` (`doc_cleunik`,`choix_cleunik`,`critere_cleunik`,`uti_cleunik`),
  KEY `doc_cleunik` (`doc_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `doc_cleunikchoix_cleunik` (`doc_cleunik`,`choix_cleunik`),
  KEY `critere_cleunik` (`critere_cleunik`),
  KEY `typedoc` USING BTREE (`typedoc`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Documents_choix_fixes';

-- --------------------------------------------------------

--
-- Structure de la table `_documents_commentaires`
--

CREATE TABLE IF NOT EXISTS `_documents_commentaires` (
  `doc_cleunik` bigint(20) default NULL COMMENT 'Clé Unique document',
  `commentaire_cleunik` bigint(20) default NULL COMMENT 'Clé Unique commentaire',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé Unik acteur',
  `int_cleunik` bigint(20) default NULL COMMENT 'Clé unique interlocuteur',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de derniere modification',
  `blocnote_brut` longtext COMMENT 'Commentaire',
  UNIQUE KEY `_doc_commentaires_u1` (`commentaire_cleunik`),
  KEY `_doc_commentaires_ibfk_1` (`doc_cleunik`),
  KEY `_doc_commentaires_ibfk_2` (`act_cleunik`),
  KEY `_doc_commentaires_ibfk_3` (`int_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Commentaires des documents';

-- --------------------------------------------------------

--
-- Structure de la table `_documents_connexions`
--

CREATE TABLE IF NOT EXISTS `_documents_connexions` (
  `doc_cleunik_gauche` bigint(20) default NULL COMMENT 'Clé Unique document',
  `doc_cleunik_droite` bigint(20) default NULL COMMENT 'Clé Unique document',
  UNIQUE KEY `uk_documents_connexions` (`doc_cleunik_gauche`,`doc_cleunik_droite`),
  KEY `_documents_connexions_ibfk_2` (`doc_cleunik_droite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connexions entre documents';

-- --------------------------------------------------------

--
-- Structure de la table `_documents_favoris`
--

CREATE TABLE IF NOT EXISTS `_documents_favoris` (
  `doc_cleunik` bigint(20) default NULL COMMENT 'Clé Unique document',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé unique utilisateur',
  `genre` bigint(20) default NULL COMMENT '1 Favori, 2 liste noire,3 liste blanche',
  UNIQUE KEY `Index_3` (`doc_cleunik`,`uti_cleunik`,`genre`),
  KEY `art_cleunik` (`doc_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Documents favoris par utilisateur';

-- --------------------------------------------------------

--
-- Structure de la table `_documents_rattachement`
--

CREATE TABLE IF NOT EXISTS `_documents_rattachement` (
  `doc_cleunik` bigint(20) default NULL COMMENT 'Doc_cleunik',
  `portee` bigint(20) default NULL COMMENT 'Portée',
  `rat_cleunik` bigint(20) default '0' COMMENT 'Clé unique rattachement (utilisateur, acteur, interlocuteur,article,action...) (optionnel suivant les documents)',
  UNIQUE KEY `docrate` (`doc_cleunik`,`portee`,`rat_cleunik`),
  KEY `doc_cleunik` (`doc_cleunik`),
  KEY `portee` (`portee`),
  KEY `rat_cleunik` (`rat_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rattachement des Documents';

-- --------------------------------------------------------

--
-- Structure de la table `_documents_rss`
--

CREATE TABLE IF NOT EXISTS `_documents_rss` (
  `doc_cleunik` bigint(20) default NULL COMMENT 'Doc_cleunik',
  `nom` varchar(40) default NULL COMMENT 'Nom',
  `emplacement_prive` text COMMENT 'Emplacement local (privé)',
  `emplacement_publi` text COMMENT 'Emplacement public',
  `nb_affiche` bigint(20) default '10' COMMENT 'Nombre d''affichages',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `typeacces` tinyint(3) unsigned default '1' COMMENT 'Type (1->Interne- 2->Externe, 3-> Les 2)',
  `niveauacces` tinyint(3) unsigned default '1' COMMENT 'Type d''accès information contenue dans flux(1->Restreint- 2->total)',
  `genre` tinyint(3) unsigned default '1' COMMENT 'Type (1->graal, 2->Exotique)',
  `ordre` bigint(20) default NULL COMMENT 'Dernier numéro d''ordre',
  `uti_cleunik` bigint(20) default NULL COMMENT 'uti_cleunik',
  UNIQUE KEY `doc_cleunik` (`doc_cleunik`),
  KEY `FK_documents_rss_1` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Complément Documents RSS';

-- --------------------------------------------------------

--
-- Structure de la table `_documents_rss_actions`
--

CREATE TABLE IF NOT EXISTS `_documents_rss_actions` (
  `doc_cleunik` bigint(20) default NULL COMMENT 'Doc_cleunik',
  `action_cleunik` bigint(20) default NULL COMMENT 'action_cleunik',
  `ordre` bigint(20) default '10' COMMENT 'Ordre d''affichages',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `etat` tinyint(3) unsigned default '1' COMMENT 'Type (1-> à afficher- 2-> à ne pas afficher)',
  `c_uuid` varchar(40) default NULL COMMENT 'Identifiant unique',
  UNIQUE KEY `U_documents_rss_actions_1` (`doc_cleunik`,`action_cleunik`),
  UNIQUE KEY `U_documents_rss_actions_2` (`c_uuid`),
  KEY `FK_documents_rss_actions_1` (`doc_cleunik`),
  KEY `FK_documents_rss_actions_2` (`action_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RSS graal actions';

-- --------------------------------------------------------

--
-- Structure de la table `_documents_texte`
--

CREATE TABLE IF NOT EXISTS `_documents_texte` (
  `doc_cleunik` bigint(20) default NULL COMMENT 'Doc_cleunik',
  `titre` longtext COMMENT 'Titre du document',
  `descriptif_sommaire` longtext COMMENT 'Descriptif sommaire',
  `doc_brut` longtext COMMENT 'Texte brut du document',
  UNIQUE KEY `doc_cleunik` (`doc_cleunik`),
  FULLTEXT KEY `doc_brut` (`doc_brut`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Texte brut des documents';

-- --------------------------------------------------------

--
-- Structure de la table `_doc_blanc`
--

CREATE TABLE IF NOT EXISTS `_doc_blanc` (
  `doc_cleunik` bigint(20) default NULL COMMENT 'Clé unique des documents',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé unique des utilisateurs',
  UNIQUE KEY `doc_cleunikuti_cleunik` USING BTREE (`doc_cleunik`,`uti_cleunik`),
  KEY `doc_cleunik` (`doc_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Liste blanche des documents par utilisateur';

-- --------------------------------------------------------

--
-- Structure de la table `_doc_noire`
--

CREATE TABLE IF NOT EXISTS `_doc_noire` (
  `doc_cleunik` bigint(20) default NULL COMMENT 'Clé unique des documents',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé unique des utilisateurs',
  UNIQUE KEY `doc_cleunikuti_cleunik` USING BTREE (`doc_cleunik`,`uti_cleunik`),
  KEY `doc_cleunik` (`doc_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Liste noire des documents par utilisateur';

-- --------------------------------------------------------

--
-- Structure de la table `_droits_cpt_bal`
--

CREATE TABLE IF NOT EXISTS `_droits_cpt_bal` (
  `uticptbal_cleunik` bigint(20) default NULL COMMENT 'Clé unique des comptes courriels',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé unique des utilisateurs',
  `droits_proprio` bigint(20) default '31' COMMENT 'Droits du propriétaire ',
  `droits_groupe` bigint(20) default '0' COMMENT 'Droits du groupe',
  `droits_lambda` bigint(20) default '0' COMMENT 'Droits du reste du monde',
  UNIQUE KEY `compo_01` USING BTREE (`uticptbal_cleunik`,`uti_cleunik`),
  KEY `uticptbal_cleunik` (`uticptbal_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Droits des comptes courriels';

-- --------------------------------------------------------

--
-- Structure de la table `_droits_doc`
--

CREATE TABLE IF NOT EXISTS `_droits_doc` (
  `doc_cleunik` bigint(20) default NULL COMMENT 'Clé unique des documents',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé unique des utilisateurs',
  `droits_proprio` bigint(20) default '7' COMMENT 'Droits du propriétaire ',
  `droits_groupe` bigint(20) default '1' COMMENT 'Droits du groupe',
  `droits_lambda` bigint(20) default '0' COMMENT 'Droits du reste du monde',
  UNIQUE KEY `doc_cleunikuti_cleunik` USING BTREE (`doc_cleunik`,`uti_cleunik`),
  KEY `doc_cleunik` (`doc_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Droits des documents';

-- --------------------------------------------------------

--
-- Structure de la table `_droits_panier`
--

CREATE TABLE IF NOT EXISTS `_droits_panier` (
  `panier_cleunik` bigint(20) default NULL COMMENT 'Clé unique des paniers',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé unique des utilisateurs',
  `droits_proprio` bigint(20) default '7' COMMENT 'Droits du propriétaire ',
  `droits_groupe` bigint(20) default '1' COMMENT 'Droits du groupe',
  `droits_lambda` bigint(20) default '0' COMMENT 'Droits du reste du monde',
  UNIQUE KEY `panier_cleunikuti_cleunik` USING BTREE (`panier_cleunik`,`uti_cleunik`),
  KEY `panier_cleunik` (`panier_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Droits des paniers';

-- --------------------------------------------------------

--
-- Structure de la table `_droits_uti_fen`
--

CREATE TABLE IF NOT EXISTS `_droits_uti_fen` (
  `duf_cleunik` bigint(20) NOT NULL default '0' COMMENT 'Clé unique droit',
  `fen_cleunik` bigint(20) NOT NULL default '0' COMMENT 'Clé unique Fenêtre',
  `uti_cleunik` bigint(20) NOT NULL default '0' COMMENT 'Clé unique utilisateur',
  `duf_acces` tinyint(4) NOT NULL default '0' COMMENT 'Accès autorisé ?',
  `duf_ajout` tinyint(4) NOT NULL default '0' COMMENT 'Ajout autorisé ?',
  `duf_modif` tinyint(4) NOT NULL default '0' COMMENT 'Modification autorisée ?',
  `duf_suppr` tinyint(4) NOT NULL default '0' COMMENT 'Suppression autorisée ?',
  `duf_impri` tinyint(4) NOT NULL default '0' COMMENT 'Impression autorisée ?',
  `commentaire` longtext,
  UNIQUE KEY `duf_cleunik` (`duf_cleunik`),
  KEY `_droits_uti_fen_ibfk_1` (`uti_cleunik`),
  KEY `_droits_uti_fen_ibfk_2` (`fen_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Droits d''utilisation des fenêtres';

-- --------------------------------------------------------

--
-- Structure de la table `_echeancier`
--

CREATE TABLE IF NOT EXISTS `_echeancier` (
  `echeance_cleunik` bigint(20) default NULL COMMENT 'Clé unique échéance',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale (disparaitra)',
  `pc_cleunik` bigint(20) default NULL COMMENT 'Clé unique compte comptable acteur',
  `noligne` smallint(5) default '1' COMMENT 'N° de ligne (multi-échéance)',
  `date_paiement` datetime default NULL COMMENT 'Dernière date paiement',
  `date_echeance` datetime default NULL COMMENT 'Date échéance',
  `libelle` varchar(50) default NULL COMMENT 'Libellé',
  `montant_du` decimal(19,4) default NULL COMMENT 'Montant dû',
  `montant_paye` decimal(19,4) default NULL COMMENT 'Montant payé',
  `devise_du` bigint(20) default '0' COMMENT 'Devise du montant dû',
  `devise_paye` bigint(20) default '0' COMMENT 'Devise du montant payé',
  `taux_de_change` decimal(19,5) default '1.00000' COMMENT 'Taux de change',
  `mode_paiement` bigint(20) default NULL COMMENT 'Mode de paiement',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de création',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `etat` tinyint(4) default '1' COMMENT '1->totalement dûe ,2->partiellement dûe , 3 totalement réglée',
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé unique action',
  UNIQUE KEY `echeance_0` (`echeance_cleunik`),
  KEY `echeance_1` (`action_cleunik`),
  KEY `echeance_2` (`devise_du`),
  KEY `echeance_3` (`devise_paye`),
  KEY `echeance_4` (`mode_paiement`),
  KEY `echeance_5` (`pc_cleunik`),
  KEY `echeance_6` (`date_echeance`),
  KEY `echeance_7` (`etat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des échéances clients et fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_elements`
--

CREATE TABLE IF NOT EXISTS `_elements` (
  `fen_cleunik` bigint(20) NOT NULL default '0' COMMENT 'Clé unique Fenêtre',
  `ele_cleunik` bigint(20) NOT NULL default '0' COMMENT 'Clé unique élément',
  `titre` longtext,
  `type_objet` tinyint(4) NOT NULL default '1' COMMENT 'Type d''élément',
  UNIQUE KEY `FK__elements_1` (`ele_cleunik`),
  KEY `FK__elements_2` (`fen_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eléments des objets de l''applicatif';

-- --------------------------------------------------------

--
-- Structure de la table `_elements_libelle`
--

CREATE TABLE IF NOT EXISTS `_elements_libelle` (
  `ele_cleunik` bigint(20) NOT NULL default '0' COMMENT 'Clé unique élément',
  `descriptif` longtext NOT NULL COMMENT 'Descriptif',
  `commentaire` longtext NOT NULL COMMENT 'Commentaire',
  `langue` bigint(20) NOT NULL default '120131',
  `uti_cleunik` bigint(20) NOT NULL default '0' COMMENT 'Clé unique utilisateur',
  UNIQUE KEY `Index_1` USING BTREE (`ele_cleunik`,`langue`,`uti_cleunik`),
  KEY `FK__elements_libelle_2` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Libellés des éléments des objets';

-- --------------------------------------------------------

--
-- Structure de la table `_emailing_cleweb`
--

CREATE TABLE IF NOT EXISTS `_emailing_cleweb` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé unique du emailing, de l''action',
  `intweb` bigint(20) default NULL COMMENT 'Clé unique de l''adresse courriel',
  KEY `action_cleunik` (`action_cleunik`),
  KEY `index_intweb` (`intweb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses courriel utilisées dans un emailing (cleunik)';

-- --------------------------------------------------------

--
-- Structure de la table `_emailing_cleweb_attente`
--

CREATE TABLE IF NOT EXISTS `_emailing_cleweb_attente` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé unique du emailing, de l''action',
  `intweb` bigint(20) default NULL COMMENT 'Clé unique de l''adresse courriel dans la file d''attente',
  UNIQUE KEY `emailing_liste_attente_cleunik` (`action_cleunik`,`intweb`),
  KEY `action_cleunik` (`action_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses courriel dans la file d''attente d''un emailing (cleu';

-- --------------------------------------------------------

--
-- Structure de la table `_emailing_ouvre`
--

CREATE TABLE IF NOT EXISTS `_emailing_ouvre` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé unique du emailing, de l''action',
  `intweb` bigint(20) default NULL COMMENT 'Clé unique de l''adresse courriel',
  `nbclic` bigint(20) default NULL COMMENT 'Nombre de clics',
  `c_uuid` varchar(36) NOT NULL default '',
  `dateheureclic` datetime default '2061-01-23 12:00:00' COMMENT 'Dernière date/heure de clic',
  `ipclic` longtext COMMENT 'Dernière ip de clic',
  KEY `action_cleunik` (`action_cleunik`),
  KEY `index_intweb` (`intweb`),
  KEY `index_c_uuid` (`c_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pour ouverture consécutive à un emailing';

-- --------------------------------------------------------

--
-- Structure de la table `_emailing_refweb`
--

CREATE TABLE IF NOT EXISTS `_emailing_refweb` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé unique du emailing, de l''action',
  `refweb` varchar(255) default NULL COMMENT 'Courriel',
  KEY `action_cleunik` (`action_cleunik`),
  KEY `refweb` (`refweb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses courriel utilisées dans un emailing (adresse courr';

-- --------------------------------------------------------

--
-- Structure de la table `_emailing_trackin`
--

CREATE TABLE IF NOT EXISTS `_emailing_trackin` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé unique du emailing, de l''action',
  `intweb` bigint(20) default NULL COMMENT 'Clé unique de l''adresse courriel',
  `nbclic` bigint(20) default NULL COMMENT 'Nombre de clics',
  `c_uuid` varchar(36) NOT NULL default '',
  `dateheureclic` datetime default '2061-01-23 12:00:00' COMMENT 'Dernière date/heure de clic',
  `ipclic` longtext COMMENT 'Dernière ip de clic',
  KEY `action_cleunik` (`action_cleunik`),
  KEY `index_intweb` (`intweb`),
  KEY `index_c_uuid` (`c_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pour tracking consécutif à un emailing';

-- --------------------------------------------------------

--
-- Structure de la table `_environnement`
--

CREATE TABLE IF NOT EXISTS `_environnement` (
  `env_cleunik` bigint(20) default NULL COMMENT 'Clé unik',
  `codealphanum15` varchar(15) default NULL COMMENT 'Code Envirronement',
  `env_indice` int(11) default NULL COMMENT 'Indice',
  `env_irronement` longtext COMMENT 'Environnement',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Uti_cleunik',
  UNIQUE KEY `env_cleunik` (`env_cleunik`),
  KEY `codealphanum15` (`codealphanum15`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Environnement';

-- --------------------------------------------------------

--
-- Structure de la table `_fab_entetes`
--

CREATE TABLE IF NOT EXISTS `_fab_entetes` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `fab_cleunik` bigint(20) default NULL COMMENT 'Clé unique fabrication',
  `code` varchar(12) default NULL COMMENT 'N° du document',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `blocnotebrut` longtext COMMENT 'Bloc Note',
  UNIQUE KEY `fab_cleunik` (`fab_cleunik`),
  KEY `fab_entetes_1` (`action_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des entêtes de fabrication';

-- --------------------------------------------------------

--
-- Structure de la table `_fab_lignes`
--

CREATE TABLE IF NOT EXISTS `_fab_lignes` (
  `fab_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne de fabrication',
  `fab_cleunik` bigint(20) default NULL COMMENT 'Clé unique fabrication',
  `noligne` bigint(20) default NULL COMMENT 'Clé unique fabrication',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique article',
  `qte_lancee` decimal(19,4) default NULL COMMENT 'Quantité lancée en fabrication',
  `qte_fabriq` decimal(19,4) default NULL COMMENT 'Quantité fabriquée',
  `pu` decimal(19,4) default NULL COMMENT 'Prix unitaire ou forfait',
  `statut` bigint(20) default '-23' COMMENT 'Statut de la ligne',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `blocnotebrut` longtext COMMENT 'Bloc Note',
  `qte_rebute` decimal(19,4) default '0.0000' COMMENT 'Quantité rebutée',
  UNIQUE KEY `fab_ligne_cleunik` (`fab_ligne_cleunik`),
  KEY `fab_lignes_1` (`fab_cleunik`),
  KEY `fab_lignes_2` (`art_cleunik`),
  KEY `fab_lignes_3` (`statut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des lignes de fabrication';

-- --------------------------------------------------------

--
-- Structure de la table `_fab_lignes_nomenc`
--

CREATE TABLE IF NOT EXISTS `_fab_lignes_nomenc` (
  `fab_ligne_nomenc_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne de nomenclature de fabrication',
  `fab_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé ligne de fabrication',
  `art_cleunik_pere` bigint(20) default NULL COMMENT 'Clé Unique article père',
  `art_cleunik_fils` bigint(20) default NULL COMMENT 'Clé Unique article fils',
  `noligne` tinyint(4) default NULL COMMENT 'Numéro de ligne',
  `quantite_lancee` decimal(15,4) default NULL COMMENT 'Quantité lancée',
  `quantite_fabriq` decimal(15,4) default NULL COMMENT 'Quantité fabriquée',
  `quantite_rebute` decimal(15,4) default NULL COMMENT 'Quantité rebutée',
  `statut` bigint(20) default '-23' COMMENT 'Statut de la ligne',
  `unite_quantite` bigint(20) default NULL COMMENT 'Unité de quantité',
  `nb_decimales_qte` tinyint(4) default NULL COMMENT 'Nombre de décimales',
  `blocnotebrut` longtext COMMENT 'Commentaire complémentaire',
  `pu` decimal(19,4) default NULL COMMENT 'Prix unitaire ou forfait',
  `hg` tinyint(4) default '2' COMMENT 'Hors-Gamme 1-> Oui 2 -> Non',
  `nbdec_pu` tinyint(4) default '3' COMMENT 'Nombre de décimales du prix unitaire',
  `valeur_complement` decimal(19,4) default '0.0000' COMMENT 'Valeur complémentaire',
  `valeur_complement_type` tinyint(4) default '1' COMMENT 'Type Valeur complémentaire 1-> Unitaire,2 Forfaitaire',
  `base_valorisation` bigint(20) default '-1' COMMENT 'Base de valorisation -1-> Dernier prix d''achat,-2-> Prix de revient, tarifs d''achats, tarifs de vente',
  `arrondi_fab` tinyint(4) default '1' COMMENT '1->pas d''arrondi,2->unité supérieure,3->unité inférieure',
  UNIQUE KEY `fab_ligne_nomenc_cleunik` (`fab_ligne_nomenc_cleunik`),
  KEY `fab_ligne_cleunik` (`fab_ligne_cleunik`),
  KEY `FK_fab_lignes_nomenc_2` (`art_cleunik_pere`),
  KEY `FK_fab_lignes_nomenc_3` (`art_cleunik_fils`),
  KEY `FK_fab_lignes_nomenc_4` (`statut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes des Nomenclatures de fabrication';

-- --------------------------------------------------------

--
-- Structure de la table `_fab_lignes_nomenc_detail`
--

CREATE TABLE IF NOT EXISTS `_fab_lignes_nomenc_detail` (
  `fab_ligne_nomenc_cleunik_detail` bigint(20) default NULL COMMENT 'Clé unique détail ligne de nomenclature de fabrication',
  `fab_ligne_nomenc_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne de nomenclature de fabrication',
  `quantite_fabriq_saisie` decimal(15,4) default NULL COMMENT 'Quantité fabriquée',
  `quantite_rebute_saisie` decimal(15,4) default NULL COMMENT 'Quantité rebutée',
  `unite_quantite` bigint(20) default NULL COMMENT 'Unité de quantité',
  `blocnotebrut` longtext COMMENT 'Commentaire complémentaire',
  `dateheuredetail` datetime default NULL COMMENT 'Date/Heure de modification',
  `int_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''interlocuteur',
  `nb_decimales_qte` tinyint(4) default NULL COMMENT 'Nombre de décimales',
  `pu` decimal(19,4) default NULL COMMENT 'Prix unitaire ou forfait',
  `hg` tinyint(4) default '2' COMMENT 'Hors-Gamme 1-> Oui 2 -> Non',
  `nbdec_pu` tinyint(4) default '3' COMMENT 'Nombre de décimales du prix unitaire',
  `valeur_complement` decimal(19,4) default '0.0000' COMMENT 'Valeur complémentaire',
  `valeur_complement_type` tinyint(4) default '1' COMMENT 'Type Valeur complémentaire 1-> Unitaire,2 Forfaitaire',
  `base_valorisation` bigint(20) default '-1' COMMENT 'Base de valorisation -1-> Dernier prix d''achat,-2-> Prix de revient, tarifs d''achats, tarifs de vente',
  `mvt_cleunik` bigint(20) default NULL COMMENT 'Clé Unique Mouvement de stock',
  UNIQUE KEY `fab_ligne_nomenc_cleunik_detail` (`fab_ligne_nomenc_cleunik_detail`),
  KEY `fab_ligne_nomenc_cleunik` (`fab_ligne_nomenc_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Détail des saisies sur les lignes des Nomenclatures de fabr';

-- --------------------------------------------------------

--
-- Structure de la table `_faccli_adresses`
--

CREATE TABLE IF NOT EXISTS `_faccli_adresses` (
  `adr_cleunik` bigint(20) default NULL COMMENT 'Clé unique adresse',
  `adr_cod` varchar(15) default NULL COMMENT 'Code adresse',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `adr_nom` varchar(50) default NULL COMMENT 'Nom de la société',
  `adr_complementnom` varchar(50) default NULL COMMENT 'Eventuel complément de nom',
  `adr_ligne1` varchar(50) default NULL COMMENT 'Ligne 1 adresse',
  `adr_ligne2` varchar(50) default NULL COMMENT 'Ligne 2 adresse',
  `adr_ligne3` varchar(50) default NULL COMMENT 'Ligne 3 adresse',
  `adr_cp` varchar(10) default NULL COMMENT 'Code postal',
  `adr_ville` varchar(50) default NULL COMMENT 'Ville',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Pays (Clé unique table choix)',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `adr_latitude` double(9,6) default NULL COMMENT 'Latitude',
  `adr_longitude` double(9,6) default NULL COMMENT 'Longitude',
  `adr_typecoordonnees` bigint(20) default NULL COMMENT 'Type d''adresse',
  `adr_type` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Type d''adresse : 1 france, 2 étranger',
  UNIQUE KEY `adr_cleunik` (`adr_cleunik`),
  KEY `adr_cod` (`adr_cod`),
  KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `adr_typecoordonnees` (`adr_typecoordonnees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses des factures clients';

-- --------------------------------------------------------

--
-- Structure de la table `_faccli_consignes`
--

CREATE TABLE IF NOT EXISTS `_faccli_consignes` (
  `action_consi_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/consigne',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''acteur consignant l''article',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''article consigné',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité',
  `qte_nbdec` tinyint(4) default '0' COMMENT 'Nombre de décimales',
  `qte_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis sur la consigne',
  UNIQUE KEY `_faccli_consignes_ibfk_0` (`action_consi_cleunik`),
  KEY `_faccli_consignes_ibfk_1` (`act_cleunik`),
  KEY `_faccli_consignes_ibfk_2` (`commercial_cleunik`),
  KEY `_faccli_consignes_ibfk_3` (`art_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Consignes liées aux factures clients';

-- --------------------------------------------------------

--
-- Structure de la table `_faccli_entetes`
--

CREATE TABLE IF NOT EXISTS `_faccli_entetes` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `code` varchar(25) default NULL COMMENT 'N° du document',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `blocnotebrut_entete` longtext COMMENT 'Bloc Note entête',
  `reference_acteur` longtext COMMENT 'Référence(s) de la commande chez le client',
  `devise` bigint(20) default NULL COMMENT 'Devise de l''action commerciale',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `escompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''escompte',
  `escompte_type` tinyint(4) default '1' COMMENT '1-> Taux, 2 Montant',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `reg_cleunik` bigint(20) default '-1' COMMENT 'Mode de règlement',
  `blocnotebrut_pied` longtext COMMENT 'Bloc Note pied',
  `rendezvous` longtext COMMENT 'Rendez-vous',
  `modliv` bigint(20) default '-94' COMMENT 'Modalités de livraison',
  `typpor` bigint(20) default '-93' COMMENT 'Type de port',
  `dateheureexpedition` datetime default NULL COMMENT 'Date et heure d''expédition',
  `dateheurelivraison` datetime default NULL COMMENT 'Date et heure de livraison',
  `frais_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `frais_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant des frais',
  `port_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `port_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant du port',
  `acompte_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `acompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''acompte',
  `date_fact` date default NULL COMMENT 'Date de facture',
  `fact_type` tinyint(4) default '1' COMMENT '1-> Avec mouvements de stocks,2->Sans mouvement de stock',
  `fact_genr` tinyint(4) default '1' COMMENT '1-> Facture,2->Proforma',
  `compta_etat` bigint(20) default '1' COMMENT 'Etat comptable (cumulable) 1->A comptabiliser,2->Comptabilisation simulée,4->A ne pas comptabiliser(proforma),8->Totalement réglé,16->Partiellement réglé,32->à transférer',
  `modliv_bis` bigint(20) default '-94' COMMENT 'Modalités de livraison sur date livraison',
  `assujetti_tpf` tinyint(4) default '1' COMMENT 'Assujetti aux taxes parafiscales 1->Oui (défault),2->Non',
  UNIQUE KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `faccli_entetes_1` (`action_cleunik`),
  KEY `faccli_entetes_2` (`act_cleunik`),
  KEY `faccli_entetes_3` (`devise`),
  KEY `faccli_entetes_4` (`catcompta_cleunik`),
  KEY `faccli_entetes_5` (`reg_cleunik`),
  KEY `faccli_entete_6` (`modliv`),
  KEY `faccli_entete_7` (`typpor`),
  KEY `faccli_entete_8` (`tarif_cleunik`),
  KEY `faccli_entete_9` (`modliv_bis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des entêtes de factures clients';

-- --------------------------------------------------------

--
-- Structure de la table `_faccli_lignes`
--

CREATE TABLE IF NOT EXISTS `_faccli_lignes` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique article',
  `code_interne` varchar(20) default NULL COMMENT 'Code interne',
  `indice_interne` varchar(10) default NULL COMMENT 'Indice interne',
  `mnemotechnique_interne` varchar(20) default NULL COMMENT 'Identification mnémotechnique interne',
  `description_interne` varchar(100) default NULL COMMENT 'Description courte interne',
  `code_acteur` varchar(20) default NULL COMMENT 'Code chez l''acteur',
  `mnemotechnique_acteur` varchar(20) default NULL COMMENT 'Identification mnémotechnique chez lacteur',
  `description_acteur` varchar(100) default NULL COMMENT 'Description courte chez l''acteur',
  `typeligne` varchar(1) default NULL COMMENT 'Type de ligne',
  `pu` decimal(19,4) default NULL COMMENT 'Prix unitaire ou forfait',
  `pu_portee` decimal(19,4) default NULL COMMENT 'Portée du prix unitaire',
  `pu_type` decimal(19,4) default NULL COMMENT 'Type du prix unitaire 1->Prix unitaire,2->Forfait',
  `nbdec_pu` smallint(5) default NULL COMMENT 'Nombre de décimales pour le prix unitaire',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `poidsbrut` decimal(19,4) default NULL COMMENT 'Poids brut',
  `tare` decimal(19,4) default NULL COMMENT 'Tare',
  `poidsnet` decimal(19,4) default NULL COMMENT 'Poids net',
  `devise_taux` double(15,5) default NULL COMMENT 'Taux de la devise (1 pour doc en euros)',
  `pr` decimal(19,4) default NULL COMMENT 'Prix de revient',
  `blocnotebrut` longtext COMMENT 'Bloc note brut',
  `blocnoteriche` longtext COMMENT 'Bloc note riche',
  `devise` bigint(20) default NULL COMMENT 'Devise',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `pc_cleunik` bigint(20) default '-1' COMMENT 'Clé unique plan comptable (vente)',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `coef_facture` tinyint(4) default '1' COMMENT '1-> Facturable,0->Non facturable',
  `taxes_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxes',
  `longueur` decimal(15,4) default '0.0000' COMMENT 'Longueur',
  `largeur` decimal(15,4) default '0.0000' COMMENT 'Largeur',
  `epaisseur` decimal(15,4) default '0.0000' COMMENT 'Epaisseur',
  `unite_longueur` bigint(20) default '-90',
  `tpf_cleunik` bigint(20) default '-1' COMMENT 'Taxe parafiscale',
  `tpf_cleunik_01` bigint(20) default '-1' COMMENT '2° taxe parafiscale',
  UNIQUE KEY `artcleunik` (`commercial_ligne_cleunik`),
  UNIQUE KEY `code_ligne` (`commercial_cleunik`,`ligne_cleunik`),
  KEY `mnemo` (`art_cleunik`),
  KEY `FK_faccli_ligne_3` (`pc_cleunik`),
  KEY `FK_faccli_ligne_4` (`catcompta_cleunik`),
  KEY `FK_faccli_ligne_5` (`devise`),
  KEY `FK_faccli_ligne_6` (`tarif_cleunik`),
  KEY `FK_faccli_ligne_7` (`taxes_cleunik`),
  KEY `_FK_faccli_ligne_8` (`unite_longueur`),
  KEY `_FK_faccli_ligne_9` (`tpf_cleunik`),
  KEY `_fk_faccli_ligne_10` (`tpf_cleunik_01`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes de factures clients';

-- --------------------------------------------------------

--
-- Structure de la table `_faccli_lignes_qte`
--

CREATE TABLE IF NOT EXISTS `_faccli_lignes_qte` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité livrée',
  `qte_unite` bigint(20) default NULL COMMENT 'Unité de la quantité',
  `qte_nbdec` smallint(5) default NULL COMMENT 'Nombre de décimales pour la quantité',
  `dateheure_demande` datetime default NULL COMMENT 'Délai Date/Heure demandé',
  `dateheure_confirm` datetime default NULL COMMENT 'Délai Date/Heure confirmé',
  `statut` bigint(20) default NULL COMMENT 'Statut de la ligne',
  `unite_condi` bigint(20) default '-112' COMMENT 'Unité de conditionnement',
  `qte_condi` decimal(19,4) default NULL COMMENT 'Quantité de conditionnements',
  `nb_stock_in_condi` decimal(15,5) default NULL COMMENT 'Nombre d''unités de stock dans une unité de conditionnement',
  `cdecli_ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité de _cdecli_lignes_qte',
  `livcli_ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité de _livcli_lignes_qte',
  `mvt_cleunik` bigint(20) default NULL COMMENT 'Clé unique mouvement de stock',
  `choix_depot` bigint(20) default '-15' COMMENT 'Eventuel dépot',
  `choix_empla` bigint(20) default '-16' COMMENT 'Eventuel emplacement',
  `qte_deja` decimal(19,4) default NULL COMMENT 'Quantité déjà livrée ou réceptionnée',
  UNIQUE KEY `code_ligne` (`commercial_ligne_cleunik`,`ligne_cleunik`),
  UNIQUE KEY `uk9` (`ligne_qte_cleunik`),
  KEY `FK_faccli_ligne_qte_2` (`qte_unite`),
  KEY `FK_faccli_ligne_qte_3` (`statut`),
  KEY `FK_faccli_ligne_qte_4` (`unite_condi`),
  KEY `FK_faccli_ligne_qte_5` (`choix_depot`),
  KEY `FK_faccli_ligne_qte_6` (`choix_empla`),
  KEY `ligne_cleunik` (`commercial_ligne_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quantités des lignes de factures clients';

-- --------------------------------------------------------

--
-- Structure de la table `_faccli_representants`
--

CREATE TABLE IF NOT EXISTS `_faccli_representants` (
  `action_rep_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_rep_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant de référence (faccli éventuellement)',
  `act_cleunik_rep` bigint(20) default NULL COMMENT 'Représentant',
  `commission_typ` tinyint(4) default NULL COMMENT 'Type de commission (1->Taux,2-Fixe,3->Mixte)',
  `commission_taux` decimal(15,4) default NULL COMMENT 'Taux de commission',
  `commission_fixe` decimal(15,4) default NULL COMMENT 'Montant fixe de commission',
  `commission_regle` bigint(20) default '1' COMMENT 'Règle de calcul des commission',
  KEY `_faccli_representants_ibfk_1` (`act_cleunik_rep`),
  KEY `_faccli_representants_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Représentants liés aux livraisons clients';

-- --------------------------------------------------------

--
-- Structure de la table `_faccli_transporteurs`
--

CREATE TABLE IF NOT EXISTS `_faccli_transporteurs` (
  `action_trans_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_trans_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur de référence (faccli éventuellement)',
  `act_cleunik_trans` bigint(20) default NULL COMMENT 'Transporteur',
  `poids_net` decimal(15,4) default NULL COMMENT 'Poids net',
  `poids_bru` decimal(15,4) default NULL COMMENT 'Poids brut',
  `volum_net` decimal(15,4) default NULL COMMENT 'Volume net',
  `volum_bru` decimal(15,4) default NULL COMMENT 'Volume brut',
  `surfa_net` decimal(15,4) default NULL COMMENT 'Surface nette',
  `surfa_bru` decimal(15,4) default NULL COMMENT 'Surface brute',
  `nombre_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis mémorisés',
  UNIQUE KEY `_faccli_transporteur_ibfk_0` (`action_trans_cleunik`),
  KEY `_faccli_transporteur_ibfk_1` (`act_cleunik_trans`),
  KEY `_faccli_transporteur_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transporteurs liés aux factures clients';

-- --------------------------------------------------------

--
-- Structure de la table `_facfou_adresses`
--

CREATE TABLE IF NOT EXISTS `_facfou_adresses` (
  `adr_cleunik` bigint(20) default NULL COMMENT 'Clé unique adresse',
  `adr_cod` varchar(15) default NULL COMMENT 'Code adresse',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `adr_nom` varchar(50) default NULL COMMENT 'Nom de la société',
  `adr_complementnom` varchar(50) default NULL COMMENT 'Eventuel complément de nom',
  `adr_ligne1` varchar(50) default NULL COMMENT 'Ligne 1 adresse',
  `adr_ligne2` varchar(50) default NULL COMMENT 'Ligne 2 adresse',
  `adr_ligne3` varchar(50) default NULL COMMENT 'Ligne 3 adresse',
  `adr_cp` varchar(10) default NULL COMMENT 'Code postal',
  `adr_ville` varchar(50) default NULL COMMENT 'Ville',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Pays (Clé unique table choix)',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `adr_latitude` double(9,6) default NULL COMMENT 'Latitude',
  `adr_longitude` double(9,6) default NULL COMMENT 'Longitude',
  `adr_typecoordonnees` bigint(20) default NULL COMMENT 'Type d''adresse',
  `adr_type` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Type d''adresse : 1 france, 2 étranger',
  UNIQUE KEY `adr_cleunik` (`adr_cleunik`),
  KEY `adr_cod` (`adr_cod`),
  KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `adr_typecoordonnees` (`adr_typecoordonnees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses des factures fournisseur';

-- --------------------------------------------------------

--
-- Structure de la table `_facfou_consignes`
--

CREATE TABLE IF NOT EXISTS `_facfou_consignes` (
  `action_consi_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/consigne',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''acteur consignant l''article',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''article consigné',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité',
  `qte_nbdec` tinyint(4) default '0' COMMENT 'Nombre de décimales',
  `qte_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis sur la consigne',
  UNIQUE KEY `_facfou_consignes_ibfk_0` (`action_consi_cleunik`),
  KEY `_facfou_consignes_ibfk_1` (`act_cleunik`),
  KEY `_facfou_consignes_ibfk_2` (`commercial_cleunik`),
  KEY `_facfou_consignes_ibfk_3` (`art_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Consignes liées aux factures fournisseur';

-- --------------------------------------------------------

--
-- Structure de la table `_facfou_entetes`
--

CREATE TABLE IF NOT EXISTS `_facfou_entetes` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `code` varchar(25) default NULL COMMENT 'N° du document',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `blocnotebrut_entete` longtext COMMENT 'Bloc Note entête',
  `reference_acteur` longtext COMMENT 'Référence(s) de la commande chez le client',
  `devise` bigint(20) default NULL COMMENT 'Devise de l''action commerciale',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `escompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''escompte',
  `escompte_type` tinyint(4) default '1' COMMENT '1-> Taux, 2 Montant',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `reg_cleunik` bigint(20) default '-1' COMMENT 'Mode de règlement',
  `blocnotebrut_pied` longtext COMMENT 'Bloc Note pied',
  `rendezvous` longtext COMMENT 'Rendez-vous',
  `modliv` bigint(20) default '-94' COMMENT 'Modalités de livraison',
  `typpor` bigint(20) default '-93' COMMENT 'Type de port',
  `dateheureexpedition` datetime default NULL COMMENT 'Date et heure d''expédition',
  `dateheurelivraison` datetime default NULL COMMENT 'Date et heure de livraison',
  `frais_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `frais_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant des frais',
  `port_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `port_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant du port',
  `acompte_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `acompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''acompte',
  `date_fact` date default NULL COMMENT 'Date de facture',
  `fact_type` tinyint(4) default '1' COMMENT '1-> Avec mouvements de stocks,2->Sans mouvement de stock',
  `fact_genr` tinyint(4) default '1' COMMENT '1-> Facture,2->Proforma',
  `compta_etat` bigint(20) default '1' COMMENT 'Etat comptable (cumulable) 1->A comptabiliser,2->Comptabilisation simulée,4->A ne pas comptabiliser(proforma),8->Totalement réglé,16->Partiellement réglé,32->à transférer',
  `modliv_bis` bigint(20) default '-94' COMMENT 'Modalités de livraison sur date livraison',
  `assujetti_tpf` tinyint(4) default '1' COMMENT 'Assujetti aux taxes parafiscales 1->Oui (défault),2->Non',
  UNIQUE KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `facfou_entetes_1` (`action_cleunik`),
  KEY `facfou_entetes_2` (`act_cleunik`),
  KEY `facfou_entetes_3` (`devise`),
  KEY `facfou_entetes_4` (`catcompta_cleunik`),
  KEY `facfou_entetes_5` (`reg_cleunik`),
  KEY `facfou_entete_6` (`modliv`),
  KEY `facfou_entete_7` (`typpor`),
  KEY `facfou_entete_8` (`tarif_cleunik`),
  KEY `facfou_entete_9` (`modliv_bis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des entêtes de factures fournisseur';

-- --------------------------------------------------------

--
-- Structure de la table `_facfou_lignes`
--

CREATE TABLE IF NOT EXISTS `_facfou_lignes` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique article',
  `code_interne` varchar(20) default NULL COMMENT 'Code interne',
  `indice_interne` varchar(10) default NULL COMMENT 'Indice interne',
  `mnemotechnique_interne` varchar(20) default NULL COMMENT 'Identification mnémotechnique interne',
  `description_interne` varchar(100) default NULL COMMENT 'Description courte interne',
  `code_acteur` varchar(20) default NULL COMMENT 'Code chez l''acteur',
  `mnemotechnique_acteur` varchar(20) default NULL COMMENT 'Identification mnémotechnique chez l''acteur',
  `description_acteur` varchar(100) default NULL COMMENT 'Description courte chez l''acteur',
  `typeligne` varchar(1) default NULL COMMENT 'Type de ligne',
  `pu` decimal(19,4) default NULL COMMENT 'Prix unitaire ou forfait',
  `pu_portee` decimal(19,4) default NULL COMMENT 'Portée du prix unitaire',
  `pu_type` decimal(19,4) default NULL COMMENT 'Type du prix unitaire 1->Prix unitaire,2->Forfait',
  `nbdec_pu` smallint(5) default NULL COMMENT 'Nombre de décimales pour le prix unitaire',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `poidsbrut` decimal(19,4) default NULL COMMENT 'Poids brut',
  `tare` decimal(19,4) default NULL COMMENT 'Tare',
  `poidsnet` decimal(19,4) default NULL COMMENT 'Poids net',
  `devise_taux` double(15,5) default NULL COMMENT 'Taux de la devise (1 pour doc en euros)',
  `pr` decimal(19,4) default NULL COMMENT 'Prix de revient',
  `blocnotebrut` longtext COMMENT 'Bloc note brut',
  `blocnoteriche` longtext COMMENT 'Bloc note riche',
  `devise` bigint(20) default NULL COMMENT 'Devise',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `pc_cleunik` bigint(20) default '-1' COMMENT 'Clé unique plan comptable (vente)',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `coef_facture` tinyint(4) default '1' COMMENT '1-> Facturable,0->Non facturable',
  `taxes_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxes',
  `longueur` decimal(15,4) default '0.0000' COMMENT 'Longueur',
  `largeur` decimal(15,4) default '0.0000' COMMENT 'Largeur',
  `epaisseur` decimal(15,4) default '0.0000' COMMENT 'Epaisseur',
  `unite_longueur` bigint(20) default '-90',
  `tpf_cleunik` bigint(20) default '-1' COMMENT 'Taxe parafiscale',
  `tpf_cleunik_01` bigint(20) default '-1' COMMENT '2° taxe parafiscale',
  UNIQUE KEY `artcleunik` (`commercial_ligne_cleunik`),
  UNIQUE KEY `code_ligne` (`commercial_cleunik`,`ligne_cleunik`),
  KEY `mnemo` (`art_cleunik`),
  KEY `FK_facfou_ligne_3` (`pc_cleunik`),
  KEY `FK_facfou_ligne_4` (`catcompta_cleunik`),
  KEY `FK_facfou_ligne_5` (`devise`),
  KEY `FK_facfou_ligne_6` (`tarif_cleunik`),
  KEY `FK_facfou_ligne_7` (`taxes_cleunik`),
  KEY `_FK_facfou_ligne_8` (`unite_longueur`),
  KEY `_FK_facfou_ligne_9` (`tpf_cleunik`),
  KEY `_fk_facfou_ligne_10` (`tpf_cleunik_01`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes de factures fournisseur';

-- --------------------------------------------------------

--
-- Structure de la table `_facfou_lignes_qte`
--

CREATE TABLE IF NOT EXISTS `_facfou_lignes_qte` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité livrée',
  `qte_unite` bigint(20) default NULL COMMENT 'Unité de la quantité',
  `qte_nbdec` smallint(5) default NULL COMMENT 'Nombre de décimales pour la quantité',
  `dateheure_demande` datetime default NULL COMMENT 'Délai Date/Heure demandé',
  `dateheure_confirm` datetime default NULL COMMENT 'Délai Date/Heure confirmé',
  `statut` bigint(20) default NULL COMMENT 'Statut de la ligne',
  `unite_condi` bigint(20) default '-112' COMMENT 'Unité de conditionnement',
  `qte_condi` decimal(19,4) default NULL COMMENT 'Quantité de conditionnements',
  `nb_stock_in_condi` decimal(15,5) default NULL COMMENT 'Nombre d''unités de stock dans une unité de conditionnement',
  `cdefou_ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité de _cdefou_lignes_qte',
  `recfou_ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité de _recfou_lignes_qte',
  `mvt_cleunik` bigint(20) default NULL COMMENT 'Clé unique mouvement de stock',
  `choix_depot` bigint(20) default '-15' COMMENT 'Eventuel dépot',
  `choix_empla` bigint(20) default '-16' COMMENT 'Eventuel emplacement',
  `qte_deja` decimal(19,4) default NULL COMMENT 'Quantité déjà livrée ou réceptionnée',
  UNIQUE KEY `code_ligne` (`commercial_ligne_cleunik`,`ligne_cleunik`),
  UNIQUE KEY `uk9` (`ligne_qte_cleunik`),
  KEY `FK_facfou_ligne_qte_2` (`qte_unite`),
  KEY `FK_facfou_ligne_qte_3` (`statut`),
  KEY `FK_facfou_ligne_qte_4` (`unite_condi`),
  KEY `FK_facfou_ligne_qte_5` (`choix_depot`),
  KEY `FK_facfou_ligne_qte_6` (`choix_empla`),
  KEY `ligne_cleunik` (`commercial_ligne_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quantités des lignes de factures fournisseur';

-- --------------------------------------------------------

--
-- Structure de la table `_facfou_representants`
--

CREATE TABLE IF NOT EXISTS `_facfou_representants` (
  `action_rep_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_rep_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant de référence (facfou éventuellement)',
  `act_cleunik_rep` bigint(20) default NULL COMMENT 'Représentant',
  `commission_typ` tinyint(4) default NULL COMMENT 'Type de commission (1->Taux,2-Fixe,3->Mixte)',
  `commission_taux` decimal(15,4) default NULL COMMENT 'Taux de commission',
  `commission_fixe` decimal(15,4) default NULL COMMENT 'Montant fixe de commission',
  `commission_regle` bigint(20) default '1' COMMENT 'Règle de calcul des commission',
  KEY `_facfou_representants_ibfk_1` (`act_cleunik_rep`),
  KEY `_facfou_representants_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Représentants liés aux factures fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_facfou_transporteurs`
--

CREATE TABLE IF NOT EXISTS `_facfou_transporteurs` (
  `action_trans_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_trans_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur de référence (facfou éventuellement)',
  `act_cleunik_trans` bigint(20) default NULL COMMENT 'Transporteur',
  `poids_net` decimal(15,4) default NULL COMMENT 'Poids net',
  `poids_bru` decimal(15,4) default NULL COMMENT 'Poids brut',
  `volum_net` decimal(15,4) default NULL COMMENT 'Volume net',
  `volum_bru` decimal(15,4) default NULL COMMENT 'Volume brut',
  `surfa_net` decimal(15,4) default NULL COMMENT 'Surface nette',
  `surfa_bru` decimal(15,4) default NULL COMMENT 'Surface brute',
  `nombre_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis mémorisés',
  UNIQUE KEY `_facfou_transporteur_ibfk_0` (`action_trans_cleunik`),
  KEY `_facfou_transporteur_ibfk_1` (`act_cleunik_trans`),
  KEY `_facfou_transporteur_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transporteurs liés aux factures fournisseur';

-- --------------------------------------------------------

--
-- Structure de la table `_fax_en`
--

CREATE TABLE IF NOT EXISTS `_fax_en` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé unique du message, de l''action',
  `sujet` longtext COMMENT 'Sujet',
  `destinataires` longtext COMMENT 'Liste des destinataires',
  `datas_vrac` longtext COMMENT 'Datas en vrac dans une structure xml',
  `mel_id` varchar(100) default NULL COMMENT 'Id du courriel',
  UNIQUE KEY `action_cleunik` (`action_cleunik`),
  KEY `mel_id` (`mel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Fax envoyés';

-- --------------------------------------------------------

--
-- Structure de la table `_ficones`
--

CREATE TABLE IF NOT EXISTS `_ficones` (
  `ficones_cleunik` bigint(20) default NULL COMMENT 'Cléunik',
  `ficones_hash` varchar(40) default NULL COMMENT 'Hash de l''image',
  `ficones_image` longblob COMMENT 'Image',
  `ficones_designation` varchar(50) default NULL COMMENT 'Désignation',
  `ficones_cheminorigine` longtext COMMENT 'Chemin dorigine',
  `ficones_infos` longtext COMMENT 'Infos Diverses',
  UNIQUE KEY `ficones_cleunik` (`ficones_cleunik`),
  UNIQUE KEY `ficones_hash` (`ficones_hash`),
  KEY `ficones_designation` (`ficones_designation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Icones';

-- --------------------------------------------------------

--
-- Structure de la table `_formulaires_internet`
--

CREATE TABLE IF NOT EXISTS `_formulaires_internet` (
  `ip` varchar(15) default NULL COMMENT 'IP du demandeur',
  `host` longtext COMMENT 'Host du demandeur',
  `dateheure_entree` datetime default NULL COMMENT 'Date/Heure dentrée dans le formulaire',
  `dateheure_valida` datetime default NULL COMMENT 'Date/Heure de validation du formulaire',
  `c_uuid` varchar(36) NOT NULL default '',
  `reponse` varchar(20) default NULL COMMENT 'Identification mnémotechnique',
  `formulaire` longtext COMMENT 'Nom du formulaire',
  `origine` longtext COMMENT 'Adresse d''origine',
  UNIQUE KEY `UK_formulaires_internet` (`c_uuid`),
  KEY `IK_formulaires_internet_01` (`ip`,`dateheure_entree`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Accès formulaires Internet';

-- --------------------------------------------------------

--
-- Structure de la table `_graal`
--

CREATE TABLE IF NOT EXISTS `_graal` (
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé Unik',
  `int_cleunik` bigint(20) default NULL COMMENT 'Clé unique interlocuteur',
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Clé unique table choix (Nature de la relation)',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut pour recherche',
  `blocnotertf` longtext COMMENT 'Bloc note au format RTF',
  `portee` bigint(20) default '8192' COMMENT 'Portée de la relation',
  `principal` tinyint(4) default '1' COMMENT 'Acteur/Interlocuteur principal',
  KEY `act_cleunik` (`act_cleunik`),
  KEY `int_cleunik` (`int_cleunik`),
  KEY `action_cleunik` (`action_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `portee_principal` (`portee`,`principal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gestion des Relations Actions Acteurs sans Limitation';

-- --------------------------------------------------------

--
-- Structure de la table `_graal_act`
--

CREATE TABLE IF NOT EXISTS `_graal_act` (
  `action_cleunik_gauche` bigint(20) default NULL COMMENT 'Action_cleunik_gauche',
  `action_cleunik_droite` bigint(20) default NULL COMMENT 'Action_cleunik_droite',
  `choix_cleunik_droite` bigint(20) default NULL COMMENT 'Clé unique relation action de droite ',
  `choix_cleunik_gauche` bigint(20) default NULL COMMENT 'Clé unique relation action de gauche ',
  `blocnotertf` longtext COMMENT 'Bloc note RTF',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  KEY `contrainte_actions_graal_act1` (`action_cleunik_gauche`),
  KEY `contrainte_actions_graal_act2` (`action_cleunik_droite`),
  KEY `contrainte_actions_graal_act3` (`choix_cleunik_droite`),
  KEY `contrainte_actions_graal_act4` (`choix_cleunik_gauche`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relations entre actions';

-- --------------------------------------------------------

--
-- Structure de la table `_inventaire`
--

CREATE TABLE IF NOT EXISTS `_inventaire` (
  `inv_cleunik` bigint(20) default NULL COMMENT 'Clé Unique',
  `description` varchar(100) default NULL COMMENT 'Description courte',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `blocnotertf` longtext COMMENT 'Bloc note RTF',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de création',
  `dateheureinventaire` datetime default NULL COMMENT 'Date de l''inventaire"',
  `etat` tinyint(4) default NULL COMMENT 'Etat',
  `gestion_depemp` tinyint(4) default '2' COMMENT 'Gestion des dépôts et emplacements',
  `tarif_reference` bigint(20) default NULL COMMENT 'Tarif de référence',
  `critere_cleunik` bigint(20) default '0' COMMENT 'Clé Unique critère de tri',
  UNIQUE KEY `invcleunik` (`inv_cleunik`),
  KEY `_inv_critere_ibfk_1` (`critere_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Inventaire';

-- --------------------------------------------------------

--
-- Structure de la table `_inventaire_lignes`
--

CREATE TABLE IF NOT EXISTS `_inventaire_lignes` (
  `inv_cleunik` bigint(20) default NULL COMMENT 'Clé Unique inventaire',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé Unique article',
  `etat` tinyint(4) default NULL COMMENT 'Etat',
  `qte_inven` decimal(15,4) default NULL COMMENT 'Quantité saisie',
  `mvt_cleunik` bigint(20) default NULL COMMENT 'Clé Unique Mouvement (pour info)',
  `choix_depot` bigint(20) default NULL COMMENT 'Dépôt',
  `choix_empla` bigint(20) default NULL COMMENT 'Emplacement',
  `pu_inv` decimal(19,4) default NULL COMMENT 'Prix unitaire du mouvement d''inventaire',
  `tarif_reference` bigint(20) default NULL COMMENT 'Tarif de référence du mouvement d''inventaire',
  `nbdec_pu` tinyint(4) default '2' COMMENT 'Nombre de décimales pour le PU',
  UNIQUE KEY `invdetcleunik` (`inv_cleunik`,`art_cleunik`),
  KEY `_inventaire_lignes_ibfk_1` (`art_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes d''inventaire';

-- --------------------------------------------------------

--
-- Structure de la table `_livcli_adresses`
--

CREATE TABLE IF NOT EXISTS `_livcli_adresses` (
  `adr_cleunik` bigint(20) default NULL COMMENT 'Clé unique adresse',
  `adr_cod` varchar(15) default NULL COMMENT 'Code adresse',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `adr_nom` varchar(50) default NULL COMMENT 'Nom de la société',
  `adr_complementnom` varchar(50) default NULL COMMENT 'Eventuel complément de nom',
  `adr_ligne1` varchar(50) default NULL COMMENT 'Ligne 1 adresse',
  `adr_ligne2` varchar(50) default NULL COMMENT 'Ligne 2 adresse',
  `adr_ligne3` varchar(50) default NULL COMMENT 'Ligne 3 adresse',
  `adr_cp` varchar(10) default NULL COMMENT 'Code postal',
  `adr_ville` varchar(50) default NULL COMMENT 'Ville',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Pays (Clé unique table choix)',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `adr_latitude` double(9,6) default NULL COMMENT 'Latitude',
  `adr_longitude` double(9,6) default NULL COMMENT 'Longitude',
  `adr_typecoordonnees` bigint(20) default NULL COMMENT 'Type d''adresse',
  `adr_type` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Type d''adresse : 1 france, 2 étranger',
  UNIQUE KEY `adr_cleunik` (`adr_cleunik`),
  KEY `adr_cod` (`adr_cod`),
  KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `adr_typecoordonnees` (`adr_typecoordonnees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses des livraisons clients';

-- --------------------------------------------------------

--
-- Structure de la table `_livcli_consignes`
--

CREATE TABLE IF NOT EXISTS `_livcli_consignes` (
  `action_consi_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/consigne',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''acteur consignant l''article',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''article consigné',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité',
  `qte_nbdec` tinyint(4) default '0' COMMENT 'Nombre de décimales',
  `qte_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis sur la consigne',
  UNIQUE KEY `_livcli_consignes_ibfk_0` (`action_consi_cleunik`),
  KEY `_livcli_consignes_ibfk_1` (`act_cleunik`),
  KEY `_livcli_consignes_ibfk_2` (`commercial_cleunik`),
  KEY `_livcli_consignes_ibfk_3` (`art_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Consignes liées aux livraisons clients';

-- --------------------------------------------------------

--
-- Structure de la table `_livcli_entetes`
--

CREATE TABLE IF NOT EXISTS `_livcli_entetes` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `code` varchar(25) default NULL COMMENT 'N° du document',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `blocnotebrut_entete` longtext COMMENT 'Bloc Note entête',
  `reference_acteur` longtext COMMENT 'Référence(s) de la commande chez le client',
  `devise` bigint(20) default NULL COMMENT 'Devise de l''action commerciale',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `escompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''escompte',
  `escompte_type` tinyint(4) default '1' COMMENT '1-> Taux, 2 Montant',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `reg_cleunik` bigint(20) default '-1' COMMENT 'Mode de règlement',
  `blocnotebrut_pied` longtext COMMENT 'Bloc Note pied',
  `rendezvous` longtext COMMENT 'Rendez-vous',
  `modliv` bigint(20) default '-94' COMMENT 'Modalités de livraison',
  `typpor` bigint(20) default '-93' COMMENT 'Type de port',
  `dateheureexpedition` datetime default NULL COMMENT 'Date et heure d''expédition',
  `dateheurelivraison` datetime default NULL COMMENT 'Date et heure de livraison',
  `frais_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `frais_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant des frais',
  `port_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `port_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant du port',
  `acompte_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `acompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''acompte',
  `modliv_bis` bigint(20) default '-94' COMMENT 'Modalités de livraison sur date livraison',
  `assujetti_tpf` tinyint(4) default '1' COMMENT 'Assujetti aux taxes parafiscales 1->Oui (défault),2->Non',
  UNIQUE KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `livcli_entetes_1` (`action_cleunik`),
  KEY `livcli_entetes_2` (`act_cleunik`),
  KEY `livcli_entetes_3` (`devise`),
  KEY `livcli_entetes_4` (`catcompta_cleunik`),
  KEY `livcli_entetes_5` (`reg_cleunik`),
  KEY `livcli_entete_6` (`modliv`),
  KEY `livcli_entete_7` (`typpor`),
  KEY `livcli_entete_8` (`tarif_cleunik`),
  KEY `livcli_entete_9` (`modliv_bis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des entêtes de livraison clients';

-- --------------------------------------------------------

--
-- Structure de la table `_livcli_lignes`
--

CREATE TABLE IF NOT EXISTS `_livcli_lignes` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique article',
  `code_interne` varchar(20) default NULL COMMENT 'Code interne',
  `indice_interne` varchar(10) default NULL COMMENT 'Indice interne',
  `mnemotechnique_interne` varchar(20) default NULL COMMENT 'Identification mnémotechnique interne',
  `description_interne` varchar(100) default NULL COMMENT 'Description courte interne',
  `code_acteur` varchar(20) default NULL COMMENT 'Code chez l''acteur',
  `mnemotechnique_acteur` varchar(20) default NULL COMMENT 'Identification mnémotechnique chez lacteur',
  `description_acteur` varchar(100) default NULL COMMENT 'Description courte chez l''acteur',
  `typeligne` varchar(1) default NULL COMMENT 'Type de ligne',
  `pu` decimal(19,4) default NULL COMMENT 'Prix unitaire ou forfait',
  `pu_portee` decimal(19,4) default NULL COMMENT 'Portée du prix unitaire',
  `pu_type` decimal(19,4) default NULL COMMENT 'Type du prix unitaire 1->Prix unitaire,2->Forfait',
  `nbdec_pu` smallint(5) default NULL COMMENT 'Nombre de décimales pour le prix unitaire',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `poidsbrut` decimal(19,4) default NULL COMMENT 'Poids brut',
  `tare` decimal(19,4) default NULL COMMENT 'Tare',
  `poidsnet` decimal(19,4) default NULL COMMENT 'Poids net',
  `devise_taux` double(15,5) default NULL COMMENT 'Taux de la devise (1 pour doc en euros)',
  `pr` decimal(19,4) default NULL COMMENT 'Prix de revient',
  `blocnotebrut` longtext COMMENT 'Bloc note brut',
  `blocnoteriche` longtext COMMENT 'Bloc note riche',
  `devise` bigint(20) default NULL COMMENT 'Devise',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `pc_cleunik` bigint(20) default '-1' COMMENT 'Clé unique plan comptable (vente)',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `coef_facture` tinyint(4) default '1' COMMENT '1-> Facturable,0->Non facturable',
  `taxes_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxes',
  `longueur` decimal(15,4) default '0.0000' COMMENT 'Longueur',
  `largeur` decimal(15,4) default '0.0000' COMMENT 'Largeur',
  `epaisseur` decimal(15,4) default '0.0000' COMMENT 'Epaisseur',
  `unite_longueur` bigint(20) default '-90',
  `tpf_cleunik` bigint(20) default '-1' COMMENT 'Taxe parafiscale',
  `tpf_cleunik_01` bigint(20) default '-1' COMMENT '2° taxe parafiscale',
  UNIQUE KEY `artcleunik` (`commercial_ligne_cleunik`),
  UNIQUE KEY `code_ligne` (`commercial_cleunik`,`ligne_cleunik`),
  KEY `mnemo` (`art_cleunik`),
  KEY `FK_livcli_ligne_3` (`pc_cleunik`),
  KEY `FK_livcli_ligne_4` (`catcompta_cleunik`),
  KEY `FK_livcli_ligne_5` (`devise`),
  KEY `FK_livcli_ligne_6` (`tarif_cleunik`),
  KEY `FK_livcli_ligne_7` (`taxes_cleunik`),
  KEY `_FK_livcli_ligne_8` (`unite_longueur`),
  KEY `_FK_livcli_ligne_9` (`tpf_cleunik`),
  KEY `_fk_livcli_ligne_10` (`tpf_cleunik_01`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes de livraison clients';

-- --------------------------------------------------------

--
-- Structure de la table `_livcli_lignes_qte`
--

CREATE TABLE IF NOT EXISTS `_livcli_lignes_qte` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité livrée',
  `qte_unite` bigint(20) default NULL COMMENT 'Unité de la quantité',
  `qte_nbdec` smallint(5) default NULL COMMENT 'Nombre de décimales pour la quantité',
  `dateheure_demande` datetime default NULL COMMENT 'Délai Date/Heure demandé',
  `dateheure_confirm` datetime default NULL COMMENT 'Délai Date/Heure confirmé',
  `statut` bigint(20) default NULL COMMENT 'Statut de la ligne',
  `unite_condi` bigint(20) default NULL COMMENT 'Unité de conditionnement',
  `qte_condi` decimal(19,4) default NULL COMMENT 'Quantité de conditionnements',
  `nb_stock_in_condi` decimal(15,5) default NULL COMMENT 'Nombre d''unités de stock dans une unité de conditionnement',
  `cdecli_ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité de _cdecli_lignes_qte',
  `mvt_cleunik` bigint(20) default NULL COMMENT 'Clé unique mouvement de stock',
  `choix_depot` bigint(20) default '-15' COMMENT 'Eventuel dépot',
  `choix_empla` bigint(20) default '-16' COMMENT 'Eventuel emplacement',
  `qte_deja` decimal(19,4) default NULL COMMENT 'Quantité déjà livrée ou réceptionnée',
  UNIQUE KEY `code_ligne` (`commercial_ligne_cleunik`,`ligne_cleunik`),
  UNIQUE KEY `uk9` (`ligne_qte_cleunik`),
  KEY `FK_livcli_ligne_qte_2` (`qte_unite`),
  KEY `FK_livcli_ligne_qte_3` (`statut`),
  KEY `FK_livcli_ligne_qte_4` (`unite_condi`),
  KEY `FK_livcli_ligne_qte_5` (`choix_depot`),
  KEY `FK_livcli_ligne_qte_6` (`choix_empla`),
  KEY `ligne_cleunik` (`commercial_ligne_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quantités des lignes de livraison clients';

-- --------------------------------------------------------

--
-- Structure de la table `_livcli_representants`
--

CREATE TABLE IF NOT EXISTS `_livcli_representants` (
  `action_rep_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_rep_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant de référence (livcli éventuellement)',
  `act_cleunik_rep` bigint(20) default NULL COMMENT 'Représentant',
  `commission_typ` tinyint(4) default NULL COMMENT 'Type de commission (1->Taux,2-Fixe,3->Mixte)',
  `commission_taux` decimal(15,4) default NULL COMMENT 'Taux de commission',
  `commission_fixe` decimal(15,4) default NULL COMMENT 'Montant fixe de commission',
  `commission_regle` bigint(20) default '1' COMMENT 'Règle de calcul des commission',
  KEY `_livcli_representants_ibfk_1` (`act_cleunik_rep`),
  KEY `_livcli_representants_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Représentants liés aux livraisons clients';

-- --------------------------------------------------------

--
-- Structure de la table `_livcli_transporteurs`
--

CREATE TABLE IF NOT EXISTS `_livcli_transporteurs` (
  `action_trans_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_trans_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur de référence (livcli éventuellement)',
  `act_cleunik_trans` bigint(20) default NULL COMMENT 'Transporteur',
  `poids_net` decimal(15,4) default NULL COMMENT 'Poids net',
  `poids_bru` decimal(15,4) default NULL COMMENT 'Poids brut',
  `volum_net` decimal(15,4) default NULL COMMENT 'Volume net',
  `volum_bru` decimal(15,4) default NULL COMMENT 'Volume brut',
  `surfa_net` decimal(15,4) default NULL COMMENT 'Surface nette',
  `surfa_bru` decimal(15,4) default NULL COMMENT 'Surface brute',
  `nombre_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis mémorisés',
  UNIQUE KEY `_livcli_transporteur_ibfk_0` (`action_trans_cleunik`),
  KEY `_livcli_transporteur_ibfk_1` (`act_cleunik_trans`),
  KEY `_livcli_transporteur_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transporteurs liés aux livraisons clients';

-- --------------------------------------------------------

--
-- Structure de la table `_modereg`
--

CREATE TABLE IF NOT EXISTS `_modereg` (
  `reg_cleunik` bigint(20) default NULL COMMENT 'Clé Unik',
  `codealphanum15` varchar(15) default NULL COMMENT 'Code mode règlement',
  `description` varchar(255) default NULL COMMENT 'Intitulé du mode de règlement',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `blocnotertf` longtext COMMENT 'Bloc note au format RTF',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de création',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `actif` tinyint(4) default '1' COMMENT 'Actif : 1-> Oui, 2->Non',
  UNIQUE KEY `codealphanum15` (`codealphanum15`),
  UNIQUE KEY `act_cleunik` (`reg_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Modes de règlements';

-- --------------------------------------------------------

--
-- Structure de la table `_modereg_det`
--

CREATE TABLE IF NOT EXISTS `_modereg_det` (
  `reg_cleunik` bigint(20) default NULL COMMENT 'Clé Unik mode règlement',
  `noligne` tinyint(3) unsigned default '1' COMMENT 'Numéro de ligne',
  `pourcentage` double(7,2) default '100.00' COMMENT 'Pourcentage',
  `jour` tinyint(3) unsigned default '0' COMMENT 'Jour du mois 0-> comptant, 31-> Fin de mois sinon le jour indiqué',
  `nbjour` smallint(5) default '0' COMMENT 'Nombre de jours',
  `mode_paiement` bigint(20) default '-91' COMMENT 'Mode de paiement',
  `type_paiement` bigint(20) default '-92' COMMENT 'Type de paiement',
  `moisentier` tinyint(1) NOT NULL COMMENT 'Mois entier',
  `base` tinyint(1) default '1' COMMENT '1 -> TTC, 2-> HT, 3 -> TVA',
  UNIQUE KEY `codeligne` (`reg_cleunik`,`noligne`),
  KEY `modereg_det_02` (`mode_paiement`),
  KEY `modereg_det_03` (`type_paiement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Détail des modes de règlement';

-- --------------------------------------------------------

--
-- Structure de la table `_mouvements_stock`
--

CREATE TABLE IF NOT EXISTS `_mouvements_stock` (
  `mvt_cleunik` bigint(20) default NULL COMMENT 'Clé Unique Mouvement',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé Unique article',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé Utilisateur ayant saisi le mouvement',
  `int_cleunik` bigint(20) default NULL COMMENT 'Interlocuteur entreprise concerné',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `dateheuremvt` datetime default NULL COMMENT 'Date/Heure du mouvement',
  `dateheuresaisie` datetime default NULL COMMENT 'Date/Heure de saisie',
  `choix_depot` bigint(20) default '-15' COMMENT 'Dépôt',
  `choix_empla` bigint(20) default '-16' COMMENT 'Emplacement',
  `qte_mvt` decimal(15,4) default NULL COMMENT 'Quantité mouvementée',
  `qte_pos` decimal(15,4) default NULL COMMENT 'Quantité après le mouvement',
  `unite_mvt` bigint(20) default NULL COMMENT 'Unité de stock du mouvement',
  `genre_mvt` bigint(20) default NULL COMMENT 'Genre de mouvement (manuel, réception ...)',
  `type_mvt` tinyint(4) default NULL COMMENT 'Type de mouvement (Entrée, Sortie, Inventaire ... )',
  `pu_mvt` decimal(19,4) default NULL COMMENT 'Prix unitaire du mouvement',
  UNIQUE KEY `indunik_1` (`mvt_cleunik`),
  KEY `_mouvements_stock_ibfk_1` (`art_cleunik`),
  KEY `_mouvements_stock_ibfk_2` (`uti_cleunik`),
  KEY `_mouvements_stock_ibfk_3` (`int_cleunik`),
  KEY `_mouvements_stock_ibfk_4` (`choix_depot`),
  KEY `_mouvements_stock_ibfk_5` (`choix_empla`),
  KEY `_mouvements_stock_ibfk_6` (`genre_mvt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mouvements de stock';

-- --------------------------------------------------------

--
-- Structure de la table `_nomenclatures_achats`
--

CREATE TABLE IF NOT EXISTS `_nomenclatures_achats` (
  `art_cleunik_pere` bigint(20) default NULL COMMENT 'Clé Unique article père',
  `art_cleunik_fils` bigint(20) default NULL COMMENT 'Clé Unique article fils',
  `noligne` tinyint(4) default NULL COMMENT 'Numéro de ligne',
  `quantite` decimal(15,4) default NULL COMMENT 'Quantité unitaire',
  `unite_quantite` bigint(20) default NULL COMMENT 'Unité de quantité',
  `nb_decimales_qte` tinyint(4) default NULL COMMENT 'Nombre de décimales',
  `blocnotebrut` longtext COMMENT 'Commentaire complémentaire',
  `valeur_complement` decimal(19,4) default '0.0000' COMMENT 'Valeur complémentaire',
  `valeur_complement_type` tinyint(4) default '1' COMMENT 'Type Valeur complémentaire 1-> Unitaire,2 Forfaitaire',
  `base_valorisation` bigint(20) default '-1' COMMENT 'Base de valorisation -1-> Dernier prix d''achat,-2-> Prix de revient, tarifs d''achats, tarifs de vente',
  `ajout_pa_pere` tinyint(4) default '2' COMMENT 'Ajout dans le Prix d''achat du père 1-> Oui,2 Non',
  `ajout_pr_pere` tinyint(4) default '2' COMMENT 'Ajout dans le Prix de revient du père 1-> Oui,2 Non',
  `gestion_stock` tinyint(4) default '2' COMMENT 'Géré en stock 1-> Oui,2 Non',
  `gestion_norma` tinyint(4) default '2' COMMENT 'Géré comme une ligne classique 1-> Oui (génère des lignes de mouvement ciaux classiques),2 Non ',
  UNIQUE KEY `K_nomenclatures_achat_1` (`art_cleunik_pere`,`noligne`),
  KEY `FK_nomenclatures_achat_2` (`art_cleunik_fils`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Nomenclatures d''achat des articles';

-- --------------------------------------------------------

--
-- Structure de la table `_nomenclatures_fab`
--

CREATE TABLE IF NOT EXISTS `_nomenclatures_fab` (
  `art_cleunik_pere` bigint(20) default NULL COMMENT 'Clé Unique article père',
  `art_cleunik_fils` bigint(20) default NULL COMMENT 'Clé Unique article fils',
  `noligne` tinyint(4) default NULL COMMENT 'Numéro de ligne',
  `quantite` decimal(15,4) default NULL COMMENT 'Quantité unitaire',
  `unite_quantite` bigint(20) default NULL COMMENT 'Unité de quantité',
  `nb_decimales_qte` tinyint(4) default NULL COMMENT 'Nombre de décimales',
  `blocnotebrut` longtext COMMENT 'Commentaire complémentaire',
  `valeur_complement` decimal(19,4) default '0.0000' COMMENT 'Valeur complémentaire',
  `valeur_complement_type` tinyint(4) default '1' COMMENT 'Type Valeur complémentaire 1-> Unitaire,2 Forfaitaire',
  `base_valorisation` bigint(20) default '-1' COMMENT 'Base de valorisation -1-> Dernier prix d''achat,-2-> Prix de revient, tarifs d''achats, tarifs de vente',
  `arrondi_fab` tinyint(4) default '1' COMMENT '1->pas d''arrondi,2->unité supérieure,3->unité inférieure',
  UNIQUE KEY `K_nomenclatures_fab_1` (`art_cleunik_pere`,`noligne`),
  KEY `FK_nomenclatures_fab_2` (`art_cleunik_fils`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Nomenclatures de fabrication des articles';

-- --------------------------------------------------------

--
-- Structure de la table `_nomenclatures_ventes`
--

CREATE TABLE IF NOT EXISTS `_nomenclatures_ventes` (
  `art_cleunik_pere` bigint(20) default NULL COMMENT 'Clé Unique article père',
  `art_cleunik_fils` bigint(20) default NULL COMMENT 'Clé Unique article fils',
  `noligne` tinyint(4) default NULL COMMENT 'Numéro de ligne',
  `quantite` decimal(15,4) default NULL COMMENT 'Quantité unitaire',
  `unite_quantite` bigint(20) default NULL COMMENT 'Unité de quantité',
  `nb_decimales_qte` tinyint(4) default NULL COMMENT 'Nombre de décimales',
  `blocnotebrut` longtext COMMENT 'Commentaire complémentaire',
  `valeur_complement` decimal(19,4) default '0.0000' COMMENT 'Valeur complémentaire',
  `valeur_complement_type` tinyint(4) default '1' COMMENT 'Type Valeur complémentaire 1-> Unitaire,2 Forfaitaire',
  `base_valorisation` bigint(20) default '-1' COMMENT 'Base de valorisation -1-> Dernier prix d''achat,-2-> Prix de revient, tarifs d''achats, tarifs de vente',
  `ajout_pv_pere` tinyint(4) default '2' COMMENT 'Ajout dans le Prix de vente du père 1-> Oui,2 Non',
  `ajout_pr_pere` tinyint(4) default '2' COMMENT 'Ajout dans le Prix de revient du père 1-> Oui,2 Non',
  `gestion_stock` tinyint(4) default '2' COMMENT 'Géré en stock 1-> Oui,2 Non',
  `gestion_norma` tinyint(4) default '1' COMMENT 'Géré comme une ligne classique 1-> Oui (génère des lignes de mouvement ciaux classiques),2 Non ',
  UNIQUE KEY `K_nomenclatures_vente_1` (`art_cleunik_pere`,`noligne`),
  KEY `FK_nomenclatures_vente_2` (`art_cleunik_fils`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Nomenclatures de vente des articles';

-- --------------------------------------------------------

--
-- Structure de la table `_numerotations`
--

CREATE TABLE IF NOT EXISTS `_numerotations` (
  `num_cleunik` bigint(20) default NULL COMMENT 'Clé Unik',
  `description` varchar(100) default NULL COMMENT 'Code alpha-numérique contenant la séquence de numérotation',
  `der_numero` bigint(20) default NULL COMMENT 'Dernier numéro',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `blocnotertf` longtext COMMENT 'Bloc note au format RTF',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de création',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  UNIQUE KEY `num_cleunik` (`num_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Numérotations';

-- --------------------------------------------------------

--
-- Structure de la table `_objets`
--

CREATE TABLE IF NOT EXISTS `_objets` (
  `fen_cleunik` bigint(20) NOT NULL default '0' COMMENT 'Clé unique Fenêtre',
  `titre` longtext,
  `source_principal` longtext,
  `fen_acces` tinyint(4) NOT NULL default '0' COMMENT 'Accès autorisé ?',
  `fen_ajout` tinyint(4) NOT NULL default '0' COMMENT 'Ajout autorisé ?',
  `fen_modif` tinyint(4) NOT NULL default '0' COMMENT 'Modification autorisée ?',
  `fen_suppr` tinyint(4) NOT NULL default '0' COMMENT 'Suppression autorisée ?',
  `type_objet` tinyint(4) NOT NULL default '1' COMMENT 'Type d''objet',
  `prefixe` varchar(3) default NULL,
  UNIQUE KEY `fen_cleunik` (`fen_cleunik`),
  KEY `Index_2` (`titre`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Objets de l''applicatif';

-- --------------------------------------------------------

--
-- Structure de la table `_objets_libelle`
--

CREATE TABLE IF NOT EXISTS `_objets_libelle` (
  `fen_cleunik` bigint(20) NOT NULL default '0' COMMENT 'Clé unique Fenêtre',
  `descriptif` longtext character set latin1 NOT NULL COMMENT 'Descriptif',
  `langue` bigint(20) NOT NULL default '120131',
  `uti_cleunik` bigint(20) NOT NULL default '0' COMMENT 'Clé unique utilisateur',
  UNIQUE KEY `Index_1` (`fen_cleunik`,`langue`),
  KEY `FK__objets_libelle_2` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Libellés des objets';

-- --------------------------------------------------------

--
-- Structure de la table `_offcli_adresses`
--

CREATE TABLE IF NOT EXISTS `_offcli_adresses` (
  `adr_cleunik` bigint(20) default NULL COMMENT 'Clé unique adresse',
  `adr_cod` varchar(15) default NULL COMMENT 'Code adresse',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `adr_nom` varchar(50) default NULL COMMENT 'Nom de la société',
  `adr_complementnom` varchar(50) default NULL COMMENT 'Eventuel complément de nom',
  `adr_ligne1` varchar(50) default NULL COMMENT 'Ligne 1 adresse',
  `adr_ligne2` varchar(50) default NULL COMMENT 'Ligne 2 adresse',
  `adr_ligne3` varchar(50) default NULL COMMENT 'Ligne 3 adresse',
  `adr_cp` varchar(10) default NULL COMMENT 'Code postal',
  `adr_ville` varchar(50) default NULL COMMENT 'Ville',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Pays (Clé unique table choix)',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `adr_latitude` double(9,6) default NULL COMMENT 'Latitude',
  `adr_longitude` double(9,6) default NULL COMMENT 'Longitude',
  `adr_typecoordonnees` bigint(20) default NULL COMMENT 'Type d''adresse',
  `adr_type` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Type d''adresse : 1 france, 2 étranger',
  UNIQUE KEY `adr_cleunik` (`adr_cleunik`),
  KEY `adr_cod` (`adr_cod`),
  KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `adr_typecoordonnees` (`adr_typecoordonnees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses des offres clients';

-- --------------------------------------------------------

--
-- Structure de la table `_offcli_consignes`
--

CREATE TABLE IF NOT EXISTS `_offcli_consignes` (
  `action_consi_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/consigne',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''acteur consignant l''article',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''article consigné',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité',
  `qte_nbdec` tinyint(4) default '0' COMMENT 'Nombre de décimales',
  `qte_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis sur la consigne',
  UNIQUE KEY `_offcli_consignes_ibfk_0` (`action_consi_cleunik`),
  KEY `_offcli_consignes_ibfk_1` (`act_cleunik`),
  KEY `_offcli_consignes_ibfk_2` (`commercial_cleunik`),
  KEY `_offcli_consignes_ibfk_3` (`art_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Consignes liées aux offres clients';

-- --------------------------------------------------------

--
-- Structure de la table `_offcli_entetes`
--

CREATE TABLE IF NOT EXISTS `_offcli_entetes` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `code` varchar(25) default NULL COMMENT 'N° du document',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `blocnotebrut_entete` longtext COMMENT 'Bloc Note entête',
  `reference_acteur` longtext COMMENT 'Référence(s) de la commande chez le client',
  `devise` bigint(20) default NULL COMMENT 'Devise de l''action commerciale',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `escompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''escompte',
  `escompte_type` tinyint(4) default '1' COMMENT '1-> Taux, 2 Montant',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `reg_cleunik` bigint(20) default '-1' COMMENT 'Mode de règlement',
  `blocnotebrut_pied` longtext COMMENT 'Bloc Note pied',
  `rendezvous` longtext COMMENT 'Rendez-vous',
  `modliv` bigint(20) default '-94' COMMENT 'Modalités de livraison',
  `typpor` bigint(20) default '-93' COMMENT 'Type de port',
  `dateheureexpedition` datetime default NULL COMMENT 'Date et heure d''expédition',
  `dateheurelivraison` datetime default NULL COMMENT 'Date et heure de livraison',
  `frais_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `frais_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant des frais',
  `port_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `port_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant du port',
  `acompte_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `acompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''acompte',
  `modliv_bis` bigint(20) default '-94' COMMENT 'Modalités de livraison sur date livraison',
  `assujetti_tpf` tinyint(4) default '1' COMMENT 'Assujetti aux taxes parafiscales 1->Oui (défault),2->Non',
  UNIQUE KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `offcli_entetes_1` (`action_cleunik`),
  KEY `offcli_entetes_2` (`act_cleunik`),
  KEY `offcli_entetes_3` (`devise`),
  KEY `offcli_entetes_4` (`catcompta_cleunik`),
  KEY `offcli_entetes_5` (`reg_cleunik`),
  KEY `offcli_entete_6` (`modliv`),
  KEY `offcli_entete_7` (`typpor`),
  KEY `offcli_entete_8` (`tarif_cleunik`),
  KEY `offcli_entete_9` (`modliv_bis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des entêtes de offres clients';

-- --------------------------------------------------------

--
-- Structure de la table `_offcli_lignes`
--

CREATE TABLE IF NOT EXISTS `_offcli_lignes` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique article',
  `code_interne` varchar(20) default NULL COMMENT 'Code interne',
  `indice_interne` varchar(10) default NULL COMMENT 'Indice interne',
  `mnemotechnique_interne` varchar(20) default NULL COMMENT 'Identification mnémotechnique interne',
  `description_interne` varchar(100) default NULL COMMENT 'Description courte interne',
  `code_acteur` varchar(20) default NULL COMMENT 'Code chez l''acteur',
  `mnemotechnique_acteur` varchar(20) default NULL COMMENT 'Identification mnémotechnique chez lacteur',
  `description_acteur` varchar(100) default NULL COMMENT 'Description courte chez l''acteur',
  `typeligne` varchar(1) default NULL COMMENT 'Type de ligne',
  `pu` decimal(19,4) default NULL COMMENT 'Prix unitaire ou forfait',
  `pu_portee` decimal(19,4) default NULL COMMENT 'Portée du prix unitaire',
  `pu_type` decimal(19,4) default NULL COMMENT 'Type du prix unitaire 1->Prix unitaire,2->Forfait',
  `nbdec_pu` smallint(5) default NULL COMMENT 'Nombre de décimales pour le prix unitaire',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `poidsbrut` decimal(19,4) default NULL COMMENT 'Poids brut',
  `tare` decimal(19,4) default NULL COMMENT 'Tare',
  `poidsnet` decimal(19,4) default NULL COMMENT 'Poids net',
  `devise_taux` double(15,5) default NULL COMMENT 'Taux de la devise (1 pour doc en euros)',
  `pr` decimal(19,4) default NULL COMMENT 'Prix de revient',
  `blocnotebrut` longtext COMMENT 'Bloc note brut',
  `blocnoteriche` longtext COMMENT 'Bloc note riche',
  `devise` bigint(20) default NULL COMMENT 'Devise',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `pc_cleunik` bigint(20) default '-1' COMMENT 'Clé unique plan comptable (vente)',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `coef_facture` tinyint(4) default '1' COMMENT '1-> Facturable,0->Non facturable',
  `taxes_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxes',
  `longueur` decimal(15,4) default '0.0000' COMMENT 'Longueur',
  `largeur` decimal(15,4) default '0.0000' COMMENT 'Largeur',
  `epaisseur` decimal(15,4) default '0.0000' COMMENT 'Epaisseur',
  `unite_longueur` bigint(20) default '-90',
  `tpf_cleunik` bigint(20) default '-1' COMMENT 'Taxe parafiscale',
  `tpf_cleunik_01` bigint(20) default '-1' COMMENT '2° taxe parafiscale',
  UNIQUE KEY `artcleunik` (`commercial_ligne_cleunik`),
  UNIQUE KEY `code_ligne` (`commercial_cleunik`,`ligne_cleunik`),
  KEY `mnemo` (`art_cleunik`),
  KEY `FK_offcli_ligne_3` (`pc_cleunik`),
  KEY `FK_offcli_ligne_4` (`catcompta_cleunik`),
  KEY `FK_offcli_ligne_5` (`devise`),
  KEY `FK_offcli_ligne_6` (`tarif_cleunik`),
  KEY `FK_offcli_ligne_7` (`taxes_cleunik`),
  KEY `_FK_offcli_ligne_8` (`unite_longueur`),
  KEY `_FK_offcli_ligne_9` (`tpf_cleunik`),
  KEY `_fk_offcli_ligne_10` (`tpf_cleunik_01`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes de offres clients';

-- --------------------------------------------------------

--
-- Structure de la table `_offcli_lignes_qte`
--

CREATE TABLE IF NOT EXISTS `_offcli_lignes_qte` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité commandée',
  `qte_unite` bigint(20) default NULL COMMENT 'Unité de la quantité',
  `qte_nbdec` smallint(5) default NULL COMMENT 'Nombre de décimales pour la quantité',
  `dateheure_demande` datetime default NULL COMMENT 'Délai Date/Heure demandé',
  `dateheure_confirm` datetime default NULL COMMENT 'Délai Date/Heure confirmé',
  `statut` bigint(20) default NULL COMMENT 'Statut de la ligne',
  `unite_condi` bigint(20) default '-112' COMMENT 'Unité de conditionnement',
  `qte_condi` decimal(19,4) default NULL COMMENT 'Quantité de conditionnements',
  `nb_stock_in_condi` decimal(15,5) default NULL COMMENT 'Nombre d''unités de stock dans une unité de conditionnement',
  `choix_depot` bigint(20) default '-15' COMMENT 'Eventuel dépot',
  `choix_empla` bigint(20) default '-16' COMMENT 'Eventuel emplacement',
  `qte_deja` decimal(19,4) default NULL COMMENT 'Quantité déjà livrée ou réceptionnée',
  UNIQUE KEY `code_ligne` (`commercial_ligne_cleunik`,`ligne_cleunik`),
  UNIQUE KEY `uk9` (`ligne_qte_cleunik`),
  KEY `FK_offcli_ligne_qte_2` (`qte_unite`),
  KEY `FK_offcli_ligne_qte_3` (`statut`),
  KEY `FK_offcli_ligne_qte_4` (`unite_condi`),
  KEY `FK_offcli_ligne_qte_5` (`choix_depot`),
  KEY `FK_offcli_ligne_qte_6` (`choix_empla`),
  KEY `ligne_cleunik` (`commercial_ligne_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quantités des lignes de offres clients';

-- --------------------------------------------------------

--
-- Structure de la table `_offcli_representants`
--

CREATE TABLE IF NOT EXISTS `_offcli_representants` (
  `action_rep_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_rep_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant de référence (offcli éventuellement)',
  `act_cleunik_rep` bigint(20) default NULL COMMENT 'Représentant',
  `commission_typ` tinyint(4) default NULL COMMENT 'Type de commission (1->Taux,2-Fixe,3->Mixte)',
  `commission_taux` decimal(15,4) default NULL COMMENT 'Taux de commission',
  `commission_fixe` decimal(15,4) default NULL COMMENT 'Montant fixe de commission',
  `commission_regle` bigint(20) default '1' COMMENT 'Règle de calcul des commission',
  KEY `_offcli_representants_ibfk_1` (`act_cleunik_rep`),
  KEY `_offcli_representants_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Représentants liés aux offres clients';

-- --------------------------------------------------------

--
-- Structure de la table `_offcli_transporteurs`
--

CREATE TABLE IF NOT EXISTS `_offcli_transporteurs` (
  `action_trans_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_trans_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur de référence (offcli éventuellement)',
  `act_cleunik_trans` bigint(20) default NULL COMMENT 'Transporteur',
  `poids_net` decimal(15,4) default NULL COMMENT 'Poids net',
  `poids_bru` decimal(15,4) default NULL COMMENT 'Poids brut',
  `volum_net` decimal(15,4) default NULL COMMENT 'Volume net',
  `volum_bru` decimal(15,4) default NULL COMMENT 'Volume brut',
  `surfa_net` decimal(15,4) default NULL COMMENT 'Surface nette',
  `surfa_bru` decimal(15,4) default NULL COMMENT 'Surface brute',
  `nombre_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis mémorisés',
  UNIQUE KEY `_offcli_transporteur_ibfk_0` (`action_trans_cleunik`),
  KEY `_offcli_transporteur_ibfk_1` (`act_cleunik_trans`),
  KEY `_offcli_transporteur_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transporteurs liés aux offres clients';

-- --------------------------------------------------------

--
-- Structure de la table `_panier`
--

CREATE TABLE IF NOT EXISTS `_panier` (
  `panier_cleunik` bigint(20) default NULL COMMENT 'Panier cleunik',
  `uti_cleunik` bigint(20) default NULL COMMENT 'Clé unique utilisateur',
  `panier_titre` varchar(100) default NULL COMMENT 'Titre du du panier ou de la sélection',
  `panier_portee` bigint(20) default NULL COMMENT 'Portée',
  `panier_requete_selection` longtext COMMENT 'Requête de sélection',
  `panier_requete_presentation` longtext COMMENT 'Requête de présentation',
  `panier_requete_selection_enclair` longtext COMMENT 'Requête de sélection en "clair"',
  `panier_composition` longtext COMMENT 'Composition de la reqûete',
  `panier_type` tinyint(4) default NULL COMMENT 'Type (1->Panier- 2->Sélection) ',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `blocnote_riche` longtext COMMENT 'Bloc note riche',
  `blocnote_brut` longtext COMMENT 'Bloc Note brut',
  `panier_resultat` longtext COMMENT 'Résultat de la sélection',
  `actif` tinyint(4) default '1' COMMENT '1-> Oui, 2->Non',
  UNIQUE KEY `panier_cleunik` (`panier_cleunik`),
  KEY `_panier_ibfk_1` (`uti_cleunik`),
  KEY `panier_titre` (`panier_titre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Panier';

-- --------------------------------------------------------

--
-- Structure de la table `_panier_resultats`
--

CREATE TABLE IF NOT EXISTS `_panier_resultats` (
  `pr_cleunik` bigint(20) default NULL COMMENT 'Cléunik Résultat de panier',
  `panier_cleunik` bigint(20) default NULL COMMENT 'Panier_cleunik',
  `pr_creation` datetime default NULL COMMENT 'Date de création',
  `pr_modification` datetime default NULL COMMENT 'Date de modification',
  `pr_commentaire` longtext COMMENT 'Commentaire',
  `pr_resultat` longtext COMMENT 'Résultat',
  `pr_designation` varchar(50) default NULL COMMENT 'Désignation courte',
  UNIQUE KEY `pr_cleunik` (`pr_cleunik`),
  KEY `panier_cleunik` (`panier_cleunik`),
  KEY `pr_designation` (`pr_designation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Panier_Resultats';

-- --------------------------------------------------------

--
-- Structure de la table `_param_categories_compta`
--

CREATE TABLE IF NOT EXISTS `_param_categories_compta` (
  `catcompta_cleunik` bigint(20) default NULL COMMENT 'Clé unique catégorie comptable',
  `code` char(1) default NULL COMMENT 'Code catégorie',
  `intitule` varchar(100) default NULL COMMENT 'Intitulé',
  `compte_vente_port` bigint(20) default NULL COMMENT 'Compte d''imputation comptable du port (Ventes)',
  `compte_vente_divers` bigint(20) default NULL COMMENT 'Compte d''imputation comptable des frais divers (Ventes)',
  `compte_achat_port` bigint(20) default NULL COMMENT 'Compte d''imputation comptable du port (Achats)',
  `compte_achat_divers` bigint(20) default NULL COMMENT 'Compte d''imputation comptable des frais divers (Achats)',
  `dateheuremodification` datetime default NULL COMMENT 'Date/heure de modification',
  `dateheurecreation` datetime default NULL COMMENT 'Date/heure de création',
  `journal` bigint(20) default NULL COMMENT 'A préciser ...',
  `taxes_vente_port` bigint(20) default '-1' COMMENT 'Clé unique taxes pour port vendu',
  `taxes_vente_divers` bigint(20) default '-1' COMMENT 'Clé unique taxes pour divers vendu',
  `taxes_achat_port` bigint(20) default '-1' COMMENT 'Clé unique taxes pour port acheté',
  `taxes_achat_divers` bigint(20) default '-1' COMMENT 'Clé unique taxes pour divers acheté',
  UNIQUE KEY `catcompta_cleunik` (`catcompta_cleunik`),
  KEY `_param_categories_compta_ibfk_1` (`compte_vente_port`),
  KEY `_param_categories_compta_ibfk_2` (`compte_vente_divers`),
  KEY `_param_categories_compta_ibfk_3` (`compte_achat_port`),
  KEY `_param_categories_compta_ibfk_4` (`compte_achat_divers`),
  KEY `_param_categories_compta_ibfk_5` (`taxes_vente_port`),
  KEY `_param_categories_compta_ibfk_6` (`taxes_vente_divers`),
  KEY `_param_categories_compta_ibfk_7` (`taxes_achat_port`),
  KEY `_param_categories_compta_ibfk_8` (`taxes_achat_divers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `_param_pc`
--

CREATE TABLE IF NOT EXISTS `_param_pc` (
  `pc_cleunik` bigint(20) default NULL COMMENT 'Clé unique plan comptable',
  `code` varchar(9) default NULL COMMENT 'Numéro de compte comptable',
  `intitule` varchar(100) default NULL COMMENT 'Intitulé',
  `dateheuremodification` datetime default NULL COMMENT 'Date/heure de modification',
  `dateheurecreation` datetime default NULL COMMENT 'Date/heure de création',
  `actif` tinyint(4) default NULL COMMENT 'Code actif',
  UNIQUE KEY `pc_cleunik` (`pc_cleunik`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des comptes comptables';

-- --------------------------------------------------------

--
-- Structure de la table `_param_taxes`
--

CREATE TABLE IF NOT EXISTS `_param_taxes` (
  `taxes_cleunik` bigint(20) default NULL COMMENT 'Clé unique taxe',
  `code` char(1) default NULL COMMENT 'Code taxe',
  `denomination` varchar(100) default NULL COMMENT 'Dénomination',
  `taux` double(15,5) default NULL COMMENT 'Taux de taxe',
  `compte_vente` bigint(20) default NULL COMMENT 'Compte d''imputation comptable (Ventes)',
  `compte_achat` bigint(20) default NULL COMMENT 'Compte d''imputation comptable (Achats)',
  `dateheuremodification` datetime default NULL COMMENT 'Date/heure de modification',
  `dateheurecreation` datetime default NULL COMMENT 'Date/heure de création',
  `actif` tinyint(4) default NULL COMMENT 'Code actif',
  UNIQUE KEY `taxes_cleunik` (`taxes_cleunik`),
  KEY `_param_taxes_ibfk_1` (`compte_vente`),
  KEY `_param_taxes_ibfk_2` (`compte_achat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des taxes';

-- --------------------------------------------------------

--
-- Structure de la table `_param_tpf`
--

CREATE TABLE IF NOT EXISTS `_param_tpf` (
  `tpf_cleunik` bigint(20) default NULL COMMENT 'Clé unique taxe parafiscale',
  `code` varchar(10) default NULL COMMENT 'Code taxe',
  `denomination` varchar(100) default NULL COMMENT 'Dénomination',
  `base` tinyint(4) default '1' COMMENT 'Base 1->Quantité',
  `valeur_base` double(15,5) default NULL COMMENT 'Valeur en fonction de la base',
  `taxes_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxe',
  `compte_vente` bigint(20) default '-1' COMMENT 'Compte d''imputation comptable (Ventes)',
  `compte_achat` bigint(20) default '-1' COMMENT 'Compte d''imputation comptable (Achats)',
  `dateheuremodification` datetime default NULL COMMENT 'Date/heure de modification',
  `dateheurecreation` datetime default NULL COMMENT 'Date/heure de création',
  `actif` tinyint(4) default NULL COMMENT 'Code actif',
  UNIQUE KEY `tpf_cleunik` (`tpf_cleunik`),
  KEY `_param_tpf_ibfk_1` (`compte_vente`),
  KEY `_param_tpf_ibfk_2` (`compte_achat`),
  KEY `_param_tpf_ibfk_3` (`taxes_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des taxes parafiscales';

-- --------------------------------------------------------

--
-- Structure de la table `_recfou_adresses`
--

CREATE TABLE IF NOT EXISTS `_recfou_adresses` (
  `adr_cleunik` bigint(20) default NULL COMMENT 'Clé unique adresse',
  `adr_cod` varchar(15) default NULL COMMENT 'Code adresse',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `adr_nom` varchar(50) default NULL COMMENT 'Nom de la société',
  `adr_complementnom` varchar(50) default NULL COMMENT 'Eventuel complément de nom',
  `adr_ligne1` varchar(50) default NULL COMMENT 'Ligne 1 adresse',
  `adr_ligne2` varchar(50) default NULL COMMENT 'Ligne 2 adresse',
  `adr_ligne3` varchar(50) default NULL COMMENT 'Ligne 3 adresse',
  `adr_cp` varchar(10) default NULL COMMENT 'Code postal',
  `adr_ville` varchar(50) default NULL COMMENT 'Ville',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Pays (Clé unique table choix)',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `adr_latitude` double(9,6) default NULL COMMENT 'Latitude',
  `adr_longitude` double(9,6) default NULL COMMENT 'Longitude',
  `adr_typecoordonnees` bigint(20) default NULL COMMENT 'Type d''adresse',
  `adr_type` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Type d''adresse : 1 france, 2 étranger',
  UNIQUE KEY `adr_cleunik` (`adr_cleunik`),
  KEY `adr_cod` (`adr_cod`),
  KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `adr_typecoordonnees` (`adr_typecoordonnees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses des réceptions fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_recfou_consignes`
--

CREATE TABLE IF NOT EXISTS `_recfou_consignes` (
  `action_consi_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/consigne',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''acteur consignant l''article',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''article consigné',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité',
  `qte_nbdec` tinyint(4) default '0' COMMENT 'Nombre de décimales',
  `qte_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis sur la consigne',
  UNIQUE KEY `_recfou_consignes_ibfk_0` (`action_consi_cleunik`),
  KEY `_recfou_consignes_ibfk_1` (`act_cleunik`),
  KEY `_recfou_consignes_ibfk_2` (`commercial_cleunik`),
  KEY `_recfou_consignes_ibfk_3` (`art_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Consignes liées aux réceptions fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_recfou_entetes`
--

CREATE TABLE IF NOT EXISTS `_recfou_entetes` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `code` varchar(25) default NULL COMMENT 'N° du document',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `blocnotebrut_entete` longtext COMMENT 'Bloc Note entête',
  `reference_acteur` longtext COMMENT 'Référence(s) de la commande chez le client',
  `devise` bigint(20) default NULL COMMENT 'Devise de l''action commerciale',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `escompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''escompte',
  `escompte_type` tinyint(4) default '1' COMMENT '1-> Taux, 2 Montant',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `reg_cleunik` bigint(20) default '-1' COMMENT 'Mode de règlement',
  `blocnotebrut_pied` longtext COMMENT 'Bloc Note pied',
  `rendezvous` longtext COMMENT 'Rendez-vous',
  `modliv` bigint(20) default '-94' COMMENT 'Modalités de livraison',
  `typpor` bigint(20) default '-93' COMMENT 'Type de port',
  `dateheureexpedition` datetime default NULL COMMENT 'Date et heure d''expédition',
  `dateheurelivraison` datetime default NULL COMMENT 'Date et heure de livraison',
  `frais_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `frais_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant des frais',
  `port_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `port_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant du port',
  `acompte_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `acompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''acompte',
  `modliv_bis` bigint(20) default '-94' COMMENT 'Modalités de livraison sur date livraison',
  `assujetti_tpf` tinyint(4) default '1' COMMENT 'Assujetti aux taxes parafiscales 1->Oui (défault),2->Non',
  UNIQUE KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `recfou_entetes_1` (`action_cleunik`),
  KEY `recfou_entetes_2` (`act_cleunik`),
  KEY `recfou_entetes_3` (`devise`),
  KEY `recfou_entetes_4` (`catcompta_cleunik`),
  KEY `recfou_entetes_5` (`reg_cleunik`),
  KEY `recfou_entete_6` (`modliv`),
  KEY `recfou_entete_7` (`typpor`),
  KEY `recfou_entete_8` (`tarif_cleunik`),
  KEY `recfou_entete_9` (`modliv_bis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des entêtes de réceptions fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_recfou_lignes`
--

CREATE TABLE IF NOT EXISTS `_recfou_lignes` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique article',
  `code_interne` varchar(20) default NULL COMMENT 'Code interne',
  `indice_interne` varchar(10) default NULL COMMENT 'Indice interne',
  `mnemotechnique_interne` varchar(20) default NULL COMMENT 'Identification mnémotechnique interne',
  `description_interne` varchar(100) default NULL COMMENT 'Description courte interne',
  `code_acteur` varchar(20) default NULL COMMENT 'Code chez l''acteur',
  `mnemotechnique_acteur` varchar(20) default NULL COMMENT 'Identification mnémotechnique chez lacteur',
  `description_acteur` varchar(100) default NULL COMMENT 'Description courte chez l''acteur',
  `typeligne` varchar(1) default NULL COMMENT 'Type de ligne',
  `pu` decimal(19,4) default NULL COMMENT 'Prix unitaire ou forfait',
  `pu_portee` decimal(19,4) default NULL COMMENT 'Portée du prix unitaire',
  `pu_type` decimal(19,4) default NULL COMMENT 'Type du prix unitaire 1->Prix unitaire,2->Forfait',
  `nbdec_pu` smallint(5) default NULL COMMENT 'Nombre de décimales pour le prix unitaire',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `poidsbrut` decimal(19,4) default NULL COMMENT 'Poids brut',
  `tare` decimal(19,4) default NULL COMMENT 'Tare',
  `poidsnet` decimal(19,4) default NULL COMMENT 'Poids net',
  `devise_taux` double(15,5) default NULL COMMENT 'Taux de la devise (1 pour doc en euros)',
  `pr` decimal(19,4) default NULL COMMENT 'Prix de revient',
  `blocnotebrut` longtext COMMENT 'Bloc note brut',
  `blocnoteriche` longtext COMMENT 'Bloc note riche',
  `devise` bigint(20) default NULL COMMENT 'Devise',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `pc_cleunik` bigint(20) default '-1' COMMENT 'Clé unique plan comptable (vente)',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `coef_facture` tinyint(4) default '1' COMMENT '1-> Facturable,0->Non facturable',
  `taxes_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxes',
  `longueur` decimal(15,4) default '0.0000' COMMENT 'Longueur',
  `largeur` decimal(15,4) default '0.0000' COMMENT 'Largeur',
  `epaisseur` decimal(15,4) default '0.0000' COMMENT 'Epaisseur',
  `unite_longueur` bigint(20) default '-90',
  `tpf_cleunik` bigint(20) default '-1' COMMENT 'Taxe parafiscale',
  `tpf_cleunik_01` bigint(20) default '-1' COMMENT '2° taxe parafiscale',
  UNIQUE KEY `artcleunik` (`commercial_ligne_cleunik`),
  UNIQUE KEY `code_ligne` (`commercial_cleunik`,`ligne_cleunik`),
  KEY `mnemo` (`art_cleunik`),
  KEY `FK_recfou_ligne_3` (`pc_cleunik`),
  KEY `FK_recfou_ligne_4` (`catcompta_cleunik`),
  KEY `FK_recfou_ligne_5` (`devise`),
  KEY `FK_recfou_ligne_6` (`tarif_cleunik`),
  KEY `FK_recfou_ligne_7` (`taxes_cleunik`),
  KEY `_FK_recfou_ligne_8` (`unite_longueur`),
  KEY `_FK_recfou_ligne_9` (`tpf_cleunik`),
  KEY `_fk_recfou_ligne_10` (`tpf_cleunik_01`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes de réceptions fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_recfou_lignes_qte`
--

CREATE TABLE IF NOT EXISTS `_recfou_lignes_qte` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité livrée',
  `qte_unite` bigint(20) default NULL COMMENT 'Unité de la quantité',
  `qte_nbdec` smallint(5) default NULL COMMENT 'Nombre de décimales pour la quantité',
  `dateheure_demande` datetime default NULL COMMENT 'Délai Date/Heure demandé',
  `dateheure_confirm` datetime default NULL COMMENT 'Délai Date/Heure confirmé',
  `statut` bigint(20) default NULL COMMENT 'Statut de la ligne',
  `unite_condi` bigint(20) default '-112' COMMENT 'Unité de conditionnement',
  `qte_condi` decimal(19,4) default NULL COMMENT 'Quantité de conditionnements',
  `nb_stock_in_condi` decimal(15,5) default NULL COMMENT 'Nombre d''unités de stock dans une unité de conditionnement',
  `cdefou_ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité de _cdefou_lignes_qte',
  `mvt_cleunik` bigint(20) default NULL COMMENT 'Clé unique mouvement de stock',
  `choix_depot` bigint(20) default '-15' COMMENT 'Eventuel dépot',
  `choix_empla` bigint(20) default '-16' COMMENT 'Eventuel emplacement',
  `qte_deja` decimal(19,4) default NULL COMMENT 'Quantité déjà livrée ou réceptionnée',
  UNIQUE KEY `code_ligne` (`commercial_ligne_cleunik`,`ligne_cleunik`),
  UNIQUE KEY `uk9` (`ligne_qte_cleunik`),
  KEY `FK_recfou_ligne_qte_2` (`qte_unite`),
  KEY `FK_recfou_ligne_qte_3` (`statut`),
  KEY `FK_recfou_ligne_qte_4` (`unite_condi`),
  KEY `FK_recfou_ligne_qte_5` (`choix_depot`),
  KEY `FK_recfou_ligne_qte_6` (`choix_empla`),
  KEY `ligne_cleunik` (`commercial_ligne_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quantités des lignes de réceptions fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_recfou_representants`
--

CREATE TABLE IF NOT EXISTS `_recfou_representants` (
  `action_rep_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_rep_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant de référence (recfou éventuellement)',
  `act_cleunik_rep` bigint(20) default NULL COMMENT 'Représentant',
  `commission_typ` tinyint(4) default NULL COMMENT 'Type de commission (1->Taux,2-Fixe,3->Mixte)',
  `commission_taux` decimal(15,4) default NULL COMMENT 'Taux de commission',
  `commission_fixe` decimal(15,4) default NULL COMMENT 'Montant fixe de commission',
  `commission_regle` bigint(20) default '1' COMMENT 'Règle de calcul des commission',
  KEY `_recfou_representants_ibfk_1` (`act_cleunik_rep`),
  KEY `_recfou_representants_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Représentants liés aux réceptions fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_recfou_transporteurs`
--

CREATE TABLE IF NOT EXISTS `_recfou_transporteurs` (
  `action_trans_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_trans_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur de référence (recfou éventuellement)',
  `act_cleunik_trans` bigint(20) default NULL COMMENT 'Transporteur',
  `poids_net` decimal(15,4) default NULL COMMENT 'Poids net',
  `poids_bru` decimal(15,4) default NULL COMMENT 'Poids brut',
  `volum_net` decimal(15,4) default NULL COMMENT 'Volume net',
  `volum_bru` decimal(15,4) default NULL COMMENT 'Volume brut',
  `surfa_net` decimal(15,4) default NULL COMMENT 'Surface nette',
  `surfa_bru` decimal(15,4) default NULL COMMENT 'Surface brute',
  `nombre_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis mémorisés',
  UNIQUE KEY `_recfou_transporteur_ibfk_0` (`action_trans_cleunik`),
  KEY `_recfou_transporteur_ibfk_1` (`act_cleunik_trans`),
  KEY `_recfou_transporteur_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transporteurs liés aux réceptions fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_relfou_adresses`
--

CREATE TABLE IF NOT EXISTS `_relfou_adresses` (
  `adr_cleunik` bigint(20) default NULL COMMENT 'Clé unique adresse',
  `adr_cod` varchar(15) default NULL COMMENT 'Code adresse',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `adr_nom` varchar(50) default NULL COMMENT 'Nom de la société',
  `adr_complementnom` varchar(50) default NULL COMMENT 'Eventuel complément de nom',
  `adr_ligne1` varchar(50) default NULL COMMENT 'Ligne 1 adresse',
  `adr_ligne2` varchar(50) default NULL COMMENT 'Ligne 2 adresse',
  `adr_ligne3` varchar(50) default NULL COMMENT 'Ligne 3 adresse',
  `adr_cp` varchar(10) default NULL COMMENT 'Code postal',
  `adr_ville` varchar(50) default NULL COMMENT 'Ville',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Pays (Clé unique table choix)',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `adr_latitude` double(9,6) default NULL COMMENT 'Latitude',
  `adr_longitude` double(9,6) default NULL COMMENT 'Longitude',
  `adr_typecoordonnees` bigint(20) default NULL COMMENT 'Type d''adresse',
  `adr_type` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Type d''adresse : 1 france, 2 étranger',
  UNIQUE KEY `adr_cleunik` (`adr_cleunik`),
  KEY `adr_cod` (`adr_cod`),
  KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `adr_typecoordonnees` (`adr_typecoordonnees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses des relances fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_relfou_entetes`
--

CREATE TABLE IF NOT EXISTS `_relfou_entetes` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `code` varchar(25) default NULL COMMENT 'N° du document',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `blocnotebrut_entete` longtext COMMENT 'Bloc Note entête',
  `reference_acteur` longtext COMMENT 'Référence(s) de la commande chez le client',
  `devise` bigint(20) default NULL COMMENT 'Devise de l''action commerciale',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `escompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''escompte',
  `escompte_type` tinyint(4) default '1' COMMENT '1-> Taux, 2 Montant',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `reg_cleunik` bigint(20) default '-1' COMMENT 'Mode de règlement',
  `blocnotebrut_pied` longtext COMMENT 'Bloc Note pied',
  `rendezvous` longtext COMMENT 'Rendez-vous',
  `modliv` bigint(20) default '-94' COMMENT 'Modalités de livraison',
  `typpor` bigint(20) default '-93' COMMENT 'Type de port',
  `dateheureexpedition` datetime default NULL COMMENT 'Date et heure d''expédition',
  `dateheurelivraison` datetime default NULL COMMENT 'Date et heure de livraison',
  `frais_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `frais_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant des frais',
  `port_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `port_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant du port',
  `acompte_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `acompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''acompte',
  `modliv_bis` bigint(20) default '-94' COMMENT 'Modalités de livraison sur date livraison',
  `assujetti_tpf` tinyint(4) default '1' COMMENT 'Assujetti aux taxes parafiscales 1->Oui (défault),2->Non',
  UNIQUE KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `relfou_entetes_1` (`action_cleunik`),
  KEY `relfou_entetes_2` (`act_cleunik`),
  KEY `relfou_entetes_3` (`devise`),
  KEY `relfou_entetes_4` (`catcompta_cleunik`),
  KEY `relfou_entetes_5` (`reg_cleunik`),
  KEY `relfou_entete_6` (`modliv`),
  KEY `relfou_entete_7` (`typpor`),
  KEY `relfou_entete_8` (`tarif_cleunik`),
  KEY `relfou_entete_9` (`modliv_bis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des entêtes de relances fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_relfou_lignes`
--

CREATE TABLE IF NOT EXISTS `_relfou_lignes` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique article',
  `code_interne` varchar(20) default NULL COMMENT 'Code interne',
  `indice_interne` varchar(10) default NULL COMMENT 'Indice interne',
  `mnemotechnique_interne` varchar(20) default NULL COMMENT 'Identification mnémotechnique interne',
  `description_interne` varchar(100) default NULL COMMENT 'Description courte interne',
  `code_acteur` varchar(20) default NULL COMMENT 'Code chez l''acteur',
  `mnemotechnique_acteur` varchar(20) default NULL COMMENT 'Identification mnémotechnique chez l''acteur',
  `description_acteur` varchar(100) default NULL COMMENT 'Description courte chez l''acteur',
  `typeligne` varchar(1) default NULL COMMENT 'Type de ligne',
  `pu` decimal(19,4) default NULL COMMENT 'Prix unitaire ou forfait',
  `pu_portee` decimal(19,4) default NULL COMMENT 'Portée du prix unitaire',
  `pu_type` decimal(19,4) default NULL COMMENT 'Type du prix unitaire 1->Prix unitaire,2->Forfait',
  `nbdec_pu` smallint(5) default NULL COMMENT 'Nombre de décimales pour le prix unitaire',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `poidsbrut` decimal(19,4) default NULL COMMENT 'Poids brut',
  `tare` decimal(19,4) default NULL COMMENT 'Tare',
  `poidsnet` decimal(19,4) default NULL COMMENT 'Poids net',
  `devise_taux` double(15,5) default NULL COMMENT 'Taux de la devise (1 pour doc en euros)',
  `pr` decimal(19,4) default NULL COMMENT 'Prix de revient',
  `blocnotebrut` longtext COMMENT 'Bloc note brut',
  `blocnoteriche` longtext COMMENT 'Bloc note riche',
  `devise` bigint(20) default NULL COMMENT 'Devise',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `pc_cleunik` bigint(20) default '-1' COMMENT 'Clé unique plan comptable (vente)',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `coef_facture` tinyint(4) default '1' COMMENT '1-> Facturable,0->Non facturable',
  `taxes_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxes',
  `longueur` decimal(15,4) default '0.0000' COMMENT 'Longueur',
  `largeur` decimal(15,4) default '0.0000' COMMENT 'Largeur',
  `epaisseur` decimal(15,4) default '0.0000' COMMENT 'Epaisseur',
  `unite_longueur` bigint(20) default '-90',
  `tpf_cleunik` bigint(20) default '-1' COMMENT 'Taxe parafiscale',
  `tpf_cleunik_01` bigint(20) default '-1' COMMENT '2° taxe parafiscale',
  UNIQUE KEY `artcleunik` (`commercial_ligne_cleunik`),
  UNIQUE KEY `code_ligne` (`commercial_cleunik`,`ligne_cleunik`),
  KEY `mnemo` (`art_cleunik`),
  KEY `FK_relfou_ligne_3` (`pc_cleunik`),
  KEY `FK_relfou_ligne_4` (`catcompta_cleunik`),
  KEY `FK_relfou_ligne_5` (`devise`),
  KEY `FK_relfou_ligne_6` (`tarif_cleunik`),
  KEY `FK_relfou_ligne_7` (`taxes_cleunik`),
  KEY `_FK_relfou_ligne_8` (`unite_longueur`),
  KEY `_FK_relfou_ligne_9` (`tpf_cleunik`),
  KEY `_fk_relfou_ligne_10` (`tpf_cleunik_01`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes de relances fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_relfou_lignes_qte`
--

CREATE TABLE IF NOT EXISTS `_relfou_lignes_qte` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité livrée',
  `qte_unite` bigint(20) default NULL COMMENT 'Unité de la quantité',
  `qte_nbdec` smallint(5) default NULL COMMENT 'Nombre de décimales pour la quantité',
  `dateheure_demande` datetime default NULL COMMENT 'Délai Date/Heure demandé',
  `dateheure_confirm` datetime default NULL COMMENT 'Délai Date/Heure confirmé',
  `statut` bigint(20) default NULL COMMENT 'Statut de la ligne',
  `unite_condi` bigint(20) default '-112' COMMENT 'Unité de conditionnement',
  `qte_condi` decimal(19,4) default NULL COMMENT 'Quantité de conditionnements',
  `nb_stock_in_condi` decimal(15,5) default NULL COMMENT 'Nombre d''unités de stock dans une unité de conditionnement',
  `cdefou_ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité de _cdefou_lignes_qte',
  `mvt_cleunik` bigint(20) default NULL COMMENT 'Clé unique mouvement de stock',
  `choix_depot` bigint(20) default '-15' COMMENT 'Eventuel dépot',
  `choix_empla` bigint(20) default '-16' COMMENT 'Eventuel emplacement',
  `qte_deja` decimal(19,4) default NULL COMMENT 'Quantité déjà livrée ou réceptionnée',
  UNIQUE KEY `code_ligne` (`commercial_ligne_cleunik`,`ligne_cleunik`),
  UNIQUE KEY `uk9` (`ligne_qte_cleunik`),
  KEY `FK_relfou_ligne_qte_2` (`qte_unite`),
  KEY `FK_relfou_ligne_qte_3` (`statut`),
  KEY `FK_relfou_ligne_qte_4` (`unite_condi`),
  KEY `FK_relfou_ligne_qte_5` (`choix_depot`),
  KEY `FK_relfou_ligne_qte_6` (`choix_empla`),
  KEY `ligne_cleunik` (`commercial_ligne_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quantités des lignes de relance fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_retcli_adresses`
--

CREATE TABLE IF NOT EXISTS `_retcli_adresses` (
  `adr_cleunik` bigint(20) default NULL COMMENT 'Clé unique adresse',
  `adr_cod` varchar(15) default NULL COMMENT 'Code adresse',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `adr_nom` varchar(50) default NULL COMMENT 'Nom de la société',
  `adr_complementnom` varchar(50) default NULL COMMENT 'Eventuel complément de nom',
  `adr_ligne1` varchar(50) default NULL COMMENT 'Ligne 1 adresse',
  `adr_ligne2` varchar(50) default NULL COMMENT 'Ligne 2 adresse',
  `adr_ligne3` varchar(50) default NULL COMMENT 'Ligne 3 adresse',
  `adr_cp` varchar(10) default NULL COMMENT 'Code postal',
  `adr_ville` varchar(50) default NULL COMMENT 'Ville',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Pays (Clé unique table choix)',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `adr_latitude` double(9,6) default NULL COMMENT 'Latitude',
  `adr_longitude` double(9,6) default NULL COMMENT 'Longitude',
  `adr_typecoordonnees` bigint(20) default NULL COMMENT 'Type d''adresse',
  `adr_type` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Type d''adresse : 1 france, 2 étranger',
  UNIQUE KEY `adr_cleunik` (`adr_cleunik`),
  KEY `adr_cod` (`adr_cod`),
  KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `adr_typecoordonnees` (`adr_typecoordonnees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses des retours clients';

-- --------------------------------------------------------

--
-- Structure de la table `_retcli_consignes`
--

CREATE TABLE IF NOT EXISTS `_retcli_consignes` (
  `action_consi_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/consigne',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''acteur consignant l''article',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''article consigné',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité',
  `qte_nbdec` tinyint(4) default '0' COMMENT 'Nombre de décimales',
  `qte_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis sur la consigne',
  UNIQUE KEY `_retcli_consignes_ibfk_0` (`action_consi_cleunik`),
  KEY `_retcli_consignes_ibfk_1` (`act_cleunik`),
  KEY `_retcli_consignes_ibfk_2` (`commercial_cleunik`),
  KEY `_retcli_consignes_ibfk_3` (`art_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Consignes liées aux retours clients';

-- --------------------------------------------------------

--
-- Structure de la table `_retcli_entetes`
--

CREATE TABLE IF NOT EXISTS `_retcli_entetes` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `code` varchar(25) default NULL COMMENT 'N° du document',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `blocnotebrut_entete` longtext COMMENT 'Bloc Note entête',
  `reference_acteur` longtext COMMENT 'Référence(s) de la commande chez le client',
  `devise` bigint(20) default NULL COMMENT 'Devise de l''action commerciale',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `escompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''escompte',
  `escompte_type` tinyint(4) default '1' COMMENT '1-> Taux, 2 Montant',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `reg_cleunik` bigint(20) default '-1' COMMENT 'Mode de règlement',
  `blocnotebrut_pied` longtext COMMENT 'Bloc Note pied',
  `rendezvous` longtext COMMENT 'Rendez-vous',
  `modliv` bigint(20) default '-94' COMMENT 'Modalités de retour',
  `typpor` bigint(20) default '-93' COMMENT 'Type de port',
  `dateheureexpedition` datetime default NULL COMMENT 'Date et heure d''expédition',
  `dateheurelivraison` datetime default NULL COMMENT 'Date heure de retour',
  `frais_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `frais_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant des frais',
  `port_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `port_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant du port',
  `acompte_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `acompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''acompte',
  `modliv_bis` bigint(20) default '-94' COMMENT 'Modalités de retour sur date retour',
  `assujetti_tpf` tinyint(4) default '1' COMMENT 'Assujetti aux taxes parafiscales 1->Oui (défault),2->Non',
  UNIQUE KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `retcli_entetes_1` (`action_cleunik`),
  KEY `retcli_entetes_2` (`act_cleunik`),
  KEY `retcli_entetes_3` (`devise`),
  KEY `retcli_entetes_4` (`catcompta_cleunik`),
  KEY `retcli_entetes_5` (`reg_cleunik`),
  KEY `retcli_entete_6` (`modliv`),
  KEY `retcli_entete_7` (`typpor`),
  KEY `retcli_entete_8` (`tarif_cleunik`),
  KEY `retcli_entete_9` (`modliv_bis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des entêtes de retour clients';

-- --------------------------------------------------------

--
-- Structure de la table `_retcli_lignes`
--

CREATE TABLE IF NOT EXISTS `_retcli_lignes` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique article',
  `code_interne` varchar(20) default NULL COMMENT 'Code interne',
  `indice_interne` varchar(10) default NULL COMMENT 'Indice interne',
  `mnemotechnique_interne` varchar(20) default NULL COMMENT 'Identification mnémotechnique interne',
  `description_interne` varchar(100) default NULL COMMENT 'Description courte interne',
  `code_acteur` varchar(20) default NULL COMMENT 'Code chez l''acteur',
  `mnemotechnique_acteur` varchar(20) default NULL COMMENT 'Identification mnémotechnique chez lacteur',
  `description_acteur` varchar(100) default NULL COMMENT 'Description courte chez l''acteur',
  `typeligne` varchar(1) default NULL COMMENT 'Type de ligne',
  `pu` decimal(19,4) default NULL COMMENT 'Prix unitaire ou forfait',
  `pu_portee` decimal(19,4) default NULL COMMENT 'Portée du prix unitaire',
  `pu_type` decimal(19,4) default NULL COMMENT 'Type du prix unitaire 1->Prix unitaire,2->Forfait',
  `nbdec_pu` smallint(5) default NULL COMMENT 'Nombre de décimales pour le prix unitaire',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `poidsbrut` decimal(19,4) default NULL COMMENT 'Poids brut',
  `tare` decimal(19,4) default NULL COMMENT 'Tare',
  `poidsnet` decimal(19,4) default NULL COMMENT 'Poids net',
  `devise_taux` double(15,5) default NULL COMMENT 'Taux de la devise (1 pour doc en euros)',
  `pr` decimal(19,4) default NULL COMMENT 'Prix de revient',
  `blocnotebrut` longtext COMMENT 'Bloc note brut',
  `blocnoteriche` longtext COMMENT 'Bloc note riche',
  `devise` bigint(20) default NULL COMMENT 'Devise',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `pc_cleunik` bigint(20) default '-1' COMMENT 'Clé unique plan comptable (vente)',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `coef_facture` tinyint(4) default '1' COMMENT '1-> Facturable,0->Non facturable',
  `taxes_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxes',
  `longueur` decimal(15,4) default '0.0000' COMMENT 'Longueur',
  `largeur` decimal(15,4) default '0.0000' COMMENT 'Largeur',
  `epaisseur` decimal(15,4) default '0.0000' COMMENT 'Epaisseur',
  `unite_longueur` bigint(20) default '-90',
  `tpf_cleunik` bigint(20) default '-1' COMMENT 'Taxe parafiscale',
  `tpf_cleunik_01` bigint(20) default '-1' COMMENT '2° taxe parafiscale',
  UNIQUE KEY `artcleunik` (`commercial_ligne_cleunik`),
  UNIQUE KEY `code_ligne` (`commercial_cleunik`,`ligne_cleunik`),
  KEY `mnemo` (`art_cleunik`),
  KEY `FK_retcli_ligne_3` (`pc_cleunik`),
  KEY `FK_retcli_ligne_4` (`catcompta_cleunik`),
  KEY `FK_retcli_ligne_5` (`devise`),
  KEY `FK_retcli_ligne_6` (`tarif_cleunik`),
  KEY `FK_retcli_ligne_7` (`taxes_cleunik`),
  KEY `_FK_retcli_ligne_8` (`unite_longueur`),
  KEY `_FK_retcli_ligne_9` (`tpf_cleunik`),
  KEY `_fk_retcli_ligne_10` (`tpf_cleunik_01`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes de retour clients';

-- --------------------------------------------------------

--
-- Structure de la table `_retcli_lignes_qte`
--

CREATE TABLE IF NOT EXISTS `_retcli_lignes_qte` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité livrée',
  `qte_unite` bigint(20) default NULL COMMENT 'Unité de la quantité',
  `qte_nbdec` smallint(5) default NULL COMMENT 'Nombre de décimales pour la quantité',
  `dateheure_demande` datetime default NULL COMMENT 'Délai Date/Heure demandé',
  `dateheure_confirm` datetime default NULL COMMENT 'Délai Date/Heure confirmé',
  `statut` bigint(20) default NULL COMMENT 'Statut de la ligne',
  `unite_condi` bigint(20) default NULL COMMENT 'Unité de conditionnement',
  `qte_condi` decimal(19,4) default NULL COMMENT 'Quantité de conditionnements',
  `nb_stock_in_condi` decimal(15,5) default NULL COMMENT 'Nombre d''unités de stock dans une unité de conditionnement',
  `cdecli_ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité de _cdecli_lignes_qte',
  `mvt_cleunik` bigint(20) default NULL COMMENT 'Clé unique mouvement de stock',
  `choix_depot` bigint(20) default '-15' COMMENT 'Eventuel dépot',
  `choix_empla` bigint(20) default '-16' COMMENT 'Eventuel emplacement',
  `qte_deja` decimal(19,4) default NULL COMMENT 'Quantité déjà livrée ou réceptionnée',
  UNIQUE KEY `code_ligne` (`commercial_ligne_cleunik`,`ligne_cleunik`),
  UNIQUE KEY `uk9` (`ligne_qte_cleunik`),
  KEY `FK_retcli_ligne_qte_2` (`qte_unite`),
  KEY `FK_retcli_ligne_qte_3` (`statut`),
  KEY `FK_retcli_ligne_qte_4` (`unite_condi`),
  KEY `FK_retcli_ligne_qte_5` (`choix_depot`),
  KEY `FK_retcli_ligne_qte_6` (`choix_empla`),
  KEY `ligne_cleunik` (`commercial_ligne_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quantités des lignes de retour clients';

-- --------------------------------------------------------

--
-- Structure de la table `_retcli_representants`
--

CREATE TABLE IF NOT EXISTS `_retcli_representants` (
  `action_rep_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_rep_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant de référence (retcli éventuellement)',
  `act_cleunik_rep` bigint(20) default NULL COMMENT 'Représentant',
  `commission_typ` tinyint(4) default NULL COMMENT 'Type de commission (1->Taux,2-Fixe,3->Mixte)',
  `commission_taux` decimal(15,4) default NULL COMMENT 'Taux de commission',
  `commission_fixe` decimal(15,4) default NULL COMMENT 'Montant fixe de commission',
  `commission_regle` bigint(20) default '1' COMMENT 'Règle de calcul des commission',
  KEY `_retcli_representants_ibfk_1` (`act_cleunik_rep`),
  KEY `_retcli_representants_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Représentants liés aux retours clients';

-- --------------------------------------------------------

--
-- Structure de la table `_retcli_transporteurs`
--

CREATE TABLE IF NOT EXISTS `_retcli_transporteurs` (
  `action_trans_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_trans_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur de référence (retcli éventuellement)',
  `act_cleunik_trans` bigint(20) default NULL COMMENT 'Transporteur',
  `poids_net` decimal(15,4) default NULL COMMENT 'Poids net',
  `poids_bru` decimal(15,4) default NULL COMMENT 'Poids brut',
  `volum_net` decimal(15,4) default NULL COMMENT 'Volume net',
  `volum_bru` decimal(15,4) default NULL COMMENT 'Volume brut',
  `surfa_net` decimal(15,4) default NULL COMMENT 'Surface nette',
  `surfa_bru` decimal(15,4) default NULL COMMENT 'Surface brute',
  `nombre_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis mémorisés',
  UNIQUE KEY `_retcli_transporteur_ibfk_0` (`action_trans_cleunik`),
  KEY `_retcli_transporteur_ibfk_1` (`act_cleunik_trans`),
  KEY `_retcli_transporteur_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transporteurs liés aux retours clients';

-- --------------------------------------------------------

--
-- Structure de la table `_retfou_adresses`
--

CREATE TABLE IF NOT EXISTS `_retfou_adresses` (
  `adr_cleunik` bigint(20) default NULL COMMENT 'Clé unique adresse',
  `adr_cod` varchar(15) default NULL COMMENT 'Code adresse',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `adr_nom` varchar(50) default NULL COMMENT 'Nom de la société',
  `adr_complementnom` varchar(50) default NULL COMMENT 'Eventuel complément de nom',
  `adr_ligne1` varchar(50) default NULL COMMENT 'Ligne 1 adresse',
  `adr_ligne2` varchar(50) default NULL COMMENT 'Ligne 2 adresse',
  `adr_ligne3` varchar(50) default NULL COMMENT 'Ligne 3 adresse',
  `adr_cp` varchar(10) default NULL COMMENT 'Code postal',
  `adr_ville` varchar(50) default NULL COMMENT 'Ville',
  `choix_cleunik` bigint(20) default NULL COMMENT 'Pays (Clé unique table choix)',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `adr_latitude` double(9,6) default NULL COMMENT 'Latitude',
  `adr_longitude` double(9,6) default NULL COMMENT 'Longitude',
  `adr_typecoordonnees` bigint(20) default NULL COMMENT 'Type d''adresse',
  `adr_type` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Type d''adresse : 1 france, 2 étranger',
  UNIQUE KEY `adr_cleunik` (`adr_cleunik`),
  KEY `adr_cod` (`adr_cod`),
  KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `choix_cleunik` (`choix_cleunik`),
  KEY `adr_typecoordonnees` (`adr_typecoordonnees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresses des retours fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_retfou_consignes`
--

CREATE TABLE IF NOT EXISTS `_retfou_consignes` (
  `action_consi_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/consigne',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''acteur consignant l''article',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique de l''article consigné',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité',
  `qte_nbdec` tinyint(4) default '0' COMMENT 'Nombre de décimales',
  `qte_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis sur la consigne',
  UNIQUE KEY `_retfou_consignes_ibfk_0` (`action_consi_cleunik`),
  KEY `_retfou_consignes_ibfk_1` (`act_cleunik`),
  KEY `_retfou_consignes_ibfk_2` (`commercial_cleunik`),
  KEY `_retfou_consignes_ibfk_3` (`art_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Consignes liées aux retours fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_retfou_entetes`
--

CREATE TABLE IF NOT EXISTS `_retfou_entetes` (
  `action_cleunik` bigint(20) default NULL COMMENT 'Action_cleunik',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `code` varchar(25) default NULL COMMENT 'N° du document',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé unique acteur',
  `blocnotebrut_entete` longtext COMMENT 'Bloc Note entête',
  `reference_acteur` longtext COMMENT 'Référence(s) de la commande chez le fournisseur',
  `devise` bigint(20) default NULL COMMENT 'Devise de l''action commerciale',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `escompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''escompte',
  `escompte_type` tinyint(4) default '1' COMMENT '1-> Taux, 2 Montant',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `reg_cleunik` bigint(20) default '-1' COMMENT 'Mode de règlement',
  `blocnotebrut_pied` longtext COMMENT 'Bloc Note pied',
  `rendezvous` longtext COMMENT 'Rendez-vous',
  `modliv` bigint(20) default '-94' COMMENT 'Modalités de retour',
  `typpor` bigint(20) default '-93' COMMENT 'Type de port',
  `dateheureexpedition` datetime default NULL COMMENT 'Date et heure d''expédition',
  `dateheurelivraison` datetime default NULL COMMENT 'Date heure de retour',
  `frais_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `frais_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant des frais',
  `port_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `port_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant du port',
  `acompte_type` tinyint(4) default '2' COMMENT '1-> Taux,2->Montant',
  `acompte_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de l''acompte',
  `modliv_bis` bigint(20) default '-94' COMMENT 'Modalités de retour sur date retour',
  `assujetti_tpf` tinyint(4) default '1' COMMENT 'Assujetti aux taxes parafiscales 1->Oui (défault),2->Non',
  UNIQUE KEY `commercial_cleunik` (`commercial_cleunik`),
  KEY `retfou_entetes_1` (`action_cleunik`),
  KEY `retfou_entetes_2` (`act_cleunik`),
  KEY `retfou_entetes_3` (`devise`),
  KEY `retfou_entetes_4` (`catcompta_cleunik`),
  KEY `retfou_entetes_5` (`reg_cleunik`),
  KEY `retfou_entete_6` (`modliv`),
  KEY `retfou_entete_7` (`typpor`),
  KEY `retfou_entete_8` (`tarif_cleunik`),
  KEY `retfou_entete_9` (`modliv_bis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des entêtes de retour fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_retfou_lignes`
--

CREATE TABLE IF NOT EXISTS `_retfou_lignes` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `art_cleunik` bigint(20) default NULL COMMENT 'Clé unique article',
  `code_interne` varchar(20) default NULL COMMENT 'Code interne',
  `indice_interne` varchar(10) default NULL COMMENT 'Indice interne',
  `mnemotechnique_interne` varchar(20) default NULL COMMENT 'Identification mnémotechnique interne',
  `description_interne` varchar(100) default NULL COMMENT 'Description courte interne',
  `code_acteur` varchar(20) default NULL COMMENT 'Code chez l''acteur',
  `mnemotechnique_acteur` varchar(20) default NULL COMMENT 'Identification mnémotechnique chez lacteur',
  `description_acteur` varchar(100) default NULL COMMENT 'Description courte chez l''acteur',
  `typeligne` varchar(1) default NULL COMMENT 'Type de ligne',
  `pu` decimal(19,4) default NULL COMMENT 'Prix unitaire ou forfait',
  `pu_portee` decimal(19,4) default NULL COMMENT 'Portée du prix unitaire',
  `pu_type` decimal(19,4) default NULL COMMENT 'Type du prix unitaire 1->Prix unitaire,2->Forfait',
  `nbdec_pu` smallint(5) default NULL COMMENT 'Nombre de décimales pour le prix unitaire',
  `tarif_cleunik` bigint(20) default NULL COMMENT 'Tarif préférentiel',
  `remise_taux` decimal(15,4) default NULL COMMENT 'Taux ou montant de remise',
  `remise_type` tinyint(4) default '1' COMMENT '1-> Taux,2-> Montant, 3-> arrondi dizaine de décime inférieure,4-> arrondi unité inférieure,5-> arrondi dizaine inférieure,6-> arrondi centaine inferieure',
  `remise_genr` tinyint(4) default '1' COMMENT '1-> Ligne,2-> Total',
  `poidsbrut` decimal(19,4) default NULL COMMENT 'Poids brut',
  `tare` decimal(19,4) default NULL COMMENT 'Tare',
  `poidsnet` decimal(19,4) default NULL COMMENT 'Poids net',
  `devise_taux` double(15,5) default NULL COMMENT 'Taux de la devise (1 pour doc en euros)',
  `pr` decimal(19,4) default NULL COMMENT 'Prix de revient',
  `blocnotebrut` longtext COMMENT 'Bloc note brut',
  `blocnoteriche` longtext COMMENT 'Bloc note riche',
  `devise` bigint(20) default NULL COMMENT 'Devise',
  `catcompta_cleunik` bigint(20) default '-1' COMMENT 'Clé unique catégorie comptable',
  `pc_cleunik` bigint(20) default '-1' COMMENT 'Clé unique plan comptable (vente)',
  `remise_natu` tinyint(4) default '1' COMMENT '1-> Remise,2->Hausse',
  `coef_facture` tinyint(4) default '1' COMMENT '1-> Facturable,0->Non facturable',
  `taxes_cleunik` bigint(20) default '-1' COMMENT 'Clé unique taxes',
  `longueur` decimal(15,4) default '0.0000' COMMENT 'Longueur',
  `largeur` decimal(15,4) default '0.0000' COMMENT 'Largeur',
  `epaisseur` decimal(15,4) default '0.0000' COMMENT 'Epaisseur',
  `unite_longueur` bigint(20) default '-90',
  `tpf_cleunik` bigint(20) default '-1' COMMENT 'Taxe parafiscale',
  `tpf_cleunik_01` bigint(20) default '-1' COMMENT '2° taxe parafiscale',
  UNIQUE KEY `artcleunik` (`commercial_ligne_cleunik`),
  UNIQUE KEY `code_ligne` (`commercial_cleunik`,`ligne_cleunik`),
  KEY `mnemo` (`art_cleunik`),
  KEY `FK_retfou_ligne_3` (`pc_cleunik`),
  KEY `FK_retfou_ligne_4` (`catcompta_cleunik`),
  KEY `FK_retfou_ligne_5` (`devise`),
  KEY `FK_retfou_ligne_6` (`tarif_cleunik`),
  KEY `FK_retfou_ligne_7` (`taxes_cleunik`),
  KEY `_FK_retfou_ligne_8` (`unite_longueur`),
  KEY `_FK_retfou_ligne_9` (`tpf_cleunik`),
  KEY `_fk_retfou_ligne_10` (`tpf_cleunik_01`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lignes de retour fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_retfou_lignes_qte`
--

CREATE TABLE IF NOT EXISTS `_retfou_lignes_qte` (
  `commercial_ligne_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne action commerciale',
  `ligne_cleunik` smallint(5) default NULL COMMENT 'Ligne',
  `ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité',
  `qte` decimal(19,4) default NULL COMMENT 'Quantité livrée',
  `qte_unite` bigint(20) default NULL COMMENT 'Unité de la quantité',
  `qte_nbdec` smallint(5) default NULL COMMENT 'Nombre de décimales pour la quantité',
  `dateheure_demande` datetime default NULL COMMENT 'Délai Date/Heure demandé',
  `dateheure_confirm` datetime default NULL COMMENT 'Délai Date/Heure confirmé',
  `statut` bigint(20) default NULL COMMENT 'Statut de la ligne',
  `unite_condi` bigint(20) default NULL COMMENT 'Unité de conditionnement',
  `qte_condi` decimal(19,4) default NULL COMMENT 'Quantité de conditionnements',
  `nb_stock_in_condi` decimal(15,5) default NULL COMMENT 'Nombre d''unités de stock dans une unité de conditionnement',
  `cdefou_ligne_qte_cleunik` bigint(20) default NULL COMMENT 'Clé unique ligne quantité de _cdefou_lignes_qte',
  `mvt_cleunik` bigint(20) default NULL COMMENT 'Clé unique mouvement de stock',
  `choix_depot` bigint(20) default '-15' COMMENT 'Eventuel dépot',
  `choix_empla` bigint(20) default '-16' COMMENT 'Eventuel emplacement',
  `qte_deja` decimal(19,4) default NULL COMMENT 'Quantité déjà livrée ou réceptionnée',
  UNIQUE KEY `code_ligne` (`commercial_ligne_cleunik`,`ligne_cleunik`),
  UNIQUE KEY `uk9` (`ligne_qte_cleunik`),
  KEY `FK_retfou_ligne_qte_2` (`qte_unite`),
  KEY `FK_retfou_ligne_qte_3` (`statut`),
  KEY `FK_retfou_ligne_qte_4` (`unite_condi`),
  KEY `FK_retfou_ligne_qte_5` (`choix_depot`),
  KEY `FK_retfou_ligne_qte_6` (`choix_empla`),
  KEY `ligne_cleunik` (`commercial_ligne_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quantités des lignes de retour fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_retfou_representants`
--

CREATE TABLE IF NOT EXISTS `_retfou_representants` (
  `action_rep_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_rep_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/représentant de référence (retfou éventuellement)',
  `act_cleunik_rep` bigint(20) default NULL COMMENT 'Représentant',
  `commission_typ` tinyint(4) default NULL COMMENT 'Type de commission (1->Taux,2-Fixe,3->Mixte)',
  `commission_taux` decimal(15,4) default NULL COMMENT 'Taux de commission',
  `commission_fixe` decimal(15,4) default NULL COMMENT 'Montant fixe de commission',
  `commission_regle` bigint(20) default '1' COMMENT 'Règle de calcul des commission',
  KEY `_retfou_representants_ibfk_1` (`act_cleunik_rep`),
  KEY `_retfou_representants_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Représentants liés aux retours fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_retfou_transporteurs`
--

CREATE TABLE IF NOT EXISTS `_retfou_transporteurs` (
  `action_trans_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur',
  `commercial_cleunik` bigint(20) default NULL COMMENT 'Clé unique action commerciale',
  `action_trans_cleunik_reference` bigint(20) default NULL COMMENT 'Clé unique action commerciale/transporteur de référence (retfou éventuellement)',
  `act_cleunik_trans` bigint(20) default NULL COMMENT 'Transporteur',
  `poids_net` decimal(15,4) default NULL COMMENT 'Poids net',
  `poids_bru` decimal(15,4) default NULL COMMENT 'Poids brut',
  `volum_net` decimal(15,4) default NULL COMMENT 'Volume net',
  `volum_bru` decimal(15,4) default NULL COMMENT 'Volume brut',
  `surfa_net` decimal(15,4) default NULL COMMENT 'Surface nette',
  `surfa_bru` decimal(15,4) default NULL COMMENT 'Surface brute',
  `nombre_colis` decimal(15,4) default '-1.0000' COMMENT 'Nombre de colis mémorisés',
  UNIQUE KEY `_retfou_transporteur_ibfk_0` (`action_trans_cleunik`),
  KEY `_retfou_transporteur_ibfk_1` (`act_cleunik_trans`),
  KEY `_retfou_transporteur_ibfk_2` (`commercial_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transporteurs liés aux retours fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_temp_stat_01`
--

CREATE TABLE IF NOT EXISTS `_temp_stat_01` (
  `cleunik_reference` bigint(20) default NULL COMMENT 'cleunik acteur, article ...',
  `c_uuid` varchar(40) default NULL COMMENT 'Identifiant unique',
  `dateheure` datetime default NULL COMMENT 'Date et heure',
  `montant` decimal(19,4) default NULL COMMENT 'Montant stat',
  `cleunik_reference_autre` bigint(20) default NULL COMMENT 'Deuxieme cleunik de référence',
  KEY `c_uuid` (`c_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Fichier temporaire pour stats';

-- --------------------------------------------------------

--
-- Structure de la table `_treso_banque`
--

CREATE TABLE IF NOT EXISTS `_treso_banque` (
  `banque_cleunik` bigint(20) default NULL COMMENT 'Clé Unique',
  `code` varchar(4) default NULL COMMENT 'Code de la banque',
  `nom` varchar(30) default NULL COMMENT 'Nom de la banque',
  UNIQUE KEY `banque_cleunik` (`banque_cleunik`),
  UNIQUE KEY `code` (`code`),
  KEY `nom` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Banques';

-- --------------------------------------------------------

--
-- Structure de la table `_treso_journal`
--

CREATE TABLE IF NOT EXISTS `_treso_journal` (
  `journal_cleunik` bigint(20) default NULL COMMENT 'Clé Unique journal',
  `code` varchar(5) default NULL COMMENT 'Code',
  `nom` varchar(50) default NULL COMMENT 'Nom',
  `type` varchar(1) default NULL COMMENT 'Type T-> Trésorerie',
  `caisse_oui_non` tinyint(1) NOT NULL COMMENT 'Journal de caisse oui ou non ',
  `domiciliation` varchar(25) default NULL COMMENT 'Domiciliation',
  `etablissement` varchar(5) default NULL COMMENT 'Code Etablissement',
  `guichet` varchar(5) default NULL COMMENT 'Code guichet',
  `compte` varchar(11) default NULL COMMENT 'Numéro de compte',
  `cle` varchar(2) default NULL COMMENT 'Clé de contrôle',
  `compte_comptable` bigint(20) default NULL COMMENT 'Compte d''imputation comptable',
  UNIQUE KEY `journal_cleunik` (`journal_cleunik`),
  UNIQUE KEY `code` (`code`),
  KEY `nom` (`nom`),
  KEY `type_nom` (`type`,`nom`),
  KEY `_treso_journal_ibfk_1` (`compte_comptable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Journaux comptable';

-- --------------------------------------------------------

--
-- Structure de la table `_treso_reglement_cli`
--

CREATE TABLE IF NOT EXISTS `_treso_reglement_cli` (
  `reglement_cleunik` bigint(20) default NULL COMMENT 'Clé Unique réglement',
  `journal_cleunik` bigint(20) default NULL COMMENT 'Clé Unique journal',
  `pc_cleunik` bigint(20) default NULL COMMENT 'Clé unique compte comptable acteur',
  `mode_paiement` bigint(20) default NULL COMMENT 'Mode de paiement',
  `piece` varchar(20) default NULL COMMENT 'N° de pièce',
  `ref_piece` varchar(60) default NULL COMMENT 'Référence de la pièce',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de création',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheurereglemen` datetime default NULL COMMENT 'Date/Heure de réglement',
  `montant_paye` decimal(19,4) default NULL COMMENT 'Montant du réglement affecté à la facture',
  `montant_pointe` decimal(19,4) default NULL COMMENT 'Montant correspondant à la facture',
  `devise_paye` bigint(20) default NULL COMMENT 'Devise du montant payé',
  `coef` tinyint(1) NOT NULL COMMENT 'Avoir -> -1, Facture -> 1',
  `acompte` tinyint(1) NOT NULL COMMENT 'Acompte 1-> oui, 2 -> non',
  `transfert` tinyint(1) NOT NULL COMMENT 'Transfert 1-> oui, 2 -> non',
  `impaye` tinyint(1) NOT NULL COMMENT 'Impayé 1-> oui, 2 -> non',
  `remboursement` tinyint(1) NOT NULL COMMENT 'Remboursement 1-> oui, 2 -> non',
  `option_remise` bigint(20) default NULL COMMENT 'Option remise',
  `accepte` tinyint(1) NOT NULL COMMENT 'Accepté 1-> oui, 2 -> non',
  `banque` varchar(50) default NULL COMMENT 'Nom de la banque',
  `domiciliation` varchar(25) default NULL COMMENT 'Domiciliation',
  `etablissement` varchar(5) default NULL COMMENT 'Code Etablissement',
  `guichet` varchar(5) default NULL COMMENT 'Code guichet',
  `compte` varchar(11) default NULL COMMENT 'Numéro de compte',
  `cle` varchar(2) default NULL COMMENT 'Clé de contrôle',
  `type_ecart` bigint(20) default NULL COMMENT 'Type de lécart',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  UNIQUE KEY `_treso_reglement_cli_0` (`reglement_cleunik`),
  KEY `_treso_reglement_cli_1` (`journal_cleunik`),
  KEY `_treso_reglement_cli_2` (`pc_cleunik`),
  KEY `_treso_reglement_cli_3` (`mode_paiement`),
  KEY `_treso_reglement_cli_4` (`devise_paye`),
  KEY `_treso_reglement_cli_5` (`option_remise`),
  KEY `_treso_reglement_cli_6` (`type_ecart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des règlements des factures clients';

-- --------------------------------------------------------

--
-- Structure de la table `_treso_reglement_cli_detail`
--

CREATE TABLE IF NOT EXISTS `_treso_reglement_cli_detail` (
  `reglement_cleunik` bigint(20) default NULL COMMENT 'Clé Unique réglement',
  `echeance_cleunik` bigint(20) default NULL COMMENT 'Clé unique echéance',
  `pourcentage_paye` decimal(19,4) default NULL COMMENT 'Pourcentage du réglement affecté à la facture',
  `montant_paye` decimal(19,4) default NULL COMMENT 'Montant du réglement affecté à la facture',
  `montant_pointe` decimal(19,4) default NULL COMMENT 'Montant correspondant à la facture',
  `devise_paye` bigint(20) default NULL COMMENT 'Devise du montant payé',
  `coef` tinyint(1) NOT NULL COMMENT 'Avoir -> -1, Facture -> 1',
  KEY `_treso_reglement_cli_detail_1` (`reglement_cleunik`),
  KEY `_treso_reglement_cli_detail_2` (`echeance_cleunik`),
  KEY `_treso_reglement_cli_detail_3` (`devise_paye`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des détails règlements des factures clients';

-- --------------------------------------------------------

--
-- Structure de la table `_treso_reglement_cli_remise`
--

CREATE TABLE IF NOT EXISTS `_treso_reglement_cli_remise` (
  `reglement_cleunik` bigint(20) default NULL COMMENT 'Clé Unique réglement',
  `remise_cleunik` bigint(20) default NULL COMMENT 'Clé unique remise',
  KEY `_treso_reglement_cli_remise_1` (`reglement_cleunik`),
  KEY `_treso_reglement_cli_remise_2` (`remise_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des remises de règlements';

-- --------------------------------------------------------

--
-- Structure de la table `_treso_reglement_fou`
--

CREATE TABLE IF NOT EXISTS `_treso_reglement_fou` (
  `reglement_cleunik` bigint(20) default NULL COMMENT 'Clé Unique réglement',
  `journal_cleunik` bigint(20) default NULL COMMENT 'Clé Unique journal',
  `pc_cleunik` bigint(20) default NULL COMMENT 'Clé unique compte comptable acteur',
  `mode_paiement` bigint(20) default NULL COMMENT 'Mode de paiement',
  `piece` varchar(20) default NULL COMMENT 'N° de pièce',
  `ref_piece` varchar(60) default NULL COMMENT 'Référence de la pièce',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de création',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheurereglemen` datetime default NULL COMMENT 'Date/Heure de réglement',
  `montant_paye` decimal(19,4) default NULL COMMENT 'Montant du réglement affecté à la facture',
  `montant_pointe` decimal(19,4) default NULL COMMENT 'Montant correspondant à la facture',
  `devise_paye` bigint(20) default NULL COMMENT 'Devise du montant payé',
  `coef` tinyint(1) NOT NULL COMMENT 'Avoir -> -1, Facture -> 1',
  `acompte` tinyint(1) NOT NULL COMMENT 'Acompte 1-> oui, 2 -> non',
  `transfert` tinyint(1) NOT NULL COMMENT 'Transfert 1-> oui, 2 -> non',
  `impaye` tinyint(1) NOT NULL COMMENT 'Impayé 1-> oui, 2 -> non',
  `remboursement` tinyint(1) NOT NULL COMMENT 'Remboursement 1-> oui, 2 -> non',
  `option_remise` bigint(20) default NULL COMMENT 'Option remise',
  `accepte` tinyint(1) NOT NULL COMMENT 'Accepté 1-> oui, 2 -> non',
  `banque` varchar(50) default NULL COMMENT 'Nom de la banque',
  `domiciliation` varchar(25) default NULL COMMENT 'Domiciliation',
  `etablissement` varchar(5) default NULL COMMENT 'Code Etablissement',
  `guichet` varchar(5) default NULL COMMENT 'Code guichet',
  `compte` varchar(11) default NULL COMMENT 'Numéro de compte',
  `cle` varchar(2) default NULL COMMENT 'Clé de contrôle',
  `type_ecart` bigint(20) default NULL COMMENT 'Type de lécart',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  UNIQUE KEY `_treso_reglement_fou_0` (`reglement_cleunik`),
  KEY `_treso_reglement_fou_1` (`journal_cleunik`),
  KEY `_treso_reglement_fou_2` (`pc_cleunik`),
  KEY `_treso_reglement_fou_3` (`mode_paiement`),
  KEY `_treso_reglement_fou_4` (`devise_paye`),
  KEY `_treso_reglement_fou_5` (`option_remise`),
  KEY `_treso_reglement_fou_6` (`type_ecart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des règlements des factures fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_treso_reglement_fou_detail`
--

CREATE TABLE IF NOT EXISTS `_treso_reglement_fou_detail` (
  `reglement_cleunik` bigint(20) default NULL COMMENT 'Clé Unique réglement',
  `echeance_cleunik` bigint(20) default NULL COMMENT 'Clé unique echéance',
  `pourcentage_paye` decimal(19,4) default NULL COMMENT 'Pourcentage du réglement affecté à la facture',
  `montant_paye` decimal(19,4) default NULL COMMENT 'Montant du réglement affecté à la facture',
  `montant_pointe` decimal(19,4) default NULL COMMENT 'Montant correspondant à la facture',
  `devise_paye` bigint(20) default NULL COMMENT 'Devise du montant payé',
  `coef` tinyint(1) NOT NULL COMMENT 'Avoir -> -1, Facture -> 1',
  KEY `_treso_reglement_fou_detail_1` (`reglement_cleunik`),
  KEY `_treso_reglement_fou_detail_2` (`echeance_cleunik`),
  KEY `_treso_reglement_fou_detail_3` (`devise_paye`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des détails règlements des factures fournisseurs';

-- --------------------------------------------------------

--
-- Structure de la table `_treso_reglement_fou_remise`
--

CREATE TABLE IF NOT EXISTS `_treso_reglement_fou_remise` (
  `reglement_cleunik` bigint(20) default NULL COMMENT 'Clé Unique réglement',
  `remise_cleunik` bigint(20) default NULL COMMENT 'Clé unique remise',
  KEY `_treso_reglement_fou_remise_1` (`reglement_cleunik`),
  KEY `_treso_reglement_fou_remise_2` (`remise_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des remises de règlements';

-- --------------------------------------------------------

--
-- Structure de la table `_treso_remise`
--

CREATE TABLE IF NOT EXISTS `_treso_remise` (
  `remise_cleunik` bigint(20) default NULL COMMENT 'Clé unique remise',
  `action_cleunik` bigint(20) default NULL COMMENT 'Clé unique action',
  `dateheure` datetime default NULL COMMENT 'Délai Date/Heure de la remise',
  `montant` decimal(19,4) default NULL COMMENT 'Montant de la remise',
  `devise` bigint(20) default '122047' COMMENT 'Devise de la remise',
  `journal_cleunik` bigint(20) default NULL COMMENT 'Clé unique journal',
  `mode_paiement` bigint(20) default NULL COMMENT 'Mode de paiement',
  `option_remise` bigint(20) default NULL COMMENT 'Option remise',
  UNIQUE KEY `remise_cleunik` (`remise_cleunik`),
  KEY `FK_treso_remise_1` (`devise`),
  KEY `FK_treso_remise_2` (`journal_cleunik`),
  KEY `FK_treso_remise_3` (`mode_paiement`),
  KEY `FK_treso_remise_4` (`option_remise`),
  KEY `FK_treso_remise_5` (`action_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Remises en banque des règlements';

-- --------------------------------------------------------

--
-- Structure de la table `_univente_par_con`
--

CREATE TABLE IF NOT EXISTS `_univente_par_con` (
  `con_choix_cleunik` bigint(20) default NULL COMMENT 'Clé unique table choix conditionnement',
  `univente_choix_cleunik` bigint(20) default NULL COMMENT 'Clé unique table choix unité de vente',
  `art_cleunik` bigint(20) default '0' COMMENT 'Clé unique article',
  `qte` decimal(19,4) default NULL COMMENT 'Nombre d''unités dans un conditionnement',
  UNIQUE KEY `UK_01` (`art_cleunik`,`con_choix_cleunik`,`univente_choix_cleunik`),
  KEY `con_univente_par_con_02` (`univente_choix_cleunik`),
  KEY `con_univente_par_con_01` (`con_choix_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Unités de vente par conditionnement';

-- --------------------------------------------------------

--
-- Structure de la table `_uni_par_con`
--

CREATE TABLE IF NOT EXISTS `_uni_par_con` (
  `con_choix_cleunik` bigint(20) default NULL COMMENT 'Clé unique table choix conditionnement',
  `uni_choix_cleunik` bigint(20) default NULL COMMENT 'Clé unique table choix unité',
  `art_cleunik` bigint(20) default '0' COMMENT 'Clé unique article',
  `qte` decimal(19,4) default NULL COMMENT 'Nombre d''unités dans un conditionnement',
  UNIQUE KEY `UK_01` (`art_cleunik`,`con_choix_cleunik`,`uni_choix_cleunik`),
  KEY `contrainte__uni_par_con_02` (`uni_choix_cleunik`),
  KEY `contrainte__uni_par_con_01` (`con_choix_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Unités par conditionnement';

-- --------------------------------------------------------

--
-- Structure de la table `_utilisateur`
--

CREATE TABLE IF NOT EXISTS `_utilisateur` (
  `uti_cleunik` bigint(20) default NULL COMMENT 'Uti_cleunik',
  `prenom` varchar(100) default NULL,
  `patronyme` varchar(100) default NULL COMMENT 'Nom',
  `codealphanum15` varchar(15) default NULL COMMENT 'Code Type Notes',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `blocnotertf` longtext COMMENT 'Bloc note RTF',
  `dateheurevalidite` datetime default NULL COMMENT 'Date de "péremption"',
  `param_environ` longtext COMMENT 'Paramètres denvironnement',
  `borne_mini` bigint(20) default NULL COMMENT 'Borne mini pour les clefs',
  `borne_maxi` bigint(20) default NULL COMMENT 'Borne maxi pour les clefs',
  `identifiant` varchar(50) default NULL COMMENT 'Identifiant de l''utilisateur',
  `motdepasse` varchar(50) default NULL COMMENT 'Mot de passe',
  `c_uuid` varchar(36) NOT NULL default '',
  `langue_appli` bigint(20) NOT NULL default '120131' COMMENT 'Langue pour l''appication',
  `int_cleunik` bigint(20) default '0' COMMENT 'Interlocuteur entreprise lié à l''utilisateur',
  `couleurfocus` varchar(7) default '#80FF80' COMMENT 'Couleur lors de la prise de focus',
  `css` varchar(15) default '_graal.css' COMMENT 'Feuille de style utilisée',
  `actif` tinyint(4) default '1' COMMENT 'Acteur actif 1->Oui, 2->Non',
  `genre` tinyint(4) default '1' COMMENT '1->utilisateur interne,2->visiteur lecteur',
  UNIQUE KEY `uti_cleunik` (`uti_cleunik`),
  KEY `patronyme` (`patronyme`),
  KEY `codealphanum15` (`codealphanum15`),
  KEY `FK__utilisateur_1` (`int_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Utilisateur';

-- --------------------------------------------------------

--
-- Structure de la table `_uti_connexions`
--

CREATE TABLE IF NOT EXISTS `_uti_connexions` (
  `uticonnexions_cleunik` bigint(20) NOT NULL default '0' COMMENT 'Clé unique Compte',
  `uti_cleunik` bigint(20) NOT NULL default '0' COMMENT 'Clé unique utilisateur',
  `dateheuredebutconnexion` datetime default NULL COMMENT 'Date et heure de début de la connexion',
  `dateheurefinconnexion` datetime default NULL COMMENT 'Date et heure de fin de la connexion',
  `infos_connexion` longtext,
  `infos_ip` longtext,
  `infos_fenetres` longtext COMMENT 'Informations sur la fenêtre',
  `langue_appli` int(20) NOT NULL default '120031' COMMENT 'Langue pour l''appication',
  UNIQUE KEY `uticonnexions_cleunik` (`uticonnexions_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informations de connexions';

-- --------------------------------------------------------

--
-- Structure de la table `_uti_cpt_bal`
--

CREATE TABLE IF NOT EXISTS `_uti_cpt_bal` (
  `uticptbal_cleunik` bigint(20) NOT NULL default '0' COMMENT 'Clé unique Compte',
  `uti_cleunik` bigint(20) NOT NULL default '0' COMMENT 'Clé unique utilisateur',
  `dateheurecreation` datetime default NULL COMMENT 'Date et heure de création',
  `dateheuremodif` datetime default NULL COMMENT 'Date et heure de modifiaction',
  `titre` longtext COMMENT 'Désignation du Compte',
  `compte` longblob NOT NULL COMMENT 'Compte',
  `genre` tinyint(4) default '1' COMMENT '1-> compte courriel, 2-> compte fax, 3-> compte SMS',
  UNIQUE KEY `uticptbal_cleunik` (`uticptbal_cleunik`),
  KEY `uti_cleunik` (`uti_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Comptes courriels';

-- --------------------------------------------------------

--
-- Structure de la table `_uti_fen_cosmetique`
--

CREATE TABLE IF NOT EXISTS `_uti_fen_cosmetique` (
  `uti_cleunik` bigint(20) NOT NULL default '0' COMMENT 'Clé unique utilisateur',
  `titre` varchar(25) NOT NULL COMMENT 'Identification de la fenêtre, de l''ensemble ...',
  `objet` varchar(40) NOT NULL COMMENT 'Identification de l''objet',
  `description` longtext COMMENT 'Description de l''objet',
  `dateheurecreamodif` datetime default NULL COMMENT 'Date et heure de création-modification',
  `cosmetique` longtext COMMENT 'Code pour customisation',
  UNIQUE KEY `uk01_uti_fen_cos` (`uti_cleunik`,`titre`,`objet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paramétrages cosmétiques par utilisateur';

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_avocli_ht_00`
--
CREATE TABLE IF NOT EXISTS `_vue_avocli_ht_00` (
`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_avocli_ht_00_inter`
--
CREATE TABLE IF NOT EXISTS `_vue_avocli_ht_00_inter` (
`commercial_cleunik` bigint(20)
,`total_doc` decimal(65,16)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_avocli_ht_01`
--
CREATE TABLE IF NOT EXISTS `_vue_avocli_ht_01` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_avocli_ht_02`
--
CREATE TABLE IF NOT EXISTS `_vue_avocli_ht_02` (
`art_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_avocli_ht_03`
--
CREATE TABLE IF NOT EXISTS `_vue_avocli_ht_03` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_avofou_ht_00`
--
CREATE TABLE IF NOT EXISTS `_vue_avofou_ht_00` (
`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_avofou_ht_00_inter`
--
CREATE TABLE IF NOT EXISTS `_vue_avofou_ht_00_inter` (
`commercial_cleunik` bigint(20)
,`total_doc` decimal(65,16)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_avofou_ht_01`
--
CREATE TABLE IF NOT EXISTS `_vue_avofou_ht_01` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_avofou_ht_02`
--
CREATE TABLE IF NOT EXISTS `_vue_avofou_ht_02` (
`art_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_avofou_ht_03`
--
CREATE TABLE IF NOT EXISTS `_vue_avofou_ht_03` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_cdecli_ht_00`
--
CREATE TABLE IF NOT EXISTS `_vue_cdecli_ht_00` (
`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_cdecli_ht_00_inter`
--
CREATE TABLE IF NOT EXISTS `_vue_cdecli_ht_00_inter` (
`commercial_cleunik` bigint(20)
,`total_doc` decimal(65,16)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_cdecli_ht_01`
--
CREATE TABLE IF NOT EXISTS `_vue_cdecli_ht_01` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_cdecli_ht_02`
--
CREATE TABLE IF NOT EXISTS `_vue_cdecli_ht_02` (
`art_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_cdecli_ht_03`
--
CREATE TABLE IF NOT EXISTS `_vue_cdecli_ht_03` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_cdefou_ht_00`
--
CREATE TABLE IF NOT EXISTS `_vue_cdefou_ht_00` (
`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_cdefou_ht_00_inter`
--
CREATE TABLE IF NOT EXISTS `_vue_cdefou_ht_00_inter` (
`commercial_cleunik` bigint(20)
,`total_doc` decimal(65,16)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_cdefou_ht_01`
--
CREATE TABLE IF NOT EXISTS `_vue_cdefou_ht_01` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_cdefou_ht_02`
--
CREATE TABLE IF NOT EXISTS `_vue_cdefou_ht_02` (
`art_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_cdefou_ht_03`
--
CREATE TABLE IF NOT EXISTS `_vue_cdefou_ht_03` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_courriels_01`
--
CREATE TABLE IF NOT EXISTS `_vue_courriels_01` (
`intweb_cleunik` bigint(20)
,`int_cleunik` bigint(20)
,`refweb` varchar(255)
,`prenom_nom` varchar(201)
,`recherche` varchar(459)
,`prenom` varchar(100)
,`patronyme` varchar(100)
,`choix_valeur_texte_01` varchar(255)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_cp_ville_france`
--
CREATE TABLE IF NOT EXISTS `_vue_cp_ville_france` (
`recherche` varchar(305)
,`choix_code` varchar(50)
,`choix_valeur_texte_01` varchar(255)
,`choix_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_demfou_ht_00`
--
CREATE TABLE IF NOT EXISTS `_vue_demfou_ht_00` (
`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_demfou_ht_00_inter`
--
CREATE TABLE IF NOT EXISTS `_vue_demfou_ht_00_inter` (
`commercial_cleunik` bigint(20)
,`total_doc` decimal(65,16)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_demfou_ht_01`
--
CREATE TABLE IF NOT EXISTS `_vue_demfou_ht_01` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_demfou_ht_02`
--
CREATE TABLE IF NOT EXISTS `_vue_demfou_ht_02` (
`art_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_demfou_ht_03`
--
CREATE TABLE IF NOT EXISTS `_vue_demfou_ht_03` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_faccli_ht_00`
--
CREATE TABLE IF NOT EXISTS `_vue_faccli_ht_00` (
`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_faccli_ht_00_inter`
--
CREATE TABLE IF NOT EXISTS `_vue_faccli_ht_00_inter` (
`commercial_cleunik` bigint(20)
,`total_doc` decimal(65,16)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_faccli_ht_01`
--
CREATE TABLE IF NOT EXISTS `_vue_faccli_ht_01` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_faccli_ht_02`
--
CREATE TABLE IF NOT EXISTS `_vue_faccli_ht_02` (
`art_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_faccli_ht_03`
--
CREATE TABLE IF NOT EXISTS `_vue_faccli_ht_03` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_facfou_ht_00`
--
CREATE TABLE IF NOT EXISTS `_vue_facfou_ht_00` (
`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_facfou_ht_00_inter`
--
CREATE TABLE IF NOT EXISTS `_vue_facfou_ht_00_inter` (
`commercial_cleunik` bigint(20)
,`total_doc` decimal(65,16)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_facfou_ht_01`
--
CREATE TABLE IF NOT EXISTS `_vue_facfou_ht_01` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_facfou_ht_02`
--
CREATE TABLE IF NOT EXISTS `_vue_facfou_ht_02` (
`art_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_facfou_ht_03`
--
CREATE TABLE IF NOT EXISTS `_vue_facfou_ht_03` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_fax_01`
--
CREATE TABLE IF NOT EXISTS `_vue_fax_01` (
`intel_cleunik` bigint(20)
,`int_cleunik` bigint(20)
,`intel_05` varchar(50)
,`prenom_nom` varchar(201)
,`recherche` varchar(408)
,`type_acteur_clair` varchar(255)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_graal_principaux`
--
CREATE TABLE IF NOT EXISTS `_vue_graal_principaux` (
`action_cleunik` bigint(20)
,`qui_interlo` varchar(306)
,`interlo_actif` tinyint(4)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_livcli_ht_00`
--
CREATE TABLE IF NOT EXISTS `_vue_livcli_ht_00` (
`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_livcli_ht_00_inter`
--
CREATE TABLE IF NOT EXISTS `_vue_livcli_ht_00_inter` (
`commercial_cleunik` bigint(20)
,`total_doc` decimal(65,16)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_livcli_ht_01`
--
CREATE TABLE IF NOT EXISTS `_vue_livcli_ht_01` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_livcli_ht_02`
--
CREATE TABLE IF NOT EXISTS `_vue_livcli_ht_02` (
`art_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_livcli_ht_03`
--
CREATE TABLE IF NOT EXISTS `_vue_livcli_ht_03` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_offcli_ht_00`
--
CREATE TABLE IF NOT EXISTS `_vue_offcli_ht_00` (
`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_offcli_ht_00_inter`
--
CREATE TABLE IF NOT EXISTS `_vue_offcli_ht_00_inter` (
`commercial_cleunik` bigint(20)
,`total_doc` decimal(65,16)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_offcli_ht_01`
--
CREATE TABLE IF NOT EXISTS `_vue_offcli_ht_01` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_offcli_ht_02`
--
CREATE TABLE IF NOT EXISTS `_vue_offcli_ht_02` (
`art_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_offcli_ht_03`
--
CREATE TABLE IF NOT EXISTS `_vue_offcli_ht_03` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_recfou_ht_00`
--
CREATE TABLE IF NOT EXISTS `_vue_recfou_ht_00` (
`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_recfou_ht_00_inter`
--
CREATE TABLE IF NOT EXISTS `_vue_recfou_ht_00_inter` (
`commercial_cleunik` bigint(20)
,`total_doc` decimal(65,16)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_recfou_ht_01`
--
CREATE TABLE IF NOT EXISTS `_vue_recfou_ht_01` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_recfou_ht_02`
--
CREATE TABLE IF NOT EXISTS `_vue_recfou_ht_02` (
`art_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_recfou_ht_03`
--
CREATE TABLE IF NOT EXISTS `_vue_recfou_ht_03` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_retcli_ht_00`
--
CREATE TABLE IF NOT EXISTS `_vue_retcli_ht_00` (
`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_retcli_ht_00_inter`
--
CREATE TABLE IF NOT EXISTS `_vue_retcli_ht_00_inter` (
`commercial_cleunik` bigint(20)
,`total_doc` decimal(65,16)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_retcli_ht_01`
--
CREATE TABLE IF NOT EXISTS `_vue_retcli_ht_01` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_retcli_ht_02`
--
CREATE TABLE IF NOT EXISTS `_vue_retcli_ht_02` (
`art_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_retcli_ht_03`
--
CREATE TABLE IF NOT EXISTS `_vue_retcli_ht_03` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_retfou_ht_00`
--
CREATE TABLE IF NOT EXISTS `_vue_retfou_ht_00` (
`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_retfou_ht_00_inter`
--
CREATE TABLE IF NOT EXISTS `_vue_retfou_ht_00_inter` (
`commercial_cleunik` bigint(20)
,`total_doc` decimal(65,16)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_retfou_ht_01`
--
CREATE TABLE IF NOT EXISTS `_vue_retfou_ht_01` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_retfou_ht_02`
--
CREATE TABLE IF NOT EXISTS `_vue_retfou_ht_02` (
`art_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `_vue_retfou_ht_03`
--
CREATE TABLE IF NOT EXISTS `_vue_retfou_ht_03` (
`act_cleunik` bigint(20)
,`dateheure_confirm` datetime
,`commercial_cleunik` bigint(20)
,`htbrut` decimal(63,8)
,`montantremise_ligne` decimal(65,16)
,`htbrutremise` decimal(65,16)
,`nombredelignes` bigint(21)
,`catcompta_cleunik` bigint(20)
,`pc_cleunik` bigint(20)
,`taxes_cleunik` bigint(20)
);
-- --------------------------------------------------------

--
-- Structure de la table `_w_import_01`
--

CREATE TABLE IF NOT EXISTS `_w_import_01` (
  `col_001` bigint(20) default NULL COMMENT 'Identifiant importation',
  `col_002` varchar(100) default NULL,
  `col_003` varchar(100) default NULL,
  `col_004` varchar(100) default NULL,
  `col_005` varchar(100) default NULL,
  `col_006` varchar(100) default NULL,
  `col_007` varchar(100) default NULL,
  `col_008` varchar(100) default NULL,
  `col_009` varchar(100) default NULL,
  `col_010` varchar(100) default NULL,
  `col_011` varchar(100) default NULL,
  `col_012` varchar(100) default NULL,
  `col_013` varchar(100) default NULL,
  `col_014` varchar(100) default NULL,
  `col_015` varchar(100) default NULL,
  `col_016` varchar(100) default NULL,
  `col_017` varchar(100) default NULL,
  `col_018` varchar(100) default NULL,
  `col_019` varchar(100) default NULL,
  KEY `col_001` (`col_001`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Imports divers';

-- --------------------------------------------------------

--
-- Structure de la table `_w_import_acteurs`
--

CREATE TABLE IF NOT EXISTS `_w_import_acteurs` (
  `imp_cleunik` bigint(20) default NULL COMMENT 'Clé Unik',
  `doc_cleunik` bigint(20) default NULL COMMENT 'Clé Unik document',
  `description` varchar(100) default NULL COMMENT 'Description',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `blocnotertf` longtext COMMENT 'Bloc note riche',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheurevalidite` datetime default '2061-01-23 12:00:00' COMMENT 'Date de "péremption"',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `typeimport` bigint(20) default NULL COMMENT 'Type d''import',
  `genreimport` bigint(20) default NULL COMMENT 'Genre d''import',
  `hash` varchar(40) default NULL COMMENT 'Hash',
  UNIQUE KEY `imp_cleunik` (`imp_cleunik`),
  KEY `description` (`description`),
  KEY `doc_cleunik` (`doc_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Imports des acteurs';

-- --------------------------------------------------------

--
-- Structure de la table `_w_import_courriel_entete`
--

CREATE TABLE IF NOT EXISTS `_w_import_courriel_entete` (
  `imp_cleunik` bigint(20) default NULL COMMENT 'Clé Unik',
  `description` varchar(100) default NULL COMMENT 'Description',
  `blocnotebrut` longtext COMMENT 'Bloc Note brut',
  `blocnotertf` longtext COMMENT 'Bloc note riche',
  `dateheuremodif` datetime default NULL COMMENT 'Date/Heure de modification',
  `dateheurevalidite` datetime default '2061-01-23 12:00:00' COMMENT 'Date de "péremption"',
  `dateheurecreation` datetime default NULL COMMENT 'Date/Heure de modification',
  `typeimport` bigint(20) default NULL COMMENT 'Type d''import',
  `hash` varchar(40) default NULL COMMENT 'Hash',
  UNIQUE KEY `imp_cleunik` (`imp_cleunik`),
  KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Entêtes imports de courriels';

-- --------------------------------------------------------

--
-- Structure de la table `_w_import_courriel_ligne`
--

CREATE TABLE IF NOT EXISTS `_w_import_courriel_ligne` (
  `imp_cleunik` bigint(20) default NULL COMMENT 'Clé Unik import',
  `lig_cleunik` bigint(20) default NULL COMMENT 'Clé Unik ligne',
  `refweb` varchar(255) default NULL COMMENT 'Courriel',
  `Nom` longtext COMMENT 'Bloc Note brut',
  `Prenom` longtext COMMENT 'Bloc note riche',
  `valide` tinyint(4) default '1' COMMENT 'Adresse Valide (Oui->1,Non->2)',
  `emailing` tinyint(4) default '3' COMMENT '1-> oui,2->non, 3-> NSP',
  UNIQUE KEY `lig_cleunik` (`lig_cleunik`),
  KEY `imp_cleunik` (`imp_cleunik`),
  KEY `refweb` (`refweb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ligne imports de courriels';

-- --------------------------------------------------------

--
-- Structure de la table `_w_transferts_apisoft_corres_devise`
--

CREATE TABLE IF NOT EXISTS `_w_transferts_apisoft_corres_devise` (
  `c_devise` varchar(100) default NULL COMMENT 'Devise dans la base à importer',
  `devise_appli` bigint(20) NOT NULL default '122047' COMMENT 'Identifiant devise pour l''application (Euro par défaut)',
  UNIQUE KEY `Index_1` (`c_devise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Correspondances devises externes';

-- --------------------------------------------------------

--
-- Structure de la table `_w_transferts_apisoft_corres_orimou`
--

CREATE TABLE IF NOT EXISTS `_w_transferts_apisoft_corres_orimou` (
  `c_origine` varchar(100) default NULL COMMENT 'Origine du mouvement de stock dans la base à importer',
  `genre_mvt` bigint(20) NOT NULL default '-46' COMMENT 'Origine du mouvement de stock  pour l''application (Régularisation manuelle  par défaut)',
  UNIQUE KEY `Index_1` (`c_origine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Correspondances Origine des mouvements de stock ';

-- --------------------------------------------------------

--
-- Structure de la table `_w_transferts_apisoft_corres_pays`
--

CREATE TABLE IF NOT EXISTS `_w_transferts_apisoft_corres_pays` (
  `c_pays` varchar(100) default NULL COMMENT 'Pays dans la base à importer',
  `pays_appli` bigint(20) NOT NULL default '60000' COMMENT 'Identifiant pays pour l''application (France par défaut)',
  UNIQUE KEY `Index_1` (`c_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Correspondances pays externes';

-- --------------------------------------------------------

--
-- Structure de la table `_z_baronnat_acteurs_clients`
--

CREATE TABLE IF NOT EXISTS `_z_baronnat_acteurs_clients` (
  `act_cleunik` bigint(20) default NULL COMMENT 'Clé Unik acteur',
  `accise` varchar(17) default NULL COMMENT 'Accise',
  `accorest` varchar(12) default NULL COMMENT 'Accorest',
  UNIQUE KEY `act_cleunik` (`act_cleunik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table complémentaire de la société Baronnat pour ses clie';

-- --------------------------------------------------------

--
-- Structure de la vue `vue_baronnat_01`
--
DROP TABLE IF EXISTS `vue_baronnat_01`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`vue_baronnat_01` AS select distinct `graal_emailing_reference`.`_act_choix_fixes`.`act_cleunik` AS `act_cleunik` from `graal_emailing_reference`.`_act_choix_fixes` where ((`graal_emailing_reference`.`_act_choix_fixes`.`choix_cleunik` = 10001557) and (`graal_emailing_reference`.`_act_choix_fixes`.`typeacteur` = 110003));

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_avocli_ht_00`
--
DROP TABLE IF EXISTS `_vue_avocli_ht_00`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_avocli_ht_00` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from (`graal_emailing_reference`.`_avocli_lignes` `a1` left join `graal_emailing_reference`.`_avocli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a1`.`catcompta_cleunik`,`a1`.`pc_cleunik`,`a1`.`commercial_cleunik`,`a1`.`taxes_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_avocli_ht_00_inter`
--
DROP TABLE IF EXISTS `_vue_avocli_ht_00_inter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_avocli_ht_00_inter` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(`a1`.`htbrutremise`) AS `total_doc` from `graal_emailing_reference`.`_vue_avocli_ht_00` `a1` group by `a1`.`commercial_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_avocli_ht_01`
--
DROP TABLE IF EXISTS `_vue_avocli_ht_01`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_avocli_ht_01` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_avocli_entetes` `a2` left join `graal_emailing_reference`.`_avocli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_avocli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_avocli_ht_02`
--
DROP TABLE IF EXISTS `_vue_avocli_ht_02`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_avocli_ht_02` AS select `a1`.`art_cleunik` AS `art_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_avocli_entetes` `a2` left join `graal_emailing_reference`.`_avocli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_avocli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_avocli_ht_03`
--
DROP TABLE IF EXISTS `_vue_avocli_ht_03`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_avocli_ht_03` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from ((`graal_emailing_reference`.`_avocli_entetes` `a2` left join `graal_emailing_reference`.`_avocli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_avocli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_avofou_ht_00`
--
DROP TABLE IF EXISTS `_vue_avofou_ht_00`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_avofou_ht_00` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from (`graal_emailing_reference`.`_avofou_lignes` `a1` left join `graal_emailing_reference`.`_avofou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a1`.`catcompta_cleunik`,`a1`.`pc_cleunik`,`a1`.`commercial_cleunik`,`a1`.`taxes_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_avofou_ht_00_inter`
--
DROP TABLE IF EXISTS `_vue_avofou_ht_00_inter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_avofou_ht_00_inter` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(`a1`.`htbrutremise`) AS `total_doc` from `graal_emailing_reference`.`_vue_avofou_ht_00` `a1` group by `a1`.`commercial_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_avofou_ht_01`
--
DROP TABLE IF EXISTS `_vue_avofou_ht_01`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_avofou_ht_01` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_avofou_entetes` `a2` left join `graal_emailing_reference`.`_avofou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_avofou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_avofou_ht_02`
--
DROP TABLE IF EXISTS `_vue_avofou_ht_02`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_avofou_ht_02` AS select `a1`.`art_cleunik` AS `art_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_avofou_entetes` `a2` left join `graal_emailing_reference`.`_avofou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_avofou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_avofou_ht_03`
--
DROP TABLE IF EXISTS `_vue_avofou_ht_03`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_avofou_ht_03` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from ((`graal_emailing_reference`.`_avofou_entetes` `a2` left join `graal_emailing_reference`.`_avofou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_avofou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_cdecli_ht_00`
--
DROP TABLE IF EXISTS `_vue_cdecli_ht_00`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_cdecli_ht_00` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from (`graal_emailing_reference`.`_cdecli_lignes` `a1` left join `graal_emailing_reference`.`_cdecli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a1`.`catcompta_cleunik`,`a1`.`pc_cleunik`,`a1`.`commercial_cleunik`,`a1`.`taxes_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_cdecli_ht_00_inter`
--
DROP TABLE IF EXISTS `_vue_cdecli_ht_00_inter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_cdecli_ht_00_inter` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(`a1`.`htbrutremise`) AS `total_doc` from `graal_emailing_reference`.`_vue_cdecli_ht_00` `a1` group by `a1`.`commercial_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_cdecli_ht_01`
--
DROP TABLE IF EXISTS `_vue_cdecli_ht_01`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_cdecli_ht_01` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_cdecli_entetes` `a2` left join `graal_emailing_reference`.`_cdecli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_cdecli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_cdecli_ht_02`
--
DROP TABLE IF EXISTS `_vue_cdecli_ht_02`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_cdecli_ht_02` AS select `a1`.`art_cleunik` AS `art_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_cdecli_entetes` `a2` left join `graal_emailing_reference`.`_cdecli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_cdecli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_cdecli_ht_03`
--
DROP TABLE IF EXISTS `_vue_cdecli_ht_03`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_cdecli_ht_03` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from ((`graal_emailing_reference`.`_cdecli_entetes` `a2` left join `graal_emailing_reference`.`_cdecli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_cdecli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_cdefou_ht_00`
--
DROP TABLE IF EXISTS `_vue_cdefou_ht_00`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_cdefou_ht_00` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from (`graal_emailing_reference`.`_cdefou_lignes` `a1` left join `graal_emailing_reference`.`_cdefou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a1`.`catcompta_cleunik`,`a1`.`pc_cleunik`,`a1`.`commercial_cleunik`,`a1`.`taxes_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_cdefou_ht_00_inter`
--
DROP TABLE IF EXISTS `_vue_cdefou_ht_00_inter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_cdefou_ht_00_inter` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(`a1`.`htbrutremise`) AS `total_doc` from `graal_emailing_reference`.`_vue_cdefou_ht_00` `a1` group by `a1`.`commercial_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_cdefou_ht_01`
--
DROP TABLE IF EXISTS `_vue_cdefou_ht_01`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_cdefou_ht_01` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_cdefou_entetes` `a2` left join `graal_emailing_reference`.`_cdefou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_cdefou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_cdefou_ht_02`
--
DROP TABLE IF EXISTS `_vue_cdefou_ht_02`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_cdefou_ht_02` AS select `a1`.`art_cleunik` AS `art_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_cdefou_entetes` `a2` left join `graal_emailing_reference`.`_cdefou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_cdefou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_cdefou_ht_03`
--
DROP TABLE IF EXISTS `_vue_cdefou_ht_03`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_cdefou_ht_03` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from ((`graal_emailing_reference`.`_cdefou_entetes` `a2` left join `graal_emailing_reference`.`_cdefou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_cdefou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_courriels_01`
--
DROP TABLE IF EXISTS `_vue_courriels_01`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_courriels_01` AS select `f1`.`intweb_cleunik` AS `intweb_cleunik`,`f1`.`int_cleunik` AS `int_cleunik`,`f1`.`refweb` AS `refweb`,concat_ws(_utf8' ',`f2`.`prenom`,`f2`.`patronyme`) AS `prenom_nom`,concat_ws(_utf8'',`f2`.`prenom`,_utf8' ',`f2`.`patronyme`,_utf8' (',`f1`.`refweb`,_utf8')') AS `recherche`,`f2`.`prenom` AS `prenom`,`f2`.`patronyme` AS `patronyme`,`f3`.`choix_valeur_texte_01` AS `choix_valeur_texte_01` from ((`graal_emailing_reference`.`_act_interlo_mail` `f1` join `graal_emailing_reference`.`_act_interlo` `f2` on((`f1`.`int_cleunik` = `f2`.`int_cleunik`))) join `graal_emailing_reference`.`_choix` `f3` on((`f2`.`choix_cleunik` = `f3`.`choix_cleunik`)));

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_cp_ville_france`
--
DROP TABLE IF EXISTS `_vue_cp_ville_france`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_cp_ville_france` AS select concat_ws(_utf8'',`graal_emailing_reference`.`_choix`.`choix_code`,`graal_emailing_reference`.`_choix`.`choix_valeur_texte_01`) AS `recherche`,`graal_emailing_reference`.`_choix`.`choix_code` AS `choix_code`,`graal_emailing_reference`.`_choix`.`choix_valeur_texte_01` AS `choix_valeur_texte_01`,`graal_emailing_reference`.`_choix`.`choix_cleunik` AS `choix_cleunik` from `graal_emailing_reference`.`_choix` where (`graal_emailing_reference`.`_choix`.`critere_cleunik` = 1);

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_demfou_ht_00`
--
DROP TABLE IF EXISTS `_vue_demfou_ht_00`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_demfou_ht_00` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from (`graal_emailing_reference`.`_demfou_lignes` `a1` left join `graal_emailing_reference`.`_demfou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a1`.`catcompta_cleunik`,`a1`.`pc_cleunik`,`a1`.`commercial_cleunik`,`a1`.`taxes_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_demfou_ht_00_inter`
--
DROP TABLE IF EXISTS `_vue_demfou_ht_00_inter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_demfou_ht_00_inter` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(`a1`.`htbrutremise`) AS `total_doc` from `graal_emailing_reference`.`_vue_demfou_ht_00` `a1` group by `a1`.`commercial_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_demfou_ht_01`
--
DROP TABLE IF EXISTS `_vue_demfou_ht_01`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_demfou_ht_01` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_demfou_entetes` `a2` left join `graal_emailing_reference`.`_demfou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_demfou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_demfou_ht_02`
--
DROP TABLE IF EXISTS `_vue_demfou_ht_02`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_demfou_ht_02` AS select `a1`.`art_cleunik` AS `art_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_demfou_entetes` `a2` left join `graal_emailing_reference`.`_demfou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_demfou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_demfou_ht_03`
--
DROP TABLE IF EXISTS `_vue_demfou_ht_03`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_demfou_ht_03` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from ((`graal_emailing_reference`.`_demfou_entetes` `a2` left join `graal_emailing_reference`.`_demfou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_demfou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_faccli_ht_00`
--
DROP TABLE IF EXISTS `_vue_faccli_ht_00`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_faccli_ht_00` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from (`graal_emailing_reference`.`_faccli_lignes` `a1` left join `graal_emailing_reference`.`_faccli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a1`.`catcompta_cleunik`,`a1`.`pc_cleunik`,`a1`.`commercial_cleunik`,`a1`.`taxes_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_faccli_ht_00_inter`
--
DROP TABLE IF EXISTS `_vue_faccli_ht_00_inter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_faccli_ht_00_inter` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(`a1`.`htbrutremise`) AS `total_doc` from `graal_emailing_reference`.`_vue_faccli_ht_00` `a1` group by `a1`.`commercial_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_faccli_ht_01`
--
DROP TABLE IF EXISTS `_vue_faccli_ht_01`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_faccli_ht_01` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_faccli_entetes` `a2` left join `graal_emailing_reference`.`_faccli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_faccli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_faccli_ht_02`
--
DROP TABLE IF EXISTS `_vue_faccli_ht_02`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_faccli_ht_02` AS select `a1`.`art_cleunik` AS `art_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_faccli_entetes` `a2` left join `graal_emailing_reference`.`_faccli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_faccli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_faccli_ht_03`
--
DROP TABLE IF EXISTS `_vue_faccli_ht_03`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_faccli_ht_03` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from ((`graal_emailing_reference`.`_faccli_entetes` `a2` left join `graal_emailing_reference`.`_faccli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_faccli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_facfou_ht_00`
--
DROP TABLE IF EXISTS `_vue_facfou_ht_00`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_facfou_ht_00` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from (`graal_emailing_reference`.`_facfou_lignes` `a1` left join `graal_emailing_reference`.`_facfou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a1`.`catcompta_cleunik`,`a1`.`pc_cleunik`,`a1`.`commercial_cleunik`,`a1`.`taxes_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_facfou_ht_00_inter`
--
DROP TABLE IF EXISTS `_vue_facfou_ht_00_inter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_facfou_ht_00_inter` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(`a1`.`htbrutremise`) AS `total_doc` from `graal_emailing_reference`.`_vue_facfou_ht_00` `a1` group by `a1`.`commercial_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_facfou_ht_01`
--
DROP TABLE IF EXISTS `_vue_facfou_ht_01`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_facfou_ht_01` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_facfou_entetes` `a2` left join `graal_emailing_reference`.`_facfou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_facfou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_facfou_ht_02`
--
DROP TABLE IF EXISTS `_vue_facfou_ht_02`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_facfou_ht_02` AS select `a1`.`art_cleunik` AS `art_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_facfou_entetes` `a2` left join `graal_emailing_reference`.`_facfou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_facfou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_facfou_ht_03`
--
DROP TABLE IF EXISTS `_vue_facfou_ht_03`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_facfou_ht_03` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from ((`graal_emailing_reference`.`_facfou_entetes` `a2` left join `graal_emailing_reference`.`_facfou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_facfou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_fax_01`
--
DROP TABLE IF EXISTS `_vue_fax_01`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_fax_01` AS select `f1`.`intel_cleunik` AS `intel_cleunik`,`f1`.`int_cleunik` AS `int_cleunik`,`f1`.`intel_05` AS `intel_05`,concat_ws(_utf8' ',`f2`.`prenom`,`f2`.`patronyme`) AS `prenom_nom`,concat_ws(_utf8'',`f2`.`prenom`,_utf8' ',`f2`.`patronyme`,_utf8' (',`f1`.`telformate`,_utf8')',_utf8' (',`f1`.`intel_05`,_utf8')',_utf8' ',(case `f3`.`raisonsoc` when _utf8'' then `f3`.`nomcommercial` else `f3`.`raisonsoc` end)) AS `recherche`,`f4`.`choix_valeur_texte_01` AS `type_acteur_clair` from (((`graal_emailing_reference`.`_act_interlo_fax` `f1` join `graal_emailing_reference`.`_act_interlo` `f2` on((`f1`.`int_cleunik` = `f2`.`int_cleunik`))) join `graal_emailing_reference`.`_acteurs` `f3` on((`f2`.`act_cleunik` = `f3`.`act_cleunik`))) join `graal_emailing_reference`.`_choix` `f4` on((`f4`.`choix_cleunik` = `f3`.`typeacteur`))) where ((`f1`.`valide` <> 2) and (`f2`.`actif` = 1) and (`f3`.`actif` = 1));

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_graal_principaux`
--
DROP TABLE IF EXISTS `_vue_graal_principaux`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_graal_principaux` AS select `f1`.`action_cleunik` AS `action_cleunik`,concat_ws(_utf8' ',`f7`.`prenom`,`f7`.`patronyme`,_utf8'(',(case `f6`.`raisonsoc` when _utf8'' then `f6`.`nomcommercial` else `f6`.`raisonsoc` end),_utf8')') AS `qui_interlo`,`f7`.`actif` AS `interlo_actif` from ((`graal_emailing_reference`.`_graal` `f1` left join `graal_emailing_reference`.`_acteurs` `f6` on((`f1`.`act_cleunik` = `f6`.`act_cleunik`))) left join `graal_emailing_reference`.`_act_interlo` `f7` on((`f1`.`int_cleunik` = `f7`.`int_cleunik`))) where ((`f1`.`principal` = 2) and (`f1`.`portee` = 4096)) union select `f1`.`action_cleunik` AS `action_cleunik`,(case `f6`.`raisonsoc` when _utf8'' then `f6`.`nomcommercial` else `f6`.`raisonsoc` end) AS `qui_interlo`,`f6`.`actif` AS `interlo_actif` from (`graal_emailing_reference`.`_graal` `f1` left join `graal_emailing_reference`.`_acteurs` `f6` on((`f1`.`act_cleunik` = `f6`.`act_cleunik`))) where ((`f1`.`principal` = 2) and (`f1`.`portee` = 8192));

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_livcli_ht_00`
--
DROP TABLE IF EXISTS `_vue_livcli_ht_00`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_livcli_ht_00` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from (`graal_emailing_reference`.`_livcli_lignes` `a1` left join `graal_emailing_reference`.`_livcli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a1`.`catcompta_cleunik`,`a1`.`pc_cleunik`,`a1`.`commercial_cleunik`,`a1`.`taxes_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_livcli_ht_00_inter`
--
DROP TABLE IF EXISTS `_vue_livcli_ht_00_inter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_livcli_ht_00_inter` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(`a1`.`htbrutremise`) AS `total_doc` from `graal_emailing_reference`.`_vue_livcli_ht_00` `a1` group by `a1`.`commercial_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_livcli_ht_01`
--
DROP TABLE IF EXISTS `_vue_livcli_ht_01`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_livcli_ht_01` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_livcli_entetes` `a2` left join `graal_emailing_reference`.`_livcli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_livcli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_livcli_ht_02`
--
DROP TABLE IF EXISTS `_vue_livcli_ht_02`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_livcli_ht_02` AS select `a1`.`art_cleunik` AS `art_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_livcli_entetes` `a2` left join `graal_emailing_reference`.`_livcli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_livcli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_livcli_ht_03`
--
DROP TABLE IF EXISTS `_vue_livcli_ht_03`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_livcli_ht_03` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from ((`graal_emailing_reference`.`_livcli_entetes` `a2` left join `graal_emailing_reference`.`_livcli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_livcli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_offcli_ht_00`
--
DROP TABLE IF EXISTS `_vue_offcli_ht_00`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_offcli_ht_00` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from (`graal_emailing_reference`.`_offcli_lignes` `a1` left join `graal_emailing_reference`.`_offcli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a1`.`catcompta_cleunik`,`a1`.`pc_cleunik`,`a1`.`commercial_cleunik`,`a1`.`taxes_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_offcli_ht_00_inter`
--
DROP TABLE IF EXISTS `_vue_offcli_ht_00_inter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_offcli_ht_00_inter` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(`a1`.`htbrutremise`) AS `total_doc` from `graal_emailing_reference`.`_vue_offcli_ht_00` `a1` group by `a1`.`commercial_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_offcli_ht_01`
--
DROP TABLE IF EXISTS `_vue_offcli_ht_01`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_offcli_ht_01` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_offcli_entetes` `a2` left join `graal_emailing_reference`.`_offcli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_offcli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_offcli_ht_02`
--
DROP TABLE IF EXISTS `_vue_offcli_ht_02`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_offcli_ht_02` AS select `a1`.`art_cleunik` AS `art_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_offcli_entetes` `a2` left join `graal_emailing_reference`.`_offcli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_offcli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_offcli_ht_03`
--
DROP TABLE IF EXISTS `_vue_offcli_ht_03`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_offcli_ht_03` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from ((`graal_emailing_reference`.`_offcli_entetes` `a2` left join `graal_emailing_reference`.`_offcli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_offcli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_recfou_ht_00`
--
DROP TABLE IF EXISTS `_vue_recfou_ht_00`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_recfou_ht_00` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from (`graal_emailing_reference`.`_recfou_lignes` `a1` left join `graal_emailing_reference`.`_recfou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a1`.`catcompta_cleunik`,`a1`.`pc_cleunik`,`a1`.`commercial_cleunik`,`a1`.`taxes_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_recfou_ht_00_inter`
--
DROP TABLE IF EXISTS `_vue_recfou_ht_00_inter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_recfou_ht_00_inter` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(`a1`.`htbrutremise`) AS `total_doc` from `graal_emailing_reference`.`_vue_recfou_ht_00` `a1` group by `a1`.`commercial_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_recfou_ht_01`
--
DROP TABLE IF EXISTS `_vue_recfou_ht_01`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_recfou_ht_01` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_recfou_entetes` `a2` left join `graal_emailing_reference`.`_recfou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_recfou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_recfou_ht_02`
--
DROP TABLE IF EXISTS `_vue_recfou_ht_02`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_recfou_ht_02` AS select `a1`.`art_cleunik` AS `art_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_recfou_entetes` `a2` left join `graal_emailing_reference`.`_recfou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_recfou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_recfou_ht_03`
--
DROP TABLE IF EXISTS `_vue_recfou_ht_03`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_recfou_ht_03` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from ((`graal_emailing_reference`.`_recfou_entetes` `a2` left join `graal_emailing_reference`.`_recfou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_recfou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_retcli_ht_00`
--
DROP TABLE IF EXISTS `_vue_retcli_ht_00`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_retcli_ht_00` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from (`graal_emailing_reference`.`_retcli_lignes` `a1` left join `graal_emailing_reference`.`_retcli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a1`.`catcompta_cleunik`,`a1`.`pc_cleunik`,`a1`.`commercial_cleunik`,`a1`.`taxes_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_retcli_ht_00_inter`
--
DROP TABLE IF EXISTS `_vue_retcli_ht_00_inter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_retcli_ht_00_inter` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(`a1`.`htbrutremise`) AS `total_doc` from `graal_emailing_reference`.`_vue_retcli_ht_00` `a1` group by `a1`.`commercial_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_retcli_ht_01`
--
DROP TABLE IF EXISTS `_vue_retcli_ht_01`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_retcli_ht_01` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_retcli_entetes` `a2` left join `graal_emailing_reference`.`_retcli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_retcli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_retcli_ht_02`
--
DROP TABLE IF EXISTS `_vue_retcli_ht_02`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_retcli_ht_02` AS select `a1`.`art_cleunik` AS `art_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_retcli_entetes` `a2` left join `graal_emailing_reference`.`_retcli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_retcli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_retcli_ht_03`
--
DROP TABLE IF EXISTS `_vue_retcli_ht_03`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_retcli_ht_03` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from ((`graal_emailing_reference`.`_retcli_entetes` `a2` left join `graal_emailing_reference`.`_retcli_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_retcli_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_retfou_ht_00`
--
DROP TABLE IF EXISTS `_vue_retfou_ht_00`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_retfou_ht_00` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from (`graal_emailing_reference`.`_retfou_lignes` `a1` left join `graal_emailing_reference`.`_retfou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a1`.`catcompta_cleunik`,`a1`.`pc_cleunik`,`a1`.`commercial_cleunik`,`a1`.`taxes_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_retfou_ht_00_inter`
--
DROP TABLE IF EXISTS `_vue_retfou_ht_00_inter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_retfou_ht_00_inter` AS select `a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(`a1`.`htbrutremise`) AS `total_doc` from `graal_emailing_reference`.`_vue_retfou_ht_00` `a1` group by `a1`.`commercial_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_retfou_ht_01`
--
DROP TABLE IF EXISTS `_vue_retfou_ht_01`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_retfou_ht_01` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_retfou_entetes` `a2` left join `graal_emailing_reference`.`_retfou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_retfou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_retfou_ht_02`
--
DROP TABLE IF EXISTS `_vue_retfou_ht_02`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_retfou_ht_02` AS select `a1`.`art_cleunik` AS `art_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes` from ((`graal_emailing_reference`.`_retfou_entetes` `a2` left join `graal_emailing_reference`.`_retfou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_retfou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

-- --------------------------------------------------------

--
-- Structure de la vue `_vue_retfou_ht_03`
--
DROP TABLE IF EXISTS `_vue_retfou_ht_03`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `graal_emailing_reference`.`_vue_retfou_ht_03` AS select `a2`.`act_cleunik` AS `act_cleunik`,`a3`.`dateheure_confirm` AS `dateheure_confirm`,`a1`.`commercial_cleunik` AS `commercial_cleunik`,sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) AS `htbrut`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then 0 else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100))) end) else sum(`a1`.`remise_taux`) end) AS `montantremise_ligne`,(case `a1`.`remise_genr` when 1 then (case `a1`.`remise_taux` when 0 then sum(((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`)) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - (((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) * (`a1`.`remise_taux` / 100)))) end) else sum((((`a3`.`qte` * `a1`.`pu`) * `a1`.`coef_facture`) - `a1`.`remise_taux`)) end) AS `htbrutremise`,count(0) AS `nombredelignes`,`a1`.`catcompta_cleunik` AS `catcompta_cleunik`,`a1`.`pc_cleunik` AS `pc_cleunik`,`a1`.`taxes_cleunik` AS `taxes_cleunik` from ((`graal_emailing_reference`.`_retfou_entetes` `a2` left join `graal_emailing_reference`.`_retfou_lignes` `a1` on((`a2`.`commercial_cleunik` = `a1`.`commercial_cleunik`))) left join `graal_emailing_reference`.`_retfou_lignes_qte` `a3` on((`a1`.`commercial_ligne_cleunik` = `a3`.`commercial_ligne_cleunik`))) group by `a3`.`ligne_qte_cleunik`;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `_acteurs`
--
ALTER TABLE `_acteurs`
  ADD CONSTRAINT `FK__acteurs_1` FOREIGN KEY (`modegestion`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__acteurs_2` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__acteurs_3` FOREIGN KEY (`langue`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_acteurs_blanc`
--
ALTER TABLE `_acteurs_blanc`
  ADD CONSTRAINT `Con_acteur_blanc_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Con_acteur_blanc_2` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_acteurs_favoris`
--
ALTER TABLE `_acteurs_favoris`
  ADD CONSTRAINT `_acteurs_favoris_ibfk_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_acteurs_favoris_ibfk_2` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_acteurs_noire`
--
ALTER TABLE `_acteurs_noire`
  ADD CONSTRAINT `Con_acteur_noire_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Con_acteur_noire_2` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_acteurs_relations`
--
ALTER TABLE `_acteurs_relations`
  ADD CONSTRAINT `_acteurs_relation_ibfk_1` FOREIGN KEY (`act_cleunik_gauche`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_acteurs_relation_ibfk_2` FOREIGN KEY (`act_cleunik_droite`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_acteurs_relation_ibfk_3` FOREIGN KEY (`choix_cleunik_gauche`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_acteurs_relation_ibfk_4` FOREIGN KEY (`choix_cleunik_droite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_acteurs_representants`
--
ALTER TABLE `_acteurs_representants`
  ADD CONSTRAINT `_acteurs_representants_ibfk_1` FOREIGN KEY (`act_cleunik_gauche`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_acteurs_representants_ibfk_2` FOREIGN KEY (`act_cleunik_droite`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_acteurs_representants_ibfk_3` FOREIGN KEY (`choix_cleunik_gauche`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_acteurs_representants_ibfk_4` FOREIGN KEY (`choix_cleunik_droite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_acteurs_soundex_fr`
--
ALTER TABLE `_acteurs_soundex_fr`
  ADD CONSTRAINT `_acteurs_soundex_fr_ibfk_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_actions`
--
ALTER TABLE `_actions`
  ADD CONSTRAINT `FK__actions_1` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__actions_2` FOREIGN KEY (`confidentialite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__actions_3` FOREIGN KEY (`priorite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__actions_4` FOREIGN KEY (`statut`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_actions_blanc`
--
ALTER TABLE `_actions_blanc`
  ADD CONSTRAINT `Con_action_blanc_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Con_action_blanc_2` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_actions_choix_fixes`
--
ALTER TABLE `_actions_choix_fixes`
  ADD CONSTRAINT `contrainte_actions_actions_choix_fixes` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__actions_choix_fixes_2` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__actions_choix_fixes_4` FOREIGN KEY (`critere_cleunik`) REFERENCES `_criteres` (`critere_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__action_choix_fixes_5` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_actions_commentaires`
--
ALTER TABLE `_actions_commentaires`
  ADD CONSTRAINT `_actions_commentaires_ibfk_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_actions_commentaires_ibfk_2` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_actions_commentaires_ibfk_3` FOREIGN KEY (`int_cleunik`) REFERENCES `_act_interlo` (`int_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_actions_favorites`
--
ALTER TABLE `_actions_favorites`
  ADD CONSTRAINT `_actions_favorites_ibfk_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_actions_favorites_ibfk_2` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_actions_noire`
--
ALTER TABLE `_actions_noire`
  ADD CONSTRAINT `Con_action_noire_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Con_action_noire_2` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_act_adresses`
--
ALTER TABLE `_act_adresses`
  ADD CONSTRAINT `contrainte_cli_cli_adresses` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_act_choix_fixes`
--
ALTER TABLE `_act_choix_fixes`
  ADD CONSTRAINT `contrainte_choix_cli_choix_fixes` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrainte_cli_cli_choix_fixes` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrainte_criteres_act_choix_fixes` FOREIGN KEY (`critere_cleunik`) REFERENCES `_criteres` (`critere_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__act_choix_fixes_5` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_act_compta`
--
ALTER TABLE `_act_compta`
  ADD CONSTRAINT `FK__act_compta_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__act_compta_2` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_act_compta_ibfk_1` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_act_compta_ibfk_4` FOREIGN KEY (`reg_cleunik`) REFERENCES `_modereg` (`reg_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_act_compta_ibfk_5` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_act_iban`
--
ALTER TABLE `_act_iban`
  ADD CONSTRAINT `FK__act_iban_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_act_interlo`
--
ALTER TABLE `_act_interlo`
  ADD CONSTRAINT `contrainte_cli_interlo_choix` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrainte_interlo_cli_act_cli` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_act_interlo_adresses`
--
ALTER TABLE `_act_interlo_adresses`
  ADD CONSTRAINT `contrainte_interloact__adresses` FOREIGN KEY (`int_cleunik`) REFERENCES `_act_interlo` (`int_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_act_interlo_choix_fixes`
--
ALTER TABLE `_act_interlo_choix_fixes`
  ADD CONSTRAINT `act_cleunik` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__act_interlo_choix_fixes_5` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_act_interlo_choix_fixes_ibfk_1` FOREIGN KEY (`int_cleunik`) REFERENCES `_act_interlo` (`int_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_act_interlo_choix_fixes_ibfk_2` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_act_interlo_choix_fixes_ibfk_3` FOREIGN KEY (`critere_cleunik`) REFERENCES `_criteres` (`critere_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_act_interlo_favoris`
--
ALTER TABLE `_act_interlo_favoris`
  ADD CONSTRAINT `_act_interlo_favoris_ibfk_1` FOREIGN KEY (`int_cleunik`) REFERENCES `_act_interlo` (`int_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_act_interlo_favoris_ibfk_2` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_act_interlo_fax`
--
ALTER TABLE `_act_interlo_fax`
  ADD CONSTRAINT `contrainte_cli_interlo_cli_interlo_fax` FOREIGN KEY (`int_cleunik`) REFERENCES `_act_interlo` (`int_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__act_interlo_fax_2` FOREIGN KEY (`prefixe_choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__act_interlo_fax_3` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_act_interlo_mail`
--
ALTER TABLE `_act_interlo_mail`
  ADD CONSTRAINT `_act_interlo_mail_ibfk_1` FOREIGN KEY (`int_cleunik`) REFERENCES `_act_interlo` (`int_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_act_interlo_mesinst`
--
ALTER TABLE `_act_interlo_mesinst`
  ADD CONSTRAINT `_act_interlo_chat_ibfk_1` FOREIGN KEY (`int_cleunik`) REFERENCES `_act_interlo` (`int_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_act_interlo_chat_ibfk_2` FOREIGN KEY (`choix_cleunik_type`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_act_interlo_chat_ibfk_3` FOREIGN KEY (`choix_cleunik_prot`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_act_interlo_relations`
--
ALTER TABLE `_act_interlo_relations`
  ADD CONSTRAINT `_act_interlo_relation_ibfk_1` FOREIGN KEY (`int_cleunik_gauche`) REFERENCES `_act_interlo` (`int_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_act_interlo_relation_ibfk_2` FOREIGN KEY (`int_cleunik_droite`) REFERENCES `_act_interlo` (`int_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_act_interlo_relation_ibfk_3` FOREIGN KEY (`choix_cleunik_gauche`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_act_interlo_relation_ibfk_4` FOREIGN KEY (`choix_cleunik_droite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_act_interlo_tel`
--
ALTER TABLE `_act_interlo_tel`
  ADD CONSTRAINT `FK__act_interlo_tel_2` FOREIGN KEY (`prefixe_choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__act_interlo_tel_3` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_act_interlo_tel_ibfk_1` FOREIGN KEY (`int_cleunik`) REFERENCES `_act_interlo` (`int_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_act_rib`
--
ALTER TABLE `_act_rib`
  ADD CONSTRAINT `_act_rib_ibfk_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_act_sites`
--
ALTER TABLE `_act_sites`
  ADD CONSTRAINT `_act_sites_ibfk_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_article`
--
ALTER TABLE `_article`
  ADD CONSTRAINT `_art_nc2009_auto` FOREIGN KEY (`nc_2009_autosuffisant_cleunik`) REFERENCES `nc_2009_autosuffisant` (`cleunik`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `_art_achats`
--
ALTER TABLE `_art_achats`
  ADD CONSTRAINT `_art_achats_ibfk_1` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_achats_ibfk_2` FOREIGN KEY (`unite_reappro`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_achats_ibfk_4` FOREIGN KEY (`unite_achat`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_art_acteur`
--
ALTER TABLE `_art_acteur`
  ADD CONSTRAINT `_art_fournis_ibfk_1` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_fournis_ibfk_2` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_fournis_ibfk_3` FOREIGN KEY (`unite_reappro`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_fournis_ibfk_4` FOREIGN KEY (`unite_achat`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_art_choix_fixes`
--
ALTER TABLE `_art_choix_fixes`
  ADD CONSTRAINT `contrainte_art_choix_fixes` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrainte_choix_art_choix_fixes` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrainte_criteres_art_choix_fixes` FOREIGN KEY (`critere_cleunik`) REFERENCES `_criteres` (`critere_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_art_choix_fixes_5` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_art_compta`
--
ALTER TABLE `_art_compta`
  ADD CONSTRAINT `FK_art_compta_1` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_art_compta_2` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_art_compta_3` FOREIGN KEY (`pc_cleunik_vente`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_art_compta_4` FOREIGN KEY (`pc_cleunik_achat`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_art_compta_5` FOREIGN KEY (`taxes_cleunik`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_art_compta_6` FOREIGN KEY (`tpf_cleunik`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_art_compta_7` FOREIGN KEY (`tpf_cleunik_01`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_art_dep_emp`
--
ALTER TABLE `_art_dep_emp`
  ADD CONSTRAINT `_art_dep_emp_ibfk_1` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_dep_emp_ibfk_2` FOREIGN KEY (`choix_depot`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_dep_emp_ibfk_3` FOREIGN KEY (`choix_empla`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_art_dimensions`
--
ALTER TABLE `_art_dimensions`
  ADD CONSTRAINT `_art_dimensions_ibfk_1` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_dimensions_ibfk_2` FOREIGN KEY (`unite_capacite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_dimensions_ibfk_3` FOREIGN KEY (`unite_poids`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_dimensions_ibfk_4` FOREIGN KEY (`unite_longueur`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_art_fabs`
--
ALTER TABLE `_art_fabs`
  ADD CONSTRAINT `_art_fabs_ibfk_1` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_art_favoris`
--
ALTER TABLE `_art_favoris`
  ADD CONSTRAINT `_art_favoris_ibfk_1` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_favoris_ibfk_2` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_art_libelle`
--
ALTER TABLE `_art_libelle`
  ADD CONSTRAINT `FK__art_libelle_1` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_art_relations`
--
ALTER TABLE `_art_relations`
  ADD CONSTRAINT `_art_relation_ibfk_1` FOREIGN KEY (`art_cleunik_gauche`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_relation_ibfk_2` FOREIGN KEY (`art_cleunik_droite`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_relation_ibfk_3` FOREIGN KEY (`choix_cleunik_gauche`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_relation_ibfk_4` FOREIGN KEY (`choix_cleunik_droite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_art_stock`
--
ALTER TABLE `_art_stock`
  ADD CONSTRAINT `FK__art_stock_2` FOREIGN KEY (`unite_stock`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_stock_ibfk_1` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_stock_ibfk_3` FOREIGN KEY (`unite_condi`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_art_tarifs`
--
ALTER TABLE `_art_tarifs`
  ADD CONSTRAINT `FK_art_tarif_1` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_art_tarif_2` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_art_tarif_3` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_art_ventes`
--
ALTER TABLE `_art_ventes`
  ADD CONSTRAINT `_art_ventes_ibfk_1` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_art_ventes_ibfk_2` FOREIGN KEY (`unite_vente`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_avocli_adresses`
--
ALTER TABLE `_avocli_adresses`
  ADD CONSTRAINT `FK_avocli_adresses_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_avocli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avocli_adresses_2` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_avocli_consignes`
--
ALTER TABLE `_avocli_consignes`
  ADD CONSTRAINT `_avocli_consignes_ibfk_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_avocli_consignes_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_avocli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_avocli_consignes_ibfk_3` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_avocli_entetes`
--
ALTER TABLE `_avocli_entetes`
  ADD CONSTRAINT `avocli_entetes_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avocli_entetes_2` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avocli_entetes_3` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avocli_entetes_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avocli_entetes_5` FOREIGN KEY (`reg_cleunik`) REFERENCES `_modereg` (`reg_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avocli_entete_6` FOREIGN KEY (`modliv`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avocli_entete_7` FOREIGN KEY (`typpor`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avocli_entete_8` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avocli_entete_9` FOREIGN KEY (`modliv_bis`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_avocli_lignes`
--
ALTER TABLE `_avocli_lignes`
  ADD CONSTRAINT `FK_avocli_ligne_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_avocli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avocli_ligne_2` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avocli_ligne_3` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avocli_ligne_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avocli_ligne_5` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avocli_ligne_6` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avocli_ligne_7` FOREIGN KEY (`taxes_cleunik`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_avocli_ligne_10` FOREIGN KEY (`tpf_cleunik_01`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_avocli_ligne_8` FOREIGN KEY (`unite_longueur`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_avocli_ligne_9` FOREIGN KEY (`tpf_cleunik`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_avocli_lignes_qte`
--
ALTER TABLE `_avocli_lignes_qte`
  ADD CONSTRAINT `FK_avocli_ligne_qte_1` FOREIGN KEY (`commercial_ligne_cleunik`) REFERENCES `_avocli_lignes` (`commercial_ligne_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avocli_ligne_qte_2` FOREIGN KEY (`qte_unite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avocli_ligne_qte_3` FOREIGN KEY (`statut`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avocli_ligne_qte_4` FOREIGN KEY (`unite_condi`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avocli_ligne_qte_5` FOREIGN KEY (`choix_depot`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avocli_ligne_qte_6` FOREIGN KEY (`choix_empla`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_avocli_representants`
--
ALTER TABLE `_avocli_representants`
  ADD CONSTRAINT `_avocli_representants_ibfk_1` FOREIGN KEY (`act_cleunik_rep`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_avocli_representants_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_avocli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_avocli_transporteurs`
--
ALTER TABLE `_avocli_transporteurs`
  ADD CONSTRAINT `_avocli_transporteur_ibfk_1` FOREIGN KEY (`act_cleunik_trans`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_avocli_transporteur_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_avocli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_avofou_adresses`
--
ALTER TABLE `_avofou_adresses`
  ADD CONSTRAINT `FK_avofou_adresses_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_avofou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avofou_adresses_2` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_avofou_consignes`
--
ALTER TABLE `_avofou_consignes`
  ADD CONSTRAINT `_avofou_consignes_ibfk_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_avofou_consignes_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_avofou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_avofou_consignes_ibfk_3` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_avofou_entetes`
--
ALTER TABLE `_avofou_entetes`
  ADD CONSTRAINT `avofou_entetes_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avofou_entetes_2` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avofou_entetes_3` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avofou_entetes_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avofou_entetes_5` FOREIGN KEY (`reg_cleunik`) REFERENCES `_modereg` (`reg_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avofou_entete_6` FOREIGN KEY (`modliv`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avofou_entete_7` FOREIGN KEY (`typpor`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avofou_entete_8` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avofou_entete_9` FOREIGN KEY (`modliv_bis`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_avofou_lignes`
--
ALTER TABLE `_avofou_lignes`
  ADD CONSTRAINT `FK_avofou_ligne_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_avofou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avofou_ligne_2` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avofou_ligne_3` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avofou_ligne_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avofou_ligne_5` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avofou_ligne_6` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avofou_ligne_7` FOREIGN KEY (`taxes_cleunik`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_avofou_ligne_10` FOREIGN KEY (`tpf_cleunik_01`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_avofou_ligne_8` FOREIGN KEY (`unite_longueur`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_avofou_ligne_9` FOREIGN KEY (`tpf_cleunik`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_avofou_lignes_qte`
--
ALTER TABLE `_avofou_lignes_qte`
  ADD CONSTRAINT `FK_avofou_ligne_qte_1` FOREIGN KEY (`commercial_ligne_cleunik`) REFERENCES `_avofou_lignes` (`commercial_ligne_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avofou_ligne_qte_2` FOREIGN KEY (`qte_unite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avofou_ligne_qte_3` FOREIGN KEY (`statut`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avofou_ligne_qte_4` FOREIGN KEY (`unite_condi`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avofou_ligne_qte_5` FOREIGN KEY (`choix_depot`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avofou_ligne_qte_6` FOREIGN KEY (`choix_empla`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_avofou_representants`
--
ALTER TABLE `_avofou_representants`
  ADD CONSTRAINT `_avofou_representants_ibfk_1` FOREIGN KEY (`act_cleunik_rep`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_avofou_representants_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_avofou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_avofou_transporteurs`
--
ALTER TABLE `_avofou_transporteurs`
  ADD CONSTRAINT `_avofou_transporteur_ibfk_1` FOREIGN KEY (`act_cleunik_trans`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_avofou_transporteur_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_avofou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_bordereau_transporteurs`
--
ALTER TABLE `_bordereau_transporteurs`
  ADD CONSTRAINT `bordereau_entetes_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_bordereau_transporteur_ibfk_1` FOREIGN KEY (`act_cleunik_trans`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_bordereau_transporteurs_lignes`
--
ALTER TABLE `_bordereau_transporteurs_lignes`
  ADD CONSTRAINT `FK_bordereau_ligne_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_livcli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_bordereau_ligne_2` FOREIGN KEY (`bordereau_cleunik`) REFERENCES `_bordereau_transporteurs` (`bordereau_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_bordereau_ligne_3` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_cdecli_adresses`
--
ALTER TABLE `_cdecli_adresses`
  ADD CONSTRAINT `FK_cdecli_adresses_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_cdecli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdecli_adresses_2` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_cdecli_consignes`
--
ALTER TABLE `_cdecli_consignes`
  ADD CONSTRAINT `_cdecli_consignes_ibfk_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_cdecli_consignes_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_cdecli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_cdecli_consignes_ibfk_3` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_cdecli_entetes`
--
ALTER TABLE `_cdecli_entetes`
  ADD CONSTRAINT `cdecli_entetes_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cdecli_entetes_2` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cdecli_entetes_3` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cdecli_entetes_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cdecli_entetes_5` FOREIGN KEY (`reg_cleunik`) REFERENCES `_modereg` (`reg_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_cdecli_entete_6` FOREIGN KEY (`modliv`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_cdecli_entete_7` FOREIGN KEY (`typpor`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_cdecli_entete_8` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_cdecli_lignes`
--
ALTER TABLE `_cdecli_lignes`
  ADD CONSTRAINT `FK_cdecli_ligne_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_cdecli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdecli_ligne_2` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdecli_ligne_3` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdecli_ligne_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdecli_ligne_5` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdecli_ligne_6` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdecli_ligne_7` FOREIGN KEY (`taxes_cleunik`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_cdecli_ligne_10` FOREIGN KEY (`tpf_cleunik_01`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_cdecli_ligne_8` FOREIGN KEY (`unite_longueur`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_cdecli_ligne_9` FOREIGN KEY (`tpf_cleunik`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_cdecli_lignes_qte`
--
ALTER TABLE `_cdecli_lignes_qte`
  ADD CONSTRAINT `FK_cdecli_ligne_qte_1` FOREIGN KEY (`commercial_ligne_cleunik`) REFERENCES `_cdecli_lignes` (`commercial_ligne_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdecli_ligne_qte_2` FOREIGN KEY (`qte_unite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdecli_ligne_qte_3` FOREIGN KEY (`statut`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdecli_ligne_qte_4` FOREIGN KEY (`unite_condi`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdecli_ligne_qte_5` FOREIGN KEY (`choix_depot`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdecli_ligne_qte_6` FOREIGN KEY (`choix_empla`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_cdecli_representants`
--
ALTER TABLE `_cdecli_representants`
  ADD CONSTRAINT `_cdecli_representants_ibfk_1` FOREIGN KEY (`act_cleunik_rep`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_cdecli_representants_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_cdecli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_cdecli_transporteurs`
--
ALTER TABLE `_cdecli_transporteurs`
  ADD CONSTRAINT `_cdecli_transporteur_ibfk_1` FOREIGN KEY (`act_cleunik_trans`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_cdecli_transporteur_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_cdecli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_cdefou_adresses`
--
ALTER TABLE `_cdefou_adresses`
  ADD CONSTRAINT `FK_cdefou_adresses_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_cdefou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdefou_adresses_2` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_cdefou_entetes`
--
ALTER TABLE `_cdefou_entetes`
  ADD CONSTRAINT `cdefou_entetes_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cdefou_entetes_2` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cdefou_entetes_3` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cdefou_entetes_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cdefou_entetes_5` FOREIGN KEY (`reg_cleunik`) REFERENCES `_modereg` (`reg_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cdefou_entete_6` FOREIGN KEY (`modliv`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cdefou_entete_7` FOREIGN KEY (`typpor`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cdefou_entete_8` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cdefou_entete_9` FOREIGN KEY (`modliv_bis`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_cdefou_lignes`
--
ALTER TABLE `_cdefou_lignes`
  ADD CONSTRAINT `FK_cdefou_ligne_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_cdefou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdefou_ligne_2` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdefou_ligne_3` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdefou_ligne_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdefou_ligne_5` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdefou_ligne_6` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdefou_ligne_7` FOREIGN KEY (`taxes_cleunik`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_cdefou_ligne_10` FOREIGN KEY (`tpf_cleunik_01`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_cdefou_ligne_8` FOREIGN KEY (`unite_longueur`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_cdefou_ligne_9` FOREIGN KEY (`tpf_cleunik`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_cdefou_lignes_qte`
--
ALTER TABLE `_cdefou_lignes_qte`
  ADD CONSTRAINT `FK_cdefou_ligne_qte_1` FOREIGN KEY (`commercial_ligne_cleunik`) REFERENCES `_cdefou_lignes` (`commercial_ligne_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdefou_ligne_qte_2` FOREIGN KEY (`qte_unite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdefou_ligne_qte_3` FOREIGN KEY (`statut`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdefou_ligne_qte_4` FOREIGN KEY (`unite_condi`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdefou_ligne_qte_5` FOREIGN KEY (`choix_depot`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cdefou_ligne_qte_6` FOREIGN KEY (`choix_empla`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_choix`
--
ALTER TABLE `_choix`
  ADD CONSTRAINT `contrainte_criteres_choix` FOREIGN KEY (`critere_cleunik`) REFERENCES `_criteres` (`critere_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_choix_couleur`
--
ALTER TABLE `_choix_couleur`
  ADD CONSTRAINT `cont01_choix_couleur_uti` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cont02_choix_couleur_uti` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_courriel_en`
--
ALTER TABLE `_courriel_en`
  ADD CONSTRAINT `contrainte_cour_action` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_courriel_re`
--
ALTER TABLE `_courriel_re`
  ADD CONSTRAINT `contrainte_cour_rec_action` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_critere_pere_fils`
--
ALTER TABLE `_critere_pere_fils`
  ADD CONSTRAINT `choix_critere_pere_fils_fils` FOREIGN KEY (`cleunikchoixfils`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `choix_critere_pere_fils_pere` FOREIGN KEY (`cleunikchoixpere`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrainte_criteres_critere_pere_fils` FOREIGN KEY (`cleunikcriterepere`) REFERENCES `_criteres` (`critere_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrainte_criteres_critere_pere_fils1` FOREIGN KEY (`cleunikcriterefils`) REFERENCES `_criteres` (`critere_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_demfou_adresses`
--
ALTER TABLE `_demfou_adresses`
  ADD CONSTRAINT `FK_demfou_adresses_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_demfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_demfou_adresses_2` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_demfou_entetes`
--
ALTER TABLE `_demfou_entetes`
  ADD CONSTRAINT `demfou_entetes_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demfou_entetes_2` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demfou_entetes_3` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demfou_entetes_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demfou_entetes_5` FOREIGN KEY (`reg_cleunik`) REFERENCES `_modereg` (`reg_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demfou_entete_6` FOREIGN KEY (`modliv`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demfou_entete_7` FOREIGN KEY (`typpor`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demfou_entete_8` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demfou_entete_9` FOREIGN KEY (`modliv_bis`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_demfou_lignes`
--
ALTER TABLE `_demfou_lignes`
  ADD CONSTRAINT `FK_demfou_ligne_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_demfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_demfou_ligne_2` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_demfou_ligne_3` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_demfou_ligne_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_demfou_ligne_5` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_demfou_ligne_6` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_demfou_ligne_7` FOREIGN KEY (`taxes_cleunik`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_demfou_ligne_10` FOREIGN KEY (`tpf_cleunik_01`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_demfou_ligne_8` FOREIGN KEY (`unite_longueur`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_demfou_ligne_9` FOREIGN KEY (`tpf_cleunik`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_demfou_lignes_qte`
--
ALTER TABLE `_demfou_lignes_qte`
  ADD CONSTRAINT `FK_demfou_ligne_qte_1` FOREIGN KEY (`commercial_ligne_cleunik`) REFERENCES `_demfou_lignes` (`commercial_ligne_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_demfou_ligne_qte_2` FOREIGN KEY (`qte_unite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_demfou_ligne_qte_3` FOREIGN KEY (`statut`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_demfou_ligne_qte_4` FOREIGN KEY (`unite_condi`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_demfou_ligne_qte_5` FOREIGN KEY (`choix_depot`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_demfou_ligne_qte_6` FOREIGN KEY (`choix_empla`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_docciaux`
--
ALTER TABLE `_docciaux`
  ADD CONSTRAINT `_const_docciaux_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_docciaux_montants`
--
ALTER TABLE `_docciaux_montants`
  ADD CONSTRAINT `_docciaux_montants_ibfk_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_docciaux_montants_ibfk_2` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_docciaux_montants_ibfk_3` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_docciaux_montants_ibfk_4` FOREIGN KEY (`taxes_cleunik`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_documents_choix_fixes`
--
ALTER TABLE `_documents_choix_fixes`
  ADD CONSTRAINT `FK__documents_choix_fixes_1` FOREIGN KEY (`doc_cleunik`) REFERENCES `_documents` (`doc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__documents_choix_fixes_2` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__documents_choix_fixes_3` FOREIGN KEY (`critere_cleunik`) REFERENCES `_criteres` (`critere_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__documents_choix_fixes_5` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_documents_commentaires`
--
ALTER TABLE `_documents_commentaires`
  ADD CONSTRAINT `_doc_commentaires_ibfk_1` FOREIGN KEY (`doc_cleunik`) REFERENCES `_documents` (`doc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_doc_commentaires_ibfk_2` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_doc_commentaires_ibfk_3` FOREIGN KEY (`int_cleunik`) REFERENCES `_act_interlo` (`int_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_documents_connexions`
--
ALTER TABLE `_documents_connexions`
  ADD CONSTRAINT `_documents_connexions_ibfk_1` FOREIGN KEY (`doc_cleunik_gauche`) REFERENCES `_documents` (`doc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_documents_connexions_ibfk_2` FOREIGN KEY (`doc_cleunik_droite`) REFERENCES `_documents` (`doc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_documents_favoris`
--
ALTER TABLE `_documents_favoris`
  ADD CONSTRAINT `_documents_favoris_ibfk_1` FOREIGN KEY (`doc_cleunik`) REFERENCES `_documents` (`doc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_documents_favoris_ibfk_2` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_documents_rattachement`
--
ALTER TABLE `_documents_rattachement`
  ADD CONSTRAINT `_documents_rattachement_ibfk_1` FOREIGN KEY (`doc_cleunik`) REFERENCES `_documents` (`doc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_documents_rss`
--
ALTER TABLE `_documents_rss`
  ADD CONSTRAINT `FK_documents_rss_1` FOREIGN KEY (`doc_cleunik`) REFERENCES `_documents` (`doc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_documents_rss_2` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_documents_rss_actions`
--
ALTER TABLE `_documents_rss_actions`
  ADD CONSTRAINT `FK_documents_rss_actions_1` FOREIGN KEY (`doc_cleunik`) REFERENCES `_documents_rss` (`doc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_documents_rss_actions_2` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_doc_blanc`
--
ALTER TABLE `_doc_blanc`
  ADD CONSTRAINT `Con_doc_blanc_1` FOREIGN KEY (`doc_cleunik`) REFERENCES `_documents` (`doc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Con_doc_blanc_2` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_doc_noire`
--
ALTER TABLE `_doc_noire`
  ADD CONSTRAINT `Con_doc_noire_1` FOREIGN KEY (`doc_cleunik`) REFERENCES `_documents` (`doc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Con_doc_noire_2` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_droits_cpt_bal`
--
ALTER TABLE `_droits_cpt_bal`
  ADD CONSTRAINT `_droits_cpt_bal_ibfk_1` FOREIGN KEY (`uticptbal_cleunik`) REFERENCES `_uti_cpt_bal` (`uticptbal_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_droits_cpt_bal_ibfk_2` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_droits_doc`
--
ALTER TABLE `_droits_doc`
  ADD CONSTRAINT `Con_documents_droits_doc` FOREIGN KEY (`doc_cleunik`) REFERENCES `_documents` (`doc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Con_utilisateur_droits_doc` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_droits_panier`
--
ALTER TABLE `_droits_panier`
  ADD CONSTRAINT `Con_paniers_droits_01` FOREIGN KEY (`panier_cleunik`) REFERENCES `_panier` (`panier_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Con_paniers_droits_02` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_droits_uti_fen`
--
ALTER TABLE `_droits_uti_fen`
  ADD CONSTRAINT `_droits_uti_fen_ibfk_1` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_droits_uti_fen_ibfk_2` FOREIGN KEY (`fen_cleunik`) REFERENCES `_objets` (`fen_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_echeancier`
--
ALTER TABLE `_echeancier`
  ADD CONSTRAINT `echeance_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `echeance_2` FOREIGN KEY (`devise_du`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `echeance_3` FOREIGN KEY (`devise_paye`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `echeance_4` FOREIGN KEY (`mode_paiement`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `echeance_5` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_elements`
--
ALTER TABLE `_elements`
  ADD CONSTRAINT `FK__elements_2` FOREIGN KEY (`fen_cleunik`) REFERENCES `_objets` (`fen_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_elements_libelle`
--
ALTER TABLE `_elements_libelle`
  ADD CONSTRAINT `FK__elements_libelle_1` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__elements_libelle_2` FOREIGN KEY (`ele_cleunik`) REFERENCES `_elements` (`ele_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_emailing_cleweb`
--
ALTER TABLE `_emailing_cleweb`
  ADD CONSTRAINT `contrainte_email_cle_action` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_emailing_cleweb_attente`
--
ALTER TABLE `_emailing_cleweb_attente`
  ADD CONSTRAINT `contrainte_email_cle_action_attente` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_emailing_ouvre`
--
ALTER TABLE `_emailing_ouvre`
  ADD CONSTRAINT `contrainte__emailing_ouvre_01` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_emailing_refweb`
--
ALTER TABLE `_emailing_refweb`
  ADD CONSTRAINT `contrainte_email_cour_action` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_emailing_trackin`
--
ALTER TABLE `_emailing_trackin`
  ADD CONSTRAINT `contrainte__emailing_trackin_01` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_fab_entetes`
--
ALTER TABLE `_fab_entetes`
  ADD CONSTRAINT `fab_entetes_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_fab_lignes`
--
ALTER TABLE `_fab_lignes`
  ADD CONSTRAINT `fab_lignes_1` FOREIGN KEY (`fab_cleunik`) REFERENCES `_fab_entetes` (`fab_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fab_lignes_2` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fab_lignes_3` FOREIGN KEY (`statut`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_fab_lignes_nomenc`
--
ALTER TABLE `_fab_lignes_nomenc`
  ADD CONSTRAINT `FK_fab_lignes_nomenc_1` FOREIGN KEY (`fab_ligne_cleunik`) REFERENCES `_fab_lignes` (`fab_ligne_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_fab_lignes_nomenc_2` FOREIGN KEY (`art_cleunik_pere`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_fab_lignes_nomenc_3` FOREIGN KEY (`art_cleunik_fils`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_fab_lignes_nomenc_4` FOREIGN KEY (`statut`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_fab_lignes_nomenc_detail`
--
ALTER TABLE `_fab_lignes_nomenc_detail`
  ADD CONSTRAINT `FK_fab_ligne_nomenc_cleunik_1` FOREIGN KEY (`fab_ligne_nomenc_cleunik`) REFERENCES `_fab_lignes_nomenc` (`fab_ligne_nomenc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_faccli_adresses`
--
ALTER TABLE `_faccli_adresses`
  ADD CONSTRAINT `FK_faccli_adresses_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_faccli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_faccli_adresses_2` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_faccli_consignes`
--
ALTER TABLE `_faccli_consignes`
  ADD CONSTRAINT `_faccli_consignes_ibfk_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_faccli_consignes_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_faccli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_faccli_consignes_ibfk_3` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_faccli_entetes`
--
ALTER TABLE `_faccli_entetes`
  ADD CONSTRAINT `faccli_entetes_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faccli_entetes_2` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faccli_entetes_3` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faccli_entetes_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faccli_entetes_5` FOREIGN KEY (`reg_cleunik`) REFERENCES `_modereg` (`reg_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faccli_entete_6` FOREIGN KEY (`modliv`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faccli_entete_7` FOREIGN KEY (`typpor`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faccli_entete_8` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faccli_entete_9` FOREIGN KEY (`modliv_bis`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_faccli_lignes`
--
ALTER TABLE `_faccli_lignes`
  ADD CONSTRAINT `FK_faccli_ligne_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_faccli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_faccli_ligne_2` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_faccli_ligne_3` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_faccli_ligne_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_faccli_ligne_5` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_faccli_ligne_6` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_faccli_ligne_7` FOREIGN KEY (`taxes_cleunik`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_faccli_ligne_10` FOREIGN KEY (`tpf_cleunik_01`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_faccli_ligne_8` FOREIGN KEY (`unite_longueur`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_faccli_ligne_9` FOREIGN KEY (`tpf_cleunik`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_faccli_lignes_qte`
--
ALTER TABLE `_faccli_lignes_qte`
  ADD CONSTRAINT `FK_faccli_ligne_qte_1` FOREIGN KEY (`commercial_ligne_cleunik`) REFERENCES `_faccli_lignes` (`commercial_ligne_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_faccli_ligne_qte_2` FOREIGN KEY (`qte_unite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_faccli_ligne_qte_3` FOREIGN KEY (`statut`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_faccli_ligne_qte_4` FOREIGN KEY (`unite_condi`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_faccli_ligne_qte_5` FOREIGN KEY (`choix_depot`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_faccli_ligne_qte_6` FOREIGN KEY (`choix_empla`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_faccli_representants`
--
ALTER TABLE `_faccli_representants`
  ADD CONSTRAINT `_faccli_representants_ibfk_1` FOREIGN KEY (`act_cleunik_rep`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_faccli_representants_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_faccli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_faccli_transporteurs`
--
ALTER TABLE `_faccli_transporteurs`
  ADD CONSTRAINT `_faccli_transporteur_ibfk_1` FOREIGN KEY (`act_cleunik_trans`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_faccli_transporteur_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_faccli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_facfou_adresses`
--
ALTER TABLE `_facfou_adresses`
  ADD CONSTRAINT `FK_facfou_adresses_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_facfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_facfou_adresses_2` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_facfou_consignes`
--
ALTER TABLE `_facfou_consignes`
  ADD CONSTRAINT `_facfou_consignes_ibfk_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_facfou_consignes_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_facfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_facfou_consignes_ibfk_3` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_facfou_entetes`
--
ALTER TABLE `_facfou_entetes`
  ADD CONSTRAINT `facfou_entetes_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facfou_entetes_2` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facfou_entetes_3` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facfou_entetes_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facfou_entetes_5` FOREIGN KEY (`reg_cleunik`) REFERENCES `_modereg` (`reg_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facfou_entete_6` FOREIGN KEY (`modliv`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facfou_entete_7` FOREIGN KEY (`typpor`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facfou_entete_8` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facfou_entete_9` FOREIGN KEY (`modliv_bis`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_facfou_lignes`
--
ALTER TABLE `_facfou_lignes`
  ADD CONSTRAINT `FK_facfou_ligne_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_facfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_facfou_ligne_2` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_facfou_ligne_3` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_facfou_ligne_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_facfou_ligne_5` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_facfou_ligne_6` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_facfou_ligne_7` FOREIGN KEY (`taxes_cleunik`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_facfou_ligne_10` FOREIGN KEY (`tpf_cleunik_01`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_facfou_ligne_8` FOREIGN KEY (`unite_longueur`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_facfou_ligne_9` FOREIGN KEY (`tpf_cleunik`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_facfou_lignes_qte`
--
ALTER TABLE `_facfou_lignes_qte`
  ADD CONSTRAINT `FK_facfou_ligne_qte_1` FOREIGN KEY (`commercial_ligne_cleunik`) REFERENCES `_facfou_lignes` (`commercial_ligne_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_facfou_ligne_qte_2` FOREIGN KEY (`qte_unite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_facfou_ligne_qte_3` FOREIGN KEY (`statut`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_facfou_ligne_qte_4` FOREIGN KEY (`unite_condi`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_facfou_ligne_qte_5` FOREIGN KEY (`choix_depot`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_facfou_ligne_qte_6` FOREIGN KEY (`choix_empla`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_facfou_representants`
--
ALTER TABLE `_facfou_representants`
  ADD CONSTRAINT `_facfou_representants_ibfk_1` FOREIGN KEY (`act_cleunik_rep`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_facfou_representants_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_facfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_facfou_transporteurs`
--
ALTER TABLE `_facfou_transporteurs`
  ADD CONSTRAINT `_facfou_transporteur_ibfk_1` FOREIGN KEY (`act_cleunik_trans`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_facfou_transporteur_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_facfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_fax_en`
--
ALTER TABLE `_fax_en`
  ADD CONSTRAINT `contrainte_fax_action` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_graal`
--
ALTER TABLE `_graal`
  ADD CONSTRAINT `contrainte_acteurs_grc` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrainte_actions_grc` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrainte_act_interlo_grc` FOREIGN KEY (`int_cleunik`) REFERENCES `_act_interlo` (`int_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_graal_choix` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_graal_act`
--
ALTER TABLE `_graal_act`
  ADD CONSTRAINT `contrainte_actions_graal_act1` FOREIGN KEY (`action_cleunik_gauche`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrainte_actions_graal_act2` FOREIGN KEY (`action_cleunik_droite`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrainte_actions_graal_act3` FOREIGN KEY (`choix_cleunik_droite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrainte_actions_graal_act4` FOREIGN KEY (`choix_cleunik_gauche`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_inventaire_lignes`
--
ALTER TABLE `_inventaire_lignes`
  ADD CONSTRAINT `_inventaire_lignes_ibfk_1` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_inventaire_lignes_ibfk_2` FOREIGN KEY (`inv_cleunik`) REFERENCES `_inventaire` (`inv_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_livcli_adresses`
--
ALTER TABLE `_livcli_adresses`
  ADD CONSTRAINT `FK_livcli_adresses_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_livcli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_livcli_adresses_2` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_livcli_consignes`
--
ALTER TABLE `_livcli_consignes`
  ADD CONSTRAINT `_livcli_consignes_ibfk_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_livcli_consignes_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_livcli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_livcli_consignes_ibfk_3` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_livcli_entetes`
--
ALTER TABLE `_livcli_entetes`
  ADD CONSTRAINT `livcli_entetes_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `livcli_entetes_2` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `livcli_entetes_3` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `livcli_entetes_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `livcli_entetes_5` FOREIGN KEY (`reg_cleunik`) REFERENCES `_modereg` (`reg_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `livcli_entete_6` FOREIGN KEY (`modliv`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `livcli_entete_7` FOREIGN KEY (`typpor`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `livcli_entete_8` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `livcli_entete_9` FOREIGN KEY (`modliv_bis`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_livcli_lignes`
--
ALTER TABLE `_livcli_lignes`
  ADD CONSTRAINT `FK_livcli_ligne_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_livcli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_livcli_ligne_2` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_livcli_ligne_3` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_livcli_ligne_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_livcli_ligne_5` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_livcli_ligne_6` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_livcli_ligne_7` FOREIGN KEY (`taxes_cleunik`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_livcli_ligne_10` FOREIGN KEY (`tpf_cleunik_01`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_livcli_ligne_8` FOREIGN KEY (`unite_longueur`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_livcli_ligne_9` FOREIGN KEY (`tpf_cleunik`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_livcli_lignes_qte`
--
ALTER TABLE `_livcli_lignes_qte`
  ADD CONSTRAINT `FK_livcli_ligne_qte_1` FOREIGN KEY (`commercial_ligne_cleunik`) REFERENCES `_livcli_lignes` (`commercial_ligne_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_livcli_ligne_qte_2` FOREIGN KEY (`qte_unite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_livcli_ligne_qte_3` FOREIGN KEY (`statut`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_livcli_ligne_qte_4` FOREIGN KEY (`unite_condi`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_livcli_ligne_qte_5` FOREIGN KEY (`choix_depot`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_livcli_ligne_qte_6` FOREIGN KEY (`choix_empla`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_livcli_representants`
--
ALTER TABLE `_livcli_representants`
  ADD CONSTRAINT `_livcli_representants_ibfk_1` FOREIGN KEY (`act_cleunik_rep`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_livcli_representants_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_livcli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_livcli_transporteurs`
--
ALTER TABLE `_livcli_transporteurs`
  ADD CONSTRAINT `_livcli_transporteur_ibfk_1` FOREIGN KEY (`act_cleunik_trans`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_livcli_transporteur_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_livcli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_modereg_det`
--
ALTER TABLE `_modereg_det`
  ADD CONSTRAINT `modereg_det_01` FOREIGN KEY (`reg_cleunik`) REFERENCES `_modereg` (`reg_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `modereg_det_02` FOREIGN KEY (`mode_paiement`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `modereg_det_03` FOREIGN KEY (`type_paiement`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_mouvements_stock`
--
ALTER TABLE `_mouvements_stock`
  ADD CONSTRAINT `_mouvements_stock_ibfk_1` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_mouvements_stock_ibfk_2` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_mouvements_stock_ibfk_3` FOREIGN KEY (`int_cleunik`) REFERENCES `_act_interlo` (`int_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_mouvements_stock_ibfk_4` FOREIGN KEY (`choix_depot`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_mouvements_stock_ibfk_5` FOREIGN KEY (`choix_empla`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_mouvements_stock_ibfk_6` FOREIGN KEY (`genre_mvt`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_nomenclatures_achats`
--
ALTER TABLE `_nomenclatures_achats`
  ADD CONSTRAINT `FK_nomenclatures_achat_1` FOREIGN KEY (`art_cleunik_pere`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_nomenclatures_achat_2` FOREIGN KEY (`art_cleunik_fils`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_nomenclatures_fab`
--
ALTER TABLE `_nomenclatures_fab`
  ADD CONSTRAINT `FK_nomenclatures_fab_1` FOREIGN KEY (`art_cleunik_pere`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_nomenclatures_fab_2` FOREIGN KEY (`art_cleunik_fils`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_nomenclatures_ventes`
--
ALTER TABLE `_nomenclatures_ventes`
  ADD CONSTRAINT `FK_nomenclatures_vente_1` FOREIGN KEY (`art_cleunik_pere`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_nomenclatures_vente_2` FOREIGN KEY (`art_cleunik_fils`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_objets_libelle`
--
ALTER TABLE `_objets_libelle`
  ADD CONSTRAINT `FK__objets_libelle_1` FOREIGN KEY (`fen_cleunik`) REFERENCES `_objets` (`fen_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__objets_libelle_2` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_offcli_adresses`
--
ALTER TABLE `_offcli_adresses`
  ADD CONSTRAINT `FK_offcli_adresses_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_offcli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_offcli_adresses_2` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_offcli_consignes`
--
ALTER TABLE `_offcli_consignes`
  ADD CONSTRAINT `_offcli_consignes_ibfk_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_offcli_consignes_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_offcli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_offcli_consignes_ibfk_3` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_offcli_entetes`
--
ALTER TABLE `_offcli_entetes`
  ADD CONSTRAINT `offcli_entetes_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offcli_entetes_2` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offcli_entetes_3` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offcli_entetes_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offcli_entetes_5` FOREIGN KEY (`reg_cleunik`) REFERENCES `_modereg` (`reg_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offcli_entete_6` FOREIGN KEY (`modliv`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offcli_entete_7` FOREIGN KEY (`typpor`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offcli_entete_8` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offcli_entete_9` FOREIGN KEY (`modliv_bis`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_offcli_lignes`
--
ALTER TABLE `_offcli_lignes`
  ADD CONSTRAINT `FK_offcli_ligne_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_offcli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_offcli_ligne_2` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_offcli_ligne_3` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_offcli_ligne_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_offcli_ligne_5` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_offcli_ligne_6` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_offcli_ligne_7` FOREIGN KEY (`taxes_cleunik`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_offcli_ligne_10` FOREIGN KEY (`tpf_cleunik_01`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_offcli_ligne_8` FOREIGN KEY (`unite_longueur`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_offcli_ligne_9` FOREIGN KEY (`tpf_cleunik`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_offcli_lignes_qte`
--
ALTER TABLE `_offcli_lignes_qte`
  ADD CONSTRAINT `FK_offcli_ligne_qte_1` FOREIGN KEY (`commercial_ligne_cleunik`) REFERENCES `_offcli_lignes` (`commercial_ligne_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_offcli_ligne_qte_2` FOREIGN KEY (`qte_unite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_offcli_ligne_qte_3` FOREIGN KEY (`statut`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_offcli_ligne_qte_4` FOREIGN KEY (`unite_condi`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_offcli_ligne_qte_5` FOREIGN KEY (`choix_depot`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_offcli_ligne_qte_6` FOREIGN KEY (`choix_empla`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_offcli_representants`
--
ALTER TABLE `_offcli_representants`
  ADD CONSTRAINT `_offcli_representants_ibfk_1` FOREIGN KEY (`act_cleunik_rep`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_offcli_representants_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_offcli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_offcli_transporteurs`
--
ALTER TABLE `_offcli_transporteurs`
  ADD CONSTRAINT `_offcli_transporteur_ibfk_1` FOREIGN KEY (`act_cleunik_trans`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_offcli_transporteur_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_offcli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_panier`
--
ALTER TABLE `_panier`
  ADD CONSTRAINT `_panier_ibfk_1` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_panier_resultats`
--
ALTER TABLE `_panier_resultats`
  ADD CONSTRAINT `contrainte_panier_panier_resultats` FOREIGN KEY (`panier_cleunik`) REFERENCES `_panier` (`panier_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_param_categories_compta`
--
ALTER TABLE `_param_categories_compta`
  ADD CONSTRAINT `_param_categories_compta_ibfk_1` FOREIGN KEY (`compte_vente_port`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_param_categories_compta_ibfk_2` FOREIGN KEY (`compte_vente_divers`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_param_categories_compta_ibfk_3` FOREIGN KEY (`compte_achat_port`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_param_categories_compta_ibfk_4` FOREIGN KEY (`compte_achat_divers`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_param_categories_compta_ibfk_5` FOREIGN KEY (`taxes_vente_port`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_param_categories_compta_ibfk_6` FOREIGN KEY (`taxes_vente_divers`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_param_categories_compta_ibfk_7` FOREIGN KEY (`taxes_achat_port`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_param_categories_compta_ibfk_8` FOREIGN KEY (`taxes_achat_divers`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_param_taxes`
--
ALTER TABLE `_param_taxes`
  ADD CONSTRAINT `_param_taxes_ibfk_1` FOREIGN KEY (`compte_vente`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_param_taxes_ibfk_2` FOREIGN KEY (`compte_achat`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_param_tpf`
--
ALTER TABLE `_param_tpf`
  ADD CONSTRAINT `_param_tpf_ibfk_1` FOREIGN KEY (`compte_vente`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_param_tpf_ibfk_2` FOREIGN KEY (`compte_achat`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_param_tpf_ibfk_3` FOREIGN KEY (`taxes_cleunik`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_recfou_adresses`
--
ALTER TABLE `_recfou_adresses`
  ADD CONSTRAINT `FK_recfou_adresses_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_recfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_recfou_adresses_2` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_recfou_consignes`
--
ALTER TABLE `_recfou_consignes`
  ADD CONSTRAINT `_recfou_consignes_ibfk_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_recfou_consignes_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_recfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_recfou_consignes_ibfk_3` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_recfou_entetes`
--
ALTER TABLE `_recfou_entetes`
  ADD CONSTRAINT `recfou_entetes_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recfou_entetes_2` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recfou_entetes_3` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recfou_entetes_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recfou_entetes_5` FOREIGN KEY (`reg_cleunik`) REFERENCES `_modereg` (`reg_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recfou_entete_6` FOREIGN KEY (`modliv`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recfou_entete_7` FOREIGN KEY (`typpor`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recfou_entete_8` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recfou_entete_9` FOREIGN KEY (`modliv_bis`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_recfou_lignes`
--
ALTER TABLE `_recfou_lignes`
  ADD CONSTRAINT `FK_recfou_ligne_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_recfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_recfou_ligne_2` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_recfou_ligne_3` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_recfou_ligne_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_recfou_ligne_5` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_recfou_ligne_6` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_recfou_ligne_7` FOREIGN KEY (`taxes_cleunik`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_recfou_ligne_10` FOREIGN KEY (`tpf_cleunik_01`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_recfou_ligne_8` FOREIGN KEY (`unite_longueur`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_recfou_ligne_9` FOREIGN KEY (`tpf_cleunik`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_recfou_lignes_qte`
--
ALTER TABLE `_recfou_lignes_qte`
  ADD CONSTRAINT `FK_recfou_ligne_qte_1` FOREIGN KEY (`commercial_ligne_cleunik`) REFERENCES `_recfou_lignes` (`commercial_ligne_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_recfou_ligne_qte_2` FOREIGN KEY (`qte_unite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_recfou_ligne_qte_3` FOREIGN KEY (`statut`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_recfou_ligne_qte_4` FOREIGN KEY (`unite_condi`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_recfou_ligne_qte_5` FOREIGN KEY (`choix_depot`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_recfou_ligne_qte_6` FOREIGN KEY (`choix_empla`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_recfou_representants`
--
ALTER TABLE `_recfou_representants`
  ADD CONSTRAINT `_recfou_representants_ibfk_1` FOREIGN KEY (`act_cleunik_rep`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_recfou_representants_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_recfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_recfou_transporteurs`
--
ALTER TABLE `_recfou_transporteurs`
  ADD CONSTRAINT `_recfou_transporteur_ibfk_1` FOREIGN KEY (`act_cleunik_trans`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_recfou_transporteur_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_recfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_relfou_adresses`
--
ALTER TABLE `_relfou_adresses`
  ADD CONSTRAINT `FK_relfou_adresses_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_relfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_relfou_adresses_2` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_relfou_entetes`
--
ALTER TABLE `_relfou_entetes`
  ADD CONSTRAINT `relfou_entetes_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relfou_entetes_2` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relfou_entetes_3` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relfou_entetes_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relfou_entetes_5` FOREIGN KEY (`reg_cleunik`) REFERENCES `_modereg` (`reg_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relfou_entete_6` FOREIGN KEY (`modliv`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relfou_entete_7` FOREIGN KEY (`typpor`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relfou_entete_8` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relfou_entete_9` FOREIGN KEY (`modliv_bis`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_relfou_lignes`
--
ALTER TABLE `_relfou_lignes`
  ADD CONSTRAINT `FK_relfou_ligne_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_relfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_relfou_ligne_2` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_relfou_ligne_3` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_relfou_ligne_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_relfou_ligne_5` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_relfou_ligne_6` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_relfou_ligne_7` FOREIGN KEY (`taxes_cleunik`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_relfou_ligne_10` FOREIGN KEY (`tpf_cleunik_01`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_relfou_ligne_8` FOREIGN KEY (`unite_longueur`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_relfou_ligne_9` FOREIGN KEY (`tpf_cleunik`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_relfou_lignes_qte`
--
ALTER TABLE `_relfou_lignes_qte`
  ADD CONSTRAINT `FK_relfou_ligne_qte_1` FOREIGN KEY (`commercial_ligne_cleunik`) REFERENCES `_relfou_lignes` (`commercial_ligne_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_relfou_ligne_qte_2` FOREIGN KEY (`qte_unite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_relfou_ligne_qte_3` FOREIGN KEY (`statut`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_relfou_ligne_qte_4` FOREIGN KEY (`unite_condi`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_relfou_ligne_qte_5` FOREIGN KEY (`choix_depot`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_relfou_ligne_qte_6` FOREIGN KEY (`choix_empla`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_retcli_adresses`
--
ALTER TABLE `_retcli_adresses`
  ADD CONSTRAINT `FK_retcli_adresses_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_retcli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retcli_adresses_2` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_retcli_consignes`
--
ALTER TABLE `_retcli_consignes`
  ADD CONSTRAINT `_retcli_consignes_ibfk_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_retcli_consignes_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_retcli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_retcli_consignes_ibfk_3` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_retcli_entetes`
--
ALTER TABLE `_retcli_entetes`
  ADD CONSTRAINT `retcli_entetes_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retcli_entetes_2` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retcli_entetes_3` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retcli_entetes_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retcli_entetes_5` FOREIGN KEY (`reg_cleunik`) REFERENCES `_modereg` (`reg_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retcli_entete_6` FOREIGN KEY (`modliv`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retcli_entete_7` FOREIGN KEY (`typpor`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retcli_entete_8` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retcli_entete_9` FOREIGN KEY (`modliv_bis`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_retcli_lignes`
--
ALTER TABLE `_retcli_lignes`
  ADD CONSTRAINT `FK_retcli_ligne_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_retcli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retcli_ligne_2` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retcli_ligne_3` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retcli_ligne_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retcli_ligne_5` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retcli_ligne_6` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retcli_ligne_7` FOREIGN KEY (`taxes_cleunik`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_retcli_ligne_10` FOREIGN KEY (`tpf_cleunik_01`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_retcli_ligne_8` FOREIGN KEY (`unite_longueur`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_retcli_ligne_9` FOREIGN KEY (`tpf_cleunik`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_retcli_lignes_qte`
--
ALTER TABLE `_retcli_lignes_qte`
  ADD CONSTRAINT `FK_retcli_ligne_qte_1` FOREIGN KEY (`commercial_ligne_cleunik`) REFERENCES `_retcli_lignes` (`commercial_ligne_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retcli_ligne_qte_2` FOREIGN KEY (`qte_unite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retcli_ligne_qte_3` FOREIGN KEY (`statut`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retcli_ligne_qte_4` FOREIGN KEY (`unite_condi`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retcli_ligne_qte_5` FOREIGN KEY (`choix_depot`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retcli_ligne_qte_6` FOREIGN KEY (`choix_empla`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_retcli_representants`
--
ALTER TABLE `_retcli_representants`
  ADD CONSTRAINT `_retcli_representants_ibfk_1` FOREIGN KEY (`act_cleunik_rep`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_retcli_representants_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_retcli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_retcli_transporteurs`
--
ALTER TABLE `_retcli_transporteurs`
  ADD CONSTRAINT `_retcli_transporteur_ibfk_1` FOREIGN KEY (`act_cleunik_trans`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_retcli_transporteur_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_retcli_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_retfou_adresses`
--
ALTER TABLE `_retfou_adresses`
  ADD CONSTRAINT `FK_retfou_adresses_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_retfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retfou_adresses_2` FOREIGN KEY (`choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_retfou_consignes`
--
ALTER TABLE `_retfou_consignes`
  ADD CONSTRAINT `_retfou_consignes_ibfk_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_retfou_consignes_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_retfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_retfou_consignes_ibfk_3` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_retfou_entetes`
--
ALTER TABLE `_retfou_entetes`
  ADD CONSTRAINT `retfou_entetes_1` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retfou_entetes_2` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retfou_entetes_3` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retfou_entetes_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retfou_entetes_5` FOREIGN KEY (`reg_cleunik`) REFERENCES `_modereg` (`reg_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retfou_entete_6` FOREIGN KEY (`modliv`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retfou_entete_7` FOREIGN KEY (`typpor`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retfou_entete_8` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retfou_entete_9` FOREIGN KEY (`modliv_bis`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_retfou_lignes`
--
ALTER TABLE `_retfou_lignes`
  ADD CONSTRAINT `FK_retfou_ligne_1` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_retfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retfou_ligne_2` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retfou_ligne_3` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retfou_ligne_4` FOREIGN KEY (`catcompta_cleunik`) REFERENCES `_param_categories_compta` (`catcompta_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retfou_ligne_5` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retfou_ligne_6` FOREIGN KEY (`tarif_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retfou_ligne_7` FOREIGN KEY (`taxes_cleunik`) REFERENCES `_param_taxes` (`taxes_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_retfou_ligne_10` FOREIGN KEY (`tpf_cleunik_01`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_retfou_ligne_8` FOREIGN KEY (`unite_longueur`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_FK_retfou_ligne_9` FOREIGN KEY (`tpf_cleunik`) REFERENCES `_param_tpf` (`tpf_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_retfou_lignes_qte`
--
ALTER TABLE `_retfou_lignes_qte`
  ADD CONSTRAINT `FK_retfou_ligne_qte_1` FOREIGN KEY (`commercial_ligne_cleunik`) REFERENCES `_retfou_lignes` (`commercial_ligne_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retfou_ligne_qte_2` FOREIGN KEY (`qte_unite`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retfou_ligne_qte_3` FOREIGN KEY (`statut`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retfou_ligne_qte_4` FOREIGN KEY (`unite_condi`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retfou_ligne_qte_5` FOREIGN KEY (`choix_depot`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_retfou_ligne_qte_6` FOREIGN KEY (`choix_empla`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_retfou_representants`
--
ALTER TABLE `_retfou_representants`
  ADD CONSTRAINT `_retfou_representants_ibfk_1` FOREIGN KEY (`act_cleunik_rep`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_retfou_representants_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_retfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_retfou_transporteurs`
--
ALTER TABLE `_retfou_transporteurs`
  ADD CONSTRAINT `_retfou_transporteur_ibfk_1` FOREIGN KEY (`act_cleunik_trans`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_retfou_transporteur_ibfk_2` FOREIGN KEY (`commercial_cleunik`) REFERENCES `_retfou_entetes` (`commercial_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_treso_journal`
--
ALTER TABLE `_treso_journal`
  ADD CONSTRAINT `_treso_journal_ibfk_1` FOREIGN KEY (`compte_comptable`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_treso_reglement_cli`
--
ALTER TABLE `_treso_reglement_cli`
  ADD CONSTRAINT `treso_reglement_cli_1` FOREIGN KEY (`journal_cleunik`) REFERENCES `_treso_journal` (`journal_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treso_reglement_cli_2` FOREIGN KEY (`option_remise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treso_reglement_cli_3` FOREIGN KEY (`devise_paye`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treso_reglement_cli_4` FOREIGN KEY (`mode_paiement`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treso_reglement_cli_5` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treso_reglement_cli_6` FOREIGN KEY (`type_ecart`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_treso_reglement_cli_detail`
--
ALTER TABLE `_treso_reglement_cli_detail`
  ADD CONSTRAINT `treso_reglement_detail_cli_1` FOREIGN KEY (`reglement_cleunik`) REFERENCES `_treso_reglement_cli` (`reglement_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treso_reglement_detail_cli_2` FOREIGN KEY (`echeance_cleunik`) REFERENCES `_echeancier` (`echeance_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treso_reglement_detail_cli_3` FOREIGN KEY (`devise_paye`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_treso_reglement_cli_remise`
--
ALTER TABLE `_treso_reglement_cli_remise`
  ADD CONSTRAINT `treso_reglement_cli_remise_1` FOREIGN KEY (`reglement_cleunik`) REFERENCES `_treso_reglement_cli` (`reglement_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treso_reglement_cli_remise_2` FOREIGN KEY (`remise_cleunik`) REFERENCES `_treso_remise` (`remise_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_treso_reglement_fou`
--
ALTER TABLE `_treso_reglement_fou`
  ADD CONSTRAINT `treso_reglement_fou_1` FOREIGN KEY (`journal_cleunik`) REFERENCES `_treso_journal` (`journal_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treso_reglement_fou_2` FOREIGN KEY (`option_remise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treso_reglement_fou_3` FOREIGN KEY (`devise_paye`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treso_reglement_fou_4` FOREIGN KEY (`mode_paiement`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treso_reglement_fou_5` FOREIGN KEY (`pc_cleunik`) REFERENCES `_param_pc` (`pc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treso_reglement_fou_6` FOREIGN KEY (`type_ecart`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_treso_reglement_fou_detail`
--
ALTER TABLE `_treso_reglement_fou_detail`
  ADD CONSTRAINT `treso_reglement_detail_fou_1` FOREIGN KEY (`reglement_cleunik`) REFERENCES `_treso_reglement_fou` (`reglement_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treso_reglement_detail_fou_2` FOREIGN KEY (`echeance_cleunik`) REFERENCES `_echeancier` (`echeance_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treso_reglement_detail_fou_3` FOREIGN KEY (`devise_paye`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_treso_reglement_fou_remise`
--
ALTER TABLE `_treso_reglement_fou_remise`
  ADD CONSTRAINT `treso_reglement_fou_remise_1` FOREIGN KEY (`reglement_cleunik`) REFERENCES `_treso_reglement_fou` (`reglement_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treso_reglement_fou_remise_2` FOREIGN KEY (`remise_cleunik`) REFERENCES `_treso_remise` (`remise_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_treso_remise`
--
ALTER TABLE `_treso_remise`
  ADD CONSTRAINT `FK_treso_remise_1` FOREIGN KEY (`devise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_treso_remise_2` FOREIGN KEY (`journal_cleunik`) REFERENCES `_treso_journal` (`journal_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_treso_remise_3` FOREIGN KEY (`mode_paiement`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_treso_remise_4` FOREIGN KEY (`option_remise`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_treso_remise_5` FOREIGN KEY (`action_cleunik`) REFERENCES `_actions` (`action_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_univente_par_con`
--
ALTER TABLE `_univente_par_con`
  ADD CONSTRAINT `con_univente_par_con_01` FOREIGN KEY (`con_choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `con_univente_par_con_02` FOREIGN KEY (`univente_choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `con_univente_par_con_03` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_uni_par_con`
--
ALTER TABLE `_uni_par_con`
  ADD CONSTRAINT `contrainte__uni_par_con_01` FOREIGN KEY (`con_choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrainte__uni_par_con_02` FOREIGN KEY (`uni_choix_cleunik`) REFERENCES `_choix` (`choix_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrainte__uni_par_con_03` FOREIGN KEY (`art_cleunik`) REFERENCES `_article` (`art_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_uti_connexions`
--
ALTER TABLE `_uti_connexions`
  ADD CONSTRAINT `_uti_connexions_ibfk_1` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_uti_cpt_bal`
--
ALTER TABLE `_uti_cpt_bal`
  ADD CONSTRAINT `_uti_cpt_bal_ibfk_1` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_uti_fen_cosmetique`
--
ALTER TABLE `_uti_fen_cosmetique`
  ADD CONSTRAINT `_uti_fen_cos_ibfk_1` FOREIGN KEY (`uti_cleunik`) REFERENCES `_utilisateur` (`uti_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_w_import_acteurs`
--
ALTER TABLE `_w_import_acteurs`
  ADD CONSTRAINT `FK_w_import_acteurs_1` FOREIGN KEY (`doc_cleunik`) REFERENCES `_documents` (`doc_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_w_import_courriel_ligne`
--
ALTER TABLE `_w_import_courriel_ligne`
  ADD CONSTRAINT `FK__import_courriel_ligne_1` FOREIGN KEY (`imp_cleunik`) REFERENCES `_w_import_courriel_entete` (`imp_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_z_baronnat_acteurs_clients`
--
ALTER TABLE `_z_baronnat_acteurs_clients`
  ADD CONSTRAINT `_perso_baronnat_acteurs_clients_ibfk_1` FOREIGN KEY (`act_cleunik`) REFERENCES `_acteurs` (`act_cleunik`) ON DELETE CASCADE ON UPDATE CASCADE;

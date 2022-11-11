-- phpMyAdmin SQL Dump
-- version 2.11.8.1deb5
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 11 Novembre 2022 à 13:34
-- Version du serveur: 5.0.51
-- Version de PHP: 5.2.6-1+lenny3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `graal_emailing_reference`
--

--
-- Contenu de la table `_utilisateur`
--

INSERT INTO `_utilisateur` (`uti_cleunik`, `prenom`, `patronyme`, `codealphanum15`, `blocnotebrut`, `blocnotertf`, `dateheurevalidite`, `param_environ`, `borne_mini`, `borne_maxi`, `identifiant`, `motdepasse`, `c_uuid`, `langue_appli`, `int_cleunik`, `couleurfocus`, `css`, `actif`, `genre`) VALUES
(1, 'Christophe', 'Charron', 'xof', '', NULL, NULL, '<?xml version="1.0" encoding="utf-8"?><parametres><selection_article data="1"/><selection_acteur data="8"/><focus_background_color data="#80FF80"/><focus_color data="red"/><window_background_color data="#dfd9f5"/><selection_interlocuteur data="3"/><police_generale data="Verdana, Geneva, sans-serif"/><table_ligne_selectionnee_color data="#ffe0e0"/><table_ligne_impaire_color data="#ffffc0"/><table_ligne_paire_color data="#ffe0e0"/><selection_telephone data="4"/><selection_fax data="4"/><selection_courriel data="4"/><selection_postale data="6"/><selection_geophysique data="1"/><selection_site data="7"/><selection_note data="1"/><selection_document data="3"/><selection_pseudodocument data="1"/><activite_background_color data="#80FF80"/><page_accueil data="0"/><vl_selart_nbcaracrech data="3"/><vl_selact_nbcaracrech data="0"/><vl_selint_nbcaracrech data="5"/><vl_seltel_nbcaracrech data="3"/><vl_selfax_nbcaracrech data="3"/><vl_selmel_nbcaracrech data="5"/><vl_selpos_nbcaracrech data="3"/><vl_selgeo_nbcaracrech data="3"/><vl_selweb_nbcaracrech data="3"/><vl_selnot_nbcaracrech data="3"/><vl_seldoc_nbcaracrech data="3"/><vl_sellie_nbcaracrech data="3"/><gesdoc_ml_zone data="1"/></parametres>', 10000000, 19999999, 'moi', 'ad9e77b3e911d9f401c268d1d4468d54cb127609', 'bd577908-5496-1029-9c29-001109b5c1d9', 120131, 27162, '#80FF80', '_graal.css', 1, 1),
(0, 'Gentil', 'Badaud', '', '', NULL, NULL, '<?xml version="1.0" encoding="utf-8"?><parametres><selection_article data="1"/><selection_acteur data="2"/></parametres>', 0, 9999999, '', NULL, 'bd578100-5496-1029-9c29-001109b5c1d9', 120131, 0, '#80FF80', '_graal.css', 2, 1),
(512, 'Lecteur', 'Externe', 'xxxxx', '', NULL, NULL, '<?xml version="1.0" encoding="utf-8"?><parametres><selection_article data="1"/><selection_acteur data="2"/><focus_background_color data="#80FF80"/><focus_color data="red"/><window_background_color data="#dfd9f5"/><selection_interlocuteur data="1"/><police_generale data="Verdana, Geneva, sans-serif"/><table_ligne_selectionnee_color data="#ffe0e0"/><table_ligne_impaire_color data="#ffffc0"/><table_ligne_paire_color data="#ffe0e0"/><selection_telephone data="1"/><selection_fax data="1"/><selection_courriel data="1"/><selection_postale data="1"/><selection_geophysique data="1"/><selection_site data="1"/><selection_note data="1"/><selection_document data="1"/><selection_pseudodocument data="1"/><activite_background_color data="#80FF80"/><page_accueil data="0"/><vl_selart_nbcaracrech data="3"/><vl_selact_nbcaracrech data="0"/><vl_selint_nbcaracrech data="3"/><vl_seltel_nbcaracrech data="3"/><vl_selfax_nbcaracrech data="3"/><vl_selmel_nbcaracrech data="3"/><vl_selpos_nbcaracrech data="3"/><vl_selgeo_nbcaracrech data="3"/><vl_selweb_nbcaracrech data="3"/><vl_selnot_nbcaracrech data="3"/><vl_seldoc_nbcaracrech data="3"/><vl_sellie_nbcaracrech data="3"/><gesdoc_ml_zone data="1"/></parametres>', 100000000, 109999999, 'LecteurExterne', '7c7ec48fb9495da4d24f362d349f6d379926a568', 'e005e9dc-8452-102c-a49b-001cc01a9a40', 120131, 0, '#80FF80', '_graal.css', 1, 2);

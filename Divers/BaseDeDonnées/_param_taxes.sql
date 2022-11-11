-- phpMyAdmin SQL Dump
-- version 2.11.8.1deb5
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 11 Novembre 2022 à 11:56
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
-- Contenu de la table `_param_taxes`
--

INSERT INTO `_param_taxes` (`taxes_cleunik`, `code`, `denomination`, `taux`, `compte_vente`, `compte_achat`, `dateheuremodification`, `dateheurecreation`, `actif`) VALUES
(-1, '0', 'Pas de taxe', 0.00000, -1, -1, '1961-01-23 00:00:00', '1961-01-23 00:00:00', 1),
(10000002, '2', 'TVA 5.5 % ', 5.50000, 10000002, 10000004, '2008-12-10 18:13:04', '2001-04-25 15:08:41', 1),
(10000005, '1', 'Tva 19.6 %', 19.60000, 10000001, 10000003, '2008-12-10 18:14:38', '2001-04-25 15:08:41', 1);

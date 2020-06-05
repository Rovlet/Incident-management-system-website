-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 29 Maj 2020, 18:56
-- Wersja serwera: 10.4.6-MariaDB
-- Wersja PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `mydb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `arkusz`
--

CREATE TABLE `arkusz` (
  `idArkusz` int(11) NOT NULL,
  `id_ostateczna_diagnoza` smallint(6) DEFAULT NULL,
  `id_rodzaj_zdarzenia` smallint(6) DEFAULT NULL,
  `id_zgloszenie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add uzytkownik', 6, 'add_uzytkownik'),
(22, 'Can change uzytkownik', 6, 'change_uzytkownik'),
(23, 'Can delete uzytkownik', 6, 'delete_uzytkownik'),
(24, 'Can view uzytkownik', 6, 'view_uzytkownik'),
(25, 'Can add arkusz', 7, 'add_arkusz'),
(26, 'Can change arkusz', 7, 'change_arkusz'),
(27, 'Can delete arkusz', 7, 'delete_arkusz'),
(28, 'Can view arkusz', 7, 'view_arkusz'),
(29, 'Can add diagnoza', 8, 'add_diagnoza'),
(30, 'Can change diagnoza', 8, 'change_diagnoza'),
(31, 'Can delete diagnoza', 8, 'delete_diagnoza'),
(32, 'Can view diagnoza', 8, 'view_diagnoza'),
(33, 'Can add dzial', 9, 'add_dzial'),
(34, 'Can change dzial', 9, 'change_dzial'),
(35, 'Can delete dzial', 9, 'delete_dzial'),
(36, 'Can view dzial', 9, 'view_dzial'),
(37, 'Can add osoba', 10, 'add_osoba'),
(38, 'Can change osoba', 10, 'change_osoba'),
(39, 'Can delete osoba', 10, 'delete_osoba'),
(40, 'Can view osoba', 10, 'view_osoba'),
(41, 'Can add poziom incydentu', 11, 'add_poziomincydentu'),
(42, 'Can change poziom incydentu', 11, 'change_poziomincydentu'),
(43, 'Can delete poziom incydentu', 11, 'delete_poziomincydentu'),
(44, 'Can view poziom incydentu', 11, 'view_poziomincydentu'),
(45, 'Can add pracownik', 12, 'add_pracownik'),
(46, 'Can change pracownik', 12, 'change_pracownik'),
(47, 'Can delete pracownik', 12, 'delete_pracownik'),
(48, 'Can view pracownik', 12, 'view_pracownik'),
(49, 'Can add priorytet', 13, 'add_priorytet'),
(50, 'Can change priorytet', 13, 'change_priorytet'),
(51, 'Can delete priorytet', 13, 'delete_priorytet'),
(52, 'Can view priorytet', 13, 'view_priorytet'),
(53, 'Can add pytanie', 14, 'add_pytanie'),
(54, 'Can change pytanie', 14, 'change_pytanie'),
(55, 'Can delete pytanie', 14, 'delete_pytanie'),
(56, 'Can view pytanie', 14, 'view_pytanie'),
(57, 'Can add rodzaj incydentu', 15, 'add_rodzajincydentu'),
(58, 'Can change rodzaj incydentu', 15, 'change_rodzajincydentu'),
(59, 'Can delete rodzaj incydentu', 15, 'delete_rodzajincydentu'),
(60, 'Can view rodzaj incydentu', 15, 'view_rodzajincydentu'),
(61, 'Can add rodzaj zdarzenia', 16, 'add_rodzajzdarzenia'),
(62, 'Can change rodzaj zdarzenia', 16, 'change_rodzajzdarzenia'),
(63, 'Can delete rodzaj zdarzenia', 16, 'delete_rodzajzdarzenia'),
(64, 'Can view rodzaj zdarzenia', 16, 'view_rodzajzdarzenia'),
(65, 'Can add sprawa', 17, 'add_sprawa'),
(66, 'Can change sprawa', 17, 'change_sprawa'),
(67, 'Can delete sprawa', 17, 'delete_sprawa'),
(68, 'Can view sprawa', 17, 'view_sprawa'),
(69, 'Can add status', 18, 'add_status'),
(70, 'Can change status', 18, 'change_status'),
(71, 'Can delete status', 18, 'delete_status'),
(72, 'Can view status', 18, 'view_status'),
(73, 'Can add zrodlo incydentu', 19, 'add_zrodloincydentu'),
(74, 'Can change zrodlo incydentu', 19, 'change_zrodloincydentu'),
(75, 'Can delete zrodlo incydentu', 19, 'delete_zrodloincydentu'),
(76, 'Can view zrodlo incydentu', 19, 'view_zrodloincydentu'),
(77, 'Can add zgloszenie', 20, 'add_zgloszenie'),
(78, 'Can change zgloszenie', 20, 'change_zgloszenie'),
(79, 'Can delete zgloszenie', 20, 'delete_zgloszenie'),
(80, 'Can view zgloszenie', 20, 'view_zgloszenie'),
(81, 'Can add sprawa incydent', 21, 'add_sprawaincydent'),
(82, 'Can change sprawa incydent', 21, 'change_sprawaincydent'),
(83, 'Can delete sprawa incydent', 21, 'delete_sprawaincydent'),
(84, 'Can view sprawa incydent', 21, 'view_sprawaincydent'),
(85, 'Can add sciezka pytan', 22, 'add_sciezkapytan'),
(86, 'Can change sciezka pytan', 22, 'change_sciezkapytan'),
(87, 'Can delete sciezka pytan', 22, 'delete_sciezkapytan'),
(88, 'Can view sciezka pytan', 22, 'view_sciezkapytan'),
(89, 'Can add rozwiazanie', 23, 'add_rozwiazanie'),
(90, 'Can change rozwiazanie', 23, 'change_rozwiazanie'),
(91, 'Can delete rozwiazanie', 23, 'delete_rozwiazanie'),
(92, 'Can view rozwiazanie', 23, 'view_rozwiazanie'),
(93, 'Can add odpowiedz', 24, 'add_odpowiedz'),
(94, 'Can change odpowiedz', 24, 'change_odpowiedz'),
(95, 'Can delete odpowiedz', 24, 'delete_odpowiedz'),
(96, 'Can view odpowiedz', 24, 'view_odpowiedz'),
(97, 'Can add kontakt', 25, 'add_kontakt'),
(98, 'Can change kontakt', 25, 'change_kontakt'),
(99, 'Can delete kontakt', 25, 'delete_kontakt'),
(100, 'Can view kontakt', 25, 'view_kontakt'),
(101, 'Can add detale narazonych systemow', 26, 'add_detalenarazonychsystemow'),
(102, 'Can change detale narazonych systemow', 26, 'change_detalenarazonychsystemow'),
(103, 'Can delete detale narazonych systemow', 26, 'delete_detalenarazonychsystemow'),
(104, 'Can view detale narazonych systemow', 26, 'view_detalenarazonychsystemow');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `detale_narazonych_systemow`
--

CREATE TABLE `detale_narazonych_systemow` (
  `idDetale_narazonych_systemow` int(11) NOT NULL,
  `narazona_jednostka` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `adresy_ip` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwy_domen` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `podstawowe_funkcje` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `systemy_operacyjne` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `narazone_oprogramowanie` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `uzytkownicy_systemu` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `srodki_bezpieczenstwa` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `lokalizacja` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `informacje_dodatkowe` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `id_sprawa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `detale_narazonych_systemow`
--

INSERT INTO `detale_narazonych_systemow` (`idDetale_narazonych_systemow`, `narazona_jednostka`, `adresy_ip`, `nazwy_domen`, `podstawowe_funkcje`, `systemy_operacyjne`, `narazone_oprogramowanie`, `uzytkownicy_systemu`, `srodki_bezpieczenstwa`, `lokalizacja`, `informacje_dodatkowe`, `id_sprawa`) VALUES
(2, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 3),
(3, 't', '123', 'tet', 'tet', 'ete', 'ete', 'tet', 'ete', 'etet', 'etete', 4),
(4, 't', 't', 't', 't', 't', 't', 't', 't', 't', 't', 5),
(5, 'tet', 'te', 'et', 'ete', 'te', 'tet', 'et', 'et', 'et', 'et', 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `diagnoza`
--

CREATE TABLE `diagnoza` (
  `idDiagnoza` smallint(6) NOT NULL,
  `opis` longtext COLLATE utf8_polish_ci DEFAULT NULL,
  `id_rodzaj_incydentu` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_polish_ci DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL
) ;

--
-- Zrzut danych tabeli `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-05-21 19:38:43.829604', '2', 'Osoba object (2)', 1, '[{\"added\": {}}]', 10, 2),
(2, '2020-05-21 19:38:54.434119', '3', 'Osoba object (3)', 1, '[{\"added\": {}}]', 10, 2),
(3, '2020-05-21 19:53:26.483344', '3', 'cons', 1, '[{\"added\": {}}]', 6, 2),
(4, '2020-05-21 19:53:34.796466', '3', 'cons', 2, '[{\"changed\": {\"fields\": [\"Id osoba\"]}}]', 6, 2),
(5, '2020-05-21 20:00:34.251347', '4', 'user', 1, '[{\"added\": {}}]', 6, 2),
(6, '2020-05-21 20:00:39.171540', '4', 'user', 2, '[{\"changed\": {\"fields\": [\"Id osoba\"]}}]', 6, 2),
(7, '2020-05-21 20:01:42.541159', '3', 'cons', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 6, 2),
(8, '2020-05-21 20:49:32.668467', '1', 'RodzajZdarzenia object (1)', 1, '[{\"added\": {}}]', 16, 2),
(9, '2020-05-21 20:49:40.595872', '2', 'RodzajZdarzenia object (2)', 1, '[{\"added\": {}}]', 16, 2),
(10, '2020-05-21 20:49:46.093447', '3', 'RodzajZdarzenia object (3)', 1, '[{\"added\": {}}]', 16, 2),
(11, '2020-05-21 20:49:52.835962', '4', 'RodzajZdarzenia object (4)', 1, '[{\"added\": {}}]', 16, 2),
(12, '2020-05-21 20:49:59.177915', '5', 'RodzajZdarzenia object (5)', 1, '[{\"added\": {}}]', 16, 2),
(13, '2020-05-21 20:50:09.111602', '6', 'RodzajZdarzenia object (6)', 1, '[{\"added\": {}}]', 16, 2),
(14, '2020-05-21 20:50:14.438884', '7', 'RodzajZdarzenia object (7)', 1, '[{\"added\": {}}]', 16, 2),
(15, '2020-05-21 20:50:19.419016', '8', 'RodzajZdarzenia object (8)', 1, '[{\"added\": {}}]', 16, 2),
(16, '2020-05-21 20:50:23.760885', '9', 'RodzajZdarzenia object (9)', 1, '[{\"added\": {}}]', 16, 2),
(17, '2020-05-21 20:50:28.169476', '10', 'RodzajZdarzenia object (10)', 1, '[{\"added\": {}}]', 16, 2),
(18, '2020-05-24 15:20:28.765257', '1', 'Zgloszenie object (1)', 2, '[{\"changed\": {\"fields\": [\"Oprogramowanie\"]}}]', 20, 2),
(19, '2020-05-24 16:20:39.573769', '1', 'Dzial object (1)', 1, '[{\"added\": {}}]', 9, 2),
(20, '2020-05-24 16:20:43.999271', '1', 'Pracownik object (1)', 1, '[{\"added\": {}}]', 12, 2),
(21, '2020-05-24 16:21:13.483625', '2', 'Dzial object (2)', 1, '[{\"added\": {}}]', 9, 2),
(22, '2020-05-24 16:21:14.801264', '2', 'Pracownik object (2)', 1, '[{\"added\": {}}]', 12, 2),
(23, '2020-05-25 12:34:43.939380', '1', 'Priorytet object (1)', 1, '[{\"added\": {}}]', 13, 2),
(24, '2020-05-25 12:34:49.560907', '2', 'Priorytet object (2)', 1, '[{\"added\": {}}]', 13, 2),
(25, '2020-05-25 12:50:55.457902', '1', 'Nierozwiązana', 1, '[{\"added\": {}}]', 18, 2),
(26, '2020-05-25 12:51:01.300281', '2', 'Rozwiązana', 1, '[{\"added\": {}}]', 18, 2),
(27, '2020-05-25 12:51:37.251600', '1', 'PoziomIncydentu object (1)', 1, '[{\"added\": {}}]', 11, 2),
(28, '2020-05-25 12:51:44.539869', '2', 'PoziomIncydentu object (2)', 1, '[{\"added\": {}}]', 11, 2),
(29, '2020-05-25 12:51:48.318953', '3', 'PoziomIncydentu object (3)', 1, '[{\"added\": {}}]', 11, 2),
(30, '2020-05-28 15:26:50.494090', '1', 'Kontakt object (1)', 1, '[{\"added\": {}}]', 25, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(7, 'user', 'arkusz'),
(26, 'user', 'detalenarazonychsystemow'),
(8, 'user', 'diagnoza'),
(9, 'user', 'dzial'),
(25, 'user', 'kontakt'),
(24, 'user', 'odpowiedz'),
(10, 'user', 'osoba'),
(11, 'user', 'poziomincydentu'),
(12, 'user', 'pracownik'),
(13, 'user', 'priorytet'),
(14, 'user', 'pytanie'),
(15, 'user', 'rodzajincydentu'),
(16, 'user', 'rodzajzdarzenia'),
(23, 'user', 'rozwiazanie'),
(22, 'user', 'sciezkapytan'),
(17, 'user', 'sprawa'),
(21, 'user', 'sprawaincydent'),
(18, 'user', 'status'),
(6, 'user', 'uzytkownik'),
(20, 'user', 'zgloszenie'),
(19, 'user', 'zrodloincydentu');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-05-18 14:38:00.614863'),
(2, 'contenttypes', '0002_remove_content_type_name', '2020-05-18 14:38:01.440952'),
(3, 'auth', '0001_initial', '2020-05-18 14:38:02.107694'),
(4, 'auth', '0002_alter_permission_name_max_length', '2020-05-18 14:38:05.438523'),
(5, 'auth', '0003_alter_user_email_max_length', '2020-05-18 14:38:05.485008'),
(6, 'auth', '0004_alter_user_username_opts', '2020-05-18 14:38:05.517035'),
(7, 'auth', '0005_alter_user_last_login_null', '2020-05-18 14:38:05.576094'),
(8, 'auth', '0006_require_contenttypes_0002', '2020-05-18 14:38:05.631998'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2020-05-18 14:38:05.685662'),
(10, 'auth', '0008_alter_user_username_max_length', '2020-05-18 14:38:05.727607'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2020-05-18 14:38:05.767625'),
(12, 'auth', '0010_alter_group_name_max_length', '2020-05-18 14:38:06.847444'),
(13, 'auth', '0011_update_proxy_permissions', '2020-05-18 14:38:06.886191'),
(14, 'user', '0001_initial', '2020-05-18 14:38:17.695040'),
(15, 'admin', '0001_initial', '2020-05-18 14:38:44.838469'),
(16, 'admin', '0002_logentry_remove_auto_add', '2020-05-18 14:38:46.551344'),
(17, 'admin', '0003_logentry_add_action_flag_choices', '2020-05-18 14:38:46.586323'),
(18, 'sessions', '0001_initial', '2020-05-18 14:38:46.839341'),
(19, 'user', '0002_auto_20200518_1850', '2020-05-18 17:01:27.678025'),
(20, 'user', '0003_auto_20200521_2307', '2020-05-21 21:07:17.566291'),
(21, 'user', '0004_auto_20200528_1749', '2020-05-28 15:49:34.450194');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `session_data` longtext COLLATE utf8_polish_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('xgntqup8d00dlab072z2vutz4qtcdvst', 'MzI3NzcyNWY1YmRhNDU4OTQwM2U1MWQ0YjFhZTgwZDRhNDBhNjVkMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1Yzk2NDM3Y2U5NWVmZTAxZDk1MTcwZjY4OGQzYjExZmZjMmNiOGM1In0=', '2020-06-11 21:12:48.023496');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dzial`
--

CREATE TABLE `dzial` (
  `idDzial` smallint(6) NOT NULL,
  `nazwa` varchar(45) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `dzial`
--

INSERT INTO `dzial` (`idDzial`, `nazwa`) VALUES
(1, 'Admin'),
(2, 'Konsultant');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kontakt`
--

CREATE TABLE `kontakt` (
  `idKontakt` int(11) NOT NULL,
  `rodzaj_kontaktu` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `adres_kontaktowy` varchar(60) COLLATE utf8_polish_ci NOT NULL,
  `id_osoba` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `kontakt`
--

INSERT INTO `kontakt` (`idKontakt`, `rodzaj_kontaktu`, `adres_kontaktowy`, `id_osoba`) VALUES
(1, 'Telefon', '600000000', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `odpowiedz`
--

CREATE TABLE `odpowiedz` (
  `idOdpowiedz` int(11) NOT NULL,
  `odpowiedz` longtext COLLATE utf8_polish_ci DEFAULT NULL,
  `id_arkusz` int(11) DEFAULT NULL,
  `id_pytanie` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `osoba`
--

CREATE TABLE `osoba` (
  `idOsoba` smallint(6) NOT NULL,
  `imie` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `osoba`
--

INSERT INTO `osoba` (`idOsoba`, `imie`, `nazwisko`) VALUES
(1, 'Adam', 'B'),
(2, 'Jan', 'Kowalski'),
(3, 'Marek', 'Kopak'),
(4, 'Ada', 'Ba'),
(5, 'Patryk', 'Duda');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `poziom_incydentu`
--

CREATE TABLE `poziom_incydentu` (
  `idPoziom_incydentu` int(11) NOT NULL,
  `Poziom` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `poziom_incydentu`
--

INSERT INTO `poziom_incydentu` (`idPoziom_incydentu`, `Poziom`) VALUES
(1, 'Krytyczny'),
(2, 'Średni'),
(3, 'Mały');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownik`
--

CREATE TABLE `pracownik` (
  `idPracownik` smallint(6) NOT NULL,
  `stanowisko` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `id_dzial` smallint(6) DEFAULT NULL,
  `id_osoba` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pracownik`
--

INSERT INTO `pracownik` (`idPracownik`, `stanowisko`, `id_dzial`, `id_osoba`) VALUES
(1, 'Admin', 1, 1),
(2, 'Konsultant', 2, 2),
(3, 'Admin', 1, 4),
(4, 'Admin', 1, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `priorytet`
--

CREATE TABLE `priorytet` (
  `idPriorytet` int(11) NOT NULL,
  `nazwa` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `waga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `priorytet`
--

INSERT INTO `priorytet` (`idPriorytet`, `nazwa`, `waga`) VALUES
(1, 'Dla administratora', 10),
(2, 'Dla konsultanta', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pytanie`
--

CREATE TABLE `pytanie` (
  `idPytanie` smallint(6) NOT NULL,
  `tresc` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaj_incydentu`
--

CREATE TABLE `rodzaj_incydentu` (
  `idRodzaj_incydentu` smallint(6) NOT NULL,
  `nazwa` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaj_zdarzenia`
--

CREATE TABLE `rodzaj_zdarzenia` (
  `idRodzaj_zdarzenia` smallint(6) NOT NULL,
  `nazwa` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `rodzaj_zdarzenia`
--

INSERT INTO `rodzaj_zdarzenia` (`idRodzaj_zdarzenia`, `nazwa`) VALUES
(1, 'Podejrzana wiadomość e-mail | podejrzane załączniki, phishing, szantaż'),
(2, 'Złośliwe oprogramowanie | trojan, banker, spyware, ransomware, zagrożenia mobilne'),
(3, 'Oszustwa internetowe |fałszywa działalność w sieci, kradzież tożsamości'),
(4, 'Włamania | serwer, aplikacja, konto, system, itp'),
(5, 'Utrata dostępności usługi | DoS, DDoS, sabotaż, awaria, zaniedbanie, prace techniczne'),
(6, 'Naruszenia bezpieczeństwa informacji | nieuprawniony dostęp do informacji, nieuprawniona zmiana informacji lub jej skasowania'),
(7, 'Podatności | błędy w oprogramowaniu lub aplikacjach'),
(8, 'Nielegalne treści'),
(9, 'Cyberterroryzm | działania o charakterze terrorystycznym popełnione w sieci'),
(10, 'Inne | wszystkie inne niewskazane powyżej');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rozwiazanie`
--

CREATE TABLE `rozwiazanie` (
  `idRazwiazanie` int(11) NOT NULL,
  `tresc` longtext COLLATE utf8_polish_ci DEFAULT NULL,
  `id_diagnoza` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sciezka_pytan`
--

CREATE TABLE `sciezka_pytan` (
  `idSciezka_pytan` int(11) NOT NULL,
  `id_diagnoza_jesli_nie` smallint(6) DEFAULT NULL,
  `id_diagnoza_jesli_tak` smallint(6) DEFAULT NULL,
  `id_next_pytanie_jesli_nie` smallint(6) DEFAULT NULL,
  `id_next_pytanie_jesli_tak` smallint(6) DEFAULT NULL,
  `id_pytanie` smallint(6) DEFAULT NULL,
  `id_rodzaj_zdarzenia` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprawa`
--

CREATE TABLE `sprawa` (
  `idSprawa` int(11) NOT NULL,
  `opis_sprawy` longtext COLLATE utf8_polish_ci DEFAULT NULL,
  `data_przyjecia` datetime(6) DEFAULT NULL,
  `data_zamkniecia` datetime(6) DEFAULT NULL,
  `skutki_incydentu` longtext COLLATE utf8_polish_ci DEFAULT NULL,
  `raport_koncowy` longtext COLLATE utf8_polish_ci DEFAULT NULL,
  `id_poziom_incydentu` int(11) DEFAULT NULL,
  `id_pracownika` smallint(6) DEFAULT NULL,
  `id_priorytet` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `id_zgloszenie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `sprawa`
--

INSERT INTO `sprawa` (`idSprawa`, `opis_sprawy`, `data_przyjecia`, `data_zamkniecia`, `skutki_incydentu`, `raport_koncowy`, `id_poziom_incydentu`, `id_pracownika`, `id_priorytet`, `id_status`, `id_zgloszenie`) VALUES
(3, 'test', '2222-11-10 23:00:00.000000', '2020-05-26 09:00:00.000000', 'estsett', NULL, 3, 1, 1, 2, 1),
(4, 'Testowa', '2020-05-11 22:00:00.000000', '2020-05-27 16:28:10.000000', '', NULL, 3, 2, 2, 2, 4),
(5, 'Ta', '1998-12-22 23:00:00.000000', '2020-05-28 21:26:44.000000', '123', NULL, 3, 1, 1, 2, 2),
(6, 'yrd', '5543-02-04 23:00:00.000000', NULL, 'rydy', NULL, 2, 1, 2, 1, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprawa_incydent`
--

CREATE TABLE `sprawa_incydent` (
  `idSprawa_Incydent` int(11) NOT NULL,
  `id_rodzaj_incydentu` smallint(6) NOT NULL,
  `id_sprawa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `status`
--

CREATE TABLE `status` (
  `idStatus` int(11) NOT NULL,
  `status` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `status`
--

INSERT INTO `status` (`idStatus`, `status`) VALUES
(1, 'Nierozwiązana'),
(2, 'Rozwiązana');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `password` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_polish_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_polish_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `idUzytkownik` int(11) NOT NULL,
  `id_osoba` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `idUzytkownik`, `id_osoba`) VALUES
('pbkdf2_sha256$180000$4vPd2fpap3DY$C1sW44uCs8ucuJB7AzylGtEULNsEOIl+Vt7gQ01hmpc=', '2020-05-28 21:12:47.966157', 1, 'bachi', '', '', 'bachi@test.pl', 1, 1, '2020-05-18 17:01:49.632285', 2, 1),
('pbkdf2_sha256$180000$4b4bgPPdmOvT$Ha9vm6xaFWdsRdoJKGxdsgphq7SsAh5rPoNB4Po87Ec=', '2020-05-28 21:10:34.510511', 0, 'cons', '', '', '', 1, 1, '2020-05-21 19:53:26.000000', 3, 2),
('pbkdf2_sha256$180000$QmRRqC6WHRlM$Qu9aWWvdTvCrH7xkbR9MagLVCagsbaRONIO6QRFm9GQ=', '2020-05-28 11:16:51.324832', 0, 'user', '', '', '', 0, 1, '2020-05-21 20:00:34.000000', 4, 3),
('pbkdf2_sha256$180000$127CmabdIX48$FMRa0IjZ96j42UFk51ugQ1BAw9NtBQDe5Tztj+BWX6s=', NULL, 1, 'user2', '', '', '', 1, 1, '2020-05-27 13:09:48.999137', 5, 4),
('pbkdf2_sha256$180000$5TouD3foddDu$18qocauVuS0SoRCiLDgTsZ9QABKTM+ZmKDrzq8TqLSU=', NULL, 1, 'duda', '', '', '', 1, 1, '2020-05-27 16:38:27.350814', 6, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik_groups`
--

CREATE TABLE `uzytkownik_groups` (
  `id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik_user_permissions`
--

CREATE TABLE `uzytkownik_user_permissions` (
  `id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zgloszenie`
--

CREATE TABLE `zgloszenie` (
  `idZgloszenie` int(11) NOT NULL,
  `opis_zdarzenia` longtext COLLATE utf8_polish_ci DEFAULT NULL,
  `lokalizacja_zdarzenia` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `data_wystapienia` datetime(6) DEFAULT NULL,
  `nazwa_maszyny` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `podsiec` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `system_operacyjny` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `oprogramowanie` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `data_zgloszenia` datetime(6) DEFAULT NULL,
  `czy_przyjete` tinyint(1) DEFAULT NULL,
  `id_rodzaj_zdarzenia` smallint(6) DEFAULT NULL,
  `id_uzytkownik` int(11) NOT NULL,
  `opis_naprawy` longtext COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zgloszenie`
--

INSERT INTO `zgloszenie` (`idZgloszenie`, `opis_zdarzenia`, `lokalizacja_zdarzenia`, `data_wystapienia`, `nazwa_maszyny`, `podsiec`, `system_operacyjny`, `oprogramowanie`, `data_zgloszenia`, `czy_przyjete`, `id_rodzaj_zdarzenia`, `id_uzytkownik`, `opis_naprawy`) VALUES
(1, 'test', 'test', '1111-11-11 09:47:00.000000', 'test', 'test', 'test', 'test@test.pl', '1111-11-11 09:47:00.000000', 1, 1, 4, 'test'),
(2, 'test', 'test', '2002-11-11 01:02:00.000000', 'test', 'test', 'tets', 'wiem@sdsd.pl', '2020-11-11 10:11:00.000000', 1, 2, 4, 'test'),
(3, 'setse', 'etse', '2019-02-23 10:11:00.000000', 'tests', 'etset', 'test', 'ttt@ttt.pl', '1998-02-23 10:11:00.000000', 1, 3, 4, 'setse'),
(4, 'etsetsetset', 'tes', '2019-01-11 11:12:00.000000', 'etse', 'etse', 'tes', 'test@qw.pl', '2019-11-11 10:11:00.000000', 1, 8, 4, 'tsetsetsete');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zrodlo_incydentu`
--

CREATE TABLE `zrodlo_incydentu` (
  `idZrodlo_incydentu` int(11) NOT NULL,
  `podmiot` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `adresy_ip_zrodla` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `cel_ataku` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `czy_jest_zagrozeniem` tinyint(1) DEFAULT NULL,
  `data_wywolania` datetime(6) DEFAULT NULL,
  `id_sprawa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zrodlo_incydentu`
--

INSERT INTO `zrodlo_incydentu` (`idZrodlo_incydentu`, `podmiot`, `adresy_ip_zrodla`, `cel_ataku`, `czy_jest_zagrozeniem`, `data_wywolania`, `id_sprawa`) VALUES
(1, 'Atak', '192.168.102.103', 'Test', 1, '2020-11-10 23:00:00.000000', 3),
(2, 'test', '123', 'et', 1, '1111-11-10 22:36:00.000000', 4),
(7, 'test', 'test', 'test', 1, '3123-03-11 23:00:00.000000', 5);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `arkusz`
--
ALTER TABLE `arkusz`
  ADD PRIMARY KEY (`idArkusz`),
  ADD KEY `arkusz_id_ostateczna_diagnoza_9d4593fc_fk_diagnoza_idDiagnoza` (`id_ostateczna_diagnoza`),
  ADD KEY `arkusz_id_rodzaj_zdarzenia_0f1f9c99_fk_rodzaj_zd` (`id_rodzaj_zdarzenia`),
  ADD KEY `arkusz_id_zgloszenie_e2eb07e4_fk_zgloszenie_idZgloszenie` (`id_zgloszenie`);

--
-- Indeksy dla tabeli `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeksy dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indeksy dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indeksy dla tabeli `detale_narazonych_systemow`
--
ALTER TABLE `detale_narazonych_systemow`
  ADD PRIMARY KEY (`idDetale_narazonych_systemow`),
  ADD KEY `detale_narazonych_systemow_id_sprawa_10ebba0f_fk_sprawa_idSprawa` (`id_sprawa`);

--
-- Indeksy dla tabeli `diagnoza`
--
ALTER TABLE `diagnoza`
  ADD PRIMARY KEY (`idDiagnoza`),
  ADD KEY `diagnoza_id_rodzaj_incydentu_3c8890d8_fk_rodzaj_in` (`id_rodzaj_incydentu`);

--
-- Indeksy dla tabeli `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indeksy dla tabeli `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indeksy dla tabeli `dzial`
--
ALTER TABLE `dzial`
  ADD PRIMARY KEY (`idDzial`);

--
-- Indeksy dla tabeli `kontakt`
--
ALTER TABLE `kontakt`
  ADD PRIMARY KEY (`idKontakt`),
  ADD UNIQUE KEY `kontakt_id_osoba_6c22f29d_uniq` (`id_osoba`);

--
-- Indeksy dla tabeli `odpowiedz`
--
ALTER TABLE `odpowiedz`
  ADD PRIMARY KEY (`idOdpowiedz`),
  ADD KEY `odpowiedz_id_arkusz_3c807195_fk_arkusz_idArkusz` (`id_arkusz`),
  ADD KEY `odpowiedz_id_pytanie_a2732c86_fk_pytanie_idPytanie` (`id_pytanie`);

--
-- Indeksy dla tabeli `osoba`
--
ALTER TABLE `osoba`
  ADD PRIMARY KEY (`idOsoba`);

--
-- Indeksy dla tabeli `poziom_incydentu`
--
ALTER TABLE `poziom_incydentu`
  ADD PRIMARY KEY (`idPoziom_incydentu`);

--
-- Indeksy dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  ADD PRIMARY KEY (`idPracownik`),
  ADD UNIQUE KEY `id_osoba` (`id_osoba`),
  ADD KEY `pracownik_id_dzial_95d790bc_fk_dzial_idDzial` (`id_dzial`);

--
-- Indeksy dla tabeli `priorytet`
--
ALTER TABLE `priorytet`
  ADD PRIMARY KEY (`idPriorytet`);

--
-- Indeksy dla tabeli `pytanie`
--
ALTER TABLE `pytanie`
  ADD PRIMARY KEY (`idPytanie`);

--
-- Indeksy dla tabeli `rodzaj_incydentu`
--
ALTER TABLE `rodzaj_incydentu`
  ADD PRIMARY KEY (`idRodzaj_incydentu`);

--
-- Indeksy dla tabeli `rodzaj_zdarzenia`
--
ALTER TABLE `rodzaj_zdarzenia`
  ADD PRIMARY KEY (`idRodzaj_zdarzenia`);

--
-- Indeksy dla tabeli `rozwiazanie`
--
ALTER TABLE `rozwiazanie`
  ADD PRIMARY KEY (`idRazwiazanie`),
  ADD KEY `rozwiazanie_id_diagnoza_c175fd53_fk_diagnoza_idDiagnoza` (`id_diagnoza`);

--
-- Indeksy dla tabeli `sciezka_pytan`
--
ALTER TABLE `sciezka_pytan`
  ADD PRIMARY KEY (`idSciezka_pytan`),
  ADD KEY `sciezka_pytan_id_diagnoza_jesli_ni_f6c58146_fk_diagnoza_` (`id_diagnoza_jesli_nie`),
  ADD KEY `sciezka_pytan_id_diagnoza_jesli_ta_6275aeb4_fk_diagnoza_` (`id_diagnoza_jesli_tak`),
  ADD KEY `sciezka_pytan_id_next_pytanie_jesl_883e8023_fk_pytanie_i` (`id_next_pytanie_jesli_nie`),
  ADD KEY `sciezka_pytan_id_next_pytanie_jesl_d4c82901_fk_pytanie_i` (`id_next_pytanie_jesli_tak`),
  ADD KEY `sciezka_pytan_id_pytanie_0b748f6a_fk_pytanie_idPytanie` (`id_pytanie`),
  ADD KEY `sciezka_pytan_id_rodzaj_zdarzenia_e816c396_fk_rodzaj_zd` (`id_rodzaj_zdarzenia`);

--
-- Indeksy dla tabeli `sprawa`
--
ALTER TABLE `sprawa`
  ADD PRIMARY KEY (`idSprawa`),
  ADD UNIQUE KEY `id_zgloszenie` (`id_zgloszenie`),
  ADD KEY `sprawa_id_status_2a315f6b_fk_status_idStatus` (`id_status`),
  ADD KEY `sprawa_id_poziom_incydentu_80961b5e_fk_poziom_in` (`id_poziom_incydentu`),
  ADD KEY `sprawa_id_pracownika_8cc735b4_fk_pracownik_idPracownik` (`id_pracownika`),
  ADD KEY `sprawa_id_priorytet_1ec0518f_fk_priorytet_idPriorytet` (`id_priorytet`);

--
-- Indeksy dla tabeli `sprawa_incydent`
--
ALTER TABLE `sprawa_incydent`
  ADD PRIMARY KEY (`idSprawa_Incydent`),
  ADD KEY `sprawa_incydent_id_rodzaj_incydentu_95d4546b_fk_rodzaj_in` (`id_rodzaj_incydentu`),
  ADD KEY `sprawa_incydent_id_sprawa_68596088_fk_sprawa_idSprawa` (`id_sprawa`);

--
-- Indeksy dla tabeli `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`idStatus`);

--
-- Indeksy dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`idUzytkownik`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeksy dla tabeli `uzytkownik_groups`
--
ALTER TABLE `uzytkownik_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uzytkownik_groups_uzytkownik_id_group_id_25a2eacd_uniq` (`uzytkownik_id`,`group_id`),
  ADD KEY `uzytkownik_groups_group_id_2413989b_fk_auth_group_id` (`group_id`);

--
-- Indeksy dla tabeli `uzytkownik_user_permissions`
--
ALTER TABLE `uzytkownik_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uzytkownik_user_permissi_uzytkownik_id_permission_c2195226_uniq` (`uzytkownik_id`,`permission_id`),
  ADD KEY `uzytkownik_user_perm_permission_id_55ec2841_fk_auth_perm` (`permission_id`);

--
-- Indeksy dla tabeli `zgloszenie`
--
ALTER TABLE `zgloszenie`
  ADD PRIMARY KEY (`idZgloszenie`),
  ADD KEY `zgloszenie_id_rodzaj_zdarzenia_0b91e6e9_fk_rodzaj_zd` (`id_rodzaj_zdarzenia`),
  ADD KEY `zgloszenie_id_uzytkownik_7c0266d1_fk` (`id_uzytkownik`);

--
-- Indeksy dla tabeli `zrodlo_incydentu`
--
ALTER TABLE `zrodlo_incydentu`
  ADD PRIMARY KEY (`idZrodlo_incydentu`),
  ADD KEY `zrodlo_incydentu_id_sprawa_03a3ec95_fk_sprawa_idSprawa` (`id_sprawa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `arkusz`
--
ALTER TABLE `arkusz`
  MODIFY `idArkusz` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT dla tabeli `detale_narazonych_systemow`
--
ALTER TABLE `detale_narazonych_systemow`
  MODIFY `idDetale_narazonych_systemow` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `diagnoza`
--
ALTER TABLE `diagnoza`
  MODIFY `idDiagnoza` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT dla tabeli `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT dla tabeli `dzial`
--
ALTER TABLE `dzial`
  MODIFY `idDzial` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `kontakt`
--
ALTER TABLE `kontakt`
  MODIFY `idKontakt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `odpowiedz`
--
ALTER TABLE `odpowiedz`
  MODIFY `idOdpowiedz` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `osoba`
--
ALTER TABLE `osoba`
  MODIFY `idOsoba` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `poziom_incydentu`
--
ALTER TABLE `poziom_incydentu`
  MODIFY `idPoziom_incydentu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  MODIFY `idPracownik` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `priorytet`
--
ALTER TABLE `priorytet`
  MODIFY `idPriorytet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `pytanie`
--
ALTER TABLE `pytanie`
  MODIFY `idPytanie` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `rodzaj_incydentu`
--
ALTER TABLE `rodzaj_incydentu`
  MODIFY `idRodzaj_incydentu` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `rodzaj_zdarzenia`
--
ALTER TABLE `rodzaj_zdarzenia`
  MODIFY `idRodzaj_zdarzenia` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `rozwiazanie`
--
ALTER TABLE `rozwiazanie`
  MODIFY `idRazwiazanie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sciezka_pytan`
--
ALTER TABLE `sciezka_pytan`
  MODIFY `idSciezka_pytan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sprawa`
--
ALTER TABLE `sprawa`
  MODIFY `idSprawa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `sprawa_incydent`
--
ALTER TABLE `sprawa_incydent`
  MODIFY `idSprawa_Incydent` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `status`
--
ALTER TABLE `status`
  MODIFY `idStatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `idUzytkownik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `uzytkownik_groups`
--
ALTER TABLE `uzytkownik_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `uzytkownik_user_permissions`
--
ALTER TABLE `uzytkownik_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zgloszenie`
--
ALTER TABLE `zgloszenie`
  MODIFY `idZgloszenie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `zrodlo_incydentu`
--
ALTER TABLE `zrodlo_incydentu`
  MODIFY `idZrodlo_incydentu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `arkusz`
--
ALTER TABLE `arkusz`
  ADD CONSTRAINT `arkusz_id_ostateczna_diagnoza_9d4593fc_fk_diagnoza_idDiagnoza` FOREIGN KEY (`id_ostateczna_diagnoza`) REFERENCES `diagnoza` (`idDiagnoza`),
  ADD CONSTRAINT `arkusz_id_rodzaj_zdarzenia_0f1f9c99_fk_rodzaj_zd` FOREIGN KEY (`id_rodzaj_zdarzenia`) REFERENCES `rodzaj_zdarzenia` (`idRodzaj_zdarzenia`),
  ADD CONSTRAINT `arkusz_id_zgloszenie_e2eb07e4_fk_zgloszenie_idZgloszenie` FOREIGN KEY (`id_zgloszenie`) REFERENCES `zgloszenie` (`idZgloszenie`);

--
-- Ograniczenia dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ograniczenia dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ograniczenia dla tabeli `detale_narazonych_systemow`
--
ALTER TABLE `detale_narazonych_systemow`
  ADD CONSTRAINT `detale_narazonych_systemow_id_sprawa_10ebba0f_fk_sprawa_idSprawa` FOREIGN KEY (`id_sprawa`) REFERENCES `sprawa` (`idSprawa`);

--
-- Ograniczenia dla tabeli `diagnoza`
--
ALTER TABLE `diagnoza`
  ADD CONSTRAINT `diagnoza_id_rodzaj_incydentu_3c8890d8_fk_rodzaj_in` FOREIGN KEY (`id_rodzaj_incydentu`) REFERENCES `rodzaj_incydentu` (`idRodzaj_incydentu`);

--
-- Ograniczenia dla tabeli `kontakt`
--
ALTER TABLE `kontakt`
  ADD CONSTRAINT `kontakt_id_osoba_6c22f29d_fk_osoba_idOsoba` FOREIGN KEY (`id_osoba`) REFERENCES `osoba` (`idOsoba`);

--
-- Ograniczenia dla tabeli `odpowiedz`
--
ALTER TABLE `odpowiedz`
  ADD CONSTRAINT `odpowiedz_id_arkusz_3c807195_fk_arkusz_idArkusz` FOREIGN KEY (`id_arkusz`) REFERENCES `arkusz` (`idArkusz`),
  ADD CONSTRAINT `odpowiedz_id_pytanie_a2732c86_fk_pytanie_idPytanie` FOREIGN KEY (`id_pytanie`) REFERENCES `pytanie` (`idPytanie`);

--
-- Ograniczenia dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  ADD CONSTRAINT `pracownik_id_dzial_95d790bc_fk_dzial_idDzial` FOREIGN KEY (`id_dzial`) REFERENCES `dzial` (`idDzial`),
  ADD CONSTRAINT `pracownik_id_osoba_e54e8205_fk_osoba_idOsoba` FOREIGN KEY (`id_osoba`) REFERENCES `osoba` (`idOsoba`);

--
-- Ograniczenia dla tabeli `rozwiazanie`
--
ALTER TABLE `rozwiazanie`
  ADD CONSTRAINT `rozwiazanie_id_diagnoza_c175fd53_fk_diagnoza_idDiagnoza` FOREIGN KEY (`id_diagnoza`) REFERENCES `diagnoza` (`idDiagnoza`);

--
-- Ograniczenia dla tabeli `sciezka_pytan`
--
ALTER TABLE `sciezka_pytan`
  ADD CONSTRAINT `sciezka_pytan_id_diagnoza_jesli_ni_f6c58146_fk_diagnoza_` FOREIGN KEY (`id_diagnoza_jesli_nie`) REFERENCES `diagnoza` (`idDiagnoza`),
  ADD CONSTRAINT `sciezka_pytan_id_diagnoza_jesli_ta_6275aeb4_fk_diagnoza_` FOREIGN KEY (`id_diagnoza_jesli_tak`) REFERENCES `diagnoza` (`idDiagnoza`),
  ADD CONSTRAINT `sciezka_pytan_id_next_pytanie_jesl_883e8023_fk_pytanie_i` FOREIGN KEY (`id_next_pytanie_jesli_nie`) REFERENCES `pytanie` (`idPytanie`),
  ADD CONSTRAINT `sciezka_pytan_id_next_pytanie_jesl_d4c82901_fk_pytanie_i` FOREIGN KEY (`id_next_pytanie_jesli_tak`) REFERENCES `pytanie` (`idPytanie`),
  ADD CONSTRAINT `sciezka_pytan_id_pytanie_0b748f6a_fk_pytanie_idPytanie` FOREIGN KEY (`id_pytanie`) REFERENCES `pytanie` (`idPytanie`),
  ADD CONSTRAINT `sciezka_pytan_id_rodzaj_zdarzenia_e816c396_fk_rodzaj_zd` FOREIGN KEY (`id_rodzaj_zdarzenia`) REFERENCES `rodzaj_zdarzenia` (`idRodzaj_zdarzenia`);

--
-- Ograniczenia dla tabeli `sprawa`
--
ALTER TABLE `sprawa`
  ADD CONSTRAINT `sprawa_id_poziom_incydentu_80961b5e_fk_poziom_in` FOREIGN KEY (`id_poziom_incydentu`) REFERENCES `poziom_incydentu` (`idPoziom_incydentu`),
  ADD CONSTRAINT `sprawa_id_pracownika_8cc735b4_fk_pracownik_idPracownik` FOREIGN KEY (`id_pracownika`) REFERENCES `pracownik` (`idPracownik`),
  ADD CONSTRAINT `sprawa_id_priorytet_1ec0518f_fk_priorytet_idPriorytet` FOREIGN KEY (`id_priorytet`) REFERENCES `priorytet` (`idPriorytet`),
  ADD CONSTRAINT `sprawa_id_status_2a315f6b_fk_status_idStatus` FOREIGN KEY (`id_status`) REFERENCES `status` (`idStatus`),
  ADD CONSTRAINT `sprawa_id_zgloszenie_3bc29745_fk_zgloszenie_idZgloszenie` FOREIGN KEY (`id_zgloszenie`) REFERENCES `zgloszenie` (`idZgloszenie`);

--
-- Ograniczenia dla tabeli `sprawa_incydent`
--
ALTER TABLE `sprawa_incydent`
  ADD CONSTRAINT `sprawa_incydent_id_rodzaj_incydentu_95d4546b_fk_rodzaj_in` FOREIGN KEY (`id_rodzaj_incydentu`) REFERENCES `rodzaj_incydentu` (`idRodzaj_incydentu`),
  ADD CONSTRAINT `sprawa_incydent_id_sprawa_68596088_fk_sprawa_idSprawa` FOREIGN KEY (`id_sprawa`) REFERENCES `sprawa` (`idSprawa`);

--
-- Ograniczenia dla tabeli `uzytkownik_groups`
--
ALTER TABLE `uzytkownik_groups`
  ADD CONSTRAINT `uzytkownik_groups_group_id_2413989b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ograniczenia dla tabeli `uzytkownik_user_permissions`
--
ALTER TABLE `uzytkownik_user_permissions`
  ADD CONSTRAINT `uzytkownik_user_perm_permission_id_55ec2841_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Ograniczenia dla tabeli `zgloszenie`
--
ALTER TABLE `zgloszenie`
  ADD CONSTRAINT `zgloszenie_id_rodzaj_zdarzenia_0b91e6e9_fk_rodzaj_zd` FOREIGN KEY (`id_rodzaj_zdarzenia`) REFERENCES `rodzaj_zdarzenia` (`idRodzaj_zdarzenia`),
  ADD CONSTRAINT `zgloszenie_id_uzytkownik_7c0266d1_fk` FOREIGN KEY (`id_uzytkownik`) REFERENCES `uzytkownik` (`idUzytkownik`);

--
-- Ograniczenia dla tabeli `zrodlo_incydentu`
--
ALTER TABLE `zrodlo_incydentu`
  ADD CONSTRAINT `zrodlo_incydentu_id_sprawa_03a3ec95_fk_sprawa_idSprawa` FOREIGN KEY (`id_sprawa`) REFERENCES `sprawa` (`idSprawa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

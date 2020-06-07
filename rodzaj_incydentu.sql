-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Cze 2020, 21:18
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
-- Struktura tabeli dla tabeli `rodzaj_incydentu`
--

CREATE TABLE `rodzaj_incydentu` (
  `idRodzaj_incydentu` smallint(6) NOT NULL,
  `nazwa` varchar(300) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `rodzaj_incydentu`
--

INSERT INTO `rodzaj_incydentu` (`idRodzaj_incydentu`, `nazwa`) VALUES
(1, 'Brute Force'),
(2, 'SYN Flood'),
(3, 'Malware'),
(4, 'Man-in-the-middle'),
(5, 'Phishing'),
(6, 'Brak połączenia');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `rodzaj_incydentu`
--
ALTER TABLE `rodzaj_incydentu`
  ADD PRIMARY KEY (`idRodzaj_incydentu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `rodzaj_incydentu`
--
ALTER TABLE `rodzaj_incydentu`
  MODIFY `idRodzaj_incydentu` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

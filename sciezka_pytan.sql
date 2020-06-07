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

--
-- Zrzut danych tabeli `sciezka_pytan`
--

INSERT INTO `sciezka_pytan` (`idSciezka_pytan`, `id_diagnoza_jesli_nie`, `id_diagnoza_jesli_tak`, `id_next_pytanie_jesli_nie`, `id_next_pytanie_jesli_tak`, `id_pytanie`, `id_rodzaj_zdarzenia`) VALUES
(1, NULL, NULL, 10, 2, 1, NULL),
(2, NULL, NULL, 5, 3, 2, NULL),
(3, NULL, NULL, NULL, 4, 3, NULL),
(4, NULL, NULL, NULL, 5, 4, NULL),
(5, NULL, NULL, NULL, 6, 5, NULL),
(6, NULL, NULL, 7, 8, 6, NULL),
(7, NULL, NULL, NULL, 8, 7, NULL),
(8, NULL, NULL, 10, 9, 8, NULL),
(9, NULL, NULL, NULL, 12, 11, NULL),
(10, NULL, NULL, NULL, 13, 12, NULL),
(11, NULL, NULL, 15, 14, 13, NULL),
(12, NULL, NULL, 15, 9, 14, NULL),
(13, NULL, NULL, 17, 16, 15, NULL),
(14, NULL, NULL, 17, 9, 16, NULL),
(15, NULL, NULL, 19, 18, 17, NULL),
(16, NULL, NULL, 19, 9, 18, NULL),
(17, NULL, NULL, 9, 20, 19, NULL),
(18, NULL, NULL, 9, 9, 20, NULL),
(19, NULL, NULL, NULL, 22, 21, NULL),
(20, NULL, NULL, 23, 24, 22, NULL),
(21, NULL, NULL, 24, 9, 23, NULL),
(22, NULL, NULL, NULL, 25, 24, NULL),
(23, NULL, NULL, NULL, 9, 25, NULL),
(24, NULL, NULL, NULL, 27, 26, NULL),
(25, NULL, NULL, NULL, 28, 27, NULL),
(26, NULL, NULL, 9, 29, 28, NULL),
(27, NULL, NULL, 9, 9, 29, NULL),
(28, NULL, NULL, 31, 9, 30, NULL),
(29, NULL, NULL, 33, 32, 31, NULL),
(30, NULL, NULL, NULL, 45, 32, NULL),
(31, NULL, NULL, 35, 34, 33, NULL),
(32, NULL, NULL, 35, 36, 34, NULL),
(33, NULL, NULL, NULL, 45, 36, NULL),
(34, NULL, NULL, 38, 37, 35, NULL),
(35, NULL, NULL, NULL, 39, 38, NULL),
(36, NULL, NULL, 40, 21, 39, NULL),
(37, NULL, NULL, NULL, 45, 40, NULL),
(38, NULL, NULL, NULL, 41, 37, NULL),
(39, NULL, NULL, 43, 42, 41, NULL),
(40, NULL, NULL, 43, 44, 42, NULL),
(41, NULL, NULL, NULL, 45, 44, NULL),
(42, NULL, NULL, NULL, 45, 43, NULL),
(43, NULL, NULL, NULL, 9, 45, NULL),
(44, NULL, NULL, 49, 47, 46, NULL),
(45, NULL, NULL, 48, 26, 47, NULL),
(46, NULL, NULL, 50, 48, 49, NULL),
(47, NULL, NULL, 54, 53, 48, NULL),
(48, NULL, NULL, 11, 55, 54, NULL),
(49, NULL, NULL, NULL, 9, 55, NULL),
(50, NULL, NULL, 52, 51, 50, NULL),
(51, NULL, NULL, NULL, 9, 51, NULL),
(52, NULL, NULL, 56, 53, 52, NULL),
(53, NULL, NULL, NULL, 9, 56, NULL),
(54, NULL, NULL, 57, 58, 53, NULL),
(55, NULL, NULL, NULL, 9, 57, NULL),
(56, NULL, NULL, 57, 59, 58, NULL),
(57, NULL, NULL, NULL, 9, 59, NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `sciezka_pytan`
--
ALTER TABLE `sciezka_pytan`
  ADD PRIMARY KEY (`idSciezka_pytan`),
  ADD UNIQUE KEY `sciezka_pytan_id_diagnoza_jesli_nie_f6c58146_uniq` (`id_diagnoza_jesli_nie`),
  ADD UNIQUE KEY `sciezka_pytan_id_diagnoza_jesli_tak_6275aeb4_uniq` (`id_diagnoza_jesli_tak`),
  ADD UNIQUE KEY `sciezka_pytan_id_pytanie_0b748f6a_uniq` (`id_pytanie`),
  ADD UNIQUE KEY `sciezka_pytan_id_rodzaj_zdarzenia_e816c396_uniq` (`id_rodzaj_zdarzenia`),
  ADD KEY `sciezka_pytan_id_next_pytanie_jesli_nie_883e8023` (`id_next_pytanie_jesli_nie`),
  ADD KEY `sciezka_pytan_id_next_pytanie_jesli_tak_d4c82901` (`id_next_pytanie_jesli_tak`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `sciezka_pytan`
--
ALTER TABLE `sciezka_pytan`
  MODIFY `idSciezka_pytan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `sciezka_pytan`
--
ALTER TABLE `sciezka_pytan`
  ADD CONSTRAINT `sciezka_pytan_id_diagnoza_jesli_ni_f6c58146_fk_diagnoza_` FOREIGN KEY (`id_diagnoza_jesli_nie`) REFERENCES `diagnoza` (`idDiagnoza`),
  ADD CONSTRAINT `sciezka_pytan_id_diagnoza_jesli_ta_6275aeb4_fk_diagnoza_` FOREIGN KEY (`id_diagnoza_jesli_tak`) REFERENCES `diagnoza` (`idDiagnoza`),
  ADD CONSTRAINT `sciezka_pytan_id_next_pytanie_jesl_d4c82901_fk_pytanie_i` FOREIGN KEY (`id_next_pytanie_jesli_tak`) REFERENCES `pytanie` (`idPytanie`),
  ADD CONSTRAINT `sciezka_pytan_id_pytanie_0b748f6a_fk_pytanie_idPytanie` FOREIGN KEY (`id_pytanie`) REFERENCES `pytanie` (`idPytanie`),
  ADD CONSTRAINT `sciezka_pytan_id_rodzaj_zdarzenia_e816c396_fk_rodzaj_zd` FOREIGN KEY (`id_rodzaj_zdarzenia`) REFERENCES `rodzaj_zdarzenia` (`idRodzaj_zdarzenia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

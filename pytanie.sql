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
-- Struktura tabeli dla tabeli `pytanie`
--

CREATE TABLE `pytanie` (
  `idPytanie` smallint(6) NOT NULL,
  `tresc` varchar(300) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pytanie`
--

INSERT INTO `pytanie` (`idPytanie`, `tresc`) VALUES
(1, 'Czy zostały wykryte częste próby logowań do usług?'),
(2, 'Czy wykryto udane logowanie?'),
(3, 'Czy konta, na które udało się zalogować zostały zablokowane?'),
(4, 'Należy rozłączyć użytkownikó korzystających z podanych usług, które były atakowane'),
(5, 'Na wszelki wypadek należy zmienić hasła do danych usług na bezpieczne'),
(6, 'Czy ograniczono dostęp do wybranych usług?'),
(7, 'Należy zabezpieczyć usługi odpowiednio przed atakami brute force, np. blokować konto po dużej ilości prób błędnego dostępu.'),
(8, 'Czy problem ustąpił?'),
(9, 'Wygeneruj raport'),
(10, 'Wypełnij formularz'),
(11, 'Czy internet działa wolniej (przepustowość jest na niższym lub zerowym poziomie)?'),
(12, 'Czy zaobserwowano gwałtowny wzrost liczby użytkowników lub żądań od nieznanych urządzeń w sieci? np. za pomocą programu NetFlow'),
(13, 'Czy za pomocą wiresharka (lub alertów z systemu IDS) zaobserwowano wzmożoną liczbę pakietów TCP z flagą SYN znacząco przekraczającą liczbę pakietów z flagą ACK?'),
(14, 'Poprzez typ ataku (SYN Flood) nie można stwierdzić w wiarygodny sposób danych o źródle ataku, więc należy zablokować ruch pakietów TCP z flagą SYN na adres (i port) docelowy np. za pomocą firewalla. (Gdy zostanie zaobserwowany spadek użycia reguły przez firewalla należy usunąćć regułę). Czy problem '),
(15, 'Czy za pomocą wiresharka (lub alertów z systemu IDS) zaobserwowano wzmożoną liczbę pakietów TCP z flagą SYN (lub ACK) z poszczególnych adresów IP?'),
(16, 'Należy zablokować ruch z adresu IP, który wykazał wzmożoną liczbę pakietów TCP z flagą SYN lub ACKn np za pomocą firewalla. (Gdy zostanie zaobserwowany spadek użycia reguły, należy ja usunąć). Czy problem został rozwiązany?'),
(17, 'Czy za pomocą wiresharka lub alertów z systemu IDS zaobserwowano wzmożoną liczbę odpowiedzi serwera WWW z kodem błędu 401 z poszczególnych adrresów IP?'),
(18, 'Należy zablokować ruch z adresu IP, który wykazał wzmożoną liczbę odpowiedzi serwera WWW z kodem błędu 401, np. za pomocą firewalla (Gdy zostanie zaobserwowany spadek użycia reguły, należy ją usunąć). Czy problem został rozwiązany?'),
(19, 'Czy za pomocą wiresharka zaobserwowano odpowiedzi na żadania DNS z serweró/serwisów, do których nie próbowano się połączyć lub odpowiedzi na żądania znacznie odbiegają od standardowych struktur, np. pod wzglądem wielkości pakietu?'),
(20, 'Należy zablokować ruch z określonych serwerów/serwisów DNS, z których próbowano się połączyć oraz które wysyłają odpowiedzi znacznie odbiegające od standardowych struktur. Ruch można zablokować np. za pomocą firewalla (Gdu zostanie zaobserwowany spadek użycia reguły, należy ją usunąć). Czy problem z'),
(21, 'Czy na hoście/hostach występuję podejrzana aktywność, która może wskazywać na działanie malware? (Możesz to zdiagnozować uruchamiając antywirusa w trybie Threat scan lub wyszukując podejrzane procesy w menedżerze zadań na hostach)'),
(22, 'Włącz wiresharka, czy widzisz jakąś podejrzaną aktywność z zainfekowanych hostów?'),
(23, 'Spróbuj usunąć podejrzane proccesy z hosta/hostów. Ktoś z obsługi technicznej niedługo zjawi się, aby sprawdzić zainfekowanego hosta/hosty.'),
(24, 'Czy możesz odłączyć urządzenie od sieci?'),
(25, 'Odłącz urządzenie od sieci a następnie spróbuj usunąć podejrzany program. Zbadaj czy większa ilość hostów nie jest zainfekowana. Dla bezpieczeństwa nie podłączaj urządzenia do sieci do czasu przybycia kogoś z obsługi technicznej.'),
(26, 'Czy incydent dotyczy sieci bezprzewodowej?'),
(27, 'Czy w sieci znajdują się nieznane hosty? (możesz sprawdzić za pomocą narzędzia WIPS)'),
(28, 'Uruchom narzędzie NetSpot. Czy zauważyłeś jakieś nieznane adresy IP na terenie przedsiębiorstwa lub znane adresy znajdujące się w nietypowych lokalizacjach?'),
(29, 'Zlokalizuj miejsca nietypowych aktywności a następnie odłącz urządzenie od sieci. Czy problem został rozwiązany?'),
(30, 'Sprawdź czy wiadomość jest wysłana z poprawnego adresu email zaufanej firmy, jeżeli adres jest poprawny wypełnij formularz, jeżeli nie przejdź dalej'),
(31, 'Czy wiadomośc jest napisana z błędami ortograficznymi/gramatycznymi?'),
(32, 'Podejrzenie Phishingu lub SPAMU. Wyłącz otrzymywanie wiadomości email http, lub przekonwertuj je na wiadomości tylko tekstowe. Załóż filtr SPAMU'),
(33, 'Czy w wiadomości jest proźba o wysłanie poufnych informacji takich jak np. hasła?'),
(34, 'Czy odesłano poufne informację jak np. hasła, szczegóły karty płatniczej?'),
(35, 'Czzy w wiadomości znajduje się prośba lub groźba o szybką reakcję (np. groźba o usunieciu/zablokowaniu konta w przypadku jej braku) i/lub link do podejrzanej strony (lub wyglądającej znajomo)?'),
(36, 'Natychmiast zmienić hasła (o ile wysłane) i/lub skontaktować się z bankiem  w celu zablokowania karty.'),
(37, 'Sprawdź czy adres strony jest poprawny (np kombinacja liter r oraz n nie imitują litery m)'),
(38, 'Czy w wiadomości znajduje się zdjęcie lub załącznik?'),
(39, 'Czy pobrano załączony plik lub zdjęcie?'),
(40, 'Wyłącz możliwość wyświetlania zdjęć w wiadomościach email.'),
(41, 'Czy strona posiada aktualne certyfikaty i jest zabezpieczona protokołem https?'),
(42, 'Wejdź na stronę z zaufanego linku (np. wpisując nazwę witryny bezpośrednio w np. google) oraz sprawdź czy wymagana jest reakcja o której mowa w wiadomości.'),
(43, 'Dodaj stronę do czarnej listy (tą z linku z wiadomości email), wyczyść pliki cookie oraz cache przeglądarki.'),
(44, 'Odpowiednio zareaguj, jeżeli prawdziwa strona wymaga reakcji.'),
(45, 'Stwórz politykę odpowiadania na podejrzania wiadomości. Przeszkól pracowników w zakresie wykrywania phishingu. Zainstaluj oprogramowanie wykrywające i blokujące malware oraz phishing.'),
(46, 'Czy masz dostęp do internetu?'),
(47, 'Czy podczas łączenia się ze stronami z reguły chronionymi przez SSL/TLS, pojawia się komunikat oniebezpiecznym połączeniu np. przekreślona kłódka/nieważny certyfikat?'),
(48, 'Czy problem z wolnym dostępem do sieci ogranicza się tylko do jednej maszyny?'),
(49, 'Czy usługi ulokowane wewnątrz sieci firmy działają zauważalnie wolniej niż dotychczas?'),
(50, 'Wyślij ping na X.X.X.X (IP routera brzegowego do internetu). Czy otrzymałeś na niego odpowiedź?'),
(51, 'Diagnoza: Prawdopodobnie problem z dostawcą internetowym.'),
(52, 'Czy problem dotyczy tylko jednego urządzenia w danej sieci?'),
(53, 'Czy możliwe jest zrestartowanie maszyny?'),
(54, 'Czy są obecnie prowadzone prace w sieci firmy? Sprawdź skrzynkę mailową.'),
(55, 'Diagnoza: problemy techniczne spowodowane pracami w sieci.'),
(56, 'Diagnoza: Możliwy problem z routowaniem pakietów przez jeden z routerów na trasie. W formularzu zawrzyj wynik polecenia traceroute.'),
(57, 'Diagnoza: najprawdopodobniej źródło problemu po stronie urządzenia. Wymagane dalsze działania. W formularzy zawrzyj wynik polecenia traceroute.'),
(58, 'Zresetuj maszynę. Czy problem został rozwiązany?'),
(59, 'Niewymagana interwencja.');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pytanie`
--
ALTER TABLE `pytanie`
  ADD PRIMARY KEY (`idPytanie`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `pytanie`
--
ALTER TABLE `pytanie`
  MODIFY `idPytanie` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

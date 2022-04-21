--zadanie1


CREATE DATABASE firma;


--zadanie2


CREATE SCHEMA ksiegowosc;
 

---zadanie4

--Tabela pracownicy
CREATE TABLE ksiegowosc.pracownicy (
id_pracownika INT PRIMARY KEY NOT NULL,
imie NVARCHAR (255) NOT NULL,
nazwisko NVARCHAR (255) NOT NULL,
adres NVARCHAR (255)NOT NULL,
telefon INT NOT NULL,
);
--Tabela dla godzin
CREATE TABLE ksiegowosc.godziny (
id_godziny INT PRIMARY KEY NOT NULL,
datta DATE NOT NULL,
liczba_godzin INT NOT NULL,
id_pracownika INT NOT NULL,
);
--klucz obcy
ALTER TABLE ksiegowosc.godziny ADD CONSTRAINT KluczObcyIdPracownika2 FOREIGN KEY (Id_pracownika) REFERENCES ksiegowosc.pracownicy(Id_pracownika);
-- tabela dla pensji
CREATE TABLE ksiegowosc.pensje(
	Id_pensji INT PRIMARY KEY NOT NULL,
	Stanowisko NVARCHAR(255)NOT NULL,
	Kwota FLOAT NOT NULL,
);
-- tabela dla premii
CREATE TABLE ksiegowosc.premie(
	Id_premii INT PRIMARY KEY,
	rodzaj VARCHAR(255),
	kwota FLOAT
);
-- tabela wynagrodzenia
CREATE TABLE ksiegowosc.wynagrodzenie(
	id_wynagrodzenia INT PRIMARY KEY,
	datta DATE NOT NULL,
	id_pracownika INT NOT NULL,
	id_godziny INT NOT NULL,
	Id_pensji INT NOT NULL,
	Id_premii INT
)

--klucze obce dla tabeli wynagrodzenia
ALTER TABLE ksiegowosc.wynagrodzenie ADD CONSTRAINT KluczObcyIdPremii2 FOREIGN KEY (Id_premii) REFERENCES ksiegowosc.premie(Id_premii);
ALTER TABLE ksiegowosc.wynagrodzenie ADD CONSTRAINT KluczObcyIdPensji FOREIGN KEY (Id_pensji) REFERENCES ksiegowosc.pensje(Id_pensji);
ALTER TABLE ksiegowosc.wynagrodzenie ADD CONSTRAINT KluczObcyIdpracownika FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenie ADD CONSTRAINT KluczObcyIdGodziny FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny);


--zadanie5


INSERT INTO ksiegowosc.pracownicy VALUES (1, 'Damian', 'Damianowski', 'Damianowska 17', 111222334);
INSERT INTO ksiegowosc.pracownicy VALUES (2, 'Robert', 'Robertski', 'Robertowa 12', 999888777);
INSERT INTO ksiegowosc.pracownicy VALUES (3, 'Micha³', 'Michalski', 'Micha³owa 12', 111444555);
INSERT INTO ksiegowosc.pracownicy VALUES (4, 'Maciej', 'Maciejski', 'Maciejowa 44', 1234567891);
INSERT INTO ksiegowosc.pracownicy VALUES (5, 'Ewa', 'Ewska', 'Ewowa 77', 998765432);
INSERT INTO ksiegowosc.pracownicy VALUES (6, 'Piotr', 'Piotrowski', 'œw. Piotra 32', 332288812);
INSERT INTO ksiegowosc.pracownicy VALUES (7,'Gra¿yna', 'Nra¿yñska', 'Gra¿ynowa 111', 555666111);
INSERT INTO ksiegowosc.pracownicy VALUES (8, 'Kamil', 'Kamilski', 'Kamilowa 32', 444222777);
INSERT INTO ksiegowosc.pracownicy VALUES (9,'Jakub', 'Adamski', 'Adamowa 22', 111122223);
INSERT INTO ksiegowosc.pracownicy VALUES (10, 'Grzegorz', 'Grzegórzecki', 'Grzegórzecka 567', 988998890);

INSERT INTO ksiegowosc.godziny VALUES(1, '2022-04-01', 188, 1);
INSERT INTO ksiegowosc.godziny VALUES(2, '2022-04-02', 98, 2);
INSERT INTO ksiegowosc.godziny VALUES(3, '2022-04-03', 128, 3);
INSERT INTO ksiegowosc.godziny VALUES(4, '2022-03-01', 88, 4);
INSERT INTO ksiegowosc.godziny VALUES(5, '2022-03-02', 170, 5);
INSERT INTO ksiegowosc.godziny VALUES(6, '2022-03-03', 200, 6);
INSERT INTO ksiegowosc.godziny VALUES(7, '2022-03-04', 100, 7);
INSERT INTO ksiegowosc.godziny VALUES(8, '2022-03-05', 55, 8);
INSERT INTO ksiegowosc.godziny VALUES(9, '2022-03-06', 184, 9);
INSERT INTO ksiegowosc.godziny VALUES(10, '2022-03-07', 203, 10);

INSERT INTO ksiegowosc.pensje VALUES(1, 'Sprzedawca', 1000);
INSERT INTO ksiegowosc.pensje VALUES(2, 'Sprzedawca', 1100);
INSERT INTO ksiegowosc.pensje VALUES(3, 'Kierownik dzia³u produkcji', 5000);
INSERT INTO ksiegowosc.pensje VALUES(4, 'Sprz¹taczka', 2200);
INSERT INTO ksiegowosc.pensje VALUES(5, 'Ochroniarz', 900);
INSERT INTO ksiegowosc.pensje VALUES(6, 'HR', 4500);
INSERT INTO ksiegowosc.pensje VALUES(7, 'Prezes', 15000);
INSERT INTO ksiegowosc.pensje VALUES(8, 'Rekruter', 4000);
INSERT INTO ksiegowosc.pensje VALUES(9, 'Doradca Klienta', 2700);
INSERT INTO ksiegowosc.pensje VALUES(10, 'Informatyk', 6500);

INSERT INTO ksiegowosc.premie VALUES(1, 'Za dobre wyniki', 100);
INSERT INTO ksiegowosc.premie VALUES(2, 'Za nadgodziny', 200);
INSERT INTO ksiegowosc.premie VALUES(3, 'Za wzrost sprzeda¿y', 300);
INSERT INTO ksiegowosc.premie VALUES(4, 'Za 10 lat pracy', 400);
INSERT INTO ksiegowosc.premie VALUES(5, 'za 12 lat pracy', 500);
INSERT INTO ksiegowosc.premie VALUES(6, 'Za 15 lat pracy', 600);
INSERT INTO ksiegowosc.premie VALUES(7, 'Za 20 lat pracy', 700);
INSERT INTO ksiegowosc.premie VALUES(8, 'Za nowa rekrutacje', 800);
INSERT INTO ksiegowosc.premie VALUES(9, 'Za zarz¹dzanie kryzysem', 900);
INSERT INTO ksiegowosc.premie VALUES(10, 'Za now¹ stronê internetow¹', 1000);


INSERT INTO ksiegowosc.wynagrodzenie VALUES(1,'2022-05-01', 1, 1,1,1)
INSERT INTO ksiegowosc.wynagrodzenie VALUES(2, '2022-05-02', 2, 2, 2, 2)
INSERT INTO ksiegowosc.wynagrodzenie VALUES(3, '2022-05-03', 3, 3, 3, 3)
INSERT INTO ksiegowosc.wynagrodzenie VALUES(4, '2022-05-01', 4, 4, 4, NULL)
INSERT INTO ksiegowosc.wynagrodzenie VALUES(5, '2022-05-02', 5, 5, 5, 5)
INSERT INTO ksiegowosc.wynagrodzenie VALUES(6, '2022-05-03', 6, 6, 6, 6)
INSERT INTO ksiegowosc.wynagrodzenie VALUES(7, '2022-05-04', 7, 7, 7, 7)
INSERT INTO ksiegowosc.wynagrodzenie VALUES(8, '2022-05-05', 8, 8, 8, 8)
INSERT INTO ksiegowosc.wynagrodzenie VALUES(9, '2022-05-06', 9, 9, 9, NULL)
INSERT INTO ksiegowosc.wynagrodzenie VALUES(10, '2022-05-08', 10, 10, 10, NULL)


--zadanie6


--a

SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy

--b

SELECT ksiegowosc.wynagrodzenie.id_pracownika FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
JOIN ksiegowosc.pensje ON ksiegowosc.pensje.Id_pensji = ksiegowosc.wynagrodzenie.Id_pensji
WHERE ksiegowosc.pensje.Kwota > 1000;

--c


SELECT ksiegowosc.pracownicy.id_pracownika FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
JOIN ksiegowosc.pensje ON ksiegowosc.pensje.Id_pensji = ksiegowosc.wynagrodzenie.Id_pensji
WHERE ksiegowosc.wynagrodzenie.Id_premii IS NULL AND ksiegowosc.pensje.Kwota > 2000


--d


SELECT * FROM ksiegowosc.pracownicy WHERE imie LIKE 'J%'


--e


SELECT * FROM ksiegowosc.pracownicy WHERE nazwisko LIKE '%n%a'


--f


SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.godziny.liczba_godzin-160 AS nadgodziny  FROM ksiegowosc.pracownicy
JOIN ksiegowosc.godziny ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika
WHERE ksiegowosc.godziny.liczba_godzin > 160


--g

--inny sposób - wykorzystanie aliasów

SELECT p.imie, p.nazwisko FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensje pe ON pe.Id_pensji = w.Id_pensji
WHERE pe.Kwota <3000 AND pe.Kwota > 1500


--h

SELECT p.imie, p.nazwisko FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.godziny g ON p.id_pracownika = g.id_pracownika
JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika = p.id_pracownika
WHERE g.liczba_godzin > 160  AND w.Id_premii IS NULL


--i

SELECT w.id_pracownika, pe.Kwota FROM ksiegowosc.wynagrodzenie w 
JOIN ksiegowosc.pensje pe ON w.Id_pensji = pe.Id_pensji ORDER BY pe.Kwota


--j

SELECT w.id_pracownika, pe.Kwota FROM ksiegowosc.wynagrodzenie w 
JOIN ksiegowosc.pensje pe ON w.Id_pensji = pe.Id_pensji ORDER BY pe.Kwota DESC

SELECT w.id_pracownika, pr.kwota FROM ksiegowosc.wynagrodzenie w 
JOIN ksiegowosc.premie pr ON w.Id_premii = pr.Id_premii ORDER BY pr.kwota DESC


--k


SELECT pe.Stanowisko, COUNT(pe.Stanowisko) FROM ksiegowosc.pensje pe
JOIN ksiegowosc.wynagrodzenie w ON w.id_pensji = pe.id_pensji GROUP BY pe.Stanowisko


--l


SELECT pe.Stanowisko, AVG(pe.Kwota) AS ŒREDNIA,  MIN (pe.Kwota) AS MINIMALNA , MAX(pe.Kwota) AS MAKSYMALNA FROM ksiegowosc.pensje pe
JOIN ksiegowosc.wynagrodzenie w ON pe.id_pensji = w.id_pensji 
GROUP BY pe.Stanowisko HAVING pe.Stanowisko = 'Sprzedawca'


--m


Select SUM(pe.Kwota) FROM ksiegowosc.pensje pe



--f2

SELECT pe.Stanowisko, SUM (pe.Kwota) AS Suma FROM ksiegowosc.pensje pe GROUP BY pe.stanowisko 


--g2


SELECT Stanowisko, COUNT(pr.id_premii) AS Premie FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensje pe ON w.id_pensji = pe.id_pensji
JOIN ksiegowosc.premie pr ON w.id_premii = pr.id_premii GROUP BY pe.Stanowisko


--h2


alter table ksiegowosc.godziny nocheck constraint all
alter table ksiegowosc.wynagrodzenie nocheck constraint all
--tymczasowo wy³¹czamy ograniczenia klucza obcego aby usun¹æ wybrane rekordy
DELETE p FROM ksiegowosc.pracownicy  p
JOIN ksiegowosc.wynagrodzenie  w ON w.id_pracownika=p.id_pracownika
JOIN ksiegowosc.pensje  pe ON pe.id_pensji=w.id_pensji WHERE pe.kwota <1200
--powracamy do stanu przed zadaniem
alter table ksiegowosc.godziny check constraint all
alter table ksiegowosc.wynagrodzenie check constraint all

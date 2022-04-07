--zadanie1
CREATE DATABASE firma;
--zadanie2
CREATE SCHEMA rozliczenia;
---zadanie3
CREATE TABLE rozliczenia.pracownicy (
id_pracownika INT PRIMARY KEY NOT NULL,
imie NVARCHAR (255) NOT NULL,
nazwisko NVARCHAR (255) NOT NULL,
adres NVARCHAR (255)NOT NULL,
telefon INT NOT NULL,
);

CREATE TABLE rozliczenia.godziny (
id_godziny INT PRIMARY KEY NOT NULL,
datta DATE NOT NULL,
liczba_godzin INT NOT NULL,
id_pracownika INT NOT NULL,
);
ALTER TABLE rozliczenia.godziny ADD CONSTRAINT KluczObcyIdPracownika FOREIGN KEY (Id_pracownika) REFERENCES rozliczenia.pracownicy(Id_pracownika);

CREATE TABLE rozliczenia.pensje(
	Id_pensji INT PRIMARY KEY NOT NULL,
	Stanowisko VARCHAR(255)NOT NULL,
	Kwota FLOAT NOT NULL,
	Id_premii INT
);

CREATE TABLE rozliczenia.premie(
	Id_premii INT PRIMARY KEY,
	rodzaj VARCHAR(255),
	kwota FLOAT
);

ALTER TABLE rozliczenia.pensje ADD CONSTRAINT KluczObcyIdPremii FOREIGN KEY (Id_premii) REFERENCES rozliczenia.premie(Id_premii);
--zadanie4
INSERT INTO rozliczenia.pracownicy VALUES (1, 'Damian', 'Damianowski', 'Damianowska 17', 111222334);
INSERT INTO rozliczenia.pracownicy VALUES (2, 'Robert', 'Robertski', 'Robertowa 12', 999888777);
INSERT INTO rozliczenia.pracownicy VALUES (3, 'Micha³', 'Michalski', 'Micha³owa 12', 111444555);
INSERT INTO rozliczenia.pracownicy VALUES (4, 'Maciej', 'Maciejski', 'Maciejowa 44', 1234567891);
INSERT INTO rozliczenia.pracownicy VALUES (5, 'Ewa', 'Ewska', 'Ewowa 77', 998765432);
INSERT INTO rozliczenia.pracownicy VALUES (6, 'Piotr', 'Piotrowski', 'œw. Piotra 32', 332288812);
INSERT INTO rozliczenia.pracownicy VALUES (7, 'Gra¿yna', 'Gra¿yñska', 'Gra¿ynowa 111', 555666111);
INSERT INTO rozliczenia.pracownicy VALUES (8, 'Kamil', 'Kamilski', 'Kamilowa 32', 444222777);
INSERT INTO rozliczenia.pracownicy VALUES (9, 'Adam', 'Adamski', 'Adamowa 22', 111122223);
INSERT INTO rozliczenia.pracownicy VALUES (10, 'Grzegorz', 'Grzegórzecki', 'Grzegórzecka 567', 988998890);

INSERT INTO rozliczenia.godziny VALUES(1, '2022-04-01', 8, 1);
INSERT INTO rozliczenia.godziny VALUES(2, '2022-04-02', 8, 2);
INSERT INTO rozliczenia.godziny VALUES(3, '2022-04-03', 8, 3);
INSERT INTO rozliczenia.godziny VALUES(4, '2022-03-01', 8, 4);
INSERT INTO rozliczenia.godziny VALUES(5, '2022-03-02', 8, 5);
INSERT INTO rozliczenia.godziny VALUES(6, '2022-03-03', 8, 6);
INSERT INTO rozliczenia.godziny VALUES(7, '2022-03-04', 6, 7);
INSERT INTO rozliczenia.godziny VALUES(8, '2022-03-05', 5, 8);
INSERT INTO rozliczenia.godziny VALUES(9, '2022-03-06', 4, 9);
INSERT INTO rozliczenia.godziny VALUES(10, '2022-03-07', 3, 10);

INSERT INTO rozliczenia.pensje VALUES(1, 'Sprzedawca', 3000, 1);
INSERT INTO rozliczenia.pensje VALUES(2, 'Ksiêgowy', 4000, 2);
INSERT INTO rozliczenia.pensje VALUES(3, 'Kierownik dzia³u produkcji', 5000, 3);
INSERT INTO rozliczenia.pensje VALUES(4, 'Sprz¹taczka', 2200, 4);
INSERT INTO rozliczenia.pensje VALUES(5, 'Ochroniarz', 2200, 5);
INSERT INTO rozliczenia.pensje VALUES(6, 'HR', 4500, 6);
INSERT INTO rozliczenia.pensje VALUES(7, 'Prezes', 15000, 7);
INSERT INTO rozliczenia.pensje VALUES(8, 'Rekruter', 4000, 8);
INSERT INTO rozliczenia.pensje VALUES(9, 'Doradca Klienta', 2700, 9);
INSERT INTO rozliczenia.pensje VALUES(10, 'Informatyk', 6500, 10);

INSERT INTO rozliczenia.premie VALUES(1, 'Za dobre wyniki', 100);
INSERT INTO rozliczenia.premie VALUES(2, 'Za nadgodziny', 200);
INSERT INTO rozliczenia.premie VALUES(3, 'Za wzrost sprzeda¿y', 300);
INSERT INTO rozliczenia.premie VALUES(4, 'Za 10 lat pracy', 400);
INSERT INTO rozliczenia.premie VALUES(5, 'za 12 lat pracy', 500);
INSERT INTO rozliczenia.premie VALUES(6, 'Za 15 lat pracy', 600);
INSERT INTO rozliczenia.premie VALUES(7, 'Za 20 lat pracy', 700);
INSERT INTO rozliczenia.premie VALUES(8, 'Za nowa rekrutacje', 800);
INSERT INTO rozliczenia.premie VALUES(9, 'Za zarz¹dzanie kryzysem', 900);
INSERT INTO rozliczenia.premie VALUES(10, 'Za now¹ stronê internetow¹', 1000);

--zad5
SELECT nazwisko, adres FROM rozliczenia.pracownicy

--zad6

SELECT DATEPART(dw, datta), DATEPART(mm, datta) FROM rozliczenia.godziny

--zad7


EXECUTE sp_rename 'rozliczenia.pensje.Kwota', 'Kwota_Brutto', 'COLUMN';
ALTER TABLE rozliczenia.pensje ADD Kwota_netto AS Kwota_Brutto/1.23;
Select Kwota_Brutto, Kwota_netto FROM rozliczenia.pensje
select * FROM rozliczenia.pracownicy
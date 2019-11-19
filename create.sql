CREATE DATABASE StudioArchitektoniczne
GO

USE StudioArchitektoniczne
GO

SET DATEFORMAT dmy;  
GO  

CREATE TABLE Pracownicy
(
    ID_pracownik INTEGER PRIMARY KEY NOT NULL CHECK (ID_pracownik >= 0),
    PESEL NCHAR(11) NOT NULL,
    ImieNazwisko NVARCHAR(90) NOT NULL, 
    Specjalizacja NVARCHAR(60) NOT NULL CHECK (Specjalizacja in ('OBIEKT_MIESZKALNY', 'OBIEKT_USLUGOWY', 'OBIEKT_BIUROWY')),
    Uprawnienia_do_nadzoru NVARCHAR(20) NOT NULL CHECK (Uprawnienia_do_nadzoru in ('UPRAWNIONY', 'NIEUPRWANIONY')),
    ID_przelozony INTEGER NOT NULL, 
    Data_wstawnienia DATE NOT NULL,
    Data_wygasnecia DATE NULL,
)
GO

CREATE TABLE Klienci
(
    ID_klient INTEGER PRIMARY KEY NOT NULL CHECK (ID_klient >= 0),
    Nazwa NVARCHAR(30) NULL,
    ImieNazwisko NVARCHAR(90) NOT NULL, 
    Typ_klienta NVARCHAR(20) NOT NULL CHECK (Typ_klienta in ('INDYWIDUALNY', 'ORGANIZACJA')),
)
GO

CREATE TABLE Pracownicy_zewnetrzni
(
    ID_pracownik_zewnetrzny INTEGER PRIMARY KEY NOT NULL CHECK (ID_pracownik_zewnetrzny >= 0),
    ImieNazwisko NVARCHAR(90) NOT NULL,
)
GO

CREATE TABLE Daty
(
	ID_data INTEGER PRIMARY KEY NOT NULL CHECK (ID_data >= 0),
	Rok NCHAR(4) NULL,
	Miesiac NVARCHAR(20) NULL,
	Data DATE NULL,
)
GO

CREATE TABLE Szczegoly_projektu
(
    ID_szczegoly_projektu INTEGER PRIMARY KEY NOT NULL CHECK (ID_szczegoly_projektu >= 0),
    Typ_projektu NVARCHAR(20) NOT NULL CHECK (Typ_projektu in ('OBIEKT_MIESZKALNY', 'OBIEKT_USLUGOWY', 'OBIEKT_BIUROWY')),
    Czy_nadzorowano NVARCHAR(10) NULL CHECK (Czy_nadzorowano in ('NADZOROWANO', 'NIENADZOROWANO')),
    Dlugosc_trwania NVARCHAR(20) NULL,
    Obciazenie_nadzorami NVARCHAR(10) NOT NULL,
)
GO

CREATE TABLE Projekty_architektoniczne
(
    ID_projekt_architektoniczny INTEGER PRIMARY KEY NOT NULL CHECK (ID_projekt_architektoniczny >= 0),
    Czas_oczekiwania_na_rozpoczecie SMALLINT NULL CHECK (Czas_oczekiwania_na_rozpoczecie > 0),
    Czas_oczekiwania_na_zakonczenie SMALLINT NULL CHECK (Czas_oczekiwania_na_zakonczenie > 0),
    Wielkosc SMALLINT NULL CHECK (Wielkosc > 0),
    Cena INTEGER NULL CHECK (Cena >= 0),
    Ostateczna_cena INTEGER NULL CHECK (Ostateczna_cena >= 0),
    ID_data_przyjecia_do_realizacji INTEGER FOREIGN KEY REFERENCES Daty NOT NULL,
    ID_termin_rozpoczecia INTEGER FOREIGN KEY REFERENCES Daty NOT NULL,
    ID_termin_zakonczenia INTEGER FOREIGN KEY REFERENCES Daty NOT NULL,
    ID_klient INTEGER FOREIGN KEY REFERENCES Klienci NOT NULL,
    ID_szczegoly_projektu INTEGER FOREIGN KEY REFERENCES Szczegoly_projektu NOT NULL,
)
GO

CREATE TABLE Wykonane_projekty
(
    ID_pracownik INTEGER NOT NULL FOREIGN KEY REFERENCES Pracownicy,
    ID_projekt INTEGER NOT NULL FOREIGN KEY REFERENCES Projekty_architektoniczne
    PRIMARY KEY (ID_pracownik, ID_projekt),
)
GO

CREATE TABLE Szczegoly_nadzoru
(
    ID_szczegoly_nadzoru INTEGER PRIMARY KEY NOT NULL CHECK (ID_szczegoly_nadzoru >= 0),
    Dlugosc_trwania NVARCHAR(20) NULL,
)
GO

CREATE TABLE Nadzory_architektoniczne
(
    ID_nadzor_architektoniczny INTEGER PRIMARY KEY NOT NULL CHECK (ID_nadzor_architektoniczny >= 0),
    Czas_oczekiwania_na_zakonczenie SMALLINT NULL CHECK (Czas_oczekiwania_na_zakonczenie > 0),
    Wielkosc SMALLINT NULL CHECK (Wielkosc > 0),
    Koszt INTEGER NULL CHECK (Koszt >= 0),
    ID_termin_rozpoczecia INTEGER NOT NULL FOREIGN KEY REFERENCES Daty,
    ID_termin_zakonczenia INTEGER NOT NULL FOREIGN KEY REFERENCES Daty,
    ID_pracownik INTEGER NOT NULL FOREIGN KEY REFERENCES Pracownicy,
    ID_kierownik_budowy INTEGER NOT NULL FOREIGN KEY REFERENCES Pracownicy_zewnetrzni,
    ID_szczegoly_nadzoru INTEGER NOT NULL FOREIGN KEY REFERENCES Szczegoly_nadzoru,
    ID_projekt_architektoniczny INTEGER NOT NULL FOREIGN KEY REFERENCES Projekty_architektoniczne,
)
GO


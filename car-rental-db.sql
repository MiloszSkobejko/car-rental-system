-- Wypożyczalnia samochodów -- 

CREATE TABLE Klient (
    klient_ID INT AUTO_INCREMENT PRIMARY KEY,
    Imię VARCHAR(50),
    Nazwisko VARCHAR(50),
    Adres VARCHAR(100),
    E_mail VARCHAR(100),
    data_urodzenia DATE,
    nr_prawa_jazdy BIGINT,
    platnosc_inf VARCHAR(30),
    poprzednie_wyp VARCHAR(50)
);

CREATE TABLE Pracownik (
    Pracownik_ID INT PRIMARY KEY,
    Imię VARCHAR(50),
    Nazwisko VARCHAR(50),
    Adres VARCHAR(50),
    E_mail VARCHAR(50),
    data_urodzenia DATE,
    stanowisko VARCHAR(50),
    wynagrodzenie FLOAT
);

CREATE TABLE Rezerwacja (
    ID_rezerwacji INT PRIMARY KEY,
    ID_rezerwujacego INT,
    ID_pojazdu INT,
    data_rozpoczecia DATE,
    data_konca DATE,
    status_rezerwacji VARCHAR(15)
);

CREATE TABLE Wypozyczenie (
    ID_wypozyczenia INT PRIMARY KEY,
    ID_wynajmujacego INT,
    ID_pojazdu INT,
    data_rozpoczecia DATE,
    data_konca DATE,
    ile_dni INT,
    koszt FLOAT
 );

CREATE TABLE Samochod (
    ID_pojazdu INT PRIMARY KEY,
    Model VARCHAR(50),
    Marka VARCHAR(50),
    nr_rejestracyjny VARCHAR(50),
    typ_nadwozia VARCHAR(50),
    moc_silnika INT,
    pojemność_silnika FLOAT,
    moment_obr INT,
    przebieg INT,
    rok_prod INT, 
    data_zakupu DATE,
    kategoria VARCHAR(30)
);

CREATE TABLE Samochod_sportowy (
    ID_pojazdu INT PRIMARY KEY,
    przyspieszenie FLOAT,
    spalanie FLOAT,
    FOREIGN KEY (ID_pojazdu) REFERENCES Samochod(ID_pojazdu)
  );
  
  CREATE TABLE Samochod_terenowy (
    ID_pojazdu INT PRIMARY KEY,
    przeswit FLOAT,
    FOREIGN KEY (ID_pojazdu) REFERENCES Samochod(ID_pojazdu)
  );
  
  CREATE TABLE Samochod_luksusowy (
    ID_pojazdu INT PRIMARY KEY,
    wyposazenie VARCHAR(200),
    FOREIGN KEY (ID_pojazdu) REFERENCES Samochod(ID_pojazdu)
  );

CREATE TABLE Kategorie (
    ID_kategorii INT PRIMARY KEY,
    nazwa VARCHAR(30),
    opis VARCHAR(100),
    cena FLOAT
);

CREATE TABLE Serwis (
    ID_pojazdu INT PRIMARY KEY,
    data_rozpoczecia DATE,
    data_konca DATE,
    opis VARCHAR(150),
    koszt FLOAT
 );

-- WYPEŁNIANIE WARTOŚCIAMI --
INSERT INTO Klient(Imię, Nazwisko, Adres, E_mail, data_urodzenia, nr_prawa_jazdy, platnosc_inf, poprzednie_wyp)
VALUES ('Marek', 'Kowalski', 'Rotera 9, 87-190 Radom', 'm.kowalski@db.com', '1998-10-05', 789123456, 'blik', 'brak poprzednich wypożyczeń'),
       ('Tomasz', 'Kowalczyk', 'Lipowa 7, 34-567 Kraków', 'tomasz.kowalczyk@db.com', '1990-07-25', 987654321, 'PayPal', 'Wypożyczenie BMW X3 w maju 2022 r.'),
       ('Katarzyna', 'Wójcik', 'Słoneczna 10, 98-765 Poznań', 'katarzyna.wojcik@db.com', '1992-12-10', 654321987, 'karta debetowa', 'brak'),
       ('Piotr', 'Lewandowski', 'Dąbrowskiego 5, 45-678 Wrocław', 'piotr.lewandowski@db.com', '1988-09-03', 456789123, 'blik', 'Wypożyczenie Ford Focus w lipcu 2021 r.'),
       ('Magdalena', 'Kamińska', 'Świerkowa 12, 67-890 Gdańsk', 'magdalena.kaminska@db.com', '1995-06-20', 321987654, 'Przelew bankowy', 'brak');

INSERT INTO Pracownik(Pracownik_ID, Imię, Nazwisko, Adres, E_mail, data_urodzenia, stanowisko, wynagrodzenie)
VALUES
    (1, 'Jan', 'Kowalski', 'Słoneczna 5, 12-345 Warszawa', 'jan.kowalski@db.com', '1980-05-10', 'Kierownik', 5000.50),
    (2, 'Anna', 'Nowak', 'Kwiatowa 10, 34-567 Kraków', 'anna.nowak@db.com', '1992-07-20', 'Asystent', 2500.75),
    (3, 'Tomasz', 'Lewandowski', 'Dąbrowskiego 15, 98-765 Poznań', 'tomasz.lewandowski@db.com', '1985-12-03', 'Specjalista ds. Obsługi Klienta', 3500.25),
    (4, 'Katarzyna', 'Wójcik', 'Słowackiego 20, 45-678 Wrocław', 'katarzyna.wojcik@db.com', '1990-09-15', 'Księgowa', 4000.00),
    (5, 'Magdalena', 'Kamińska', 'Grunwaldzka 25, 67-890 Gdańsk', 'magdalena.kaminska@db.com', '1993-06-25', 'Analityk', 4500.80);

INSERT INTO Rezerwacja(ID_rezerwacji, ID_rezerwujacego, ID_pojazdu, data_rozpoczecia, data_konca, status_rezerwacji)
VALUES
    (1, 1, 1, '2023-05-10', '2023-05-15', 'potwierdzona'),
    (2, 2, 3, '2023-06-01', '2023-06-05', 'oczekująca'),
    (3, 3, 2, '2023-07-10', '2023-07-15', 'anulowana'),
    (4, 4, 4, '2023-08-20', '2023-08-25', 'potwierdzona'),
    (5, 5, 3, '2023-09-05', '2023-09-10', 'oczekująca');

INSERT INTO Wypozyczenie(ID_wypozyczenia, ID_wynajmujacego, ID_pojazdu, data_rozpoczecia, data_konca, ile_dni, koszt)
VALUES
    (1, 1, 2, '2023-05-10', '2023-05-15', 5, 350.50),
    (2, 2, 3, '2023-06-01', '2023-06-05', 4, 280.25),
    (3, 3, 1, '2023-07-10', '2023-07-15', 5, 400.00),
    (4, 4, 4, '2023-08-20', '2023-08-25', 6, 480.60),
    (5, 5, 2, '2023-09-05', '2023-09-10', 5, 375.75);
    
-- Wstawianie wartości do tabeli "Samochod"
INSERT INTO Samochod(ID_pojazdu, Model, Marka, nr_rejestracyjny, typ_nadwozia, moc_silnika, pojemność_silnika, moment_obr, przebieg, rok_prod, data_zakupu, kategoria)
VALUES
    (1, 'Civic', 'Honda', 'ABC123', 'sedan', 150, 1.8, 200, 50000, 2020, '2021-01-10', 'standard'),
    (2, 'Mustang', 'Ford', 'DEF456', 'coupe', 300, 2.3, 350, 30000, 2019, '2020-05-20', 'sportowy'),
    (3, 'XC90', 'Volvo', 'GHI789', 'SUV', 250, 2.0, 400, 40000, 2022, '2022-03-15', 'luksusowy'),
    (4, 'Wrangler', 'Jeep', 'JKL012', 'SUV', 270, 3.6, 320, 25000, 2021, '2021-09-05', 'terenowy'),
    (5, 'A4', 'Audi', 'MNO345', 'sedan', 200, 2.5, 250, 60000, 2020, '2020-07-01', 'standard'),
    (6, 'S Class', 'Mercedes-Benz', 'SCL002', 'sedan', 520, 3.9, 650, 21600, 2020, '2023-01-24', 'luksusowy');
    
    
    
-- Wstawianie wartości do tabeli "Samochod_sportowy"
INSERT INTO Samochod_sportowy(ID_pojazdu, przyspieszenie, spalanie)
VALUES
    (2, 4.5, 12.5);

-- Wstawianie wartości do tabeli "Samochod_terenowy"
INSERT INTO Samochod_terenowy(ID_pojazdu, przeswit)
VALUES
    (4, 20.5);

-- Wstawianie wartości do tabeli "Samochod_luksusowy"
INSERT INTO Samochod_luksusowy(ID_pojazdu, wyposazenie)
VALUES
    (3, 'skórzane fotele, system audio high-end'),
    (6, 'skórzane fotele, system audio high-end, podgrzewane siedzenia, panoramiczny dach, pneumatyczne zawieszenie');
    
  
-- Wypełnienie tabeli Kategorie
INSERT INTO Kategorie (ID_kategorii, nazwa, opis, cena)
VALUES
    (1, 'Małe samochody', 'Samochody o kompaktowych rozmiarach', 50.00),
    (2, 'Samochody luksusowe', 'Ekskluzywne samochody z najwyższym wyposażeniem', 200.00),
    (3, 'Samochody terenowe', 'Samochody przeznaczone do jazdy w trudnym terenie', 100.00);

INSERT INTO Serwis (ID_pojazdu, data_rozpoczecia, data_konca, opis, koszt)
VALUES
    (1, '2023-05-01', '2023-05-05', 'Przegląd i wymiana oleju', 150.00),
    (2, '2023-04-20', '2023-04-25', 'Naprawa awarii układu hamulcowego', 300.00),
    (3, '2023-05-10', '2023-05-12', 'Wymiana opon na sezon letni', 100.00),
    (4, '2023-05-03', '2023-05-07', 'Wymiana filtra powietrza i płynu chłodzącego', 80.00),
    (5, '2023-04-25', '2023-05-01', 'Naprawa uszkodzonego zawieszenia', 200.00),
    (6, '2023-05-10', '2023-05-12', 'Przegląd ogólny pojazdu', 100.00);

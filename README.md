# Car rental database
A comprehensive car rental system SQLlite database designed to manage customer information, vehicle details, 
rental history, reservations, and employee data. This repository provides a structured and efficient solution 
for building a car rental application.

## Intruduction
This was a project for database subject at my college. It is a SQL database with examples of SQL queries.
This databse contains tables for car rental system. Customers can reservate and rent cars. I also included 
ERD diagram in the files

## Status
Repository is all finished and won't be further developed.

## SQL Queries
#### I've prepared some quereies to check if database is functioning correctly:

```sql
SELECT * FROM Samochod WHERE rok_prod > 2020;
```
> The query selects all cars from the "Car" table whose production year is later than 2020.

```sql
SELECT * FROM Samochod_sportowy WHERE przyspieszenie < 5.0;
```
> The query selects sports cars from the "SportsCar" table whose 0-100 km/h acceleration is less than 5.0 seconds.

```sql
SELECT * FROM Rezerwacja WHERE status_rezerwacji = 'potwierdzona' AND data_rozpoczecia > CURRENT_DATE; 
```
> The query selects reservations from the "Reservation" table that have a status of "confirmed" and a start date later than the current date.

```sql
SELECT * FROM Pracownik WHERE wynagrodzenie > 5000; 
```

> This query selects employees from the "Employee" table whose salary is greater than 5000.

```sql
SELECT Klient.Imię, Klient.Nazwisko, Klient.Adres FROM Klient JOIN Rezerwacja ON Klient.klient_ID = Rezerwacja.ID_rezerwujacego WHERE Rezerwacja.data_rozpoczecia >= '2023-01-01' AND Rezerwacja.data_konca <= '2023-12-31'; 
```

> The query retrieves the first name, last name, and address of customers from the "Customer" table who have made car reservations within a specified period, using the "Reservation" table.

```sql
SELECT * FROM Samochod WHERE Marka = 'Mercedes-Benz' AND kategoria = 'luksusowy'; 
```

> The query selects cars from the "Car" table that are of the "Mercedes-Benz" brand and belong to the "luxury" category.

```sql
SELECT AVG(koszt) AS sredni_koszt_wypozyczen FROM Wypozyczenie; 
```

> The query calculates the average cost of rentals.

```sql
SELECT SUM(koszt) AS laczny_koszt_napraw FROM Serwis; 
```

> The query calculates the total cost of all repairs in the service.

```sql
SELECT MIN(rok_prod) AS najstarszy_samochod FROM Samochod; 
```

> Finds the oldest car in the rental.

```sql
SELECT Klient.Imię, Klient.Nazwisko, SUM(ile_dni) AS suma_dni_wypozyczen FROM Klient JOIN Wypozyczenie ON Klient.Klient_ID = Wypozyczenie.ID_wynajmujacego GROUP BY Klient.Imię, Klient.Nazwisko; 
```

> Calculates the total number of rental days for each customer.

```sql
SELECT Imię, Nazwisko FROM Klient ORDER BY Nazwisko ASC; 
```

> Sorts customers alphabetically by last name.

```sql
SELECT Model, Marka, moc_silnika FROM Samochod ORDER BY moc_silnika DESC; 
```

> Sorts cars in descending order by engine power.

```sql
SELECT ID_rezerwacji, data_rozpoczecia FROM Rezerwacja ORDER BY data_rozpoczecia ASC; 
```

> Sorts reservations by start date in ascending order.

```sql
FROM Serwis ORDER BY koszt DESC;
```

> Sorts service results by repair cost in descending order.

```sql
SELECT Klient.Imię, Klient.Nazwisko, Wypozyczenie.data_konca, Wypozyczenie.koszt FROM Klient JOIN Wypozyczenie ON Klient.Klient_ID = Wypozyczenie.ID_wynajmujacego WHERE Wypozyczenie.data_konca < ‚2023-6-13’; 
```

> Selects all rentals where the customer ended the rental before a specified date and displays their cost and customer information.

```sql
SELECT Imię, Nazwisko FROM Klient WHERE Imię LIKE 'T%' UNION 
```
> Combines the results of two queries that return the first names and last names of customers and employees starting with the letter "T". The result contains unique combinations of first name and last name.

```sql
SELECT Imię, Nazwisko FROM Pracownik WHERE Imię LIKE ’T%'; 
```


```sql
SELECT * FROM Samochod WHERE ID_pojazdu NOT IN (SELECT ID_pojazdu FROM Samochod_sportowy); 
```
> Finds cars that are not sports cars.

```sql
SELECT * FROM Rezerwacja WHERE ID_rezerwacji IN (SELECT ID_wypozyczenia FROM Wypozyczenie); 
```
> Finds reservations that have also been realized.

```sql
SELECT Wypozyczenie.*, Klient.Imię, Klient.Nazwisko, Samochod.Marka, Samochod.Model FROM Wypozyczenie JOIN Klient ON Wypozyczenie.ID_wynajmujacego = Klient.klient_ID JOIN Samochod ON Wypozyczenie.ID_pojazdu = Samochod.ID_pojazdu; 
```

> Finds all car rentals along with information about customers and cars.

```sql
SELECT Samochod.* FROM Samochod JOIN Rezerwacja ON Rezerwacja.ID_pojazdu = Samochod.ID_pojazdu JOIN Wypozyczenie ON Wypozyczenie.ID_pojazdu = Samochod.ID_pojazdu WHERE MONTH(Rezerwacja.data_rozpoczecia) = MONTH(Wypozyczenie.data_rozpoczecia); 
```

> Finds cars that were both reserved and rented in the same month.

```sql
SELECT Klient.Imię, Klient.Nazwisko, Rezerwacja.data_rozpoczecia, Rezerwacja.data_konca, Samochod.Marka, Samochod.Model FROM Klient JOIN Rezerwacja ON Klient.Klient_ID = Rezerwacja.ID_rezerwujacego 
```

```sql
JOIN Samochod ON Rezerwacja.ID_pojazdu = Samochod.ID_pojazdu WHERE Samochod.Marka = ‚Volvo'; 
```

```sql
SELECT Samochod.Marka, COUNT(Wypozyczenie.ID_wypozyczenia) AS liczba_wypozyczen FROM Samochod JOIN Wypozyczenie ON Samochod.ID_pojazdu = Wypozyczenie.ID_pojazdu GROUP BY Samochod.Marka; 
```

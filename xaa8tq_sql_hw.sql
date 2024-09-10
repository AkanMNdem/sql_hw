-- 1. List all countries in South America.
SELECT * FROM `country` WHERE Continent = "South America";

-- 2. Find the population of 'Germany'.
SELECT Population, Name FROM country WHERE Name = "Germany";

-- 3. Retrieve all cities in the country 'Japan'.
SELECT * FROM `city` WHERE `city`.`CountryCode` = "JPN";

-- 4. Find the 3 most populated countries in the 'Africa' region.
-- No region named 'Africa' changed it continent.
SELECT city.Name, country.Name AS CountryName, country.Region FROM city JOIN country ON country.Code = city.CountryCode WHERE country.Continent = 'Africa' ORDER BY city.Population DESC LIMIT 3;

-- 5. Retrieve the country and its life expectancy where the population is between 1 and 5 million.
SELECT Name, LifeExpectancy FROM country WHERE Population BETWEEN 1000000 AND 5000000;

-- 6. List countries with an official language of 'French'.
SELECT country.Name FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

-- 7. Retrieve all album titles by the artist 'AC/DC'.
SELECT Title FROM Album JOIN Artist ON Artist.ArtistId = Album.ArtistId WHERE Artist.ArtistId = '1';

-- 8. Find the name and email of customers located in 'Brazil'.
SELECT FirstName, LastName, Email FROM `Customer` WHERE Country = 'Brazil';

-- 9. List all playlists in the database
SELECT * FROM `Playlist`

-- 10. Find the total number of tracks in the 'Rock' genre
SELECT COUNT(Name) FROM Genre WHERE Name = 'Rock';

-- 11. List all employees who report to 'Nancy Edwards'.
SELECT * FROM Employee WHERE Employee.ReportsTo = '2';

-- 12. Calculate the total sales per customer by summing the total amount in invoices.
SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, SUM(Invoice.Total) AS TotalSales FROM Invoice JOIN Customer ON Invoice.CustomerId = Customer.CustomerId GROUP BY Customer.CustomerId, Customer.FirstName, Customer.LastName;

-- Create My Own

-- 1. Data Base already created.

-- 2. **Create the Tables:** Write SQL statements to create the tables for your database. 
--      Ensure that each table has a primary key and relationships where appropriate.
CREATE TABLE `xaa8tq`.`Sessions` 
(`ID` INT NOT NULL AUTO_INCREMENT , 
`MemberID` VARCHAR(265) NOT NULL , 
`TrainerID` VARCHAR(265) NOT NULL , 
`SessionDate` VARCHAR(12) NOT NULL , 
`Duration` VARCHAR(2) NOT NULL , 
PRIMARY KEY (`ID`)) 
ENGINE = InnoDB;

CREATE TABLE `xaa8tq`.`Members` 
(`ID` INT NOT NULL AUTO_INCREMENT , 
`FirstName` VARCHAR(265) NOT NULL , 
`LastName` VARCHAR(265) NOT NULL , 
`Phone` VARCHAR(12) NOT NULL , 
`MembershipType` VARCHAR(12) NOT NULL , 
PRIMARY KEY (`ID`)) 
ENGINE = InnoDB;

CREATE TABLE `xaa8tq`.`Trainers` 
(`ID` INT NOT NULL AUTO_INCREMENT , 
`FirstName` VARCHAR(265) NOT NULL , 
`LastName` VARCHAR(265) NOT NULL , 
`Phone` VARCHAR(12) NOT NULL , 
`Specialty` VARCHAR(25) NOT NULL , 
PRIMARY KEY (`ID`)) 
ENGINE = InnoDB;

-- 3. **Insert Data:** Insert at least 5 rows of data into each of the tables you created.
-- Insertion for Table 2
INSERT INTO `Members` 
    (`ID`, `FirstName`, `LastName`, `Phone`, `MembershipType`) 
VALUES 
    (NULL, 'Johnny', 'Johnson', '555-555-5555', 'Regular');

INSERT INTO `Members` 
    (`ID`, `FirstName`, `LastName`, `Phone`, `MembershipType`) 
VALUES 
    (NULL, 'Will', 'Williamson', '777-777-7777', 'Premium');

INSERT INTO `Members` 
(`ID`, `FirstName`, `LastName`, `Phone`, `MembershipType`) 
VALUES 
    (NULL, 'Ben', 'Benson', '111-777-7777', 'Regular');

INSERT INTO `Members` 
    (`ID`, `FirstName`, `LastName`, `Phone`, `MembershipType`) 
VALUES 
    (NULL, 'Daniel', 'McDaniels', '222-333-4444', 'Premium');

INSERT INTO `Members` 
    (`ID`, `FirstName`, `LastName`, `Phone`, `MembershipType`) 
VALUES 
    (NULL, 'Cam', 'Campbell', '111-222-3333', 'Premium');

-- Table 3
INSERT INTO `Trainers` 
    (`ID`, `FirstName`, `LastName`, `Phone`, `Specialty`) 
VALUES 
    (NULL, 'Han', 'Solo', '111-111-1111', 'Boxing Coach');

INSERT INTO `Trainers` 
    (`ID`, `FirstName`, `LastName`, `Phone`, `Specialty`) 
VALUES 
    (NULL, 'Luke', 'Skywalker', '999-999-9999', 'Cardio Training');

INSERT INTO `Trainers` 
    (`ID`, `FirstName`, `LastName`, `Phone`, `Specialty`) 
VALUES 
    (NULL, 'Obi-Wan', 'Kenobi', '222-222-3333', 'Cardio Training');

INSERT INTO `Trainers` 
    (`ID`, `FirstName`, `LastName`, `Phone`, `Specialty`) 
VALUES 
    (NULL, 'Mace', 'Windu', '555-111-1111', 'Personal Trainer');

INSERT INTO `Trainers` 
    (`ID`, `FirstName`, `LastName`, `Phone`, `Specialty`) 
VALUES 
    (NULL, 'Anakin', 'Skywalker', '111-111-1111', 'Weightlifting Coach');

-- Insertion for Table 1
INSERT INTO `Sessions`
    (`ID`, `MemberID`, `TrainerID`, `SessionDate`, `Duration`) 
VALUES 
    (NULL, '2', '3', '09-15-2024', '45');

INSERT INTO `Sessions`
    (`ID`, `MemberID`, `TrainerID`, `SessionDate`, `Duration`) 
VALUES 
    (NULL, '1', '4', '09-15-2024', '60');

INSERT INTO `Sessions`
    (`ID`, `MemberID`, `TrainerID`, `SessionDate`, `Duration`) 
VALUES 
    (NULL, '5', '1', '09-20-2024', '90');

INSERT INTO `Sessions`
    (`ID`, `MemberID`, `TrainerID`, `SessionDate`, `Duration`) 
VALUES 
    (NULL, '2', '3', '09-18-2024', '45');

INSERT INTO `Sessions`
    (`ID`, `MemberID`, `TrainerID`, `SessionDate`, `Duration`) 
VALUES 
    (NULL, '3', '5', '09-20-2024', '50');

-- 3. **Write Queries:** Write at least 3 queries to extract data from your new database
-- 3a. Query for the sum sessions on performed by Anakin Skywalker
SELECT COUNT(*) FROM Sessions WHERE TrainerID = '5'

-- 3b. Find the Duration of all training sessions performed by cardio trainers
SELECT SUM(Duration) From Sessions
JOIN Trainers ON Trainers.ID = Sessions.TrainerID
WHERE Trainers.Specialty = 'Cardio Training';

-- 3c. Find all trainers with the last name "Skywalker" 
SELECT * FROM Trainers WHERE LastName = 'Skywalker'
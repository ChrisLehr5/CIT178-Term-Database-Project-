/*CREATE DATABASE myFictionalBusiness;

USE myFictionalBusiness;
GO 
CREATE TABLE Owner (
CustomerID int NOT NULL,
FirstName nvarchar(30) NOT NULL,
LastName nvarchar(30) NOT NULL,
[Address] nvarchar(100) NULL,
Zip nvarchar(20) NULL,
PhoneNumber nvarchar(30) NULL,
CONSTRAINT PK_customers PRIMARY KEY CLUSTERED (CustomerID));
USE myFictionalBusiness;
GO
CREATE TABLE Zip(
zipcode nvarchar(20) NOT NULL,
City nvarchar(50) NOT NULL, 
[State] nvarchar(20) NOT NULL,
CONSTRAINT PK_zipcode PRIMARY KEY CLUSTERED (zipcode)); 

GO 
CREATE TABLE Office(
OfficeID int NOT NULL,
OfficeName nvarchar(30) NOT NULL,
CONSTRAINT PK_office PRIMARY KEY CLUSTERED (OfficeID));

GO
CREATE TABLE Vet (
VetID int NOT NULL,
VetName nvarchar(30) NOT NULL,
TechLevel int NOT NULL,
CONSTRAINT PK_vet PRIMARY KEY CLUSTERED (VetID));


GO 
CREATE TABLE Pet(
AnimalID int NOT NULL,
PetName nvarchar(100) NOT NULL,
PetCode char(10) NOT NULL,
CONSTRAINT PK_pet PRIMARY KEY CLUSTERED (AnimalID));

GO
CREATE TABLE AnimalType(
PetCode char(10) NOT NULL,
PetType char(50) NOT NULL, 
CONSTRAINT PK_animaltype PRIMARY KEY CLUSTERED (PetCode));

ALTER TABLE Owner WITH CHECK
ADD CONSTRAINT FK_zip_owner FOREIGN KEY(Zip)
REFERENCES Zip(zipcode)
ON UPDATE CASCADE
GO

DROP TABLE Office;

GO 
CREATE TABLE Office(
OfficeID int NOT NULL,
OfficeName nvarchar(30) NOT NULL,
VetID int NOT NULL,
CONSTRAINT PK_office PRIMARY KEY CLUSTERED (OfficeID));

DROP TABLE Pet;

GO 
CREATE TABLE Pet(
AnimalID int NOT NULL,
PetName nvarchar(100) NOT NULL,
PetCode char(10) NOT NULL,
OwnerID int NOT NULL,
CONSTRAINT PK_pet PRIMARY KEY CLUSTERED (AnimalID));

USE myFictionalBusiness;
GO 
CREATE TABLE Balance(
BillingID int NOT NULL, 
OfficeID int NOT NULL, 
OwnerID int NOT NULL, 
Balance money NOT NULL, 
Comments varchar(100) NOT NULL,
LastDateBilled varchar(100) NOT NULL, 
LastDatePaid varchar(100) NOT NULL,
CONSTRAINT PK_balance PRIMARY KEY CLUSTERED (BillingID)); 


USE myFictionalBusiness

INSERT INTO Zip VALUES ('49685', 'Traverse City', 'MI')
INSERT INTO Zip VALUES ('49684', 'Traverse City', 'MI')
INSERT INTO Zip VALUES ('49681', 'Cadillac', 'MI')
INSERT INTO Zip VALUES ('64859', 'Reed', 'MO')
INSERT INTO Zip VALUES ('32875', 'Franklins Way', 'IN')
INSERT INTO Zip VALUES ('55874', 'Aiea', 'HI')
INSERT INTO Zip VALUES ('49687', 'Shelby', 'CT')

SELECT * FROM Zip;

INSERT INTO Vet VALUES ('100', 'Dr Lindsey', '1')
INSERT INTO Vet VALUES ('102', 'Dr Jolee', '3')
INSERT INTO Vet VALUES ('15', 'Dr Aerie', '5')

SELECT * FROM Vet;

INSERT INTO AnimalType VALUES ('C', 'Cat')
INSERT INTO AnimalType VALUES ('D', 'Dog')
INSERT INTO AnimalType VALUES ('B', 'Bird')
INSERT INTO AnimalType VALUES ('G', 'Goat')
INSERT INTO AnimalType VALUES ('SN', 'Snake')

SELECT * FROM AnimalType;

INSERT INTO Owner VALUES (1, 'Franklin', 'Gunner', '123 Frankie Road', '49685','(245)888-0097')
INSERT INTO Owner VALUES (2, 'Max', 'Lehr', '617 Cedar Crest', '49684','(232)567-7897')
INSERT INTO Owner VALUES (3, 'Justin', 'Roer', '89 Thorpe Way', '49681','(234)865-2210')
INSERT INTO Owner VALUES (4, 'Killashandra', 'Ree', '78 Crystal Lane', '64859','(778)598-2642')
INSERT INTO Owner VALUES (5, 'Lars', 'Dahl', '78 Crystal Lane', '64859','(778)598-2642')
INSERT INTO Owner VALUES (6, 'Kylara', 'Wyvern', '345 Reese Blvd', '32875','(545)688-9988')
INSERT INTO Owner VALUES (7, 'Damia', 'Thorpe', '7 Front Apt 23', '55874','(411)897-2378')
INSERT INTO Owner VALUES (8, 'Sakura', 'Hanoru', '890 Gunner Lane', '49685','(543)671-0090')

SELECT * FROM Owner;

INSERT INTO Pet VALUES (500, 'Toodles', 'C', 1)
INSERT INTO Pet VALUES (501, 'Fidget', 'C', 2)
INSERT INTO Pet VALUES (502, 'Cohn', 'D', 3)
INSERT INTO Pet VALUES (503, 'Letho', 'C', 3)
INSERT INTO Pet VALUES (504, 'Spangles', 'B', 4)
INSERT INTO Pet VALUES (505, 'Roo', 'D', 5)
INSERT INTO Pet VALUES (506, 'Opal', 'G', 6)
INSERT INTO Pet VALUES (615, 'Jimmy', 'SN', 7)
INSERT INTO Pet VALUES (616, 'Mrs Fancy', 'C', 8)


INSERT INTO Balance VALUES (1, 1, 1, '$0.00', 'No Comment', '02-09-2020', '02-09-2020')
INSERT INTO Balance VALUES (2, 2, 2, '$55.00', 'Called 5/17/18 Phone D/C', '02-02-2020', 'Unpaid')
INSERT INTO Balance VALUES (3, 3, 3, '$7500.00','Called 6/7/13 Customer out of country' , '05-06-2013','Unpaid')
INSERT INTO Balance VALUES (4, 5, 3, '$0.00', 'No Comment', '05-04-2009', '05-04-2009')
INSERT INTO Balance VALUES (5, 7, 4, '$0.00', 'No Comment', '01-02-2017', '01-02-2017')
INSERT INTO Balance VALUES (6, 8, 5, '$13.23', 'Called 5/12/00 Customer mailed check', '05-09-2000', 'Unpaid')
INSERT INTO Balance VALUES (7, 3, 1, '$5.23', 'Called 12/23/14 Writing off balance', '02-02-2020', 'Unpaid')
INSERT INTO Balance VALUES (8, 9, 7, '$150.98', 'Called 2/15/20 Customer mailed check', '02-09-2020', 'Unpaid')
INSERT INTO Balance VALUES (9, 4, 8, '$175.14', 'Called out 5/8/15 Phone D/C', '03-18-2015', 'Unpaid')

SELECT * FROM Balance;


INSERT INTO Office VALUES(1, 100)
INSERT INTO Office VALUES(2, 100)
INSERT INTO Office VALUES(3, 102)
INSERT INTO Office VALUES(4, 15)
INSERT INTO Office VALUES(5, 15)
INSERT INTO Office VALUES(6, 15)
INSERT INTO Office VALUES(7, 15)
INSERT INTO Office VALUES(8, 15)
INSERT INTO Office VALUES(9, 15)
*/
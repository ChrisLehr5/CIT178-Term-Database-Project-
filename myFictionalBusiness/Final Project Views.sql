/*Final Project Views*
USE myFictionalBusiness
#1:
SELECT * FROM Owner;

GO 
--Updateable View
CREATE VIEW VI_view
AS
SELECT OwnerID, FirstName, LastName, PhoneNumber
FROM Owner;

#2:
CREATE VIEW CatOwners (OwnerID, AnimalID,PetName)
AS
SELECT AnimalID, PetName, OwnerID
FROM Pet
WHERE PetCode = 'C';

USE myFictionalBusiness;
SELECT * FROM CatOwners;

#3:
CREATE VIEW HigherTechLevels (TechLevel,VetName, VetID)
AS
SELECT TechLevel,VetName, VetID
FROM Vet
WHERE TechLevel >3;

SELECT * FROM HigherTechLevels;

#4:
SELECT * FROM Zip;

CREATE View Owners_MidWest
AS 
SELECT * FROM Zip
WHERE State IN ('IN','MI','MO'); 

SELECT * FROM Owners_MidWest;

Modifying Data:
SELECT * FROM VI_view;

USE myFictionalBusiness;
GO
INSERT INTO VI_view (OwnerID, FirstName, LastName, PhoneNumber)
VALUES(9,'Richard','Lockland',2335678907);
SELECT * FROM VI_view;*/
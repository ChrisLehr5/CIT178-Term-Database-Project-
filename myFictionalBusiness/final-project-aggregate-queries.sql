/*

#1 Amount of owners per state
USE myFictionalBusiness;
SELECT Zip.State, COUNT (DISTINCT Owner.OwnerID) AS [Owners per State]
FROM Owner JOIN Zip ON Owner.Zip = Zip.zipcode
GROUP BY Zip.State
ORDER BY [Owners per State] DESC;

#2 Displays as two tables
SELECT COUNT (DISTINCT Pet.OwnerID) AS [Pets Total]
FROM Pet JOIN Owner ON Pet.OwnerID = Owner.OwnerID
GROUP BY Owner.FirstName
 SELECT Zip.State, COUNT (DISTINCT Owner.OwnerID) AS [Owners per State]
FROM Owner JOIN Zip ON Owner.Zip = Zip.zipcode
GROUP BY Zip.State;

#3 Selecting - builds list showing min, max, avg balance
SELECT MIN(Balance.Balance) AS [Min Due],
MAX (Balance.Balance) AS [Max Due],
AVG (Balance.Balance) AS [Avg Due]
FROM Balance;

#4 Counting Vets at Locations
USE myFictionalBusiness;
SELECT Office.OfficeID, COUNT(DISTINCT Vet.VetID) AS [Vets At Office Locations]
FROM Vet JOIN Office ON Vet.VetID = Office.VetID
GROUP BY Office.OfficeID;

*/








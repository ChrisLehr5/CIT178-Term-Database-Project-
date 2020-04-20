/*Final Project Procedures 

--Retrieves and displays data
USE myFictionalBusiness;
GO 
CREATE PROC spOwner
AS
SELECT * FROM Owner
ORDER BY LastName;
GO

EXEC spOwner;

--Take an input parameter
USE myFictionalBusiness;
GO 
CREATE PROC spGetOwner
		@OwnerID int
AS
BEGIN
		SELECT * FROM Owner
		WHERE OwnerID = @OwnerID;
END
GO
EXEC spGetOwner 5

--Takes one inout parameter and returns three output parameters
USE myFictionalBusiness;
GO 
CREATE PROC spOwnerContact
	@OwnerID int,
	@FirstName nvarchar(30) OUTPUT,
	@LastName nvarchar(50) OUTPUT,
	@PhoneNumber nvarchar(30) OUTPUT
AS 
SELECT @FirstName= FirstName, @LastName = LastName, @PhoneNumber =PhoneNumber
FROM Owner
WHERE OwnerID = @OwnerID
GO
--Run procedure
DECLARE @FirstName nvarchar(30);
DECLARE @LastName nvarchar(50);
DECLARE @Phone nvarchar(30);
EXEC spOwnerContact 3, @FirstName OUTPUT, @LastName OUTPUT, @Phone OUTPUT;
SELECT @FirstName AS 'First Name', @LastName AS 'Last Name',@Phone AS 'Phone Number';

--Stored procedure that has a return value
USE myFictionalBusiness;
GO
CREATE PROC spOwnerCount
AS
DECLARE @OwnerCount int;
SELECT @OwnerCount = COUNT(*)
FROM Owner
RETURN @OwnerCount;
GO

DECLARE @OwnerCount int;
EXEC @OwnerCount =spOwnerCount;
PRINT 'There are' + CONVERT(varchar,@OwnerCount) + 'owners in your database';
GO

--Final Project User Defined Functions
--Creates the function

USE myFictionalBusiness;
GO
CREATE FUNCTION fnGetTechLevel
	(@VetName nvarchar(50) = '%')
	RETURNS int
BEGIN
	RETURN (SELECT TechLevel FROM Vet WHERE VetName LIKE @VetName);
END;

--uses the function
USE myFictionalBusiness;
GO
SELECT TechLevel, VetName FROM Vet
WHERE TechLevel = dbo.fnGetTechLevel('Aerie%');

USE myFictionalBusiness;
GO
CREATE FUNCTION fnOwnerFirstName
	(@FirstName nvarchar(50) = '%')
	RETURNS table
RETURN
	(SELECT * FROM Owner WHERE FirstName LIKE @FirstName);
GO

SELECT * FROM dbo.fnOwnerFirstName('%K%');

--Final Project Triggers
--create archive table by copying customer table without any rows
USE myFictionalBusiness;
GO
SELECT * INTO OwnerArchive 
FROM Owner
WHERE 1=0;
--update ownerarchive table and add activity column for status
ALTER TABLE OwnerArchive
ADD Activity varchar(50);
GO

--create insert trigger
CREATE TRIGGER OwnerArchive_INSERT ON Owner
	AFTER INSERT 
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @OwnerID int
	DECLARE @FirstName nvarchar(30)
	DECLARE @LastName nvarchar(30)
	DECLARE @Address nvarchar(100)
	DECLARE @Zip nvarchar(20)
	DECLARE @PhoneNumber nvarchar(20)
 
	SELECT @OwnerID =INSERTED.OwnerID, @FirstName = INSERTED.FirstName, @LastName = INSERTED.LastName,
	@Address = INSERTED.Address, @Zip = INSERTED.Zip, @PhoneNumber = INSERTED.PhoneNumber
	FROM INSERTED

	INSERT INTO OwnerArchive VALUES(@OwnerID, @FirstName, @LastName, @Address, @Zip, @PhoneNumber, 'Inserted')
END
GO

--add a row to test 
INSERT INTO Owner VALUES (12,'Henry','Tudor','7565 Apt 23','49685','(614)785-6633');
GO

--view data in owner archive
SELECT * FROM OwnerArchive;
GO

USE myFictionalBusiness;
SELECT * FROM OwnerArchive;

--create delete trigger
CREATE TRIGGER OwnerArchive_DELETE ON Owner
	AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @OwnerID int
	DECLARE @FirstName nvarchar(30)
	DECLARE @LastName nvarchar(30)
	DECLARE @Address nvarchar(100)
	DECLARE @Zip nvarchar(20)
	DECLARE @PhoneNumber nvarchar(20)
 
	SELECT @OwnerID =DELETED.OwnerID, @FirstName = DELETED.FirstName, @LastName = DELETED.LastName,
	@Address = DELETED.Address, @Zip = DELETED.Zip, @PhoneNumber = DELETED.PhoneNumber
	FROM DELETED

	INSERT INTO OwnerArchive VALUES(@OwnerID, @FirstName, @LastName, @Address, @Zip, @PhoneNumber, 'Deleted')
END
GO

--delete row from owner to test
DELETE FROM Owner WHERE OwnerID = 12;
GO

--view data in owner archive 
SELECT * FROM OwnerArchive
GO

--create update trigger
CREATE TRIGGER OwnerArchive_Update ON Owner
	AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @OwnerID int
	DECLARE @FirstName nvarchar(30)
	DECLARE @LastName nvarchar(30)
	DECLARE @Address nvarchar(100)
	DECLARE @Zip nvarchar(20)
	DECLARE @PhoneNumber nvarchar(20)
 
	SELECT @OwnerID =INSERTED.OwnerID, @FirstName = INSERTED.FirstName, @LastName = INSERTED.LastName,
	@Address = INSERTED.Address, @Zip = INSERTED.Zip, @PhoneNumber = INSERTED.PhoneNumber
	FROM INSERTED

	INSERT INTO OwnerArchive VALUES(@OwnerID, @FirstName, @LastName, @Address, @Zip, @PhoneNumber, 'Updated')
END
GO

--insert new role and then update the row to test & update
INSERT INTO Owner VALUES(15,'Imogen','Florez','345 Parkplace Circle','49684','(548)0233-5644');
GO
UPDATE Owner
SET FirstName ='Imogene'
WHERE OwnerID = 15;
GO
--view date in owner archive 
SELECT * FROM OwnerArchive;
*/
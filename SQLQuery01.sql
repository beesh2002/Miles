/*
BASHAR IBRAHEEM 
MILES Technologies DataBase Bootcamp
Taverns Database
Assignment 1
*/

--PART 1--

--------------------------------------------------------
DROP DATABASE IF EXISTS MTTDB;
CREATE DATABASE MTTDB;
USE MTTDB;
--------------------------------------------------------
--@CREATE A TABLE FOR LOCATIONS
DROP TABLE IF EXISTS Locations;
CREATE TABLE Locations 
(
	ID INT IDENTITY (1,1),
	Name Varchar(50),
	PRIMARY KEY (ID)
);
--END CREATE A TABLE FOR LOCATIONS
--SEEDING--
INSERT INTO Locations(Name)
		Values('Houston'),
				('Katy'),
				('Austin'),
				('Dallas'),
				('Pearland'),
				('El Paso'),
				('San Antonio'),
				('Spring'),
				('Brenham'),
				('Sugar Land');
--END SEEDING
--------------------------------------------------------
--@CREATE A TABLE FOR Role 
DROP TABLE IF EXISTS Roles;
CREATE TABLE Roles (
	ID INT IDENTITY(1, 1),
	RoleName varchar(50) ,
	Discription varchar(Max),
	PRIMARY KEY (ID)
);
--END CREATE A TABLE FOR Role 
--SEEDING--
INSERT INTO Roles (RoleName, Discription)
		VALUES ('Owner','The Owner of the Tavern'),
				('Admin','The Admin of the Tavern'),
				('Staff','Stafff includes cleaning and maintaine the Taveran');
--END SEEDING --
--------------------------------------------------------
--@CREATE A TABLE FOR Users 
DROP TABLE IF EXISTS Users;
CREATE TABLE Users
(
	ID INT IDENTITY(1, 1),
	Name varchar(250), 
	RoleID INT,
	PRIMARY KEY (ID)
);
-- END CREATE A TABLE FOR Users 
--SEEDING--
INSERT INTO Users (Name,RoleID) 
			VALUES ('Arevalo Brenda',1),
					('Bazinette Ezechiel',2),
					('Bido Daniel',3),
					('Blake Sidney',1),
					('Bond Nissa',3),
					('Clark Dakota',2),
					('Nunez Jeffrey',3),
					('Pan Wei',3),
					('Peterson Michael	',3),
					('Plaugher Jasin',1),
					('Anaya Juan',2),
					('Salinas Carlos',3);
--END SEEDING --
--------------------------------------------------------
--@CREATE A TABLE FOR TAVERNS
DROP TABLE IF EXISTS Taverns;
CREATE TABLE Taverns     
(
	ID INT IDENTITY(1, 1),
	Name varchar(250),
	LocationID INT , 
	OwnerID INT,
	PRIMARY KEY (ID)
);
--END CREATE A TABLE FOR TAVERNS
--SEEDING --
INSERT INTO Taverns (Name,	LocationID, OwnerID) 
			VALUES (' Bard''s Tale Tavern', 1, 1),
					('Black Barnacle', 2, 2),
					('Bloody Body', 3, 3), 
					('Busty Barmaid', 4, 2), 
					('Clay Platters', 5, 1),
					('Cob Web ', 6, 2),
					('Cracked Hoof ', 7, 3), 
					('King''s Hall ', 8, 2), 
					('Port Crevice ', 9, 2), 
					('Salty Tusk ', 10, 2),
					('Stowaway Inn ', 1, 1);
--END SEEDING --
--------------------------------------------------------
----@CREATE A TABLE FOR BasementRats
--DROP TABLE IF EXISTS BasementRats;
--CREATE TABLE BasementRats (
--	ID INT IDENTITY(1, 1),
--	Name varchar(100) ,
--	TavernID int,
--	PRIMARY KEY (ID)
--);
--------------------------------------------------------
--PART 2
--------------------------------------------------------
--@CREATE A TABLE FOR Supplies
DROP TABLE IF EXISTS Supplies;
CREATE TABLE Supplies (
	ID INT IDENTITY(1, 1),
	Name varchar(250),
	Unit varchar(50),
	PRIMARY KEY (ID)
);
--END CREATE A TABLE FOR Supplies
--SEEDING --
INSERT INTO Supplies (Unit,Name)
		VALUES ('Lbs','Salt'), 
				('Lbs','Lime' ), 
				('Lbs','Chicken'),
				('Ounce','strong ale'),
				('Lbs','Beef');
-- END SEEDING --
-----------------------------------------------------
--@CREATE A TABLE FOR Inventory
DROP TABLE IF EXISTS Inventory;
CREATE TABLE Inventory
(
	SupplyID INT,
	TavernID INT,
	Date DATETIME DEFAULT CURRENT_TIMESTAMP,
	Count INT,
	PRIMARY KEY (SupplyID,TavernID)
	
);
--END CREATE A TABLE FOR Inventory
--SEEDING --
INSERT INTO Inventory (TavernID,SupplyID,Count)
			VALUES (1,1,10),
					(1,2,50),
					(1,3,100),
					(1,4,8),
					(1,5,10),
					(2,1,20),
					(2,2,80),
					(2,3,10),
					(2,4,80),
					(2,5,60),
					(3,1,200),
					(3,2,800),
					(3,3,100),
					(3,4,800),
					(3,5,600),
					(4,1,60),
					(4,2,20),
					(4,3,30),
					(4,4,8),
					(4,5,60),
					(11,1,20),
					(11,2,80),
					(11,3,10),
					(11,4,80),
					(11,5,60);
					
-- END SEEDING --
-------------------------------------------------
--@CREATE A TABLE FOR  Tavern_Received.
DROP TABLE IF EXISTS Tavern_Received;
CREATE TABLE Tavern_Received
(
	ID INT IDENTITY (1,1),
	TavernID INT,
	SupplyID INT,
	Amount Decimal(18,2),
	Cost Decimal(18,2),
	Date DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (ID),
);
-- END CREATE A TABLE FOR  Tavern_Received.
--  SEEDING --
INSERT INTO Tavern_Received (TavernID,SupplyID,Amount,Cost)
			VALUES (1,2,52,105),
					(1,1,10,56),
					(1,3,12,100),
					(2,1,100,56),
					(3,1,20,60),
					(4,1,10,56),
					(1,3,12,100),
					(2,5,100,56),
					(3,1,20,60),
					(1,4,10,56),
					(1,3,12,100),
					(2,1,100,56),
					(3,1,20,60),
					(4,4,60,90);
-- END SEEDING --
-------------------------------------------------
--  CREATE A TABLE FOR  ServiceStatuses.
DROP TABLE IF EXISTS ServiceStatuses;
CREATE TABLE ServiceStatuses
(
	ID INT IDENTITY(1,1),
	Name Varchar(15),
	PRIMARY KEY (ID)
);
-- END CREATE A TABLE FOR  ServiceStatuses.
-- SEEDING ---
INSERT INTO ServiceStatuses (Name)
			VALUES ('Active'),
			('Incative'),
			('out of stock'),
			('discontinued');
-- END SEEDING --
--  CREATE A TABLE FOR  Services.
DROP TABLE IF EXISTS Services;
CREATE TABLE Services
(
	ID INT IDENTITY(1,1),
	Name Varchar (150),
	StatusID INT,
	TavernID INT,
	PRIMARY KEY (ID)
);
-- END CREATE A TABLE FOR  services.
--SEEDING --
INSERT INTO	services (Name,StatusID,TavernID)
		VALUES ('Pool',1,1),
				('Weapon sharpening',1,1),
				('service3',2,1),
				('service4',4,2),
				('service5',3,3)
-- END SEEDING --
--  CREATE A TABLE FOR  Sales
DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales
(
	ID INT IDENTITY (1,1),
	ServiceID INT,
	GuestID INT,
	Price INT,
	DatePurchase DATETIME,
	AmmountPurchased INT,
	TaverenID INT
	PRIMARY KEY (ID)
);
-- END CREATE A TABLE FOR  Sales
--SEEDING --
INSERT INTO Sales (ServiceID,GuestID,Price,AmmountPurchased,TaverenID)
		VALUES (1,4,23,22,1),
				(2,5,23,2,1),
				(3,6,44,443,2),
				(5,7,546,2,3),
				(4,6,3,6,4),
				(1,7,1,1,1)

-- END SEEDING --
GO
							----------END  Assignment 1 --------


							---------- Assignment 2 --------

--  CREATE A TABLE FOR  GuestStatus.
DROP TABLE IF EXISTS GuestStatus;
CREATE TABLE GuestStatus
(
	ID INT IDENTITY(1,1),
	Name Varchar(15),
	PRIMARY KEY (ID)
);
-- END CREATE A TABLE FOR  ClassLevel.
-- SEEDING ---
INSERT INTO GuestStatus(Name)
			VALUES ('sick'), 
					('fine'), 
					('hangry'), 
					('raging'), 
					('placid');
-- END SEEDING --
--  CREATE A TABLE FOR  Classes.
DROP TABLE IF EXISTS Classes;
CREATE TABLE Classes
(
	ID INT IDENTITY(1,1),
	ClaseName Varchar(15),
	PRIMARY KEY (ID)
);
-- END CREATE A TABLE FOR  Classes.
-- SEEDING ---
INSERT INTO Classes(ClaseName)
			VALUES ('mage'),
			('fighter'),
			('Warrior'),
			('VIP');
-- END SEEDING --

--  CREATE A TABLE FOR  Guests.
DROP TABLE IF EXISTS Guests;
CREATE TABLE Guests
(
	ID INT IDENTITY (1,1),
	Name varchar(250),
	Birthday Date,
	cakedays Date, 
	Notes Varchar(MAX),
	StatusID INT,
	PRIMARY KEY (ID)
);
---- END CREATE A TABLE FOR  Guests.
---- SEEDING ---


INSERT INTO Guests (Name,StatusID,Birthday)
			VALUES ('Shahid Cannon',1,'1/21/1990'),
					('Hawwa Skinner',1,'2/03/1995'),
					('Anis Huerta',2,'01/01/1980'),
					('Coby Bains',3,'12/07/1956'),
					('Calum Coombes',1,'1/12/1947'),
					('Otto Hancock',1,'6/05/2005'),
					('Felix Odonnell',1,'6/05/2001'),
					('Dionne Jones',5,'6/05/2000'),
					('Halimah Walsh',4,'6/05/1963'),
					('Oakley Gomez',1,'6/05/1954'),
					('Kacy Craig',3,'6/05/1995'),
					('Parris O''Reilly',1,'6/05/1946'),
					('Donte Stephens',2,'5/05/1937');
---- END SEEDING --

--  CREATE A TABLE FOR  ClassLevel.
DROP TABLE IF EXISTS GuestLevel;
CREATE TABLE GuestLevel
(
	ID INT IDENTITY(1,1),
	GuestID INT,
	ClassID INT,
	CLevel INT,
	PRIMARY KEY (ID)
);
-- END CREATE A TABLE FOR  ClassLevel.
-- SEEDING ---
INSERT INTO GuestLevel(GuestID,ClassID,CLevel)
		Values (1,1,3) ,  --(Guest1,mage,3)--
				(2,1,5);
-- END SEEDING --

				--------------------------------------------
				-----------ADDING FORGEN KEYS---------------
				--------------------------------------------
--ALTER TABLE Locations ADD FOREIGN KEY (StateID) References States(ID);
ALTER TABLE Taverns ADD FOREIGN KEY (LocationID) References Locations(ID);
ALTER TABLE Taverns ADD FOREIGN KEY (OwnerID) References Users(ID);
ALTER TABLE Users ADD FOREIGN KEY (RoleID) References Roles(ID);
ALTER TABLE Inventory ADD FOREIGN KEY (TavernID) References Taverns(ID);
ALTER TABLE Inventory ADD FOREIGN KEY (SupplyID) References Supplies(ID);
ALTER TABLE Tavern_Received ADD FOREIGN KEY (TavernID) References Taverns(ID);
ALTER TABLE Tavern_Received ADD FOREIGN KEY (SupplyID) References Supplies(ID);
ALTER TABLE Services ADD FOREIGN KEY (StatusID) References ServiceStatuses(ID);
ALTER TABLE Services ADD FOREIGN KEY (TavernID) References Taverns(ID);
ALTER TABLE Sales ADD FOREIGN KEY (ServiceID) References Services(ID);   --(ServiceID,GuestID,Price,AmmountPurchased,TaverenID)
ALTER TABLE Sales ADD fOREIGN KEY (GuestID) References Guests(ID);
ALTER TABLE Sales ADD FOREIGN KEY (TaverenID) References Taverns(ID);
ALTER TABLE Guests ADD FOREIGN KEY (StatusID) References GuestStatus(ID);
ALTER TABLE GuestLevel ADD FOREIGN KEY (GuestID) References Guests(ID);-----GuestLevel(GuestID,ClassID,CLevel)*****
ALTER TABLE GuestLevel ADD FOREIGN KEY (ClassID) References Classes(ID);
				--------------------------------------------
				-------END ADDING FORGEN KEYS---------------
				--------------------------------------------

DROP TABLE IF EXISTS Service_Supply;
CREATE TABLE Service_Supply
(
	ID INT IDENTITY (1,1),
	ServiceID INT FOREIGN KEY References Services(ID),
	SupplyID INT FOREIGN KEY References Supplies(ID),
);
DROP TABLE IF EXISTS Supply_Sale;
CREATE TABLE Supply_Sale
(
	ID INT IDENTITY (1,1),
	SaleID INT FOREIGN KEY References Sales(ID),
	SupplyID INT FOREIGN KEY References Supplies(ID),
);

DROP TABLE IF EXISTS Service_Sale;
CREATE TABLE Service_Sale
(
	ID INT IDENTITY (1,1),
	ServiceID INT FOREIGN KEY References Services(ID),
	SaleID INT FOREIGN KEY References Sales(ID),
	TavernId INT FOREIGN KEY References Taverns(ID)

);

							----------END Assignment 2 --------
							----------Assignmment 3 -----------
DROP TABLE IF EXISTS RoomStatus;
CREATE TABLE RoomStatus
(
	ID INT IDENTITY(1,1),
	Name Varchar(50),
	PRIMARY KEY (ID)

);
INSERT INTO RoomStatus (Name)
		VALUES ('Available'),('Occupied');

--@CREATING A table for rooms 
DROP TABLE IF EXISTS Rooms;
CREATE TABLE Rooms 
(
	ID INT IDENTITY (1,1),
	RoomNumber INT,
	RStatus INT References RoomStatus(ID), 
	TavernID INT References Taverns(ID),
	PRIMARY KEY (ID),
);

--End room table 
--SEEDING
INSERT INTO Rooms(RoomNumber,RStatus,TavernID)
		VALUES (1,2,1),(2,2,1),(3,2,1),(4,2,1),(1,2,2),(2,1,2),(3,2,2),(4,2,2),(1,2,4),(2,2,4),(3,2,4),(4,2,4);
GO
------------------------
--@CREATE TABLE TO TRACK rooms and the stays 
DROP TABLE IF EXISTS Stays;
CREATE TABLE Stays
(
	 ID INT IDENTITY (1,1),
	 Rate Decimal(18,2),
	 SaleID INT References Sales(ID),
	 GuestID INT References Guests(ID),
	 RoomID INT References Rooms(ID),
	 DateStay Date,
	 PRIMARY KEY (ID),
);

--END ROOMSTAY 
INSERT INTO Stays(Rate,SaleID,GuestID,RoomID,DateStay)
		VALUES (12,1,1,1,'01/01/2021'),(20,2,3,3,'01/05/2021'),(10,3,4,2,'06/05/2021');
GO
								--END Design of the Databese 



--SQL QUERIES 
Go
--Write a query that returns guests with a birthday before 2000.
SELECT * From Guests 
WHERE Birthday < '01/01/2000';

--Write a query to return rooms that cost more than 100 gold a night.
SELECT RoomNumber, TavernID, Rate From Rooms JOIN Stays ON Rooms.ID=Stays.RoomID
WHERE Rate>10;

--Write a query that returns UNIQUE guest names
SELECT DISTINCT Name FROM Guests;


--Write a query that returns all guests ordered by name
SELECT Name FROM Guests
ORDER BY Name ASC;


--Write a query that returns the top 10 highest price sales
SELECT TOP (3) * FROM Sales ORDER BY Price DESC;

--Write a query to return all the values stored in all Lookup Tables ????



--Write a query that returns Guest Classes with Levels 
SELECT CLevel, ClaseName, Name,
CASE  
WHEN CLevel BETWEEN 1 AND 10 THEN '1-10'
WHEN CLevel BETWEEN 11 AND 20 THEN '11-20'
ELSE  '21+'
END 
As 'Group'
FROM GuestLevel 
JOIN Classes ON Classes.ID = GuestLevel.id
JOIN guests on guests.ID = GuestLevel.ID 



--Write a series of INSERT commands that will insert the statuses of one table into another of your choosing using SELECT statements
SELECT CONCAT ('INSERT INTO ',TABLE_NAME,' (name, ID)') AS InsertCommands
FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'taverns'
UNION ALL
SELECT CONCAT ('VALUES (', (SELECT Name FROM guests WHERE ID = 1),', ',(SELECT ID FROM guests WHERE ID = 1), ' )')
UNION ALL
SELECT CONCAT ('INSERT INTO ',TABLE_NAME,' (name, ID)') AS InsertCommands
FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'taverns'
UNION ALL
SELECT CONCAT ('(', (SELECT Name FROM guests WHERE ID = 2),', ',(SELECT ID FROM guests WHERE ID = 2), ' )')
UNION ALL
SELECT CONCAT ('INSERT INTO ',TABLE_NAME,' (name, ID)') AS InsertCommands
FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'taverns'
UNION ALL
SELECT CONCAT ('(', (SELECT Name FROM guests WHERE ID = 3),', ',(SELECT ID FROM guests WHERE ID = 3), ' )')
UNION ALL
SELECT CONCAT ('INSERT INTO ',TABLE_NAME,' (name, ID)') AS InsertCommands
FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'taverns'
UNION ALL
SELECT CONCAT ('(', (SELECT Name FROM guests WHERE ID = 4),', ',(SELECT ID FROM guests WHERE ID = 4), ' )')
							----------END Assignment 3 --------
							----------Assignmment 4 -----------

--1.Write a query to return users who have admin roles
SELECT * FROM Users
WHERE RoleID=2;
 --OR A Better VIEW 
 SELECT Name, Discription FROM Users,Roles
 WHERE Users.RoleID=Roles.ID AND RoleName='Admin';
 --

 --
 
 --2.Write a query to return users who have admin [OWNER] roles and information about their taverns
SELECT Users.Name AS 'Owner Name', Taverns.Name AS 'Tavern Name' ,  CONCAT (Discription,' ',Taverns.Name) AS Discription 
FROM Users,Roles,Taverns 
WHERE Roles.id=Users.RoleID AND RoleName='Owner' AND Taverns.OwnerID = Users.ID  
--
 SELECT Users.Name as 'Owner Name', Taverns.Name as'Tavern Name'  FROM Taverns
 Join Users on Taverns.OwnerID=Users.id order by Users.Name

 --
  SELECT Users.Name as 'Owner Name', Taverns.Name as'Tavern Name' , Locations.Name AS 'Location'  FROM Taverns
  Join Users on Taverns.OwnerID=Users.id 
  Join Locations on LocationID= Locations.ID
 order by Users.Name

 --3. Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels
 SELECT  Guests.Name AS 'Guest Name',Birthday,Classes.ClaseName AS 'Class Name' , CLevel AS 'Level' FROM Guests
LEFT JOIN GuestLevel on GuestLevel.GuestID=Guests.ID
 LEFT JOIN Classes on GuestLevel.ClassID=Classes.ID
 ORDER BY Guests.Name
 
 --4.Write a query that returns the top 10 sales in terms of sales price and what the services were
 SELECT Guests.Name AS 'Guest Name', Services.Name AS 'Service Name', AmmountPurchased AS 'Ammount', Price AS 'Total' FROM Sales
 LEFT JOIN Services on Sales.ServiceID= Services.ID
 LEFT JOIN Guests on Sales.GuestID=Guests.ID

 --5.Write a query that returns guests with 2 or more classes


SELECT Guests.Name As 'Name', T.Counts As'Number of Classes' From Guests
JOIN(

SELECT GuestLevel.GuestID, COUNT(GuestID) AS 'Counts' FROM GuestLevel
Group by GuestID
HAVING COUNT(ClassID)>1) AS T on T.GuestID=Guests.ID

--6.Write a query that returns guests with 2 or more classes with levels higher than 5

 SELECT Guests.Name As 'Name', T.Counts As'Number of Classes' From Guests
JOIN(

SELECT T.GuestID, COUNT(T.GuestID) AS 'Counts' FROM (SELECT GuestLevel.GuestID, GuestLevel.ClassID FROM GuestLevel
WHERE CLevel>4)AS T
Group by GuestID
HAVING COUNT(ClassID)>1) AS T on T.GuestID=Guests.ID

--7.Write a query that returns guests with ONLY their highest level class
SELECT Guests.Name AS 'Name',T.[Max Level] From ( SELECT GuestLevel.GuestID As 'ID',MAX(GuestLevel.CLevel) AS 'Max Level' From GuestLevel
Group BY GuestLevel.GuestID)AS T 
JOIN Guests on Guests.id= t.ID


--8.

--9.

										----------END Assignment 4 --------
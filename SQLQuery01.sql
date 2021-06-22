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
	PRIMARY KEY (supplyID,TavernID),
	
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
CREATE TABLE services
(
	ID INT IDENTITY(1,1),
	Name Varchar (150),
	StatusID INT,
	PRIMARY KEY (ID)
);
-- END CREATE A TABLE FOR  services.
--SEEDING --
INSERT INTO	services (Name,StatusID)
		VALUES ('Pool',1),
				('Weapon sharpening',1),
				('service3',2),
				('service4',4),
				('service5',3)
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
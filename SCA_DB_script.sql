USE master;
GO

CREATE DATABASE SCA_DB;
GO

USE SCA_DB;
GO

CREATE TABLE dbo.[Gender_Lookup] (
  [Gender_ID] [INT] IDENTITY (1,1) NOT NULL PRIMARY KEY,
  [Gender_Description] [varchar](150) NOT NULL
);
GO

CREATE TABLE dbo.[Race_Lookup] (
  [Race_ID] [INT] IDENTITY (1,1) NOT NULL PRIMARY KEY,
  [Race_Description] [varchar](150) NOT NULL
);
GO

CREATE TABLE dbo.[Users] (
  [Users_ID] [INT] IDENTITY (1,1) PRIMARY KEY NOT NULL,
  [Gender_ID] [INT] NOT NULL,
  [Race_ID] [INT] NOT NULL,
  [Phone_Number] [numeric] NOT NULL,
  [Age] [INT] NULL,
  CONSTRAINT [FK_Users.Gender_ID]
    FOREIGN KEY ([Gender_ID])
      REFERENCES [Gender_Lookup]([Gender_ID]),
  CONSTRAINT [FK_Users.Race_ID]
    FOREIGN KEY ([Race_ID])
      REFERENCES [Race_Lookup]([Race_ID])
);
GO

CREATE TABLE dbo.[Assailant] (
  [Assailant_ID] [INT] IDENTITY (1,1) PRIMARY KEY NOT NULL,
  [Race_ID] [INT] NOT NULL,
  [Gender_ID] [INT] NOT NULL,
  [Assailant_Description] [varchar](500) NULL,
  CONSTRAINT [FK_Assailant.Gender_ID]
    FOREIGN KEY ([Gender_ID])
      REFERENCES [Gender_Lookup]([Gender_ID]),
  CONSTRAINT [FK_Assailant.Race_ID]
    FOREIGN KEY ([Race_ID])
      REFERENCES [Race_Lookup]([Race_ID])
);
GO

CREATE TABLE dbo.[Area] (
  [Area_ID] [INT] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [Postal_Code] [INT] NOT NULL,
  [Suburb] [varchar](150) NOT NULL,
  [City] [varchar](150) NOT NULL,
  [Province] [varchar](150) NOT NULL,
);
GO


CREATE TABLE dbo.[Location] (
  [Location_ID] [INT] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [Area_Code_ID] [INT] FOREIGN KEY REFERENCES [Area]([Area_ID]) NOT NULL,
  [Street_Number] [INT] NULL,
  [Street_Name] [varchar](250) NULL,
  [Map_Location] geography,
);
GO


CREATE TABLE dbo.[Incident] (
  [Incident_ID] [INT] IDENTITY (1,1) NOT NULL PRIMARY KEY,
  [Users_ID] [INT] NOT NULL,
  [Location_ID] [INT] NOT NULL,
  [DateCreated] [DATE] NOT NULL,
  [TimeCreated] [TIME] NOT NULL,
  [Incident_Description] [varchar](500) NULL,
  CONSTRAINT [FK_Incident.Location_ID]
    FOREIGN KEY ([Location_ID])
      REFERENCES [Location]([Location_ID]),
  CONSTRAINT [FK_Incident.Users_ID]
    FOREIGN KEY ([Users_ID])
      REFERENCES [Users]([Users_ID])
);
GO

CREATE TABLE dbo.[Incident_Type] (
  [Incident_Type_ID] [INT] IDENTITY (1,1) NOT NULL PRIMARY KEY,
  [Incident_Description] [varchar](150) NOT NULL,
  [Incident_Rating] [INT] NOT NULL,
);
GO

CREATE TABLE dbo.[Assailant_Incident] (
  [Assailant_Incident_ID] [INT] IDENTITY (1,1) PRIMARY KEY NOT NULL,
  [Assailant_ID] [INT],
  [Incident_ID] [INT],
  CONSTRAINT [FK_Assailant_Incident.Incident_ID]
    FOREIGN KEY ([Incident_ID])
      REFERENCES [Incident]([Incident_ID]),
  CONSTRAINT [FK_Assailant_Incident.Assailant_ID]
    FOREIGN KEY ([Assailant_ID])
      REFERENCES [Assailant]([Assailant_ID])
);
GO

CREATE TABLE dbo.[Incident_Report] (
  [Incident_Report_ID] [INT] IDENTITY (1,1) PRIMARY KEY NOT NULL,
  [Incident_ID] [INT],
  [Incident_Type_ID] [INT],
  CONSTRAINT [FK_Incident_Report.Incident_ID]
    FOREIGN KEY ([Incident_ID])
      REFERENCES [Incident]([Incident_ID]),
  CONSTRAINT [FK_Incident_Report.Incident_Type_ID]
    FOREIGN KEY ([Incident_Type_ID])
      REFERENCES [Incident_Type]([Incident_Type_ID])
);
GO

CREATE TABLE dbo.[Hospital] (
  [Hospital_ID] [INT] IDENTITY(1,1) NOT NULL,
  [Location_ID] [INT] NOT NULL,
  [Name] [varchar](150) NOT NULL,
  [Phone_Number] [numeric] NOT NULL,
  PRIMARY KEY ([Hospital_ID]),
  CONSTRAINT [FK_Hospital.Location_ID]
    FOREIGN KEY ([Location_ID])
      REFERENCES [Location]([Location_ID]),
);
GO

CREATE TABLE dbo.[SAPS] (
  [SAPS_ID] [INT] IDENTITY(1,1) NOT NULL,
  [Location_ID] [INT] NOT NULL,
  [Name] [varchar](150) NOT NULL,
  [Phone_Number] [numeric] NOT NULL,
  PRIMARY KEY ([SAPS_ID]),
  CONSTRAINT [FK_SAPS.Location_ID]
    FOREIGN KEY ([Location_ID])
      REFERENCES [Location]([Location_ID]),
);
GO

/*
* Views
*/
CREATE VIEW Gender_vs_Incidents 
AS 
SELECT	Gender_Lookup.Gender_Description GENDER, 
		COUNT(Incident.Users_ID) 'INCIDENTS BY GENDER'


FROM	Gender_Lookup 
		INNER JOIN Users
			ON 
			Gender_Lookup.Gender_ID = Users.Gender_ID
		INNER JOIN Incident
			ON
			Users.Users_ID = Incident.Users_ID

GROUP BY Gender_Lookup.Gender_Description
GO

SELECT * FROM Gender_vs_Incidents;
Go

CREATE VIEW vwAge_vs_Incidents
AS 
SELECT 
		CASE 
			WHEN Age BETWEEN 0 AND 9 THEN '0 - 9'
			WHEN Age BETWEEN 10 AND 19 THEN '10 - 19'
			WHEN Age BETWEEN 20 AND 29 THEN '20 - 29'
			WHEN Age BETWEEN 30 AND 39 THEN '30 - 39' 
			WHEN Age BETWEEN 40 AND 49 THEN '40 - 49' 
			WHEN Age BETWEEN 50 AND 59 THEN '50 - 59' 
			WHEN Age BETWEEN 60 AND 69 THEN '60 - 69'
			WHEN Age BETWEEN 70 AND 79 THEN '70 - 79'
			WHEN Age BETWEEN 80 AND 89 THEN '80 - 89'
			WHEN Age BETWEEN 90 AND 99 THEN '90 - 99'
			ELSE 'OUT OF RANGE'

			END AS 'AGE RANGE',
			COUNT(Incident.Users_ID) as 'INCIDENTS BY AGE'
	FROM Users 	
		INNER JOIN Incident
			ON
			Users.Users_ID = Incident.Users_ID
GROUP BY 
			CASE 
			WHEN Age BETWEEN 0 AND 9 THEN '0 - 9'
			WHEN Age BETWEEN 10 AND 19 THEN '10 - 19'
			WHEN Age BETWEEN 20 AND 29 THEN '20 - 29'
			WHEN Age BETWEEN 30 AND 39 THEN '30 - 39' 
			WHEN Age BETWEEN 40 AND 49 THEN '40 - 49' 
			WHEN Age BETWEEN 50 AND 59 THEN '50 - 59' 
			WHEN Age BETWEEN 60 AND 69 THEN '60 - 69'
			WHEN Age BETWEEN 70 AND 79 THEN '70 - 79'
			WHEN Age BETWEEN 80 AND 89 THEN '80 - 89'
			WHEN Age BETWEEN 90 AND 99 THEN '90 - 99' 
			ELSE 'OUT OF RANGE'
			END;
GO

SELECT * FROM vwAge_vs_Incidents;
GO

CREATE VIEW [dbo].[vwHospital_Location]
AS
SELECT        dbo.Area.Area_ID, dbo.Area.Postal_Code, dbo.Area.City, dbo.Area.Suburb, dbo.Area.Province, dbo.Hospital.Hospital_ID, dbo.Hospital.Name, dbo.Hospital.Phone_Number, dbo.Location.Location_ID, dbo.Location.Street_Number, 
                         dbo.Location.Street_Name, dbo.Location.Map_Location
FROM            dbo.Area INNER JOIN
                         dbo.Location ON dbo.Area.Area_ID = dbo.Location.Area_Code_ID INNER JOIN
                         dbo.Hospital ON dbo.Location.Location_ID = dbo.Hospital.Location_ID
GO

CREATE VIEW [dbo].[vwIncident_Location]
AS
SELECT        dbo.Area.Area_ID, dbo.Area.Postal_Code, dbo.Area.Suburb, dbo.Area.City, dbo.Area.Province, dbo.Incident.Incident_ID, dbo.Incident.Users_ID, dbo.Incident.Location_ID, dbo.Incident.DateCreated, dbo.Incident.TimeCreated, 
                         dbo.Incident.Incident_Description, dbo.Location.Location_ID AS Expr1, dbo.Location.Street_Number, dbo.Location.Street_Name, dbo.Location.Map_Location
FROM            dbo.Area INNER JOIN
                         dbo.Location ON dbo.Area.Area_ID = dbo.Location.Area_Code_ID INNER JOIN
                         dbo.Incident ON dbo.Location.Location_ID = dbo.Incident.Location_ID
GO
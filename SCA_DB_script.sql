USE master;
GO

CREATE DATABASE SCA_DB;
GO

USE SCA_DB;
GO


CREATE TABLE dbo.[Gender_Lookup] (
  [Gender_ID] [int] IDENTITY (1,1) NOT NULL PRIMARY KEY,
  [Gender_Description] [varchar](150) NOT NULL
);
GO

CREATE TABLE dbo.[Race_Lookup] (
  [Race_ID] [int] IDENTITY (1,1) NOT NULL PRIMARY KEY,
  [Race_Description] varchar(150) NOT NULL
);
GO

CREATE TABLE dbo.[User] (
  [User_ID] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
  [Gender_ID] INT NOT NULL,
  [Race_ID] INT NOT NULL,
  [Phone_Number] varchar(15) NULL,
  [Age] INT NULL,
  CONSTRAINT [FK_User.Gender_ID]
    FOREIGN KEY ([Gender_ID])
      REFERENCES [Gender_Lookup]([Gender_ID]),
  CONSTRAINT [FK_User.Race_ID]
    FOREIGN KEY ([Race_ID])
      REFERENCES [Race_Lookup]([Race_ID])
);
GO

CREATE TABLE dbo.[Assailant] (
  [Assailant_ID] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
  [Race_ID] INT NOT NULL,
  [Gender_ID] INT NOT NULL,
  [Description] varchar(500) NULL,
  CONSTRAINT [FK_Assailant.Gender_ID]
    FOREIGN KEY ([Gender_ID])
      REFERENCES [Gender_Lookup]([Gender_ID]),
  CONSTRAINT [FK_Assailant.Race_ID]
    FOREIGN KEY ([Race_ID])
      REFERENCES [Race_Lookup]([Race_ID])
);
GO

CREATE TABLE [Area] (
  [Area_ID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [ZIP_Code] [int],
  [Suburb] [varchar](150),
  [City] [varchar](150) ,
  [Province] [varchar](150),
);
GO


CREATE TABLE [Location] (
  [Location_ID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [Area_Code_ID] [int] FOREIGN KEY REFERENCES [Area]([Area_ID]) NOT NULL,
  [Street_Number] [int],
  [Street_Name] [varchar](250),
  [Latitude] [decimal](10,6),
  [Longitude] [decimal](10,6),
);
GO


CREATE TABLE dbo.[Incident] (
  [Incident_ID] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
  [User_ID] INT NOT NULL,
  [Location_ID] INT NOT NULL,
  [Date] DATE NOT NULL,
  [Time] TIME NOT NULL,
  [Description] varchar(150) NOT NULL,
  CONSTRAINT [FK_Incident.Location_ID]
    FOREIGN KEY ([Location_ID])
      REFERENCES [Location]([Location_ID]),
  CONSTRAINT [FK_Incident.User_ID]
    FOREIGN KEY ([User_ID])
      REFERENCES [User]([User_ID])
);
GO

CREATE TABLE dbo.[Incident_Type] (
  [Incident_Type_ID] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
  [Incident_Description] varchar(150)
);
GO

CREATE TABLE [Assailant_Incident] (
  [Assailant_ID] [int],
  [Incident_ID] [int],
  CONSTRAINT [FK_Assailant_Incident.Incident_ID]
    FOREIGN KEY ([Incident_ID])
      REFERENCES [Incident]([Incident_ID]),
  CONSTRAINT [FK_Assailant_Incident.Assailant_ID]
    FOREIGN KEY ([Assailant_ID])
      REFERENCES [Assailant]([Assailant_ID])
);
GO

CREATE TABLE [Incident_Report] (
  [Incident_ID] [int],
  [Incident_Type_ID] [int],
  CONSTRAINT [FK_Incident_Report.Incident_ID]
    FOREIGN KEY ([Incident_ID])
      REFERENCES [Incident]([Incident_ID]),
  CONSTRAINT [FK_Incident_Report.Incident_Type_ID]
    FOREIGN KEY ([Incident_Type_ID])
      REFERENCES [Incident_Type]([Incident_Type_ID])
);
GO

CREATE TABLE [Hospital] (
  [ID] [int] IDENTITY(1,1) NOT NULL,
  [Location_ID] integer,
  [Name] varchar(150),
  [Phone Number] varchar(11),
  PRIMARY KEY ([ID]),
  CONSTRAINT [FK_Hospital.Location_ID]
    FOREIGN KEY ([Location_ID])
      REFERENCES [Location]([Location_ID]),
);
GO

CREATE TABLE [SAPS] (
  [ID] [int] IDENTITY(1,1) NOT NULL,
  [Location_ID] integer,
  [Name] varchar,
  [Phone Number] varchar(1),
  PRIMARY KEY ([ID]),
  CONSTRAINT [FK_SAPS.Location_ID]
    FOREIGN KEY ([Location_ID])
      REFERENCES [Location]([Location_ID]),
);
GO

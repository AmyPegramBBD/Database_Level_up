USE master;
GO

CREATE DATABASE SCA_DB;
GO

USE SCA_DB;
GO


CREATE TABLE dbo.[Gender_Lookup] (
  [ID] [int] IDENTITY (1,1) NOT NULL PRIMARY KEY,
  [Gender_Description] [varchar](150) NOT NULL
 
);

CREATE TABLE dbo.[Race_Lookup] (
  [ID] [int] IDENTITY (1,1) NOT NULL PRIMARY KEY,
  [Race_Description] varchar(150) NOT NULL
 
)

CREATE TABLE [Area] (
  [AreaID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [ZIP_Code] [int],
  [Suburb] [varchar](150),
  [City] [varchar](150) ,
  [Province] [varchar](150),
);


CREATE TABLE [Location] (
  [LocationID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [Area_Code_ID] [int] FOREIGN KEY REFERENCES [Area]([AreaID]) NOT NULL,
  [Street_Number] [int],
  [Street_Name] [varchar](250),
  [Latitude] [decimal](10,6),
  [Longitude] [decimal](10,6),
);

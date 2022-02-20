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
GO

CREATE TABLE dbo.[Race_Lookup] (
  [ID] [int] IDENTITY (1,1) NOT NULL PRIMARY KEY,
  [Race_Description] varchar(150) NOT NULL
 
);
GO

CREATE TABLE dbo.[User] (
  [ID] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
  [Gender_ID] INT NOT NULL,
  [Race_ID] INT NOT NULL,
  [Phone_Number] varchar(15) NULL,
  [Age] INT NULL,
  CONSTRAINT [FK_User.Gender_ID]
    FOREIGN KEY ([Gender_ID])
      REFERENCES [Gender_Lookup]([ID]),
  CONSTRAINT [FK_User.Race_ID]
    FOREIGN KEY ([Race_ID])
      REFERENCES [Race_Lookup]([ID])
);
GO

CREATE TABLE dbo.[Assailant] (
  [ID] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
  [Race_ID] INT NOT NULL,
  [Gender_ID] INT NOT NULL,
  [Description] varchar(500) NULL,
  CONSTRAINT [FK_Assailant.Gender_ID]
    FOREIGN KEY ([Gender_ID])
      REFERENCES [Gender_Lookup]([ID]),
  CONSTRAINT [FK_Assailant.Race_ID]
    FOREIGN KEY ([Race_ID])
      REFERENCES [Race_Lookup]([ID])
);
GO

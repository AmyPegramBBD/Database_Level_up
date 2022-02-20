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

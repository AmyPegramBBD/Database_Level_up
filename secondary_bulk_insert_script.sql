/*
* This file is for our insertions into the DB tables after sample data has executed
*/
USE SCA_DB;
GO

/*Gender and Race tables*/
INSERT INTO dbo.[Gender_Lookup]
([Gender_Description])
VALUES('Male'),
      ('Female'),
	  ('Other')
GO

INSERT INTO dbo.[Race_Lookup]
([Race_Description])
VALUES('White'),
      ('Black'),
	  ('Indian'),
	  ('Coloured'),
	  ('Other')
GO

/*
* This file is for our insertions into the DB tables after sample data has executed
*/
USE SCA_DB;
GO

--/*Gender and Race tables*/
--INSERT INTO dbo.[Gender_Lookup]
--([Gender_Description])
--VALUES('Male'),
--      ('Female'),
--	  ('Other'),
--	  ('Unknown');
--GO

--INSERT INTO dbo.[Race_Lookup]
--([Race_Description])
--VALUES('White'),
--      ('Black'),
--	  ('Indian'),
--	  ('Coloured'),
--	  ('Other'),
--	  ('Unknown');
--GO

/*Assailant data*/
INSERT INTO [SCA_DB].[dbo].[Assailant]
           ([Race_ID]
           ,[Gender_ID]
           ,[Description])
     VALUES
            (1,1,'white male, approximately six feet tall with a medium build. His complexion was fair and he wore a moustache'),
			(5,1,'Has scars on his forehead and right cheek.'),
			(2,3,'Wore lots of jewelry'),
			(6,2,'Group of 3 women, each wearing matching black outfits'),
			(4,1,'Very tall with long hair'),
			(6,4,'Did not see faces. Only heard deep voices with people wearing long coats'),
			(1,2,'short with pink hair'),
			(6,4,'Did not see anything. Came out of a white van'),
			(6,4,'Two people with matching tattoos on their forearms'),
			(3,1,'Friendly man approaching about getting him an uber'),
			(6,1,'Two men with caps low over their faces.'),
			(2,1,'Loud voice, with short hair'),
			(5,4,'Face tattoo'),
			(4,2,'Long acrylic nails'),
			(4,1,'Tall with massive shoulders. Rugby player build.');

GO

/*User data*/
INSERT INTO [dbo].[User]
           ([Gender_ID]
           ,[Race_ID]
           ,[Phone_Number]
           ,[Age])
     VALUES
           (3, 6, '639 325 5565', 45),
		   (1, 3, '392 571 6227', 39),
		   (1, 2, '410 243 7860', 34),
		   (4, 2, '617 475 7137', 30),
		   (4, 4, '932 930 9008', 54),
		   (2, 6, '446 832 8821', 41),
		   (2, 4, '920 818 3763', 38),
		   (3, 3, '456 665 2089', 37),
		   (1, 2, '417 227 0070', 60),
		   (3, 5, '248 775 5167', 53),
		   (1, 6, '224 343 6829', 55),
		   (1, 2, '139 785 9256', 54),
		   (3, 5, '368 479 2617', 55),
		   (2, 5, '110 527 5962', 20),
		   (2, 1, '930 214 1784', 37);
GO

INSERT INTO [dbo].[Area]
           ([Postal_Code]
		   ,[Suburb]
		   ,[City]
		   ,[Province]
		   )

VALUES    
		(8000, 'Cape Town City Centre', 'Cape Town', 'Western Cape'),
		(7925, 'Observatory', 'Cape Town', 'Western Cape'),
		(2109, 'Melville', 'Johannesburg', 'Gauteng')
GO


INSERT INTO [dbo].[Location]
           ([Area_Code_ID]
		   ,[Street_Number]
		   ,[Street_Name]
		   ,[Latitude]
		   ,[Longitude]
		   )

VALUES    
		(6, 247, 'Long street', CAST(-33.926054 AS Decimal(10, 6)), CAST(18.415200 AS Decimal(10, 6))),
		(6, 181, 'Long street', CAST(-33.924547 AS Decimal(10, 6)), CAST(18.416808 AS Decimal(10, 6))),
		(6, 69, 'Bree street', CAST(-33.919747 AS Decimal(10, 6)), CAST(18.419777 AS Decimal(10, 6))),
		(7, 11, 'Oxford road', CAST(-33.939796 AS Decimal(10, 6)), CAST(18.468154 AS Decimal(10, 6))),
		(7, 4, 'Lynton road', CAST(-33.938139 AS Decimal(10, 6)), CAST(18.471944 AS Decimal(10, 6))),
		(8, 9, '7th street', CAST(-26.176250 AS Decimal(10, 6)), CAST(28.008750 AS Decimal(10, 6))),
		(8, 70, '3rd avenue', CAST(-26.176077 AS Decimal(10, 6)), CAST(28.006872 AS Decimal(10, 6))),
		(1, 240, 'Smit street', CAST(-26.194389 AS Decimal(10, 6)), CAST(28.042829 AS Decimal(10, 6))),
		(1, 128, 'Juta street', CAST(-26.193673 AS Decimal(10, 6)), CAST(28.041248 AS Decimal(10, 6))),
		(2, 11, '3rd street', CAST(-26.167228 AS Decimal(10, 6)), CAST(28.051136 AS Decimal(10, 6))),
		(3, 70, 'Grange avenue', CAST(-33.886675 AS Decimal(10, 6)), CAST(18.503592 AS Decimal(10, 6))),
		(4, 64, 'Napier road', CAST(-26.182061 AS Decimal(10, 6)), CAST(28.018135 AS Decimal(10, 6))),
		(4, 12, 'Campbell road', CAST(-26.181003 AS Decimal(10, 6)), CAST(28.006872 AS Decimal(10, 6))),
		(4, NULL, 'Jubilee road', CAST(-26.178220 AS Decimal(10, 6)), CAST(28.040338 AS Decimal(10, 6))),
		(5, 14, 'Jellicoe avenue', CAST(-26.142809 AS Decimal(10, 6)), CAST(28.039416 AS Decimal(10, 6))),
		(1, NULL, ' Clarendon Pl', CAST(-26.187825 AS Decimal(10, 6)), CAST(28.045221 AS Decimal(10, 6))),
		(2, 15, ' Sturdee Ave, Rosebank', CAST(-26.145330 AS Decimal(10, 6)), CAST(28.038650 AS Decimal(10, 6))), 
		(3, 44, '440 Koeberg Rd, Milnerton', CAST(-33.874937 AS Decimal(10, 6)), CAST(18.501885 AS Decimal(10, 6))),
		(4, 16, 'Empire Rd, Parktownn', CAST(-26.185992 AS Decimal(10, 6)), CAST(28.037489 AS Decimal(10, 6))),
		(6, NULL,  'Cape Town City Centre', CAST(-33.927753 AS Decimal(10, 6)), CAST(18.423295 AS Decimal(10, 6))),
		(7, NULL,  'Cape Town City Centre', CAST(-33.941048 AS Decimal(10, 6)), CAST(18.423295 AS Decimal(10, 6))),
		(8, NULL, 'Mercury street', CAST(-26.192645 AS Decimal(10, 6)), CAST(27.993953 AS Decimal(10, 6))),
		(7, NULL, 'Groote Schuur drive', CAST(-33.939424 AS Decimal(10, 6)), CAST(18.464692 AS Decimal(10, 6))),
		(4, 6, 'Guild road', CAST(-26.180933 AS Decimal(10, 6)), CAST(28.018597 AS Decimal(10, 6)))
GO

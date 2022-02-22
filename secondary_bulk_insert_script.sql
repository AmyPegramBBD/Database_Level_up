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
		   ,[Province])

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
		   ,[Longitude])

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

INSERT INTO [dbo].[Incident]
		([User_ID]
		,[Location_ID]
		,[Date]
		,[Time]
		,[Description])
	VALUES 
		(9, 1, '03/05/2021', '10:11', 'Money was stolen out of my pocket while walking down the street.'),
		(5, 7, '19/06/2021', '2:02', 'I was pulled into a car, drugged, driven to an unknown location and left to die.'),
		(8, 9, '06/05/2021', '1:05', 'I was punched from behind and the attacker ran away for some unknown reason.'),
		(1, 7, '15/08/2021', '15:19', 'I was told to go back to my own country, because I am ruining this country.'),
		(6, 6, '17/02/2022', '17:00', 'I was told that my kind are not human.'),
		(15, 10, '23/12/2021', '11:33', 'I was spiked and then raped.'),
		(12, 12, '29/03/2021', '18:02', 'While walking back from class myself and a group of friends were held at gun point and forced to give up our cellphones.'),
		(13, 19, '05/12/2021', '9:59', 'My friend was working from back work, when a man in a hoodie murdered him.'),
		(7, 24, '13/08/2021', '11:25', 'I was jamming in my new ride, listening to some sweet tunes while sitting in a parking lot. When all of a sudden 3 dudes bashed my window and stole my car.'),
		(2, 7, '24/06/2021', '9:51', 'My uncle touched me when I was younger.'),
		(4, 15, '06/03/2021', '19:10', 'While sitting at the park, I witnessed a child being abused.'),
		(12, 21, '20/11/2021', '21:10', 'While walking my dog I happened to hear a loud bang and screaming coming from inside a building.'),
		(10, 20, '30/06/2021', '15:38', 'While out at a pub a man came up to me and beat me.'),
		(11, 15, '18/01/2022', '19:18', 'My handbag was stolen from the front seat of my car.'),
		(14, 8, '31/01/2022', '16:27', 'While stopped at the intersection the car infront of me was hijacked, by 4 males.');
GO

INSERT INTO [dbo].[Incident]
		([Incident_Description])
	VALUES  
		('Drugged'),
		('Assault'),
		('Murder'),
		('Held at gun point'),
		('Rape'),
		('Domestic abuse'),
		('Child abuse'),
		('Kidnapping'),
		('Pedophilia'),
		('Robbed'),
		('Stabbing'),
		('Hijacking'),
		('Racism'),
		('Xenophobia'),
		('Hate crime');
GO

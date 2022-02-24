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
	  ('Other'),
	  ('Unknown');
GO

INSERT INTO dbo.[Race_Lookup]
([Race_Description])
VALUES('White'),
      ('Black'),
	  ('Indian'),
	  ('Coloured'),
	  ('Other'),
	  ('Unknown');
GO

/*Assailant data*/
INSERT INTO [dbo].[Assailant]
           ([Race_ID]
           ,[Gender_ID]
           ,[Assailant_Description])
     VALUES
			(1, 1, 'White man wearing a black hoodie. Had curly dark hair'),
			(1, 2, 'White woman with blonde hair in a white van'),
			(2, 1, 'Red hat with long coat'),
			(3, 1, 'Jeans and tshirt, long hair'),
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
INSERT INTO [dbo].[Users]
           ([Gender_ID]
           ,[Race_ID]
           ,[Phone_Number]
           ,[Age])
     VALUES
		   (2, 1, 0715234398, 22),
		   (2, 1, 0873459838, 16),
           (3, 6, 0393255565, 45),
		   (1, 3, 3925716227, 39),
		   (1, 2, 4182437860, 34),
		   (4, 2, 6174757137, 30),
		   (4, 4, 9329309008, 54),
		   (2, 6, 4468328821, 41),
		   (2, 4, 9208183763, 38),
		   (3, 3, 4566652089, 37),
		   (1, 2, 4172270070, 60),
		   (3, 5, 2487755167, 53),
		   (1, 6, 2243436829, 55),
		   (1, 2, 1397859256, 54),
		   (3, 5, 3684792617, 55),
		   (2, 5, 1105275962, 20),
		   (2, 1, 9302141784, 37);
GO

/*Area data*/
INSERT INTO [dbo].[Area]
           ([Postal_Code]
		   ,[Suburb]
		   ,[City]
		   ,[Province])
	VALUES    
		(2001, N'Braamfontein', N'Johannesburg', N'Gauteng'),
		(2001, N'Braamfontein', N'Johannesburg', N'Gauteng'),
		(2001, N'Braamfontein', N'Johannesburg', N'Gauteng'),
		(2193, N'Parktown', N'Johannesburg', N'Gauteng'),
		(2196, N'Rosebank', N'Johannesburg', N'Gauteng'),
		(8000, 'Cape Town City Centre', 'Cape Town', 'Western Cape'),
		(7925, 'Observatory', 'Cape Town', 'Western Cape'),
		(2109, 'Melville', 'Johannesburg', 'Gauteng')
GO

/*Location data*/
INSERT INTO [dbo].[Location]
           ([Area_Code_ID]
		   ,[Street_Number]
		   ,[Street_Name]
		   ,[Map_Location])
	VALUES   
		(1, 1, N'Jan Smuts Avenue',  geography::Point(-25.571944, 31.181389, 4326)),
		(2, 1, N'Newtown Avenue', geography::Point(-26.159500, 28.051833, 4326)), 
		(3, 1, N'N Bank Ln', geography::Point(-26.159500, 28.051833, 4326)),
		(4, 17, N'Jubilee Road', geography::Point(-26.159500, 28.051833, 4326)),
		(5, 15, N'Sturdee Avenue', geography::Point(-26.159500, 28.051833, 4326)),
		(6, 247, 'Long street',  geography::Point(-33.926054, 18.415200, 4326)),
		(6, 181, 'Long street', geography::Point(-33.924547, 18.416808, 4326)),
		(6, 69, 'Bree street', geography::Point(-33.919747, 18.419777, 4326)),
		(7, 11, 'Oxford road', geography::Point(-33.939796, 18.468154, 4326)),
		(7, 4, 'Lynton road', geography::Point(-33.938139, 18.471944, 4326)), 
		(8, 9, '7th street', geography::Point(-26.176250, 28.008750, 4326)),
		(8, 70, '3rd avenue', geography::Point(-26.176077, 28.006872, 4326)),
		(1, 240, 'Smit street', geography::Point(-26.194389, 28.042829, 4326)),
		(1, 128, 'Juta street', geography::Point(-26.193673, 28.041248, 4326)),
		(2, 11, '3rd street', geography::Point(-26.167228, 28.051136, 4326)), 
		(3, 70, 'Grange avenue', geography::Point(-33.886675, 18.503592, 4326)),
		(4, 64, 'Napier road',  geography::Point(-26.182061, 28.018135, 4326)),
		(4, 12, 'Campbell road', geography::Point(-26.181003, 28.006872, 4326)), 
		(4, NULL, 'Jubilee road', geography::Point(-26.178220, 28.040338, 4326)),
		(5, 14, 'Jellicoe avenue',geography::Point(-26.142809, 28.039416, 4326)),
		(1, NULL, ' Clarendon Pl',geography::Point(-26.187825, 28.045221 , 4326)),
		(2, 15, ' Sturdee Ave, Rosebank',geography::Point(-26.145330, 28.038650, 4326)),
		(3, 44, '440 Koeberg Rd, Milnerton',geography::Point(-33.874937, 18.501885, 4326)),
		(4, 16, 'Empire Rd, Parktownn',geography::Point(-26.185992, 28.037489, 4326)),
		(6, NULL,  'Cape Town City Centre',geography::Point(-33.927753, 18.423295, 4326)),
		(7, NULL,  'Cape Town City Centre', geography::Point(-33.941048, 18.423295, 4326)),
		(8, NULL, 'Mercury street', geography::Point(-26.192645, 27.993953, 4326)),
		(7, NULL, 'Groote Schuur drive', geography::Point(-33.939424, 18.464692, 4326)),
		(4, 6, 'Guild road', geography::Point(-26.180933,28.018597, 4326));
GO

/*SAPS data*/
INSERT INTO [dbo].[SAPS]
           ([Location_ID]
		   ,[Name]
		   ,[Phone_Number])
	VALUES
		(5, 'Rosebank Police Station', 0117784700),
		(21, 'Hillbrow SAPS',01234567890),
		(22, 'Rosebank SAPS',01234567890),
		(23, 'Milnerton SAPS',01234567890),
		(24, 'Parktown SAPS',01234567890),
		(25, 'Cape Town City Centre SAPS',01234567890),
		(26, 'Observatory SAPS',01234567890),
		(27, 'Melville SAPS',01234567890)
GO
 
/*Hospital data*/
INSERT INTO [dbo].[Hospital]
           ([Location_ID]
		   ,[Name]
		   ,[Phone_Number])
	VALUES
		(4, 'Charlotte Maxeke Johannesburg Academic Hospital', 0114884911),
		(28, 'Groote Schuur Hospital',0123456444),
		(29, 'Netcare Milpark Hospital',0123456444),
		(21, 'Hillbrow  Hospital',01277456444)
GO

/*Incident data*/
INSERT INTO [dbo].[Incident]
			([Users_ID]
			,[Location_ID]
			,[DateCreated]
			,[TimeCreated]
			,[Incident_Description])
	VALUES 
		(1, 1, '2022/02/21', '18:00:00', 'Catcalled while walking out of a lecture, then was groped'),
		(1, 1,'2022-02-21', '18:00:00', 'Catcalled while walking out of a lecture, then was groped'),
		(9, 1, '2021/05/03', '10:11', 'Money was stolen out of my pocket while walking down the street.'),
		(5, 7, '2021/06/19', '2:02', 'I was pulled into a car, drugged, driven to an unknown location and left to die.'),
		(8, 9, '2021/05/06', '1:05', 'I was punched from behind and the attacker ran away for some unknown reason.'),
		(1, 7, '2021/08/15', '15:19', 'I was told to go back to my own country, because I am ruining this country.'),
		(6, 6, '2022/02/17', '17:00', 'I was told that my kind are not human.'),
		(15, 10, '2021/12/23', '11:33', 'I was spiked and then raped.'),
		(12, 12, '2021/03/29', '18:02', 'While walking back from class myself and a group of friends were held at gun point and forced to give up our cellphones.'),
		(13, 19, '2021/12/05', '9:59', 'My friend was working from back work, when a man in a hoodie murdered him.'),
		(7, 24, '2021/08/13', '11:25', 'I was jamming in my new ride, listening to some sweet tunes while sitting in a parking lot. When all of a sudden 3 dudes bashed my window and stole my car.'),
		(2, 7, '2021/06/24', '9:51', 'I was catcalled walking, then groped by a much older man.'),
		(4, 15, '2021/03/06', '19:10', 'While sitting at the park, I witnessed a child being abused.'),
		(12, 21, '2021/11/20', '21:10', 'While walking my dog I happened to hear a loud bang and screaming coming from inside a building.'),
		(10, 20, '2021/06/30', '15:38', 'While out at a pub a man came up to me and beat me.'),
		(11, 15, '2022/01/18', '19:18', 'My handbag was stolen from the front seat of my car.'),
		(14, 8, '2022/01/31', '16:27', 'While stopped at the intersection the car infront of me was hijacked, by 4 males.');
GO

/*Incident_Type data*/
INSERT INTO [dbo].[Incident_Type]
			([Incident_Description]
			,[Incident_Rating])
	VALUES  
		('Catcalling', 2),
		('Groping', 5),
		('Smash and grab', 10),
		('Drugged',6),
		('Assault',10),
		('Murder',8),
		('Held at gun point',1),
		('Rape',8),
		('Domestic abuse',9),
		('Child abuse',10),
		('Kidnapping',7),
		('Pedophilia',1),
		('Robbed',6),
		('Stabbing',9),
		('Hijacking',8),
		('Racism',1),
		('Xenophobia',5),
		('Hate crime',3);
GO

/*
* Incident Report Junction Table
*/
INSERT INTO [dbo].[Incident_Report]
           ([Incident_ID]
           ,[Incident_Type_ID])
	VALUES
        (3, 13), (4, 11), (4, 4), (5, 5),
		(6, 17), (6, 18), (7, 16), (7, 18),
		(8, 4), (8, 8), (9, 6), (10, 7),
		(10, 13), (11, 3), (11, 15), (12, 12),
		(12, 2), (12, 10), (13, 10), (14, 9), 
		(15, 5), (16, 13), (17, 15)
GO

/*
* Incident Assailant Junction Table
*/
INSERT INTO [dbo].[Assailant_Incident]
           ([Assailant_ID]
           ,[Incident_ID])
	VALUES
		(3, 3), (10, 4), (4, 5), (3, 6),
		(11, 6), (5, 7), (9, 7), (6, 8),
		(1, 9), (12, 10), (13, 11), (17, 11),
		(7, 12), (13, 13), (12, 14), (19, 15),
		(18, 16), (14, 16), (15, 17), (16, 17)
GO

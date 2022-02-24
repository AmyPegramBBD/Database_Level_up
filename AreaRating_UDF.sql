
USE SCA_DB
GO


/* run this function first and comment out the rest*/
/*
CREATE FUNCTION dbo.AreaRatingWithCount(@InputAreaID int)  
RETURNS INT 
AS
BEGIN
    DECLARE @return_value INT
	SELECT @return_value = AVG(Incident_Type.Incident_Rating)
	FROM dbo.Incident_Type
	INNER JOIN dbo.Incident_Report  
	ON Incident_Report.Incident_Type_ID  = Incident_Type.Incident_Type_ID
	INNER JOIN dbo.Incident  
	ON Incident.Incident_ID = Incident_Report.Incident_ID 
	INNER JOIN dbo.Location 
	ON Location.Location_ID = Incident.Location_ID 
	INNER JOIN dbo.Area
	ON Area.Area_ID = Location.Area_Code_ID  
	WHERE Area.Area_ID = @InputAreaID  
	RETURN @return_value
END 
GO
*/

/* run this function second and comment out the rest including the top function*/
/*
CREATE FUNCTION dbo.AreaRatingWithRatingRangeOutput (@InputAreaIDForOutputRange int)
RETURNS VARCHAR(100) 
AS
BEGIN
    DECLARE @return_value VARCHAR(100)
	DECLARE @ratingValue INT
	SELECT @ratingValue = AVG(Incident_Type.Incident_Rating)
	FROM dbo.Incident_Type
	INNER JOIN dbo.Incident_Report  
	ON Incident_Report.Incident_Type_ID  = Incident_Type.Incident_Type_ID
	INNER JOIN dbo.Incident  
	ON Incident.Incident_ID = Incident_Report.Incident_ID 
	INNER JOIN dbo.Location 
	ON Location.Location_ID = Incident.Location_ID 
	INNER JOIN dbo.Area
	ON Area.Area_ID = Location.Area_Code_ID  
	WHERE Area.Area_ID = @InputAreaIDForOutputRange  
	
	IF(@ratingValue<5)
		BEGIN
		 SET @return_value = 'Fairly safe'
		END
	ELSE IF (@ratingValue>=5) AND (@ratingValue<10)
		BEGIN
		 SET @return_value = 'Moderately safe'
		END
	ELSE
		BEGIN
		 SET @return_value = 'Unsafe'
		END
	
	RETURN @return_value
END 
GO
*/

/* Run these statements below to test, make sure that the top two functions are now commented out since they have been created*/
Select * from Area;
Select * from Location;
Select * from Incident;  
Select * from dbo.Incident_Report;
Select * from dbo.[Incident_Type];

SELECT *   
FROM dbo.Area
INNER JOIN dbo.Location 
ON Area.Area_ID = Location.Area_Code_ID  
INNER JOIN dbo.Incident   
ON Location.Location_ID = Incident.Location_ID 
INNER JOIN dbo.Incident_Report  
ON Incident.Incident_ID = Incident_Report.Incident_ID 
INNER JOIN dbo.Incident_Type  
ON Incident_Report.Incident_Type_ID  = Incident_Type.Incident_Type_ID  WHERE Area.Area_ID =6;   /*change this value to 1-8 for different areas*/


GO
declare @InputAreaID INT
set @InputAreaID = 6;  /*change this value to 1-8 for different areas*/
select 
@InputAreaID [@InputArea]
,dbo.AreaRatingWithCount(@InputAreaID) [Area Rating]


declare @InputAreaIDForOutputRange INT
set @InputAreaIDForOutputRange = 6;   /*change this value to 1-8 for different areas*/
select 
@InputAreaIDForOutputRange [@InputAreaIDForOutputRange]
,dbo.AreaRatingWithRatingRangeOutput(@InputAreaIDForOutputRange) [Area Rating Range]


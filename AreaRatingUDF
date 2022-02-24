
USE SCA_DB
GO
/*UDF which outputs a rating value*/
CREATE FUNCTION dbo.AreaRatingWithCount(@InputAreaID int)  
RETURNS INT 
AS
BEGIN
    DECLARE @return_value int;
	SELECT @return_value = SUM(Incident_Type.Incident_Rating)
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

/* UDF that returns an output based on each rating category*/
CREATE FUNCTION dbo.AreaRatingWithRatingRangeOutput (@InputAreaID int)
RETURNS VARCHAR(100) 
AS
BEGIN
    DECLARE @return_value VARCHAR(100);
	DECLARE @ratingValue INT
	SELECT @return_value = SUM(Incident_Type.Incident_Rating)
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
	
	IF(@ratingValue<10)
		BEGIN
		SET @return_value = 'Fairly safe'
		END
	ELSE IF (@ratingValue>=10) AND (@ratingValue<20)
		BEGIN
		SET @return_value = 'Moderately safe'
		END
	ELSE
		BEGIN
		SET  @return_value = 'Unsafe'
		END
	
	RETURN @return_value
END 




/* Join tables for debugging */
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
ON Incident_Report.Incident_Type_ID  = Incident_Type.Incident_Type_ID  WHERE Area.Area_ID =1; 

/*Testing using input parameters */
GO
declare @InputAreaID INT
set @InputAreaID = 1;
select 
@InputAreaID [@InputArea]
,dbo.AreaRatingWithCount(@InputAreaID) [Area Rating]


declare @InputAreaIDForOutputRange INT
set @InputAreaIDForOutputRange = 1;
select 
@InputAreaIDForOutputRange [@InputAreaIDForOutputRange]
,dbo.AreaRatingWithRatingRangeOutput(@InputAreaIDForOutputRange) [Area Rating Range]

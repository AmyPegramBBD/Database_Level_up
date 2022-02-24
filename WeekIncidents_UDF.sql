USE SCA_DB
GO

CREATE FUNCTION dbo.getAreaRecentCrimes(@areacity varchar(120))  
RETURNS TABLE  
AS  
RETURN  
    SELECT DISTINCT Area.City, Incident_Type.Incident_Description AS [Type Description], Incident.[Incident_Description], Incident.[DateCreated]
	FROM Area
	INNER JOIN [Location] ON [Location].[Area_Code_ID] = Area_Code_ID AND  Area.City = @areacity
	INNER JOIN [Incident] ON [Incident].Location_ID =[Location].Location_ID
	INNER JOIN [Incident_Report] ON	Incident_Report.Incident_ID =Incident.[Incident_ID]
	INNER JOIN [Incident_Type] ON [Incident_Type].[Incident_Type_ID] =Incident_Report.[Incident_Type_ID]
	where Incident.[DateCreated] < GETDATE() AND Incident.[DateCreated] > DATEADD (week, -1,GETDATE()) 

GO

/** running the UDF example **/
--SELECT * from dbo.getAreaRecentCrimes('Cape Town') 

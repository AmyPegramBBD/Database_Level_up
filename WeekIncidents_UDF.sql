

CREATE FUNCTION getAreaRecentCrimes(@areacity varchar(120))  
RETURNS TABLE  
AS  
RETURN  
    SELECT DISTINCT Area.City, Incident_Type.Incident_Description, Incident.Description, Incident.Date
	FROM Area
	INNER JOIN Location ON Location.Area_Code_ID = Area_Code_ID AND  Area.City = @areacity
	INNER JOIN Incident ON Incident.Location_ID =Location.Location_ID
	INNER JOIN Incident_Report ON	Incident_Report.Incident_ID =Incident.Incident_ID
	INNER JOIN Incident_Type ON Incident_Type.Incident_Type_ID =Incident_Report.Incident_Type_ID
	where Incident.Date < GETDATE() AND Incident.Date > DATEADD (week, -1,GETDATE()) 
	 

	 /** running the UDF example
SELECT * from dbo.getAreaRecentCrimes('Cape Town') 
	**/

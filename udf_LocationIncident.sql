/*
* This UDF will accept an input of street number and street name and output a table of incidents that took place at that area.
* The table will also show the incident description, incident classifications and a description of the attacker
*/
USE SCA_DB
GO

CREATE FUNCTION udf_getIncidentReportFilter (@streetNumber int, @streetName varchar(150))
RETURNS TABLE
AS
RETURN
(	
    SELECT 
    	[SCA_DB].[dbo].[Incident_Report_View].[Incident_ID],
      	[SCA_DB].[dbo].[Incident_Report_View].[Incident_Description],
     	[SCA_DB].[dbo].[Incident_Report_View].[Classification],
      	[SCA_DB].[dbo].[Incident_Report_View].[Assailiant's Description]
    FROM 
  	[SCA_DB].[dbo].[Incident_Report_View], [Incident]
    WHERE 
  	[SCA_DB].[dbo].[Incident_Report_View].Incident_ID = [Incident].[Incident_ID]
    AND
  	[Incident].Location_ID = (SELECT DISTINCT Location_ID 
				  FROM 
			      		[SCA_DB].[dbo].[Location] L 
			          WHERE 
					L.Street_Name = @streetName
				  AND
				      	L.Street_Number = @streetNumber)
		
);
GO


--Used the following SELECT statement to test UDF

SELECT * FROM udf_getIncidentReportFilter(181, 'Long Street');

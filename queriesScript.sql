/*
* Use this script to test functions created
*/

USE SCA_DB
GO
 
 -- Andrew
-- SCA_DB_script.sql

SELECT * FROM vwAge_vs_Incidents;
SELECT * FROM Gender_vs_Incidents;

-- Nikita
-- IncidentReport_View.sql

SELECT * from Incident_Report_View 

-- Sandy
-- LocationIncident_UDF.sql

SELECT * FROM udf_getIncidentReportFilter(181, 'Long Street'); 

-- Phumi
-- WeekIncidents_UDF.sql

--SELECT * from dbo.getAreaRecentCrimes('Cape Town') 

-- Amy
-- usp_Get_Closest_Hospital.sql
EXEC [uspGet_Closest_Services] 6;  

SELECT 
	[dbo].[vwHospital_Location].[Name], [dbo].[vwHospital_Location].[Phone_Number], 
	[dbo].[vwHospital_Location].[Street_Number], [dbo].[vwHospital_Location].[Street_Name], 
	[dbo].[vwHospital_Location].[Suburb],[dbo].[vwHospital_Location].City,
	dbo.[vwHospital_Location].[Province], Map_Location.ToString() 
	AS 'GPS Location' 
	FROM 
		[dbo].[vwHospital_Location] 
	WHERE
		Location_ID = 4 

 -- Riselle
 -- AreaRatingUDF.sql 

-- this shows all the suburbs to check area
SELECT * FROM [Area]
    
declare @InputAreaIDForOutputRange INT;
-- change this value view different areas
declare @InputAreaID INT;
set @InputAreaID = 6;   
    
select 
	dbo.AreaRatingWithCount(@InputAreaID) [Area Rating],
	dbo.AreaRatingWithRatingRangeOutput(@InputAreaID) [Area Rating Range]

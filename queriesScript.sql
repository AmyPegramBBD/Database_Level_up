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

-- Amy
-- usp_Get_Closest_Hospital.sql
EXEC [uspGet_Closest_Services] 6;  

 -- Riselle
 -- AreaRatingUDF.sql 
    
declare @InputAreaIDForOutputRange INT;
-- change this value view different areas
declare @InputAreaID INT;
set @InputAreaID = 6;   
    
select 
	dbo.AreaRatingWithCount(@InputAreaID) [Area Rating],
	dbo.AreaRatingWithRatingRangeOutput(@InputAreaID) [Area Rating Range]

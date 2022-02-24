USE [SCA_DB]
GO

/****** Object:  StoredProcedure [dbo].[uspGetClosestServices]    Script Date: 2022/02/23 15:52:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[uspGet_Closest_Services]
	@Incident_ID [INT]
AS
BEGIN
	SET NOCOUNT ON;
	
DECLARE @Incident_Location_ID [INT];
DECLARE @Nearest_Hospital_ID [INT];
DECLARE @Incident_Location [geography];
DECLARE @Hospital_Location [geography];
DECLARE @ClosestDistance [float];
DECLARE @Loop_Hospital_ID [INT];

SELECT @Incident_Location = [dbo].[vwIncident_Location].[Map_Location] FROM  [dbo].[vwIncident_Location] WHERE  [dbo].[vwIncident_Location].[Incident_ID] = @Incident_ID

DECLARE hospital_loop CURSOR FOR 
	SELECT [dbo].[vwHospital_Location].[Location_ID], [dbo].[vwHospital_Location].[Map_Location] FROM  [dbo].[vwHospital_Location]

OPEN hospital_loop

FETCH NEXT FROM hospital_loop INTO @Loop_Hospital_ID, @Hospital_Location

SET @ClosestDistance = 999999999

WHILE (@@fetch_status = 0)
BEGIN
	IF @ClosestDistance > @Incident_Location.STDistance(@Hospital_Location) 
		BEGIN
			SET @ClosestDistance =  @Incident_Location.STDistance(@Hospital_Location) 
			SET @Nearest_Hospital_ID = @Loop_Hospital_ID
		END
		
	FETCH NEXT FROM hospital_loop INTO @Loop_Hospital_ID, @Hospital_Location
    
END
DEALLOCATE hospital_loop

SELECT [dbo].[vwHospital_Location].[Name], [dbo].[vwHospital_Location].[Phone_Number], [dbo].[vwHospital_Location].[Street_Number], [dbo].[vwHospital_Location].[Street_Name], [dbo].[vwHospital_Location].[Suburb],[dbo].[vwHospital_Location].City,dbo.[vwHospital_Location].[Province], Map_Location.ToString() AS 'GPS Location' FROM [dbo].[vwHospital_Location] WHERE Location_ID = @Nearest_Hospital_ID

END

GO

EXEC [uspGet_Closest_Services] 6;  



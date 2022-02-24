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

SELECT @Incident_Location = [dbo].[vwIncidentLocation.Map_Location] FROM  [dbo].[vwIncidentLocation] WHERE  [dbo].[vwIncidentLocation.Incident_ID] = @Incident_ID

DECLARE hospital_loop CURSOR FOR 
	SELECT [dbo].[vwHospitalLocation].[Location_ID], [dbo].[vwHospitalLocation].[Map_Location] FROM  [dbo].[vwHospitalLocation]

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

SELECT *, Map_Location.ToString() FROM [dbo].[vwHospitalLocation] WHERE Location_ID = @Nearest_Hospital_ID

END

GO



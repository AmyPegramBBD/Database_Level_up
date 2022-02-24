USE SCA_DB
GO

/*
*	Create view for getting links between incident and assaliant
*	Uses [Assailant_Incident] Junction table
*/
CREATE VIEW Incident_Assailant_Descriptions
AS SELECT
		[Incident].[Incident_ID] AS [Incident_ID],
		[Incident].[Incident_Description] AS [Incident_Description],
		[Assailant].[Assailant_Description] AS [Assailant_Description]
FROM 
	[Assailant_Incident]
JOIN [Incident] On [Incident].[Incident_ID] = [Assailant_Incident].[Incident_ID]
JOIN [Assailant] ON [Assailant].[Assailant_ID] = [Assailant_Incident].[Assailant_ID]

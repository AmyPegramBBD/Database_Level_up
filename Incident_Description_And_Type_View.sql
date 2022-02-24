USE SCA_DB
GO

/*
*	Create view for getting links between incident and Types
*	Uses [Incident_Report] Junction table
*/

CREATE VIEW Incident_Description_And_Type
AS
SELECT DISTINCT 
	[Incident].[Incident_ID] AS [ID],
	[Incident].[Incident_Description] AS [Description],
	[Incident_Type].[Incident_Description] AS [Classification]
FROM
	[Incident_Report]
JOIN [Incident] On [Incident].[Incident_ID] = [Incident_Report].[Incident_ID]
JOIN [Incident_Type] ON [Incident_Type].[Incident_Type_ID] = [Incident_Report].[Incident_Type_ID]
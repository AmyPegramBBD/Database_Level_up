USE SCA_DB
GO

/*
*	Create view for getting links between incident and assaliant
*	Uses [Assailant_Incident] Junction table
*/
CREATE VIEW vwIncident_Assailant_Descriptions
AS SELECT
		[Incident].[Incident_ID] AS [Incident_ID],
		[Incident].[Incident_Description] AS [Incident_Description],
		[Assailant].[Assailant_Description] AS [Assailant_Description]
FROM 
	[Assailant_Incident]
JOIN [Incident] On [Incident].[Incident_ID] = [Assailant_Incident].[Incident_ID]
JOIN [Assailant] ON [Assailant].[Assailant_ID] = [Assailant_Incident].[Assailant_ID]
GO
/*
*	Create view for grouping assaliants
*	Concatenating the rows into one row 
*	to describe the assailant linked to 
*	an incident
*/

CREATE VIEW vwConcatenate_Assailant_Descriptions
AS 
SELECT DISTINCT [Incident_ID],
SUBSTRING(
	(	
		SELECT ',' + temp1.[Assailant_Description] AS [text()]
		FROM [SCA_DB].[dbo].[vwIncident_Assailant_Descriptions] temp1
		WHERE temp1.[Incident_ID] = temp2.[Incident_ID]
		ORDER BY temp1.[Incident_ID]
		for xml path('')
	),2,1000
) [Assailiant_Descriptions]

FROM [SCA_DB].[dbo].[vwIncident_Assailant_Descriptions] temp2
GO
/*
*	Create view for getting links between incident and Types
*	Uses [Incident_Report] Junction table
*/

CREATE VIEW vwIncident_Description_And_Type
AS
SELECT DISTINCT 
	[Incident].[Incident_ID] AS [ID],
	[Incident].[Incident_Description] AS [Description],
	[Incident_Type].[Incident_Description] AS [Classification]
FROM
	[Incident_Report]
JOIN [Incident] On [Incident].[Incident_ID] = [Incident_Report].[Incident_ID]
JOIN [Incident_Type] ON [Incident_Type].[Incident_Type_ID] = [Incident_Report].[Incident_Type_ID]
GO
/*
*	Create view for grouping incident types
*	Concatenating the  rows into one row to classify the incident
*/
CREATE VIEW vwConcatenate_Incident_Descriptions
AS
SELECT DISTINCT [ID],
SUBSTRING(
	(	
		SELECT ',' + temp1.[Classification] AS [text()]
		FROM [SCA_DB].[dbo].[vwIncident_Description_And_Type] temp1
		WHERE temp1.[ID] = temp2.[ID]
		ORDER BY temp1.[ID]
		for xml path('')
	),2,1000
) [incident_Descriptions]

FROM [SCA_DB].[dbo].[vwIncident_Description_And_Type] temp2
GO
/*
* Create view for incident description, incident_type and 
* assailant description
*/
CREATE VIEW vwIncident_Report
AS
SELECT
[Incident].[Incident_ID],
[Incident].[Incident_Description] AS [Incident_Description],
[SCA_DB].[dbo].[vwConcatenate_Incident_Descriptions].[incident_Descriptions] AS [Classification],
[SCA_DB].[dbo].[vwConcatenate_Assailant_Descriptions].[Assailiant_Descriptions] AS [Assailiant's Description]

FROM
[SCA_DB].[dbo].[Incident],
[SCA_DB].[dbo].[vwConcatenate_Incident_Descriptions],
[SCA_DB].[dbo].[vwConcatenate_Assailant_Descriptions]
Where
[SCA_DB].[dbo].[Incident].[Incident_ID] = [SCA_DB].[dbo].[vwConcatenate_Incident_Descriptions].[ID]
AND
[SCA_DB].[dbo].[Incident].[Incident_ID] = [SCA_DB].[dbo].[vwConcatenate_Assailant_Descriptions].[Incident_ID]
GO
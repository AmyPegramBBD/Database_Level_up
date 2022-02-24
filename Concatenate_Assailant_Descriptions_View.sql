USE SCA_DB
GO

/*
*	Create view for grouping assaliants
*	Concatenating the rows into one row 
*	to describe the assailant linked to 
*	an incident
*/

CREATE VIEW Concatenate_Assailant_Descriptions
AS 
SELECT DISTINCT [Incident_ID],
SUBSTRING(
	(	
		SELECT ',' + temp1.[Assailant_Description] AS [text()]
		FROM [SCA_DB].[dbo].[Incident_Assailant_Descriptions] temp1
		WHERE temp1.[Incident_ID] = temp2.[Incident_ID]
		ORDER BY temp1.[Incident_ID]
		for xml path('')
	),2,1000
) [Assailiant_Descriptions]

FROM [SCA_DB].[dbo].[Incident_Assailant_Descriptions] temp2

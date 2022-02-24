USE SCA_DB
GO

/*
*	Create view for grouping incident types
*	Concatenating the  rows into one row to classify the incident
*/
CREATE VIEW Concatenate_Incident_Descriptions
AS
SELECT DISTINCT [ID],
SUBSTRING(
	(	
		SELECT ',' + temp1.[Classification] AS [text()]
		FROM [SCA_DB].[dbo].[Incident_Description_And_Type] temp1
		WHERE temp1.[ID] = temp2.[ID]
		ORDER BY temp1.[ID]
		for xml path('')
	),2,1000
) [incident_Descriptions]

FROM [SCA_DB].[dbo].[Incident_Description_And_Type] temp2

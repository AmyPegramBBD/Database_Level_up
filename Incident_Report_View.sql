USE [SCA_DB]
GO


CREATE VIEW Incident_Report_View
AS
SELECT
[Incident].[Incident_ID],
[Incident].[Incident_Description] AS [Incident_Description],
[SCA_DB].[dbo].[Concatenate_Incident_Descriptions].[incident_Descriptions] AS [Classification],
[SCA_DB].[dbo].[Concatenate_Assailant_Descriptions].[Assailiant_Descriptions] AS [Assailiant's Description]

FROM
[SCA_DB].[dbo].[Incident],
[SCA_DB].[dbo].[Concatenate_Incident_Descriptions],
[SCA_DB].[dbo].[Concatenate_Assailant_Descriptions]
Where
[SCA_DB].[dbo].[Incident].[Incident_ID] = [SCA_DB].[dbo].[Concatenate_Incident_Descriptions].[ID]
AND
[SCA_DB].[dbo].[Incident].[Incident_ID] = [SCA_DB].[dbo].[Concatenate_Assailant_Descriptions].[Incident_ID]
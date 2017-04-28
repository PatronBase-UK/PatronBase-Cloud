CREATE TABLE [dbo].[ServerInstance]
(
	[ServerInstanceID] INT NOT NULL IDENTITY, 
    [Hostname] NVARCHAR(50) NOT NULL, 
    [InstanceName] NVARCHAR(50) NULL, 
    [Domain] NVARCHAR(100) NOT NULL, 
    [Port] INT NOT NULL, 
    [FQDN] AS (Hostname + '.' + Domain),
	CONSTRAINT [PK_ServerInstance] PRIMARY KEY ([ServerInstanceID] ASC)
)

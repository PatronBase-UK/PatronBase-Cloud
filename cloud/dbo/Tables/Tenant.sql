CREATE TABLE [dbo].[Tenant]
(
	[TenantID] INT NOT NULL IDENTITY, 
    [Name] [sys].[sysname] NOT NULL, 
    [CustomerID] INT NOT NULL, 
    [EnvironmentID] NCHAR NOT NULL, 
    [ServerInstanceID] INT NOT NULL, 
    [AllowAU] BIT NOT NULL CONSTRAINT [DF_Tenant_AllowAU] DEFAULT 0, 
    [AUStreamID] NCHAR(1) NOT NULL CONSTRAINT [DF_Tenant_AUStreamID] DEFAULT 'S',
	CONSTRAINT [PK_Tenant] PRIMARY KEY CLUSTERED ([TenantID] ASC),
	CONSTRAINT [FK_Tenant_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [Customer]([CustomerID]),
	CONSTRAINT [FK_Tenant_Environment] FOREIGN KEY ([EnvironmentID]) REFERENCES [Environment]([EnvironmentID]),
	CONSTRAINT [FK_Tentant_ServerInstance] FOREIGN KEY ([ServerInstanceID]) REFERENCES [ServerInstance]([ServerInstanceID]),
	CONSTRAINT [FK_Tenant_AUStream] FOREIGN KEY ([AUStreamID]) REFERENCES [AUStream]([AUStreamID]), 
    CONSTRAINT [UQ_Tenant_Name_ServerInstance] UNIQUE (Name, ServerInstanceID)
)

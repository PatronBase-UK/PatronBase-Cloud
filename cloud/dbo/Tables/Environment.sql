CREATE TABLE [dbo].[Environment]
(
	[EnvironmentID] NCHAR(1) NOT NULL, 
    [Name] NVARCHAR(50) NOT NULL,
	CONSTRAINT [PK_Environment] PRIMARY KEY CLUSTERED ([EnvironmentID] ASC)
)

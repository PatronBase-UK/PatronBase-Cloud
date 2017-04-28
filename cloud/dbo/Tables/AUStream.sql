﻿CREATE TABLE [dbo].[AUStream]
(
	[AUStreamID] NCHAR NOT NULL, 
    [Name] NVARCHAR(50) NOT NULL, 
    [URL] NCHAR(10) NULL, 
    [Username] NCHAR(10) NULL, 
    [Password] NCHAR(10) NULL,
	CONSTRAINT [PK_AUStream] PRIMARY KEY CLUSTERED ([AUStreamID] ASC)
)

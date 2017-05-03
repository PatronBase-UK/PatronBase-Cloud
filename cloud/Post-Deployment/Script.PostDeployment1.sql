/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
IF NOT EXISTS (SELECT * FROM AUStream)
BEGIN
	INSERT INTO AUStream (AUStreamID, Name, URL, Username, Password) VALUES ('S','Stable','http://autoupdate.patronbase.com/AutoUpdate/?module=PatronBase ®&version=', 'patronbase','siobhan')
	INSERT INTO AUStream (AUStreamID, Name, URL, Username, Password) VALUES ('B','Beta','http://autoupdate.patronbase.com/AutoUpdate/BetaUpdates?module=PatronBase ®&version=', 'patronbase','siobhan')
END

SET IDENTITY_INSERT Customer ON
IF NOT EXISTS (SELECT * FROM Customer)
INSERT INTO Customer (CustomerId,Name) VALUES (1, 'PatronBase UK')
SET IDENTITY_INSERT Customer OFF
GO

IF NOT EXISTS (SELECT * FROM Environment)
BEGIN
	INSERT INTO Environment (EnvironmentID, Name) VALUES ('D','Development')
	INSERT INTO Environment (EnvironmentID, Name) VALUES ('S','Staging')
	INSERT INTO Environment (EnvironmentID, Name) VALUES ('P','Production')
END

IF NOT EXISTS (SELECT * FROM ServerInstance)
BEGIN
	INSERT INTO ServerInstance (Hostname, InstanceName, Domain, Port) VALUES ('pbuksqlmain01', NULL, 'patronbase.co.uk', 3433)
	INSERT INTO ServerInstance (Hostname, InstanceName, Domain, Port) VALUES ('pbuksqlmain01', 'sql2016test', 'patronbase.co.uk', 3434)
END
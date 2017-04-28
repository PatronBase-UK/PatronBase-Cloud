CREATE PROCEDURE [dbo].[pbWho]
	@dbName sysname = null
AS
BEGIN
DECLARE @Table TABLE(
        SPID INT,
        Status VARCHAR(MAX),
        LOGIN VARCHAR(MAX),
        HostName VARCHAR(MAX),
        BlkBy VARCHAR(MAX),
        DBName VARCHAR(MAX),
        Command VARCHAR(MAX),
        CPUTime INT,
        DiskIO INT,
        LastBatch VARCHAR(MAX),
        ProgramName VARCHAR(MAX),
        SPID_1 INT,
        REQUESTID INT
)

INSERT INTO @Table EXEC sp_who2

SELECT  t.SPID, t.Status, t.LOGIN, t.DBName, t.ProgramName, t.HostName, conn.client_net_address
FROM    @Table t
JOIN sys.dm_exec_connections conn on conn.session_id = t.SPID
WHERE ISNULL(t.DBName,'') = ISNULL(@dbName,ISNULL(t.DBName,''))
END
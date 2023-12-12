CREATE DATABASE YourDatabaseName_snapshot
ON
(
    NAME = YourDatabaseName,
    FILENAME = 'C:\Backup\YourDatabaseName_snapshot.ss'
)
AS SNAPSHOT OF YourDatabaseName;

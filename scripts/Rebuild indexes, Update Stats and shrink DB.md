# This will update Indexes, Stats and shrink DB for all Tables and Databases

```SQL
Set quoted_identifier off
use master
go


DECLARE @fillfactor varchar(2)
DECLARE @tablename varchar(30)
DECLARE @tablename_header varchar(75)
DECLARE @dataname varchar(30)
DECLARE @dataname_header varchar(75)
DECLARE datanames_cursor CURSOR FOR SELECT name FROM sysdatabases
    
/* Variable Initialization */select @fillfactor = "0"-- Set Fill factor here
-- Note "0" will use original fillfactor.
/* End Variable Initialization */OPEN datanames_cursor

  FETCH NEXT FROM datanames_cursor INTO @dataname

  WHILE (@@fetch_status <> -1)
    BEGIN
      IF (@@fetch_status = -2)
        BEGIN
FETCH NEXT FROM datanames_cursor INTO @dataname
          CONTINUE
        END
SELECT @dataname_header = "Database " + RTRIM(UPPER(@dataname))
      PRINT " "
PRINT @dataname_header
      PRINT " "
EXEC ("USE " + @dataname + " DECLARE tnames_cursor CURSOR FOR SELECT name from sysobjects where type = 'U'")
Select @dataname_header = RTRIM(UPPER(@dataname))
Exec ("Use " + @dataname) 
OPEN tnames_cursor
FETCH NEXT FROM tnames_cursor INTO @tablename
WHILE (@@fetch_status <> -1)
        BEGIN
          IF (@@fetch_status = -2)            
BEGIN
              FETCH NEXT FROM tnames_cursor INTO @tablename
              CONTINUE
            END
    SELECT @tablename_header = "  Updating " + RTRIM(UPPER(@tablename))
PRINT ""
          PRINT @tablename_header
EXEC ("USE " + @dataname + " DBCC DBREINDEX (" + @tablename + "," + "''" + "," + @fillfactor + ")")
EXEC ("USE " + @dataname + " UPDATE STATISTICS " + @tablename)
FETCH NEXT FROM tnames_cursor INTO @tablename
        END
DEALLOCATE tnames_cursor
EXEC("DBCC SHRINKDATABASE (" + @dataname + ", TRUNCATEONLY)")
      FETCH NEXT FROM datanames_cursor INTO @dataname
      END



DEALLOCATE datanames_cursor
PRINT ""
PRINT " "
PRINT "Indexing and shrinkage complete for All User Databases"
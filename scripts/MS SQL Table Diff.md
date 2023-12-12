# Table Diff replication between MS SQL database tables.

```SQL

SET QUOTED_IDENTIFIER ON 

DECLARE @TableNames as table (
    id int identity(1,1),
    tableName varchar(100))

DECLARE @sTableDiff nvarchar(1000)
DECLARE @sTableImport nvarchar(1000)
DECLARE @cmd nvarchar(1000)
DECLARE @tableName varchar(100)
DECLARE @counter int
DECLARE @maxCount int

INSERT INTo @TableNames 
SELECT name 
FROM [MDACLOUD].[trueprop].sys.objects WHERE type = 'U' 

SET @counter = 1

SELECT @maxCount = COUNT(name) 
FROM [MDACLOUD].[trueprop].sys.objects WHERE type = 'U' 

PRINT('STARTING LOOP')
PRINT('Counter: ' + str(@counter))
PRINT('Maxcount ' + str(@maxcount))

WHILE @counter <= @maxCount
	
    Begin
        SELECT @tableName = tableName 
        FROM @TableNames 
        WHERE id = @counter
		
		PRINT('STARTING NEW TABLE CHECKING: ' +  @tablename)

		SET @cmd = 'del C:\temp\' + @tablename + '.sql'
		BEGIN TRY
			EXEC XP_CMDSHELL @cmd
		END TRY
		BEGIN CATCH
			PRINT('DID NOT FIND FILE TO DELETE')
			
		END CATCH


        SET @sTableDiff= ' "C:\Program Files\Microsoft SQL Server\120\COM\tablediff" -sourceserver HOSTNAME,65001 ' + 
            ' -sourceuser USERNAME -sourcepassword PASSWORD -sourcedatabase DATABSE -sourcetable ' + @tableName +  
            ' -destinationserver HOSTNAME -destinationuser USERNAME -destinationpassword PASSWORD -destinationdatabase ' + 
            'Trueprop -destinationtable ' + @tableName + '  -f C:\temp\' + @tableName + '.sql'      


        EXEC XP_CMDSHELL @sTableDiff


		SET @sTableImport= 'sqlcmd -S HOSTNAME -d Trueprop -U USERNAME -P PASSWORD -i c:\temp\' + @tableName + '.sql -b -f 65001'
		BEGIN TRY
			EXEC XP_CMDSHELL @sTableImport
		END TRY
		BEGIN CATCH
			PRINT('NOTHING TO IMPORT')
		END CATCH

		SET @cmd = 'del C:\temp\' + @tablename + '.sql'
		BEGIN TRY
			EXEC XP_CMDSHELL @cmd
		END TRY
		BEGIN CATCH
			PRINT('DID NOT FIND FILE TO DELETE')
		END CATCH



		PRINT('SETTING COUNTER')
        Set @counter = @counter + 1
    End
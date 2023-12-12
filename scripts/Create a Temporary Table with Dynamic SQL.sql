DECLARE @DynamicSQL NVARCHAR(MAX);
SET @DynamicSQL = 'SELECT YourColumns INTO ##YourTempTable FROM YourTable WHERE YourCondition;';
EXEC sp_executesql @DynamicSQL;

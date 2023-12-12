DECLARE @DynamicPivotColumns NVARCHAR(MAX), @DynamicSQL NVARCHAR(MAX);

SELECT @DynamicPivotColumns = STRING_AGG(DISTINCT '[' + YourColumn + ']', ', ') WITHIN GROUP (ORDER BY YourColumn)
FROM YourTable;

SET @DynamicSQL = 'SELECT YourID, ' + @DynamicPivotColumns +
                 ' FROM YourTable PIVOT (SUM(YourValue) FOR YourColumn IN (' + @DynamicPivotColumns + ')) AS PivotTable;';

EXEC sp_executesql @DynamicSQL;

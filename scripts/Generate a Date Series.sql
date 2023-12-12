;WITH DateSeries AS (
    SELECT TOP (365) 
        DATEADD(DAY, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1, '2022-01-01') AS [Date]
    FROM 
        master.dbo.spt_values
)
SELECT 
    [Date]
FROM 
    DateSeries;

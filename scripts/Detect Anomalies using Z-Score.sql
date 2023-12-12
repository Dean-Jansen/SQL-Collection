WITH Stats AS (
    SELECT
        YourColumn,
        AVG(YourColumn) OVER () AS AvgValue,
        STDEV(YourColumn) OVER () AS StdDevValue
    FROM
        YourTable
)
SELECT
    t.*,
    CASE
        WHEN ABS(t.YourColumn - s.AvgValue) / s.StdDevValue > 2 THEN 'Anomaly'
        ELSE 'Normal'
    END AS AnomalyStatus
FROM
    YourTable t
INNER JOIN
    Stats s ON t.YourColumn = s.YourColumn;

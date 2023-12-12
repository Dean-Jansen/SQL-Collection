DECLARE @alpha FLOAT = 0.2; -- Smoothing factor (adjust as needed)

SELECT
    YourColumn,
    SUM(YourColumn * POWER(1 - @alpha, ROW_NUMBER() OVER (ORDER BY YourOrderColumn) - 1)) /
    SUM(POWER(1 - @alpha, ROW_NUMBER() OVER (ORDER BY YourOrderColumn) - 1)) AS EMA
FROM
    YourTable
GROUP BY
    YourColumn;

SELECT
    YourTimestamp,
    YourValue,
    LAG(YourValue) OVER (ORDER BY YourTimestamp) AS PreviousValue,
    LEAD(YourValue) OVER (ORDER BY YourTimestamp) AS NextValue,
    CASE
        WHEN YourValue > LAG(YourValue) OVER (ORDER BY YourTimestamp) AND YourValue > LEAD(YourValue) OVER (ORDER BY YourTimestamp) THEN 'Increasing'
        WHEN YourValue < LAG(YourValue) OVER (ORDER BY YourTimestamp) AND YourValue < LEAD(YourValue) OVER (ORDER BY YourTimestamp) THEN 'Decreasing'
        ELSE 'Stable'
    END AS Trend
FROM
    YourTable;

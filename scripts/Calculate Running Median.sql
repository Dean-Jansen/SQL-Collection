SELECT
    YourColumn,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY YourColumn) OVER () AS RunningMedian
FROM
    YourTable;

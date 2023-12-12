SELECT
    t.name AS TableName
FROM
    sys.tables t
LEFT JOIN
    sys.dm_db_partition_stats ps ON t.object_id = ps.object_id
WHERE
    ps.row_count = 0;

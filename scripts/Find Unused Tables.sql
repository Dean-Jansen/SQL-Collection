SELECT
    t.name AS TableName
FROM
    sys.tables t
LEFT JOIN
    sys.dm_db_index_usage_stats ius
ON
    t.object_id = ius.object_id
WHERE
    ius.object_id IS NULL;

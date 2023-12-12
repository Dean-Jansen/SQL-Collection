SELECT
    o.name AS ObjectName,
    i.name AS IndexName,
    i.index_id AS IndexID
FROM
    sys.indexes i
INNER JOIN
    sys.objects o ON i.object_id = o.object_id
WHERE
    OBJECTPROPERTY(o.object_id, 'IsUserTable') = 1
    AND i.index_id NOT IN (
        SELECT
            s.index_id
        FROM
            sys.dm_db_index_usage_stats s
        WHERE
            s.object_id = i.object_id
            AND i.index_id = s.index_id
            AND database_id = DB_ID('YourDatabaseName')
    )
ORDER BY
    o.name, i.name, i.index_id;

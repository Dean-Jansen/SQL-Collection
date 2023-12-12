```SQL
SELECT DB_NAME(database_id) AS name_of_base, CAST(SUM(size) * 8. / 1024 AS DECIMAL(8,2)) AS total_size_b
FROM sys.master_files
GROUP BY database_id
```
SELECT
    s.text AS [Query],
    r.start_time,
    r.total_elapsed_time
FROM
    sys.dm_exec_requests r
CROSS APPLY
    sys.dm_exec_sql_text(r.sql_handle) s
WHERE
    r.total_elapsed_time > 10000; -- Specify your threshold in milliseconds

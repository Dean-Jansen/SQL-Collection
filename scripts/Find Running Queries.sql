SELECT
    r.session_id,
    r.status,
    r.command,
    r.blocking_session_id,
    t.text AS [Query Text]
FROM
    sys.dm_exec_requests r
CROSS APPLY
    sys.dm_exec_sql_text(r.sql_handle) t
WHERE
    r.status = 'running';

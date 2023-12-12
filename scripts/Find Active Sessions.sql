SELECT
    session_id,
    login_time,
    host_name,
    program_name
FROM
    sys.dm_exec_sessions
WHERE
    status = 'running';

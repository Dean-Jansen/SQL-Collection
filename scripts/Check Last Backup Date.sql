SELECT
    database_name,
    MAX(backup_finish_date) AS backup_finish_date
FROM
    msdb.dbo.backupset
WHERE
    type = 'D'
	GROUP BY database_name


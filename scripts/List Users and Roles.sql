SELECT
    u.name AS UserName,
    r.name AS RoleName
FROM
    sys.database_role_members rm
JOIN
    sys.database_principals r ON rm.role_principal_id = r.principal_id
JOIN
    sys.database_principals u ON rm.member_principal_id = u.principal_id;

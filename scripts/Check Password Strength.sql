SELECT
    YourPassword,
    CASE
        WHEN LEN(YourPassword) >= 8 AND
             SUM(CASE WHEN ASCII(SUBSTRING(YourPassword, n, 1)) BETWEEN 48 AND 57 THEN 1 ELSE 0 END) > 0 AND
             SUM(CASE WHEN ASCII(SUBSTRING(YourPassword, n, 1)) BETWEEN 65 AND 90 THEN 1 ELSE 0 END) > 0 AND
             SUM(CASE WHEN ASCII(SUBSTRING(YourPassword, n, 1)) BETWEEN 97 AND 122 THEN 1 ELSE 0 END) > 0 THEN 'Strong'
        ELSE 'Weak'
    END AS PasswordStrength
FROM
    YourTable
CROSS APPLY
    (SELECT TOP (LEN(YourPassword)) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n FROM master.dbo.spt_values) Numbers;

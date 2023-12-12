SELECT
    t1.StartDate,
    t1.EndDate,
    t2.StartDate AS OverlappingStartDate,
    t2.EndDate AS OverlappingEndDate
FROM
    YourTable t1
INNER JOIN
    YourTable t2 ON t1.StartDate < t2.EndDate AND t1.EndDate > t2.StartDate AND t1.ID <> t2.ID;

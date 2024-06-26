SELECT 
    Name
FROM
    Students s
    JOIN Friends f ON f.ID=s.ID
    JOIN Packages p1 ON p1.ID = s.ID
    JOIN Packages p2 ON p2.ID = f.Friend_ID
WHERE
    p2.Salary > p1.Salary
ORDER BY
    p2.Salary

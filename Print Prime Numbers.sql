WITH Numbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1
    FROM Numbers 
    WHERE num < 1000
), Prime AS (
    SELECT num
    FROM Numbers n1
    WHERE NOT EXISTS (SELECT 1 FROM Numbers n2 WHERE n1.num > n2.num AND n1.num%n2.num = 0)
)

SELECT STRING_AGG(num, '&')  FROM Prime

OPTION (MAXRECURSION 5000)

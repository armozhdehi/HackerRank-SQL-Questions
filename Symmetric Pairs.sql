WITH CountXY AS (
    SELECT 
        X, 
        Y,
        COUNT(1) cnt
    FROM 
        Functions
    GROUP BY 
        X, Y
)

SELECT DISTINCT
    tbl1.X,
    tbl1.Y
FROM
    Functions tbl1
    JOIN CountXY tbl2 ON tbl1.X=tbl2.Y AND tbl1.Y=tbl2.X
WHERE
    tbl1.X < tbl1.Y
    OR
    (tbl1.X = tbl1.Y AND cnt > 1)
ORDER BY X

WITH End_Dates AS (
    SELECT
        p1.End_Date,
        ROW_NUMBER() OVER(ORDER BY p1.End_Date) rank
    FROM
        Projects p1
        LEFT JOIN Projects p2 ON p1.End_Date = p2.Start_Date
    WHERE
        p2.Start_Date IS NULL
), Start_Dates AS (
    SELECT
        p2.Start_Date,
        ROW_NUMBER() OVER(ORDER BY p2.Start_Date) rank
    FROM
        Projects p1
        RIGHT JOIN Projects p2 ON p1.End_Date = p2.Start_Date
    WHERE
        p1.Start_Date IS NULL
)

SELECT 
    Start_Date,
    End_Date
FROM
    Start_Dates
    JOIN End_Dates ON End_Dates.rank = Start_Dates.rank
ORDER BY 
    DATEDIFF(day, End_Date, Start_Date) DESC, Start_Date

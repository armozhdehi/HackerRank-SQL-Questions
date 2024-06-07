WITH RankedSTATION AS (
    SELECT
        LAT_N,
        Rank() OVER(ORDER BY LAT_N) AS rank
    FROM
        STATION
), NumRow AS (
    SELECT 
        MAX(rank) AS max
    FROM
        RankedSTATION
)

SELECT 
    CAST(ROUND(LAT_N, 4) AS DECIMAL(38, 4))
FROM
    RankedSTATION, 
    NumRow
WHERE
    (max % 2 = 1 AND rank = max / 2 + 1)
    OR (max % 2 = 0 AND (rank = max / 2 OR rank = max / 2 + 1));

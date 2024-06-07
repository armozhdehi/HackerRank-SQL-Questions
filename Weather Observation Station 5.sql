WITH RankedSize AS(SELECT
    CITY,
    RANK() OVER(PARTITION BY LEN(CITY) ORDER BY CITY) rank,
    LEN(CITY) length
FROM
    STATION
), MaxMin AS (
    SELECT
        MAX(length) max,
        MIN(length) min
    FROM
        RankedSize
)

SELECT 
    CITY, 
    length
FROM
    RankedSize rs
WHERE
    rank = 1 AND ((rs.length = (SELECT max FROM MaxMin)) OR (rs.length = (SELECT min FROM MaxMin)))

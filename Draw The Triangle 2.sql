WITH RECURSIVE Gen AS (
    SELECT
        1 AS num
    UNION ALL
    SELECT
        num + 1
    FROM
        Gen
    WHERE
        num < 20
)

SELECT REPEAT('* ', num) from Gen

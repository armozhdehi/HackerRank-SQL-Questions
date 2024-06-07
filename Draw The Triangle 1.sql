WITH RECURSIVE Gen AS (
    SELECT
        20 AS num
    UNION ALL
    SELECT
        num - 1
    FROM
        Gen
    WHERE
        num > 1
)

SELECT REPEAT('* ', num) from Gen

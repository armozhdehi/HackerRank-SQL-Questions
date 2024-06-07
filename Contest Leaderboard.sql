WITH MaxScore AS (
        SELECT
                h.hacker_id,
                h.name,
                MAX(score) AS max_score
        FROM
                Hackers h
                JOIN Submissions s ON s.hacker_id = h.hacker_id
        GROUP BY
                h.hacker_id,
                h.name,
                s.challenge_id
)

SELECT
        hacker_id,
        name,
        SUM(max_score) total_score
FROM
        MaxScore
GROUP BY
        hacker_id,
        name
HAVING
        SUM(max_score) > 0
ORDER BY
        total_score DESC,
        hacker_id

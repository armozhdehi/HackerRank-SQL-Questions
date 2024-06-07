WITH ChallengesCount AS (
    SELECT
        h.hacker_id,
        h.name,
        COUNT(1) AS challenges
    FROM
        Hackers h
        JOIN Challenges c ON h.hacker_id = c.hacker_id
    GROUP BY
        h.hacker_id,
        h.name
), MaxChallengesCount AS (
    SELECT
        MAX(challenges) max_challenges_count
    FROM
        ChallengesCount
)

SELECT
    hacker_id,
    name,
    challenges
FROM
    ChallengesCount cc1
WHERE
    challenges = (SELECT * FROM MaxChallengesCount) 
    OR
    (SELECT COUNT(1) FROM ChallengesCount cc2 WHERE cc1.challenges = cc2.challenges GROUP BY cc2.challenges) = 1
ORDER BY
    challenges DESC,
    hacker_id

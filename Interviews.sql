WITH ChallengeView AS (
    SELECT
        college_id,
        SUM(total_views) AS total_views,
        SUM(total_unique_views) AS total_unique_views
    FROM
        Challenges ch
        JOIN View_Stats vs ON ch.challenge_id = vs.challenge_id
    GROUP BY
        ch.college_id
), ChallengeSub AS (
    SELECT
        college_id,
        SUM(total_submissions) AS total_submissions,
        SUM(total_accepted_submissions) AS total_accepted_submissions
    FROM
        Challenges ch
        JOIN Submission_Stats ss ON ch.challenge_id = ss.challenge_id
    GROUP BY
        ch.college_id
)

SELECT
    col.contest_id,
    con.hacker_id,
    con.name,
    SUM(total_submissions),
    SUM(total_accepted_submissions),
    SUM(total_views),
    SUM(total_unique_views)
FROM
    Colleges col
    LEFT JOIN Contests con ON con.contest_id = col.contest_id
    JOIN ChallengeView cv ON cv.college_id = col.college_id
    JOIN ChallengeSub cs ON cs.college_id = col.college_id
GROUP BY
    col.contest_id,
    con.hacker_id,
    con.name
HAVING
    SUM(total_submissions)  + SUM(total_accepted_submissions) + SUM(total_views) + SUM(total_unique_views) > 0
ORDER BY
    col.contest_id

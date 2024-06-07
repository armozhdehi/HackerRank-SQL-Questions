WITH RankHackers AS (
    SELECT
        s.submission_date,
        s.hacker_id,
        h.name,
        COUNT(1) AS submissions_per_day,
        RANK() OVER(PARTITION BY submission_date ORDER BY COUNT(1) DESC, s.hacker_id ASC) AS ranking
    FROM
        Hackers h
        JOIN Submissions s ON s.hacker_id = h.hacker_id
    GROUP BY
        s.submission_date,
        s.hacker_id,
        h.name
), DailyRank AS (
        SELECT
            s.submission_date,
            s.hacker_id,
            DENSE_RANK() OVER(ORDER BY s.submission_date) AS day_rank,
            (SELECT 
                    COUNT(DISTINCT s2.submission_date) 
                FROM 
                    Submissions s2 
                WHERE 
                    s.hacker_id = s2.hacker_id AND s.submission_date >= s2.submission_date 
                GROUP BY 
                    s2.hacker_id) AS to_date_rank
        FROM
            Hackers h
            JOIN Submissions s ON s.hacker_id = h.hacker_id
)

SELECT 
    rh.submission_date,
    (SELECT 
            COUNT(DISTINCT dr.hacker_id) 
        FROM 
            DailyRank dr 
        WHERE 
            rh.submission_date=dr.submission_date AND to_date_rank=day_rank),
    rh.hacker_id,
    rh.name
FROM
        RankHackers rh
WHERE
        rh.ranking = 1
ORDER BY
        rh.submission_date

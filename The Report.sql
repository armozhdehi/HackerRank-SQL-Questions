SELECT
    (CASE WHEN Grade >= 8 THEN Name
        ELSE NULL END),
    Grade,
    Marks
FROM
    Students s
    JOIN Grades g ON s.Marks BETWEEN Min_Mark AND Max_Mark
ORDER BY
    Grade DESC,
    Name,
    Marks ASC

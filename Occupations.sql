WITH RankedOccupations AS(
    SELECT 
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) as ranking, 
        Name, 
        Occupation 
    FROM 
        occupations)
                
SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,       
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,        
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM
    RankedOccupations
GROUP BY
    ranking

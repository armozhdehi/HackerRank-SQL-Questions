SELECT
        co.Continent,
        ROUND(AVG(ci.Population), 0)
FROM
        CITY ci
        JOIN COUNTRY co ON ci.CountryCode = co.Code
GROUP BY
        co.Continent

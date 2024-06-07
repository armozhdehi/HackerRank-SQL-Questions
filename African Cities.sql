SELECT 
        ci.Name
FROM
        CITY ci
        JOIN COUNTRY co ON ci.CountryCode = co.Code
WHERE
        CONTINENT = 'Africa'

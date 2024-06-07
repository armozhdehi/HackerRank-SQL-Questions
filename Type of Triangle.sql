SELECT
    (CASE WHEN A = B AND A = C THEN 'Equilateral'
        WHEN A + B <= C OR A + C <= B OR C + B <= A THEN 'Not A Triangle'
        WHEN A = B OR A = C OR B = C THEN 'Isosceles'
        ELSE 'Scalene' END)     
FROM
    TRIANGLES

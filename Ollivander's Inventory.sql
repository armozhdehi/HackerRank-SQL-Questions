WITH AggWands AS (
    SELECT
        id,
        coins_needed,
        power,
        age
    FROM
        Wands w
        JOIN Wands_Property wp ON w.code = wp.code
    WHERE
        is_evil = 0
)

SELECT
    aw1.id,
    aw1.age,
    aw1.coins_needed,
    aw1.power
FROM
    AggWands aw1
WHERE
    coins_needed = (SELECT 
                        MIN(coins_needed) 
                    FROM 
                        AggWands aw2 
                    WHERE 
                        aw1.age  = aw2.age AND aw1.power  = aw2.power)
ORDER BY
    power DESC,
    age DESC

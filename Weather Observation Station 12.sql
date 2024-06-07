CREATE TABLE Vowels (
    Vowel CHAR(1)
);

INSERT INTO 
    Vowels (Vowel) 
VALUES 
    ('A'), ('E'), ('I'), ('O'), ('U');

SELECT DISTINCT
    CITY
FROM
    STATION
WHERE
    LEFT(CITY, 1) NOT IN (SELECT Vowel FROM Vowels) 
    AND
    RIGHT(CITY, 1) NOT IN (SELECT Vowel FROM Vowels) ;

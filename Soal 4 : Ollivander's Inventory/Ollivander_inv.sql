SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

WITH data_wand AS (
    SELECT
        w.id,
        wp.age,
        w.power,
        w.coins_needed,
        min(w.coins_needed) OVER (PARTITION BY wp.age, w.power) AS coins_min
    FROM Wands w 
    JOIN Wands_Property wp 
        ON w.code = wp.code 
    WHERE wp.is_evil = 0
)


SELECT
    id,
    age,
    coins_needed,
    power
FROM data_wand
WHERE coins_needed = coins_min
ORDER BY
    power DESC,
    age DESC;
    
go

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
WITH max_per_challenge as (
    SELECT
        hacker_id,
        challenge_id,
        MAX(score) AS max_score
    FROM Submissions
    GROUP BY
        hacker_id,
        challenge_id
        
),

hacker_names AS (
    SELECT 
        mx.hacker_id,
        h.name,
        mx.max_score
    FROM max_per_challenge mx 
    JOIN Hackers h 
        ON mx.hacker_id = h.hacker_id
        
)


SELECT
    hacker_id,
    name,
    SUM(max_score) AS total_score
    
FROM hacker_names
GROUP BY 
    hacker_id,
    name
HAVING SUM(max_score) > 0
ORDER BY
    total_score DESC,
    hacker_id ASC;





go

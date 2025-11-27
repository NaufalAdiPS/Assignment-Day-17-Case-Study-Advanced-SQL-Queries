
SET NOCOUNT ON;
/*
Enter your query here.
*/


WITH challenge_max AS (
    SELECT
        c.challenge_id,
        d.score AS max_score
    FROM Challenges c
    JOIN Difficulty d
        ON c.difficulty_level = d.difficulty_level
),

full_score AS (
    SELECT 
        s.hacker_id,
        COUNT(*) AS count_full
    FROM Submissions s 
    JOIN challenge_max cm 
        ON s.challenge_id = cm.challenge_id
        AND s.score = cm.max_score
    GROUP BY s.hacker_id
    HAVING COUNT (*) > 1
),

final AS (
    SELECT
        fs.hacker_id,
        h.name,
        fs.count_full
    FROM full_score fs
    JOIN Hackers h 
        ON fs.hacker_id = h.hacker_id
)

SELECT 
    hacker_id,
    name 
FROM final
ORDER BY 
    count_full DESC,
    hacker_id ASC;




/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

go

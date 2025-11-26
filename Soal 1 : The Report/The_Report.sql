/*
Enter your query here.
*/

WITH mapped AS (
    SELECT
        s.id,
        s.name,
        s.marks,
        g.grade
    FROM Students s
    JOIN Grades g
        ON s.marks BETWEEN g.min_mark AND g.max_mark
)
SELECT
    CASE
        WHEN grade < 8 THEN 'NULL'
        ELSE name
    END AS Name,
    grade AS Grade,
    marks AS Mark
FROM mapped
ORDER BY
    grade DESC,
    CASE WHEN grade >= 8 THEN name ELSE NULL END ASC,
    CASE WHEN grade < 8 THEN marks ELSE NULL END ASC;




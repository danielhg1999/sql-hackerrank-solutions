SELECT
    CASE
        WHEN g.grade >= 8 THEN s.name
        ELSE NULL
    END AS name,
    g.grade,
    s.marks
FROM students s
JOIN grades g
    ON s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY
    g.grade DESC,
    CASE
        WHEN g.grade >= 8 THEN s.name
        ELSE NULL
    END ASC,
    CASE
        WHEN g.grade < 8 THEN s.marks
        ELSE NULL
    END ASC;
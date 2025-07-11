WITH sub AS 
    (SELECT h.hacker_id AS id, h.name AS name, COUNT(*) AS num_c,
    COUNT(*) OVER(PARTITION BY COUNT(*)) AS count_row
    FROM Hackers h
    JOIN Challenges c ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
    ORDER BY num_c DESC, h.hacker_id ASC)
SELECT id, name, num_c
FROM sub
WHERE num_c = (SELECT MAX(num_c) FROM sub) 
    OR count_row = 1;
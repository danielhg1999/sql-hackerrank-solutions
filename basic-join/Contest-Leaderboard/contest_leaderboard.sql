WITH sub AS 
    (SELECT s.hacker_id AS id_h, h.name AS name_h, s.challenge_id AS id_c, 
    MAX(s.score) AS max_scores
    FROM Hackers h
    JOIN Submissions s ON h.hacker_id = s.hacker_id
    GROUP BY s.hacker_id, h.name, s.challenge_id)
SELECT id_h, name_h, SUM(max_scores) AS total_score
FROM sub
GROUP BY id_h, name_h
HAVING SUM(max_scores) > 0
ORDER BY total_score DESC, id_h ASC;
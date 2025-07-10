SELECT h.hacker_id, h.name
FROM HACKERS h
JOIN SUBMISSIONS s ON h.hacker_id = s.hacker_id
JOIN CHALLENGES c ON s.challenge_id = c.challenge_id
JOIN DIFFICULTY d ON c.difficulty_level = d.difficulty_level
WHERE d.score = s.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC, h.hacker_id ASC;
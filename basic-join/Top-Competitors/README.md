## Problem
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard.

## Difficulty Level
Medium

## Output
Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. 
Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

## Tables
1) Hackers: hacker_id, name
2) Difficulty: difficult_level, score
3) Challenges: challenge_id, hacker_id, difficulty_level
4) Submissions: submission_id, hacker_id, challenge_id, score 

## How query works:
Joins the necessary tables (HACKERS, SUBMISSIONS, CHALLENGES, DIFFICULTY) to bring all required data into the same context.

Filters only the submissions where the submission score exactly matches the challenge's expected score.

Groups the results by each hacker.

Uses HAVING COUNT(*) > 1 to include only those hackers who have successfully solved more than one such challenge.

Orders the results first by the number of successful full-score submissions, then by hacker ID.
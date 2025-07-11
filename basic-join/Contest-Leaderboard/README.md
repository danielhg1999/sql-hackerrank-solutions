## Problem
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!
The total score of a hacker is the sum of their maximum scores for all of the challenges.

## Difficulty Level
Medium

## Output
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id.
Exclude all hackers with a total score of  from your result.

## Tables
1) Hackers: hacker_id, name
4) Submissions: submission_id, hacker_id, challenge_id, score 

## How query works:
Step 1: CTE (sub)

The WITH sub AS (...) block:

Joins Hackers with Submissions
For each hacker_id and challenge_id, selects the maximum score they achieved (MAX(s.score))
This ensures that only the best attempt per challenge is counted per hacker.

Each row represents:

A hacker (id_h, name_h)
A challenge (id_c)
Their highest score on that challenge (max_scores)

Step 2: Final SELECT

The outer query:

Groups by hacker (id_h, name_h)
Sums all their best scores across challenges (SUM(max_scores))
Filters out hackers with a total score of 0 (HAVING SUM(max_scores) > 0)

Orders the result:

By total_score descending
By hacker_id ascending (in case of tie)
## Problem
Julia asked her students to create some coding challenges.

## Difficulty Level
Medium

## Output
Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

## Tables
1) Hackers: hacker_id, name
2) Challenges: challenge_id, hacker_id

## How query works:
This query finds and displays:

The hacker(s) with the most challenges created.
Any hacker(s) who created a unique number of challenges (i.e., only one person has that exact count).

Builds a temporary result with:

hacker_id, name
num_c: total number of challenges each hacker created (COUNT(*))
count_row: number of hackers who have created that same amount of challenges (using the window function)

Final SELECT
Filters and selects:

Hackers with the maximum number of challenges (num_c = MAX(num_c)), or
Hackers who created a number of challenges that no one else did (count_row = 1)

So, for example:

If one hacker made 10 challenges (and nobody else did), they appear.
If multiple hackers tied at 10, all are shown (due to MAX(num_c)).
If one hacker made 7 challenges, and no one else made exactly 7, they also appear.
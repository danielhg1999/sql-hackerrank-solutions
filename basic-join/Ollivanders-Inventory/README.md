## Problem
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil (If the value of is_evil is 0, it means that the wand is not evil) wand of high power and age.

## Difficulty Level
Medium

## Output
Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. 
If more than one wand has same power, sort the result in order of descending age.

## Tables
1) Wands: id, code, coins_needed, power
2) Wands_Property: code, age, is_evil

## How query works:
This query selects the most powerful non-evil wand (lowest cost) for each combination of age and power from the Wands and Wands_Property tables.

It ensures that:
Only non-evil wands are considered.
Among multiple entries with the same age and power, only the wand with the lowest coins_needed is selected.

CTE (Common Table Expression) - sub_table 
This temporary table is used to:

Join Wands (w) with Wands_Property (wp) using the code.
Filter out all evil wands (is_evil = 0).
Use the RANK() window function to assign a rank to each wand within the same group of age and power, ordered by coins_needed (lowest first).

RANK() OVER (PARTITION BY wp.age, w.power ORDER BY w.coins_needed):
Gives rank 1 to the wand with the lowest coins_needed in that age-power group.

Final SELECT
The outer query selects only those wands with rank_power = 1, meaning:

They are the cheapest wand (least coins needed)
For a specific combination of age and power

Sorting:
Although the final result has no explicit ORDER BY, the ORDER BY inside the CTE has no effect on the final result unless reused.
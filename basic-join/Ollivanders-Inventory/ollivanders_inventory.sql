WITH sub_table AS 
    (SELECT w.id as id, wp.age as age, w.coins_needed as coins, w.power as power_wand,
    RANK() OVER(PARTITION BY wp.age, w.power ORDER BY w.coins_needed) as rank_power
    FROM Wands w
    JOIN Wands_Property wp ON w.code = wp.code
    WHERE wp.is_evil = 0
    ORDER BY w.power DESC, wp.age DESC)
SELECT id, age, coins, power_wand
FROM sub_table
WHERE rank_power = 1;
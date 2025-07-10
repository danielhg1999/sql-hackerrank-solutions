## Problem
Ketty gives Eve a task to generate a report 

## Output
Write a query that returns three columns: Name, Grade and Mark. 
You won't have to obtain names who received a grade lower than 8. 
Sort data in descending order by grade (higher grades are entered first). If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically.
Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

## Tables
Students: ID, Name, Marks
Grades: Grade, Min_Mark, Max_Mark

## How query works:
JOIN Logic:
Students are joined with grades using BETWEEN, which checks if a student's marks fall within the grade's min_mark and max_mark range.

SELECT Clause:
If the student's grade is 8 or above, their name is shown.
If the grade is less than 8, NULL is shown in the name column.
Regardless of grade, both grade and marks are shown for all students.

ORDER BY Clause:
Sorts by grade in descending order (higher grades first).
For grades 8 or above, students are ordered alphabetically by name.
For grades less than 8, students are ordered by marks in ascending order.
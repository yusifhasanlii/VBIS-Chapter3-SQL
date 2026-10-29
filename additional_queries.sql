-- Exercise 3.26
SELECT course_id, ID
FROM takes
GROUP BY course_id, ID
HAVING COUNT(*) >= 3
ORDER BY course_id;

-- Exercise 3.27
SELECT ID
FROM (
    SELECT ID, course_id
    FROM takes
    GROUP BY ID, course_id
    HAVING COUNT(*) >= 2
) AS retaken
GROUP BY ID
HAVING COUNT(DISTINCT course_id) >= 3;

-- Exercise 3.28
SELECT i.ID, i.name
FROM instructor i
WHERE NOT EXISTS (
    SELECT c.course_id
    FROM course c
    WHERE c.dept_name = i.dept_name
    EXCEPT
    SELECT t.course_id
    FROM teaches t
    WHERE t.ID = i.ID
)
ORDER BY i.name;

-- Exercise 3.31
SELECT i.ID, i.name
FROM instructor i
WHERE i.ID NOT IN (
    SELECT te.ID
    FROM teaches te
    JOIN takes ta ON te.course_id = ta.course_id
                 AND te.sec_id = ta.sec_id
                 AND te.semester = ta.semester
                 AND te.year = ta.year
    WHERE ta.grade = 'A'
);

-- Exercise 3.32
SELECT DISTINCT i.ID, i.name
FROM instructor i
JOIN teaches te ON i.ID = te.ID
JOIN takes ta ON te.course_id = ta.course_id
             AND te.sec_id = ta.sec_id
             AND te.semester = ta.semester
             AND te.year = ta.year
WHERE ta.grade IS NOT NULL
  AND i.ID NOT IN (
      SELECT te2.ID
      FROM teaches te2
      JOIN takes ta2 ON te2.course_id = ta2.course_id
                    AND te2.sec_id = ta2.sec_id
                    AND te2.semester = ta2.semester
                    AND te2.year = ta2.year
      WHERE ta2.grade = 'A'
  );

-- Exercise 3.33
SELECT DISTINCT c.course_id, c.title
FROM course c
JOIN section s ON c.course_id = s.course_id
JOIN time_slot ts ON s.time_slot_id = ts.time_slot_id
WHERE c.dept_name = 'Comp. Sci.' AND ts.end_hr >= 12;

-- Exercise 3.34
SELECT course_id, sec_id, year, semester, COUNT(ID) AS num
FROM takes
GROUP BY course_id, sec_id, year, semester;

-- Exercise 3.35
WITH sec_enrollment AS (
    SELECT course_id, sec_id, year, semester, COUNT(ID) AS num
    FROM takes
    GROUP BY course_id, sec_id, year, semester
)
SELECT course_id, sec_id, year, semester, num
FROM sec_enrollment
WHERE num = (SELECT MAX(num) FROM sec_enrollment);
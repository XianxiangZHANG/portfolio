// Q2
MATCH (n:Highschooler)
WITH n.major AS Major, AVG(n.grade) AS AverageGrade
WHERE AverageGrade >= 10
RETURN Major, AverageGrade
ORDER BY AverageGrade DESC

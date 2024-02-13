// Highschooler
LOAD CSV WITH HEADERS FROM "fIle:///Highschooler.csv" AS row
CREATE (n:Highschooler)
SET n=row, 
n.ID = toInteger (row.ID), 
n.grade = toInteger (row.grade),
n.minor = CASE row.minor WHEN "NULL" THEN null ELSE row.minor END
RETURN n
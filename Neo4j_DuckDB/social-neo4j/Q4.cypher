// Q4
MATCH (n:Highschooler)<-[:LIKES]-(m:Highschooler)
WITH n, COUNT(m) AS likesCount
WHERE likesCount > 1
RETURN n.name, n.major

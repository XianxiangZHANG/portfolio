// Q6
MATCH (n1:Highschooler), (n2:Highschooler)
WHERE n1.name = n2.name AND n1.ID < n2.ID
MATCH path = shortestPath((n1)-[:IS_FRIEND_OF*]-(n2))
RETURN n1.name, n1.ID AS ID1, n2.ID AS ID2, LENGTH(path) AS Degree

// Q3
MATCH (a:Highschooler)-[:LIKES]->(b:Highschooler)
WHERE NOT (a)-[:IS_FRIEND_OF]-(b) 
MATCH (a)-[:IS_FRIEND_OF]-(c:Highschooler)-[:IS_FRIEND_OF]-(b)
RETURN a.name, a.grade, b.name, b.grade, c.name, c.grade
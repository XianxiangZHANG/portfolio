// Q9
MATCH (a:Highschooler)-[:IS_FRIEND_OF]-(b:Highschooler)-[:IS_FRIEND_OF]-(c:Highschooler)
WHERE NOT (a)-[:IS_FRIEND_OF]-(c) AND a <> c
MERGE (a)-[:IS_FRIEND_OF]->(c)

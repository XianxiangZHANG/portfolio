//Q8
MATCH (a:Highschooler)-[r:LIKES]->(b:Highschooler)
WHERE NOT (b)-[:LIKES]->(a) AND ((a)-[:IS_FRIEND_OF]->(b) OR (b)-[:IS_FRIEND_OF]->(a))
DETACH DELETE r

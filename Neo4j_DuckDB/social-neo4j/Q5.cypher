// Q5
MATCH (n:Highschooler {minor: 'CS'})-[:IS_FRIEND_OF*2]-(m:Highschooler {grade: 12})
WHERE NOT (n)-[:IS_FRIEND_OF]->(m)
RETURN n.name, COUNT(DISTINCT m) AS FriendsOfFriendsCount

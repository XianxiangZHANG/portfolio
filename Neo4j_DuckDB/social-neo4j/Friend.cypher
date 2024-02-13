// Friend
LOAD CSV WITH HEADERS FROM "file:///Friend.csv" AS row
MATCH (f1:Highschooler {ID: toInteger (row.ID1)}) 
MATCH (f2:Highschooler {ID: toInteger (row.ID2)}) 
WHERE toInteger(row. ID1) < toInteger(row.ID2) 
MERGE (f1)-[:IS_FRIEND_OF]-> (f2)
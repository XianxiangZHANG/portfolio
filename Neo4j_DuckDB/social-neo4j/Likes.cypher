// Likes
LOAD CSV WITH HEADERS FROM "file:///Likes.csv" AS row
MATCH (h1:Highschooler {ID: toInteger (row.ID1) })
MATCH (h2:Highschooler {ID: toInteger (row. ID2)})
MERGE (h1)-[:LIKES {since:date(row.since)} ]-> (h2)
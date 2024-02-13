/* Delete the tables if they already exist */
drop table if exists Highschooler;
drop table if exists Friend;
drop table if exists Likes;

/* Create the schema for our tables */
create table Highschooler(ID int, name text, grade int, major text, minor text);
create table Friend(ID1 int, ID2 int);
create table Likes(ID1 int, ID2 int, since date);

/* Populate the tables with our data */
insert into Highschooler values (1510, 'Jordan', 8, 'CS', 'Maths');
insert into Highschooler values (1689, 'Gabriel', 8, 'CS', NULL);
insert into Highschooler values (1381, 'Tiffany', 9, 'Physics', 'Maths');
insert into Highschooler values (1709, 'Cassandra', 9, 'Art', NULL);
insert into Highschooler values (1101, 'Haley', 10, 'Biology', 'Chemistry');
insert into Highschooler values (1782, 'Andrew', 10, 'Music', 'Maths');
insert into Highschooler values (1468, 'Kris', 10, 'Art', 'Music');
insert into Highschooler values (1641, 'Brittany', 10, 'Biology', 'CS');
insert into Highschooler values (1247, 'Alexis', 11, 'Biology', NULL);
insert into Highschooler values (1316, 'Austin', 11, 'Art', 'CS');
insert into Highschooler values (1911, 'Gabriel', 11, 'Chemistry', 'Physics');
insert into Highschooler values (1501, 'Jessica', 11, 'Physics', NULL);
insert into Highschooler values (1304, 'Jordan', 12, 'Maths', NULL);
insert into Highschooler values (1025, 'John', 12, 'CS', 'Music');
insert into Highschooler values (1934, 'Kyle', 12, 'Art', 'Chemistry');
insert into Highschooler values (1661, 'Logan', 12, 'Physics', NULL);

insert into Friend values (1510, 1381);
insert into Friend values (1510, 1689);
insert into Friend values (1689, 1709);
insert into Friend values (1381, 1247);
insert into Friend values (1709, 1247);
insert into Friend values (1689, 1782);
insert into Friend values (1782, 1468);
insert into Friend values (1782, 1316);
insert into Friend values (1782, 1304);
insert into Friend values (1468, 1101);
insert into Friend values (1468, 1641);
insert into Friend values (1101, 1641);
insert into Friend values (1247, 1911);
insert into Friend values (1247, 1501);
insert into Friend values (1911, 1501);
insert into Friend values (1501, 1934);
insert into Friend values (1316, 1934);
insert into Friend values (1934, 1304);
insert into Friend values (1304, 1661);
insert into Friend values (1661, 1025);
insert into Friend select ID2, ID1 from Friend;

insert into Likes values(1689, 1709, '2023-09-02');
insert into Likes values(1709, 1689, '2023-09-03');
insert into Likes values(1782, 1709, '2023-09-03');
insert into Likes values(1911, 1247, '2023-09-12');
insert into Likes values(1247, 1468, '2023-09-11');
insert into Likes values(1641, 1468, '2023-09-15');
insert into Likes values(1316, 1304, '2023-09-02');
insert into Likes values(1501, 1934, '2023-09-09');
insert into Likes values(1934, 1501, '2023-09-11');
insert into Likes values(1025, 1101, '2023-09-13');

/* Count Functions */
Select COUNT(*) as NombreLikes from Likes;
Select COUNT(*) as NombreHighschooler from  Highschooler;
Select COUNT(*) as NombreFriend from Friend;

/*1. Find the ID's and the names of all students who are friends with someone named Jordan. Order the answer by student ID's.
*/
SELECT name, ID
FROM ( SELECT ID2
FROM (SELECT Jord.id,Jord.name
FROM (SELECT * FROM Highschooler WHERE name='Jordan') as
Jord) as Jord_Ami
INNER JOIN Friend ON Jord_Ami.ID = Friend.ID1
) as AMI_ID
INNER JOIN Highschooler ON AMI_ID.ID2 = Highschooler.ID
ORDER BY ID;

/*2. Rank majors by the average grade of students. Cut ranking below 10.
*/
SELECT major, AVG(grade) AS Moyenne
FROM Highschooler
GROUP BY major
HAVING AVG(grade) >= 10
ORDER BY Moyenne DESC;

/*3. For each student A who likes a student B where the two are not friends, find if they have a friend C in common (who can introduce them!). For all such trios, return the name and grade of A, B, and C. 
*/
SELECT DISTINCT A.name AS A_name, A.grade AS A_grade,
                B.name AS B_name, B.grade AS B_grade,
                C.name AS C_name, C.grade AS C_grade
FROM Highschooler A
JOIN Likes ON A.ID = Likes.ID1
JOIN Highschooler B ON B.ID = Likes.ID2
JOIN Friend AC ON A.ID = AC.ID1
JOIN Friend BC ON B.ID = BC.ID1
JOIN Highschooler C ON (AC.ID2 = C.ID AND BC.ID2 = C.ID)
LEFT JOIN Friend AB ON A.ID = AB.ID1 AND B.ID = AB.ID2
WHERE A.ID <> B.ID
  AND A.ID <> C.ID
  AND B.ID <> C.ID
  AND AB.ID1 IS NULL;
  
/*4. Find the name and major of all students who are liked by more than one other student.
 */ 
SELECT name, major
FROM (
SELECT ID2
FROM Likes L
GROUP BY L.ID2
HAVING count(*)>1
) AS RES_ID
JOIN Highschooler H ON H.ID = RES_ID.ID2;


/*5. For each student in CS minor, count the number of friends of friends having grade 12. Do not count in any of the first circle friends.
*/
SELECT h1.*, count(distinct h2.ID) as nb_twelve_graded_foaf
FROM Highschooler h1
         JOIN Friend f1 ON (h1.ID = f1.ID1 AND h1.minor = 'CS')
         JOIN Friend f2 ON f1.ID2 = f2.ID1 AND (h1.ID, f2.ID2) NOT IN Friend
         JOIN Highschooler h2 ON f2.ID2 = h2.ID
WHERE h2.grade = 12
GROUP BY h2.name;

/*6. Find the friendship degree (degree of separation) of each pair of students who both have the same name. For all such pair, return the name of students, their ID's and their friendship degree. Include each pair only once.
*/
WITH cte_friend(origin, start, goal, current_friend, degree, way)
AS (
/* état initial (de la récursivité) de la table cte table:
ensemble des induvidus ayant le meme nom que quelqu'un dans
le graphe */
SELECT H1.ID, H1.ID, H2.ID, F.ID2, 1, cast(H1.ID as varchar)
|| '/' || cast(F.ID2 as varchar)
FROM Highschooler H1
INNER JOIN Highschooler H2
on H1.name = H2.name
INNER JOIN Friend F
on H1.ID = F.ID1
WHERE H1.ID != H2.ID
AND H1.ID < H2.ID
union all
SELECT cte_friend.origin ,F1.ID1, cte_friend.goal, F1.ID2,
degree + 1, cte_friend.way || cast(F1.ID2 as varchar) || '/'
FROM cte_friend
INNER JOIN Friend F1
on cte_friend.current_friend = F1.ID1
/** Avoid to have loop like 1->2->3->1->2 ...*/
WHERE cte_friend.way NOT LIKE '%' || cast( F1.ID2 as varchar)
|| '%'
)
SELECT origin, H1.name, goal, H2.name, min(degree) as degree
FROM cte_friend
INNER JOIN Highschooler H1
on cte_friend.origin = H1.ID
INNER JOIN Highschooler H2
on cte_friend.goal = H2.ID
WHERE current_friend = goal
GROUP BY goal, current_friend;




/*7. It's time for the seniors to graduate. Remove all 12th graders from Highschooler. 
delete FROM Highschooler WHERE grade >= 12;
*/
DELETE
FROM Highschooler
WHERE grade = 12;
SELECT *
FROM Highschooler;

/*8. If two students A and B are friends, and A likes B but not vice-versa, remove the Likes tuple. 
*/
DELETE FROM Likes
WHERE (ID1, ID2) IN (
    SELECT L.ID1, L.ID2
    FROM Likes L
    JOIN Friend F ON L.ID1 = F.ID1 AND L.ID2 = F.ID2
    WHERE NOT EXISTS (
        SELECT 1
        FROM Likes L2
        WHERE L2.ID1 = F.ID2 AND L2.ID2 = F.ID1
    )
    UNION
    SELECT L.ID1, L.ID2
    FROM Likes L
    JOIN Friend F ON L.ID1 = F.ID2 AND L.ID2 = F.ID1
    WHERE NOT EXISTS (
        SELECT 1
        FROM Likes L2
        WHERE L2.ID1 = F.ID1 AND L2.ID2 = F.ID2
    )
);

SELECT H1.name AS Name1, H2.name AS Name2, L.since
FROM Likes L
JOIN Highschooler H1 ON L.ID1 = H1.ID
JOIN Highschooler H2 ON L.ID2 = H2.ID;


/*9. For all cases where A is friends with B, and B is friends with C, add a new friendship for the pair A and C. Do not add duplicate friendships, friendships that already exist, or friendships with oneself.
*/

INSERT INTO Friend (ID1, ID2)
SELECT DISTINCT F1.ID1, F2.ID2
FROM Friend F1
JOIN Friend F2 ON F1.ID2 = F2.ID1
JOIN Highschooler H1 ON F1.ID1 = H1.ID
JOIN Highschooler H2 ON F1.ID2 = H2.ID
JOIN Highschooler H3 ON F2.ID2 = H3.ID
WHERE F1.ID1 <> F2.ID2
AND NOT EXISTS (
    SELECT 1
    FROM Friend F3
    WHERE (F3.ID1 = F1.ID1 AND F3.ID2 = F2.ID2)
       OR (F3.ID1 = F2.ID2 AND F3.ID2 = F1.ID1)
);



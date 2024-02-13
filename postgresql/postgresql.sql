select r.name from railways as r ,quartiers as q
where r.fclass='tram'
and q.nom='Ile de Nantes'
and ST_CROSSES(r.geom,q.geom);


select r.name from railways as r ,quartiers as q
where r.fclass='tram'
and q.nom='Ile de Nantes'
and ST_intersects(r.geom,q.geom);


select r.name from railways as r ,quartiers as q
where r.fclass='tram'
and q.nom='Ile de Nantes'
and ST_overlaps(r.geom,q.geom);







select st_relate(b1.geom, b2.geom)
from buildings as b1, buildings as b2
where b1.name = 'Château des Ducs de Bretagne' and b2.name = 'Tour des Espagnols';


select r.name, st_AsText(st_intersection(q.geom,r.geom))
from roads as r, quartiers as q
where q.nom = 'Centre Ville'
and st_intersection(q.geom, r.geom);


select DISTINCT GeometryType(st_intersection(q.geom,r.geom))
from roads as r, quartiers as q
where q.nom = 'Centre Ville'
and st_intersection(q.geom, r.geom)


--5--

select sum(st_length(st_transform(geom,2154)))
from roads
where fclass = 'cycleway';

select sum(st_length(geom))
from roads
where fclass = 'cycleway';

select sum(st_length(geom::geography))
from roads
where fclass = 'cycleway';

select name, st_area(st_transform(geom,2154))
from buildings
where fclass = 'university';

select a.gid, a.name, b.gid, b.name
from waterways a, buildings b
where st_distance(st_transform(a.geom,2154),st_transform(b.geom,2154),10);



select q.nom as nom, q.geom as geom, p.grid as pgid
from quartiers as q, pois as p
where st_contaains(q.geom, p.geom);


select t.nom, count(t.pgid)/(st_area(st_transform(t.geom,2154))/1000^2) as density
from(select q.nom as nom, q.geom as geom, p.grid as pgid
	from quartiers as q, pois as p
	where st_contaains(q.geom, p.geom))
t group by t.nom, t.geom order by density desc;
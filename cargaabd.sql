use pro3;
EXEC sp_configure 'Show Advanced Options', 1
RECONFIGURE
GO
 
EXEC sp_configure 'Ad Hoc Distributed Queries', 1
RECONFIGURE
GO
EXEC sp_MSSet_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1
GO
 
EXEC sp_MSSet_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1
GO
 

 GO
 

SELECT *
INTO #TEMPORAL0
FROM   OPENROWSET('Microsoft.ACE.OLEDB.12.0',
       'Excel 12.0 Xml;HDR=YES;Database=C:\ICE-Fuente.xls',
       'SELECT * FROM [Hoja1$]')




use pro3
---------------------------------
----------------------------------insertar en pais
insert into pais (nombre)
select distinct pais from #TEMPORAL0 order by pais

----------------------------------insertar raza
insert into genero (nombre)
select distinct sexo from #TEMPORAL0 order by sexo

----------------------------------insertar sexo
insert into raza (nombre)
select distinct raza from #TEMPORAL0 order by raza
--------------------------------
----------------------------------insertar region
insert into region (pais_id, nombre)
select distinct p.id ,t.region from  #TEMPORAL0 t, pais p
where t.pais = p.nombre
order by t.region;

-----------------------------------inserta dep
insert into departamento (nombre, region_id)
select distinct t.depto, r.id from #TEMPORAL0 t, region r, pais p
where t.region = r.nombre 
and t.pais = p.nombre 
and r.pais_id = p.id
order by t.depto;
--------------------------------------insert muni
insert into municipio (departamento_id, nombre)
select distinct d.id,	t.municipio
from #TEMPORAL0 t, departamento d,region r, pais p
where t.pais = p.nombre
and t.region = r.nombre
and t.depto = d.nombre
and r.pais_id = p.id
and d.region_id = r.id
order by t.municipio;
--------------------------------------------insert partidos
insert into partido (partido, nombre_partido)
select distinct partido, nombre_partido from #TEMPORAL0 
order by partido
-----------------------------------------------insert eleccion


insert into eleccion (nombre_eleccion)
select distinct nombre_eleccion from #TEMPORAL0
order by nombre_eleccion


---------------------------------------------
insert tipovotante (tipo) values('universitario')
insert tipovotante (tipo) values('medio')
insert tipovotante (tipo) values('primaria')
insert tipovotante (tipo) values('analfa')
insert tipovotante (tipo) values('alfa')
------------------------------------------------





insert into voto( cantidad, ano, eleccion_id, partido_id, genero_id, raza_id, tipovotante_id, municipio_id)
select te.UNIVERSITARIOS as cantidad, te.año_eleccion as año, el.id as eleccion, part.id as partido, ge.id as sex, 
ra.id as raza, tipov.id as tipovo, mun.id as municipio
from #TEMPORAL0 te, tipovotante tipov, pais pai, raza ra, genero ge, region r, departamento dep, municipio mun, partido part,
eleccion el
	WHERE tipov.id = 1
	and te.municipio = mun.nombre
	and	te.pais = pai.nombre
	and	te.raza = ra.nombre
	and te.sexo = ge.nombre
	and te.region = r.nombre
	and te.depto = dep.nombre
	and te.partido = part.partido
	and te.nombre_eleccion = el.nombre_eleccion
	and pai.id = r.pais_id
	and r.id = dep.region_id
	and dep.id = mun.departamento_id
	
	------------------
insert into voto( cantidad, ano, eleccion_id, partido_id, genero_id, raza_id, tipovotante_id, municipio_id)
select te.[nivel medio] as cantidad, te.año_eleccion as año, el.id as eleccion, part.id as partido, ge.id as sex, 
ra.id as raza, tipov.id as tipovo, mun.id as municipio
from #TEMPORAL0 te, tipovotante tipov, pais pai, raza ra, genero ge, region r, departamento dep, municipio mun, partido part,
eleccion el
	WHERE tipov.id = 2
	and te.municipio = mun.nombre
	and	te.pais = pai.nombre
	and	te.raza = ra.nombre
	and te.sexo = ge.nombre
	and te.region = r.nombre
	and te.depto = dep.nombre
	and te.partido = part.partido
	and te.nombre_eleccion = el.nombre_eleccion
	and pai.id = r.pais_id
	and r.id = dep.region_id
	and dep.id = mun.departamento_id
	
------------------------------------------------------------------
insert into voto( cantidad, ano, eleccion_id, partido_id, genero_id, raza_id, tipovotante_id, municipio_id)
select te.primaria as cantidad, te.año_eleccion as año, el.id as eleccion, part.id as partido, ge.id as sex, 
ra.id as raza, tipov.id as tipovo, mun.id as municipio
from #TEMPORAL0 te, tipovotante tipov, pais pai, raza ra, genero ge, region r, departamento dep, municipio mun, partido part,
eleccion el
	WHERE tipov.id = 3
	and te.municipio = mun.nombre
	and	te.pais = pai.nombre
	and	te.raza = ra.nombre
	and te.sexo = ge.nombre
	and te.region = r.nombre
	and te.depto = dep.nombre
	and te.partido = part.partido
	and te.nombre_eleccion = el.nombre_eleccion
	and pai.id = r.pais_id
	and r.id = dep.region_id
	and dep.id = mun.departamento_id
	
------------------------------------------------
insert into voto( cantidad, ano, eleccion_id, partido_id, genero_id, raza_id, tipovotante_id, municipio_id)
select te.analfabetos as cantidad, te.año_eleccion as año, el.id as eleccion, part.id as partido, ge.id as sex, 
ra.id as raza, tipov.id as tipovo, mun.id as municipio
from #TEMPORAL0 te, tipovotante tipov, pais pai, raza ra, genero ge, region r, departamento dep, municipio mun, partido part,
eleccion el
	WHERE tipov.id = 4
	and te.municipio = mun.nombre
	and	te.pais = pai.nombre
	and	te.raza = ra.nombre
	and te.sexo = ge.nombre
	and te.region = r.nombre
	and te.depto = dep.nombre
	and te.partido = part.partido
	and te.nombre_eleccion = el.nombre_eleccion
	and pai.id = r.pais_id
	and r.id = dep.region_id
	and dep.id = mun.departamento_id
	
	-------------------------------
insert into voto( cantidad, ano, eleccion_id, partido_id, genero_id, raza_id, tipovotante_id, municipio_id)
select te.alfabetos as cantidad, te.año_eleccion as año, el.id as eleccion, part.id as partido, ge.id as sex, 
ra.id as raza, tipov.id as tipovo, mun.id as municipio
from #TEMPORAL0 te, tipovotante tipov, pais pai, raza ra, genero ge, region r, departamento dep, municipio mun, partido part,
eleccion el
	WHERE tipov.id = 5
	and te.municipio = mun.nombre
	and	te.pais = pai.nombre
	and	te.raza = ra.nombre
	and te.sexo = ge.nombre
	and te.region = r.nombre
	and te.depto = dep.nombre
	and te.partido = part.partido
	and te.nombre_eleccion = el.nombre_eleccion
	and pai.id = r.pais_id
	and r.id = dep.region_id
	and dep.id = mun.departamento_id
	
	


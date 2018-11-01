SELECT 
	a.tablespace_name, 
	round(a.bytes_alloc / 1024 / 1024, 2) megs_alloc, 
	round(nvl(b.bytes_free, 0) / 1024 / 1024, 2) megs_free, 
	round((a.bytes_alloc - nvl(b.bytes_free, 0)) / 1024 / 1024, 2) megs_used, 
	round((nvl(b.bytes_free, 0) / a.bytes_alloc) * 100,2) Pct_Free, 
	100 - round((nvl(b.bytes_free, 0) / a.bytes_alloc) * 100,2) Pct_used, 
	a.autoext 
FROM 
	( 
	select  f.tablespace_name, 
	sum(f.bytes) bytes_alloc, 
	max(f.autoextensible) autoext 
	from dba_data_files f 
	group by tablespace_name 
	) a, 
	( 
	select  f.tablespace_name, 
	sum(f.bytes)  bytes_free 
	from dba_free_space f 
	group by tablespace_name 
	) b 
WHERE a.tablespace_name = b.tablespace_name (+) 
UNION ALL 
SELECT 
	h.tablespace_name, 
	round(sum(h.bytes_free + h.bytes_used) / 1048576, 2) megs_alloc, 
	round(sum((h.bytes_free + h.bytes_used) - nvl(p.bytes_used, 0)) / 1048576, 2) megs_free, 
	round(sum(nvl(p.bytes_used, 0))/ 1048576, 2) megs_used, 
	round((sum((h.bytes_free + h.bytes_used) - nvl(p.bytes_used, 0)) / sum(h.bytes_used + h.bytes_free)) * 100,2) Pct_Free, 
	100 - round((sum((h.bytes_free + h.bytes_used) - nvl(p.bytes_used, 0)) / sum(h.bytes_used + h.bytes_free)) * 100,2) pct_used, 
	max(f.autoextensible) autoext 
FROM 
	sys.v_$TEMP_SPACE_HEADER h, sys.v_$Temp_extent_pool p, dba_temp_files f 
WHERE 
	p.file_id(+) = h.file_id 
AND 
	p.tablespace_name(+) = h.tablespace_name 
AND 
	f.file_id = h.file_id 
AND 
	f.tablespace_name = h.tablespace_name 
GROUP BY 
	h.tablespace_name, f.maxbytes 
ORDER BY 1
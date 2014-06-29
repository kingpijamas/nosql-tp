{
	"region" : "the Americas",
	"size" : 123,
	"type" : ".*Some.*"
}
()
MATCH
	(r:Region { r_name: {region}}) -[:REGIONKEY]->
	(n:Nation) -[:NATIONKEY]->
	(s:Supplier) -[:SUPPKEY]->
	(ps:Partsupp) <-[:PARTKEY]-
	(p:Part { p_size: {size}})

WHERE
	p.p_type =~ {type}

WITH 
	ps, min(ps.ps_supplycost)

RETURN
	supplier.s_acctbal,
	supplier.s_name,
	nation.n_name,
	part.p_partkey,
	part.p_mfgr,
	supplier.s_address,
	supplier.s_phone,
	supplier.s_comment

ORDER BY
	supplier.s_acctbal DESC,
	nation.n_name,
	supplier.s_name,
	part.p_partkey
;
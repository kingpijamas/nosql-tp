()
MATCH 
	(r:Region { r_name: "{region}"}) -[:REGIONKEY]->
	(nation) -[:NATIONKEY]->
	(supplier) -[:SUPPKEY]->
	(partsupp) <-[:PARTKEY]-
	(part { p_size: {size}, p_type=~'.*"+{type}+".*'})

WITH 
	partsupp, min(partsupp.ps_supplycost)

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
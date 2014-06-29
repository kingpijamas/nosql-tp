{
	"region" : "the Americas",
	"size" : 123,
	"type" : ".*Some.*"
}
()
MATCH
	(r:Region { r_name: {region} }) <-[:REGIONKEY]-
	(n:Nation) <-[:NATIONKEY]-
	(s:Supplier) <-[ps:PARTSUPP]-
	(p:Part { p_size: {size} })
WITH 
	ps, min(ps.ps_supplycost) AS min_supp_cost, s, n, p
WHERE
	p.p_type =~ {type} AND
	ps.ps_supplycost = min_supp_cost
RETURN
	s.s_acctbal,
	s.s_name,
	n.n_name,
	p.p_partkey,
	p.p_mfgr,
	s.s_address,
	s.s_phone,
	s.s_comment
ORDER BY
	s.s_acctbal DESC,
	n.n_name,
	s.s_name,
	p.p_partkey
;
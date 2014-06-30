{}
()
MATCH (s:Supplier)
CREATE (p:Part
{
	p_name: "Some part",
	p_mfgr: "Some mfgr",
	p_brand: "Some brand",
	p_type: "Some type",
	p_size: 123,
	p_container: "Some container",
	p_retailprice: 524.09,
	p_comment: "Some comment"
})
CREATE (p)-[:PARTSUPP {
	ps_availqty: 15,
	ps_supplycost: 400.27,
	ps_comment: "Some comment"
}]->(s)
;
{}
()
MATCH 
	(o:Orders),
	(p:Part)-[:PARTSUPP]->
	(s:Supplier)
CREATE (l:LineItem
{ 
	l_linenumber: 1,
	l_quantity: 100,
	l_extendedprice: 50.25,
	l_discount: 0.1,
	l_tax: 0.35,
	l_returnflag: "A", 
	l_linestatus: "B",
	l_shipdate: 1403199078825,
	l_commitdate: 123456,
	l_receiptdate: 7891011,
	l_shipinstruct: "This side up",
	l_shipmode: "cargo",
	l_shipcomment: "I'm on a boat!"
})
CREATE UNIQUE (l)-[:ORDERKEY]->(o)
CREATE UNIQUE (l)-[:PARTKEY]->(p)
CREATE UNIQUE (l)-[:SUPPKEY]->(s)
;
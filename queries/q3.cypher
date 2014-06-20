()
MATCH 
	(c:Customer { c_mktsegment: "{segment}"})-[:CUSTKEY]->
	(order { o_orderdate < {date1} })-[:ORDERKEY]->
	(lineitem { l_shipdate > {date2} })

RETURN
	lineitem.l_orderkey,
	sum(lineitem.l_extendedprice*(1-lineitem.l_discount)) AS revenue,
	order.o_orderdate,
	order.o_shippriority

ORDER BY
	revenue DESC
	order.o_orderdate
;
{
	"segment" : "Everybody",
	"date1" : 1503199078825,
	"date2" : 1203199078825
}
()
MATCH 
	(c:Customer { c_mktsegment: {segment}}) <-[:CUSTKEY]-
	(o:Orders) <-[:ORDERKEY]-
	(l:LineItem)
WHERE
	o.o_orderdate < {date1} AND
	l.l_shipdate > {date2}
RETURN
	l.l_orderkey,
	sum(l.l_extendedprice*(1-l.l_discount)) AS revenue,
	o.o_orderdate,
	o.o_shippriority

ORDER BY
	revenue DESC,
	o.o_orderdate
;
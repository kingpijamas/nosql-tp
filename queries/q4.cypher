{
	"region": "the Americas",
	"date": 1403199058001
}
()
MATCH 
	(r:Region { r_name : {region} }) <-[:REGIONKEY]-
	(n:Nation) <-[:NATIONKEY]-
	(s:Supplier),

	n <-[:NATIONKEY]-
	(c:Customer) <-[:CUSTKEY]-
	(o:Orders) <-[:ORDERKEY]-
	(l:LineItem)
WHERE
	o.o_orderdate >= {date} AND
	o.o_orderdate < {date} + 31556926000
RETURN
	n.n_name, sum(l.l_extendedprice * (1-l.l_discount)) AS revenue
ORDER BY
	revenue DESC
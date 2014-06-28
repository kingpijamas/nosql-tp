()
MATCH (c:Customer)
CREATE (o:Orders
{
	o_orderstatus: "Approved",
	o_totalprice: 200,
	o_orderdate: 1403199078000,
	o_orderpriority: 1,
	o_clerk: "John Doe",
	o_shippriority: 1,
	o_comment: "Some comment"
})
CREATE UNIQUE (o)-[:CUSTKEY]->(c)
;
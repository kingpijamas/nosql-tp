()
MATCH (n:Nation)
CREATE (c:Customer
{
	c_name: "Coca cola",
	c_address: "Evergreen Av. 123",
	c_phone: "011-4555-5555",
	c_acctbal: 12345,
	c_mktsegment: "Everybody",
	c_comment: "Some comment"
})
CREATE UNIQUE (c)-[:NATIONKEY]->(n)
;
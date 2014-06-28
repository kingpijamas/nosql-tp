()
MATCH (n:Nation)
CREATE (s:Supplier
{
	s_name: "Some supplier",
	s_address: "Evergreen Av. 4567",
	s_phone: "011-4444-4444",
	s_acctbal: 4567,
	s_comment: "Some comment"
})
CREATE UNIQUE (s)-[:NATIONKEY]->(n)
;
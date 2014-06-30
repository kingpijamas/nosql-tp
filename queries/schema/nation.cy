{}
()
MATCH (r:Region)
CREATE (n:Nation
{ 
	n_name: "Argentina",
	n_comment: "Some comment"
})
CREATE UNIQUE (n)-[:REGIONKEY]->(r)
;
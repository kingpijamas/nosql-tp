()
MATCH (n), (m) OPTIONAL MATCH (n)-[r1]-(), (m)-[r2]-() 
DELETE n,r1,m,r2
;
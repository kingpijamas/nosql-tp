nosql-tp
========

TPC-H with Neo4j using Cypher


To run queries:
	python queries.py path_to_query1 query1_times path_to_query2 query2_times...


To build the test schema (the order is important):
	
	python queries.py queries/schema/region.cypher 1 queries/schema/nation.cypher 1 queries/schema/supplier.cypher 1 queries/schema/customer.cypher 1 queries/schema/orders.cypher 25 queries/schema/part.cypher 20 queries/schema/lineitem.cypher 1


To create indexes:
	python queries.py queries/schema/indexes/ 1



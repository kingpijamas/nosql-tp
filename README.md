nosql-tp
========

TPC-H with Neo4j using Cypher


To run queries:
	python queries.py path_to_query1 query1_times path_to_query2 query2_times...


To build the test schema (the order is important):	
	python queries.py queries/schema/region.cy 1 queries/schema/nation.cy 1 queries/schema/supplier.cy 1 queries/schema/customer.cy 1 queries/schema/orders.cy 25 queries/schema/part.cy 20 queries/schema/lineitem.cy 1


To create indexes:
	python queries.py queries/schema/indexes/ 1
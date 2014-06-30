nosql-tp
========

TPC-H with Neo4j using Cypher


To build the test schema (The order is important):
python queries.py queries/schema/region.cypher 1 queries/schema/nation.cypher 1 queries/schema/supplier.cypher 1 queries/schema/customer.cypher 1 queries/schema/orders.cypher 25 queries/schema/part.cypher 20 queries/schema/lineitem.cypher 1

To run indexes:
python queries.py queries/schema/indexes/ 1

To run queries:
python queries.py path_to_query1 N1 path_to_query2 N2...




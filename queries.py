from neo4jrestclient.client import GraphDatabase, Node
from datetime import datetime
import os
import re

# where Cypher queries are stored
QUERY_DIR = 'queries'
# the database
GDB = GraphDatabase("http://localhost:7474/db/data/")

def parse(file):
	matches = re.match('(?P<returns>\(.*\))\s+(?P<q>.*)', file.read())
	q = matches.group('q')
	returns = matches.group('returns')
	return (q, eval(returns))

def run_query(q, returns):
	before = datetime.now()
	results = GDB.query(q=q, returns=returns)
	delta = datetime.now() - before
	return (delta, results[0])

def main():
	for filename in os.listdir(QUERY_DIR):
		with open(os.path.join(QUERY_DIR, filename), 'r') as file:
			print("Query:\n\t{filename}".format(filename=filename))
			q, returns = parse(file)
			result = run_query(q, returns)
			print("\nResult:\n\t{result}".format(result=result[1]))
			print("\nQuery took: {delta}".format(delta=result[0]))

if __name__ == '__main__':
	main()

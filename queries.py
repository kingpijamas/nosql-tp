from neo4jrestclient.client import GraphDatabase, Node
import timeit
import os
import re

# where Cypher queries are stored
QUERY_DIR = 'queries'
QUERY_RUN_TIMES = 1

# the database
GDB = GraphDatabase("http://localhost:7474/db/data/")

# auxiliary variables for parsing
q = returns = None
# query results go here
results = None

def parse(file):
	global q, returns
	matches = re.match('(?P<returns>\(.*\))\s+(?P<q>(\s*.*\s*)*)', file.read())
	q = matches.group('q')
	returns = eval(matches.group('returns'))

def run_query():
	global q, returns, results
	
	results = GDB.query(q=q, returns=returns)

def run_query_times(times):
	global results
	
	total_time = timeit.Timer('run_query()', setup="from __main__ import run_query").timeit(times)

	if len(results) == 0:
		results = None
	else:
		results = results[0]

	return (total_time, total_time/times, results)

def main():
	for filename in sorted(os.listdir(QUERY_DIR)):
		with open(os.path.join(QUERY_DIR, filename), 'r') as file:
			print("Query:\n\t{filename}".format(filename=filename))
			
			parse(file)
			result = run_query_times(QUERY_RUN_TIMES)
			
			print("\nResult:\n\t{result}".format(result=result[2]))
			print("\nStats:")
			print("\tRuns: {runs}".format(runs=QUERY_RUN_TIMES))
			print("\tTotal time: {total_time} seconds".format(total_time=result[0]))
			print("\tMean query time: {avg_time} seconds\n\n".format(avg_time=result[1]))

if __name__ == '__main__':
	main()

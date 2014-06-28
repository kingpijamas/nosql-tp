from neo4jrestclient.client import GraphDatabase, Node
import timeit
import os
import re
import sys

# the database
GDB = GraphDatabase("http://localhost:7474/db/data/")

# auxiliary variables for parsing
q = params = returns = None
# query results go here
results = None

def parse(file):
	global q, returns
	matches = re.match('(?P<returns>\(.*\))\s+(?P<q>(\s*.*\s*)*)', file.read())
	q = matches.group('q')
	returns = eval(matches.group('returns'))

def run_query():
	global q, params, returns, results
	
	results = GDB.query(q=q, params=params, returns=returns)

def run_query_times(times):
	global results
	
	total_time = timeit.Timer('run_query()', setup="from __main__ import run_query").timeit(times)

	if len(results) == 0:
		results = None
	else:
		results = results[0]

	return (total_time, total_time/times, results)

def main():
	params = sys.argv[1:]

	queries = list()
	for param, times_str in zip(params[::2], params[1::2]):
		times = int(times_str, 10)
		
		if os.path.isfile(param):
			queries.append((param, times))
		else:
			dir = param
			for filename in sorted(os.listdir(dir)):
				queries.append((os.path.join(dir, filename), times))

	for filename, times in queries:
		with open(filename, 'r') as query_file:
			print("Query:\n\t{filename}".format(filename=filename))
			
			parse(query_file)
			result = run_query_times(times)
			
			print("\nResult:\n\t{result}".format(result=result[2]))
			print("\nStats:")
			print("\tRuns: {runs}".format(runs=times))
			print("\tTotal time: {total_time} seconds".format(total_time=result[0]))
			print("\tMean query time: {avg_time} seconds\n\n".format(avg_time=result[1]))

if __name__ == '__main__':
	main()

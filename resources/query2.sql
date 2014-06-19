SELECT 
	s_acctbal,
	s_name,
	n_name,
	p_partkey,
	p_mfgr,
	s_address,
	s_phone,
	s_comment

FROM
	part,
	supplier,
	partsupp,
	nation,
	region

WHERE 
	p_partkey = ps_partkey AND
	s_suppkey = ps_suppkey AND
	p_size = [SIZE] AND
	p_type like '%[TYPE]' AND
	s_nationkey = n_nationkey AND
	n_regionkey = r_regionkey AND
	r_name = '[REGION]' AND
	ps_supplycost = (
		SELECT
			min(ps_supplycost)

		FROM 
			partsupp,
			supplier,
			nation,
			region

		WHERE 
			p_partkey = ps_partkey AND
			s_suppkey = ps_suppkey AND
			s_nationkey = n_nationkey AND
			n_regionkey = r_regionkey AND
			r_name = '[REGION]'
		)

ORDER BY
	s_acctbal desc,
	n_name,
	s_name,
	p_partkey;
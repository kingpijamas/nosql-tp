()
MATCH
	(l:LineItem)
WHERE
	l.l_shipdate <= {date}
RETURN
	//hace group by en orden!
	l.l_returnflag, //primer coso por el que agrupa!
	l.l_linestatus, //segundo coso por el que agrupa!
	sum(l.l_quantity) AS sum_qty,
	sum(l.extendedprice) AS sum_base_price,
	sum(l.extendedprice)*(1-l_discount) AS sum_disc_price,
	sum(l.extendedprice)*(1-l_discount)*(1+l_tax) AS sum_charge,
	avg(l_quantity) AS avg_qty,
	avg(l_extendedprice) AS avg_price,
	avg(l_discount) AS avg_disc,
	count(*) AS count_order
ORDER BY
	l_returnflag,
	l_linestatus
;

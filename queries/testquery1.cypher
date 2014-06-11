(unicode)
CREATE (ee:Person { name: "Emil", from: "Sweden", klout: 99 })
CREATE (e1:Person { name: "A", from: "Norway", klout: 99 })
CREATE (e2:Person { name: "B", from: "Norway", klout: 99 })
CREATE (e3:Person { name: "C", from: "Norway", klout: 99 })
CREATE (e4:Person { name: "D", from: "Norway", klout: 99 })
CREATE (e5:Person { name: "E", from: "Norway", klout: 99 })
CREATE (e6:Person { name: "F", from: "Norway", klout: 99 })
RETURN ee.name
;